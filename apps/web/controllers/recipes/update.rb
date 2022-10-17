module Web
  module Controllers
    module Recipes
      class Update
        include Web::Action

        def call(params)
          @recipe = RecipeRepository.new.update(params[:id], params[:recipe])
          redirect_to routes.recipes_path
        end
      end
    end
  end
end
