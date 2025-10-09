# modules/tomcat/lib/puppet/functions/validate_array.rb
Puppet::Functions.create_function(:validate_array) do
  dispatch :validate_array do
    repeated_param 'Any', :args
  end

  def validate_array(*args)
    raise Puppet::ParseError, "validate_array(): wrong number of arguments (#{args.length}; must be > 0)" if args.empty?

    args.each do |arg|
      unless arg.is_a?(Array)
        raise Puppet::ParseError, "#{arg.inspect} is not an Array. It looks to be a #{arg.class}"
      end
    end
    nil
  end
end
