class Api::V1::MembersController < Api::V1::ApplicationController
  def show
    member = Member.find(params[:id])

    render(json: member.to_json)
  end
end
