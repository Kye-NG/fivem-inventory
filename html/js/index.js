
console.log('test');

const app = new Vue({
  el: '#app',
  data: {
    menuOpen: false,
    activeItem: null,
    inventory: [
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null],
      [null, null, null, null, null, null, null]
    ],
    currentDraggedItem: []
  },
  computed: {
    hotbarInv() {
      return this.inventory[4]
    },
    inventoryComp() {
      return [this.inventory[0], this.inventory[1], this.inventory[2], this.inventory[3]]
    }
  },
  created: function() {
    window.addEventListener('message', this.setupMessageListener);
    window.addEventListener('keyup', this.setupCloseListener);
  },
  destroyed: function() {
    window.removeEventListener('message', this.setupMessageListener);
    window.removeEventListener('keyup', this.setupCloseListener);
  },
  methods: {
    onDrag(event, row, col) {
      this.currentDraggedItem[0] = row;
      this.currentDraggedItem[1] = col;
    },
    onDrop(event, row, col) {
      let temp = this.inventory[this.currentDraggedItem[0]][this.currentDraggedItem[1]];

      this.inventory[this.currentDraggedItem[0]][this.currentDraggedItem[1]] = this.inventory[row][col];
      this.inventory[row][col] = temp;

      // Vue add reactivity because its not default.
      app.$set(app.inventory, row, this.inventory[row]);
      app.$set(app.inventory, this.currentDraggedItem[0], this.inventory[this.currentDraggedItem[0]]);

      // axios.post('https://fivem-inventory/move_item', {
      //   from: [this.currentDraggedItem[0], this.currentDraggedItem[1]],
      //   to: [row, col]
      // }).then(data => {
      //   console.log(data);
      // }).catch(e => {
      //   console.log(e);
      // })
    },
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
          if (i === 7) {
            i = 0;
            row++;
          }
        }
      }

      else if (item.type === 'activeChange') {
        this.activeItem = item.activeId;
      }
    },
    setupCloseListener(data) {
      if (data.which == 9) {
        axios.post('https://fivem-inventory/exit', {}).then(data => {
          console.log(data);
        }).catch(e => {
          console.log(e);
        });
      }
    },
    display(bool) {
      this.menuOpen = bool;
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

$(document).ready(function() {
  $('.draggable-item').draggable({
    helper: 'clone',
    revert: 'invalid',
    zIndex: 10,
    start: function(event, ui) {
      app.onDrag(event, $(this).data("row"), $(this).data("col"))
    }
  });

  $('.draggable-item').droppable({
    accept: '.draggable-item',
    drop: function(event, ui) {
      app.onDrop(event, $(this).data("row"), $(this).data("col"))
    }
  });
});