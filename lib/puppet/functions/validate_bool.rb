Puppet::Functions.create_function(:validate_bool) do
  # Documentation string
  dispatch :validate_bool do
    repeated_param 'Any', :args
  end

  def validate_bool(*args)
    raise Puppet::ParseError, "validate_bool(): wrong number of arguments (#{args.length}; must be > 0)" if args.empty?

    args.each do |arg|
      unless arg == true || arg == false
        raise Puppet::ParseError, "#{arg.inspect} is not a boolean. It looks to be a #{arg.class}"
      end
    end
    # Return nothing (functions used for validation just need to raise on failure)
    nil
  end
end
