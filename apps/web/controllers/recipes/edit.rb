module Web
  module Controllers
    module Recipes
      class Edit
        include Web::Action

        expose :recipe

        def call(params)
          @recipe = RecipeRepository.new.find(params[:id])
        end
      end
    end
  end
end
