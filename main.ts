import { app, BrowserWindow, Menu, MenuItem } from 'electron';
import * as path from 'path';

let win: any = null;
console.log('Hello from main process!');

app.on('ready', () => {
    win = new BrowserWindow({
        'title': 'Electron Demo',
        'icon': path.resolve(app.getAppPath(), 'your-icon.png'),
        'width': 800,
        'height': 600
    });

    // console.log(path.resolve(app.getAppPath(), 'your-icon.png'));

    win.loadURL('https://web.skype.com/en');

    // win.webContents.openDevTools();

    let menu = new Menu();
    menu.append(new MenuItem({
        label: 'Quit',
        accelerator: 'CmdOrCtrl+Q',
        click: () => {
            app.quit();
        }
    }));
    menu.append(new MenuItem({
        label: 'About demo',
        click: () => {
            let aboutWin = new BrowserWindow({
                'width': 400,
                'height': 400
            });

            aboutWin.loadURL(`file://${__dirname}/index.html`);

            aboutWin.on('close', () => {
                aboutWin = null;
            });
        }
    }));

    win.setMenu(menu);

    win.on('close', () => {
        win = null;
    });
});
