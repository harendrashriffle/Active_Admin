# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  sidebar :hi do
    'hi'
  end

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
  end

  content do

  end

  # panel "Tags" do
  #   stats = Tagging.distribution

  #   div "class" => "pie-chart",
  #       "data-numbers" => stats.map { |stat| stat[1] }.join(","),
  #       "data-labels"  => stats.map { |stat| stat[0] }.join(","),
  #       "data-size"    => "400"
  # end


  # menu false
  menu priority: 0


end
