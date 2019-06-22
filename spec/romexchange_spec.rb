RSpec.describe Romexchange do
  it "has a version number" do
    expect(Romexchange::VERSION).not_to be nil
  end

  describe Romexchange::Client do
    let(:client) { Romexchange::Client.new }
    describe '#get' do
      it 'works' do
        expect(client.get 'shining stone').to eq(Romexchange::Item.new)
      end
    end

  end

  describe Romexchange::Weapon do
    describe '.all' do
      it 'works' do
        puts Romexchange::Weapon.all
        expect(Romexchange::Weapon.all).to be
      end
    end
  end
end
