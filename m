Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDAB4F8D3E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 07:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B9818AA;
	Fri,  8 Apr 2022 07:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B9818AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649394854;
	bh=q13bp0Oode18wJbhh7ATvOMJUQl69M0Upr1qbI9+zps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VVnH0x/j8oc9eWtGWnwEdnBHn7OSSKHL8QdAboRaKkM2Q7MbqlFOrtZaeJjmCxGCY
	 7dhb8zxEFnzEbO/XJr0fiavzFPl8gGIO6j5F5Xn/HWHAleSD/SvWojhOXrdItOLi4h
	 yTIbl6m5Ok2spmSDj5PGst+sE1KN6VwOoS/SGUjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F81AF804B1;
	Fri,  8 Apr 2022 07:13:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D4D5F8012A; Fri,  8 Apr 2022 07:13:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3537F8012A
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 07:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3537F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WasVv57C"
Received: by mail-qt1-x831.google.com with SMTP id o15so9831365qtv.8
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 22:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cqRdIBWYF9bcZ9QN41R8Tky9RBd1SJbyVpwgipiEj/8=;
 b=WasVv57CGE3+JkYqaqK+Up+L2Z3r1CsRMdoEPz406EHNJHyiMAbrbGGru9XvWg793s
 xveWtakm5yyk6h67gFPDnd6/34jfZRCgKquErdi+WgHv0GzkU+PkQbhYIZzkROoc0yoL
 rvEaXhygMeO1ICbqXxpEfYOSOM8WyhJVOublcCatBGVngZ4mR5H+ZPNf+oTAk5SsDRtd
 xfrY1t2+EFE/llOQeHK6/WHE2xLCaJgstVCVTwQP171V8Cs11IV3d6qsxhJLakRayiDN
 eJiGXjoYoRLRHMBuIwCynNDj5m1T8ZlbcWgVzMpl5Ilcgv6/QFk407ajhgdD9ZRTlu+S
 f5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cqRdIBWYF9bcZ9QN41R8Tky9RBd1SJbyVpwgipiEj/8=;
 b=5jBBAbC0YtvzFde7rIwua2krVS2Q2catAm8OHundGe9VrBwm3OLDmJRa0VCw0nqfxU
 5O3LTWIWBgqzWODQkiACD21gvPTzRRkxC3aq40QkovJ8/PTFj+/m7WD8VmcyPjb8S24E
 pudEWfnuPYnsJC253R2DozZE188iaJshmLHWVyy0TxXj0gI52WuDu7bMZ3PUI45avfT1
 fNdNQkUVp4Ys7ZPZTJ8Aqx2Y7lYsplEY+eRIxB+RePgHOhToDOGRaxhyPrcZNQqdcnAC
 vkIbIOTlxPH+I9YQrLkKAfgesRKa2WSTTxC85+7ePoUzxHPKLdF1a3PTBykdkqTXGyjN
 Ye7A==
X-Gm-Message-State: AOAM531tqiMAA8d5Ld1fbPC1YfPFpJVYKkO0yrhxo4vXNo/phIWx5aW6
 Zmqqwnfcm1iFb/eDQj4xj6dSjECY3NVhd8h7kvU=
X-Google-Smtp-Source: ABdhPJxhp/IaOCxmsz0tsiYCyqq/HfV8p6eRuyU26b0BhFTViUQ/edETA1oWp77EvKXb0LSBwwLH6melduz1+rb+D2c=
X-Received: by 2002:ac8:5344:0:b0:2eb:cce7:200d with SMTP id
 d4-20020ac85344000000b002ebcce7200dmr6267581qto.668.1649394792427; Thu, 07
 Apr 2022 22:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
 <20220407084936.223075-14-s.hauer@pengutronix.de>
In-Reply-To: <20220407084936.223075-14-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Apr 2022 13:13:01 +0800
Message-ID: <CAA+D8AOBT2_kRMBmpLALGt064eK2zuka1gNwLdBEiLx+ViBpQw@mail.gmail.com>
Subject: Re: [PATCH v4 13/21] ASoC: fsl_micfil: use define for OSR default
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

On Thu, Apr 7, 2022 at 4:49 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> The OSR (OverSampling Rate) setting is set once to the default value
> and never changed throughout the driver. Nevertheless the value is
> read back from the register for further calculations. Just use the
> default value because we know what we have written.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
>
> Notes:
>     Changes since v3:
>     - Drop adding unused 'osr' to struct fsl_micfil
>
>  sound/soc/fsl/fsl_micfil.c | 9 +++++----
>  sound/soc/fsl/fsl_micfil.h | 1 -
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 56df916ad55f2..a35c1c580dbc1 100644
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
> @@ -112,11 +114,11 @@ static inline int get_pdm_clk(struct fsl_micfil
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
> @@ -282,7 +284,7 @@ static int fsl_set_clock_params(struct device *dev,
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
> @@ -673,7 +675,6 @@ static int fsl_micfil_probe(struct platform_device
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
