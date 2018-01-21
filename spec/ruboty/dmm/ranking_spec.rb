describe Ruboty::DMM::Ranking do
  let(:attachments) { described_class.new(arguments).books }

  let(:submedia) { 'cg' }
  let(:arguments) { { submedia: submedia, term: term } }

  describe '#books' do
    context 'with 24 argument' do
      subject { attachments }

      let(:term) { '24' }

      it { is_expected.not_to be_empty }
      it { is_expected.to all(include(:title, :title_link, :image_url, :color)) }
    end

    context 'with not registered argument' do
      subject { -> { attachments } }

      let(:term) { 'hoge' }

      it { is_expected.to raise_error(TypeError) }
    end
  end
end
