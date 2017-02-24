describe Ruboty::DMM::Ranking do
  let(:instance) { described_class.new(arguments).call }
  let(:submedia) { 'cg' }
  let(:arguments) { { submedia: submedia, term: term } }

  describe '#call' do
    context 'with 24 argument' do
      subject { instance }
      let(:term) { '24' }

      it { is_expected.not_to be_empty }
    end

    context 'with not registered argument' do
      subject { -> { instance.size } }

      let(:term) { 'hoge' }

      it { is_expected.to raise_error(TypeError) }
    end
  end
end
