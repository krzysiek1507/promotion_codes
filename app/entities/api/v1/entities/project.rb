module API
  module V1
    module Entities
      class Project < Grape::Entity
        format_with :iso_timestamp, &:iso8601

        expose :id, :name

        with_options format_with: :iso_timestamp do
          expose :created_at
          expose :updated_at
        end
      end
    end
  end
end
