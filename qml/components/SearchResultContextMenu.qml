/**
 * Hutspot. 
 * Copyright (C) 2018 Willem-Jan de Hoog
 * Copyright (C) 2018 Maciej Janiszewski
 *
 * License: MIT
 */

import QtQuick 2.2
import Sailfish.Silica 1.0

import "../Util.js" as Util

ContextMenu {

    property int contextType: -1

    MenuItem {
        text: qsTr("Play")
        onClicked: {
            switch(type) {
            case 0:
                app.controller.playContext(album)
                break;
            case 1:
                app.controller.playContext(artist)
                break;
            case 2:
                app.controller.playContext(playlist)
                break;
            case 3:
                app.controller.playTrack(track)
                break;
            }
        }
        enabled: type !== 3 || Util.isTrackPlayable(track)
        visible: enabled
    }
    MenuItem {
        text: qsTr("View")
        enabled: type === 0 || type === 1 || type === 2
        visible: enabled
        onClicked: {
            switch(type) {
            case 0:
                app.pushPage(Util.HutspotPage.Album, {album: album})
                break
            case 1:
                app.pushPage(Util.HutspotPage.Artist, {currentArtist: artist})
                break
            case 2:
                app.pushPage(Util.HutspotPage.Playlist, {playlist: playlist})
                break
            }
        }
    }
    MenuItem {
        enabled: type === 3
        visible: enabled
        text: qsTr("View Album")
        onClicked: app.pushPage(Util.HutspotPage.Album, {album: track.album})
    }
    MenuItem {
        enabled: (type === 3 && Util.isTrackPlayable(track)) && contextType !== 2
        visible: enabled
        text: qsTr("Add to Playlist")
        onClicked: app.addToPlaylist(track)
    }
    MenuItem {
        enabled: type === 2
        visible: enabled
        text: qsTr("Use as Seeds for Recommendations")
        onClicked: app.useAsSeeds(playlist)
    }
}
