describe Ruboty::DMM::Ranking do
  let(:attachments) { described_class.new(arguments).arts }

  let(:arguments) { { submedia: submedia, term: term } }

  describe '#arts' do
    context 'with registered arguments' do
      subject { attachments }

      let(:term) { '24' }
      let(:submedia) { 'cg' }

      it { is_expected.not_to be_empty }
      it { is_expected.to all(include(:title, :title_link, :image_url, :tags, :color)) }
    end

    context 'with not registered term' do
      subject { -> { attachments } }

      let(:term) { 'foobaz' }
      let(:submedia) { 'cg' }

      it { is_expected.to raise_error(TypeError) }
    end

    context 'with not registered submedia' do
      subject { -> { attachments } }

      let(:term) { '24' }
      let(:submedia) { 'foobaz' }

      it { is_expected.to raise_error(TypeError) }
    end
  end
end
