module RubyDig
  def dig(key, *other_keys)
    if value = self[key] rescue nil
      if other_keys.empty?
        value
      elsif value.is_a?(RubyDig)
        other_key, *rest = other_keys
        value.dig(other_key, *rest)
      end
    end
  end
end

class Array
  include RubyDig
end

class Hash
  include RubyDig
end
