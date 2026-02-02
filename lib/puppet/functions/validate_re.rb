# modules/tomcat/lib/puppet/functions/validate_re.rb
Puppet::Functions.create_function(:validate_re) do
  dispatch :validate_re do
    param 'String', :input
    param 'Variant[String, Array[String]]', :patterns
    optional_param 'String', :message
  end

  def validate_re(input, patterns, message = nil)
    msg = message || "validate_re(): #{input.inspect} does not match #{patterns.inspect}"

    regexes = [patterns].flatten.map { |re_str| Regexp.compile(re_str) }
    unless regexes.any? { |re| input =~ re }
      raise Puppet::ParseError, msg
    end
    nil
  end
end
