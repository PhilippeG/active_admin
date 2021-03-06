module ActiveAdmin
  class BaseController < ApplicationController
    module Menu
      extend ActiveSupport::Concern

      included do
        before_filter :set_current_tab
        helper_method :current_menu
      end

      protected

      def current_menu
        active_admin_config.namespace.menu
      end

      # Set's @current_tab to be name of the tab to mark as current
      # Get's called through a before filter
      def set_current_tab
        @current_tab = if active_admin_config.belongs_to? && parent?
          active_admin_config.belongs_to_config.target.menu_item
        else
          active_admin_config.menu_item
        end
      end

    end
  end
end
