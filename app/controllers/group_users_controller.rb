class GroupUsersController < ApplicationController
    before_action :set_group_user, only: %i[ show update destroy ]
    def create
        @group_user = GroupUser.new(group_user_params)

        if @group_user.save
        render json: @group_user, status: :created, location: @group_user
        else
        render json: @group_user.errors, status: :unprocessable_entity
        end
    end

    def destroy
      @group_user.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_user
      @group_user = GroupUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_user_params
      params.require(:group_user).permit(:group_id, :user_id, :group_admin)
    end
end
