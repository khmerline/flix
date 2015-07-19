require "rails_helper"

describe "Viewing the list of movies" do

  it "shows the movies" do

    movie1 = Movie.create!(title: 'Iron Man',
    description:
    %{
      When wealthy industrialist Tony Stark is forced to build an
      armored suit after a life-threatening incident, he ultimately
      decides to use its technology to fight against evil.
    }.squish,
    image_file_name: 'ironman.jpg',
    cast: 'Robert Downey Jr., Gwyneth Paltrow and Terrence Howard',
    released_on: "2008-05-02",
    duration: '126 min',
    director: 'Jon Favreau',
    rating: 'PG-13',
    total_gross: 318_412_101)

    movie2 = Movie.create!(title: 'Superman',
    description:
    %{
      An alien orphan is sent from his dying planet to Earth, where
      he grows up to become his adoptive home's first and greatest
      super-hero.
    }.squish,
    image_file_name: 'superman.jpg',
    cast: 'Christopher Reeve, Margot Kidder and Gene Hackman',
    released_on: "1978-12-15",
    duration: '143 min',
    director: 'Richard Donner',
    rating: 'PG',
    total_gross: 134_218_018)

    movie3 = Movie.create!(title: 'Spider-Man',
    description:
    %{
      When bitten by a genetically modified spider, a nerdy, shy, and
      awkward high school student gains spider-like abilities that he
      eventually must use to fight evil as a superhero after tragedy
      befalls his family.
    }.squish,
    image_file_name: 'spiderman.jpg',
    cast: 'Tobey Maguire, Kirsten Dunst and Willem Dafoe',
    released_on: "2002-05-03",
    duration: '121 min',
    director: 'Sam Raimi',
    rating: 'PG-13',
    total_gross: 403_706_375)

    visit movies_url

    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)

   
  

    
  end

  it "does not show a movie that hasn't yet been released" do
    movie = Movie.create(movie_attributes(released_on: 1.month.from_now))

    visit movies_path

    expect(page).not_to have_text(movie.title)
  end



end
