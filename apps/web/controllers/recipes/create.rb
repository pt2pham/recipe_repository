module Web
  module Controllers
    module Recipes
      class Create
        include Web::Action

        expose :recipe

        params do
          required(:recipe).schema do
            required(:name).filled(:str?)
            required(:difficulty).filled(:float?)
            required(:food_type).filled(:str?)
            required(:serving_size).filled(:str?)
            required(:duration).filled(:int?)
            required(:ingredients).filled(:str?)
            required(:instructions).filled(:str?)
            required(:notes).filled(:str?)
            required(:tags).filled(:str?)
          end
        end

        def call(params)
          if params.valid?
            @recipe = RecipeRepository.new.create(params[:recipe])
            
            redirect_to routes.recipes_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
