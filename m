Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA01D6BE17
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 16:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402691692;
	Wed, 17 Jul 2019 16:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402691692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563373154;
	bh=SRvUDuxWXXajwryKBoROksfz9dx/9JScsexyPk+LwkM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UlILNjVDnccFsGS3HTLR34fhuUt7RPW9DqYzt3h9HxQKSoy3t4IJE1k5QxXKolxb+
	 c1iKVJ0vCNAS8mNgeNBM6SxkJRtmj8OjDUShp6QF/HnuTZgdKQ9gvyOz0co9eusyrR
	 1rabVNlT/LNqlPL2uFXoiUpWXnVzcvvfRSlf25QY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F0FCF80363;
	Wed, 17 Jul 2019 16:18:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51AC1F80368; Wed, 17 Jul 2019 16:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77967F800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 16:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77967F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FJwEg+3U"
Received: by mail-wm1-x341.google.com with SMTP id l2so22372856wmg.0
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLTQGP9cL7hQ2jiEejSD208ILTFApcOVK38rFTlsJxE=;
 b=FJwEg+3UvvBv5MKO8S5ClHUirNY0MfFkHjUO/HYd/HRYlhsd0R0WoJu8gHN5jogQqO
 4Te7Cgr3+LCnzsKWK35uSNwubkJc3hoekuJGI76uH7QWT1LahSGS2OpmQSlZPbAp89Jc
 4hvsk/77ka0ifu90EmFVyfmIaZ6ZP2ao78NcT8ZLRm8lsI8BwUeXkH8N04xOnUS8kXQQ
 xfFw4pIOmRTPzCoWlTtXUA+Fs9mtUaWm976nJawhnYheVATNtATG+5HqxRT6w/ZMG1Wf
 jp4MqYOdLkMozgr5AzrzTPWSwafFoVdi1rsXZELLmvXc8+qpM5M0rQLIXELnIDbq5kvN
 0pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLTQGP9cL7hQ2jiEejSD208ILTFApcOVK38rFTlsJxE=;
 b=dK+rqhopIOpYoSL7RZfJDRncZ2qSMKoIXcIHmqOelYpHxd6BQzKybwaKA4Zfa/0RCC
 Eu5o4BxpmAya6Uf4lb10LGugmdsSmq7OPwH6j80xDbuwAt0E0tPyCIMmt6uCSLi/w0lY
 Yc4T1N8noOROte3BUzeIOC6+WT470Fcn/CUuT67iDkD5ippf+gypwWj2omR2EJz3gBzT
 1qsq89UwDLt4mRfqziYC+JNWwbEFQC2FLpI7n7qEG8ABty2dXChJSBV/mvcY2WrJfxAB
 DKB4fDgEieBuIVZfAjFQ4J1SEp39HKyoFyxNq8GptGHBlL9FBULsnL6E4ofsRnBqg3sL
 eRJQ==
X-Gm-Message-State: APjAAAWZfI6oG6HY2UJd1GT/nTFdauLsJq3u6tTnCBcw5SiYrUpX2lcP
 g2ISMkwai0cFi+BjngOYqd+QfjpmbB2r95S+km0=
X-Google-Smtp-Source: APXvYqwxcxOWPjTh5Qg3T26KGcOWFzIbdgKf62PP7W01OwhN5aW3i6I9ivw6VC/vE2FxWWUDYEC6faOcfPGK7FqX35o=
X-Received: by 2002:a1c:18d:: with SMTP id 135mr36854079wmb.171.1563373087577; 
 Wed, 17 Jul 2019 07:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-2-l.stach@pengutronix.de>
In-Reply-To: <20190717105635.18514-2-l.stach@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 17 Jul 2019 17:17:56 +0300
Message-ID: <CAEnQRZArHbjnmJnR-cNRJ9tixuA5CeU0WV7kt=7_FGx4HpdsDQ@mail.gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Angus Ainslie <angus@akkea.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, patchwork-lst@pengutronix.de,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: fsl_sai: add of_match data
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

On Wed, Jul 17, 2019 at 1:58 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> New revisions of the SAI IP block have even more differences that need
> be taken into account by the driver. To avoid sprinking compatible
> checks all over the driver move the current differences into of_match_data.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

This is the way I handled in my patch series too. So,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/fsl/fsl_sai.c | 22 ++++++++++++++--------
>  sound/soc/fsl/fsl_sai.h |  6 +++++-
>  2 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 812c94fbb160..3a1ed8b857d6 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -9,6 +9,7 @@
>  #include <linux/dmaengine.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> @@ -798,10 +799,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         sai->pdev = pdev;
> -
> -       if (of_device_is_compatible(np, "fsl,imx6sx-sai") ||
> -           of_device_is_compatible(np, "fsl,imx6ul-sai"))
> -               sai->sai_on_imx = true;
> +       sai->soc_data = of_device_get_match_data(&pdev->dev);
>
>         sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
>
> @@ -910,7 +908,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> -       if (sai->sai_on_imx)
> +       if (sai->soc_data->use_imx_pcm)
>                 return imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
>         else
>                 return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> @@ -923,10 +921,18 @@ static int fsl_sai_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
> +       .use_imx_pcm = false,
> +};
> +
> +static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
> +       .use_imx_pcm = true,
> +};
> +
>  static const struct of_device_id fsl_sai_ids[] = {
> -       { .compatible = "fsl,vf610-sai", },
> -       { .compatible = "fsl,imx6sx-sai", },
> -       { .compatible = "fsl,imx6ul-sai", },
> +       { .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
> +       { .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
> +       { .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_sai_ids);
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 24cb156bf995..83e2bfe05b1b 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -126,6 +126,10 @@
>  #define FSL_SAI_MAXBURST_TX 6
>  #define FSL_SAI_MAXBURST_RX 6
>
> +struct fsl_sai_soc_data {
> +       bool use_imx_pcm;
> +};
> +
>  struct fsl_sai {
>         struct platform_device *pdev;
>         struct regmap *regmap;
> @@ -135,7 +139,6 @@ struct fsl_sai {
>         bool is_slave_mode;
>         bool is_lsb_first;
>         bool is_dsp_mode;
> -       bool sai_on_imx;
>         bool synchronous[2];
>
>         unsigned int mclk_id[2];
> @@ -143,6 +146,7 @@ struct fsl_sai {
>         unsigned int slots;
>         unsigned int slot_width;
>
> +       const struct fsl_sai_soc_data *soc_data;
>         struct snd_dmaengine_dai_dma_data dma_params_rx;
>         struct snd_dmaengine_dai_dma_data dma_params_tx;
>  };
> --
> 2.20.1
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
