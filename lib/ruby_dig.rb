require "ruby_dig/version"

module RubyDig
  def dig(key, *other_keys)
    if value = self[key] rescue nil
      if other_keys.any?
        other_key, *rest = other_keys
        value.dig(other_key, *rest) if value.is_a?(RubyDig)
      else
        value
      end
    end
  end
end

_ = Array
class Array
  include RubyDig
end

_ = Hash
class Hash
  include RubyDig
end
