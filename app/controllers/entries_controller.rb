class EntriesController < ApplicationController
  def index
    matching_entries = Entry.all

    @list_of_entries = matching_entries.order({ :created_at => :desc })

    render({ :template => "entries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_entries = Entry.where({ :id => the_id })

    @the_entry = matching_entries.at(0)

    render({ :template => "entries/show.html.erb" })
  end

  def create
    the_entry = Entry.new
    the_entry.bracket_id = params.fetch("query_bracket_id")
    the_entry.status = params.fetch("query_status")
    the_entry.title = params.fetch("query_title")

    if the_entry.valid?
      the_entry.save
      redirect_to("/entries", { :notice => "Entry created successfully." })
    else
      redirect_to("/entries", { :notice => "Entry failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_entry = Entry.where({ :id => the_id }).at(0)

    the_entry.bracket_id = params.fetch("query_bracket_id")
    the_entry.status = params.fetch("query_status")
    the_entry.title = params.fetch("query_title")

    if the_entry.valid?
      the_entry.save
      redirect_to("/entries/#{the_entry.id}", { :notice => "Entry updated successfully."} )
    else
      redirect_to("/entries/#{the_entry.id}", { :alert => "Entry failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_entry = Entry.where({ :id => the_id }).at(0)

    the_entry.destroy

    redirect_to("/entries", { :notice => "Entry deleted successfully."} )
  end
end
