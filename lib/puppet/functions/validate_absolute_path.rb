# modules/tomcat/lib/puppet/functions/validate_absolute_path.rb
Puppet::Functions.create_function(:validate_absolute_path) do
  require 'puppet/util'

  dispatch :validate_absolute_path do
    repeated_param 'Any', :args
  end

  def validate_absolute_path(*args)
    raise Puppet::ParseError, "validate_absolute_path(): wrong number of arguments (#{args.length}; must be > 0)" if args.empty?

    args.each do |arg|
      candidates = arg.is_a?(Array) ? arg : [arg]
      candidates.each do |path|
        unless Puppet::Util.absolute_path?(path)
          raise Puppet::ParseError, "#{path.inspect} is not an absolute path."
        end
      end
    end
    nil
  end
end
