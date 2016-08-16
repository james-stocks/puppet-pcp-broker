require 'spec_helper'

describe 'pcp_broker' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "pcp_broker class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to create_class('pcp_broker') }

          it { is_expected.to contain_class('pcp_broker::params') }
          it { is_expected.to contain_class('pcp_broker::clone').that_comes_before('Class[pcp_broker::config]') }
          it { is_expected.to contain_class('pcp_broker::config').that_comes_before('Class[pcp_broker::trapperkeeper]') }
          it { is_expected.to contain_class('pcp_broker::trapperkeeper') }

        end
      end
    end
  end
end
