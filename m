Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17235D3A8
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 01:06:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D440D1661;
	Tue, 13 Apr 2021 01:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D440D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618268768;
	bh=dBKFX/i2vzZzDXct2d4rPLNnPBabYmVQwgZL9XkJBh4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=el2LYbbrn92bHsoDEd4yBOsO1/MTIa7rPaboNFMjq8rlW9NdJ+AU1PB3RpLb1iwkO
	 Ecpczba6dzvmz+H0xup9J8aLi5xi3ltXcnpDiTmmUm76qZ/tv620fWK6F66jvXZ6Nb
	 Ng8zlvghUf7JWNfqSTX/OfZrGs0ONCuSA9nml3EU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A476F800D3;
	Tue, 13 Apr 2021 01:04:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB1B4F80269; Tue, 13 Apr 2021 01:04:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_14,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5186F8013D
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 01:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5186F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NEHsJVR8"
Received: by mail-qv1-xf2f.google.com with SMTP id u3so7196718qvj.8
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 16:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5knZBSd2H1WhSYW+psOCIVrgCPyDOCDcL2iMOPZowqU=;
 b=NEHsJVR8+SHRCCOZQtNxj5WCf21uxcWmAxzIm6tUF1wvD+TgdzOR87v/iiT5zvI1Uw
 XpsI1TE5F258xuBXa7addcM5F3Lw3wE7OigIAeTYBdTM3fW9e6P2U0WSnyaS7Z4aj0ap
 /B4t5Ny6cSboTQUAnqzi59xzZ/MwG5AIFnrt+L2lokFjNKXJIESTi61ovpyOKmCLXvIC
 sYJfE9ToDbaRipZ4YO42I57l1rD1ctkLK158ITRwlXm2kZDxju0XA206wRpRd8urMmCM
 VLdm39ZeNzhl2KbxtgRzExYglR51SZsBw9ueCLYkmqJpMCHVLBV07+v2aALWV3lIezue
 xxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5knZBSd2H1WhSYW+psOCIVrgCPyDOCDcL2iMOPZowqU=;
 b=E7xJC7RyWNQfAwHPnai6muL+lrD8ic3BIsRWX+AZ6xITtI5zistw0mzvfGxjkjXzYx
 ddunvSP54ligxxoJWAeG0hv0dNZDZ+ki/p3rBJ72+bv0zPHaEfDxEcZxSD/Frw4JaI3w
 MXFx8hMLB3kT38/sZVnZ0FXm7yRS2JaeDQ3xlC4W9TRx2aTWK3CQxeNrL0HMehGkxPCa
 bYQtFxl95cgc+Zzv5iZ7h2+cmUXz53L5BUUJquj2Y+1GW6ll8dUkhj+tLbQN+b2txc6/
 XC1uGvCeoE1kwzEAyfJPcRAompQpz3e/vs0u647Fk1XrBXqQllMX+CpcK0Knhv1djoFj
 wuxA==
X-Gm-Message-State: AOAM532oMcPSnqOrK1dUDkjptraVPnStHq5GFDn6XNxbyWqpW68eSj5b
 pMzv0KZK1taN8n8cdTdxwd0lFdLbsLpdc9bkJv4=
X-Google-Smtp-Source: ABdhPJymIFvJxNmKrGwkEdygELQDahXCx3G0fWCTNCEtLDWhArgSZoBqmAGpLNnJnh5Jd0ZAb4XOY9ouCHJfnhUcwtU=
X-Received: by 2002:a05:6214:c6c:: with SMTP id
 t12mr29759390qvj.17.1618268665652; 
 Mon, 12 Apr 2021 16:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcvF7LnO8PxyyCxuRCx=7jNeSCvFAd-+dE0g_rd1rOxxdw@mail.gmail.com>
 <s5h8s5q4irr.wl-tiwai@suse.de>
 <CAEsQvctCoHpe8U5HY70d++mcoYQw5gbd7zdLpkcOGyzgU0PLEQ@mail.gmail.com>
 <s5hblaj3j3d.wl-tiwai@suse.de>
In-Reply-To: <s5hblaj3j3d.wl-tiwai@suse.de>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 12 Apr 2021 20:09:07 -0300
Message-ID: <CAEsQvcsY8wvHsX+DXkcjpqR3UyxMZpAALiQ67o=UN0syUt-S=g@mail.gmail.com>
Subject: Re: [PATCH v2] Behringer UFX1604 / UFX1204: get rid of unneeded
 implicit feedback and pops and clicks while on 96000hz
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Sorry, Dr. Iwai, the truth is that I refuse to install PulseAudio in my
production systems, so I can't comment. To be sure you'd have to ask in
bugzilla #199327

Always a pleasure to work and learn with you, splitting the commits seems
like the ideal choice.

I do hope the fixes work out for others as I put a lot of time in tracking
the problem. Let's hope for the best.

Thank you,
Geraldo

Em Seg, 12 de abr de 2021 07:14, Takashi Iwai <tiwai@suse.de> escreveu:

> On Sat, 10 Apr 2021 22:27:15 +0200,
> Geraldo Nascimento wrote:
> >
> > OK, Dr. Iwai, only briefly tested but at least on my setup, JACK starts
> at
> > 96000hz and I am able to record my voice in Ardour 6, with no pops and
> clicks
> > detected.
> >
> > I'll record a full acapella just to be sure, but these 96000Hz pops and
> clicks
> > I used to experience - with that implicit feedback hack on by the way -
> tended
> > to be evident within seconds, not intermittent and very annoying.
> >
> > Now I turned the implicit feedback hack off for both the UFX1604 and th=
e
> > UFX1204 on my tree and with your two lines of code I have crystal clear
> sound.
> >
> > I took the liberty to comment your clever hack inside clock.c and the
> pops /
> > clicks problem reappears on 96000Hz. PulseAudio users (see
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D199327 ) will generally r=
un
> at
> > 44100Hz and won't be affected so much by noise because the clock
> selector will
> > be "tied" to the standard 48000Hz of these mixer desks DAC, in that
> invalid
> > state but close enough to the main clock rate.
> >
> > Henceforth the general confusion where people complain the forced
> implicit
> > feedback made PulseAudio break for their UFX1604 / UFX1204, but they do
> not
> > experience noise. This approach should solve both problems by disabling
> > implicit feedback on the synchronous endpoints but making sure the soun=
d
> is
> > crystal clear even at 96000Hz.
>
> Is the PA breakage still seen in the very latest kernel?  There have
> been a few issues due to the changes but they should have been already
> covered.
>
> Apart from that, the choice of implicit feedback was taken at the
> commit 5e35dc0338d8 in a few years ago for UFX1024.  I don't remember
> the details, but judging from the lsusb output, the devices don't look
> like a typical device that requires the implicit feedback (that has
> usually ASYNC for both directions).  So, as long as it's confirmed
> that the proper clock selector setup fixes the problem, we can drop
> the implicit feedback quirks.
>
> However, it's better to split the patches; one for the fix for the
> missing clock selector setup, another is the drop of the implciit fb
> quirk for Behringer devices.
>
> In anyway, let's see whether the fix works for others.  Then we can go
> forward and apply the fixes to the upstream.
>
>
> thanks,
>
> Takashi
>
> >
> > Thank you,
> > Geraldo
> >
> > Em S=C3=A1b, 10 de abr de 2021 05:59, Takashi Iwai <tiwai@suse.de> escr=
eveu:
> >
> >     On Sat, 10 Apr 2021 03:36:14 +0200,
> >     Geraldo Nascimento wrote:
> >     >
> >     > More complete patch disabling unneeded implicit feedback and
> setting
> >     > clock selector to default clock on rate change for UFX1604
> >     >
> >     > After re-reading
> https://bugzilla.kernel.org/show_bug.cgi?id=3D199327 it
> >     > is even more clear to me that implicit feedback for the
> >     > UFX1604/UFX1204 needs to be disabled.
> >     >
> >     > This is a more complete patch that disables that and for the
> UFX1604
> >     > only sets the clock selector to its pin 1 default clock synced to
> the
> >     > USB SOF upon rate change. This is needed because apparently the
> >     > endpoints are hardwired to the clock selector and after we change
> the
> >     > rate on the main USB SOF synced clock the clock selector is left
> in a
> >     > halfway state in regards to the sampling rate.
> >     >
> >     > That's why the pops and clicks aren't evident at stock 48000Hz,
> become
> >     > slightly audible at 44100Hz and detestable at 96000Hz. Seems the
> clock
> >     > selector needs a nudge or it will screw up the sync.
> >     >
> >     > Unfortunately I don't have access to the lsusb -v of the UFX1204
> soI'm
> >     > waiting for someone to share it here in the list or in the bugzil=
la
> >     > thread. This patch needs some more love from the community.
> >     >
> >     > ---
> >     >
> >     > This one has been bugging me for quite a while. I went deep hard =
in
> >     > the guts of ALSA to try to solve it, and it turned out to be a
> minor
> >     > thing apparently. The problem is old, and every UFX1604 Linux use=
r
> can
> >     > attest that it's impossible to use 96000hz in DUPLEX mode without
> >     > annoying pops and clicks on the capture stream.
> >     >
> >     > The fix is simple: after we alter the CLOCK_SOURCE to match our
> sample
> >     > rate, let's tell the CLOCK_SELECTOR we want CLOCK_SOURCE 212
> (synced
> >     > to USB SOF) on pin 1. Solves the problem for me, no more pops and
> >     > clicks while on 96000hz.
> >     >
> >     > ---
> >     >
> >     > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> >
> >     Thanks for the patch.
> >
> >     But we'd like to avoid the setup with a magic ID number.
> >     Judging from what it achieves, does the change like below give the
> >     similar effect?
> >
> >     We might need to apply it conditionally, so this is just meant for
> >     testing.
> >
> >     Takashi
> >
> >     --- a/sound/usb/clock.c
> >     +++ b/sound/usb/clock.c
> >     @@ -324,6 +324,8 @@ static int __uac_clock_find_source(struct
> >     snd_usb_audio *chip,
> >                     ret =3D __uac_clock_find_source(chip, fmt,
> >
> selector->baCSourceID[ret -
> >     1],
> >                                                   visited, validate);
> >     +               if (ret > 0)
> >     +                       uac_clock_selector_set_val(chip, entity_id,
> cur);
> >                     if (!validate || ret > 0 || !chip->autoclock)
> >                             return ret;
> >
> >
>
