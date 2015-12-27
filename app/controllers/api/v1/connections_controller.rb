class Api::V1::ConnectionsController < Api::V1::ApplicationController
  before_action :set_member, only: [:index, :create, :update, :destroy]
  before_action :set_connections, only: [:create, :update, :destroy]

  # GET /members/:member_id/connections
  def index
    connections = @member.connections

    render(json: connections.to_json)
  end

  # POST /members/:member_id/connections
  def create
    connection = @connections.new(connection_params)

    if connection.save
      render(json: connection.to_json)
    else
      render(json: connection.errors.to_json)
    end
  end

  # GET /members/:member_id/connections/:id
  def show
    connection = Connection.find(params[:id])

    render(json: connection.to_json)
  end

  # PUT /members/:member_id/connections/:id
  def update
    connection = @connections.find(params[:id])

    if connection.update(connection_params)
      render(json: connection.to_json)
    else
      render(json: connection.errors.to_json)
    end
  end

  # DELETE /member/:member_id/connections/:id
  def destroy
    connection = @connections.find(params[:id])

    if connection.destroy
      render(json: connection.to_json)
    end
  end

  private
    def set_member
      @member = Member.find(params[:member_id])
    end

    def set_connections
      @connections = @member.connections
    end

    def connection_params
      params.require(:connection).permit(:name, :lastname, :email)
    end
end
