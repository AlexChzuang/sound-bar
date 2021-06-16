document.addEventListener("turbolinks:load", function () {

  let openMyFav = document.querySelector('#openMyFav')
  let myFavList = document.querySelector('#myFavList')

  let storageFav = JSON.parse(localStorage.getItem('favor_episode')) || []

  if (openMyFav) {
    let list = storageFav.map(function(episode){
      return `
      <li class="my-2 px-2 pb-2 border-b border-yellow-100 hover:bg-yellow-100 hover:text-indigo overflow-hidden textOverflow">
        <a href="${episode.url}" class="block overflow-hidden textOverflow">${episode.artist} | ${episode.title}</a>
      </li>
      `
    })
    myFavList.innerHTML = list.join('')

    openMyFav.addEventListener('click', () => {
      myFavList.classList.toggle('hidden')
    })
  }

})
