let menuOpen = false;
let itemLayout = Array.from(35);
let lastWeaponHash = '';

onNet('inv:updateItems', (items) => {
  let itemLayout = Array.from(35);

  for (let i = 0; i < items.length; i++) {
    itemLayout.push(items[i]);
  }

  SendNuiMessage(JSON.stringify({
    type: 'updateItems',
    items: itemLayout
  }))
});

onNet('inv:useItem', (item) => {
  if (item.type === 1) {
    console.log('useless item use');
  } else if (item.type === 2) {
    const pedId = PlayerPedId();

    const metadata = JSON.parse(item.metadata);
    const item_metadata = JSON.parse(item.item_metadata);

    const weaponHash = GetHashKey(metadata.hash);

    if (HasPedGotWeapon(pedId, weaponHash)) {
      RemoveWeaponFromPed(pedId, weaponHash, false);

      SetPedAmmo(pedId, weaponHash, 0);
    } else {
      RemoveWeaponFromPed(pedId, lastWeaponHash, false);

      GiveWeaponToPed(pedId, weaponHash, 10, false, true);

      SetPedAmmo(pedId, weaponHash, parseInt(item_metadata.ammunition));

      lastWeaponHash = weaponHash;
    }
  }
});

onNet('inv:giveNewItem', (item) => {
  console.log(itemLayout);
  itemLayout.push(item);

  SendNuiMessage(JSON.stringify({
    type: 'newItem',
    item
  }));
});

on('playerSpawned', () => {
  emitNet('inv:getItems');
});

RegisterNuiCallbackType('exit');
on('__cfx_nui:exit', (data, cb) => {
  toggleInventory();

  cb('ok');
});

RegisterNuiCallbackType('iteminpos');
on('__cfx_nui:iteminpos', (data, cb) => {
  emitNet('inv:verifyItem', data.item);

  cb('ok');
});

RegisterNuiCallbackType('move_item');
on('__cfx_nui:move_item', (data, cb) => {
  const fromIndex = (data.from[2] + 1) + (data.from[1] * 7);
  const toIndex = (data.to[2] + 1) + (data.to[1] * 7);

  const tempItem = itemLayout[fromIndex];
  itemLayout[fromIndex] = itemLayout[toIndex];
  itemLayout[toIndex] = tempItem;

  cb('ok');
});

setTick(() => {
  BlockWeaponWheelThisFrame();
  HideHudComponentThisFrame(19);
  HideHudComponentThisFrame(20);
  HideHudComponentThisFrame(17);
  DisableControlAction(0, 37, true);

  DisableControlAction(0, 157, true);
  DisableControlAction(0, 158, true);
  DisableControlAction(0, 160, true);
  DisableControlAction(0, 164, true);
  DisableControlAction(0, 165, true);
  DisableControlAction(0, 159, true);
  DisableControlAction(0, 161, true);

  if (menuOpen) {
    HideHudAndRadarThisFrame();

    HideHudComponentThisFrame(1);
    HideHudComponentThisFrame(2);
    HideHudComponentThisFrame(3);
    HideHudComponentThisFrame(4);
    HideHudComponentThisFrame(6);
    HideHudComponentThisFrame(7);
    HideHudComponentThisFrame(8);
    HideHudComponentThisFrame(9);
    HideHudComponentThisFrame(13);

    DisableControlAction(0, 1, menuOpen);
    DisableControlAction(0, 2, menuOpen);
    DisableControlAction(0, 142, menuOpen);
    DisableControlAction(0, 18, menuOpen);
    DisableControlAction(0, 322, menuOpen);
    DisableControlAction(0, 106, menuOpen);
  }

  if (IsDisabledControlJustReleased(0, 37) && IsInputDisabled(0)) {
    toggleInventory();
  }

  if (IsDisabledControlJustReleased(0, 157) && !menuOpen) {
    hotbarItemUse(1);
  } else if(IsDisabledControlJustReleased(0, 158) && !menuOpen) {
    hotbarItemUse(2);
  } else if(IsDisabledControlJustReleased(0, 160) && !menuOpen) {
    hotbarItemUse(3);
  } else if(IsDisabledControlJustReleased(0, 164) && !menuOpen) {
    hotbarItemUse(4);
  } else if(IsDisabledControlJustReleased(0, 165) && !menuOpen) {
    hotbarItemUse(5);
  } else if(IsDisabledControlJustReleased(0, 159) && !menuOpen) {
    hotbarItemUse(6);
  } else if(IsDisabledControlJustReleased(0, 161) && !menuOpen) {
    hotbarItemUse(7);
  }
});

function toggleInventory() {
  menuOpen = !menuOpen;

  SetNuiFocus(menuOpen, menuOpen);

  SendNuiMessage(JSON.stringify({
    type: 'ui',
    status: menuOpen
  }));

  chat(`Setting menu to ${menuOpen}`);
}

function chat(text) {
  emit('chatMessage', '[inv]', [29, 233, 182], text);
}

function hotbarItemUse(num) {
  SendNuiMessage(JSON.stringify({
    type: 'getItemInPos',
    pos: num
  }));
}
