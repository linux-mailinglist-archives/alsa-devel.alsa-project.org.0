Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CF4F7241
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 04:47:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995821742;
	Thu,  7 Apr 2022 04:46:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995821742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649299643;
	bh=0ttq8ASQ33/l6DDyG/++D9sxLOqa3vgzNBJV+hodrvE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mmm44S/6pSYO65vnP08g8mbtUweLYcHQn0f+h8LJjpcqdYHhhO5cnv0BaKhNH3ATG
	 duem25jxNY+IUhTsi9ooejSELbHx3U34XAWR1qCbMRPYeZPiIR6bJVumfqf1WdTr+x
	 HTMCPip39C78XKeJdy0haXDt7gCBbT9H6VbhdkWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 504D4F80054;
	Thu,  7 Apr 2022 04:46:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAFB6F8024C; Thu,  7 Apr 2022 04:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13E74F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 04:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13E74F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i7gvf8lR"
Received: by mail-qv1-xf2a.google.com with SMTP id cs16so4007137qvb.8
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 19:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YAUV+X7DP6fQ/39st3C7DacHXsYwrKM8qLaa4XVDjNs=;
 b=i7gvf8lRETf7vj3VFy8fZv4VTndjJz1/Q5vIuTOE3xOnoTb03BRUOsCFsP52lYNZPI
 bCYBweS/6vBhs10NurDqyIaiGqLcy8VDsKEqwWADtsHR8cJCRwa/tf3mqVA5HmfPX/Oo
 BgYUjcjg0t0D1ez9IS8TEy0tnx1HBc+IjMYEn/BK5kfYAmb9HWi0YKNOHflWH+luzxlN
 rzMFMAAPdOc7wBXlmqn4hv6WJn3TALdHaDBXRCuSAtdLWak5Jrtxo+xjwwfMMwTCQubC
 vQixtIqeU+az+9CCADXo2UAxz8wXDyVUxMBFIkOQZ9//aNp0EgDAPQOI+zJj0fKqq+kv
 y6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YAUV+X7DP6fQ/39st3C7DacHXsYwrKM8qLaa4XVDjNs=;
 b=WQPZT01Q7slOdIVa3Qei25iOG50j9Ipc9wa/Wp999GrPL5S891raRmoRxLQkWpwACq
 33h5nYqC8PcMW0N7XYM0ZGndBUnVH4zjzaP3VMwq6DYCiFO4MOJ/uJpz7NRjjHKj7T/k
 tE1/lq9WvL36hu1hgQfzEBO9Yldop9ZAK7ZCB8Zb0pwDUtzssQzYUOJEshThca38vsZ6
 0xgOfDasMob9PkcVdbd6upMzJZkx8459HvCXT2gtLR8VDETe4+lo4G0BjMV3AqaxE9Wb
 azRif5L4QhPWqL+8Yne+oAeX56TP8fzkfrjWj7S/7QI5wrauA3UQFzOzNU4Z7d52d9mg
 5l8A==
X-Gm-Message-State: AOAM530Abyl1WhbOpFU/MKIiq8iscK1mXZB7KHos4tz4DWNxLAQpud2r
 aeW8wQXCmUJun9VM27jEK8H0Mj6hA8kPJAC0EYo=
X-Google-Smtp-Source: ABdhPJzgbVdPbPQSAv7sXGbekqFFUzKFO71fgHLxk89Xtv0dv175WEWHT94Y3ocle3PaMSF+1xpJkb5IjGVD9kQ/sDg=
X-Received: by 2002:a05:6214:4112:b0:441:720:8434 with SMTP id
 kc18-20020a056214411200b0044107208434mr10194772qvb.23.1649299573626; Wed, 06
 Apr 2022 19:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-14-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-14-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 10:46:02 +0800
Message-ID: <CAA+D8ANKES9PYXTYEswXotcSOxG8VgBprRvM2B8EHwkxBzmR=w@mail.gmail.com>
Subject: Re: [PATCH v3 13/20] ASoC: fsl_micfil: use define for OSR default
 value
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

> The OSR (OverSampling Rate) setting is set once to the default value
> and never changed throughout the driver. Nevertheless the value is
> read back from the register for further calculations. Just use the
> default value because we know what we have written.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  sound/soc/fsl/fsl_micfil.c | 10 ++++++----
>  sound/soc/fsl/fsl_micfil.h |  1 -
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index fe3e1319b35fd..4b4b7fbbf5c4f 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -29,6 +29,8 @@
>  #define FSL_MICFIL_RATES               SNDRV_PCM_RATE_8000_48000
>  #define FSL_MICFIL_FORMATS             (SNDRV_PCM_FMTBIT_S16_LE)
>
> +#define MICFIL_OSR_DEFAULT     16
> +
>  struct fsl_micfil {
>         struct platform_device *pdev;
>         struct regmap *regmap;
> @@ -41,6 +43,7 @@ struct fsl_micfil {
>         char name[32];
>         int irq[MICFIL_IRQ_LINES];
>         int quality;    /*QUALITY 2-0 bits */
> +       unsigned int osr;
>

unused?


>  };
>
>  struct fsl_micfil_soc_data {
> @@ -112,11 +115,11 @@ static inline int get_pdm_clk(struct fsl_micfil
> *micfil,
>                               unsigned int rate)
>  {
>         u32 ctrl2_reg;
> -       int qsel, osr;
> +       int qsel;
>         int bclk;
> +       int osr = MICFIL_OSR_DEFAULT;
>
>         regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
> -       osr = 16 - FIELD_GET(MICFIL_CTRL2_CICOSR, ctrl2_reg);
>         qsel = FIELD_GET(MICFIL_CTRL2_QSEL, ctrl2_reg);
>
>         switch (qsel) {
> @@ -282,7 +285,7 @@ static int fsl_set_clock_params(struct device *dev,
> unsigned int rate)
>         /* set CICOSR */
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
>                                  MICFIL_CTRL2_CICOSR,
> -                                FIELD_PREP(MICFIL_CTRL2_CICOSR,
> MICFIL_CTRL2_CICOSR_DEFAULT));
> +                                FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 -
> MICFIL_OSR_DEFAULT));
>         if (ret)
>                 return ret;
>
> @@ -673,7 +676,6 @@ static int fsl_micfil_probe(struct platform_device
> *pdev)
>         micfil->dma_params_rx.addr = res->start + REG_MICFIL_DATACH0;
>         micfil->dma_params_rx.maxburst = MICFIL_DMA_MAXBURST_RX;
>
> -
>         platform_set_drvdata(pdev, micfil);
>
>         pm_runtime_enable(&pdev->dev);
> diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
> index 5cecae2519795..08901827047db 100644
> --- a/sound/soc/fsl/fsl_micfil.h
> +++ b/sound/soc/fsl/fsl_micfil.h
> @@ -58,7 +58,6 @@
>  #define MICFIL_QSEL_VLOW2_QUALITY      4
>
>  #define MICFIL_CTRL2_CICOSR            GENMASK(19, 16)
> -#define MICFIL_CTRL2_CICOSR_DEFAULT    0
>  #define MICFIL_CTRL2_CLKDIV            GENMASK(7, 0)
>
>  /* MICFIL Status Register -- REG_MICFIL_STAT 0x08 */
> --
> 2.30.2
>
>
