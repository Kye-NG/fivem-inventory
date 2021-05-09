let menuOpen = false;
let itemLayout = {};
// let lastWeaponHash = '';

onNet('inv:updateItems', (items) => {
  itemLayout = items;

  SendNuiMessage(JSON.stringify({
    type: 'updateItems',
    items: itemLayout
  }))
});

on('playerSpawned', () => {
  emitNet('inv:getItems');
});

RegisterNuiCallbackType('exit');
on('__cfx_nui:exit', (data, cb) => {
  toggleInventory();

  cb('ok');
})

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
    useItem(1);
  } else if(IsDisabledControlJustReleased(0, 158) && !menuOpen) {
    useItem(2);
  } else if(IsDisabledControlJustReleased(0, 160) && !menuOpen) {
    useItem(3);
  } else if(IsDisabledControlJustReleased(0, 164) && !menuOpen) {
    useItem(4);
  } else if(IsDisabledControlJustReleased(0, 165) && !menuOpen) {
    useItem(5);
  } else if(IsDisabledControlJustReleased(0, 159) && !menuOpen) {
    useItem(6);
  } else if(IsDisabledControlJustReleased(0, 161) && !menuOpen) {
    useItem(7);
  }
})

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

function useItem(num) {
  chat(`Attempting to use: ^*^6${num}`);
}