Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 067073AB657
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:46:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C5817A8;
	Thu, 17 Jun 2021 16:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C5817A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623941159;
	bh=ZzfNRq8VlfTSVxlffgyExpOk1y7AxRbVDBop4Zo+QZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QuKdTUJKRlKtEKOwVE8dcDjAu+dtC/ofMH7zJpYCOzewBrgYUmRaT38ouuhV6j06r
	 EXAhGPeXqzIR+xaNRx7ezq/x39w2TEWLELlfMxjU97FR6rDNGXoW5IhKl8s8tDXwi4
	 EXxMDQPbK58yyhl9RL3vi+eaQZO5bjP0iWgiPs94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42504F805C3;
	Thu, 17 Jun 2021 16:35:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CE5FF8025A; Thu, 17 Jun 2021 13:51:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61146F8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 13:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61146F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HTT19X0V"
Received: by mail-pg1-x533.google.com with SMTP id e20so4811401pgg.0
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 04:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sKn9UvDVlydbDfhyjcKiR8IQebdYWuPzRo3dE9qFvzU=;
 b=HTT19X0V095oJRTCzBuNJaVN4HZknbDw48KwzexgYxUe8fSxFHwWmx5qCuxOySbqY8
 oIhrj+O7sEtFlIQnJUWc8B3UDDiWZ7L1eX+0I1whFlp2IFctgF1Yqe1T6dpLJVdywUwi
 PnSOnmgj0c1OGJ0xVWQh8sAzW5NzMZoXHcglUWLoaCW+5qtIOnvVlJcA2IUv9VijrNbJ
 +w0wJnCaVH4AG3cNaf10KKxvykGRkz4rzk461fN+Y+f3xL4ZsAqVxFlqDmQ9byYf3XlY
 a3nzvcDFou6GLpDPGfHO9wQEClE2m9vU5ZIbj2FddMNRAanPHC78pShAINAcd0YZzSyG
 BitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sKn9UvDVlydbDfhyjcKiR8IQebdYWuPzRo3dE9qFvzU=;
 b=I1aaxlA1T3tu5SfLf8f4c116yO/rttE3VwyBOPo1mW+7mz0jvamQNbBZQ5UNi/ZLRm
 6AES4mVKnGEzVFuzQ8qg07tm1239VLiA5yB0Bt543s1ZybT/I1HKOILVTv+uBObEIwVc
 QTISsOiHuJjODeqUs51oaC0O29gEz8b56dWZ/CwtIMyXRxKu/PDttiq+Fj5aUnMNG+Cx
 SBkX3EVnToRvJrIw1IioB66qDFRs/x+Br4zjNxvxSckyqEwUW0Dh2VpP7UENeXflAog/
 uJ+BY/neBWtwXlv7l5sH8w1r/owa4t45FRLCTDtjWIGX6uSj9aoTjwBiphdQsLL8XZVm
 lGGg==
X-Gm-Message-State: AOAM531NnprR7hEHAmw4QPtI4X3pDOO9W786CqEK0SoZqJbYon97xGJ/
 t5dh7mvZJtsODxSr81kArekWgYUmd44UkO5Y7g==
X-Google-Smtp-Source: ABdhPJzLsfs3op+S3slb9TqsEE9rDKBjbpT/kYfZDNwghaNqG6qtKFP/8gazWOPOPVAsKMwERdZcGU0aiuCW4mmYCy4=
X-Received: by 2002:a63:f344:: with SMTP id t4mr4676265pgj.314.1623930653336; 
 Thu, 17 Jun 2021 04:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210615130326.2044-1-fengzheng923@gmail.com>
 <20210615132207.GG5149@sirena.org.uk>
 <CAE=m61-kHPeKNvEEc08w8DeUwssGPWNf5UaYojRPNZRJ0v=arw@mail.gmail.com>
 <20210617104828.GA5067@sirena.org.uk>
In-Reply-To: <20210617104828.GA5067@sirena.org.uk>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Thu, 17 Jun 2021 19:50:42 +0800
Message-ID: <CAE=m618Gtx_RQ4+h=8+TFvbcuSTpNWVcx1bry+8OggL6uDCzfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:34:45 +0200
Cc: alsa-devel@alsa-project.org, krzk@kernel.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, jernej.skrabec@gmail.com, lgirdwood@gmail.com, wens@csie.org,
 mripard@kernel.org, p.zabel@pengutronix.de, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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

Hi=EF=BC=8C

Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8817=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jun 17, 2021 at 03:42:43PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> > Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8815=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:22=E5=86=99=E9=81=93=EF=BC=9A
>
> > > > @@ -0,0 +1,408 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * ALSA SoC DMIC Audio Layer
> > > > + *
> > > > + * Copyright 2021 Ban Tao <fengzheng923@gmail.com>
> > > > + *
>
> > > Please make the entire comment a C++ one so things look more
> > > intentional.
>
> > For example;
> > // SPDX-License-Identifier: GPL-2.0-or-later
> > /*
> >  * This driver supports the DMIC in Allwinner's H6 SoCs.
> >  *
> >  * Copyright 2021 Ban Tao <fengzheng923@gmail.com>
> >  *
> >  */
> > is this OK?
>
> No, that's what you have already make the entire thing a C++ comment
> with //s.

I don=E2=80=99t understand. For example, sun4i-codec.c sun4i-i2s.c
sun8i-codec.c and sun4i-spdif.c files are the same as mine.
Which file can I refer to? what should I do......
>
> > > > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +     base =3D devm_ioremap_resource(&pdev->dev, res);
> > >
> > > devm_platform_ioremap_resource()
> >
> > But I need to get the register base address of DMIC. E.g res->start.
> > host->dma_params_rx.addr =3D res->start + SUN50I_DMIC_DATA;
>
> OK.
