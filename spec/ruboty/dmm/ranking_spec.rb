describe Ruboty::DMM::Ranking do
  let(:instance) { described_class.new(command).call }

  describe '#call' do
    context 'with 24 argument' do
      subject { instance }

      let(:command) { '@ruboty dmm ranking 24' }

      it { is_expected.not_to be_empty }
    end

    context 'with not registered argument' do
      subject { -> { instance.size } }

      let(:command) { '@ruboty dmm ranking hoge' }

      it { is_expected.to raise_error(TypeError) }
    end
  end
end
