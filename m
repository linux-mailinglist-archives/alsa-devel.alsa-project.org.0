Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5335157D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 16:04:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6610916A6;
	Thu,  1 Apr 2021 16:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6610916A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617285887;
	bh=xm9XEvpTyuV6JEVym6OWhrKI2OOFkdNyVRAk0Wgz1CI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sSk0THKu9gdC8WIkYAgLJBJ47KyRQYeyrFILy56Gyvoevw3RKfyRAAKtQ/sfcYBIW
	 mLwotHaxDFLVG//awxTdXbfwvnQkylCH2MO1BosVrSkX8VHxXrz9/R7dCXf9CwwieP
	 YqqmSRsmqQWHONbfLUyo69Nz4atw0miVAaD/DzBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC76F8026F;
	Thu,  1 Apr 2021 16:03:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 045E6F8026B; Thu,  1 Apr 2021 16:03:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_147,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B6A2F8013C
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 16:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B6A2F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NtKJvIyV"
Received: by mail-lf1-x12b.google.com with SMTP id v15so3017598lfq.5
 for <alsa-devel@alsa-project.org>; Thu, 01 Apr 2021 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=dP8LAxp6Yw732qaTv4bQ/qrgi09n0c5at7j+ZobUKbs=;
 b=NtKJvIyVO1U5aX6XlwxRcIp0svH44f5elXFrVkrdswHNCC7kp3C1lw5mgO9G5ckzfC
 hO4QI0mcTNiV6jKT08UkhhQVzZT8+fGeovJ94Z387O4QXFpT+8sestdLDbQp1TIqRuvp
 szozJT9JE71rise2cmgR91N3M49/pCdWmimikLX/+fYUH7Z8wCpc4yDxy+DZ7tGBNjpA
 GxRYyfF0uy9gcZDx2vmgzfsyG/CxgsU6dlXj0dIMaBSnU7FXRFLhjffj/uqMZavSdD92
 P3SV4AC5bCl6hamKbcXid8ZVza49zt19kKWV7aXIbLN477U4h4IdpgJXIdAmTcAmmcam
 rVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=dP8LAxp6Yw732qaTv4bQ/qrgi09n0c5at7j+ZobUKbs=;
 b=DGbWt6GwKxppXYYtx7Opjl0R9FPpiIPm12hxjPj3ELNl9j38XbUeM1rehgcvBFUziS
 Ul4skquZTs/dKD6c140YmKbXe0LltOIBQcBt65KtGjh8goKIaXxM+uE+bloK80Aqj30R
 1fHCvGNuJOnh2o7BJFB1hHqYLyNxpURkfUcULNSQNauxhSKP0EABWUTSIibbtcpjJCnd
 qZqHG2eE5px8rTHnDNAatrjsCs8xMxyFKrwwNx/S78W5+uTZPtsZGRz8TDuHjYonc3KX
 2ml9WE+qiu9ehkAQIOuVSfB2UvNdww4fiSTakYa/Y9dTGcTgcB0Du9RwrUCMJo8jU1jM
 RuVQ==
X-Gm-Message-State: AOAM533DLPb9d3QmVNluAB4PzgEGAk4/0jqchrRhqnQLyCFGNbUNJlxB
 kXUWBo23lUdjVszJUBKODjIp8QJKH+5gUNg9KlwvoFMnyhFs1A==
X-Google-Smtp-Source: ABdhPJx4T9iEhN9188YQZrDVJuNiaPCGEDCIawgy+27lxcyfNrGiIEKJG6+u/LVa4E/tdKys6uERnUA5sLEbrtNrvvM=
X-Received: by 2002:ac2:4ed0:: with SMTP id p16mr5528188lfr.623.1617285788316; 
 Thu, 01 Apr 2021 07:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <bug-212477-199243@https.bugzilla.kernel.org/>
 <bug-212477-199243-ikHjKTjwq7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212477-199243-ikHjKTjwq7@https.bugzilla.kernel.org/>
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 1 Apr 2021 15:02:57 +0100
Message-ID: <CABPh3UPucMWt-2d=OMSzJUjWH6exEqXenpHQ-jyD4MWNVrS+Kw@mail.gmail.com>
Subject: Fwd: [Bug 212477] EDIROL UA-101: midi is not recognized
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Anyone can help to debug this?


---------- Forwarded message ---------
From: <bugzilla-daemon@bugzilla.kernel.org>
Date: Thu, 1 Apr 2021 at 07:34
Subject: [Bug 212477] EDIROL UA-101: midi is not recognized
To: <nick83ola@gmail.com>


https://bugzilla.kernel.org/show_bug.cgi?id=212477

--- Comment #2 from Lucas Endres (jaffa225man@gmail.com) ---
I hadn't realized it was working previously as I use my other Edirol UA-4FX
most of the time, but I do remember the UA-101's MIDI not working for me
when I
tried using it too.  Sure, enough, that's the case on debian's
5.9.0-1-rt-amd64
kernel now:

aconnect -l | grep -i ua
client 28: 'UA-4FX' [type=kernel,card=3]
    0 'UA-4FX MIDI 1   '

I would've thought the two Edirol devices would use the same MIDI kernel
module
(snd_seq_midi and/or snd_usbmidi_lib)

lsmod | grep -i snd
snd_seq_dummy          16384  0
snd_ua101              28672  0
snd_seq_midi           20480  0
snd_seq_midi_event     16384  1 snd_seq_midi
snd_seq                90112  4
snd_seq_midi,snd_seq_midi_event,snd_seq_dummy
snd_usb_audio         319488  3
snd_usbmidi_lib        40960  2 snd_usb_audio,snd_ua101
snd_rawmidi            45056  2 snd_seq_midi,snd_usbmidi_lib
snd_seq_device         16384  3 snd_seq,snd_seq_midi,snd_rawmidi
mc                     61440  1 snd_usb_audio
snd_hda_codec_realtek   139264  1
snd_hda_codec_generic    98304  1 snd_hda_codec_realtek
ledtrig_audio          16384  1 snd_hda_codec_generic
snd_hda_codec_hdmi     73728  1
snd_hda_intel          57344  4
snd_intel_dspcfg       24576  1 snd_hda_intel
snd_hda_codec         163840  4
snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec_realtek
snd_hda_core          106496  5
snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek
snd_hwdep              16384  2 snd_usb_audio,snd_hda_codec
snd_pcm               135168  7
snd_hda_codec_hdmi,snd_hda_intel,snd_usb_audio,snd_hda_codec,snd_ua101,snd_hda_core
snd_hrtimer            16384  1
snd_timer              45056  4 snd_seq,snd_hrtimer,snd_pcm
snd                   110592  27
snd_hda_codec_generic,snd_seq,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_usb_audio,snd_usbmidi_lib,snd_hda_codec,snd_hda_codec_realtek,snd_ua101,snd_timer,snd_pcm,snd_rawmidi
soundcore              16384  1 snd
usbcore               323584  10
xhci_hcd,ehci_pci,snd_usb_audio,usbhid,snd_usbmidi_lib,snd_ua101,usb_storage,ehci_hcd,xhci_pci,uas


lsusb -vvv
Bus 004 Device 003: ID 0582:007d Roland Corp. EDIROL UA-101
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0
  bDeviceProtocol       255
  bMaxPacketSize0        64
  idVendor           0x0582 Roland Corp.
  idProduct          0x007d EDIROL UA-101
  bcdDevice            1.03
  iManufacturer           1 EDIROL
  iProduct                2 UA-101
  iSerial                 3 AX85615
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x009b
    bNumInterfaces          3
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
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      2
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      2
      iInterface              0
      ** UNRECOGNIZED:  07 24 01 01 00 01 00
      ** UNRECOGNIZED:  0b 24 02 01 0a 04 18 01 80 bb 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0118  1x 280 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      2
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      2
      iInterface              0
      ** UNRECOGNIZED:  07 24 01 07 00 01 00
      ** UNRECOGNIZED:  0b 24 02 01 0c 04 18 01 80 bb 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x0150  1x 336 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      3
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      3
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1

Bus 002 Device 004: ID 0582:00a3 Roland Corp. EDIROL UA-4FX
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0
  bDeviceProtocol       255
  bMaxPacketSize0         8
  idVendor           0x0582 Roland Corp.
  idProduct          0x00a3 EDIROL UA-4FX
  bcdDevice            1.00
  iManufacturer           1 EDIROL
  iProduct                2 UA-4FX
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00ca
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              360mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      2
      bInterfaceProtocol      2
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      2
      bInterfaceProtocol      2
      iInterface              0
      ** UNRECOGNIZED:  07 24 01 01 00 01 00
      ** UNRECOGNIZED:  0b 24 02 01 02 03 18 01 80 bb 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x0140  1x 320 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      2
      bInterfaceProtocol      2
      iInterface              0
      ** UNRECOGNIZED:  07 24 01 02 00 01 20
      ** UNRECOGNIZED:  0b 24 02 03 02 03 18 01 80 bb 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x0138  1x 312 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      2
      bInterfaceProtocol      1
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      2
      bInterfaceProtocol      1
      iInterface              0
      ** UNRECOGNIZED:  07 24 01 07 00 01 00
      ** UNRECOGNIZED:  0b 24 02 01 02 03 18 01 80 bb 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0140  1x 320 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      3
      bInterfaceProtocol      0
      iInterface              0
      ** UNRECOGNIZED:  06 24 f1 02 01 01
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      3
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               1

I, too, would be glad to help however possible, but don't know where to
begin.
I have the source for the latest mainline kernel (5.11.9), so I'd be happy
to
test proposed patches.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.
