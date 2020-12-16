class BracketsController < ApplicationController
  def index
    matching_brackets = Bracket.all

    @list_of_brackets = matching_brackets.order({ :created_at => :desc })

    render({ :template => "brackets/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_brackets = Bracket.where({ :id => the_id })

    @the_bracket = matching_brackets.at(0)

    render({ :template => "brackets/show.html.erb" })
  end

  def create
    the_bracket = Bracket.new
    the_bracket.number_of_entries = params.fetch("query_number_of_entries")
    the_bracket.manager_id = params.fetch("query_manager_id")
    the_bracket.status = params.fetch("query_status")

    if the_bracket.valid?
      the_bracket.save
      redirect_to("/brackets", { :notice => "Bracket created successfully." })
    else
      redirect_to("/brackets", { :notice => "Bracket failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bracket = Bracket.where({ :id => the_id }).at(0)

    the_bracket.number_of_entries = params.fetch("query_number_of_entries")
    the_bracket.manager_id = params.fetch("query_manager_id")
    the_bracket.status = params.fetch("query_status")

    if the_bracket.valid?
      the_bracket.save
      redirect_to("/brackets/#{the_bracket.id}", { :notice => "Bracket updated successfully."} )
    else
      redirect_to("/brackets/#{the_bracket.id}", { :alert => "Bracket failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bracket = Bracket.where({ :id => the_id }).at(0)

    the_bracket.destroy

    redirect_to("/brackets", { :notice => "Bracket deleted successfully."} )
  end
end
