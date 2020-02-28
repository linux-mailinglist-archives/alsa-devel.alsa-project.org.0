Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5170173178
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 07:58:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2315616DA;
	Fri, 28 Feb 2020 07:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2315616DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582873128;
	bh=jNcAgDAb+9Zu7K2MR9gNRO9FTP8wsjbay/MGjPdVEeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FP5Z2oSxFgFlELlU/up/QqLbvmtKwrnn94C7GglgvVtu7tOJYo2kzC8k4tKHrZk1g
	 porVl24JYr1udvN1ha3f6Oft50Z1rJ4AoXWG3gXiFT8wr5Sm3uyOWuvQ/3Wzpv0b22
	 kSrQg01TSsIu9YFEzyjA5l3xR8bgBXElj5Hx7u18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2550DF8014D;
	Fri, 28 Feb 2020 07:57:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE002F8014E; Fri, 28 Feb 2020 07:57:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_14, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AFDAF80086
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 07:57:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AFDAF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZKbwFGtP"
Received: by mail-qv1-xf44.google.com with SMTP id o18so898791qvf.1
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 22:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y01M/2zdHCZcq/LUwDdnQfmblvhfbJOn2D+Py6njg7g=;
 b=ZKbwFGtPtc2xfkSIQh1fpVq2oIEcHMYmuGCZgeHsYFzw6OrDBybr7dn68Ya6Haf12t
 4vU4ZDPCwz/A8AuWJON2bqbmPVLFJP7BgcWM/moPEl4FAinQuPpI2DYx5geA/nHXcA/K
 GCDXCScmwy7+mQHcGNMyA+STiUkaz0BwlCl9ctxf18xxXTukTMCg1p3eTCbkojg8fo5k
 0u0DUmmXRhcOvC2VPcUHs5w//ck4/LHiObI0OVIM6hCI1rX3b0oZ2yD65ima+PxeIIro
 tAlElbsYlY52UiaPrnpoIHCLHKFUAo6+jaGrKFymTy8slT8vP8vyeNYbNA2YVZRtN6c0
 W2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y01M/2zdHCZcq/LUwDdnQfmblvhfbJOn2D+Py6njg7g=;
 b=Vo0MxOEJVf8GQJD39LHj8TcoM43C9/EHiMSRnWZznzSlRrpdtMRUTI5FFRkMyMYV/F
 XXuZ/u1CV6aOkMDn+meqk4vgyD+8KyBMh9fbS5gDEL3H9L9x2doaVBjymqHeAJKhWZfz
 oeB542flVF+FY0EnMOomYCrbG93hgCdLBWzPrgPoEGnaMAi5dUPbUfmv6K3LPkGYTBgD
 494SCBzdUbTqTgw+fGUdk0cNzcqj46v2R5x2xdGtNgD2i3ZYf0xU3MAOb3DGjg+hqqhd
 iKUUalS2ob8AHoxNQKbuB8hhmZdPSy3OZ2HuBQJIzdSUIVzl8TcREYdBo09G7Zp99+wG
 wzAg==
X-Gm-Message-State: APjAAAWdFa+OfF6fQ80mnXfk9qpGE7k0e0iLR9GlD635veE3ZGwhQSrR
 9x92WE62SxhPvf2gK0H8iPtmUd7ORA1ym9M+R7w=
X-Google-Smtp-Source: APXvYqzj5j0vPNWa4F9PJfSQ8lKIGPn+N9t3wsMNUwuluF4E14JSjeMvx2/NNDaPp5uF+vkPGCMI5QJ3InE97/22PGw=
X-Received: by 2002:a05:6214:a46:: with SMTP id
 ee6mr2639365qvb.32.1582873018570; 
 Thu, 27 Feb 2020 22:56:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
 <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
 <CAA+D8AMzqpC35_CR2dCG6a_h4FzvZ6orXkPSYh_1o1d8hv+BMg@mail.gmail.com>
 <20200227174540.GA17040@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM6t79cPoNmt-8HbGwTSM9bfXSW8g76HtkCF7eauL_Xmw@mail.gmail.com>
 <20200228063958.GA473@NICOLINC-LT.nvidia.com>
In-Reply-To: <20200228063958.GA473@NICOLINC-LT.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Feb 2020 14:56:47 +0800
Message-ID: <CAA+D8AMAV=d8FDL4wmUaAx7h7ZBaTZyKJcwXqkA+oWDLLF6oYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: fsl_asrc: Change asrc_width to asrc_format
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Feb 28, 2020 at 2:40 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Fri, Feb 28, 2020 at 10:54:02AM +0800, Shengjiu Wang wrote:
> > Hi
> >
> > On Fri, Feb 28, 2020 at 1:45 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Thu, Feb 27, 2020 at 01:10:19PM +0800, Shengjiu Wang wrote:
> > > > On Thu, Feb 27, 2020 at 11:43 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > > >
> > > > > On Thu, Feb 27, 2020 at 10:41:55AM +0800, Shengjiu Wang wrote:
> > > > > > asrc_format is more inteligent variable, which is align
> > > > > > with the alsa definition snd_pcm_format_t.
> > > > > >
> > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > ---
> > > > > >  sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
> > > > > >  sound/soc/fsl/fsl_asrc.h     |  4 ++--
> > > > > >  sound/soc/fsl/fsl_asrc_dma.c |  2 +-
> > > > > >  3 files changed, 14 insertions(+), 15 deletions(-)
> > > > > >
> > > > > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > > > > index 0dcebc24c312..2b6a1643573c 100644
> > > > > > --- a/sound/soc/fsl/fsl_asrc.c
> > > > > > +++ b/sound/soc/fsl/fsl_asrc.c
> > > > >
> > > > > > @@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
> > > > > >
> > > > > >       pair->config = &config;
> > > > > >
> > > > > > -     if (asrc_priv->asrc_width == 16)
> > > > > > -             format = SNDRV_PCM_FORMAT_S16_LE;
> > > > > > -     else
> > > > > > -             format = SNDRV_PCM_FORMAT_S24_LE;
> > > > >
> > > > > It feels better to me that we have format settings in hw_params().
> > > > >
> > > > > Why not let fsl_easrc align with this? Any reason that I'm missing?
> > > >
> > > > because the asrc_width is not formal,  in the future we can direct
> > >
> > > Hmm..that's our DT binding. And I don't feel it is a problem
> > > to be ASoC irrelative.
> > >
> > > > input the format from the dts. format involve the info about width.
> > >
> > > Is there such any formal ASoC binding? I don't see those PCM
> > > formats under include/dt-bindings/ folder. How are we going
> > > to involve those formats in DT?
> >
> > There is no formal binding of this case.
> >
> > I think it is not good to convert width to format, because, for example
>
> The thing is that fsl_easrc does the conversion too... It just
> does in the probe instead of hw_params(), and then copies them
> in the hw_params(). So I don't see obvious benefit by doing so.
>
> > width = 24,  there is two option, we can select format S24_LE,  or
> > format S24_3LE,  width is ambiguous for selecting.
> >
> > In EASRC, it support other two 24bit format U24_LE, U24_3LE .
>
> I understood the reason here, but am not seeing the necessity,
> at this point.
>
> > if we use the format in DT, then it is clear for usage in driver.
>
> I think this is the thing that we should address first. If we
> have such a binding being added with the new fsl_easrc driver,
> I'd love to see the old driver aligning with the new one.
>
> Otherwise, we can keep the old way, and change it when the new
> binding is ready.

ok,  I will change the binding this time in next version.

best regards
wang shengjiu
