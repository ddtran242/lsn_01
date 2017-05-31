class Admin::DashboardsController < Admin::AdminController
  def index
    @support_stat_dashboard = Supports::DashboardSupport.new
  end
end
