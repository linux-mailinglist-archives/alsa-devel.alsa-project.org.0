Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E40103457
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 07:38:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6984F168D;
	Wed, 20 Nov 2019 07:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6984F168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574231902;
	bh=5GzD2ZH/1h9XgAHmcHrlkO8MkWA9xSPcnTEhsbLNueg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ng4Dl8rm0UM7wUiPAqrTQ0Ss7swZI9Uh5DXLBkWrIi6bGU7yYbVkAWufByMEwR4Bi
	 8NlvAgItOX0Fb/f7QprmRDpMS9Q9BjO93jPeOKxW16Ml4ti4HFY3jOqCajSqySsRVi
	 umSgca7KZ95gtD8VARb6gx40eF+WQNHDb7n3H6EY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E94F8013C;
	Wed, 20 Nov 2019 07:36:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BE43F8013D; Wed, 20 Nov 2019 07:36:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFACBF800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 07:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFACBF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sNZtLV2I"
Received: by mail-ot1-x343.google.com with SMTP id n23so20228939otr.13
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 22:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qz8K1NegNb60DTp2Com7mCQE4UT33oZDNN0Nv6Xc5SA=;
 b=sNZtLV2IBQzUsPjrX6v1xYqtvginEM91OU8HfHPwaVyUzVak26TcG6M84g2XdQAOG9
 T+ZhR+3PTJXrja/qs78ll42pyZjmGF+c7IXhoicUMVeUISViMogwez8ENR1anTcx0nKA
 g0IUbMzExF6UIu/qIuBw+9IuQNqe1ZtwVIyssB2L0fo3j8H7rZGHJDutn+r108pbCnj6
 Iu6BlplY4vZb0M/apuxyzOe0MUoO0ch1Pm8Jm+lQcUGYzWQG0te7bCces4nbZTlEck+D
 T9JTYz0BUMx7h5B8Rfv386MFk4nBGWAS6wwb4C4Cmr4PIb5/OIV7SlMwaedIn+CYZuGy
 HkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qz8K1NegNb60DTp2Com7mCQE4UT33oZDNN0Nv6Xc5SA=;
 b=EeR07Zb7tTCJgvf2ebIgx1lUZFwl5lqrkzRc4uV52a7SFEGcts6KW2XpxXzrjLVmZH
 qfxo2mAmrbw1FKAZQJUifun1vX8ZNe7VKTz5WTevorp02rdxR/d1qevovXknfozELktZ
 pOQxxbNnyPovtWT5utvrpJnAVfvLkyE4IN3r72x32Mgpq6BJp72C41jbiFjnqQsiKKoB
 2Q2BV6ZD2f0glPcJIweKJps5T/30LasLQLyP9n7hs7BU7e2GvE+DKTRmW6fwJwnoQm7d
 q78EbGW8PmC6o6k/MLsmZJO1s8GSBYDREoXrPF049QGZPy2uDerSb9S0EuzjiJjoghvX
 +JgA==
X-Gm-Message-State: APjAAAWx1ORT9j8ApVUiUUQshn8vHxcVH3i8IRixSNxCT/sWfODSZIhA
 JHARsy+7JA/qiVx63yBUtsNsbOJg8/KAaeQvxRKL8Hu4
X-Google-Smtp-Source: APXvYqzx8NcPauifXzKQ0lp8kieTXNYDRIVLFF68DzbkhUfUnq7HXiL3eC4qqfa9IiS5EhaOSNaaG3/ig2U4vhCywV8=
X-Received: by 2002:a05:6830:1149:: with SMTP id
 x9mr702697otq.47.1574231790429; 
 Tue, 19 Nov 2019 22:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20191120042856.415854-1-rosenp@gmail.com>
 <20191120042856.415854-4-rosenp@gmail.com>
 <s5hlfsbvzb9.wl-tiwai@suse.de>
In-Reply-To: <s5hlfsbvzb9.wl-tiwai@suse.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 19 Nov 2019 22:36:19 -0800
Message-ID: <CAKxU2N_2yLB3g9UqXzkRQ1NNNyfXPKXRLP6A3pMHV+Vkpz5QSw@mail.gmail.com>
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

On Tue, Nov 19, 2019 at 10:26 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 20 Nov 2019 05:28:56 +0100,
> Rosen Penev wrote:
> >
> > If the progress bar somehow becomes negative, it ends up overwritting
> > tmp. Fixes this GCC warning:
> >
> > aplay.c:1747:18: warning: '%02d' directive writing between 2 and 11 bytes
> >  into a region of size 4 [-Wformat-overflow=]
> >  1747 |    sprintf(tmp, "%02d%%", maxperc[c]);
>
> This is false-positive.  The value passed there is guaranteed to be a
> positive integer at the calculation time.
Sure. But best to silence GCC. It probably optimizes better this way.
>
>
> thanks,
>
> Takashi
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  aplay/aplay.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/aplay/aplay.c b/aplay/aplay.c
> > index 72fa567..9c5a11b 100644
> > --- a/aplay/aplay.c
> > +++ b/aplay/aplay.c
> > @@ -54,6 +54,8 @@
> >  #include "formats.h"
> >  #include "version.h"
> >
> > +#define ABS(a)  (a) < 0 ? -(a) : (a)
> > +
> >  #ifdef SND_CHMAP_API_VERSION
> >  #define CONFIG_SUPPORT_CHMAP 1
> >  #endif
> > @@ -1741,7 +1743,7 @@ static void print_vu_meter_stereo(int *perc, int *maxperc)
> >                       line[bar_length + 6 + 1 + p] = '+';
> >               else
> >                       line[bar_length - p - 1] = '+';
> > -             if (maxperc[c] > 99)
> > +             if (ABS(maxperc[c]) > 99)
> >                       sprintf(tmp, "MAX");
> >               else
> >                       sprintf(tmp, "%02d%%", maxperc[c]);
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Alsa-devel mailing list
> > Alsa-devel@alsa-project.org
> > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
