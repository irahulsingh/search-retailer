require 'rails_helper'

RSpec.describe Retailer, type: :model do
  before do
  	@retailer = Retailer.new
  end

  subject { @retailer }

  it { should respond_to :name }
  it { should respond_to :address }
  it { should respond_to :phone }
  it { should respond_to :lat }
  it { should respond_to :lng }

end
