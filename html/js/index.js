
console.log('test');

const app = new Vue({
  el: '#app',
  data: {
    menuOpen: false
  },
  created: function() {
    window.addEventListener('message', this.setupMessageListener);
    window.addEventListener('keyup', this.setupCloseListener);

    axios.post('https://fivem-inventory/main', { text: 'loaded with vue' }).then(data => {
      console.log(data);
    }).catch(e => {
      console.log(e);
    })
  },
  destroyed: function() {
    window.removeEventListener('message', this.setupMessageListener);
    window.removeEventListener('keyup', this.setupCloseListener);
  },
  methods: {
    setupMessageListener(event) {
      const item = event.data;

      if (item.type === "ui") {
        if (item.status == true) {
          this.display(true)
        } else {
          this.display(false)
        }
      }
    },
    setupCloseListener(data) {
      if (data.which == 9) {
        axios.post('https://fivem-inventory/exit', {}).then(data => {
          console.log(data);
        }).catch(e => {
          console.log(e);
        })
      }
    },
    display(bool) {
      this.menuOpen = bool;

      console.log(`Set menu bool to: ${bool}`);
    }
  }
})