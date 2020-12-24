module Web
  module Controllers
    module Recipes
      class Index
        include Web::Action

        expose :recipes

        def call(params)
          @recipes = RecipeRepository.new.all
        end
      end
    end
  end
end
