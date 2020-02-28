Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C452172EED
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 03:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3427416E1;
	Fri, 28 Feb 2020 03:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3427416E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582858563;
	bh=oYE5fShZEKgury+3yLdJjOoldJzsqRvkFeknBJT5awk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+q1Od9Z3veJkzzmhwrVB3CSjHNOhWwSQ39WtsMNlFoWMtQFWZActzRRvGK8IbwLZ
	 SBAvFNsOTiPVrwcw9hJDjz9A2QXAoZjlt7DKZOSpaIfnnAgPWQCXS+repLG0EI+1Y9
	 dQDkBSNcszo/JN9egmNy3oIonK4B4P2QMIjO7Xes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B3E9F80086;
	Fri, 28 Feb 2020 03:54:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36B5BF8014E; Fri, 28 Feb 2020 03:54:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11069F80086
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 03:54:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11069F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TBD1vGhu"
Received: by mail-qt1-x842.google.com with SMTP id r5so1006381qtt.9
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 18:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=22hz3EXYq0SzN1Wu2fonmhGKwST6HFX0P3UPEDmpwXo=;
 b=TBD1vGhuloKu8RtFPWQxFgHHziYiJYOdde1353qzy2LmcoeF0TiDjDX1vZWq4i+I1G
 PxOGEuwdm3jskEG8pUt/6K0JSYZJ0j+CUnc9p9tBIyyk6ljb/P7YZkENFlOKudEIAHIz
 lYZu3V4cVEiJhkcItpRev2T8F2Xv+xbwvQMzSApqjce7q0xJzmAlfnCRx7iznMqtFpMw
 D9hPjaUJnzrxXvBACyVYK5QgZxg449iJK2ULaQ3hg4IfAgfp2YuQsaC0pP09+/AMME+N
 e7XkK8nJFvXHADovHj3sQyLpUp4qgFKouUF/Xr15HR9gMjka5EcBntqIZbCRQm7aoS9P
 Mm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=22hz3EXYq0SzN1Wu2fonmhGKwST6HFX0P3UPEDmpwXo=;
 b=hIXerSynrJPmySZEF9gNxrptGM6WMwjpnzNrclHEZbCilHmNkCusrzcdn/S8eXu22/
 SMq1Px0zteFQrG/Ew2XnShqpCLGd/tec5yrLTY6GGBzQtl+22OSBqJWAJPoXJXXI+gV+
 wln+Fy8yox/ayuyxee4NOizR/Oe0DnoARlUZqG+SNPgfxFU88E/rJT+DLDUdVdsits8f
 tzaVcQiU2JTdKsAydOZgFPPli6kDWYcbvmlA67qkS8UNf11hRlY2ybnp9kQA3CQWQNf/
 5aLBBaHkfQX1yJor5bfj3MRKwIBuZu4txo3YAg/oY5G79P+a+oYcbGoMUvB6Awj5PWQO
 HyjA==
X-Gm-Message-State: APjAAAVYSN8SuYweJZVwSpdnQwaOH423/4dgxv+JDv8hVcokhL5sinje
 cIpfQEHo+B1qjS1zl8zEi7b8S+nJuSJ8rfDNDrE=
X-Google-Smtp-Source: APXvYqx40ohLVeMfivRLcPCJq0RBwQ9BYmvFVQpKE5DzCFxMCXj1+DIF7ZrkDxeYve2lklZXhdcB7wpqqqroi1Qjtfk=
X-Received: by 2002:ac8:7b45:: with SMTP id m5mr2482318qtu.360.1582858453803; 
 Thu, 27 Feb 2020 18:54:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
 <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
 <CAA+D8AMzqpC35_CR2dCG6a_h4FzvZ6orXkPSYh_1o1d8hv+BMg@mail.gmail.com>
 <20200227174540.GA17040@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200227174540.GA17040@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Feb 2020 10:54:02 +0800
Message-ID: <CAA+D8AM6t79cPoNmt-8HbGwTSM9bfXSW8g76HtkCF7eauL_Xmw@mail.gmail.com>
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

Hi

On Fri, Feb 28, 2020 at 1:45 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Feb 27, 2020 at 01:10:19PM +0800, Shengjiu Wang wrote:
> > On Thu, Feb 27, 2020 at 11:43 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Thu, Feb 27, 2020 at 10:41:55AM +0800, Shengjiu Wang wrote:
> > > > asrc_format is more inteligent variable, which is align
> > > > with the alsa definition snd_pcm_format_t.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
> > > >  sound/soc/fsl/fsl_asrc.h     |  4 ++--
> > > >  sound/soc/fsl/fsl_asrc_dma.c |  2 +-
> > > >  3 files changed, 14 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > > index 0dcebc24c312..2b6a1643573c 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.c
> > > > +++ b/sound/soc/fsl/fsl_asrc.c
> > >
> > > > @@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
> > > >
> > > >       pair->config = &config;
> > > >
> > > > -     if (asrc_priv->asrc_width == 16)
> > > > -             format = SNDRV_PCM_FORMAT_S16_LE;
> > > > -     else
> > > > -             format = SNDRV_PCM_FORMAT_S24_LE;
> > >
> > > It feels better to me that we have format settings in hw_params().
> > >
> > > Why not let fsl_easrc align with this? Any reason that I'm missing?
> >
> > because the asrc_width is not formal,  in the future we can direct
>
> Hmm..that's our DT binding. And I don't feel it is a problem
> to be ASoC irrelative.
>
> > input the format from the dts. format involve the info about width.
>
> Is there such any formal ASoC binding? I don't see those PCM
> formats under include/dt-bindings/ folder. How are we going
> to involve those formats in DT?

There is no formal binding of this case.

I think it is not good to convert width to format, because, for example
width = 24,  there is two option, we can select format S24_LE,  or
format S24_3LE,  width is ambiguous for selecting.

In EASRC, it support other two 24bit format U24_LE, U24_3LE .

if we use the format in DT, then it is clear for usage in driver.


best regards
wang shengjiu
