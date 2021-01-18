Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02922FAC67
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 22:17:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E55717AB;
	Mon, 18 Jan 2021 22:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E55717AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611004641;
	bh=jNOenBIUletLVGQ6/VHRj02rqgA6EYKwBQfRPvsePMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fpqSzl1kmhegR5vC5RRAakUvlpa/ciEwGrUHhUtwN7/tXVSCl+2mdaTGTYznlCvpO
	 i5gXmvwHpuvjAsfv+8xqiPWsS3j0JPmegzHjYDnM7bET7IoAt9xOtWs27nryPai59o
	 ZlGZE8buQjkQRVU7agYSSdEUStYpLoe9AtZvIn2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E4D5F8019D;
	Mon, 18 Jan 2021 22:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33E0EF8016E; Mon, 18 Jan 2021 22:15:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49E14F800E7
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 22:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49E14F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="UwNWtGiq"
Received: by mail-yb1-xb2e.google.com with SMTP id f6so13939310ybq.13
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 13:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+rCVubhdqwgf7S4ZPgAdZm/ivoJ8k05eNoDpLD5RjI=;
 b=UwNWtGiqF8ge27dgW5k/6Mv673fkWXl8ywnj7NUoGN/KniOmB4Woq0OwlWwOnrPQ8w
 GegHwalx0f3PAsUN9LoiFQVCAM0tubCVB6x/hTkw/VLIp8jMdyYP6pnIJobSmbu8ui7l
 4pJs/Eesh5A6OX0VxD5kpa1i1Y/QJ0JYlcGruwDOBrWfFmic7tRSyACFehH/2WI/WiFM
 jDx1lBXKfLFFBLJ598eOvXWNnyMlAGZDwcqGzN54WD8AD9OGMSrAIbYDHt7+2pXtDRlW
 dd59bZxyT9pA1XruKgf7hK6s/JqI4rf47yFl3U+QuEAxJynXdAQDmuccfjl5CaFja7ov
 SIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+rCVubhdqwgf7S4ZPgAdZm/ivoJ8k05eNoDpLD5RjI=;
 b=U7/6Rzgv+UWmeJb9nm2JTKkAwORJeqmG5wte3z3aUI/rAm/T+Mqu/KRNo+ZuRB2aqm
 CXHcT/7bJYjeuoU7/3rRJrbqaWMUtYryfVXu9FcnO+UTA2z8eUmp6G3JbTvKc8qqG/9I
 pGMhJc6WVwQvU/FFAgchJ6IxgOBlJUPh5zzDM3V5+mUEuePxebJZr4+er7UyZsVJHeoS
 5rmO54CfpneaL4tKYG7iOBp2+TtXZTcgFQVIVivvhKyerCAu+eA+qzyw9Dvk7NRqsSsl
 T36DMRy+Q/3Kx+wzmCGgz7gz8dIMQO2dNmebMmsto9GZ0h6AEXsBvNdNBPNilMlxvaIq
 x/1Q==
X-Gm-Message-State: AOAM5312/7UB3r3ekbhIUJCFZT01uJTCBLYRDVYxw1WQqCR/Sf1woBxQ
 ak+BJHHBo7wiXG8WKPONcgOJe56aXWHZTTqziEyoJA==
X-Google-Smtp-Source: ABdhPJzKPvdq+ojK9BDumT4GLB7v+E2e5VfNFh8nTM+q5bmvAFnP0oYBWTYvi1VqEj79cIlVlBHEJF8FbUi1epMmycI=
X-Received: by 2002:a25:2a56:: with SMTP id q83mr1503516ybq.144.1611004537065; 
 Mon, 18 Jan 2021 13:15:37 -0800 (PST)
MIME-Version: 1.0
References: <CAHXb3bdk71ivJUp9HBRccDvd8SD2F1uFdsC_FxUjhh5zpcQobQ@mail.gmail.com>
 <s5hr1mik7vu.wl-tiwai@suse.de>
 <CAHXb3bdt6mgUcZ0+MH1i7QeYF03MSwx=kad-YBBNeVjqoH=KhA@mail.gmail.com>
 <CAHXb3bcFM0BswbuTe=6vP6JRd=TOf94Gu0FPAZmXT6634bCiAQ@mail.gmail.com>
 <s5hr1migiie.wl-tiwai@suse.de>
In-Reply-To: <s5hr1migiie.wl-tiwai@suse.de>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Mon, 18 Jan 2021 13:15:26 -0800
Message-ID: <CAHXb3be9EpEtaEc0iH06wmLMhyizkV7arvgxsT2bWK=aJHKVLA@mail.gmail.com>
Subject: Re: Support for NUX MG-300 USB interface
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Progress - thanks for the patch!

That got rid of the clock errors, and the the device now reports a 48000
sample rate, which is correct.

Unfortunately, it still isn't working properly. Playback doesn't seem to
work at all. Capture kind of works - it does record, but the audio is
extremely noisy.

Here is the current dmesg output when the device is connected.

Notable is the error "No valid sample rate available for 1:1, assuming a
firmware bug".

Also notable is "1:1 Set sample rate 48000, clock 40" - where "40" is the
id of the clock selector - "41" is the id of the actual clock source. So
maybe something is still getting wired up wrong?


[  418.366449] usb 3-1.2: new high-speed USB device number 6 using ehci-pci
[  418.479099] usb 3-1.2: config 1 interface 3 altsetting 0 bulk endpoint
0x4 has invalid maxpacket 256
[  418.479118] usb 3-1.2: config 1 interface 3 altsetting 0 bulk endpoint
0x83 has invalid maxpacket 256
[  418.480085] usb 3-1.2: New USB device found, idVendor=1fc9,
idProduct=8260, bcdDevice= 1.00
[  418.480100] usb 3-1.2: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  418.480107] usb 3-1.2: Product: NUX MG-300 AUDIO
[  418.480112] usb 3-1.2: Manufacturer: NUX
[  418.480117] usb 3-1.2: SerialNumber: 2008101346
[  418.482025] usb 3-1.2: No valid sample rate available for 1:1, assuming
a firmware bug
[  418.482041] usb 3-1.2: 1:1: found sync_ep=0x81, iface=1, alt=1,
implicit_fb=0
[  418.482049] usb 3-1.2: 1:1: add audio endpoint 0x1
[  418.482078] usb 3-1.2: Creating new data endpoint #1
[  418.482086] usb 3-1.2: Creating new sync endpoint #81
[  418.482666] usb 3-1.2: 1:1 Set sample rate 48000, clock 40
[  418.484525] usb 3-1.2: No valid sample rate available for 2:1, assuming
a firmware bug
[  418.484545] usb 3-1.2: 2:1: add audio endpoint 0x82
[  418.484584] usb 3-1.2: Creating new data endpoint #82
[  418.484899] usb 3-1.2: 2:1 Set sample rate 48000, clock 40
[  418.485800] usb 3-1.2: [10] FU [PCM Playback Switch] ch = 2, val = 0/1/1
[  418.485822] usb 3-1.2: [10] FU [PCM Playback Switch] ch = 1, val = 0/1/1
[  418.486484] usb 3-1.2: RANGE setting not yet supported
[  418.487402] usb 3-1.2: [10] FU [PCM Playback Volume] ch = 2, val =
-16384/0/256
[  418.487899] usb 3-1.2: RANGE setting not yet supported
[  418.488774] usb 3-1.2: [10] FU [PCM Playback Volume] ch = 1, val =
-16384/0/256
[  418.541357] usb 3-1.2: Open EP 0x82, iface=2:1, idx=0
[  418.541363] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.541367] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.541524] usb 3-1.2: 2:1 Set sample rate 48000, clock 40
[  418.542000] usb 3-1.2: Setting params for data EP 0x82, pipe 0x10680
[  418.542007] usb 3-1.2: Set up 12 URBS, ret=0
[  418.542009] usb 3-1.2: Setting usb interface 2:1 for EP 0x82
[  418.545012] usb 3-1.2: Closing EP 0x82 (count 1)
[  418.545018] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.545157] usb 3-1.2: EP 0x82 closed
[  418.545620] usb 3-1.2: Open EP 0x82, iface=2:1, idx=0
[  418.545624] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.545627] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.545893] usb 3-1.2: 2:1 Set sample rate 48000, clock 40
[  418.546257] usb 3-1.2: Setting params for data EP 0x82, pipe 0x10680
[  418.546263] usb 3-1.2: Set up 12 URBS, ret=0
[  418.546266] usb 3-1.2: Setting usb interface 2:1 for EP 0x82
[  418.546841] usb 3-1.2: Closing EP 0x82 (count 1)
[  418.546845] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.547052] usb 3-1.2: EP 0x82 closed
[  418.547467] usb 3-1.2: Open EP 0x1, iface=1:1, idx=0
[  418.547470] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.547473] usb 3-1.2: Open EP 0x81, iface=1:1, idx=1
[  418.547476] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.547478] usb 3-1.2: Setting usb interface 1:0 for EP 0x1
[  418.547643] usb 3-1.2: 1:1 Set sample rate 48000, clock 40
[  418.548129] usb 3-1.2: Setting params for data EP 0x1, pipe 0x8600
[  418.548143] usb 3-1.2: Set up 12 URBS, ret=0
[  418.548146] usb 3-1.2: Setting usb interface 1:1 for EP 0x1
[  418.548420] usb 3-1.2: Setting params for sync EP 0x81, pipe 0x8680
[  418.548425] usb 3-1.2: Set up 4 URBS, ret=0
[  418.548443] usb 3-1.2: Starting data EP 0x1 (running 0)
[  418.548474] usb 3-1.2: 12 URBs submitted for EP 0x1
[  418.548477] usb 3-1.2: Starting sync EP 0x81 (running 0)
[  418.548487] usb 3-1.2: 4 URBs submitted for EP 0x81
[  418.549724] usb 3-1.2: Open EP 0x82, iface=2:1, idx=0
[  418.549729] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.549732] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.549888] usb 3-1.2: 2:1 Set sample rate 48000, clock 40
[  418.550256] usb 3-1.2: Setting params for data EP 0x82, pipe 0x10680
[  418.550259] usb 3-1.2: Set up 12 URBS, ret=0
[  418.550261] usb 3-1.2: Setting usb interface 2:1 for EP 0x82
[  418.550455] usb 3-1.2: Closing EP 0x82 (count 1)
[  418.550460] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.550659] usb 3-1.2: EP 0x82 closed
[  418.551298] usb 3-1.2: Open EP 0x82, iface=2:1, idx=0
[  418.551303] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.551307] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.551528] usb 3-1.2: 2:1 Set sample rate 48000, clock 40
[  418.552021] usb 3-1.2: Setting params for data EP 0x82, pipe 0x10680
[  418.552028] usb 3-1.2: Set up 12 URBS, ret=0
[  418.552031] usb 3-1.2: Setting usb interface 2:1 for EP 0x82
[  418.552168] usb 3-1.2: Stopping sync EP 0x81 (running 1)
[  418.552174] usb 3-1.2: Stopping data EP 0x1 (running 1)
[  418.566466] usb 3-1.2: Closing EP 0x1 (count 1)
[  418.566472] usb 3-1.2: Setting usb interface 1:0 for EP 0x1
[  418.566772] usb 3-1.2: EP 0x1 closed
[  418.566775] usb 3-1.2: Closing EP 0x81 (count 1)
[  418.566777] usb 3-1.2: Setting usb interface 1:0 for EP 0x81
[  418.566954] usb 3-1.2: EP 0x81 closed
[  418.567038] usb 3-1.2: Closing EP 0x82 (count 1)
[  418.567040] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.567257] usb 3-1.2: EP 0x82 closed
[  418.573720] usb 3-1.2: Open EP 0x1, iface=1:1, idx=0
[  418.573724] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.573727] usb 3-1.2: Open EP 0x81, iface=1:1, idx=1
[  418.573729] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.573732] usb 3-1.2: Setting usb interface 1:0 for EP 0x1
[  418.573927] usb 3-1.2: 1:1 Set sample rate 48000, clock 40
[  418.574564] usb 3-1.2: Setting params for data EP 0x1, pipe 0x8600
[  418.574570] usb 3-1.2: Set up 12 URBS, ret=0
[  418.574572] usb 3-1.2: Setting usb interface 1:1 for EP 0x1
[  418.574659] usb 3-1.2: Setting params for sync EP 0x81, pipe 0x8680
[  418.574662] usb 3-1.2: Set up 4 URBS, ret=0
[  418.574676] usb 3-1.2: Starting data EP 0x1 (running 0)
[  418.574700] usb 3-1.2: 12 URBs submitted for EP 0x1
[  418.574701] usb 3-1.2: Starting sync EP 0x81 (running 0)
[  418.574709] usb 3-1.2: 4 URBs submitted for EP 0x81
[  418.575117] usb 3-1.2: Open EP 0x82, iface=2:1, idx=0
[  418.575120] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.575123] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.575384] usb 3-1.2: 2:1 Set sample rate 48000, clock 40
[  418.575916] usb 3-1.2: Setting params for data EP 0x82, pipe 0x10680
[  418.575926] usb 3-1.2: Set up 12 URBS, ret=0
[  418.575928] usb 3-1.2: Setting usb interface 2:1 for EP 0x82
[  418.576065] usb 3-1.2: Closing EP 0x82 (count 1)
[  418.576069] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.576171] usb 3-1.2: EP 0x82 closed
[  418.576574] usb 3-1.2: Open EP 0x82, iface=2:1, idx=0
[  418.576578] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=9592, periods=4, implicit_fb=0
[  418.576581] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.576632] usb 3-1.2: 2:1 Set sample rate 48000, clock 40
[  418.577128] usb 3-1.2: Setting params for data EP 0x82, pipe 0x10680
[  418.577132] usb 3-1.2: Set up 12 URBS, ret=0
[  418.577134] usb 3-1.2: Setting usb interface 2:1 for EP 0x82
[  418.577404] usb 3-1.2: Stopping sync EP 0x81 (running 1)
[  418.577408] usb 3-1.2: Stopping data EP 0x1 (running 1)
[  418.594462] usb 3-1.2: Closing EP 0x1 (count 1)
[  418.594469] usb 3-1.2: Setting usb interface 1:0 for EP 0x1
[  418.594806] usb 3-1.2: EP 0x1 closed
[  418.594810] usb 3-1.2: Closing EP 0x81 (count 1)
[  418.594812] usb 3-1.2: Setting usb interface 1:0 for EP 0x81
[  418.595093] usb 3-1.2: EP 0x81 closed
[  418.595187] usb 3-1.2: Closing EP 0x82 (count 1)
[  418.595189] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.595520] usb 3-1.2: EP 0x82 closed
[  418.610935] usb 3-1.2: Open EP 0x1, iface=1:1, idx=0
[  418.610943] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=384000, periods=2, implicit_fb=0
[  418.610946] usb 3-1.2: Open EP 0x81, iface=1:1, idx=1
[  418.610949] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=384000, periods=2, implicit_fb=0
[  418.610952] usb 3-1.2: Setting usb interface 1:0 for EP 0x1
[  418.611223] usb 3-1.2: 1:1 Set sample rate 48000, clock 40
[  418.611990] usb 3-1.2: Setting params for data EP 0x1, pipe 0x8600
[  418.612013] usb 3-1.2: Set up 12 URBS, ret=0
[  418.612020] usb 3-1.2: Setting usb interface 1:1 for EP 0x1
[  418.612281] usb 3-1.2: Setting params for sync EP 0x81, pipe 0x8680
[  418.612285] usb 3-1.2: Set up 4 URBS, ret=0
[  418.612363] usb 3-1.2: Starting data EP 0x1 (running 0)
[  418.612389] usb 3-1.2: 12 URBs submitted for EP 0x1
[  418.612390] usb 3-1.2: Starting sync EP 0x81 (running 0)
[  418.612397] usb 3-1.2: 4 URBs submitted for EP 0x81
[  418.613337] usb 3-1.2: 1:1 Start Playback PCM
[  418.613810] usb 3-1.2: Open EP 0x82, iface=2:1, idx=0
[  418.613813] usb 3-1.2:   channels=2, rate=48000, format=S32_LE,
period_bytes=384000, periods=2, implicit_fb=0
[  418.613815] usb 3-1.2: Setting usb interface 2:0 for EP 0x82
[  418.614078] usb 3-1.2: 2:1 Set sample rate 48000, clock 40
[  418.614639] usb 3-1.2: Setting params for data EP 0x82, pipe 0x10680
[  418.614648] usb 3-1.2: Set up 12 URBS, ret=0
[  418.614653] usb 3-1.2: Setting usb interface 2:1 for EP 0x82
[  418.615844] usb 3-1.2: Starting data EP 0x82 (running 0)
[  418.615879] usb 3-1.2: 12 URBs submitted for EP 0x82
[  418.615882] usb 3-1.2: 2:1 Start Capture PCM

On Mon, Jan 18, 2021 at 11:19 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 18 Jan 2021 18:54:57 +0100,
> Mike Oliphant wrote:
> >
> > Here is the dmesg output with dyndbg enabled. It looks like it is failing
> > to find the clock source, and hence cannot obtain the valid sample rates.
> >
> > It looks like it is finding the clock selector (id: 40), but
> > "uac_clock_selector_get_val()" is returning zero, and it never gets the
> > clock source (id: 41).
>
> Aha.  Maybe the firmware doesn't expect it being asked as it's the
> single connection.
>
> Does the patch below help anything?
>
>
> Takashi
>
> --- a/sound/usb/clock.c
> +++ b/sound/usb/clock.c
> @@ -298,6 +298,11 @@ static int __uac_clock_find_source(struct
> snd_usb_audio *chip,
>         if (selector) {
>                 int ret, i, cur;
>
> +               if (selector->bNrInPins == 1) {
> +                       ret = 1;
> +                       goto find_source;
> +               }
> +
>                 /* the entity ID we are looking for is a selector.
>                  * find out what it currently selects */
>                 ret = uac_clock_selector_get_val(chip, selector->bClockID);
> @@ -314,6 +319,7 @@ static int __uac_clock_find_source(struct
> snd_usb_audio *chip,
>                         return -EINVAL;
>                 }
>
> +       find_source:
>                 cur = ret;
>                 ret = __uac_clock_find_source(chip, fmt,
>                                               selector->baCSourceID[ret -
> 1],
>
