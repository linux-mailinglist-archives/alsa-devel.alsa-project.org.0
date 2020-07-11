Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213921C5AA
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jul 2020 20:18:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEDB71662;
	Sat, 11 Jul 2020 20:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEDB71662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594491501;
	bh=TaRrKoO5E92kuYQrphKKHnH2qH6NXVy4wMAYu+w/WDw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H7pPCP6RYTzvHA8hkgAhIsO0oiEF8ZXxqxAK0h6RasR7gXQGrX6fHx3/MwIPezm4S
	 8ilIYSnv/lyptnHzrJQP6l+Q3IbZin7D9rRrt4uxUsjAE5/mJMMYvwYM8BGh0s7WAG
	 CGbdlwjVa4DVL2AtAE3hbFSsR+ugA4Wh9qt4F4xQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04FFCF80084;
	Sat, 11 Jul 2020 20:16:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 599D0F80216; Sat, 11 Jul 2020 20:16:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C992DF80084
 for <alsa-devel@alsa-project.org>; Sat, 11 Jul 2020 20:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C992DF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X0fjdQ81"
Received: by mail-il1-x143.google.com with SMTP id q3so7820896ilt.8
 for <alsa-devel@alsa-project.org>; Sat, 11 Jul 2020 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=geu2kZgahNe9b5KHjjbh7SFWlsAj55pE2E75iM1ych0=;
 b=X0fjdQ810z3wTjdJay1KUkowDb+URPCThXgTUgZ5mxV3PJ/aSIF+bJ8IUiYLEQk/hj
 rmwx5PF05Q+ZQtt3tlCafxCUtsZjGcrC2pjuB0JUr250pGqXsjAXx3JQKtnFs2ptrq+m
 6TFqO0jMjPL/6Mw8cqInWtgJZ3VV2qOubS1m6JnkIPszLALgig0co7MQ6npyfWtRSjJp
 cnWUSkaVlNuZYU40L8cyKAL2ozPDGuX9wuu/6+QfsfmxYgJE2oED3KA8HDmi65MtO50d
 18j7CRCshuNJMX43CGDQj2UJ4gdPJadD8xOg1/CYUI6/h3NGL3EsQhY2ofFCVdgpagSt
 YMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=geu2kZgahNe9b5KHjjbh7SFWlsAj55pE2E75iM1ych0=;
 b=WQENAYsW+Q4VDsOpjGi2H4SbzZ3sDv9B6RVdzKpSqZaSdLyzf0P9yIQIpvDRk+XkmO
 qrtSbfeo+U7TghjHLWphkiiknFxNUs3Q9n3sAyvgQWfsMU9dzqap4TF54wWyllfDZYji
 YOhVJOlPskEiSeaTvDWJOZ5uMl8J9pRXagN22SGavN+5ZLiXn7DaWHBxB1hyUruFs/2X
 eq2BEcwv0oz+WW3ibe51uV0O+gLtqQYKp+bp1obEIAl/L2as5h6REIMfDwZB/GjAdH3V
 skHPx7utQfd7JgjS2LXvw6LHhLWKfA2dVhH6rnrNOcNJZCbgAnx2zUnlsEmkxfiXQYCQ
 nD4g==
X-Gm-Message-State: AOAM5324q0bFrhMcePv75VPGRu/lhWLJZyAbXOUMr+Hf6Bp36zjCU/3Q
 aswy/CdvgNKuHyCONOTKxKMmBTXtzaq51Dmdh84=
X-Google-Smtp-Source: ABdhPJwpw5572tWDlCz5wNVisy7er9T7PNOSVi4wAApd2GV67UhMooli2i5OYJk6kw5hqHKV56lQtFIw/W/A+/L8awY=
X-Received: by 2002:a92:1547:: with SMTP id v68mr28974624ilk.294.1594491387694; 
 Sat, 11 Jul 2020 11:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200711070835.4855-1-navid.emamdoost@gmail.com>
 <s5htuye2zjn.wl-tiwai@suse.de>
In-Reply-To: <s5htuye2zjn.wl-tiwai@suse.de>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sat, 11 Jul 2020 13:16:16 -0500
Message-ID: <CAEkB2ESiSEt6Rhs7iyni7C79LEUSCiKvtfxXRHzHU+dmkSag0A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: trident: Fix a memory leak in snd_trident_create
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
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

On Sat, Jul 11, 2020 at 4:04 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 11 Jul 2020 09:08:30 +0200,
> Navid Emamdoost wrote:
> >
> > In the implementation of snd_trident_create(), the allocated trident is
> > leaked if snd_trident_mixer() fails. Release via snd_trident_free().
>
> No, this patch would result in double-free.
>
> The manual release of trident object isn't needed once after it gets
> added via snd_device_new().  Then it'll be automatically released at
> the error path (via snd_trident_dev_free()).

Thanks for the clarification.

>
>
> thanks,
>
> Takashi
>
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> >  sound/pci/trident/trident_main.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
> > index 6e50376163a2..e98c692f6aa9 100644
> > --- a/sound/pci/trident/trident_main.c
> > +++ b/sound/pci/trident/trident_main.c
> > @@ -3582,8 +3582,11 @@ int snd_trident_create(struct snd_card *card,
> >               return err;
> >       }
> >
> > -     if ((err = snd_trident_mixer(trident, pcm_spdif_device)) < 0)
> > +     err = snd_trident_mixer(trident, pcm_spdif_device);
> > +     if (err < 0) {
> > +             snd_trident_free(trident);
> >               return err;
> > +     }
> >
> >       /* initialise synth voices */
> >       for (i = 0; i < 64; i++) {
> > --
> > 2.17.1
> >



-- 
Navid.
