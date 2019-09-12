Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D20B124E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 17:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2986D176A;
	Thu, 12 Sep 2019 17:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2986D176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568302607;
	bh=kb7cgoCzkhAKyH34tGKNbrgtdsrR3NH6iqKlEXb5xtY=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=Ias5NfHQOL6kBvOBqmW45J6/YWJKfxKkQ6ghvgpTbOoVuhd2Xy9DDNktZ+OZMKT7I
	 3H4EB3UUh2E6BLHCjZ9QY1rmjU3GcxCNlfuL5SJs7L4BG6bG5ma4NwbazggfbkYEgJ
	 R5c87NYfBKmni1e1Z+FHUxnH7PvoORst/IbgX1QY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7125BF80368;
	Thu, 12 Sep 2019 17:35:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D2C5F80368; Thu, 12 Sep 2019 17:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sonic309-24.consmr.mail.ir2.yahoo.com
 (sonic309-24.consmr.mail.ir2.yahoo.com [77.238.179.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A3ECF801ED
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 17:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A3ECF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="Fg8/W/C6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1568302493; bh=yVJSG/iJeUseDUCNEwv3bgQlBB2HvJbmksnv6LhD41E=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=Fg8/W/C6K0UqbPEbFpx6plggB/oJwNuLB+TxMqoGYh+DbnIamqVNneJJb4+U9dcl59l0wpC5MSkCFm6VeonP6JKyhw54ehLPqm9Rq8OtGRKTW6VOc2/QqGGAjBRZe57m6tIDW7vbZLvY/FASpsTWFf0u0zuEQ4ISKgAVdD95QbfbgVDX8e3vYyhzc3VIy1DbmawKBEF7Io0UJptKBaHAH3WDPOSdPjGU6MDW81PV4OcfcVldpen2dqWKtv5BNRc0ZQz450gxaoT+4IhJjwIb0MENfZz5/QPDUk3JsY++emwWDcDl2sudzgu7cWDzw8W/pPIjJaImLiYD9rQ2J/S9Ww==
X-YMail-OSG: N7pv7cIVM1lToWH0TBj0vEeBuvFFd68Wr3AhdaRdk_TILZvgeSee0C.u3f8.iDG
 nb4ABdAkQrIPBeND02ePtEUeJ9f68i82zmPXqIt96rUFtZbTA8GyAJU2SxjoVWIcXndGNsTaMrh5
 ihKUMBvVtAfmK8luu_Hne5RLUhEjjLEZQ9v1OLp1lErxJqgo38hOXPMCpwIjImKmr3wVcvYF2wLL
 PVmrVJS2RiRoV8cqwowjpaes9TUkq5vvWj_yDfI6.twUT369hKVJdq_m15ArcONDmT4.FlCDYE9P
 oHvud1PXBP3C3Zqglr8dX1UqMz59uvgq_4A_hDXtuuUhj9Q0yt5qDQnwnyTpLdYNtAcKqfuURpL3
 5xA0y8oKg4ZPN0QFMoD.eBmm95em.pm_IRLA2u_Xw7JuBuOatDj3HHniHd14rPucVxz4yEUex5lw
 sAqHPiQ9Lt1SjbmpAqNDzZevrdpssVKUWNYWALkjD0sl6r60PCzlqHvhDW2fgDeUnY80gCpooTXe
 U.GXaYva9BsmCBUOwydJwGnOTVtahtcplL9MzVtJrC5lFWzmij60yCRYRZLwx96CBJ28oR1qHZqI
 0am1uvTARbzk9VW9CK59fwkvR36fUas1mAezGRaeYCVv8WIHF6eN4aIVNZNsxpemlqc05HFJm7ll
 XiTAhp9Nca0SApND_0NHtVEqYd4KBXbpibJldu5L70XMqVIITrCc_vT07FoZqNpcM_faH9QdxJzX
 8AYDx92XU5mW5PkAYmQskXmLSniJ99B_a16OnCuz_bLr_tcWOdOG9FfLXEAIur4hdMVUlG.HJQ3j
 U4yJgs0QZNhxs4kXYUY4DXXKLkqgFsVqWAG8JK4i6BtbdHapET0IXQaoQnTtRIygKWIVozpFemae
 fhnrjCVd6uP9WYNNJzqgIzmvhmnN4_hYydcBbDbk1tbOgmCTKb_o9ApzR6dt02gDHcIu_6aeKohL
 cM0V8aMyyDRcjrTIIjHblRXP8YBdojQ53b7zFXJO.H9bI3FRIhrBcCechqg6gKA2FLcIMMqnkZfc
 Li6gwGgSyCTjVBaLHKOr05XXfpSZuLThKqa2lkc3LqeOAuBJyqn1nijg_sF1f88VRM7QbmV817Ng
 0hlByRfcojWfwT1Oqj1.8h6BzfpiH47enjOdHtTYGFInxXBLsLyJ8HLhqgfUl3b8IhY6W1nRH5GA
 tWgoCFKEeuaZh2g2S6C_vXhNFrKXyMwLh4qN4552musppxWJ6enOdgF1Q8J.MFCPFZFG7OAPsJxl
 9BcQjgUh7rVTNuxtd6KJYxqmGLzBd50Nms1v_EXBe5xKx1.fdbGF2ubyefIo1eBcWDtaO579MoXf
 yYEMMMx9w7Q--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ir2.yahoo.com with HTTP; Thu, 12 Sep 2019 15:34:53 +0000
Date: Thu, 12 Sep 2019 15:34:49 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <593282117.8695389.1568302489535@mail.yahoo.com>
In-Reply-To: <e9f48f93-6974-5dde-61dc-1d6d8dc4260f@ladisch.de>
References: <1000767908.8406503.1568280868516@mail.yahoo.com>
 <e9f48f93-6974-5dde-61dc-1d6d8dc4260f@ladisch.de>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] alsa compliance test: H340 (USB audio) playback /
 capture rate asymmetry bug?
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
Reply-To: htl10@users.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 On Thursday, 12 September 2019, 16:23:04 BST, Clemens Ladisch <clemens@ladisch.de> wrote:


Hin-Tak Leung wrote:

> > ID 046d:0a38 Logitech, Inc. Headset H340

> Please show the output of "lsusb -v" for this device.

Here it is - not sure about the "can't get device qualifier" "... debug descriptor" part just before the end. The head set seems to work okay as a consumer device; for our application/usage, in general, we like devices to have capture / playback rate agreeing, even if both are off.

# lsusb -v -d 046d:0a38

Bus 001 Device 094: ID 046d:0a38 Logitech, Inc. Headset H340
Device Descriptor:
 bLength 18
 bDescriptorType 1
 bcdUSB 2.00
 bDeviceClass 0 
 bDeviceSubClass 0 
 bDeviceProtocol 0 
 bMaxPacketSize0 64
 idVendor 0x046d Logitech, Inc.
 idProduct 0x0a38 Headset H340
 bcdDevice 1.15
 iManufacturer 1 Logitech Inc.
 iProduct 2 Logitech USB Headset H340
 iSerial 0 
 bNumConfigurations 1
 Configuration Descriptor:
 bLength 9
 bDescriptorType 2
 wTotalLength 0x00eb
 bNumInterfaces 4
 bConfigurationValue 1
 iConfiguration 0 
 bmAttributes 0x80
 (Bus Powered)
 MaxPower 120mA
 Interface Descriptor:
 bLength 9
 bDescriptorType 4
 bInterfaceNumber 0
 bAlternateSetting 0
 bNumEndpoints 0
 bInterfaceClass 1 Audio
 bInterfaceSubClass 1 Control Device
 bInterfaceProtocol 0 
 iInterface 0 
 AudioControl Interface Descriptor:
 bLength 10
 bDescriptorType 36
 bDescriptorSubtype 1 (HEADER)
 bcdADC 1.00
 wTotalLength 0x004f
 bInCollection 2
 baInterfaceNr(0) 1
 baInterfaceNr(1) 2
 AudioControl Interface Descriptor:
 bLength 12
 bDescriptorType 36
 bDescriptorSubtype 2 (INPUT_TERMINAL)
 bTerminalID 2
 wTerminalType 0x0101 USB Streaming
 bAssocTerminal 0
 bNrChannels 2
 wChannelConfig 0x0003
 Left Front (L)
 Right Front (R)
 iChannelNames 0 
 iTerminal 0 
 AudioControl Interface Descriptor:
 bLength 12
 bDescriptorType 36
 bDescriptorSubtype 2 (INPUT_TERMINAL)
 bTerminalID 1
 wTerminalType 0x0201 Microphone
 bAssocTerminal 0
 bNrChannels 2
 wChannelConfig 0x0003
 Left Front (L)
 Right Front (R)
 iChannelNames 0 
 iTerminal 0 
 AudioControl Interface Descriptor:
 bLength 9
 bDescriptorType 36
 bDescriptorSubtype 3 (OUTPUT_TERMINAL)
 bTerminalID 3
 wTerminalType 0x0101 USB Streaming
 bAssocTerminal 0
 bSourceID 10
 iTerminal 0 
 AudioControl Interface Descriptor:
 bLength 9
 bDescriptorType 36
 bDescriptorSubtype 3 (OUTPUT_TERMINAL)
 bTerminalID 4
 wTerminalType 0x0301 Speaker
 bAssocTerminal 0
 bSourceID 5
 iTerminal 0 
 AudioControl Interface Descriptor:
 bLength 10
 bDescriptorType 36
 bDescriptorSubtype 6 (FEATURE_UNIT)
 bUnitID 5
 bSourceID 2
 bControlSize 1
 bmaControls(0) 0x01
 Mute Control
 bmaControls(1) 0x02
 Volume Control
 bmaControls(2) 0x02
 Volume Control
 iFeature 0 
 AudioControl Interface Descriptor:
 bLength 10
 bDescriptorType 36
 bDescriptorSubtype 6 (FEATURE_UNIT)
 bUnitID 6
 bSourceID 1
 bControlSize 1
 bmaControls(0) 0x03
 Mute Control
 Volume Control
 bmaControls(1) 0x00
 bmaControls(2) 0x00
 iFeature 0 
 AudioControl Interface Descriptor:
 bLength 7
 bDescriptorType 36
 bDescriptorSubtype 5 (SELECTOR_UNIT)
 bUnitID 10
 bNrInPins 1
 baSourceID(0) 6
 iSelector 0 
 Interface Descriptor:
 bLength 9
 bDescriptorType 4
 bInterfaceNumber 1
 bAlternateSetting 0
 bNumEndpoints 0
 bInterfaceClass 1 Audio
 bInterfaceSubClass 2 Streaming
 bInterfaceProtocol 0 
 iInterface 0 
 Interface Descriptor:
 bLength 9
 bDescriptorType 4
 bInterfaceNumber 1
 bAlternateSetting 1
 bNumEndpoints 2
 bInterfaceClass 1 Audio
 bInterfaceSubClass 2 Streaming
 bInterfaceProtocol 0 
 iInterface 0 
 AudioStreaming Interface Descriptor:
 bLength 7
 bDescriptorType 36
 bDescriptorSubtype 1 (AS_GENERAL)
 bTerminalLink 2
 bDelay 1 frames
 wFormatTag 0x0001 PCM
 AudioStreaming Interface Descriptor:
 bLength 11
 bDescriptorType 36
 bDescriptorSubtype 2 (FORMAT_TYPE)
 bFormatType 1 (FORMAT_TYPE_I)
 bNrChannels 2
 bSubframeSize 2
 bBitResolution 16
 bSamFreqType 1 Discrete
 tSamFreq[ 0] 44100
 Endpoint Descriptor:
 bLength 9
 bDescriptorType 5
 bEndpointAddress 0x01 EP 1 OUT
 bmAttributes 5
 Transfer Type Isochronous
 Synch Type Asynchronous
 Usage Type Data
 wMaxPacketSize 0x00c8 1x 200 bytes
 bInterval 1
 bRefresh 0
 bSynchAddress 131
 AudioStreaming Endpoint Descriptor:
 bLength 7
 bDescriptorType 37
 bDescriptorSubtype 1 (EP_GENERAL)
 bmAttributes 0x00
 bLockDelayUnits 0 Undefined
 wLockDelay 0x0000
 Endpoint Descriptor:
 bLength 9
 bDescriptorType 5
 bEndpointAddress 0x83 EP 3 IN
 bmAttributes 1
 Transfer Type Isochronous
 Synch Type None
 Usage Type Data
 wMaxPacketSize 0x0003 1x 3 bytes
 bInterval 1
 bRefresh 5
 bSynchAddress 0
 Interface Descriptor:
 bLength 9
 bDescriptorType 4
 bInterfaceNumber 2
 bAlternateSetting 0
 bNumEndpoints 0
 bInterfaceClass 1 Audio
 bInterfaceSubClass 2 Streaming
 bInterfaceProtocol 0 
 iInterface 0 
 Interface Descriptor:
 bLength 9
 bDescriptorType 4
 bInterfaceNumber 2
 bAlternateSetting 1
 bNumEndpoints 1
 bInterfaceClass 1 Audio
 bInterfaceSubClass 2 Streaming
 bInterfaceProtocol 0 
 iInterface 0 
 AudioStreaming Interface Descriptor:
 bLength 7
 bDescriptorType 36
 bDescriptorSubtype 1 (AS_GENERAL)
 bTerminalLink 3
 bDelay 1 frames
 wFormatTag 0x0001 PCM
 AudioStreaming Interface Descriptor:
 bLength 11
 bDescriptorType 36
 bDescriptorSubtype 2 (FORMAT_TYPE)
 bFormatType 1 (FORMAT_TYPE_I)
 bNrChannels 2
 bSubframeSize 2
 bBitResolution 16
 bSamFreqType 1 Discrete
 tSamFreq[ 0] 44100
 Endpoint Descriptor:
 bLength 9
 bDescriptorType 5
 bEndpointAddress 0x81 EP 1 IN
 bmAttributes 5
 Transfer Type Isochronous
 Synch Type Asynchronous
 Usage Type Data
 wMaxPacketSize 0x00c8 1x 200 bytes
 bInterval 1
 bRefresh 0
 bSynchAddress 0
 AudioStreaming Endpoint Descriptor:
 bLength 7
 bDescriptorType 37
 bDescriptorSubtype 1 (EP_GENERAL)
 bmAttributes 0x00
 bLockDelayUnits 0 Undefined
 wLockDelay 0x0000
 Interface Descriptor:
 bLength 9
 bDescriptorType 4
 bInterfaceNumber 3
 bAlternateSetting 0
 bNumEndpoints 1
 bInterfaceClass 3 Human Interface Device
 bInterfaceSubClass 0 
 bInterfaceProtocol 0 
 iInterface 0 
 HID Device Descriptor:
 bLength 9
 bDescriptorType 33
 bcdHID 1.11
 bCountryCode 0 Not supported
 bNumDescriptors 1
 bDescriptorType 34 Report
 wDescriptorLength 111
 Report Descriptors: 
 ** UNAVAILABLE **
 Endpoint Descriptor:
 bLength 7
 bDescriptorType 5
 bEndpointAddress 0x84 EP 4 IN
 bmAttributes 3
 Transfer Type Interrupt
 Synch Type None
 Usage Type Data
 wMaxPacketSize 0x0004 1x 4 bytes
 bInterval 10
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
Device Status: 0x0000
 (Bus Powered)
#  
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
