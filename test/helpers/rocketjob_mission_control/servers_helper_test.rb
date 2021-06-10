require_relative "../../test_helper"

module RocketjobMissionControl
  ServersHelper.include(RocketjobMissionControl::ApplicationHelper)

  class ServersHelperTest < ActionView::TestCase
    describe ServersHelper do
      describe "#server_card_class" do
        describe "when the server is running" do
          let(:server) do
            server = RocketJob::Server.new
            server.started
            server.build_heartbeat(updated_at: Time.now, workers: 0)
            server
          end

          it "returns the correct class" do
            assert_equal "callout-success", server_card_class(server)
          end
        end

        describe "when the server is a zombie" do
          let(:server) do
            server = RocketJob::Server.new
            server.started
            server.build_heartbeat(updated_at: 1.hour.ago, workers: 0)
            server
          end

          it "returns the correct class" do
            assert_equal "callout-zombie", server_card_class(server)
          end
        end
      end

      describe "#server_icon" do
        describe "when the server is running" do
          let(:server) do
            server = RocketJob::Server.new
            server.started
            server.build_heartbeat(updated_at: Time.now, workers: 0)
            server
          end

          it "returns the correct class" do
            assert_equal "fas fa-play running", server_icon(server)
          end
        end

        describe "when the server is a zombie" do
          let(:server) do
            server = RocketJob::Server.new
            server.started
            server.build_heartbeat(updated_at: 1.hour.ago, workers: 0)
            server
          end

          it "returns the correct class" do
            assert_equal "fas fa-hourglass zombie", server_icon(server)
          end
        end
      end
    end
  end
end
