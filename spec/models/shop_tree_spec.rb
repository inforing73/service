require 'spec_helper'

describe ShopTree do

  before { @shop_tree = ShopTree.new(name: "Компьютеры") }

  subject { @shop_tree }

  it { should respond_to(:name) }
end
