Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3602FBDE2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:41:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D83318DF;
	Tue, 19 Jan 2021 18:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D83318DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611078094;
	bh=qO2uKzblCvgFsKAaloOWJCqrpKIwkDOJrQ9cieAobxI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATzxjPI1yWjocRZe8DENvaqyXMNMTaPR2qhTGeEkSK9F7jivZjIhi3NTD7wGcoo3q
	 iIt7eV4m1iT33fntQ0+Fij2fjpzBnlfvdYK341LGiN9NiZRBCwVnxiOdsRlss4EWth
	 ZJQiU7IyTtovBLB9Ap0/6S6lKxmtH9MRv9YW6Axk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F77F800FE;
	Tue, 19 Jan 2021 18:40:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13FC3F80273; Tue, 19 Jan 2021 18:40:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA607F800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA607F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="H3skCMbC"
Received: by mail-ed1-x533.google.com with SMTP id g24so22486328edw.9
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=513zVfaKy3+HgGBty/QhEpqxM2N3SuYNgNrXRwMsy6o=;
 b=H3skCMbCgz1uueh0AD9XUPgl7WJr3d20tGo6SYH44GiLGvNAZhFXYTfYxzJDcjuLFe
 +yuNTF+sCamOsU9tfK+UHvl/GesW9uQW+2/nCg2QfkX4AYTFwMbt4WRoEPxtSc9jxgSs
 ZdCjyLojGCV8y2zW7LJVGwN+/+d6+FSlalkvIhl4S/NJRMT11SNGN8PRDjvp4+aNAjNu
 cV4b+O9PnHSJzR8jAE2FRgqEQt+ceC+XbaI4Rvz91C6mtGSBaWaNMFcWwFX5loXH0kCc
 /8QaMEsMQZcCIDXP/p1LZCiiocVAalIbrxcJkrvm3/T20Z+wCupXGdTrErhqs5/G0P2H
 JEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=513zVfaKy3+HgGBty/QhEpqxM2N3SuYNgNrXRwMsy6o=;
 b=eidUluamwNEiY2kU2hfIuSbSLFm9qtzVGPamvrETkAUd2HZi7g9PaHx4bAa90Clhn3
 xav+Up9fh9RVUuxWQ0/eiVoT0teYgn4UorsJ6GDhGd4VTkKj0MQDqeoJ0TGopD+y0yOV
 C8YQXsTXJj6CE64dQNI+dfCkmWU6Q62klIsdMzDPjaXbvJHCBfxm8qjgdoK96WGORmTe
 wTn+FDAnWQyocPZqQzJV3fXgso9bIkrgJllZjHBLAlAxZEIHastM2tImcZqnKB0A+Nuq
 QRLecwAnfsCuJCv2FUzZ3NZW+zaX3vZM0b/+QTnsMWl82TJFmJpw7GLo8jjEsvui4oNk
 IAJg==
X-Gm-Message-State: AOAM530HUzdw771t5fOJvdf5MG/s1ZvJDWf0K5SqO6XTavToeuXfykoJ
 Dya+itSc+5jobEpbyYxJdIeTkbi6eyilSUGenSG6crH4jw6UyQ==
X-Google-Smtp-Source: ABdhPJyFWhOjSlRuTfBCX/vBBvcwS/8APyR5CaCp/JJ5ZRwtfp5qNGNakaC6PpnEY8H9hiAWYP1ghHNgXJLDAIe/ab4=
X-Received: by 2002:a05:6402:4d2:: with SMTP id
 n18mr4317266edw.309.1611078013375; 
 Tue, 19 Jan 2021 09:40:13 -0800 (PST)
MIME-Version: 1.0
References: <CAHXb3bdk71ivJUp9HBRccDvd8SD2F1uFdsC_FxUjhh5zpcQobQ@mail.gmail.com>
 <s5hr1mik7vu.wl-tiwai@suse.de>
 <CAHXb3bdt6mgUcZ0+MH1i7QeYF03MSwx=kad-YBBNeVjqoH=KhA@mail.gmail.com>
 <CAHXb3bcFM0BswbuTe=6vP6JRd=TOf94Gu0FPAZmXT6634bCiAQ@mail.gmail.com>
 <s5hr1migiie.wl-tiwai@suse.de>
 <CAHXb3be9EpEtaEc0iH06wmLMhyizkV7arvgxsT2bWK=aJHKVLA@mail.gmail.com>
 <s5him7thpoz.wl-tiwai@suse.de>
 <CAHXb3bd8zHFmHxDp=4dNKa90eAT568yCwTWo_5L0Zry1EY45UA@mail.gmail.com>
 <s5hczy1guto.wl-tiwai@suse.de>
In-Reply-To: <s5hczy1guto.wl-tiwai@suse.de>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Tue, 19 Jan 2021 09:40:04 -0800
Message-ID: <CAHXb3bfUv7QzvgOmtV3LxJXaY=Uk+pKhWZmU0M+YkgB0kNrXmA@mail.gmail.com>
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

Your mixer.c patch does get rid of the RANGE errors. No change to behavior,
though.

I'd already tried setting "implicit_fb=1" even though I didn't expect it to
work, since there is a separate feedback endpoint. I just tried it again -
it doesn't seem to hurt anything, but it doesn't help either.

Capture seems to be working perfectly with the clock patch - I'm not sure
why I was initially getting noisy input.

I checked "/proc/asound/card*/pcm*/sub*/status" during playback, and the
pointer seems to be moving forward as it should. All indications are that
the system thinks playback is working fine.

One interesting piece of information - alsamixer shows two stereo outputs
("pcm" and "pcm1"). Not sure why there are two - maybe output is going to
the wrong one?

Here is the output from "/proc/asound/AUDIO/usbmixer":

USB Mixer: usb_id=0x1fc98260, ctrlif=0, ctlerr=0
Card: NUX NUX MG-300 AUDIO at usb-0000:00:1a.7-1.3, high speed
  Unit: 10
    Control: name="PCM Playback Volume", index=1
    Info: id=10, control=2, cmask=0x0, channels=1, type="S16"
    Volume: min=-16384, max=0, dBmin=-6400, dBmax=0
  Unit: 10
    Control: name="PCM Playback Volume", index=0
    Info: id=10, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-16384, max=0, dBmin=-6400, dBmax=0
  Unit: 10
    Control: name="PCM Playback Switch", index=1
    Info: id=10, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 10
    Control: name="PCM Playback Switch", index=0
    Info: id=10, control=1, cmask=0x3, channels=2, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 41
    Control: name="Clock Source 41 Validity", index=0
    Info: id=41, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0

Mike

On Tue, Jan 19, 2021 at 1:05 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Tue, 19 Jan 2021 01:26:51 +0100,
> Mike Oliphant wrote:
> >
> > Unfortunately, the "uac_clock_selector_set_val()" call does not seem to
> > change anything.
>
> OK,
>
> > >From doing some more testing, I think that the references to clock id
> "40"
> > are ok - it has "40" stored in fmt->clock, but when it uses it,
> > "__uac_clock_find_source()" gets called and it resolved to the actual
> clock
> > source - "41".
> >
> > Not sure about the "No valid sample rate available for 1:1, assuming a
> > firmware bug" error, but I suspect it is spurious.
> > "check_valid_altsetting_v2v3()" is failing for some reason, but it is
> > ignoring the error.
>
> Yes, that's the part where verifying the altsetting for the given
> rate.  The UAC2 device must return the valid altsetting bit mask for
> the current rate in the request, but your device didn't seem returning
> it.  The code is there for devices like MOTU that have multiple
> altsets where each one has one sample rate exclusively.
>
> > Playback is completely silent, but the system seems to think it is
> working.
> > No apparent errors, and a play operation seems to take the correct amount
> > of time. Just no audio.
>
> Check the status in /proc/asound/card*/pcm*/sub*/status.  If the
> pointer moves forward and the position is expected, at least the data
> feed is done, and the problem must be something else.
>
> What about the capture?  Do you get also only silence?
>
> > Maybe it is a mixer issue? mixer.c is putting out "RANGE setting not yet
> > supported" errors on startup.
>
> That's probably no problem, I guess it comes from the code trying to
> get the resolution.  The patch below may paper over it.
>
> > Here is a sample of dmesg output for a playback session:
> >
> > [ 4748.260975] usb 1-1.3: Open EP 0x1, iface=1:1, idx=0
> > [ 4748.260983] usb 1-1.3:   channels=2, rate=48000, format=S32_LE,
> > period_bytes=48000, periods=4, implicit_fb=0
> > [ 4748.260988] usb 1-1.3: Open EP 0x81, iface=1:1, idx=1
> > [ 4748.260992] usb 1-1.3:   channels=2, rate=48000, format=S32_LE,
> > period_bytes=48000, periods=4, implicit_fb=0
> > [ 4748.260996] usb 1-1.3: Setting usb interface 1:0 for EP 0x1
> > [ 4748.261320] usb 1-1.3: 1:1 Set sample rate 48000, clock 40
> > [ 4748.261873] usb 1-1.3: Setting params for data EP 0x1, pipe 0x9d00
> > [ 4748.261890] usb 1-1.3: Set up 12 URBS, ret=0
> > [ 4748.261897] usb 1-1.3: Setting usb interface 1:1 for EP 0x1
> > [ 4748.262097] usb 1-1.3: Setting params for sync EP 0x81, pipe 0x9d80
> > [ 4748.262105] usb 1-1.3: Set up 4 URBS, ret=0
> > [ 4748.262147] usb 1-1.3: Starting data EP 0x1 (running 0)
> > [ 4748.262180] usb 1-1.3: 12 URBs submitted for EP 0x1
> > [ 4748.262183] usb 1-1.3: Starting sync EP 0x81 (running 0)
> > [ 4748.262193] usb 1-1.3: 4 URBs submitted for EP 0x81
> > [ 4748.262311] usb 1-1.3: 1:1 Start Playback PCM
> > [ 4762.887812] usb 1-1.3: Stopping sync EP 0x81 (running 1)
> > [ 4762.887836] usb 1-1.3: Stopping data EP 0x1 (running 1)
> > [ 4762.887849] usb 1-1.3: 1:1 Stop Playback PCM
> > [ 4762.902542] usb 1-1.3: Closing EP 0x1 (count 1)
> > [ 4762.902549] usb 1-1.3: Setting usb interface 1:0 for EP 0x1
> > [ 4762.902915] usb 1-1.3: EP 0x1 closed
> > [ 4762.902928] usb 1-1.3: Closing EP 0x81 (count 1)
> > [ 4762.902935] usb 1-1.3: Setting usb interface 1:0 for EP 0x81
> > [ 4762.903179] usb 1-1.3: EP 0x81 closed
>
> The flow looks good judging from this log, at least.
>
> The device is configured with the dedicated sync endpoint, but it's
> not with the implicit feedback mode.  It's interesting whether the
> device behaves differently if you load snd-usb-audio module with
> implicit_fb=1 boot option.  I don't expect it working better, but
> anyway...
>
>
> Takashi
>
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1238,7 +1238,7 @@ static int get_min_max_with_quirks(struct
> usb_mixer_elem_info *cval,
>                                   (cval->control << 8) | minchn,
>                                   &cval->res) < 0) {
>                         cval->res = 1;
> -               } else {
> +               } else if (cval->head.mixer->protocol == UAC_VERSION_1) {
>                         int last_valid_res = cval->res;
>
>                         while (cval->res > 1) {
>
>
