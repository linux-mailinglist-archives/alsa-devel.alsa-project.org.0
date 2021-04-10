Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BDD35B065
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 22:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 273E8166F;
	Sat, 10 Apr 2021 22:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 273E8166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618086260;
	bh=rzjoW5y1os2ghHOrS3jRkRsJNO1WpW8C77o7dy7wEKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S6L/35px8EAaOfFSVF27pmnaOcG+loYXNeMo1rDsC0zlTmYXbxaD5cXkFWJyDIe8s
	 dWK/LrSXTEdnFKnjMhDH7be95vyr9grWd6Rf73Ix9HThsr1diR8ZHtsFr3IIcbsmG8
	 XJvtVFnDgA46lPBeqdLQdX/sP344+ai7NrRn4Hto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6275F800BC;
	Sat, 10 Apr 2021 22:22:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14D1BF8020B; Sat, 10 Apr 2021 22:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_14,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6596F800BC
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 22:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6596F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mDYqB8z3"
Received: by mail-qk1-x72e.google.com with SMTP id y5so9388723qkl.9
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pWx+g5C2b59oUvv0UPB3YgC5jb8Pxeuk1BOGyaPagVA=;
 b=mDYqB8z3VA/0glm0sOcmXe5uKM6Xx9cj4mWjlWZrkAbvJIVyXvzJ+Xy5IkmDheXcG8
 9OsbHfB5/NdLh2o9Yz5+IVDtM6JZJ1ha2jYR1V4aZACFBIy9AL0rS76yHL4y5bBLbi93
 Wg/Z/QOdS+5C/chUYgiQxy7fVAltyp7wgq/gpNcEvYdcXdUzSc6fNDpqMoGKNDFYK/gE
 5PlmNkArBGDA74O8tRh3se56axRCJOfGEf8TusasyWF22m+ckdUYqq96fQR+pl6o5xrG
 k7ndtVYcv2P4obRvd3zUneeEklbNuKvmWVUt2B98jg3Wa+dBw86L+/p5FwZhEGqfuC62
 JoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pWx+g5C2b59oUvv0UPB3YgC5jb8Pxeuk1BOGyaPagVA=;
 b=CPXURrF+iqtWXkdnXxPqukc2eykkbKKOprLheiX2lcqNCcOeRBCbwuP69w0ca7TzYv
 dqrHLqleYDRusWIBcTMws2bvu7OYzho83JDTqMqQSPJilMG8hnnG+C2orlx39N7+l47+
 CqeP/KUZlE9+B+0wvXgA4A2poLMadxbqM/2C6wZJ53cDajT4AV7YAYVmj0Acf+azTJon
 Z1/O+7c6A6DQCzp2fpku5iGgDFY8cr4QA+FjeP44QPTPLsl8hY1xT3OaRJH9MIv2Y2zG
 z+VBBfgglSn/DDiQNEeJ7j3WV1uoR+U/7dhBimeP5bAmjJOAj0XQblQy30xVlvBOGEzV
 zbvQ==
X-Gm-Message-State: AOAM531t9lLF0twM7YzgHWKSxMMk2219THrYHgWH1McoMSBALnLmSsZr
 7ueptIeFp7zYThA/jQgrnNUhG6CURz01g7NnQlU=
X-Google-Smtp-Source: ABdhPJwtaTvHLDP6eb5hx9Xya4/RbAxLRbbip6/kjyXbvZ77axprjvqjql+S0y6qATFsjQYH3OEriDgPDIIqPJESevc=
X-Received: by 2002:ae9:f444:: with SMTP id z4mr20286670qkl.226.1618086153455; 
 Sat, 10 Apr 2021 13:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcvF7LnO8PxyyCxuRCx=7jNeSCvFAd-+dE0g_rd1rOxxdw@mail.gmail.com>
 <s5h8s5q4irr.wl-tiwai@suse.de>
In-Reply-To: <s5h8s5q4irr.wl-tiwai@suse.de>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 10 Apr 2021 17:27:15 -0300
Message-ID: <CAEsQvctCoHpe8U5HY70d++mcoYQw5gbd7zdLpkcOGyzgU0PLEQ@mail.gmail.com>
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

OK, Dr. Iwai, only briefly tested but at least on my setup, JACK starts at
96000hz and I am able to record my voice in Ardour 6, with no pops and
clicks detected.

I'll record a full acapella just to be sure, but these 96000Hz pops and
clicks I used to experience - with that implicit feedback hack on by the
way - tended to be evident within seconds, not intermittent and very
annoying.

Now I turned the implicit feedback hack off for both the UFX1604 and the
UFX1204 on my tree and with your two lines of code I have crystal clear
sound.

I took the liberty to comment your clever hack inside clock.c and the pops
/ clicks problem reappears on 96000Hz. PulseAudio users (see
https://bugzilla.kernel.org/show_bug.cgi?id=3D199327 ) will generally run a=
t
44100Hz and won't be affected so much by noise because the clock selector
will be "tied" to the standard 48000Hz of these mixer desks DAC, in that
invalid state but close enough to the main clock rate.

Henceforth the general confusion where people complain the forced implicit
feedback made PulseAudio break for their UFX1604 / UFX1204, but they do not
experience noise. This approach should solve both problems by disabling
implicit feedback on the synchronous endpoints but making sure the sound is
crystal clear even at 96000Hz.

Thank you,
Geraldo

Em S=C3=A1b, 10 de abr de 2021 05:59, Takashi Iwai <tiwai@suse.de> escreveu=
:

> On Sat, 10 Apr 2021 03:36:14 +0200,
> Geraldo Nascimento wrote:
> >
> > More complete patch disabling unneeded implicit feedback and setting
> > clock selector to default clock on rate change for UFX1604
> >
> > After re-reading https://bugzilla.kernel.org/show_bug.cgi?id=3D199327 i=
t
> > is even more clear to me that implicit feedback for the
> > UFX1604/UFX1204 needs to be disabled.
> >
> > This is a more complete patch that disables that and for the UFX1604
> > only sets the clock selector to its pin 1 default clock synced to the
> > USB SOF upon rate change. This is needed because apparently the
> > endpoints are hardwired to the clock selector and after we change the
> > rate on the main USB SOF synced clock the clock selector is left in a
> > halfway state in regards to the sampling rate.
> >
> > That's why the pops and clicks aren't evident at stock 48000Hz, become
> > slightly audible at 44100Hz and detestable at 96000Hz. Seems the clock
> > selector needs a nudge or it will screw up the sync.
> >
> > Unfortunately I don't have access to the lsusb -v of the UFX1204 soI'm
> > waiting for someone to share it here in the list or in the bugzilla
> > thread. This patch needs some more love from the community.
> >
> > ---
> >
> > This one has been bugging me for quite a while. I went deep hard in
> > the guts of ALSA to try to solve it, and it turned out to be a minor
> > thing apparently. The problem is old, and every UFX1604 Linux user can
> > attest that it's impossible to use 96000hz in DUPLEX mode without
> > annoying pops and clicks on the capture stream.
> >
> > The fix is simple: after we alter the CLOCK_SOURCE to match our sample
> > rate, let's tell the CLOCK_SELECTOR we want CLOCK_SOURCE 212 (synced
> > to USB SOF) on pin 1. Solves the problem for me, no more pops and
> > clicks while on 96000hz.
> >
> > ---
> >
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
>
> Thanks for the patch.
>
> But we'd like to avoid the setup with a magic ID number.
> Judging from what it achieves, does the change like below give the
> similar effect?
>
> We might need to apply it conditionally, so this is just meant for
> testing.
>
>
> Takashi
>
> --- a/sound/usb/clock.c
> +++ b/sound/usb/clock.c
> @@ -324,6 +324,8 @@ static int __uac_clock_find_source(struct
> snd_usb_audio *chip,
>                 ret =3D __uac_clock_find_source(chip, fmt,
>                                               selector->baCSourceID[ret -
> 1],
>                                               visited, validate);
> +               if (ret > 0)
> +                       uac_clock_selector_set_val(chip, entity_id, cur);
>                 if (!validate || ret > 0 || !chip->autoclock)
>                         return ret;
>
>
