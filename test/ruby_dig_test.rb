$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), '../lib'))

require 'minitest'
require 'minitest/autorun'

require 'ruby_dig'

class RubyDigTest
  describe RubyDig do
    describe "Array" do
      it "digs an array by index" do
        assert_equal 'one', ['zero', 'one', 'two'].dig(1)
      end

      it "digs a nested array by index" do
        assert_equal 'twelve', ['zero', ['ten', 'eleven', 'twelve'], 'two'].dig(1, 2)
      end

      it "returns nil when nested array doesn't support dig" do
        assert_equal nil, ['zero', 'one', 'two'].dig(1, 2)
      end

      it "returns nil when dig not found" do
        assert_equal nil, ['zero', 'one', 'two'].dig(4)
      end

      it "returns nil when dig index not an integer" do
        assert_equal nil, ['zero', 'one', 'two'].dig(:four)
      end
    end

    describe "Hash" do
      it "digs a hash by key" do
        assert_equal 'Homer', {first: "Homer", last: "Simpson"}.dig(:first)
      end

      it "digs a nested hash by keys" do
        assert_equal 'Homer', {mom: {first: "Marge", last: "Bouvier"}, dad: {first: "Homer", last: "Simpson"}}.dig(:dad, :first)
      end

      it "returns nil when nested hash doesn't support dig" do
        assert_equal nil, {mom: {first: "Marge", last: "Bouvier"}, dad: "Homer Simpson"}.dig(:dad, :first)
      end

      it "returns nil when dig not found" do
        assert_equal nil, {first: "Homer", last: "Simpson"}.dig(:middle)
      end
    end

    describe "Nested Hash and Array" do
      it "navigates both" do
        assert_equal 'Lisa', {mom: {first: "Marge", last: "Bouvier"},
                              dad: {first: "Homer", last: "Simpson"},
                              kids: [{first: "Bart"}, {first: "Lisa"}]}.dig(:kids, 1, :first)
      end
    end
  end
end
