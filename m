Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF6F746E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 14:01:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E144167A;
	Mon, 11 Nov 2019 14:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E144167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573477272;
	bh=LmbLATKjDLsCC8sFqN70ijYWU4Uz6WMyerWcLyHSZ6U=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JggccCo11F0Ixjo1xNqMLsQG/lUst/YJF9m+ex4yq/VtV770/OklZ+FmPp/YaPvBy
	 2bwMENWtfhF2comqDnB3CW6suB4uPIZYx4g+SkW0kqvBWqXMC5EKkkNYvWxan9lStM
	 LhElp+Prdu02wBWBvgLX7BhxfhsLzvEih0+KV2C8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9872DF80518;
	Mon, 11 Nov 2019 13:59:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A217F804FF; Mon, 11 Nov 2019 13:59:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B343F802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 13:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B343F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O8TpWEM1"
Received: by mail-wr1-x442.google.com with SMTP id a15so14505482wrf.9
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 04:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h4ubUXtKB+J2uUhFjOOYE/2DGaUw76V9ImU/UoPSd30=;
 b=O8TpWEM1zGN5JwYiXACyejO7elmVd/iwBpF91Bd2ZnSE+j/HHDU/insUNU7DnLKpdZ
 oUkOs5qn4NpTMYIuMsOcYJ2GmJak18C1L7ZRfiVxRNZFaGRLqvEzSbz+xd1ObzBHdvDn
 WBrjSXpX8bXvWgL+wKqCudksk8dnwZqRqvpj0HnFJUI4NLTQl2HO46mfISiZ5Db4oEwt
 2IL+Z51y6+8Yy56FzJWIBynCj0zC7+4Wtpb4fp6FBsCWWcg3MuaDARwwVxLtuoNtIaVB
 rdT0kH7QgZpbZCQ+6lqlWmPGpVtdpdBn+Le1aorzrinqEiVlCGM6SBAnBQdKRJxjB9/d
 k2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h4ubUXtKB+J2uUhFjOOYE/2DGaUw76V9ImU/UoPSd30=;
 b=akiHzZ/f6Ao4kS+h6ewLwZ+OfH2Q1n4bXwaLice9QVE2dAwS8Tbs1ToPtxioi3TqtG
 Ubage8lqQKEeX4RoFjWR/ORiBRQyfkvI1/0pMG69ES0Ts2u/oaMfwArars10c9OljTss
 DxHw8EnS13xUrfFWCh87CtRtI7jO2vaFoJP881w9U+jp2SilODUEdJ7i9FE0Xp9f+o2Q
 XctPq56q6Bvm46Ep7cTHoJW//hI4wp/xneFyxB25rBOvuAtf+DCVSuzg7YuCwUr9QN7g
 A14nMot0G2nsFdcW2MZnQGwcFWKLWi8n//Q+E5eYnZmCJX+VqgzB16L2wJtyhrxm6Asd
 EVug==
X-Gm-Message-State: APjAAAWCatt2CcgHEWkICcXs0TDPSvsHE2Nurj/EOYsRBQ8tXyZB/JrP
 BW1QqbCl+TPYhApdGowMIs5+W30heN+j1uSi9Bk=
X-Google-Smtp-Source: APXvYqwCXiI2RgOZKsqVZVpR+X3dtB+xlXATxh/NM04aXvEKxz+b9oxnwC+Y0L+gQ1sWGTP9xIkuxWq/fm1g0fHzUWE=
X-Received: by 2002:a05:6000:1181:: with SMTP id
 g1mr21673345wrx.131.1573477158306; 
 Mon, 11 Nov 2019 04:59:18 -0800 (PST)
MIME-Version: 1.0
References: <1e706afe53fdd1fbbbc79277c48a98f8416ba873.1573458378.git.shengjiu.wang@nxp.com>
In-Reply-To: <1e706afe53fdd1fbbbc79277c48a98f8416ba873.1573458378.git.shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 11 Nov 2019 14:59:07 +0200
Message-ID: <CAEnQRZAVpF39PPDQyoquWv8s=EhcJ1a4Nn+fCvuq_b9kHUiGOA@mail.gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH V2] ASoC: fsl_audmix: Add spin lock to
 protect tdms
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

On Mon, Nov 11, 2019 at 9:53 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Audmix support two substream, When two substream start
> to run, the trigger function may be called by two substream
> in same time, that the priv->tdms may be updated wrongly.
>
> The expected priv->tdms is 0x3, but sometimes the
> result is 0x2, or 0x1.
>
> Fixes: be1df61cf06e ("ASoC: fsl: Add Audio Mixer CPU DAI driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
> Change in v2
> -add Fixes, Cc stable, and Acked-by.
>
>  sound/soc/fsl/fsl_audmix.c | 6 ++++++
>  sound/soc/fsl/fsl_audmix.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index c7e4e9757dce..a1db1bce330f 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>                                   struct snd_soc_dai *dai)
>  {
>         struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
> +       unsigned long lock_flags;
>
>         /* Capture stream shall not be handled */
>         if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> @@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               spin_lock_irqsave(&priv->lock, lock_flags);
>                 priv->tdms |= BIT(dai->driver->id);
> +               spin_unlock_irqrestore(&priv->lock, lock_flags);
>                 break;
>         case SNDRV_PCM_TRIGGER_STOP:
>         case SNDRV_PCM_TRIGGER_SUSPEND:
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +               spin_lock_irqsave(&priv->lock, lock_flags);
>                 priv->tdms &= ~BIT(dai->driver->id);
> +               spin_unlock_irqrestore(&priv->lock, lock_flags);
>                 break;
>         default:
>                 return -EINVAL;
> @@ -491,6 +496,7 @@ static int fsl_audmix_probe(struct platform_device *pdev)
>                 return PTR_ERR(priv->ipg_clk);
>         }
>
> +       spin_lock_init(&priv->lock);
>         platform_set_drvdata(pdev, priv);
>         pm_runtime_enable(dev);
>
> diff --git a/sound/soc/fsl/fsl_audmix.h b/sound/soc/fsl/fsl_audmix.h
> index 7812ffec45c5..479f05695d53 100644
> --- a/sound/soc/fsl/fsl_audmix.h
> +++ b/sound/soc/fsl/fsl_audmix.h
> @@ -96,6 +96,7 @@ struct fsl_audmix {
>         struct platform_device *pdev;
>         struct regmap *regmap;
>         struct clk *ipg_clk;
> +       spinlock_t lock; /* Protect tdms */
>         u8 tdms;
>  };
>
> --
> 2.21.0
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
