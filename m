Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0127C39A548
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 18:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56B3E1703;
	Thu,  3 Jun 2021 18:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56B3E1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622736337;
	bh=YB/GdOGTjonzEpjJLGFigY3Yn/1SALxvie/C6zmrN7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kn81AQBJ8zQUxvR4YbwJFcAijZH/bcT5QuAaPKBRx2Z1wdddcyqcf6Q/1vKe7zOub
	 81bdcferhrSxCp8yTuZuMF1k9etawP9eM8helopk/zr28znU5yBQ+qG79bshOmMuO3
	 n0mA6jNwilO6JxTzTQpEKb2TB6g1IecCD91ydG/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F82F80103;
	Thu,  3 Jun 2021 18:04:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD652F80254; Thu,  3 Jun 2021 18:04:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85098F80100
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 18:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85098F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fqh4GTpW"
Received: by mail-qv1-xf35.google.com with SMTP id u14so543619qvq.6
 for <alsa-devel@alsa-project.org>; Thu, 03 Jun 2021 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vPEJrVfuEsCiU+nCIYrC+HFzmoDma7FPAo6s7QFmt9M=;
 b=fqh4GTpWrVvyZe9MCBWiXi015AxkKhseMBPy93UmueROEC45Jl0WKXV6bHq3Y/fTRm
 TUQQhjHa7nEAeo5XEv0hweT7184oabn4StTytyiAFZo9WI8m6Gc/9NVc1fMDLMnov/E7
 VeQo1lZORCqt2D0sgwtYhJe7wc9IT3gGJpdxc7cbRhjxpef3ThUahHrcGJrFzkvvJ+f+
 r3Y44hTAR6b/HI9uHZB4z7h/Z3S4m3J0iMOFTjvXQ9dk5gRldUCCB/TWEpdKKiN9Y4pH
 bm07sNSdNAwQm+OCgsT4oulragxH0B/gj4e4vgPLY/esAtxESW0tTJQ37NWdoRrOFbpi
 pjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPEJrVfuEsCiU+nCIYrC+HFzmoDma7FPAo6s7QFmt9M=;
 b=lxxLq1SGbqGh6dp7ebYpLTpL64htD6QK+XE92Lxnb8yLbAleqlGFsAGU5ZCFi/XdYT
 CWv4JN81fwr35nM8L1rIZCQqY9Vrc0j6ls2X/pBvx0lfgwS8EB2PPxALrYU9G1euQ3iv
 NycMu4T1UNFcyzoM11rcePo9MlHAwlOy0YbpAZrTi4yODu07ctHG8goIWBW2mcMkfER4
 cXO/e+R4sZyxt+e1R0HgpJ7N329yP9D3HxJKfSBzkGCPOK92j7FtlgBlKRl9XWpA9piC
 yf53RbX0+dy9yryr2ih8ND7acnb+noYUspdsucGa46OPHWAd9EhAanoyJdOC5ggrrkcj
 yO2Q==
X-Gm-Message-State: AOAM532OgL444jPWM2jAW94pf/pEKbV9fFZsUOQWd/8oGSVDNV21X3wU
 jxcMZlumE2+hGrsoFEEE5zK8IUIU+WEB+T1CQIY=
X-Google-Smtp-Source: ABdhPJxetLGcVI2itCdUF700juEBQlGvvopAw+VQ4lxuvo4MUyPtJ91zmI9z7z8x1YaDi4fZcwqFAO2mDZhYibgGcqQ=
X-Received: by 2002:a0c:c481:: with SMTP id u1mr457485qvi.48.1622736232528;
 Thu, 03 Jun 2021 09:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-8bce8a2c-8808-4f78-8ddd-a71c8a7bc304-1622666145088@3c-app-gmx-bs30>
In-Reply-To: <trinity-8bce8a2c-8808-4f78-8ddd-a71c8a7bc304-1622666145088@3c-app-gmx-bs30>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 3 Jun 2021 12:57:51 -0300
Message-ID: <CAEsQvcui8UNk+NNdjhCdU0i9ru+6q=c4QmKmHxgK_EiOvjNp1w@mail.gmail.com>
Subject: Re: Allen&Heath Xone43C: USB communication
To: Roman <klangrausch@wolke7.net>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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

Hi Roman,

I don't know if you got any response in kernel-devel, I just wanted
you to know that yes, alsa-devel is the correct list for sending
patches to new USB sound device drivers, I see you got a verbose lsusb
and a USB capture of the device's handshake.

If it helps you, for the Pioneer additions you can find the kernel
backlog, correct me if I'm wrong, the key was first adding a section
in sound/usb/quirks-table.h with the correct rate information, EP
numbers, transfer masks, etc.

Please try adding your vendor spec EPs and associated interface number
and altsetting inside sound/usb/quirks-table.h, by creating a new
section.

At this point, you are not creating a new driver per se, but boot with
the extra kernel parameter snd_usb_audio.dyndbg=+p to get extra
debugging information.

I sincerely hope you are not dealing with Pioneer-like gear, because
that would mean a ton of strange cryptographic MIDI SysEx's or bizarre
CONTROL URBs to actually get silent inputs to activate.

Yours,
Geraldo Nascimento


On Wed, Jun 2, 2021 at 5:36 PM Roman <klangrausch@wolke7.net> wrote:
>
>
>    Hello all, hello list,
>    I am not sure whether this is the correct list, since it's not strictly
>    an
>    ALSA affair (fw to kernel-devel). Recent progress on driver support for
>    Pioneer devices encouraged me to dissect USB communication with an
>    Allen&Heath Xone43C, a mixer with USB interface. It does feature 16
>    channels
>    (8 in, 8 out), but only 4 (2 in, 2 out) show up, 2 of which remain
>    automagically
>    silent. There is no linux driver yet, and maybe I can help?
>    Addresses are:
>    0x80    Endpoint 0 (in)
>    0x00    Endpoint 0 (out)
>    0x81    Endpoint 1 (in)    Interface 2.1 and Interface 2.2 (vendor
>    spec)
>    0x02    Endpoint 2 (out)  Interface 1.1 and Interface 1.2 (vendor spec)
>    0x85    Endpoint 5 (in)    Interface 1.1
>    0x83    Endpoint 3 (in)    Interface 3 MIDI
>    0x04    Endpoint 4 (out)  Interface 3 MIDI
>
>    ----------------------------------
>
>    I have a sniff here:
>    https://drive.google.com/file/d/1UPXCN-r7jc9hfm1d-Hip8vckSs2RQNtC/view?
>    usp=sharing
>
>    ---------------------------------
>
>    USB info:
>
>    Bus 001 Device 006: ID 22f0:000f Allen&Heath Xone:43C
>    Device Descriptor:
>      bLength                18
>      bDescriptorType         1
>      bcdUSB               2.00
>      bDeviceClass          239 Miscellaneous Device
>      bDeviceSubClass         2
>      bDeviceProtocol         1 Interface Association
>      bMaxPacketSize0        64
>      idVendor           0x22f0
>      idProduct          0x000f
>      bcdDevice            2.00
>      iManufacturer           1 Allen&Heath
>      iProduct                2 Xone:43C
>      iSerial                 3 no serial number
>      bNumConfigurations      1
>      Configuration Descriptor:
>        bLength                 9
>        bDescriptorType         2
>        wTotalLength       0x0126
>        bNumInterfaces          4
>        bConfigurationValue     1
>        iConfiguration          0
>        bmAttributes         0xc0
>          Self Powered
>        MaxPower                0mA
>        Interface Descriptor:
>          bLength                 9
>          bDescriptorType         4
>          bInterfaceNumber        0
>          bAlternateSetting       0
>          bNumEndpoints           0
>          bInterfaceClass         1 Audio
>          bInterfaceSubClass      1 Control Device
>          bInterfaceProtocol      0
>          iInterface              0
>          AudioControl Interface Descriptor:
>            bLength                11
>            bDescriptorType        36
>            bDescriptorSubtype      1 (HEADER)
>            bcdADC               1.00
>            wTotalLength       0x0035
>            bInCollection           3
>            baInterfaceNr(0)        1
>            baInterfaceNr(1)        2
>            baInterfaceNr(2)        3
>          AudioControl Interface Descriptor:
>            bLength                12
>            bDescriptorType        36
>            bDescriptorSubtype      2 (INPUT_TERMINAL)
>            bTerminalID             1
>            wTerminalType      0x0101 USB Streaming
>            bAssocTerminal          0
>            bNrChannels             2
>            wChannelConfig     0x0003
>              Left Front (L)
>              Right Front (R)
>            iChannelNames           0
>            iTerminal               0
>          AudioControl Interface Descriptor:
>            bLength                 9
>            bDescriptorType        36
>            bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>            bTerminalID             2
>            wTerminalType      0x0602 Digital Audio Interface
>            bAssocTerminal          0
>            bSourceID               1
>            iTerminal               0
>          AudioControl Interface Descriptor:
>            bLength                12
>            bDescriptorType        36
>            bDescriptorSubtype      2 (INPUT_TERMINAL)
>            bTerminalID             3
>            wTerminalType      0x0602 Digital Audio Interface
>            bAssocTerminal          0
>            bNrChannels             2
>            wChannelConfig     0x0003
>              Left Front (L)
>              Right Front (R)
>            iChannelNames           0
>            iTerminal               0
>          AudioControl Interface Descriptor:
>            bLength                 9
>            bDescriptorType        36
>            bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>            bTerminalID             4
>            wTerminalType      0x0101 USB Streaming
>            bAssocTerminal          0
>            bSourceID               3
>            iTerminal               0
>        Interface Descriptor:
>          bLength                 9
>          bDescriptorType         4
>          bInterfaceNumber        1
>          bAlternateSetting       0
>          bNumEndpoints           0
>          bInterfaceClass         1 Audio
>          bInterfaceSubClass      2 Streaming
>          bInterfaceProtocol      0
>          iInterface              0
>        Interface Descriptor:
>          bLength                 9
>          bDescriptorType         4
>          bInterfaceNumber        1
>          bAlternateSetting       1
>          bNumEndpoints           2
>          bInterfaceClass         1 Audio
>          bInterfaceSubClass      2 Streaming
>          bInterfaceProtocol      0
>          iInterface              0
>          AudioStreaming Interface Descriptor:
>            bLength                 7
>            bDescriptorType        36
>            bDescriptorSubtype      1 (AS_GENERAL)
>            bTerminalLink           1
>            bDelay                  1 frames
>            wFormatTag         0x0001 PCM
>          AudioStreaming Interface Descriptor:
>            bLength                11
>            bDescriptorType        36
>            bDescriptorSubtype      2 (FORMAT_TYPE)
>            bFormatType             1 (FORMAT_TYPE_I)
>            bNrChannels             2
>            bSubframeSize           3
>            bBitResolution         24
>            bSamFreqType            1 Discrete
>            tSamFreq[ 0]        48000
>          Endpoint Descriptor:
>            bLength                 9
>            bDescriptorType         5
>            bEndpointAddress     0x02  EP 2 OUT
>            bmAttributes            5
>              Transfer Type            Isochronous
>              Synch Type               Asynchronous
>              Usage Type               Data
>            wMaxPacketSize     0x0126  1x 294 bytes
>            bInterval               4
>            bRefresh                0
>            bSynchAddress         133
>            AudioStreaming Endpoint Descriptor:
>              bLength                 7
>              bDescriptorType        37
>              bDescriptorSubtype      1 (EP_GENERAL)
>              bmAttributes         0x01
>                Sampling Frequency
>              bLockDelayUnits         2 Decoded PCM samples
>              wLockDelay         0x0000
>          Endpoint Descriptor:
>            bLength                 9
>            bDescriptorType         5
>            bEndpointAddress     0x85  EP 5 IN
>            bmAttributes            1
>              Transfer Type            Isochronous
>              Synch Type               None
>              Usage Type               Data
>            wMaxPacketSize     0x0003  1x 3 bytes
>            bInterval               4
>            bRefresh                5
>            bSynchAddress           0
>        Interface Descriptor:
>          bLength                 9
>          bDescriptorType         4
>          bInterfaceNumber        1
>          bAlternateSetting       2
>          bNumEndpoints           1
>          bInterfaceClass       255 Vendor Specific Class
>          bInterfaceSubClass      0
>          bInterfaceProtocol      0
>          iInterface              0
>          Endpoint Descriptor:
>            bLength                 9
>            bDescriptorType         5
>            bEndpointAddress     0x02  EP 2 OUT
>            bmAttributes            5
>              Transfer Type            Isochronous
>              Synch Type               Asynchronous
>              Usage Type               Data
>            wMaxPacketSize     0x0200  1x 512 bytes
>            bInterval               1
>            bRefresh                0
>            bSynchAddress           0
>        Interface Descriptor:
>          bLength                 9
>          bDescriptorType         4
>          bInterfaceNumber        2
>          bAlternateSetting       0
>          bNumEndpoints           0
>          bInterfaceClass         1 Audio
>          bInterfaceSubClass      2 Streaming
>          bInterfaceProtocol      0
>          iInterface              0
>        Interface Descriptor:
>          bLength                 9
>          bDescriptorType         4
>          bInterfaceNumber        2
>          bAlternateSetting       1
>          bNumEndpoints           1
>          bInterfaceClass         1 Audio
>          bInterfaceSubClass      2 Streaming
>          bInterfaceProtocol      0
>          iInterface              0
>          AudioStreaming Interface Descriptor:
>            bLength                 7
>            bDescriptorType        36
>            bDescriptorSubtype      1 (AS_GENERAL)
>            bTerminalLink           4
>            bDelay                  1 frames
>            wFormatTag         0x0001 PCM
>          AudioStreaming Interface Descriptor:
>            bLength                11
>            bDescriptorType        36
>            bDescriptorSubtype      2 (FORMAT_TYPE)
>            bFormatType             1 (FORMAT_TYPE_I)
>            bNrChannels             2
>            bSubframeSize           3
>            bBitResolution         24
>            bSamFreqType            1 Discrete
>            tSamFreq[ 0]        48000
>          Endpoint Descriptor:
>            bLength                 9
>            bDescriptorType         5
>            bEndpointAddress     0x81  EP 1 IN
>            bmAttributes            5
>              Transfer Type            Isochronous
>              Synch Type               Asynchronous
>              Usage Type               Data
>            wMaxPacketSize     0x0126  1x 294 bytes
>            bInterval               4
>            bRefresh                0
>            bSynchAddress           0
>            AudioStreaming Endpoint Descriptor:
>              bLength                 7
>              bDescriptorType        37
>              bDescriptorSubtype      1 (EP_GENERAL)
>              bmAttributes         0x01
>                Sampling Frequency
>              bLockDelayUnits         2 Decoded PCM samples
>              wLockDelay         0x0000
>        Interface Descriptor:
>          bLength                 9
>          bDescriptorType         4
>          bInterfaceNumber        2
>          bAlternateSetting       2
>          bNumEndpoints           1
>          bInterfaceClass       255 Vendor Specific Class
>          bInterfaceSubClass      0
>          bInterfaceProtocol      0
>          iInterface              0
>          Endpoint Descriptor:
>            bLength                 9
>            bDescriptorType         5
>            bEndpointAddress     0x81  EP 1 IN
>            bmAttributes            5
>              Transfer Type            Isochronous
>              Synch Type               Asynchronous
>              Usage Type               Data
>            wMaxPacketSize     0x0200  1x 512 bytes
>            bInterval               1
>            bRefresh                0
>            bSynchAddress           0
>        Interface Descriptor:
>          bLength                 9
>          bDescriptorType         4
>          bInterfaceNumber        3
>          bAlternateSetting       0
>          bNumEndpoints           2
>          bInterfaceClass         1 Audio
>          bInterfaceSubClass      3 MIDI Streaming
>          bInterfaceProtocol      0
>          iInterface              0
>          MIDIStreaming Interface Descriptor:
>            bLength                 7
>            bDescriptorType        36
>            bDescriptorSubtype      1 (HEADER)
>            bcdADC               1.00
>            wTotalLength       0x0041
>          MIDIStreaming Interface Descriptor:
>            bLength                 6
>            bDescriptorType        36
>            bDescriptorSubtype      2 (MIDI_IN_JACK)
>            bJackType               1 Embedded
>            bJackID                 1
>            iJack                   0
>          MIDIStreaming Interface Descriptor:
>            bLength                 6
>            bDescriptorType        36
>            bDescriptorSubtype      2 (MIDI_IN_JACK)
>            bJackType               2 External
>            bJackID                 2
>            iJack                   0
>          MIDIStreaming Interface Descriptor:
>            bLength                 9
>            bDescriptorType        36
>            bDescriptorSubtype      3 (MIDI_OUT_JACK)
>            bJackType               1 Embedded
>            bJackID                 3
>            bNrInputPins            1
>            baSourceID( 0)          2
>            BaSourcePin( 0)         1
>            iJack                   0
>          MIDIStreaming Interface Descriptor:
>            bLength                 9
>            bDescriptorType        36
>            bDescriptorSubtype      3 (MIDI_OUT_JACK)
>            bJackType               2 External
>            bJackID                 4
>            bNrInputPins            1
>            baSourceID( 0)          1
>            BaSourcePin( 0)         1
>            iJack                   0
>          Endpoint Descriptor:
>            bLength                 9
>            bDescriptorType         5
>            bEndpointAddress     0x83  EP 3 IN
>            bmAttributes            2
>              Transfer Type            Bulk
>              Synch Type               None
>              Usage Type               Data
>            wMaxPacketSize     0x0200  1x 512 bytes
>            bInterval               1
>            bRefresh                0
>            bSynchAddress           0
>            MIDIStreaming Endpoint Descriptor:
>              bLength                 5
>              bDescriptorType        37
>              bDescriptorSubtype      1 (GENERAL)
>              bNumEmbMIDIJack         1
>              baAssocJackID( 0)       3
>          Endpoint Descriptor:
>            bLength                 9
>            bDescriptorType         5
>            bEndpointAddress     0x04  EP 4 OUT
>            bmAttributes            3
>              Transfer Type            Interrupt
>              Synch Type               None
>              Usage Type               Data
>            wMaxPacketSize     0x0010  1x 16 bytes
>            bInterval               4
>            bRefresh                0
>            bSynchAddress           0
>            MIDIStreaming Endpoint Descriptor:
>              bLength                 5
>              bDescriptorType        37
>              bDescriptorSubtype      1 (GENERAL)
>              bNumEmbMIDIJack         1
>              baAssocJackID( 0)       1
>    Device Qualifier (for other device speed):
>      bLength                10
>      bDescriptorType         6
>      bcdUSB               2.00
>      bDeviceClass            0
>      bDeviceSubClass         0
>      bDeviceProtocol         0
>      bMaxPacketSize0        64
>      bNumConfigurations      1
>    Device Status:     0x0001
>      Self Powered
>
>    ---
>    Best wishes,
>    Roman
