Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B343A4F8D3A
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 07:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0C46181D;
	Fri,  8 Apr 2022 07:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0C46181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649394609;
	bh=QZqA9bmA9DxTGR9JNJF1Yz9aWMwpOv7CKk6OncAm8mU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzLzJmklO1nkLUe4aY+daBe/cUL7rjK7Xd08/VUaqJJvEPbMjaw0lM4hnuGBNiSjL
	 YAuV/8efZZ5u9/rhY340HnWSHCCvXU18FXQ92wvrRU5miOwh7uAfHTZJ1A8PPgzdSn
	 k5Hl5lCaT+ykhHdGs8wJq6LiG/q+8/0pJX5sZjT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74516F804B0;
	Fri,  8 Apr 2022 07:09:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CED5FF80311; Fri,  8 Apr 2022 07:09:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 765ACF8012A
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 07:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 765ACF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Fa01POsP"
Received: by mail-qv1-xf31.google.com with SMTP id i15so6746749qvh.0
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 22:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NrOxh+v5kwf8ki67GpdPKjSeL7PDcKVXaVTVwIU5Bv4=;
 b=Fa01POsP225j+MJbR9CMkFiJMjyRVzZxLeyZZ/xm2VSB3TwOJ4dEFu1Ywr6MHSe7zj
 LyfNvp2b3ro4pxUd801RQ3qtcpqRWpuFJGJ2Itkt7H6i7bPgK8xzauiKrplRLJQeXUcE
 ew2xjskZwYpQIYykO4cumojO2r2bwwreGm6CrKJVEQR2En90kepbMf3bIo6glmmXpRNu
 OWVChdxkHByusIuYS77wgnBrfRDkWqMrdvstpAgkHjmGG8qCaC1y6oNaNRKh/3n/zLi2
 RcGJ66kzgU9RTYKU2c3cXYwMoVQgWjSQVpFghImERqoE/oo+kJ6PumvPqDKQ0pWC9rcF
 aAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NrOxh+v5kwf8ki67GpdPKjSeL7PDcKVXaVTVwIU5Bv4=;
 b=cch04Y3hlZ9vNwllmT64tSumM6Q8MmkkrzaeiYqvzxJhJfRTqhRi5bfjGos/rMnBgA
 ryjLAaeSil3KYiVvihIpvMhbXNg0a7yGyEC44pL1b3Nb/BsDsGxf5sPxrNbc2zsLBRUg
 zlu1pVex0zKLQBgeOfk6YGS9IY9aAzkd/WG+3/L5s4l9t9Vs5z6aRnkkzy2mBQ/BnSEK
 4Gz9r1lQFC01XPM1Q5nQ4afbvH+YVwumouiYVBn90dEohza+tTY/rzTHl9Bfkq6nMwF8
 WR3Kv4BqF78CM81+bUAI4tz0QD5lFtx3F3IdYGhYlColJKLrwRu/xS734wd9GZeAO8sw
 Gy2g==
X-Gm-Message-State: AOAM533Mal38IiRmY4922GJT/fGx+GYH0wRelNgbcTy9PXesrDsMFO9u
 Eom0iG1bywGFUDDjnME68AvHwOBjaFzIgETDxQQ=
X-Google-Smtp-Source: ABdhPJyxbjdZsVCMMrFifiueSX87zZedieDT202Kb2ZtpOibts8hVSxOye+hJzuWKZvze6Q0iM3IwekiGTYGIlYo+Q4=
X-Received: by 2002:a0c:8e8f:0:b0:443:d25b:4e21 with SMTP id
 x15-20020a0c8e8f000000b00443d25b4e21mr14400694qvb.128.1649394548493; Thu, 07
 Apr 2022 22:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
 <20220407084936.223075-7-s.hauer@pengutronix.de>
In-Reply-To: <20220407084936.223075-7-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Apr 2022 13:08:57 +0800
Message-ID: <CAA+D8AN=gHAN2vHPUGZcS-bg+Ypya1-h4mtkip0AOC=DJwmW=A@mail.gmail.com>
Subject: Re: [PATCH v4 06/21] ASoC: fsl_micfil: use clear/set bits
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

On Thu, Apr 7, 2022 at 4:49 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Instead regmap_update_bits() use the simpler variants
> regmap_[set|clear]_bits() where appropriate.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index cfa8af668d921..da4c245c35e62 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -168,19 +168,15 @@ static int fsl_micfil_reset(struct device *dev)
>         struct fsl_micfil *micfil = dev_get_drvdata(dev);
>         int ret;
>
> -       ret = regmap_update_bits(micfil->regmap,
> -                                REG_MICFIL_CTRL1,
> -                                MICFIL_CTRL1_MDIS,
> -                                0);
> +       ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                               MICFIL_CTRL1_MDIS);
>         if (ret) {
>                 dev_err(dev, "failed to clear MDIS bit %d\n", ret);
>                 return ret;
>         }
>
> -       ret = regmap_update_bits(micfil->regmap,
> -                                REG_MICFIL_CTRL1,
> -                                MICFIL_CTRL1_SRES,
> -                                MICFIL_CTRL1_SRES);
> +       ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                             MICFIL_CTRL1_SRES);
>         if (ret) {
>                 dev_err(dev, "failed to reset MICFIL: %d\n", ret);
>                 return ret;
> @@ -252,9 +248,8 @@ static int fsl_micfil_trigger(struct snd_pcm_substream
> *substream, int cmd,
>                 }
>
>                 /* Enable the module */
> -               ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                        MICFIL_CTRL1_PDMIEN,
> -                                        MICFIL_CTRL1_PDMIEN);
> +               ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                                     MICFIL_CTRL1_PDMIEN);
>                 if (ret) {
>                         dev_err(dev, "failed to enable the module\n");
>                         return ret;
> @@ -265,9 +260,8 @@ static int fsl_micfil_trigger(struct snd_pcm_substream
> *substream, int cmd,
>         case SNDRV_PCM_TRIGGER_SUSPEND:
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>                 /* Disable the module */
> -               ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                        MICFIL_CTRL1_PDMIEN,
> -                                        0);
> +               ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                                       MICFIL_CTRL1_PDMIEN);
>                 if (ret) {
>                         dev_err(dev, "failed to enable the module\n");
>                         return ret;
> @@ -332,8 +326,8 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>         int ret;
>
>         /* 1. Disable the module */
> -       ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                MICFIL_CTRL1_PDMIEN, 0);
> +       ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
> +                               MICFIL_CTRL1_PDMIEN);
>         if (ret) {
>                 dev_err(dev, "failed to disable the module\n");
>                 return ret;
> --
> 2.30.2
>
>
