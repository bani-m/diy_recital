module WorksHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_works_path
    elsif action_name == 'edit'
      work_path
    end
  end
end
