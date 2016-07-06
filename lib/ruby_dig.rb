module RubyDig
  def dig(key, *rest)
    value = self[key]
    if value.nil? || rest.empty?
      value
    elsif value.respond_to?(:dig)
      value.dig(*rest)
    else
      fail TypeError, "#{value.class} does not have #dig method"
    end
  end
end

if RUBY_VERSION < '2.3'
  class Array
    include RubyDig
  end

  class Hash
    include RubyDig
  end
end
