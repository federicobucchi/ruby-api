class Api::V1::MembersController < Api::V1::ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  def index
    members = Member.all()

    render(json: members.to_json)
  end

  # POST /members
  def create
    member = Member.new(member_params)

    if member.save
      render(json: member.to_json)
    else
      render(json: member.errors.to_json)
    end
  end

  # GET /members/:id
  def show
    render(json: @member.to_json)
  end

  # PUT /members/:id
  def update
    if @member.update(member_params)
      render(json: @member.to_json)
    else
      render(json: @member.errors.to_json)
    end
  end

  # DELETE /member/:id
  def destroy
    if @member.destroy
      render(json: @member.to_json)
    end
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :lastname, :email)
    end
end
