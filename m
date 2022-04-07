Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B684F756C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 07:38:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6EFD175D;
	Thu,  7 Apr 2022 07:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6EFD175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649309880;
	bh=BTPN2TZWR6ejyaCgjDJEIqZIk5HddgyFEdTSmNvD90M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W79DjlAUiGk1auFJfoa2jnCJIPpms4bQzheoO16VtmQisnNq1BuQlwgG8tJ2dkAek
	 A0+Oi3+sKquBUjG1+GDqdhUkGvnzOPhe3LmtkqRBB57QpknuOc04jvQUjlOpOA5chS
	 1hoFOYYT/zYTHDERy2NZDpCEM3OKYmyTtOQR/Ojo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD6CF80085;
	Thu,  7 Apr 2022 07:36:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 412C5F8024C; Thu,  7 Apr 2022 07:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D745CF8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 07:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D745CF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fIHUCm0y"
Received: by mail-qk1-x72b.google.com with SMTP id b189so1372986qkf.11
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 22:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/b+6GfWpy3HejXTEixsJR2eQI3cukiPRsu4rr42PL3g=;
 b=fIHUCm0ydP1XO3sCpWk89a6DegpK3O1uQiqwQa3iocnw3Fby7IbOUEfB8ys3vQbBUx
 NODbsHJRaWguZaF8Kx0r2EEXzbihg1OuLsVrIHGpTTSdG+odBBuVX1HF5fiQcl4gVnwO
 O4YJBSeL57BY9qghZn7dsYUZGvhXaPSarKVDsMlH9Djj1cpzbUwfgl1Tt1MCfW1z9Nqv
 VWKWrdhHluMDbN1zuBOfrO1Aoe86Ze6ZUNfD91X52s5oQ2CZ30QCpSuzgtyDbXrlY5SS
 rAXrK4YFk0w30jz4z4LkF9hMRhyKqGk33++flcAbvPesZY8s5tcEgftpHL/+FROIvHYZ
 N/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/b+6GfWpy3HejXTEixsJR2eQI3cukiPRsu4rr42PL3g=;
 b=sHdmcbS60KCyGdDvtWeoFeaLRRhoAa1ijo5M+twzFa3QZ1yjC9nCFp51jxQH//bzM3
 QWEPZQOeMt+c6cOBuHPX0QhfOyS/ZzDsgLrdUmHX9lYTaIIPHlIzGynz1WNExPHPDC1E
 lK9G8LZ47tbE+UVCr78mBqucWsok/mIchv20PlsVLu/bm2+Mfv8l80hwZ2w8bYa1c+X7
 +55ghcwpjIC2WPx5nqHn5M6UuP52ibze3VgQXB0rK9rjODEJvJXnjZIHuSeAE5A+riw8
 bxw5UL9tEj6ev56u32XCok/t8QDozHZOaf9n5qUVRxshI/k/HPDz3W/Tj79DiPUAVMLD
 mpKg==
X-Gm-Message-State: AOAM5327YVkPnphi9M2YF6m4H4j18Y3R5Hilv1ski2Z4ll53DI7Jrl8M
 cW8mloEJPW/nSAC5PqsJP5Ky9JQmVwTIl/t8JBI=
X-Google-Smtp-Source: ABdhPJylWlp5k4TZBlrrfuEI4ZfQt6elNJGOtfHrdmgKPLn4NkXTgmqTtEsGul9YSfJQbkXaxMweBNWfyMWR9s9NdRQ=
X-Received: by 2002:a05:620a:254f:b0:680:f510:22e4 with SMTP id
 s15-20020a05620a254f00b00680f51022e4mr8053341qko.554.1649309778024; Wed, 06
 Apr 2022 22:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-21-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-21-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 13:36:07 +0800
Message-ID: <CAA+D8AM+Sj2VvipTkLZ9=-L96+OduuMT6o0+kDdgk+h_Xa3PEQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/20] ASoC: fsl_micfil: fold fsl_set_clock_params()
 into its only user
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
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

On Tue, Apr 5, 2022 at 4:00 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> fsl_set_clock_params() is used only once and easily be folded into its
> caller, do so.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 41 ++++++++++++--------------------------
>  1 file changed, 13 insertions(+), 28 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 99c256f46f38e..26b3395020973 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -253,29 +253,6 @@ static int fsl_micfil_trigger(struct
> snd_pcm_substream *substream, int cmd,
>         return 0;
>  }
>
> -static int fsl_set_clock_params(struct device *dev, unsigned int rate)
> -{
> -       struct fsl_micfil *micfil = dev_get_drvdata(dev);
> -       int clk_div = 8;
> -       int osr = MICFIL_OSR_DEFAULT;
> -       int ret;
> -
> -       ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
> -       if (ret)
> -               return ret;
> -
> -       ret = micfil_set_quality(micfil);
> -       if (ret)
> -               return ret;
> -
> -       ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> -                                MICFIL_CTRL2_CLKDIV | MICFIL_CTRL2_CICOSR,
> -                                FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div) |
> -                                FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 -
> osr));
> -
> -       return ret;
> -}
> -
>  static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
>                                 struct snd_pcm_hw_params *params,
>                                 struct snd_soc_dai *dai)
> @@ -283,7 +260,8 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>         struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
>         unsigned int channels = params_channels(params);
>         unsigned int rate = params_rate(params);
> -       struct device *dev = &micfil->pdev->dev;
> +       int clk_div = 8;
> +       int osr = MICFIL_OSR_DEFAULT;
>         int ret;
>
>         /* 1. Disable the module */
> @@ -298,11 +276,18 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>         if (ret)
>                 return ret;
>
> -       ret = fsl_set_clock_params(dev, rate);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set clock parameters [%d]\n", ret);
> +       ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
> +       if (ret)
>                 return ret;
> -       }
> +
> +       ret = micfil_set_quality(micfil);
> +       if (ret)
> +               return ret;
> +
> +       ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> +                                MICFIL_CTRL2_CLKDIV | MICFIL_CTRL2_CICOSR,
> +                                FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div) |
> +                                FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 -
> osr));
>
>         micfil->dma_params_rx.peripheral_config = &micfil->sdmacfg;
>         micfil->dma_params_rx.peripheral_size = sizeof(micfil->sdmacfg);
> --
> 2.30.2
>
>
