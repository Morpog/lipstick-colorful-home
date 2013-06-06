
// This file is part of colorful-home, a nice user experience for touchscreens.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// Copyright (c) 2012, Timur Kristóf <venemo@fedoraproject.org>

import QtQuick 2.0

Rectangle {
    property alias model: tabIconRepeater.model
    property variant currentIndex: 0

    color: "white"
    height: 80

    Row {
        id: tabsRow
        spacing: 20
        anchors.centerIn: parent
        z: 11

        Repeater {
            id: tabIconRepeater
            delegate: Item {
                id: tabItem
                width: 64
                height: 64

                Image {
                    anchors.fill: parent
                    source: iconUrl
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: currentIndex = index
                }
            }
        }
    }

    Rectangle {
        id: tabActiveIndicator
        color: "white"
        x: tabsRow.x + tabsRow.children[currentIndex].x + 11
        anchors.top: parent.bottom
        anchors.topMargin: -30
        height: 40
        width: 40
        transform: Rotation {
            origin.x: tabActiveIndicator.height / 2
            origin.y: tabActiveIndicator.height / 2
            angle: -45
        }
    }

    MouseArea {
        anchors.fill: parent
    }
}
