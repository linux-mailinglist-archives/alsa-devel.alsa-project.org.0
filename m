Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E9173137
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 07:42:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3117D16DA;
	Fri, 28 Feb 2020 07:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3117D16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582872125;
	bh=VzMNSRKzSlHvgQ8hCkTSHfhD+LYPhXJG5KlM2pzLjsk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nPK6XDoAsvb1q76RyumzajMC1mAbDoKqcVv1gdlPbVI0U7u7Dz9XWR2wWxLIoVCav
	 ICT8hgd8KsSrSxRpm3OkTycaC802Rkgqz782gi9O04sT4Kv0xVWiC5mAJzcbT+lhDC
	 AuYSTZ5L/4KGLiYdu+5AsFCSGrtnQmsDpFqmpOhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFEEF80113;
	Fri, 28 Feb 2020 07:40:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BF78F8014E; Fri, 28 Feb 2020 07:40:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_14, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F1E7F80113
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 07:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F1E7F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cUNucea0"
Received: by mail-pf1-x442.google.com with SMTP id i6so1222114pfc.1
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 22:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6jLyDf7HA1xjI2cZ4/f5NFCTmMji2H18M6eJIfWLIio=;
 b=cUNucea0ep9rRh4qhvCRUETrPpzkdl6LG35PtOFQM5BNV+zzYrhbJIb+v/2enqZjlb
 wcq94TO7o1VPlARsPE9s2/bj5AyOkFq1DXyYl7IR/IkmkflhSFKnPeTYsncfw0Fv7VwJ
 C6MG8BNhaqckcKv7WktCQiR6NWeyo6abFbX9o6YCefEdTHq+SSOEK8wAcrO61oTRzrko
 nXMFkTTxJLRSPLMJ5MNQT2FTQAtLvZ+b0W5/EFeLsyDiC+xHHZ7hly4FOCftRgp3Tcsn
 npJDw3lRZco6at1H4Hn8nKv+YCvg8ACIHJM4TlVgo43hbvaWB4/HrkQHxOp2PCL7AC0r
 ufug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6jLyDf7HA1xjI2cZ4/f5NFCTmMji2H18M6eJIfWLIio=;
 b=VX2J4cSPFXfm/bJQAfN8D1Epfq62qSi/g9C6N/+DRM1iBaZppiw82L3R2dmu7MfjjX
 hXj+7Np+ppht+Tz80NNM14orQqtES+EzoiyrOnFgEFGD4sh5iVIIL+vx7EKsIzcK9rje
 Q5hV6sNuGVQd7kxGQVKyQHL6P5dNi0O77ckBFyUvcXLTDZevO8JAb5CMJZAEQzf0nNJ8
 weiaRHZC/hor+HSv6MBlwZrxXBr+PV5Nhk55BumRIjMLWZLG9l4z3TaQZZS+5LpU1RZx
 dPEMBRVGzirGz6wDuwa5f9bNPMn79iUACKViaqawrVKTVPW9wrlEQUhPdEebH1RogVZy
 GYeQ==
X-Gm-Message-State: APjAAAUmJMXJpHSRzhDpXvUgUSwSZil+ChsmwXZk3BDvY7OnlkIuqEdF
 vN2dx++W4VArSUjMw6TgDZg=
X-Google-Smtp-Source: APXvYqw2E+Kw7R0gNcvM5/xBp+Mo7r/IZp42jhZvRCSqeJUpfX2x+jEWuRWEd+uGspE5Km1km0p/6Q==
X-Received: by 2002:a63:82c6:: with SMTP id w189mr3010846pgd.357.1582872015725; 
 Thu, 27 Feb 2020 22:40:15 -0800 (PST)
Received: from NICOLINC-LT.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 13sm8609829pgo.13.2020.02.27.22.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 22:40:15 -0800 (PST)
Date: Thu, 27 Feb 2020 22:40:09 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: fsl_asrc: Change asrc_width to asrc_format
Message-ID: <20200228063958.GA473@NICOLINC-LT.nvidia.com>
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
 <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
 <CAA+D8AMzqpC35_CR2dCG6a_h4FzvZ6orXkPSYh_1o1d8hv+BMg@mail.gmail.com>
 <20200227174540.GA17040@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM6t79cPoNmt-8HbGwTSM9bfXSW8g76HtkCF7eauL_Xmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AM6t79cPoNmt-8HbGwTSM9bfXSW8g76HtkCF7eauL_Xmw@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Feb 28, 2020 at 10:54:02AM +0800, Shengjiu Wang wrote:
> Hi
> 
> On Fri, Feb 28, 2020 at 1:45 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Thu, Feb 27, 2020 at 01:10:19PM +0800, Shengjiu Wang wrote:
> > > On Thu, Feb 27, 2020 at 11:43 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > >
> > > > On Thu, Feb 27, 2020 at 10:41:55AM +0800, Shengjiu Wang wrote:
> > > > > asrc_format is more inteligent variable, which is align
> > > > > with the alsa definition snd_pcm_format_t.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > >  sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
> > > > >  sound/soc/fsl/fsl_asrc.h     |  4 ++--
> > > > >  sound/soc/fsl/fsl_asrc_dma.c |  2 +-
> > > > >  3 files changed, 14 insertions(+), 15 deletions(-)
> > > > >
> > > > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > > > index 0dcebc24c312..2b6a1643573c 100644
> > > > > --- a/sound/soc/fsl/fsl_asrc.c
> > > > > +++ b/sound/soc/fsl/fsl_asrc.c
> > > >
> > > > > @@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
> > > > >
> > > > >       pair->config = &config;
> > > > >
> > > > > -     if (asrc_priv->asrc_width == 16)
> > > > > -             format = SNDRV_PCM_FORMAT_S16_LE;
> > > > > -     else
> > > > > -             format = SNDRV_PCM_FORMAT_S24_LE;
> > > >
> > > > It feels better to me that we have format settings in hw_params().
> > > >
> > > > Why not let fsl_easrc align with this? Any reason that I'm missing?
> > >
> > > because the asrc_width is not formal,  in the future we can direct
> >
> > Hmm..that's our DT binding. And I don't feel it is a problem
> > to be ASoC irrelative.
> >
> > > input the format from the dts. format involve the info about width.
> >
> > Is there such any formal ASoC binding? I don't see those PCM
> > formats under include/dt-bindings/ folder. How are we going
> > to involve those formats in DT?
> 
> There is no formal binding of this case.
> 
> I think it is not good to convert width to format, because, for example

The thing is that fsl_easrc does the conversion too... It just
does in the probe instead of hw_params(), and then copies them
in the hw_params(). So I don't see obvious benefit by doing so.

> width = 24,  there is two option, we can select format S24_LE,  or
> format S24_3LE,  width is ambiguous for selecting.
> 
> In EASRC, it support other two 24bit format U24_LE, U24_3LE .

I understood the reason here, but am not seeing the necessity,
at this point.

> if we use the format in DT, then it is clear for usage in driver.

I think this is the thing that we should address first. If we
have such a binding being added with the new fsl_easrc driver,
I'd love to see the old driver aligning with the new one.

Otherwise, we can keep the old way, and change it when the new
binding is ready.
