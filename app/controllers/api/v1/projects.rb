module API
  module V1
    class Projects < Grape::API
      include API::V1::Defaults

      resource :projects do
        get do
          present paginate(::Project.all), with: Entities::Project
        end

        get ':id' do
          present ::Project.find(params[:id]), with: Entities::Project
        end
      end
    end
  end
end
