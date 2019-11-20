Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1451042BD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 19:00:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E642B1749;
	Wed, 20 Nov 2019 18:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E642B1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574272820;
	bh=hlhYBV95UU2+fm1b/m9FxfKXWHuQXZqzfWShIzWVj7I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I6XLwH1cfmbj2m9m4rukMYfixmDJiz53Cyvq6B6RznMGypiTtBGmvJJG3SLSL9h38
	 tA6topSLSLtxnqTIFzlLXOwrEOTPp8etJRRKbGsyUHFwCrL2Fx7AGO7TMMsxqLxNA7
	 PWWQe4+a3crFzVxNojERfDSvBWzxpuHsq78A2gR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22365F80160;
	Wed, 20 Nov 2019 18:56:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B028F80160; Wed, 20 Nov 2019 18:56:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99C39F8015E
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:55:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99C39F8015E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k2KwKcMm"
Received: by mail-oi1-x242.google.com with SMTP id s71so538889oih.11
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 09:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GP9Nfbs8Vs06X+4MJM8B1jJrBxYKX4ZtXqp7aohh5Lk=;
 b=k2KwKcMmI6kJJmfjL3agKy7Hbrf6k5BQCZgZSZkatXMsaPozNMVjVbSBlEDBdf5xaC
 NsKOLL3rkrv2ULLbQ0JwoL8jLITOfodf3nWZ+Jy3zWV4EdqWs7t6lFxILnF8weKls/EF
 cd4Z9U0YMME3zyzy6jMbwG0NrgGAko2zbWVm0EIApQegdIdxb7lLfTM+ESAr7FWu+7zt
 qLvp/TSK8d8eQfHk0ZiwXwm71AAHdQGsculB0kZeGnJljpb1XJY6OnPKRMx7iClCONuz
 RNvH2APNjCyKfadP0gzQ0eJGkBUPFTfKkt2N3CjnMz52NE2gQi8MCvOeXOTKxInqnhnT
 zs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GP9Nfbs8Vs06X+4MJM8B1jJrBxYKX4ZtXqp7aohh5Lk=;
 b=NYBg1OmVlv3HlIyR9QETrljzHRnBE2NrWz+nlZx1KBdsdXWhZ60troOZ/pvHEb6pAR
 KsMfXPgnXqWAZachnlaRY/n8miLNV3EyUEugvay2Ptvs0e+Sde1RpJ9QqNwgKcvead+c
 NiuG0AYG1f0aCVhQAKUvEzUaJkZ01sFpJRx5BC5w05kiOSBS6yc6xvQJc9wO/sFIo4gx
 rs5RyzaCcuoHA72OlWRzGTOjhJSDRdzJ3NuCoYy1nYdZD1/5aYYhdZBc9mcnqQk/FdvP
 SGc8PeHcdoUvCdUGfu/D8/wl9CQwMH27ksUUNWFxQnsHKPgFfZqTAYceRJ7wdb5PT2TL
 h3pg==
X-Gm-Message-State: APjAAAXrzNk+WPh+nHLh19dfLCvgw1Qic9j3CyPCX0hlXx99XqVx+KLg
 uLfnuoD13X5nr9X7HiaCTxSHHtFtcSwdBFqP40A=
X-Google-Smtp-Source: APXvYqwRClFXsJiEfHWJwEj0Bxa33UyPbNSebx0ZfxkSueQ/DWeQ1HxMKaZNEN3p8oZdaLcp1BHvfQMmWA4Y2bvr2/c=
X-Received: by 2002:a05:6808:4c3:: with SMTP id
 a3mr4067298oie.40.1574272554222; 
 Wed, 20 Nov 2019 09:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20191120042856.415854-1-rosenp@gmail.com>
 <20191120042856.415854-4-rosenp@gmail.com>
 <s5hlfsbvzb9.wl-tiwai@suse.de>
 <CAKxU2N_2yLB3g9UqXzkRQ1NNNyfXPKXRLP6A3pMHV+Vkpz5QSw@mail.gmail.com>
 <s5hh82zvy9f.wl-tiwai@suse.de>
In-Reply-To: <s5hh82zvy9f.wl-tiwai@suse.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 20 Nov 2019 09:55:43 -0800
Message-ID: <CAKxU2N9e=gab5axaZZVswOB_ihB=RU-xg08WNZA+LBfBMprL8A@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 4/4] aplay: Limit VUMeter progress bar to
 100 for negative as well
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

On Tue, Nov 19, 2019 at 10:48 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 20 Nov 2019 07:36:19 +0100,
> Rosen Penev wrote:
> >
> > On Tue, Nov 19, 2019 at 10:26 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Wed, 20 Nov 2019 05:28:56 +0100,
> > > Rosen Penev wrote:
> > > >
> > > > If the progress bar somehow becomes negative, it ends up overwritting
> > > > tmp. Fixes this GCC warning:
> > > >
> > > > aplay.c:1747:18: warning: '%02d' directive writing between 2 and 11 bytes
> > > >  into a region of size 4 [-Wformat-overflow=]
> > > >  1747 |    sprintf(tmp, "%02d%%", maxperc[c]);
> > >
> > > This is false-positive.  The value passed there is guaranteed to be a
> > > positive integer at the calculation time.
> > Sure. But best to silence GCC. It probably optimizes better this way.
>
> I guess this adds more code in binary.  Comparing with 99U would work?
I tried that. Here are some results:

134348 for this patch
134832 if changed to U. Also tried casting lhs to unnsigned int, same size.
135125 originally

I understand this is an exercise in micro-optimization, but still.

Sizes are in bytes. It's the size of a compressed OpenWrt archive.

>
>
> Takashi
>
>
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  aplay/aplay.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/aplay/aplay.c b/aplay/aplay.c
> > > > index 72fa567..9c5a11b 100644
> > > > --- a/aplay/aplay.c
> > > > +++ b/aplay/aplay.c
> > > > @@ -54,6 +54,8 @@
> > > >  #include "formats.h"
> > > >  #include "version.h"
> > > >
> > > > +#define ABS(a)  (a) < 0 ? -(a) : (a)
> > > > +
> > > >  #ifdef SND_CHMAP_API_VERSION
> > > >  #define CONFIG_SUPPORT_CHMAP 1
> > > >  #endif
> > > > @@ -1741,7 +1743,7 @@ static void print_vu_meter_stereo(int *perc, int *maxperc)
> > > >                       line[bar_length + 6 + 1 + p] = '+';
> > > >               else
> > > >                       line[bar_length - p - 1] = '+';
> > > > -             if (maxperc[c] > 99)
> > > > +             if (ABS(maxperc[c]) > 99)
> > > >                       sprintf(tmp, "MAX");
> > > >               else
> > > >                       sprintf(tmp, "%02d%%", maxperc[c]);
> > > > --
> > > > 2.23.0
> > > >
> > > > _______________________________________________
> > > > Alsa-devel mailing list
> > > > Alsa-devel@alsa-project.org
> > > > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> > > >
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
