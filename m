Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 951CB5DF11
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 09:42:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3461B1686;
	Wed,  3 Jul 2019 09:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3461B1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562139732;
	bh=IO5WkDZxRrOPjGbuUxPvWtiGJgirK2ZK1uHYfaYoldg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HDxa8v656z6ButLhmxJO/s+5h7Kom0+3CQKuRuRCKQGmxyCGNFm0IbemmF0RbTEVI
	 /O2UaJIwg9wiV9AsPVg3F/SEwQ1XJq82FyduHCssLO8Z3AWEVtP0bJYOBKCX8Atdcc
	 e0A/77oJ8jf1OEfQyzshHlxi7p9QVel5L1/fukGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEEA8F800F2;
	Wed,  3 Jul 2019 09:41:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2497F800F2; Wed,  3 Jul 2019 09:41:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EA04F800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 09:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EA04F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rZCjRQWY"
Received: by mail-lf1-x141.google.com with SMTP id b29so1047641lfq.1
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 00:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IKyuInfM4Pq7UoEEbbB45ixd+6CMWtZlmKvDBgScc5g=;
 b=rZCjRQWY8jPbPU8BZkHHqvuKBrWGXgZ/M2VVKc8mLIkWtdXijZMkkEGgB18YzBxa23
 ieXa0kg/obNBw8AiqN+31XYZdKZk8Fxjz6Aa9fdA+kcjnXP1Ffovzcrp1kKbOtBRuPfT
 8y1SOHvt6x6OwRqUo2q3btFZ8b6RmU9V4zIMaEmHXi+AllXXjM/KbXGLs2nF5b9e+kf/
 Z0O6hmcP7gtWwOYCnn4lzIUkcuhR8OECUaxMsUq6l2tysuBnCQ3xGtBzj4UVskUOqZd7
 l+pc/cR9TTxsrwPRs3/DSLVn4PlBhZgdjwXKjUloRZ2lifXiEwoPLTvXLUVk1KAmfRa/
 7NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IKyuInfM4Pq7UoEEbbB45ixd+6CMWtZlmKvDBgScc5g=;
 b=d2eTBQvhK5QYJSFkSE/ACbW8i2Mz6kJpf0QQ2Ugm2muLAB9e0SGq53kMlaKd1y1gq7
 4bnDpiJ575PqVfUDW3SZmZEbkjFz3MIf7lNmRsfTWJzxD1iF7Sp7K+8+HjgGycDQaTEt
 1wpCFYYZBG0cae7ZyGHrBPx43dHgFbIrFFQPVdF+xr9xFfR7EliJhfHnWvXrlhi70AX9
 BEzLZ+fAk6LlQ2eVZ6KzBjiW+bBiDGpSUQmaRqxQa69gW6J6dN6FcAsEMtnJ88MQfAAH
 Ve+NEqCuE7ovbJmE4SRsthd2UHHd+I93AXIKIsSA8jWZqZ68EEzFjOdMaPvbACB8dzUy
 rbWw==
X-Gm-Message-State: APjAAAUvWrbVtVCnPJDc1dTvE7EGNZlPEKtT9miJjyx0kVKwWtpvVNtY
 j3bW9YUtI1GhlRSVhVwqDUJ7KWxMB10FLYp4bbs=
X-Google-Smtp-Source: APXvYqz+mVYvXCIs64EMDoG6waSuyd+cO82TiyAyuI5GnFY0vsFmlCxyNBxXY62lQTpoFbgpxyT1Nf4DpTx+GgBx950=
X-Received: by 2002:ac2:514b:: with SMTP id q11mr17459577lfd.33.1562139672565; 
 Wed, 03 Jul 2019 00:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190702004439.30131-1-nick83ola@gmail.com>
 <s5hlfxg4i4r.wl-tiwai@suse.de>
 <4181a467-5332-c256-5124-513a0343ec70@linux.intel.com>
 <s5ha7dw4egd.wl-tiwai@suse.de>
In-Reply-To: <s5ha7dw4egd.wl-tiwai@suse.de>
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 3 Jul 2019 08:41:00 +0100
Message-ID: <CABPh3UMttE1s7oNt0-JLNm2N3wxb-JXBTLzMYZM42ENiy9NC9Q@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, info@jensverwiebe.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, "Wasko,
 Michal" <michal.wasko@linux.intel.com>, Jussi Laako <jussi@sonarnerd.net>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: fix Line6 Helix audio
 format rates
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue 2 Jul 2019, 16:57 Takashi Iwai, <tiwai@suse.de> wrote:

> On Tue, 02 Jul 2019 17:52:01 +0200,
> Wasko, Michal wrote:
> >
> > On 7/2/2019 4:37 PM, Takashi Iwai wrote:
> > > On Tue, 02 Jul 2019 02:43:14 +0200,
> > > Nicola Lunghi wrote:
> > >> Line6 Helix and HX stomp don't support retrieving
> > >> the number of clock sample rate.
> > >>
> > >> Add a quirk to return the default value of 48Khz.
> > >>
> > >> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> > > It's not particularly good place to put a quirk, but there seems no
> > > other better place, unfortunately.


If you prefer I can add a function to quirk.c

Is this specific to certain unit
> > > or all I/Os on the device suffer from this problem?
>

This is specific to the helix line of line6
There are currently 4 devices in that line that I think shared their
firmware more or less.
Unfortunately I have only one device to test here (but maybe someone else
can add the others)

> >
> > > In anyway, if the behavior is expected, we don't need to use
> > > dev_warn() to annoy users unnecessarily.  Replace it with dev_info().
> > >


Ok


> > Also, the code that creates a single 48k entry would be better to be
> > > put into a function for readability.
> > >
> > > Could you resubmit with that change?
> > >
>

Yes (in quirks.c or here?)

Also I suspect that there' s a way to get the clock rates because windows
driver supports getting the rates and switching (and in Mac the device has
the same problem without a custom driver only supports 48khz)

> >
> > > Thanks!
> > >
> > > Takashi
> >
>

Thank you

> If the listed USB devices do not support sample rate format retrieval
> > then maybe it would be a better idea to perform below check before
> > sending message?
>
> Yes, if we know that it always fails, we don't need to query.
>

Sorry I don't understand this :-)

My idea is that if line6 in the future fixes their code (they are quite
active on the helix line) the call will not fail and we get a proper device
without quirks.
But If the driver fail to get the clock this settings works as a "failsafe"
and get the device working.
I also tried to contact their support but they don't care a lot about Linux
for now :-(

I will clean this better and resubmit
Thank you
Nick

>
> > Have you also considered new function or macro that check device
> > support? This would separate formatfunctionality code from routine
> > that identifies applicable devices- in case if in future more devices
> > will require quirk.
>
> The split can be done later.  It's always hard to know what kind of
> quirk would be needed in future.  If any more devices show the same
> problem, we can reorganize the quirk in a saner way.
>
>
> thanks,
>
> Takashi
>
>
>
>
> >
> > Michal W.
> >
> > >> ---
> > >>   sound/usb/format.c | 28 +++++++++++++++++++++++++---
> > >>   1 file changed, 25 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/sound/usb/format.c b/sound/usb/format.c
> > >> index c02b51a82775..05442f6ada62 100644
> > >> --- a/sound/usb/format.c
> > >> +++ b/sound/usb/format.c
> > >> @@ -313,10 +313,32 @@ static int parse_audio_format_rates_v2v3(struct
> snd_usb_audio *chip,
> > >>                          tmp, sizeof(tmp));
> > >>            if (ret < 0) {
> > >> -          dev_err(&dev->dev,
> > >> -                  "%s(): unable to retrieve number of sample rates
> (clock %d)\n",
> > >> +          switch (chip->usb_id) {
> > >> +          /* LINE 6 HX pedals don't support getting the clock sample
> rate.
> > >> +           * Set the framerate to 48khz by default
> > >> +           */
> > >> +          case USB_ID(0x0E41, 0x4244): /* HELIX */
> > >> +          case USB_ID(0x0E41, 0x4246): /* HX STOMP */
> > >> +                  dev_warn(&dev->dev,
> > >> +                          "%s(): line6 helix: unable to retrieve
> number of sample rates. Set it to default value (clock %d).\n",
> > >>                            __func__, clock);
> > >> -          goto err;
> > >> +                  fp->nr_rates = 1;
> > >> +                  fp->rate_min = 48000;
> > >> +                  fp->rate_max = 48000;
> > >> +                  fp->rates = SNDRV_PCM_RATE_48000;
> > >> +                  fp->rate_table = kmalloc(sizeof(int), GFP_KERNEL);
> > >> +                  if (!fp->rate_table) {
> > >> +                          ret = -ENOMEM;
> > >> +                          goto err_free;
> > >> +                  }
> > >> +                  fp->rate_table[0] = 48000;
> > >> +                  return 0;
> > >> +          default:
> > >> +                  dev_err(&dev->dev,
> > >> +                          "%s(): unable to retrieve number of sample
> rates (clock %d)\n",
> > >> +                                  __func__, clock);
> > >> +                  goto err;
> > >> +          }
> > >>    }
> > >>            nr_triplets = (tmp[1] << 8) | tmp[0];
> > >> --
> > >> 2.19.1
> > >>
> > >>
> > > _______________________________________________
> > > Alsa-devel mailing list
> > > Alsa-devel@alsa-project.org
> > > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> > >
> >
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
