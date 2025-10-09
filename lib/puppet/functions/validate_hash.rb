# modules/tomcat/lib/puppet/functions/validate_hash.rb
Puppet::Functions.create_function(:validate_hash) do
  dispatch :validate_hash do
    repeated_param 'Any', :args
  end

  def validate_hash(*args)
    raise Puppet::ParseError, "validate_hash(): wrong number of arguments (#{args.length}; must be > 0)" if args.empty?

    args.each do |arg|
      unless arg.is_a?(Hash)
        raise Puppet::ParseError, "#{arg.inspect} is not a Hash. It looks to be a #{arg.class}"
      end
    end
    nil
  end
end
