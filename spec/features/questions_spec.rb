require "rails_helper"

describe "Questions", type: :feature, js: true do
  scenario "I create some questions" do
    visit root_path
    expect(page).to have_content "Create questions via FIE"
    find("#new_question").set("Babar en espadrille ?").native.send_keys(:return)
    expect(page).to have_content "Babar en espadrille ?"
    find("#new_question").set("Babar en tong ?").native.send_keys(:return)
    expect(page).to have_content "Babar en tong ?"
    find("#new_question").set("Boubah en tong ?").native.send_keys(:return)
    expect(page).to have_content "Boubah en tong ?"

    find("#filter_question").set("Babar").native.send_keys(:return)
    expect(page).to have_content "Babar en espadrille ?"
    expect(page).to have_content "Babar en tong ?"
    expect(page).to_not have_content "Boubah en tong ?"

    click_button "Reset filter"
    expect(page).to have_content "Babar en espadrille ?"
    expect(page).to have_content "Babar en tong ?"
    expect(page).to have_content "Boubah en tong ?"
  end
end
