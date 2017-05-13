require 'spec_helper'

describe Ruboty::Handlers::RubotyDMM do
  let(:robot) { Ruboty::Robot.new }

  let(:channel) { '#bot_test' }

  let(:sender) { 'mikoto-sister' }

  let(:body) { %(ruboty dmm #{submedia} #{term}) }

  before { sleep 2 }

  describe '#messenger' do

    subject { -> { robot.receive(body: body, from: sender, to: channel) } }

    context 'with valid arguments' do
      let(:submedia) { 'cg' }
      let(:term) { '24' }

      it { is_expected.to output("24時間のランキングです。\n").to_stdout }
    end

    context 'with invalid submedia' do
      let(:submedia) { 'foobaz' }
      let(:term) { '24' }

      it { is_expected.to output("Failed by TypeError\n").to_stdout }
    end

    context 'with invalid term' do
      let(:submedia) { 'cg' }
      let(:term) { 'foobaz' }

      it { is_expected.to output("Failed by TypeError\n").to_stdout }
    end
  end
end
