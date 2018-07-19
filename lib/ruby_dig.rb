module RubyDig
  def dig(key, *rest)
    value = begin
      self[key]
    rescue NameError, IndexError
      Struct === self ? nil : raise
    end

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

  class Struct
    include RubyDig
  end
end
