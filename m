Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B47F4F5EE5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 15:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E89D16D6;
	Wed,  6 Apr 2022 15:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E89D16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649250382;
	bh=V3xQeZWpZKlatdQGldgWl73AYYFgFfRJC9urYB4dRVQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z8gpmdvv7Md5i3G0nRlStrXtYBl+Wkd85gwSvN8l87ZJTQpygYINv65Z12PjxWb4Z
	 sKx4p5qc7fmDxj0/7WsELFd6ikSLKr1ASVZAPyaiJ8hrSx/vR6bgl/YkFb42n+TF+j
	 uhQvwMDnv75BPM+GmtS9glXtWkhcwNwLpdLTqtnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5E3FF8019B;
	Wed,  6 Apr 2022 15:05:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCEEBF80161; Wed,  6 Apr 2022 15:05:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F9A8F800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 15:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F9A8F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ArUXsVzk"
Received: by mail-qt1-x82a.google.com with SMTP id i4so4088673qti.7
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ScTKFZwqts0MxhFxIfaofhndzzDFw3sGi7QJpOKapr8=;
 b=ArUXsVzkczY1u0IrPGj/6sDv7QbK5W6ycneGdDrVCBKV2mKtRto5lvlRbY1ljGEuoM
 dgx8pjYkNxzCPUpXPd/cdMO6DI0N0R0cUsq6511+xPK3Jt3THB1KCe8RNb6g6XMY5fwQ
 7n5lAW+tbDUnSOwOXaU4mgx9ZJwg6hUGuY1Qyb1VF/QkzSKi1YwijSmZxzx+LfcNcu/S
 dxev7EaJO6MGcbqJJscHybJ+4qbWie76jDVI7kooRfevD36bPLQ+VaEDA4+8pjKCXmVD
 +W9VSkvRC+RO8bzdQZTVm4MHLCu0/nsTLRJlzB8Eefm0rMVvP95Mw4N1Oy02PWad3JpM
 Jq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ScTKFZwqts0MxhFxIfaofhndzzDFw3sGi7QJpOKapr8=;
 b=ZqRxi2f6EgISGBi/Y1NScu+hstHbSVaNV2WKlxaquuaW0gnFK03LWP0h8GW93KGHbV
 kUK1PsYznpVwbdAYsQGP1UXICm/yE5DlftozeBoZmm3Tw/Y4GHnaSj1Hh6W54Or+vQdk
 ObHoyjofn7z6CAvzxzDTGvb0cNlZP5DXmABmonFftCQsi5PVShZCsiJ1A28cUdtk42pS
 k8SPrTT5E+HC1TXjKEh5RoWoCKSrzzLLvGOks7xEqofAkFtmFvXFTNyNZKb07WJpUouh
 fVwBFEKDpRjzAWH/Sw6O7xNdqnS4E1tcqzdEXKCiL5HfBsFypiVEArDVRp0S/cs5v/vz
 G03Q==
X-Gm-Message-State: AOAM532ufbNSLiz5p2CT1LLftvOgWSaJ8ZBT7STSH0JSAaJlUoS/seae
 bGjxGzfu1zvQWm3b3vUB4C+J98j98BAOmo4CqRs=
X-Google-Smtp-Source: ABdhPJxTElcsxVU2QjpfvkpTeY+NExkf8NRZZdg4Mq3MDKOSZGD4DjlsHWXyZSypR2V7zv5vYp+0ESSA4fR1DEthA7o=
X-Received: by 2002:a05:620a:254f:b0:680:f510:22e4 with SMTP id
 s15-20020a05620a254f00b00680f51022e4mr5472408qko.554.1649250313559; Wed, 06
 Apr 2022 06:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-5-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-5-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Apr 2022 21:05:02 +0800
Message-ID: <CAA+D8ANZd5M21856vWU6S0O5QSqw=_h1NU+uLAPkF==-rcv8GQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] ASoC: fsl_micfil: do not define SHIFT/MASK for
 single bits
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

> No need to have defines for the mask of single bits. Also shift is
> unused. Drop all these unnecessary defines.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c |  18 +++---
>  sound/soc/fsl/fsl_micfil.h | 125 +++++++++----------------------------
>  2 files changed, 40 insertions(+), 103 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 5353474d0ff2b..878d24fde3581 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -170,7 +170,7 @@ static int fsl_micfil_reset(struct device *dev)
>
>         ret = regmap_update_bits(micfil->regmap,
>                                  REG_MICFIL_CTRL1,
> -                                MICFIL_CTRL1_MDIS_MASK,
> +                                MICFIL_CTRL1_MDIS,
>                                  0);
>         if (ret) {
>                 dev_err(dev, "failed to clear MDIS bit %d\n", ret);
> @@ -179,7 +179,7 @@ static int fsl_micfil_reset(struct device *dev)
>
>         ret = regmap_update_bits(micfil->regmap,
>                                  REG_MICFIL_CTRL1,
> -                                MICFIL_CTRL1_SRES_MASK,
> +                                MICFIL_CTRL1_SRES,
>                                  MICFIL_CTRL1_SRES);
>         if (ret) {
>                 dev_err(dev, "failed to reset MICFIL: %d\n", ret);
> @@ -253,7 +253,7 @@ static int fsl_micfil_trigger(struct snd_pcm_substream
> *substream, int cmd,
>
>                 /* Enable the module */
>                 ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                        MICFIL_CTRL1_PDMIEN_MASK,
> +                                        MICFIL_CTRL1_PDMIEN,
>                                          MICFIL_CTRL1_PDMIEN);
>                 if (ret) {
>                         dev_err(dev, "failed to enable the module\n");
> @@ -266,7 +266,7 @@ static int fsl_micfil_trigger(struct snd_pcm_substream
> *substream, int cmd,
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>                 /* Disable the module */
>                 ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                        MICFIL_CTRL1_PDMIEN_MASK,
> +                                        MICFIL_CTRL1_PDMIEN,
>                                          0);
>                 if (ret) {
>                         dev_err(dev, "failed to enable the module\n");
> @@ -332,7 +332,7 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>
>         /* 1. Disable the module */
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                MICFIL_CTRL1_PDMIEN_MASK, 0);
> +                                MICFIL_CTRL1_PDMIEN, 0);
>         if (ret) {
>                 dev_err(dev, "failed to disable the module\n");
>                 return ret;
> @@ -593,16 +593,16 @@ static irqreturn_t micfil_err_isr(int irq, void
> *devid)
>
>         regmap_read(micfil->regmap, REG_MICFIL_STAT, &stat_reg);
>
> -       if (stat_reg & MICFIL_STAT_BSY_FIL_MASK)
> +       if (stat_reg & MICFIL_STAT_BSY_FIL)
>                 dev_dbg(&pdev->dev, "isr: Decimation Filter is running\n");
>
> -       if (stat_reg & MICFIL_STAT_FIR_RDY_MASK)
> +       if (stat_reg & MICFIL_STAT_FIR_RDY)
>                 dev_dbg(&pdev->dev, "isr: FIR Filter Data ready\n");
>
> -       if (stat_reg & MICFIL_STAT_LOWFREQF_MASK) {
> +       if (stat_reg & MICFIL_STAT_LOWFREQF) {
>                 dev_dbg(&pdev->dev, "isr: ipg_clk_app is too low\n");
>                 regmap_write_bits(micfil->regmap, REG_MICFIL_STAT,
> -                                 MICFIL_STAT_LOWFREQF_MASK, 1);
> +                                 MICFIL_STAT_LOWFREQF, 1);
>         }
>
>         return IRQ_HANDLED;
> diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
> index bac825c3135a0..11ccc08523b2e 100644
> --- a/sound/soc/fsl/fsl_micfil.h
> +++ b/sound/soc/fsl/fsl_micfil.h
> @@ -33,33 +33,17 @@
>  #define REG_MICFIL_VAD0_ZCD            0xA8
>
>  /* MICFIL Control Register 1 -- REG_MICFILL_CTRL1 0x00 */
> -#define MICFIL_CTRL1_MDIS_SHIFT                31
> -#define MICFIL_CTRL1_MDIS_MASK         BIT(MICFIL_CTRL1_MDIS_SHIFT)
> -#define MICFIL_CTRL1_MDIS              BIT(MICFIL_CTRL1_MDIS_SHIFT)
> -#define MICFIL_CTRL1_DOZEN_SHIFT       30
> -#define MICFIL_CTRL1_DOZEN_MASK
> BIT(MICFIL_CTRL1_DOZEN_SHIFT)
> -#define MICFIL_CTRL1_DOZEN             BIT(MICFIL_CTRL1_DOZEN_SHIFT)
> -#define MICFIL_CTRL1_PDMIEN_SHIFT      29
> -#define MICFIL_CTRL1_PDMIEN_MASK       BIT(MICFIL_CTRL1_PDMIEN_SHIFT)
> -#define MICFIL_CTRL1_PDMIEN            BIT(MICFIL_CTRL1_PDMIEN_SHIFT)
> -#define MICFIL_CTRL1_DBG_SHIFT         28
> -#define MICFIL_CTRL1_DBG_MASK          BIT(MICFIL_CTRL1_DBG_SHIFT)
> -#define MICFIL_CTRL1_DBG               BIT(MICFIL_CTRL1_DBG_SHIFT)
> -#define MICFIL_CTRL1_SRES_SHIFT                27
> -#define MICFIL_CTRL1_SRES_MASK         BIT(MICFIL_CTRL1_SRES_SHIFT)
> -#define MICFIL_CTRL1_SRES              BIT(MICFIL_CTRL1_SRES_SHIFT)
> -#define MICFIL_CTRL1_DBGE_SHIFT                26
> -#define MICFIL_CTRL1_DBGE_MASK         BIT(MICFIL_CTRL1_DBGE_SHIFT)
> -#define MICFIL_CTRL1_DBGE              BIT(MICFIL_CTRL1_DBGE_SHIFT)
> +#define MICFIL_CTRL1_MDIS              BIT(31)
> +#define MICFIL_CTRL1_DOZEN             BIT(30)
> +#define MICFIL_CTRL1_PDMIEN            BIT(29)
> +#define MICFIL_CTRL1_DBG               BIT(28)
> +#define MICFIL_CTRL1_SRES              BIT(27)
> +#define MICFIL_CTRL1_DBGE              BIT(26)
>  #define MICFIL_CTRL1_DISEL_SHIFT       24
>  #define MICFIL_CTRL1_DISEL_WIDTH       2
>  #define MICFIL_CTRL1_DISEL_MASK
> ((BIT(MICFIL_CTRL1_DISEL_WIDTH) - 1) \
>                                          << MICFIL_CTRL1_DISEL_SHIFT)
> -#define MICFIL_CTRL1_DISEL(v)          (((v) << MICFIL_CTRL1_DISEL_SHIFT)
> \
> -                                        & MICFIL_CTRL1_DISEL_MASK)
> -#define MICFIL_CTRL1_ERREN_SHIFT       23
> -#define MICFIL_CTRL1_ERREN_MASK
> BIT(MICFIL_CTRL1_ERREN_SHIFT)
> -#define MICFIL_CTRL1_ERREN             BIT(MICFIL_CTRL1_ERREN_SHIFT)
> +#define MICFIL_CTRL1_ERREN             BIT(23)
>  #define MICFIL_CTRL1_CHEN_SHIFT                0
>  #define MICFIL_CTRL1_CHEN_WIDTH                8
>  #define MICFIL_CTRL1_CHEN_MASK(x)      (BIT(x) << MICFIL_CTRL1_CHEN_SHIFT)
> @@ -91,15 +75,9 @@
>                                          & MICFIL_CTRL2_CLKDIV_MASK)
>
>  /* MICFIL Status Register -- REG_MICFIL_STAT 0x08 */
> -#define MICFIL_STAT_BSY_FIL_SHIFT      31
> -#define MICFIL_STAT_BSY_FIL_MASK       BIT(MICFIL_STAT_BSY_FIL_SHIFT)
> -#define MICFIL_STAT_BSY_FIL            BIT(MICFIL_STAT_BSY_FIL_SHIFT)
> -#define MICFIL_STAT_FIR_RDY_SHIFT      30
> -#define MICFIL_STAT_FIR_RDY_MASK       BIT(MICFIL_STAT_FIR_RDY_SHIFT)
> -#define MICFIL_STAT_FIR_RDY            BIT(MICFIL_STAT_FIR_RDY_SHIFT)
> -#define MICFIL_STAT_LOWFREQF_SHIFT     29
> -#define MICFIL_STAT_LOWFREQF_MASK      BIT(MICFIL_STAT_LOWFREQF_SHIFT)
> -#define MICFIL_STAT_LOWFREQF           BIT(MICFIL_STAT_LOWFREQF_SHIFT)
> +#define MICFIL_STAT_BSY_FIL            BIT(31)
> +#define MICFIL_STAT_FIR_RDY            BIT(30)
> +#define MICFIL_STAT_LOWFREQF           BIT(29)
>  #define MICFIL_STAT_CHXF_SHIFT(v)      (v)
>  #define MICFIL_STAT_CHXF_MASK(v)       BIT(MICFIL_STAT_CHXF_SHIFT(v))
>  #define MICFIL_STAT_CHXF(v)            BIT(MICFIL_STAT_CHXF_SHIFT(v))
> @@ -137,32 +115,16 @@
>                                          << MICFIL_VAD0_CTRL1_INITT_SHIFT)
>  #define MICFIL_VAD0_CTRL1_INITT(v)     (((v) <<
> MICFIL_VAD0_CTRL1_INITT_SHIFT) \
>                                          & MICFIL_VAD0_CTRL1_INITT_MASK)
> -#define MICFIL_VAD0_CTRL1_ST10_SHIFT   4
> -#define MICFIL_VAD0_CTRL1_ST10_MASK    BIT(MICFIL_VAD0_CTRL1_ST10_SHIFT)
> -#define MICFIL_VAD0_CTRL1_ST10         BIT(MICFIL_VAD0_CTRL1_ST10_SHIFT)
> -#define MICFIL_VAD0_CTRL1_ERIE_SHIFT   3
> -#define MICFIL_VAD0_CTRL1_ERIE_MASK    BIT(MICFIL_VAD0_CTRL1_ERIE_SHIFT)
> -#define MICFIL_VAD0_CTRL1_ERIE         BIT(MICFIL_VAD0_CTRL1_ERIE_SHIFT)
> -#define MICFIL_VAD0_CTRL1_IE_SHIFT     2
> -#define MICFIL_VAD0_CTRL1_IE_MASK      BIT(MICFIL_VAD0_CTRL1_IE_SHIFT)
> -#define MICFIL_VAD0_CTRL1_IE           BIT(MICFIL_VAD0_CTRL1_IE_SHIFT)
> -#define MICFIL_VAD0_CTRL1_RST_SHIFT    1
> -#define MICFIL_VAD0_CTRL1_RST_MASK     BIT(MICFIL_VAD0_CTRL1_RST_SHIFT)
> -#define MICFIL_VAD0_CTRL1_RST          BIT(MICFIL_VAD0_CTRL1_RST_SHIFT)
> -#define MICFIL_VAD0_CTRL1_EN_SHIFT     0
> -#define MICFIL_VAD0_CTRL1_EN_MASK      BIT(MICFIL_VAD0_CTRL1_EN_SHIFT)
> -#define MICFIL_VAD0_CTRL1_EN           BIT(MICFIL_VAD0_CTRL1_EN_SHIFT)
> +#define MICFIL_VAD0_CTRL1_ST10         BIT(4)
> +#define MICFIL_VAD0_CTRL1_ERIE         BIT(3)
> +#define MICFIL_VAD0_CTRL1_IE           BIT(2)
> +#define MICFIL_VAD0_CTRL1_RST          BIT(1)
> +#define MICFIL_VAD0_CTRL1_EN           BIT(0)
>
>  /* MICFIL HWVAD0 Control 2 Register -- REG_MICFIL_VAD0_CTRL2*/
> -#define MICFIL_VAD0_CTRL2_FRENDIS_SHIFT        31
> -#define MICFIL_VAD0_CTRL2_FRENDIS_MASK
> BIT(MICFIL_VAD0_CTRL2_FRENDIS_SHIFT)
> -#define MICFIL_VAD0_CTRL2_FRENDIS
> BIT(MICFIL_VAD0_CTRL2_FRENDIS_SHIFT)
> -#define MICFIL_VAD0_CTRL2_PREFEN_SHIFT 30
> -#define MICFIL_VAD0_CTRL2_PREFEN_MASK  BIT(MICFIL_VAD0_CTRL2_PREFEN_SHIFT)
> -#define MICFIL_VAD0_CTRL2_PREFEN       BIT(MICFIL_VAD0_CTRL2_PREFEN_SHIFT)
> -#define MICFIL_VAD0_CTRL2_FOUTDIS_SHIFT        28
> -#define MICFIL_VAD0_CTRL2_FOUTDIS_MASK
> BIT(MICFIL_VAD0_CTRL2_FOUTDIS_SHIFT)
> -#define MICFIL_VAD0_CTRL2_FOUTDIS
> BIT(MICFIL_VAD0_CTRL2_FOUTDIS_SHIFT)
> +#define MICFIL_VAD0_CTRL2_FRENDIS      BIT(31)
> +#define MICFIL_VAD0_CTRL2_PREFEN       BIT(30)
> +#define MICFIL_VAD0_CTRL2_FOUTDIS      BIT(28)
>  #define MICFIL_VAD0_CTRL2_FRAMET_SHIFT 16
>  #define MICFIL_VAD0_CTRL2_FRAMET_WIDTH 6
>  #define MICFIL_VAD0_CTRL2_FRAMET_MASK
> ((BIT(MICFIL_VAD0_CTRL2_FRAMET_WIDTH) - 1) \
> @@ -183,12 +145,8 @@
>                                          & MICFIL_VAD0_CTRL2_HPF_MASK)
>
>  /* MICFIL HWVAD0 Signal CONFIG Register -- REG_MICFIL_VAD0_SCONFIG */
> -#define MICFIL_VAD0_SCONFIG_SFILEN_SHIFT       31
> -#define MICFIL_VAD0_SCONFIG_SFILEN_MASK
> BIT(MICFIL_VAD0_SCONFIG_SFILEN_SHIFT)
> -#define MICFIL_VAD0_SCONFIG_SFILEN
>  BIT(MICFIL_VAD0_SCONFIG_SFILEN_SHIFT)
> -#define MICFIL_VAD0_SCONFIG_SMAXEN_SHIFT       30
> -#define MICFIL_VAD0_SCONFIG_SMAXEN_MASK
> BIT(MICFIL_VAD0_SCONFIG_SMAXEN_SHIFT)
> -#define MICFIL_VAD0_SCONFIG_SMAXEN
>  BIT(MICFIL_VAD0_SCONFIG_SMAXEN_SHIFT)
> +#define MICFIL_VAD0_SCONFIG_SFILEN             BIT(31)
> +#define MICFIL_VAD0_SCONFIG_SMAXEN             BIT(30)
>  #define MICFIL_VAD0_SCONFIG_SGAIN_SHIFT                0
>  #define MICFIL_VAD0_SCONFIG_SGAIN_WIDTH                4
>  #define MICFIL_VAD0_SCONFIG_SGAIN_MASK
>  ((BIT(MICFIL_VAD0_SCONFIG_SGAIN_WIDTH) - 1) \
> @@ -197,17 +155,10 @@
>                                                  &
> MICFIL_VAD0_SCONFIG_SGAIN_MASK)
>
>  /* MICFIL HWVAD0 Noise CONFIG Register -- REG_MICFIL_VAD0_NCONFIG */
> -#define MICFIL_VAD0_NCONFIG_NFILAUT_SHIFT      31
> -#define MICFIL_VAD0_NCONFIG_NFILAUT_MASK
>  BIT(MICFIL_VAD0_NCONFIG_NFILAUT_SHIFT)
> -#define MICFIL_VAD0_NCONFIG_NFILAUT
> BIT(MICFIL_VAD0_NCONFIG_NFILAUT_SHIFT)
> -#define MICFIL_VAD0_NCONFIG_NMINEN_SHIFT       30
> -#define MICFIL_VAD0_NCONFIG_NMINEN_MASK
> BIT(MICFIL_VAD0_NCONFIG_NMINEN_SHIFT)
> -#define MICFIL_VAD0_NCONFIG_NMINEN
>  BIT(MICFIL_VAD0_NCONFIG_NMINEN_SHIFT)
> -#define MICFIL_VAD0_NCONFIG_NDECEN_SHIFT       29
> -#define MICFIL_VAD0_NCONFIG_NDECEN_MASK
> BIT(MICFIL_VAD0_NCONFIG_NDECEN_SHIFT)
> -#define MICFIL_VAD0_NCONFIG_NDECEN
>  BIT(MICFIL_VAD0_NCONFIG_NDECEN_SHIFT)
> -#define MICFIL_VAD0_NCONFIG_NOREN_SHIFT                28
> -#define MICFIL_VAD0_NCONFIG_NOREN
> BIT(MICFIL_VAD0_NCONFIG_NOREN_SHIFT)
> +#define MICFIL_VAD0_NCONFIG_NFILAUT            BIT(31)
> +#define MICFIL_VAD0_NCONFIG_NMINEN             BIT(30)
> +#define MICFIL_VAD0_NCONFIG_NDECEN             BIT(29)
> +#define MICFIL_VAD0_NCONFIG_NOREN              BIT(28)
>  #define MICFIL_VAD0_NCONFIG_NFILADJ_SHIFT      8
>  #define MICFIL_VAD0_NCONFIG_NFILADJ_WIDTH      5
>  #define MICFIL_VAD0_NCONFIG_NFILADJ_MASK
>  ((BIT(MICFIL_VAD0_NCONFIG_NFILADJ_WIDTH) - 1) \
> @@ -234,29 +185,15 @@
>                                          << MICFIL_VAD0_ZCD_ZCDADJ_SHIFT)
>  #define MICFIL_VAD0_ZCD_ZCDADJ(v)      (((v) <<
> MICFIL_VAD0_ZCD_ZCDADJ_SHIFT)\
>                                          & MICFIL_VAD0_ZCD_ZCDADJ_MASK)
> -#define MICFIL_VAD0_ZCD_ZCDAND_SHIFT   4
> -#define MICFIL_VAD0_ZCD_ZCDAND_MASK    BIT(MICFIL_VAD0_ZCD_ZCDAND_SHIFT)
> -#define MICFIL_VAD0_ZCD_ZCDAND         BIT(MICFIL_VAD0_ZCD_ZCDAND_SHIFT)
> -#define MICFIL_VAD0_ZCD_ZCDAUT_SHIFT   2
> -#define MICFIL_VAD0_ZCD_ZCDAUT_MASK    BIT(MICFIL_VAD0_ZCD_ZCDAUT_SHIFT)
> -#define MICFIL_VAD0_ZCD_ZCDAUT         BIT(MICFIL_VAD0_ZCD_ZCDAUT_SHIFT)
> -#define MICFIL_VAD0_ZCD_ZCDEN_SHIFT    0
> -#define MICFIL_VAD0_ZCD_ZCDEN_MASK     BIT(MICFIL_VAD0_ZCD_ZCDEN_SHIFT)
> -#define MICFIL_VAD0_ZCD_ZCDEN          BIT(MICFIL_VAD0_ZCD_ZCDEN_SHIFT)
> +#define MICFIL_VAD0_ZCD_ZCDAND         BIT(4)
> +#define MICFIL_VAD0_ZCD_ZCDAUT         BIT(2)
> +#define MICFIL_VAD0_ZCD_ZCDEN          BIT(0)
>
>  /* MICFIL HWVAD0 Status Register - REG_MICFIL_VAD0_STAT */
> -#define MICFIL_VAD0_STAT_INITF_SHIFT   31
> -#define MICFIL_VAD0_STAT_INITF_MASK    BIT(MICFIL_VAD0_STAT_INITF_SHIFT)
> -#define MICFIL_VAD0_STAT_INITF         BIT(MICFIL_VAD0_STAT_INITF_SHIFT)
> -#define MICFIL_VAD0_STAT_INSATF_SHIFT  16
> -#define MICFIL_VAD0_STAT_INSATF_MASK   BIT(MICFIL_VAD0_STAT_INSATF_SHIFT)
> -#define MICFIL_VAD0_STAT_INSATF
> BIT(MICFIL_VAD0_STAT_INSATF_SHIFT)
> -#define MICFIL_VAD0_STAT_EF_SHIFT      15
> -#define MICFIL_VAD0_STAT_EF_MASK       BIT(MICFIL_VAD0_STAT_EF_SHIFT)
> -#define MICFIL_VAD0_STAT_EF            BIT(MICFIL_VAD0_STAT_EF_SHIFT)
> -#define MICFIL_VAD0_STAT_IF_SHIFT      0
> -#define MICFIL_VAD0_STAT_IF_MASK       BIT(MICFIL_VAD0_STAT_IF_SHIFT)
> -#define MICFIL_VAD0_STAT_IF            BIT(MICFIL_VAD0_STAT_IF_SHIFT)
> +#define MICFIL_VAD0_STAT_INITF         BIT(31)
> +#define MICFIL_VAD0_STAT_INSATF                BIT(16)
> +#define MICFIL_VAD0_STAT_EF            BIT(15)
> +#define MICFIL_VAD0_STAT_IF            BIT(0)
>
>  /* MICFIL Output Control Register */
>  #define MICFIL_OUTGAIN_CHX_SHIFT(v)    (4 * (v))
> --
> 2.30.2
>
>
