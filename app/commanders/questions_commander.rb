class QuestionsCommander < Fie::Commander

  def toggle_edit_field(id:)
    execute_js_function("toggleEditField", "question-edit-#{id}")
  end

  def create_question
    question = Question.new(content: @caller[:value])
    if question.save
      state.questions = Question.all
    end
  end

  def update_question(id:)
    question = Question.find_by(id: id)
    if question
      question.content = @caller[:value]
      question.save
      state.questions = state.questions
    end
  end

  def filter_questions
    state.questions = Question.where("content like ?", "%#{@caller[:value]}%")
  end

  def refresh_page
    state.questions = Question.all
  end

end
