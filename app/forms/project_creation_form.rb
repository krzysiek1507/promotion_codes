class ProjectCreationForm < Reform::Form
  property :name

  validation :default do
    required(:name).filled(:str?)
  end

  validation :unique, if: :default, with: { form: true } do
    configure do
      def unique?(attr_name, value)
        options[:form]
          .model
          .class
          .where.not(id: options[:form].model.id)
          .where({ attr_name => value }, case_sensitive: false)
          .empty?
      end
    end

    required(:name).filled(unique?: :name)
  end
end
