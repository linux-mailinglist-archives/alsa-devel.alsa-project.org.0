Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D55338675FF
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 14:06:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5293C832;
	Mon, 26 Feb 2024 14:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5293C832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708952819;
	bh=NqJ0nIcutwscC0HUaKDzalEPE5moAw79Wo5YrvoIkuI=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C9eyDUuSLI6GrEnek8GbY4TamZBMFOE4qse5SvOfmv+FRM0k6UXzqfw+qKrub7drp
	 au8jj/p5L9pP/VYA9P/fAwPSpl5UrClB1gbw3gghkEsNTySVlSo7SM/cbzKekU85YX
	 +U+ue71dbOlAEeocRSdA5jhWJyTu/2OVV3wAteJw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB1BAF80580; Mon, 26 Feb 2024 14:06:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFDF8F80246;
	Mon, 26 Feb 2024 14:06:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6FE9F80246; Mon, 26 Feb 2024 14:06:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F98EF8012B
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 14:06:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F98EF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T4l/+ftx
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so2212233a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Feb 2024 05:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708952764; x=1709557564;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f6tL7xN5LKTOqn+wPvNd33f8BV4bBEkrbFJ+fq+alSk=;
        b=T4l/+ftxlqMZ0aIm4PA1Tr3WDWN799aoPZ22IM5FA3sWCUNwBabhJKWM5li0kp5uzc
         ywOD3Th6cdeTjOmJDbIwuPTb06jgDmSfOn5XNSF7W57XcabQUWphmfYS900dz2nayrGT
         C8+JDGkfEYc7RYJ8JnYKSaJXa1VSQFbh2+crNys2q+2mDyKB5QXpNWrzFfMuOc855cjS
         2m/aMPrRSlREAymcxmHrnD428ERFUXhaBO1/sh2DuUMAp13ON4I9Oa+f5MhqggxuIynj
         u07LMBxyHfYNtUI5NDLqVtK09sSTFh+NIQcJDNmwdsxoE3PoXI70gn+lAeIlbFE0V8w1
         4rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952764; x=1709557564;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6tL7xN5LKTOqn+wPvNd33f8BV4bBEkrbFJ+fq+alSk=;
        b=n7cV3KWJYmE4frI7z2A34eniJciFt5Lg2Z8SH2UnbbtCig3EbyKjgUi+MJUaaR9A38
         5zALhoNdQ/OvPlRxMzHETTJuXE2s6OAWd411Wjl85pr2kodSiMsp2h93bCXr2+WcSKTJ
         JxcNhGwB0XEZwTTOaz5RSzyhOlvzkEiT4n+68rbdingRD0IYxH5JtwaCPqKiHM0iU9bf
         2gefPZBL20lGd4FOk5qhCv93T9Ivfvc2apO6HW1OsrSFj81qqSKXPe2xmYSx2fmSgB6p
         4a40SViRDw2E29EMeBzF6rl/ZpKJvEIU26BAQVJKWBdD1aNaMzv4+1wcKKLvL492/GXY
         Jnpw==
X-Gm-Message-State: AOJu0YwsKWHRKiJAjEUa5O+HyX2VbN2w8Rk9ISu/Rgk0SSD/EQYvLxcJ
	piaC5/tZPugl+WloduZAAuI7IoNLKA5rM2eeKd1wmF11F83Y2G+NL9shfBEJTFPP3Ow3qAX9nyP
	aiSoAOX2FezCsUKGTklMZX2bcHDZK4xEqyQ==
X-Google-Smtp-Source: 
 AGHT+IHvr8VNjErnrommCPEidWc+Vrj9I781WYjR9xTCxyYXgEdmZsV6jlKbF0V/7niupI3+l4XuLbKXzek/e3tifLg=
X-Received: by 2002:a17:906:408d:b0:a3c:5e17:1635 with SMTP id
 u13-20020a170906408d00b00a3c5e171635mr5888809ejj.30.1708952763799; Mon, 26
 Feb 2024 05:06:03 -0800 (PST)
MIME-Version: 1.0
From: Ian Malone <ibmalone@gmail.com>
Date: Mon, 26 Feb 2024 13:05:52 +0000
Message-ID: 
 <CAL3-7Mo_o5R8UEz7h0qWKdumEAG5wGVmKck=hufA1df0XYEB=w@mail.gmail.com>
Subject: synaptics hi-res audio usb device duplex, usb bandwidth issues
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 7D3AK4VPLMDT4BZDI3CBUJAKWB6CDI6I
X-Message-ID-Hash: 7D3AK4VPLMDT4BZDI3CBUJAKWB6CDI6I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7D3AK4VPLMDT4BZDI3CBUJAKWB6CDI6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

In short I have a USB to 3.5mm adapter which seems not to work in
duplex mode on USB2.0 systems, possibly due to a bandwidth calculation
bug.

This is an evolution of an issue I previously posted on the users list
with no luck. I have an Anker USB-C to 3.5mm audio dongle (lsusb:
Conexant Systems (Rockwell), Inc. Hi-Res Audio) which I've used for
some time on my phone (Android with USB-3.2). On trying to use it with
an older T420 laptop recently with only USB-2.0 ports I discovered it
will not work in duplex mode. Input-only and output-only profiles work
(tested recording and playback with audacity), but with duplex no
sound is recorded (Fedora 39, pipewire). This is easily reproduced by
looking at the pavucontrol volume monitor for Output Devices, if I
switch the device to Analog or Digital Input in configuration then the
Input Devices level monitor for it shows activity if I speak into or
tap the microphone. With duplex selected there is no activity, the
level monitor bar may or may not display. I can switch between the two
behaviours by changing the profile. Various applications such as
Audacity and Zoom appear to hang when accessing this microphone with
the duplex profile set. I've used pipewire configuration to force the
format to 16LE only (playback and recording), but this has not helped.

In dmesg this error appears when this happens (microphone opened, for
example by pavucontrol):
[  294.825544] usb 1-1.1: cannot submit urb 0, error -28: not enough bandwidth
(T420, Fedora 39, kernel 6.7.5)

The T420 has USB 2 Type A ports, so a Type C to Type A adapter is
needed, but the problem is not limited to the T420 laptop. On an older
Samsung Tablet (Tab-A 2019, USB-2.0 Type C, kernel 4.4.177) I've been
able to test using Google Meet. Although there are no errors or
freezing observed, in headphone mode over USB the headphone microphone
is not being used and the tablet uses its onboard microphone instead
(although headphones are selected and playback is over the
headphones). Again, I can record (via voice recorder) from the headset
microphone, just no duplex. Trying google meet on my phone (USB3.2) I
do get duplex over the USB-3.5 adapter.

On a newer laptop with USB-3.2 and a mix of type A and C ports I also
get duplex (F37, kernel 6.5.12), however dmesg shows even here not all
is well, using the type A and C ports on the side:

[ 9172.326602] usb 3-1: new full-speed USB device number 6 using xhci_hcd
[ 9172.490169] usb 3-1: New USB device found, idVendor=0572,
idProduct=1b08, bcdDevice= 0.10
[ 9172.490174] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 9172.490177] usb 3-1: Product: Hi-Res Audio
[ 9172.490178] usb 3-1: Manufacturer: Synaptics
[ 9172.490180] usb 3-1: SerialNumber: 000000000000000000000000
[ 9172.683435] input: Synaptics Hi-Res Audio as
/devices/pci0000:00/0000:00:08.1/0000:05:00.4/usb3/3-1/3-1:1.3/0003:0572:1B08.000A/input/input36
[ 9172.736025] hid-generic 0003:0572:1B08.000A: input,hidraw5: USB HID
v1.11 Device [Synaptics Hi-Res Audio] on usb-0000:05:00.4-1/input3
[ 9173.386988] usb 3-1: Not enough bandwidth for new device state.
[ 9173.386994] usb 3-1: Not enough bandwidth for altsetting 1
[ 9173.386996] endpoint_set_interface: 70 callbacks suppressed
[ 9173.386998] usb 3-1: 1:1: usb_set_interface failed (-28)
[ 9173.387110] usb 3-1: Not enough bandwidth for new device state.
[ 9173.387113] usb 3-1: Not enough bandwidth for altsetting 1
(...these 3 lines repeat 9 more times, followed by...)
[ 9173.388785] usb 3-1: Not enough bandwidth for new device state.
[ 9173.388789] usb 3-1: Not enough bandwidth for altsetting 1
(...these 2 lines repeat 5 more times, then stop)

This is a USB3.2 system, the onboard camera has a hardware switch, so
I can disable it, and the only other peripheral that appears is the
AX210 bluetooth (I'd thought that would have its own bus as it's part
of a separate wifi chip, but apparently not, lsusb -t below),
bandwidth for even a 96kHz 24bit duplex audio device shouldn't really
be an issue.
$ lsusb
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 003 Device 002: ID 048d:c965 Integrated Technology Express, Inc.
ITE Device(8295)
Bus 003 Device 007: ID 0572:1b08 Conexant Systems (Rockwell), Inc. Hi-Res Audio
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 002: ID 0bda:0411 Realtek Semiconductor Corp. Hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 048d:c101 Integrated Technology Express, Inc.
ITE Device(8910)
Bus 001 Device 002: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
$ lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
    |__ Port 1: Dev 7, If 0, Class=Audio, Driver=snd-usb-audio, 12M
    |__ Port 1: Dev 7, If 1, Class=Audio, Driver=snd-usb-audio, 12M
    |__ Port 1: Dev 7, If 2, Class=Audio, Driver=snd-usb-audio, 12M
    |__ Port 1: Dev 7, If 3, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 3: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 3: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 4: Dev 3, If 0, Class=Wireless, Driver=btusb, 12M
    |__ Port 4: Dev 3, If 1, Class=Wireless, Driver=btusb, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
    |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
    |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
    |__ Port 4: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 12M


The only situation in which I *don't* get these dmesg errors is if I
use one of the rear USB 3.2 ports that seem to lead to it being on its
own bus:
$ lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
    |__ Port 3: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 3: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 4: Dev 3, If 0, Class=Wireless, Driver=btusb, 12M
    |__ Port 4: Dev 3, If 1, Class=Wireless, Driver=btusb, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
    |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
    |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 2: Dev 7, If 0, Class=Audio, Driver=snd-usb-audio, 12M
        |__ Port 2: Dev 7, If 1, Class=Audio, Driver=snd-usb-audio, 12M
        |__ Port 2: Dev 7, If 2, Class=Audio, Driver=snd-usb-audio, 12M
        |__ Port 2: Dev 7, If 3, Class=Human Interface Device,
Driver=usbhid, 12M
    |__ Port 4: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 12M

In this case the dmesg output is clear after device connection. This
seems like some kind of bandwidth calculation problem in
snd_usb_audio. I've tried building a kernel and modifying various of
the defines in sound/usb/card.h (currently MAX_PACKS 4 and
MAX_PACKS_HS (MAX_PACKS * 4), compared to 6 and *8) but not hit on a
winning formula yet. Is there any information I could collect to try
to fix this?

-- 
imalone
