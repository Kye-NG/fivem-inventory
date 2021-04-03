
console.log('test');

const app = new Vue({
  el: '#app',
  data: {
    menuOpen: false,
    inventory: [
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null]
    ]
  },
  computed: {
    hotbarInv: function () {
      return this.inventory[4]
    },
    inventoryComp: function () {
      return [this.inventory[0], this.inventory[1], this.inventory[2], this.inventory[3]]
    }
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

      else if(item.type === 'updateItems') {
        this.resetItems();

        let i = 0;
        let row = 0;

        for (let obj of item.items) {
          // Set the obj to the item
          this.inventory[row][i] = obj;

          i++;

          // When we hit the 6th index, we set the row to the next one.
          if (i === 6) {
            i = 0;
            row++;
          }
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
    },
    resetItems() {
      this.inventory = [
        [null, null, null, null, null, null, null],
        [null, null, null, null, null, null, null],
        [null, null, null, null, null, null, null],
        [null, null, null, null, null, null, null],
        [null, null, null, null, null, null, null]
      ]
    }
  }
})
