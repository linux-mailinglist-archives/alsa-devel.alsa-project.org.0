Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC63C3994A1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 22:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B4CA16F2;
	Wed,  2 Jun 2021 22:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B4CA16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622666250;
	bh=5XuEM2f+lM0C6BAHF5heseCA6Y1R7YGzUcU4BiscxkY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F+kCw0HmGe744UnVGXl6AhdnkA8NYuYy/clOEux16QMoTVvzSvH6t/qSuMYvMoEKX
	 +FHcqOOCGWPZmHMt7NvoVtDVGyu+oaU0yxu1uLHrXtccT7FaWx5ZK70cIMXXYj6F6W
	 Yg1tWeTXFe+oO2jwLoto6pXoAn+des6WHK5mG0s0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E80AF802A9;
	Wed,  2 Jun 2021 22:36:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A13BDF80424; Wed,  2 Jun 2021 22:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE, MIME_HTML_ONLY, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2E44F80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 22:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2E44F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="VDiZq8K7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1622666145;
 bh=R+O1Iqq/nu31U8gWjnOCnbHJlDg7ldUQ4pVQ9jfSGP0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=VDiZq8K7ArhpISG/WrHU/4t7I9QcXrWbD2TFE0HOY0lFurqQlbcF2eVjDXk0LpQu6
 tY2F7dX1db/QAeVNVAP4ArIYDQ0OH5PNaptMys39A5gj4ajDUwFmoWPVdYECGqBsTj
 KtXqjuhRLcNzqxv4m0cby+K3v7sYpFY7TM9MVorU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [93.194.223.136] ([93.194.223.136]) by web-mail.gmx.net
 (3c-app-gmx-bs30.server.lan [172.19.170.82]) (via HTTP); Wed, 2 Jun 2021
 22:35:45 +0200
Message-ID: <trinity-8bce8a2c-8808-4f78-8ddd-a71c8a7bc304-1622666145088@3c-app-gmx-bs30>
From: Roman <klangrausch@wolke7.net>
To: alsa-devel@alsa-project.org
Subject: Allen&Heath Xone43C: USB communication
Date: Wed, 2 Jun 2021 22:35:45 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:6L2ndqW4MzlffoIKebb+OFPL5jMJb97TJ3aCrL/4j9pg/+Viz7weKFWx20CbgTiRiWa8H
 WEsjRt9aVI2mqst6YKvwnvOIEgVGpe59qzNMyWuPOX27YQn8V77LyYZewSU+UTsTpzdiFrUgXtew
 NipXu6bRFyZWWtQcbJ78XIwrmnvVlrODlmBdRM7s2Z/Dos7beQskAD/BKNXFMe2gnoDmsKPPyVD0
 47Zvh/EMCVP0vaPqCvu7wWD9Cqgf84JYG/fchnWSE69K6at3VZENuqOdaN4QAZ2oO1Wj2gR1rRf+
 Rg=
X-UI-Out-Filterresults: notjunk:1;V03:K0:HtZlBoyIrmw=:UVqKs7nRp0kCBGUDOhK7AV
 ZPZrSDjfKis2S+3Pvsa8GYII1iJGo9CN5OhjBozraoPm5XoZmAjUve5NBmrV6ijulv8bvJ6bY
 KIvP8yb+XpF2EitWVRcHHeJCAu5tLvWseWyWvrk5pV/9nSmCwmWxjvaIvZJ4O02grVVh7h2ys
 pQdm8fytinjUyIvdmeoXpG3zcDbWiKeYdBwSfwkGEQ0aoONi2pMCo/bIBFvw+nVtoMe8oL0Vo
 JCgwii/WDD4VzcCJDZ49FlHAhE1V/7HkrtFNIvOXpdvzw3mMJ/Al9lnwld5g7cgagrBqqnTUS
 3iq6v9XJBrj/hzPrKkuDD39kZ3nSNaVHRb9s9CxNuqnZxKPo8pMLdqTMWsyZgeK66WIcOE+se
 KO0xVw5CluF4ylObVeS1I4Amwv2kdgqMuZVP71qDiSrPhb2LDbQ4QBbh70RoR9NnMeHiEJxFq
 oMQaD8sHe7WWsvf3tkCY5jfGyWU5Mby3swuSz5GIJKDI09RyaKakB7mX/tBGBgmVo+pmlNVnf
 xcB0mb96UydsbgKci2WUtBMF7RzjI/JcsKQ9KNMOWPhqliFgNbdERxEFGxmMRFXXxD2IbDw/q
 gqxdUlYX6vQKO1dkQ/Vyj56ZHgxqtRVdDG+BDPGd3KHr1mHziZDKfMLbJ2mINRRtw+sTybuNm
 PV5OAym4j3pG/EtRCqOLVt/u6vryZA96YWHXAdChQZUsaf153hQa5AGPfBsnW5qSllYEnoYnF
 4CGF0Bc4Oh9cXf+sGR1Or7xWnlmFH4Stq0cV58lkUBV1mT2kC7A28+6q0JMFVhO+N3zmb49YR
 r9/XvyStC3KfxHK2YRlvry2yBf+hNLV7haIbuF5jhd8WZ4cf78n4ExMHrVVrp5+NssneYHcPx
 /E42ya1nuvT53mLsUPXA==
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


   Hello all, hello list,
   I am not sure whether this is the correct list, since it's not strictly
   an
   ALSA affair (fw to kernel-devel). Recent progress on driver support for
   Pioneer devices encouraged me to dissect USB communication with an
   Allen&Heath Xone43C, a mixer with USB interface. It does feature 16
   channels
   (8 in, 8 out), but only 4 (2 in, 2 out) show up, 2 of which remain
   automagically
   silent. There is no linux driver yet, and maybe I can help?
   Addresses are:
   0x80    Endpoint 0 (in)
   0x00    Endpoint 0 (out)
   0x81    Endpoint 1 (in)    Interface 2.1 and Interface 2.2 (vendor
   spec)
   0x02    Endpoint 2 (out)  Interface 1.1 and Interface 1.2 (vendor spec)
   0x85    Endpoint 5 (in)    Interface 1.1
   0x83    Endpoint 3 (in)    Interface 3 MIDI
   0x04    Endpoint 4 (out)  Interface 3 MIDI

   ----------------------------------

   I have a sniff here:
   https://drive.google.com/file/d/1UPXCN-r7jc9hfm1d-Hip8vckSs2RQNtC/view?
   usp=sharing

   ---------------------------------

   USB info:

   Bus 001 Device 006: ID 22f0:000f Allen&Heath Xone:43C
   Device Descriptor:
     bLength                18
     bDescriptorType         1
     bcdUSB               2.00
     bDeviceClass          239 Miscellaneous Device
     bDeviceSubClass         2
     bDeviceProtocol         1 Interface Association
     bMaxPacketSize0        64
     idVendor           0x22f0
     idProduct          0x000f
     bcdDevice            2.00
     iManufacturer           1 Allen&Heath
     iProduct                2 Xone:43C
     iSerial                 3 no serial number
     bNumConfigurations      1
     Configuration Descriptor:
       bLength                 9
       bDescriptorType         2
       wTotalLength       0x0126
       bNumInterfaces          4
       bConfigurationValue     1
       iConfiguration          0
       bmAttributes         0xc0
         Self Powered
       MaxPower                0mA
       Interface Descriptor:
         bLength                 9
         bDescriptorType         4
         bInterfaceNumber        0
         bAlternateSetting       0
         bNumEndpoints           0
         bInterfaceClass         1 Audio
         bInterfaceSubClass      1 Control Device
         bInterfaceProtocol      0
         iInterface              0
         AudioControl Interface Descriptor:
           bLength                11
           bDescriptorType        36
           bDescriptorSubtype      1 (HEADER)
           bcdADC               1.00
           wTotalLength       0x0035
           bInCollection           3
           baInterfaceNr(0)        1
           baInterfaceNr(1)        2
           baInterfaceNr(2)        3
         AudioControl Interface Descriptor:
           bLength                12
           bDescriptorType        36
           bDescriptorSubtype      2 (INPUT_TERMINAL)
           bTerminalID             1
           wTerminalType      0x0101 USB Streaming
           bAssocTerminal          0
           bNrChannels             2
           wChannelConfig     0x0003
             Left Front (L)
             Right Front (R)
           iChannelNames           0
           iTerminal               0
         AudioControl Interface Descriptor:
           bLength                 9
           bDescriptorType        36
           bDescriptorSubtype      3 (OUTPUT_TERMINAL)
           bTerminalID             2
           wTerminalType      0x0602 Digital Audio Interface
           bAssocTerminal          0
           bSourceID               1
           iTerminal               0
         AudioControl Interface Descriptor:
           bLength                12
           bDescriptorType        36
           bDescriptorSubtype      2 (INPUT_TERMINAL)
           bTerminalID             3
           wTerminalType      0x0602 Digital Audio Interface
           bAssocTerminal          0
           bNrChannels             2
           wChannelConfig     0x0003
             Left Front (L)
             Right Front (R)
           iChannelNames           0
           iTerminal               0
         AudioControl Interface Descriptor:
           bLength                 9
           bDescriptorType        36
           bDescriptorSubtype      3 (OUTPUT_TERMINAL)
           bTerminalID             4
           wTerminalType      0x0101 USB Streaming
           bAssocTerminal          0
           bSourceID               3
           iTerminal               0
       Interface Descriptor:
         bLength                 9
         bDescriptorType         4
         bInterfaceNumber        1
         bAlternateSetting       0
         bNumEndpoints           0
         bInterfaceClass         1 Audio
         bInterfaceSubClass      2 Streaming
         bInterfaceProtocol      0
         iInterface              0
       Interface Descriptor:
         bLength                 9
         bDescriptorType         4
         bInterfaceNumber        1
         bAlternateSetting       1
         bNumEndpoints           2
         bInterfaceClass         1 Audio
         bInterfaceSubClass      2 Streaming
         bInterfaceProtocol      0
         iInterface              0
         AudioStreaming Interface Descriptor:
           bLength                 7
           bDescriptorType        36
           bDescriptorSubtype      1 (AS_GENERAL)
           bTerminalLink           1
           bDelay                  1 frames
           wFormatTag         0x0001 PCM
         AudioStreaming Interface Descriptor:
           bLength                11
           bDescriptorType        36
           bDescriptorSubtype      2 (FORMAT_TYPE)
           bFormatType             1 (FORMAT_TYPE_I)
           bNrChannels             2
           bSubframeSize           3
           bBitResolution         24
           bSamFreqType            1 Discrete
           tSamFreq[ 0]        48000
         Endpoint Descriptor:
           bLength                 9
           bDescriptorType         5
           bEndpointAddress     0x02  EP 2 OUT
           bmAttributes            5
             Transfer Type            Isochronous
             Synch Type               Asynchronous
             Usage Type               Data
           wMaxPacketSize     0x0126  1x 294 bytes
           bInterval               4
           bRefresh                0
           bSynchAddress         133
           AudioStreaming Endpoint Descriptor:
             bLength                 7
             bDescriptorType        37
             bDescriptorSubtype      1 (EP_GENERAL)
             bmAttributes         0x01
               Sampling Frequency
             bLockDelayUnits         2 Decoded PCM samples
             wLockDelay         0x0000
         Endpoint Descriptor:
           bLength                 9
           bDescriptorType         5
           bEndpointAddress     0x85  EP 5 IN
           bmAttributes            1
             Transfer Type            Isochronous
             Synch Type               None
             Usage Type               Data
           wMaxPacketSize     0x0003  1x 3 bytes
           bInterval               4
           bRefresh                5
           bSynchAddress           0
       Interface Descriptor:
         bLength                 9
         bDescriptorType         4
         bInterfaceNumber        1
         bAlternateSetting       2
         bNumEndpoints           1
         bInterfaceClass       255 Vendor Specific Class
         bInterfaceSubClass      0
         bInterfaceProtocol      0
         iInterface              0
         Endpoint Descriptor:
           bLength                 9
           bDescriptorType         5
           bEndpointAddress     0x02  EP 2 OUT
           bmAttributes            5
             Transfer Type            Isochronous
             Synch Type               Asynchronous
             Usage Type               Data
           wMaxPacketSize     0x0200  1x 512 bytes
           bInterval               1
           bRefresh                0
           bSynchAddress           0
       Interface Descriptor:
         bLength                 9
         bDescriptorType         4
         bInterfaceNumber        2
         bAlternateSetting       0
         bNumEndpoints           0
         bInterfaceClass         1 Audio
         bInterfaceSubClass      2 Streaming
         bInterfaceProtocol      0
         iInterface              0
       Interface Descriptor:
         bLength                 9
         bDescriptorType         4
         bInterfaceNumber        2
         bAlternateSetting       1
         bNumEndpoints           1
         bInterfaceClass         1 Audio
         bInterfaceSubClass      2 Streaming
         bInterfaceProtocol      0
         iInterface              0
         AudioStreaming Interface Descriptor:
           bLength                 7
           bDescriptorType        36
           bDescriptorSubtype      1 (AS_GENERAL)
           bTerminalLink           4
           bDelay                  1 frames
           wFormatTag         0x0001 PCM
         AudioStreaming Interface Descriptor:
           bLength                11
           bDescriptorType        36
           bDescriptorSubtype      2 (FORMAT_TYPE)
           bFormatType             1 (FORMAT_TYPE_I)
           bNrChannels             2
           bSubframeSize           3
           bBitResolution         24
           bSamFreqType            1 Discrete
           tSamFreq[ 0]        48000
         Endpoint Descriptor:
           bLength                 9
           bDescriptorType         5
           bEndpointAddress     0x81  EP 1 IN
           bmAttributes            5
             Transfer Type            Isochronous
             Synch Type               Asynchronous
             Usage Type               Data
           wMaxPacketSize     0x0126  1x 294 bytes
           bInterval               4
           bRefresh                0
           bSynchAddress           0
           AudioStreaming Endpoint Descriptor:
             bLength                 7
             bDescriptorType        37
             bDescriptorSubtype      1 (EP_GENERAL)
             bmAttributes         0x01
               Sampling Frequency
             bLockDelayUnits         2 Decoded PCM samples
             wLockDelay         0x0000
       Interface Descriptor:
         bLength                 9
         bDescriptorType         4
         bInterfaceNumber        2
         bAlternateSetting       2
         bNumEndpoints           1
         bInterfaceClass       255 Vendor Specific Class
         bInterfaceSubClass      0
         bInterfaceProtocol      0
         iInterface              0
         Endpoint Descriptor:
           bLength                 9
           bDescriptorType         5
           bEndpointAddress     0x81  EP 1 IN
           bmAttributes            5
             Transfer Type            Isochronous
             Synch Type               Asynchronous
             Usage Type               Data
           wMaxPacketSize     0x0200  1x 512 bytes
           bInterval               1
           bRefresh                0
           bSynchAddress           0
       Interface Descriptor:
         bLength                 9
         bDescriptorType         4
         bInterfaceNumber        3
         bAlternateSetting       0
         bNumEndpoints           2
         bInterfaceClass         1 Audio
         bInterfaceSubClass      3 MIDI Streaming
         bInterfaceProtocol      0
         iInterface              0
         MIDIStreaming Interface Descriptor:
           bLength                 7
           bDescriptorType        36
           bDescriptorSubtype      1 (HEADER)
           bcdADC               1.00
           wTotalLength       0x0041
         MIDIStreaming Interface Descriptor:
           bLength                 6
           bDescriptorType        36
           bDescriptorSubtype      2 (MIDI_IN_JACK)
           bJackType               1 Embedded
           bJackID                 1
           iJack                   0
         MIDIStreaming Interface Descriptor:
           bLength                 6
           bDescriptorType        36
           bDescriptorSubtype      2 (MIDI_IN_JACK)
           bJackType               2 External
           bJackID                 2
           iJack                   0
         MIDIStreaming Interface Descriptor:
           bLength                 9
           bDescriptorType        36
           bDescriptorSubtype      3 (MIDI_OUT_JACK)
           bJackType               1 Embedded
           bJackID                 3
           bNrInputPins            1
           baSourceID( 0)          2
           BaSourcePin( 0)         1
           iJack                   0
         MIDIStreaming Interface Descriptor:
           bLength                 9
           bDescriptorType        36
           bDescriptorSubtype      3 (MIDI_OUT_JACK)
           bJackType               2 External
           bJackID                 4
           bNrInputPins            1
           baSourceID( 0)          1
           BaSourcePin( 0)         1
           iJack                   0
         Endpoint Descriptor:
           bLength                 9
           bDescriptorType         5
           bEndpointAddress     0x83  EP 3 IN
           bmAttributes            2
             Transfer Type            Bulk
             Synch Type               None
             Usage Type               Data
           wMaxPacketSize     0x0200  1x 512 bytes
           bInterval               1
           bRefresh                0
           bSynchAddress           0
           MIDIStreaming Endpoint Descriptor:
             bLength                 5
             bDescriptorType        37
             bDescriptorSubtype      1 (GENERAL)
             bNumEmbMIDIJack         1
             baAssocJackID( 0)       3
         Endpoint Descriptor:
           bLength                 9
           bDescriptorType         5
           bEndpointAddress     0x04  EP 4 OUT
           bmAttributes            3
             Transfer Type            Interrupt
             Synch Type               None
             Usage Type               Data
           wMaxPacketSize     0x0010  1x 16 bytes
           bInterval               4
           bRefresh                0
           bSynchAddress           0
           MIDIStreaming Endpoint Descriptor:
             bLength                 5
             bDescriptorType        37
             bDescriptorSubtype      1 (GENERAL)
             bNumEmbMIDIJack         1
             baAssocJackID( 0)       1
   Device Qualifier (for other device speed):
     bLength                10
     bDescriptorType         6
     bcdUSB               2.00
     bDeviceClass            0
     bDeviceSubClass         0
     bDeviceProtocol         0
     bMaxPacketSize0        64
     bNumConfigurations      1
   Device Status:     0x0001
     Self Powered

   ---
   Best wishes,
   Roman
