class GroupResourcesController < ApplicationController
  before_action :set_group_resource, only: %i[ show update destroy ]

  # GET /group_resources
  def index
    index_hash = {}
    group_id = params[:group_id]
    if group_id
      @group_resources = GroupResource.where(group_id: group_id)
    else
      @group_resources = GroupResource.all
    end

    @group_resources.each do |group_resource|
      index_hash.has_key?(group_resource.category) ? index_hash[group_resource.category] << group_resource : index_hash[group_resource.category] = [group_resource]
    end
    render json: index_hash
  end

  # GET /group_resources/1
  def show
    render json: @group_resource
  end

  # POST /group_resources
  def create
    @group_resource = GroupResource.new(group_resource_params)

    if @group_resource.save
      render json: @group_resource, status: :created, location: @group_resource
    else
      render json: @group_resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /group_resources/1
  def update
    if @group_resource.update(group_resource_params)
      render json: @group_resource
    else
      render json: @group_resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /group_resources/1
  def destroy
    @group_resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_resource
      @group_resource = GroupResource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_resource_params
      # params.fetch(:group_resource, {})
      params.require(:group_resource).permit(:group_id, :name, :category)
    end
end
