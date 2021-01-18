Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1B02FA80E
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 18:56:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732F21852;
	Mon, 18 Jan 2021 18:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732F21852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610992610;
	bh=FHXRn1vEEfbugq/dxPkspXXmWGnZKs1mSQrNSTMnv4M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjiRDPhHBpvinhVIJ+buZAD3HdDGXLUWRGo1q8eoTkpa3945vOMBeEvzHelIt3vDW
	 +ba/XmnqxvSfH2yGumkumdX/UPb1QEmBcOq5D6/qT3OB5FBbMe+/UmSdodCBHvFc/+
	 8ROhvZGr/UvWJqmfKWtizFtepighLY2iekpJeP84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 096B8F80166;
	Mon, 18 Jan 2021 18:55:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD68FF8016E; Mon, 18 Jan 2021 18:55:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 677BBF80137
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 18:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 677BBF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="ICxNopIT"
Received: by mail-yb1-xb30.google.com with SMTP id x78so8968720ybe.11
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HEqQBsozGSpOflCZl9gp+peFrajlSU4w+5lEX4OkguI=;
 b=ICxNopIThXiH/9ldsuzMp3a28QVTl3tCRd6YT+0TQ+1jaO3Bsg1JEV9H2o+CrLK0n4
 7aftCtM4+xOdasHjPL5GjS0EfJyqDZk1dZjqJhlB8B6HElYwNJMh7U/5sKmCivlqCAB1
 7Qd+XFt8Dh6DC3xccEL3czJK/rj4i/CslOu9SXGPbBdsrWqB1xmBNmuDojLzwydAk/qj
 aGg9aQ/wvYwl0cWP+gDScJPMQr1J1s6GHCorzpyHGqRdfEJHr4P76bi2JI4RH2sXuc3D
 B6ezFdRagKLgiJ0KQos/04Vb2CbqIuBsUNoQiVrM3ZLNYMOUjlCOtwmA02XdfuE8wb8Z
 gDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HEqQBsozGSpOflCZl9gp+peFrajlSU4w+5lEX4OkguI=;
 b=JtEgx9FeP1Bsc33PWH4ew6xd6gzKsnuPm9T4trNFqFYMzleX7shIbGP7mHtMm/r59i
 1hBT4hj+E7FbTgmyC6gAK82rOQfvNRte2qMtDbU5nepYeQXHoGLz0XGUml/ModImcDdC
 iEOiMpZubND9ixwYZvF3cE6eEKHepG2cy5YIpUPfh2Ky0xjM+tzT4CCVOXMOKqmTIYXN
 M8sO6raJeqHFBB3E6HnX2h2BGPTh26Lu6MAoknxOwtEQRHFiAWXJQBwER2ii9LjhJsgL
 HHtml6Va7xP3yDyaNgMo/6Q65PK4scANcj+F25YFVn7w0JNL3jJkx+cnVY6aQNnIcO6a
 kKlw==
X-Gm-Message-State: AOAM531iaWMRsQpq9EB+zTIrHOHyDEbjg2WHskwR4vFOodsa4UtCu276
 hJMtRJ2wON8dLp7Nk76f5/y1UDwQFOJctA/Ir2yXI9iosTQBmA==
X-Google-Smtp-Source: ABdhPJx2E77M9TfDBPYk5i6pvv1yeAjXhcq4xjN3SsQLeLIZBVKWiCKmgmckQUePTZpmWBrfUEdsY0jSn9v/8Qo+9AU=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr465631ybp.314.1610992506289;
 Mon, 18 Jan 2021 09:55:06 -0800 (PST)
MIME-Version: 1.0
References: <CAHXb3bdk71ivJUp9HBRccDvd8SD2F1uFdsC_FxUjhh5zpcQobQ@mail.gmail.com>
 <s5hr1mik7vu.wl-tiwai@suse.de>
 <CAHXb3bdt6mgUcZ0+MH1i7QeYF03MSwx=kad-YBBNeVjqoH=KhA@mail.gmail.com>
In-Reply-To: <CAHXb3bdt6mgUcZ0+MH1i7QeYF03MSwx=kad-YBBNeVjqoH=KhA@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Mon, 18 Jan 2021 09:54:57 -0800
Message-ID: <CAHXb3bcFM0BswbuTe=6vP6JRd=TOf94Gu0FPAZmXT6634bCiAQ@mail.gmail.com>
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

Here is the dmesg output with dyndbg enabled. It looks like it is failing
to find the clock source, and hence cannot obtain the valid sample rates.

It looks like it is finding the clock selector (id: 40), but
"uac_clock_selector_get_val()" is returning zero, and it never gets the
clock source (id: 41).

[  229.641481] usb 2-1.3: new high-speed USB device number 9 using ehci-pci
[  229.750316] usb 2-1.3: config 1 interface 3 altsetting 0 bulk endpoint
0x4 has invalid maxpacket 256
[  229.750335] usb 2-1.3: config 1 interface 3 altsetting 0 bulk endpoint
0x83 has invalid maxpacket 256
[  229.751432] usb 2-1.3: New USB device found, idVendor=1fc9,
idProduct=8260, bcdDevice= 1.00
[  229.751452] usb 2-1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  229.751459] usb 2-1.3: Product: NUX MG-300 AUDIO
[  229.751464] usb 2-1.3: Manufacturer: NUX
[  229.751468] usb 2-1.3: SerialNumber: 2008101346
[  230.170840] usb 2-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  230.170860] usb 2-1.3: parse_audio_format_rates_v2v3(): unable to find
clock source (clock -22)
[  230.170871] usb 2-1.3: 1:1: found sync_ep=0x81, iface=1, alt=1,
implicit_fb=0
[  230.170879] usb 2-1.3: 1:1: add audio endpoint 0x1
[  230.170907] usb 2-1.3: Creating new data endpoint #1
[  230.170915] usb 2-1.3: Creating new sync endpoint #81
[  230.171181] usb 2-1.3: 1:1 Set sample rate 0, clock 40
[  230.171408] usb 2-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  230.171657] usb 2-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  230.172463] usb 2-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  230.172480] usb 2-1.3: parse_audio_format_rates_v2v3(): unable to find
clock source (clock -22)
[  230.172490] usb 2-1.3: 2:1: add audio endpoint 0x82
[  230.172512] usb 2-1.3: Creating new data endpoint #82
[  230.172707] usb 2-1.3: 2:1 Set sample rate 0, clock 40
[  230.172832] usb 2-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  230.173079] usb 2-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  230.173442] usb 2-1.3: [10] FU [PCM Playback Switch] ch = 2, val = 0/1/1
[  230.173450] usb 2-1.3: [10] FU [PCM Playback Switch] ch = 1, val = 0/1/1
[  230.173949] usb 2-1.3: RANGE setting not yet supported
[  230.174700] usb 2-1.3: [10] FU [PCM Playback Volume] ch = 2, val =
-16384/0/256
[  230.175074] usb 2-1.3: RANGE setting not yet supported
[  230.175823] usb 2-1.3: [10] FU [PCM Playback Volume] ch = 1, val =
-16384/0/256
[  230.176631] usbcore: registered new interface driver snd-usb-audio

On Mon, Jan 18, 2021 at 8:33 AM Mike Oliphant <oliphant@nostatic.org> wrote:

> Thanks for the response. I'm running a very recent build of the master
> kernel tree (~ 5.11-rc2).
>
> I'll give dyndbg a try.
>
> Mike
>
> On Sun, Jan 17, 2021 at 11:43 PM Takashi Iwai <tiwai@suse.de> wrote:
>
>> On Sun, 17 Jan 2021 19:56:01 +0100,
>> Mike Oliphant wrote:
>> >
>> > I recently got a NUX MG-300 USB guitar fx interface with high hopes
>> that it
>> > would work in Linux. It is supposed to be class-compliant, and works in
>> iOS
>> > and macOS without a driver.
>> >
>> > Unfortunately, while it is recognized as a USB audio device by Linux,
>> it is
>> > not working.
>> >
>> > The core issue seems to be that "stream0" reports no playback rates.
>> dmesg
>> > also shows errors, including "__uac_clock_find_source(): selector
>> reported
>> > illegal value".
>> >
>> > Any help identifying the issue would be much appreciated. I have some
>> > experience troubleshooting the USB audio kernel code and am happy to try
>> > doing so if I can get a nudge in the right direction.
>> >
>> > Output from "stream0", dmesg, and lsusb follows.
>>
>> Did you try the latest 5.11-rc kernel?  There have been lots of
>> changes in USB-audio and this might work better there.
>>
>> If it still doesn't work with 5.11-rc, please try to enable the debug
>> option, e.g. boot with snd_usb_audio.dyndbg=+p boot option, plug the
>> device, and get the kernel logs (at plugging and during the audio
>> operations).
>>
>>
>> thanks,
>>
>> Takashi
>>
>
