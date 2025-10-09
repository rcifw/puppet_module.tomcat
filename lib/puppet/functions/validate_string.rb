# modules/tomcat/lib/puppet/functions/validate_string.rb
Puppet::Functions.create_function(:validate_string) do
  dispatch :validate_string do
    repeated_param 'Any', :args
  end

  def validate_string(*args)
    raise Puppet::ParseError, "validate_string(): wrong number of arguments (#{args.length}; must be > 0)" if args.empty?

    args.each do |arg|
      # allow nil for undef compatibility
      unless arg.is_a?(String) || arg.nil?
        raise Puppet::ParseError, "#{arg.inspect} is not a string. It looks to be a #{arg.class}"
      end
    end
    nil
  end
end
