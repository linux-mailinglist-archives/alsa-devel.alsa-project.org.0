Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D334F71F0
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 04:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D08CD1742;
	Thu,  7 Apr 2022 04:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D08CD1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649297983;
	bh=mzvoUo+v2rKL+8W2idg404vyuA0ShwYHjPeogc26Gcs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3L0n5TjpFhDlgbsTqInRwV4YIX280cV2utL3j1cxo9fQ5O4oLLkGRtMOu28FcAgn
	 bRIb3a3YRJNil87ul8gmPMZmWzH1desPm0D1ftJ8gZogqX/iVNkqP4F7LOAO+rG88+
	 mjRyHLKJFaROiytK7UGllYAzEWT4OEachabvzVH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B75BFF80054;
	Thu,  7 Apr 2022 04:18:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB1F1F8024C; Thu,  7 Apr 2022 04:18:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09CCBF8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 04:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09CCBF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NG/PZDSM"
Received: by mail-qv1-xf36.google.com with SMTP id hu11so3970610qvb.7
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 19:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6VycrkwgPqSy7xA4AolZeeSAbOFIETBtmZE0/S/AoLg=;
 b=NG/PZDSMR3zYIZNku+MTYGrL8nt33hOo2XNB56rri572BmzcT6Vgt1+Qp4JiW79kuS
 ClUb9aVysIOkbg2IKPwgNfGPtmyYnFyXKyXz9DMQHpoA9849IWqaqIS10zQt/l6a1idW
 Clw+nMK0szwwA+IN3nBVTvya5lyDVtJ9RSyDW99VuVmUyFVVlV8p62G/O4KKFWCi3sd1
 wvdHV5sZW2YVvnrow7OQQkSKNDUXVlSqtSykYB0/8i00yBhjNzA2Kjv1F6OQqezrYE5i
 Ecmt3AyXSk4e6hDcNTXm3wwtYEF5J5x5lHGFCAf92K50v9v7ZUl337BTUqYmwRw2xc4G
 OvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6VycrkwgPqSy7xA4AolZeeSAbOFIETBtmZE0/S/AoLg=;
 b=R+PqaxjqjfDU3d02qGtOOGbidIjNH9YLamiQJxZcoR1VGiZblZdppDgntNoj51i15N
 7JMp4wezCSNuLqrEpCXaGB036MqyCepyny8xoe3GipDCHHLpq27DiIXKJRImRsxZ7vHJ
 mSZdRexKdeCSAQIlxLX0F6VFRwVaxAIgg/0xor82zG06PtRPQGaTCwyWoYdHJM0Tuj3i
 16mjgKh21UAvNnfFvIhb3oqiN9FTCxJr7MgrVP6wNSa5hnAPBzkcHhBGh89fd1lx0KD8
 N+VVs1mH8pO6tPCb3xl9ynvs8NfjVVI4FPeAGi1iUibt7DDuiQ1RUD5Fr83Ib07t6pKh
 xz+A==
X-Gm-Message-State: AOAM531wAfMx2ohwormgfKBLOWfHe6JJxhwmb/g/EUAG+StmyafZU8Tj
 By3r3ZSsOSAjenRVvi8u2wSBASYnR1GKtuBNdQQ=
X-Google-Smtp-Source: ABdhPJx5cwMrPuLvsp8CCqybMuJEAkfI/px4N6fHILU2IJQi72tXKamJokIutmWDLF1jq0INUFk/hcXh5c7rNPjJVOU=
X-Received: by 2002:a05:6214:4112:b0:441:720:8434 with SMTP id
 kc18-20020a056214411200b0044107208434mr10142378qvb.23.1649297913920; Wed, 06
 Apr 2022 19:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-8-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-8-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 10:18:23 +0800
Message-ID: <CAA+D8AMQEgUD8VW_O1H3y6+khPpDpmLZ6EVh2vt0BoROUPXJrA@mail.gmail.com>
Subject: Re: [PATCH v3 07/20] ASoC: fsl_micfil: drop error messages from
 failed register accesses
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

> Failed register accesses are really not expected in memory mapped
> registers. When it fails then the register access itself is likely not
> the reason, so no need to have extra error messages for each regmap
> access. Just drop the error messages. This also fixes some places where
> a return value is concatenated using 'ret |=' and then returned as
> error value.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 53 ++++++++++----------------------------
>  1 file changed, 13 insertions(+), 40 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 70185f75d8a04..b88ece31437ab 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -170,17 +170,13 @@ static int fsl_micfil_reset(struct device *dev)
>
>         ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
>                                 MICFIL_CTRL1_MDIS);
> -       if (ret) {
> -               dev_err(dev, "failed to clear MDIS bit %d\n", ret);
> +       if (ret)
>                 return ret;
> -       }
>
>         ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
>                               MICFIL_CTRL1_SRES);
> -       if (ret) {
> -               dev_err(dev, "failed to reset MICFIL: %d\n", ret);
> +       if (ret)
>                 return ret;
> -       }
>
>         return 0;
>  }
> @@ -242,18 +238,14 @@ static int fsl_micfil_trigger(struct
> snd_pcm_substream *substream, int cmd,
>                 ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
>                                 MICFIL_CTRL1_DISEL,
>                                 FIELD_PREP(MICFIL_CTRL1_DISEL,
> MICFIL_CTRL1_DISEL_DMA));
> -               if (ret) {
> -                       dev_err(dev, "failed to update DISEL bits\n");
> +               if (ret)
>                         return ret;
> -               }
>
>                 /* Enable the module */
>                 ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
>                                       MICFIL_CTRL1_PDMIEN);
> -               if (ret) {
> -                       dev_err(dev, "failed to enable the module\n");
> +               if (ret)
>                         return ret;
> -               }
>
>                 break;
>         case SNDRV_PCM_TRIGGER_STOP:
> @@ -262,18 +254,14 @@ static int fsl_micfil_trigger(struct
> snd_pcm_substream *substream, int cmd,
>                 /* Disable the module */
>                 ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
>                                         MICFIL_CTRL1_PDMIEN);
> -               if (ret) {
> -                       dev_err(dev, "failed to enable the module\n");
> +               if (ret)
>                         return ret;
> -               }
>
>                 ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
>                                 MICFIL_CTRL1_DISEL,
>                                 FIELD_PREP(MICFIL_CTRL1_DISEL,
> MICFIL_CTRL1_DISEL_DISABLE));
> -               if (ret) {
> -                       dev_err(dev, "failed to update DISEL bits\n");
> +               if (ret)
>                         return ret;
> -               }
>                 break;
>         default:
>                 return -EINVAL;
> @@ -293,24 +281,20 @@ static int fsl_set_clock_params(struct device *dev,
> unsigned int rate)
>                         clk_get_rate(micfil->mclk), rate);
>
>         /* set CICOSR */
> -       ret |= regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> +       ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
>                                  MICFIL_CTRL2_CICOSR,
>                                  FIELD_PREP(MICFIL_CTRL2_CICOSR,
> MICFIL_CTRL2_CICOSR_DEFAULT));
>         if (ret)
> -               dev_err(dev, "failed to set CICOSR in reg 0x%X\n",
> -                       REG_MICFIL_CTRL2);
> +               return ret;
>
>         /* set CLK_DIV */
>         clk_div = get_clk_div(micfil, rate);
>         if (clk_div < 0)
>                 ret = -EINVAL;
>
> -       ret |= regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> +       ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
>                                  MICFIL_CTRL2_CLKDIV,
>                                  FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div));
> -       if (ret)
> -               dev_err(dev, "failed to set CLKDIV in reg 0x%X\n",
> -                       REG_MICFIL_CTRL2);
>
>         return ret;
>  }
> @@ -328,19 +312,14 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>         /* 1. Disable the module */
>         ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
>                                  MICFIL_CTRL1_PDMIEN);
> -       if (ret) {
> -               dev_err(dev, "failed to disable the module\n");
> +       if (ret)
>                 return ret;
> -       }
>
>         /* enable channels */
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
>                                  0xFF, ((1 << channels) - 1));
> -       if (ret) {
> -               dev_err(dev, "failed to enable channels %d, reg 0x%X\n",
> ret,
> -                       REG_MICFIL_CTRL1);
> +       if (ret)
>                 return ret;
> -       }
>
>         ret = fsl_set_clock_params(dev, rate);
>         if (ret < 0) {
> @@ -362,7 +341,6 @@ static const struct snd_soc_dai_ops fsl_micfil_dai_ops
> = {
>  static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
>  {
>         struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
> -       struct device *dev = cpu_dai->dev;
>         int ret;
>         int i;
>
> @@ -370,11 +348,8 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
> *cpu_dai)
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
>                         MICFIL_CTRL2_QSEL,
>                         FIELD_PREP(MICFIL_CTRL2_QSEL,
> MICFIL_QSEL_MEDIUM_QUALITY));
> -       if (ret) {
> -               dev_err(dev, "failed to set quality mode bits, reg 0x%X\n",
> -                       REG_MICFIL_CTRL2);
> +       if (ret)
>                 return ret;
> -       }
>
>         /* set default gain to max_gain */
>         regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x77777777);
> @@ -388,10 +363,8 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
> *cpu_dai)
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_FIFO_CTRL,
>                         MICFIL_FIFO_CTRL_FIFOWMK,
>                         FIELD_PREP(MICFIL_FIFO_CTRL_FIFOWMK,
> micfil->soc->fifo_depth - 1));
> -       if (ret) {
> -               dev_err(dev, "failed to set FIFOWMK\n");
> +       if (ret)
>                 return ret;
> -       }
>
>         return 0;
>  }
> --
> 2.30.2
>
>
