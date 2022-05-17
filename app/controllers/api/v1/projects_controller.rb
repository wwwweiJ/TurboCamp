# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < Api::V1::BaseController
      def search
        user = User.where(email: params[:email]).first
        project = Project.friendly.find(params[:id])
        message = '請重新邀請'
        unless user.nil?
          if project.users.exists?(user.id)
            message = '成員已存在'
          else
            project.users << user
            message = '成功邀請成員'
          end
        end
        render json: { message: }
        # render json: params
      end
    end
  end
end
