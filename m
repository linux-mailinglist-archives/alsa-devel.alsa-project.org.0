Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F0D3AB658
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:46:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3864117AD;
	Thu, 17 Jun 2021 16:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3864117AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623941181;
	bh=dNNQFnvhswWiJMjX3iDhTmDZnbZ9SP7jbdxGUJBURw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDcN2hGPZz0lBn9hwtK7LiJiEWou9cBr4zOea8H7KqX34grmZylsHUxNgfYwjQ0rv
	 nhp3PE8l0Kd7R04CkeUr1mc1O+Jn6P9glOrL+mgD8CZkMcpWv1KEQk/zJzLG1voBd+
	 wTvrK27r+awHBbBV5Kzu/7HjHol0LMVEjcAeJSfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C729F805C7;
	Thu, 17 Jun 2021 16:35:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B207EF8025A; Thu, 17 Jun 2021 14:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D616F80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 14:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D616F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G861an8P"
Received: by mail-pj1-x102b.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so5797437pjo.4
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 05:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7j6ui82C3Q+yfIJpsh1KXzxS70VcWmmv393YkvqCZis=;
 b=G861an8PtYU5auXGhG8k2swCfG9jZxnfO0wXUcvlpxtxvtkIo7i9XEs833CWUiGshA
 Hh6IAJUgmv8dHBx7cFyDVz5XP+3Odki7vDb1o1WorMofp4kRUJQnHld41KWid24BQCpE
 bAPG3sxef84fdRafJo/ska7qYaFsRVjQoSgFk7APUu6/oxYupIj0x2V5t23+56mtKRjL
 FmrODWJKY7pukev5bI7SPpFmKkfJ5wgE0Vux+p9UKP+6uOOV4dnvbVJ3W7O82ar8SUkV
 us7/GGTLw+l4UzZ3UJWQgSv9KEIYxCDSm0YzC0Fe31yC+pfdFv1VLMH0zhK8u0jQpS1w
 oKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7j6ui82C3Q+yfIJpsh1KXzxS70VcWmmv393YkvqCZis=;
 b=CFLR85raiDcjOmZCgxogwfC5YJ0pudQdZmx+tnvO+UUQMY8HrzKmNLBG9c9LpXHd/E
 cm0sbta3wLhGolaBDF7srVx0r2sp7c169qxAWr7QTV9z4rfqANINHxRtqmowmP/jja/4
 k3C676lvEwMi3YldX7+7Wuwt+8S6MSsud7fsbLbRxxtF0zoHW7ON4k1TzDTGVReXg1Wy
 +SfGs30TqMvpnWlUEao1FTMlz+yxwrbApilEEAQJpg2bmfnoqdOkgruhK/+y+IOcGXXv
 d7LtW1PxucXpEfNTABVLMHs1ReNBbqToVhvClmJaHStOFhAHN8AXzww8Ek+Gy87MVUJ3
 MyJw==
X-Gm-Message-State: AOAM5312dRg32WQ8YEf+KWJpY96cAKm0Dx3pF66VBBsoVnvLPAym2LaP
 ufjhk/fp/wgCMG9VGCGBGDaSUbxrk9p93MYt0dRHkKe7Fhbv
X-Google-Smtp-Source: ABdhPJxaI//ySQM/6KClcEDFG8whdVkseChcSlm+tz1wGgj2pKzs5Z0Xx+xk3J0xI2gBrDLpboMGAhCMPZdcijM56bY=
X-Received: by 2002:a17:90a:aa98:: with SMTP id
 l24mr5343340pjq.156.1623932334117; 
 Thu, 17 Jun 2021 05:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210615130326.2044-1-fengzheng923@gmail.com>
 <20210615132207.GG5149@sirena.org.uk>
 <CAE=m61-kHPeKNvEEc08w8DeUwssGPWNf5UaYojRPNZRJ0v=arw@mail.gmail.com>
 <20210617104828.GA5067@sirena.org.uk>
 <CAE=m618Gtx_RQ4+h=8+TFvbcuSTpNWVcx1bry+8OggL6uDCzfw@mail.gmail.com>
 <20210617120747.GB5067@sirena.org.uk>
In-Reply-To: <20210617120747.GB5067@sirena.org.uk>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Thu, 17 Jun 2021 20:18:43 +0800
Message-ID: <CAE=m618zRgqd8vP=ugyZv0RMcENY5ZCmznrFOR6SoovKNpMCag@mail.gmail.com>
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

Hi,

Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8817=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=888:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jun 17, 2021 at 07:50:42PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> > Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8817=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:48=E5=86=99=E9=81=93=EF=BC=9A
> > > On Thu, Jun 17, 2021 at 03:42:43PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> > > > Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8815=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:22=E5=86=99=E9=81=93=EF=BC=
=9A
>
> > > No, that's what you have already make the entire thing a C++ comment
> > > with //s.
>
> > I don=E2=80=99t understand. For example, sun4i-codec.c sun4i-i2s.c
> > sun8i-codec.c and sun4i-spdif.c files are the same as mine.
>
> Other people doing a bad job is no excuse for doing a bad job yourself.
>
> > Which file can I refer to? what should I do......
>
> Make every line of the comment start with //.  See soc-core.c

Thanks, I understand, I will fix it in v2.
