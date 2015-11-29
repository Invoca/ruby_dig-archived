module RubyDig
  def dig(key, *rest)
    if value = (self[key] rescue nil)
      if rest.empty?
        value
      elsif value.is_a?(RubyDig)
        value.dig(*rest)
      end
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
