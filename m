Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5120C869A4D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 16:25:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B582786F;
	Tue, 27 Feb 2024 16:25:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B582786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709047554;
	bh=AohK2DmgGnFCSYoKFAdy8M3dzobQXsdPlazsUIDm4dI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IWx4UcpoZ6WE6XeYrj1cXs12SVmudeKN6REntGkyHrJY0NDfC8usxIaEaADuEEwcH
	 mLnGJ6qUj5FDQ9SCtHpt8p332hzc90l/KuKkMvTbt/t7+KKtJDFosybPSWez6jJAz+
	 K0swPJlhNeCYZxVe5qOBAr6NY1GHEJBnB+JX76rc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C329F805AA; Tue, 27 Feb 2024 16:25:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E10ECF80423;
	Tue, 27 Feb 2024 16:25:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77F45F801C0; Tue, 27 Feb 2024 16:25:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53D26F8013D
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 16:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53D26F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bk9L8pka
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso495387966b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709047508; x=1709652308;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmhlHWfIXqKHxF7CMboBzxGVho/Q/dhfh02qAGrAN9Q=;
        b=bk9L8pkaXCPdXPMn0SdVQEofglLFg4H7PxJ0AIelfl/wqewYV6LfTu61csR21xQix7
         SIdAlRyEZZMEUirvXZkHp4YCpURYWWQCiPIRQeR008s17FCHAb/FwvxsxeSCrnDV/5To
         zJPyLHOZEgTM+hVeh8yO7RA6ztUE1uNnw9dLaG1QzqG4p2CYAjMHaWH2KEH31iKsRWFI
         m2a/XGVD+XHXJAtgZFpTzHnrFu9cvtbD/iB4hYnr61mTlp0KL2SyssdGv/BC6UgeOBYj
         KEQEvqwuNmKEp4rWDp6zab04NW/CTw20s2uIDktkkHeZ7lzPfKwJO1pmkt5EvWIpEIbu
         Bs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709047508; x=1709652308;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmhlHWfIXqKHxF7CMboBzxGVho/Q/dhfh02qAGrAN9Q=;
        b=u70lDVBLJJ++4Y5wZJ8Ge3TLSKxzjae28fcofmkFkseay3QlbxvBV8aV7KirqGp/fG
         DXM0QdqsB6rPSBe5ZJIBfEf5BxWNIUt6VH6558wFcazSYw1ISqekzbZiEwo0UtjcyARJ
         Wj02A6SWjV+xMkh//uHX9p76UFvvHQFN1ys53YiNNPuMv+K+DP8ej2muNJj/N6gTAA5j
         kU0Jbbvb0M6Safg9TYg5/gD9UdVeYDnTvLhq5wRfzCOnJ8gwmz9zLv3lYrV0L/wFTCxB
         CPXf8ICJQVPiy6Pqu5rAbUPtDS08tbO9l/OgCNd5AnvkFgRzsgHndCR5mLorAnyaWkuD
         xJ0w==
X-Gm-Message-State: AOJu0YyZ37ttFBFk1WzO0aeoTV5WipgmaAZmbPzurvfY0T9gbg4Bmtsg
	qFk+UvyAWurnlxEO1eOSeP5L4SJUT2qq1nSGcXZQgwpzfJ/cJ1Xz+u0y3CBpbkASar19onwf9kK
	NfVyRReJXetg1mRk964XvcMylNMM31ijfsQ==
X-Google-Smtp-Source: 
 AGHT+IFE91zSO1gPhWQzTInCsK0VTTQm4XTAYfx6EGAty2+B7igGMeCVrxe+IsQ7DmTImgUUAmPWrV9dHHtQeFuL/yU=
X-Received: by 2002:a17:906:3a89:b0:a3e:b188:fcf3 with SMTP id
 y9-20020a1709063a8900b00a3eb188fcf3mr6110225ejd.48.1709047507829; Tue, 27 Feb
 2024 07:25:07 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
In-Reply-To: 
 <CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
From: Ian Malone <ibmalone@gmail.com>
Date: Tue, 27 Feb 2024 15:24:55 +0000
Message-ID: 
 <CAL3-7Mpj5+9WwNd30aW3cFih5S5H5hMTYfAQ5gwuLFkP2Qe1gQ@mail.gmail.com>
Subject: Re: synaptics hi-res audio usb device duplex, usb bandwidth issues
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: HTN42NGZMQNILNKHTCVN37MHXAI746NI
X-Message-ID-Hash: HTN42NGZMQNILNKHTCVN37MHXAI746NI
X-MailFrom: ibmalone@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTN42NGZMQNILNKHTCVN37MHXAI746NI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As an additional datapoint on this issue, I fired up an ancient copy
of Windows 7 on the T420 and in that OS, testing with Zoom (with
webcam running) shows duplex sound working with the Conexant Systems
(Rockwell) device, so it's definitely possible with the hardware.

On Mon, 26 Feb 2024 at 13:05, Ian Malone <ibmalone@gmail.com> wrote:
>
> Hi,
>
> In short I have a USB to 3.5mm adapter which seems not to work in
> duplex mode on USB2.0 systems, possibly due to a bandwidth calculation
> bug.
>
> This is an evolution of an issue I previously posted on the users list
> with no luck. I have an Anker USB-C to 3.5mm audio dongle (lsusb:
> Conexant Systems (Rockwell), Inc. Hi-Res Audio) which I've used for
> some time on my phone (Android with USB-3.2). On trying to use it with
> an older T420 laptop recently with only USB-2.0 ports I discovered it
> will not work in duplex mode. Input-only and output-only profiles work
> (tested recording and playback with audacity), but with duplex no
> sound is recorded (Fedora 39, pipewire). This is easily reproduced by
> looking at the pavucontrol volume monitor for Output Devices, if I
> switch the device to Analog or Digital Input in configuration then the
> Input Devices level monitor for it shows activity if I speak into or
> tap the microphone. With duplex selected there is no activity, the
> level monitor bar may or may not display. I can switch between the two
> behaviours by changing the profile. Various applications such as
> Audacity and Zoom appear to hang when accessing this microphone with
> the duplex profile set. I've used pipewire configuration to force the
> format to 16LE only (playback and recording), but this has not helped.
>
> In dmesg this error appears when this happens (microphone opened, for
> example by pavucontrol):
> [  294.825544] usb 1-1.1: cannot submit urb 0, error -28: not enough bandwidth
> (T420, Fedora 39, kernel 6.7.5)
>
> The T420 has USB 2 Type A ports, so a Type C to Type A adapter is
> needed, but the problem is not limited to the T420 laptop. On an older
> Samsung Tablet (Tab-A 2019, USB-2.0 Type C, kernel 4.4.177) I've been
> able to test using Google Meet. Although there are no errors or
> freezing observed, in headphone mode over USB the headphone microphone
> is not being used and the tablet uses its onboard microphone instead
> (although headphones are selected and playback is over the
> headphones). Again, I can record (via voice recorder) from the headset
> microphone, just no duplex. Trying google meet on my phone (USB3.2) I
> do get duplex over the USB-3.5 adapter.
>
> On a newer laptop with USB-3.2 and a mix of type A and C ports I also
> get duplex (F37, kernel 6.5.12), however dmesg shows even here not all
> is well, using the type A and C ports on the side:
>
> [ 9172.326602] usb 3-1: new full-speed USB device number 6 using xhci_hcd
> [ 9172.490169] usb 3-1: New USB device found, idVendor=0572,
> idProduct=1b08, bcdDevice= 0.10
> [ 9172.490174] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [ 9172.490177] usb 3-1: Product: Hi-Res Audio
> [ 9172.490178] usb 3-1: Manufacturer: Synaptics
> [ 9172.490180] usb 3-1: SerialNumber: 000000000000000000000000
> [ 9172.683435] input: Synaptics Hi-Res Audio as
> /devices/pci0000:00/0000:00:08.1/0000:05:00.4/usb3/3-1/3-1:1.3/0003:0572:1B08.000A/input/input36
> [ 9172.736025] hid-generic 0003:0572:1B08.000A: input,hidraw5: USB HID
> v1.11 Device [Synaptics Hi-Res Audio] on usb-0000:05:00.4-1/input3
> [ 9173.386988] usb 3-1: Not enough bandwidth for new device state.
> [ 9173.386994] usb 3-1: Not enough bandwidth for altsetting 1
> [ 9173.386996] endpoint_set_interface: 70 callbacks suppressed
> [ 9173.386998] usb 3-1: 1:1: usb_set_interface failed (-28)
> [ 9173.387110] usb 3-1: Not enough bandwidth for new device state.
> [ 9173.387113] usb 3-1: Not enough bandwidth for altsetting 1
> (...these 3 lines repeat 9 more times, followed by...)
> [ 9173.388785] usb 3-1: Not enough bandwidth for new device state.
> [ 9173.388789] usb 3-1: Not enough bandwidth for altsetting 1
> (...these 2 lines repeat 5 more times, then stop)
>
> This is a USB3.2 system, the onboard camera has a hardware switch, so
> I can disable it, and the only other peripheral that appears is the
> AX210 bluetooth (I'd thought that would have its own bus as it's part
> of a separate wifi chip, but apparently not, lsusb -t below),
> bandwidth for even a 96kHz 24bit duplex audio device shouldn't really
> be an issue.
> $ lsusb
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 003: ID 8087:0032 Intel Corp. AX210 Bluetooth
> Bus 003 Device 002: ID 048d:c965 Integrated Technology Express, Inc.
> ITE Device(8295)
> Bus 003 Device 007: ID 0572:1b08 Conexant Systems (Rockwell), Inc. Hi-Res Audio
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 002: ID 0bda:0411 Realtek Semiconductor Corp. Hub
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 004: ID 048d:c101 Integrated Technology Express, Inc.
> ITE Device(8910)
> Bus 001 Device 002: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> $ lsusb -t
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     |__ Port 1: Dev 7, If 0, Class=Audio, Driver=snd-usb-audio, 12M
>     |__ Port 1: Dev 7, If 1, Class=Audio, Driver=snd-usb-audio, 12M
>     |__ Port 1: Dev 7, If 2, Class=Audio, Driver=snd-usb-audio, 12M
>     |__ Port 1: Dev 7, If 3, Class=Human Interface Device, Driver=usbhid, 12M
>     |__ Port 3: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>     |__ Port 3: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M
>     |__ Port 4: Dev 3, If 0, Class=Wireless, Driver=btusb, 12M
>     |__ Port 4: Dev 3, If 1, Class=Wireless, Driver=btusb, 12M
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
>     |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>     |__ Port 4: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>
>
> The only situation in which I *don't* get these dmesg errors is if I
> use one of the rear USB 3.2 ports that seem to lead to it being on its
> own bus:
> $ lsusb -t
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     |__ Port 3: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>     |__ Port 3: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M
>     |__ Port 4: Dev 3, If 0, Class=Wireless, Driver=btusb, 12M
>     |__ Port 4: Dev 3, If 1, Class=Wireless, Driver=btusb, 12M
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
>     |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 2: Dev 7, If 0, Class=Audio, Driver=snd-usb-audio, 12M
>         |__ Port 2: Dev 7, If 1, Class=Audio, Driver=snd-usb-audio, 12M
>         |__ Port 2: Dev 7, If 2, Class=Audio, Driver=snd-usb-audio, 12M
>         |__ Port 2: Dev 7, If 3, Class=Human Interface Device,
> Driver=usbhid, 12M
>     |__ Port 4: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>
> In this case the dmesg output is clear after device connection. This
> seems like some kind of bandwidth calculation problem in
> snd_usb_audio. I've tried building a kernel and modifying various of
> the defines in sound/usb/card.h (currently MAX_PACKS 4 and
> MAX_PACKS_HS (MAX_PACKS * 4), compared to 6 and *8) but not hit on a
> winning formula yet. Is there any information I could collect to try
> to fix this?

-- 
imalone
