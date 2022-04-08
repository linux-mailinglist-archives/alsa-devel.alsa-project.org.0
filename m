Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330E4F8D39
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 07:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B688717A3;
	Fri,  8 Apr 2022 07:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B688717A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649394541;
	bh=znwS56PTWNPGl1kEV3iWsoSEv5YEoujRDX6hoWsEEEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIVI5PAqUmrEO6Wd1M3ysR4atoxVmyxJAvNjQrtzShW8tzidbcnHOgq1NKLZ27xUo
	 9AaPTBdVT34dwOjTbP6gu9DNOmLo/H/yOjfoIsKgmp06fHbTxPHxLKcT0ODW0M9kez
	 XJuy/Nr9ULw2VMk9MNA7M6ijCGIZQm0RCweu0xmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 254AEF80311;
	Fri,  8 Apr 2022 07:08:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 010CEF8014E; Fri,  8 Apr 2022 07:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B026FF80116
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 07:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B026FF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="daaDFDpG"
Received: by mail-qt1-x831.google.com with SMTP id z19so9888642qtw.2
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 22:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TMDSL6zyhvr1LgKLkIQowNDvpTsdHJhZutYGrI2hyMA=;
 b=daaDFDpGRmpOmpY/uxynaIBuioL7C/Zfh33PkvQtEcnruBBSlJHPZMsJqeDSl5HYKH
 tDtF0Lmt5thpARPFmGFwUqvwASF31G3o8gPDT/itqaQyZGifD3ek5zZvTx+rkz8obrtG
 33+c7tLyc74x1DJc/8So/NHdlzGlIbTzzBZ3shfx42qKJ0sG0aHK50zt7zPyiRyAp5f/
 lsltUzzP+vJLqCLDNT5/JQTVn25/fjmtNRE16Pm0FiR+HA/kK5ag4uUk9vnRZ1svlDhn
 rtBqaPQsbDe8nMKSOWdhbrv0Xb13B78mqKvLN0SEnxrDcXEGVV9iA2aPrQqkuuaAzsBX
 6PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TMDSL6zyhvr1LgKLkIQowNDvpTsdHJhZutYGrI2hyMA=;
 b=0caZ7vWVDM6SmZ0k/b1vNLtNMUa2nxjwTfgwUV4dtXFrTdIj4R4D8I7S2K8tQfAS92
 8Saw0sILHSdoJU3cXXMUQ7xHhPKsSTZvlj0Mm9zTsyJ/QT4Ag8oAGLfm921nR7WRmNcf
 K4Kfoq+pqKLA9+IEIORYfDy9qjUgoEjWyshngpDNmyT3/Iv51fLNB+LLf/ES8KsblXbK
 7wbCSNOC02goGnjKK91Iq+ZWuk0+n6lg/oiLoBF4eCANShqGrxIh9lN/xHjD6hckzU33
 4CTiJrPITSavidKzaIJIkMDeLh92gRxFA6UGTgWPPVI1n/oOPXLJYsUVZTye4oXlyXEg
 gOeA==
X-Gm-Message-State: AOAM531dU9mRINvgz50HTFupdBN9no6ayocfsxKYWhxQBgvFZHh4nYFs
 B4jOEZLbokWVygOOLkRSD6vedrAIL+KgO4He0JA=
X-Google-Smtp-Source: ABdhPJxEZXjQQZEnQT9/OC0LHSPJSePkwbi53Evi/pqW7+qg973Ob09Rtox0U8uBLJn6vE5mtvBLI0Kdo8IZVW2FphM=
X-Received: by 2002:a05:622a:1990:b0:2e1:a7bf:9222 with SMTP id
 u16-20020a05622a199000b002e1a7bf9222mr14648354qtc.230.1649394467996; Thu, 07
 Apr 2022 22:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
 <20220407084936.223075-6-s.hauer@pengutronix.de>
In-Reply-To: <20220407084936.223075-6-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Apr 2022 13:07:37 +0800
Message-ID: <CAA+D8AMN26Qev24qxz4yrt3=bLgEbKoTd8TkRF_m1aUVUiCBFw@mail.gmail.com>
Subject: Re: [PATCH v4 05/21] ASoC: fsl_micfil: use GENMASK to define register
 bit fields
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

> Use GENMASK along with FIELD_PREP and FIELD_GET to access bitfields in
> registers to straighten register access and to drop a lot of defines.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>
> Notes:
>     Changes since v1:
>     - add missing include linux/bitfield.h
>
>  sound/soc/fsl/fsl_micfil.c |  52 ++++++-------
>  sound/soc/fsl/fsl_micfil.h | 147 ++++++++-----------------------------
>  2 files changed, 58 insertions(+), 141 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 878d24fde3581..cfa8af668d921 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright 2018 NXP
>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/interrupt.h>
> @@ -116,23 +117,22 @@ static inline int get_pdm_clk(struct fsl_micfil
> *micfil,
>         int bclk;
>
>         regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
> -       osr = 16 - ((ctrl2_reg & MICFIL_CTRL2_CICOSR_MASK)
> -                   >> MICFIL_CTRL2_CICOSR_SHIFT);
> -       qsel = ctrl2_reg & MICFIL_CTRL2_QSEL_MASK;
> +       osr = 16 - FIELD_GET(MICFIL_CTRL2_CICOSR, ctrl2_reg);
> +       qsel = FIELD_GET(MICFIL_CTRL2_QSEL, ctrl2_reg);
>
>         switch (qsel) {
> -       case MICFIL_HIGH_QUALITY:
> +       case MICFIL_QSEL_HIGH_QUALITY:
>                 bclk = rate * 8 * osr / 2; /* kfactor = 0.5 */
>                 break;
> -       case MICFIL_MEDIUM_QUALITY:
> -       case MICFIL_VLOW0_QUALITY:
> +       case MICFIL_QSEL_MEDIUM_QUALITY:
> +       case MICFIL_QSEL_VLOW0_QUALITY:
>                 bclk = rate * 4 * osr * 1; /* kfactor = 1 */
>                 break;
> -       case MICFIL_LOW_QUALITY:
> -       case MICFIL_VLOW1_QUALITY:
> +       case MICFIL_QSEL_LOW_QUALITY:
> +       case MICFIL_QSEL_VLOW1_QUALITY:
>                 bclk = rate * 2 * osr * 2; /* kfactor = 2 */
>                 break;
> -       case MICFIL_VLOW2_QUALITY:
> +       case MICFIL_QSEL_VLOW2_QUALITY:
>                 bclk = rate * osr * 4; /* kfactor = 4 */
>                 break;
>         default:
> @@ -244,8 +244,8 @@ static int fsl_micfil_trigger(struct snd_pcm_substream
> *substream, int cmd,
>                  * 11 - reserved
>                  */
>                 ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                        MICFIL_CTRL1_DISEL_MASK,
> -                                        (1 << MICFIL_CTRL1_DISEL_SHIFT));
> +                               MICFIL_CTRL1_DISEL,
> +                               FIELD_PREP(MICFIL_CTRL1_DISEL,
> MICFIL_CTRL1_DISEL_DMA));
>                 if (ret) {
>                         dev_err(dev, "failed to update DISEL bits\n");
>                         return ret;
> @@ -274,8 +274,8 @@ static int fsl_micfil_trigger(struct snd_pcm_substream
> *substream, int cmd,
>                 }
>
>                 ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
> -                                        MICFIL_CTRL1_DISEL_MASK,
> -                                        (0 << MICFIL_CTRL1_DISEL_SHIFT));
> +                               MICFIL_CTRL1_DISEL,
> +                               FIELD_PREP(MICFIL_CTRL1_DISEL,
> MICFIL_CTRL1_DISEL_DISABLE));
>                 if (ret) {
>                         dev_err(dev, "failed to update DISEL bits\n");
>                         return ret;
> @@ -300,8 +300,8 @@ static int fsl_set_clock_params(struct device *dev,
> unsigned int rate)
>
>         /* set CICOSR */
>         ret |= regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> -                                MICFIL_CTRL2_CICOSR_MASK,
> -                                MICFIL_CTRL2_OSR_DEFAULT);
> +                                MICFIL_CTRL2_CICOSR,
> +                                FIELD_PREP(MICFIL_CTRL2_CICOSR,
> MICFIL_CTRL2_CICOSR_DEFAULT));
>         if (ret)
>                 dev_err(dev, "failed to set CICOSR in reg 0x%X\n",
>                         REG_MICFIL_CTRL2);
> @@ -312,7 +312,8 @@ static int fsl_set_clock_params(struct device *dev,
> unsigned int rate)
>                 ret = -EINVAL;
>
>         ret |= regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> -                                MICFIL_CTRL2_CLKDIV_MASK, clk_div);
> +                                MICFIL_CTRL2_CLKDIV,
> +                                FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div));
>         if (ret)
>                 dev_err(dev, "failed to set CLKDIV in reg 0x%X\n",
>                         REG_MICFIL_CTRL2);
> @@ -368,13 +369,13 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
> *cpu_dai)
>  {
>         struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
>         struct device *dev = cpu_dai->dev;
> -       unsigned int val;
>         int ret;
>         int i;
>
>         /* set qsel to medium */
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> -                                MICFIL_CTRL2_QSEL_MASK,
> MICFIL_MEDIUM_QUALITY);
> +                       MICFIL_CTRL2_QSEL,
> +                       FIELD_PREP(MICFIL_CTRL2_QSEL,
> MICFIL_QSEL_MEDIUM_QUALITY));
>         if (ret) {
>                 dev_err(dev, "failed to set quality mode bits, reg 0x%X\n",
>                         REG_MICFIL_CTRL2);
> @@ -390,10 +391,9 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
> *cpu_dai)
>                                   &micfil->dma_params_rx);
>
>         /* FIFO Watermark Control - FIFOWMK*/
> -       val = MICFIL_FIFO_CTRL_FIFOWMK(micfil->soc->fifo_depth) - 1;
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_FIFO_CTRL,
> -                                MICFIL_FIFO_CTRL_FIFOWMK_MASK,
> -                                val);
> +                       MICFIL_FIFO_CTRL_FIFOWMK,
> +                       FIELD_PREP(MICFIL_FIFO_CTRL_FIFOWMK,
> micfil->soc->fifo_depth - 1));
>         if (ret) {
>                 dev_err(dev, "failed to set FIFOWMK\n");
>                 return ret;
> @@ -553,11 +553,11 @@ static irqreturn_t micfil_isr(int irq, void *devid)
>         regmap_read(micfil->regmap, REG_MICFIL_CTRL1, &ctrl1_reg);
>         regmap_read(micfil->regmap, REG_MICFIL_FIFO_STAT, &fifo_stat_reg);
>
> -       dma_enabled = MICFIL_DMA_ENABLED(ctrl1_reg);
> +       dma_enabled = FIELD_GET(MICFIL_CTRL1_DISEL, ctrl1_reg) ==
> MICFIL_CTRL1_DISEL_DMA;
>
>         /* Channel 0-7 Output Data Flags */
>         for (i = 0; i < MICFIL_OUTPUT_CHANNELS; i++) {
> -               if (stat_reg & MICFIL_STAT_CHXF_MASK(i))
> +               if (stat_reg & MICFIL_STAT_CHXF(i))
>                         dev_dbg(&pdev->dev,
>                                 "Data available in Data Channel %d\n", i);
>                 /* if DMA is not enabled, field must be written with 1
> @@ -566,17 +566,17 @@ static irqreturn_t micfil_isr(int irq, void *devid)
>                 if (!dma_enabled)
>                         regmap_write_bits(micfil->regmap,
>                                           REG_MICFIL_STAT,
> -                                         MICFIL_STAT_CHXF_MASK(i),
> +                                         MICFIL_STAT_CHXF(i),
>                                           1);
>         }
>
>         for (i = 0; i < MICFIL_FIFO_NUM; i++) {
> -               if (fifo_stat_reg & MICFIL_FIFO_STAT_FIFOX_OVER_MASK(i))
> +               if (fifo_stat_reg & MICFIL_FIFO_STAT_FIFOX_OVER(i))
>                         dev_dbg(&pdev->dev,
>                                 "FIFO Overflow Exception flag for channel
> %d\n",
>                                 i);
>
> -               if (fifo_stat_reg & MICFIL_FIFO_STAT_FIFOX_UNDER_MASK(i))
> +               if (fifo_stat_reg & MICFIL_FIFO_STAT_FIFOX_UNDER(i))
>                         dev_dbg(&pdev->dev,
>                                 "FIFO Underflow Exception flag for channel
> %d\n",
>                                 i);
> diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
> index 11ccc08523b2e..5cecae2519795 100644
> --- a/sound/soc/fsl/fsl_micfil.h
> +++ b/sound/soc/fsl/fsl_micfil.h
> @@ -39,82 +39,45 @@
>  #define MICFIL_CTRL1_DBG               BIT(28)
>  #define MICFIL_CTRL1_SRES              BIT(27)
>  #define MICFIL_CTRL1_DBGE              BIT(26)
> -#define MICFIL_CTRL1_DISEL_SHIFT       24
> -#define MICFIL_CTRL1_DISEL_WIDTH       2
> -#define MICFIL_CTRL1_DISEL_MASK
> ((BIT(MICFIL_CTRL1_DISEL_WIDTH) - 1) \
> -                                        << MICFIL_CTRL1_DISEL_SHIFT)
> +
> +#define MICFIL_CTRL1_DISEL_DISABLE     0
> +#define MICFIL_CTRL1_DISEL_DMA         1
> +#define MICFIL_CTRL1_DISEL_IRQ         2
> +#define MICFIL_CTRL1_DISEL             GENMASK(25, 24)
>  #define MICFIL_CTRL1_ERREN             BIT(23)
> -#define MICFIL_CTRL1_CHEN_SHIFT                0
> -#define MICFIL_CTRL1_CHEN_WIDTH                8
> -#define MICFIL_CTRL1_CHEN_MASK(x)      (BIT(x) << MICFIL_CTRL1_CHEN_SHIFT)
> -#define MICFIL_CTRL1_CHEN(x)           (MICFIL_CTRL1_CHEN_MASK(x))
> +#define MICFIL_CTRL1_CHEN(ch)          BIT(ch)
>
>  /* MICFIL Control Register 2 -- REG_MICFILL_CTRL2 0x04 */
>  #define MICFIL_CTRL2_QSEL_SHIFT                25
> -#define MICFIL_CTRL2_QSEL_WIDTH                3
> -#define MICFIL_CTRL2_QSEL_MASK         ((BIT(MICFIL_CTRL2_QSEL_WIDTH) -
> 1) \
> -                                        << MICFIL_CTRL2_QSEL_SHIFT)
> -#define MICFIL_HIGH_QUALITY            BIT(MICFIL_CTRL2_QSEL_SHIFT)
> -#define MICFIL_MEDIUM_QUALITY          (0 << MICFIL_CTRL2_QSEL_SHIFT)
> -#define MICFIL_LOW_QUALITY             (7 << MICFIL_CTRL2_QSEL_SHIFT)
> -#define MICFIL_VLOW0_QUALITY           (6 << MICFIL_CTRL2_QSEL_SHIFT)
> -#define MICFIL_VLOW1_QUALITY           (5 << MICFIL_CTRL2_QSEL_SHIFT)
> -#define MICFIL_VLOW2_QUALITY           (4 << MICFIL_CTRL2_QSEL_SHIFT)
> -
> -#define MICFIL_CTRL2_CICOSR_SHIFT      16
> -#define MICFIL_CTRL2_CICOSR_WIDTH      4
> -#define MICFIL_CTRL2_CICOSR_MASK       ((BIT(MICFIL_CTRL2_CICOSR_WIDTH) -
> 1) \
> -                                        << MICFIL_CTRL2_CICOSR_SHIFT)
> -#define MICFIL_CTRL2_CICOSR(v)         (((v) <<
> MICFIL_CTRL2_CICOSR_SHIFT) \
> -                                        & MICFIL_CTRL2_CICOSR_MASK)
> -#define MICFIL_CTRL2_CLKDIV_SHIFT      0
> -#define MICFIL_CTRL2_CLKDIV_WIDTH      8
> -#define MICFIL_CTRL2_CLKDIV_MASK       ((BIT(MICFIL_CTRL2_CLKDIV_WIDTH) -
> 1) \
> -                                        << MICFIL_CTRL2_CLKDIV_SHIFT)
> -#define MICFIL_CTRL2_CLKDIV(v)         (((v) <<
> MICFIL_CTRL2_CLKDIV_SHIFT) \
> -                                        & MICFIL_CTRL2_CLKDIV_MASK)
> +#define MICFIL_CTRL2_QSEL              GENMASK(27, 25)
> +#define MICFIL_QSEL_MEDIUM_QUALITY     0
> +#define MICFIL_QSEL_HIGH_QUALITY       1
> +#define MICFIL_QSEL_LOW_QUALITY                7
> +#define MICFIL_QSEL_VLOW0_QUALITY      6
> +#define MICFIL_QSEL_VLOW1_QUALITY      5
> +#define MICFIL_QSEL_VLOW2_QUALITY      4
> +
> +#define MICFIL_CTRL2_CICOSR            GENMASK(19, 16)
> +#define MICFIL_CTRL2_CICOSR_DEFAULT    0
> +#define MICFIL_CTRL2_CLKDIV            GENMASK(7, 0)
>
>  /* MICFIL Status Register -- REG_MICFIL_STAT 0x08 */
>  #define MICFIL_STAT_BSY_FIL            BIT(31)
>  #define MICFIL_STAT_FIR_RDY            BIT(30)
>  #define MICFIL_STAT_LOWFREQF           BIT(29)
> -#define MICFIL_STAT_CHXF_SHIFT(v)      (v)
> -#define MICFIL_STAT_CHXF_MASK(v)       BIT(MICFIL_STAT_CHXF_SHIFT(v))
> -#define MICFIL_STAT_CHXF(v)            BIT(MICFIL_STAT_CHXF_SHIFT(v))
> +#define MICFIL_STAT_CHXF(ch)           BIT(ch)
>
>  /* MICFIL FIFO Control Register -- REG_MICFIL_FIFO_CTRL 0x10 */
> -#define MICFIL_FIFO_CTRL_FIFOWMK_SHIFT 0
> -#define MICFIL_FIFO_CTRL_FIFOWMK_WIDTH 3
> -#define MICFIL_FIFO_CTRL_FIFOWMK_MASK
> ((BIT(MICFIL_FIFO_CTRL_FIFOWMK_WIDTH) - 1) \
> -                                        << MICFIL_FIFO_CTRL_FIFOWMK_SHIFT)
> -#define MICFIL_FIFO_CTRL_FIFOWMK(v)    (((v) <<
> MICFIL_FIFO_CTRL_FIFOWMK_SHIFT) \
> -                                        & MICFIL_FIFO_CTRL_FIFOWMK_MASK)
> +#define MICFIL_FIFO_CTRL_FIFOWMK       GENMASK(2, 0)
>
>  /* MICFIL FIFO Status Register -- REG_MICFIL_FIFO_STAT 0x14 */
> -#define MICFIL_FIFO_STAT_FIFOX_OVER_SHIFT(v)   (v)
> -#define MICFIL_FIFO_STAT_FIFOX_OVER_MASK(v)
> BIT(MICFIL_FIFO_STAT_FIFOX_OVER_SHIFT(v))
> -#define MICFIL_FIFO_STAT_FIFOX_UNDER_SHIFT(v)  ((v) + 8)
> -#define MICFIL_FIFO_STAT_FIFOX_UNDER_MASK(v)
>  BIT(MICFIL_FIFO_STAT_FIFOX_UNDER_SHIFT(v))
> +#define MICFIL_FIFO_STAT_FIFOX_OVER(ch)        BIT(ch)
> +#define MICFIL_FIFO_STAT_FIFOX_UNDER(ch)       BIT((ch) + 8)
>
>  /* MICFIL HWVAD0 Control 1 Register -- REG_MICFIL_VAD0_CTRL1*/
> -#define MICFIL_VAD0_CTRL1_CHSEL_SHIFT  24
> -#define MICFIL_VAD0_CTRL1_CHSEL_WIDTH  3
> -#define MICFIL_VAD0_CTRL1_CHSEL_MASK
>  ((BIT(MICFIL_VAD0_CTRL1_CHSEL_WIDTH) - 1) \
> -                                        << MICFIL_VAD0_CTRL1_CHSEL_SHIFT)
> -#define MICFIL_VAD0_CTRL1_CHSEL(v)     (((v) <<
> MICFIL_VAD0_CTRL1_CHSEL_SHIFT) \
> -                                        & MICFIL_VAD0_CTRL1_CHSEL_MASK)
> -#define MICFIL_VAD0_CTRL1_CICOSR_SHIFT 16
> -#define MICFIL_VAD0_CTRL1_CICOSR_WIDTH 4
> -#define MICFIL_VAD0_CTRL1_CICOSR_MASK
> ((BIT(MICFIL_VAD0_CTRL1_CICOSR_WIDTH) - 1) \
> -                                        << MICFIL_VAD0_CTRL1_CICOSR_SHIFT)
> -#define MICFIL_VAD0_CTRL1_CICOSR(v)    (((v) <<
> MICFIL_VAD0_CTRL1_CICOSR_SHIFT) \
> -                                        & MICFIL_VAD0_CTRL1_CICOSR_MASK)
> -#define MICFIL_VAD0_CTRL1_INITT_SHIFT  8
> -#define MICFIL_VAD0_CTRL1_INITT_WIDTH  5
> -#define MICFIL_VAD0_CTRL1_INITT_MASK
>  ((BIT(MICFIL_VAD0_CTRL1_INITT_WIDTH) - 1) \
> -                                        << MICFIL_VAD0_CTRL1_INITT_SHIFT)
> -#define MICFIL_VAD0_CTRL1_INITT(v)     (((v) <<
> MICFIL_VAD0_CTRL1_INITT_SHIFT) \
> -                                        & MICFIL_VAD0_CTRL1_INITT_MASK)
> +#define MICFIL_VAD0_CTRL1_CHSEL_SHIFT  GENMASK(26, 24)
> +#define MICFIL_VAD0_CTRL1_CICOSR_SHIFT GENMASK(19, 16)
> +#define MICFIL_VAD0_CTRL1_INITT_SHIFT  GENMASK(12, 8)
>  #define MICFIL_VAD0_CTRL1_ST10         BIT(4)
>  #define MICFIL_VAD0_CTRL1_ERIE         BIT(3)
>  #define MICFIL_VAD0_CTRL1_IE           BIT(2)
> @@ -125,66 +88,26 @@
>  #define MICFIL_VAD0_CTRL2_FRENDIS      BIT(31)
>  #define MICFIL_VAD0_CTRL2_PREFEN       BIT(30)
>  #define MICFIL_VAD0_CTRL2_FOUTDIS      BIT(28)
> -#define MICFIL_VAD0_CTRL2_FRAMET_SHIFT 16
> -#define MICFIL_VAD0_CTRL2_FRAMET_WIDTH 6
> -#define MICFIL_VAD0_CTRL2_FRAMET_MASK
> ((BIT(MICFIL_VAD0_CTRL2_FRAMET_WIDTH) - 1) \
> -                                        << MICFIL_VAD0_CTRL2_FRAMET_SHIFT)
> -#define MICFIL_VAD0_CTRL2_FRAMET(v)    (((v) <<
> MICFIL_VAD0_CTRL2_FRAMET_SHIFT) \
> -                                        & MICFIL_VAD0_CTRL2_FRAMET_MASK)
> -#define MICFIL_VAD0_CTRL2_INPGAIN_SHIFT        8
> -#define MICFIL_VAD0_CTRL2_INPGAIN_WIDTH        4
> -#define MICFIL_VAD0_CTRL2_INPGAIN_MASK
> ((BIT(MICFIL_VAD0_CTRL2_INPGAIN_WIDTH) - 1) \
> -                                        <<
> MICFIL_VAD0_CTRL2_INPGAIN_SHIFT)
> -#define MICFIL_VAD0_CTRL2_INPGAIN(v)   (((v) <<
> MICFIL_VAD0_CTRL2_INPGAIN_SHIFT) \
> -                                       & MICFIL_VAD0_CTRL2_INPGAIN_MASK)
> -#define MICFIL_VAD0_CTRL2_HPF_SHIFT    0
> -#define MICFIL_VAD0_CTRL2_HPF_WIDTH    2
> -#define MICFIL_VAD0_CTRL2_HPF_MASK     ((BIT(MICFIL_VAD0_CTRL2_HPF_WIDTH)
> - 1) \
> -                                        << MICFIL_VAD0_CTRL2_HPF_SHIFT)
> -#define MICFIL_VAD0_CTRL2_HPF(v)       (((v) <<
> MICFIL_VAD0_CTRL2_HPF_SHIFT) \
> -                                        & MICFIL_VAD0_CTRL2_HPF_MASK)
> +#define MICFIL_VAD0_CTRL2_FRAMET       GENMASK(21, 16)
> +#define MICFIL_VAD0_CTRL2_INPGAIN      GENMASK(11, 8)
> +#define MICFIL_VAD0_CTRL2_HPF          GENMASK(1, 0)
>
>  /* MICFIL HWVAD0 Signal CONFIG Register -- REG_MICFIL_VAD0_SCONFIG */
>  #define MICFIL_VAD0_SCONFIG_SFILEN             BIT(31)
>  #define MICFIL_VAD0_SCONFIG_SMAXEN             BIT(30)
> -#define MICFIL_VAD0_SCONFIG_SGAIN_SHIFT                0
> -#define MICFIL_VAD0_SCONFIG_SGAIN_WIDTH                4
> -#define MICFIL_VAD0_SCONFIG_SGAIN_MASK
>  ((BIT(MICFIL_VAD0_SCONFIG_SGAIN_WIDTH) - 1) \
> -                                               <<
> MICFIL_VAD0_SCONFIG_SGAIN_SHIFT)
> -#define MICFIL_VAD0_SCONFIG_SGAIN(v)           (((v) <<
> MICFIL_VAD0_SCONFIG_SGAIN_SHIFT) \
> -                                                &
> MICFIL_VAD0_SCONFIG_SGAIN_MASK)
> +#define MICFIL_VAD0_SCONFIG_SGAIN              GENMASK(3, 0)
>
>  /* MICFIL HWVAD0 Noise CONFIG Register -- REG_MICFIL_VAD0_NCONFIG */
>  #define MICFIL_VAD0_NCONFIG_NFILAUT            BIT(31)
>  #define MICFIL_VAD0_NCONFIG_NMINEN             BIT(30)
>  #define MICFIL_VAD0_NCONFIG_NDECEN             BIT(29)
>  #define MICFIL_VAD0_NCONFIG_NOREN              BIT(28)
> -#define MICFIL_VAD0_NCONFIG_NFILADJ_SHIFT      8
> -#define MICFIL_VAD0_NCONFIG_NFILADJ_WIDTH      5
> -#define MICFIL_VAD0_NCONFIG_NFILADJ_MASK
>  ((BIT(MICFIL_VAD0_NCONFIG_NFILADJ_WIDTH) - 1) \
> -                                                <<
> MICFIL_VAD0_NCONFIG_NFILADJ_SHIFT)
> -#define MICFIL_VAD0_NCONFIG_NFILADJ(v)         (((v) <<
> MICFIL_VAD0_NCONFIG_NFILADJ_SHIFT) \
> -                                                &
> MICFIL_VAD0_NCONFIG_NFILADJ_MASK)
> -#define MICFIL_VAD0_NCONFIG_NGAIN_SHIFT                0
> -#define MICFIL_VAD0_NCONFIG_NGAIN_WIDTH                4
> -#define MICFIL_VAD0_NCONFIG_NGAIN_MASK
>  ((BIT(MICFIL_VAD0_NCONFIG_NGAIN_WIDTH) - 1) \
> -                                                <<
> MICFIL_VAD0_NCONFIG_NGAIN_SHIFT)
> -#define MICFIL_VAD0_NCONFIG_NGAIN(v)           (((v) <<
> MICFIL_VAD0_NCONFIG_NGAIN_SHIFT) \
> -                                                &
> MICFIL_VAD0_NCONFIG_NGAIN_MASK)
> +#define MICFIL_VAD0_NCONFIG_NFILADJ            GENMASK(12, 8)
> +#define MICFIL_VAD0_NCONFIG_NGAIN              GENMASK(3, 0)
>
>  /* MICFIL HWVAD0 Zero-Crossing Detector - REG_MICFIL_VAD0_ZCD */
> -#define MICFIL_VAD0_ZCD_ZCDTH_SHIFT    16
> -#define MICFIL_VAD0_ZCD_ZCDTH_WIDTH    10
> -#define MICFIL_VAD0_ZCD_ZCDTH_MASK     ((BIT(MICFIL_VAD0_ZCD_ZCDTH_WIDTH)
> - 1) \
> -                                        << MICFIL_VAD0_ZCD_ZCDTH_SHIFT)
> -#define MICFIL_VAD0_ZCD_ZCDTH(v)       (((v) <<
> MICFIL_VAD0_ZCD_ZCDTH_SHIFT)\
> -                                        & MICFIL_VAD0_ZCD_ZCDTH_MASK)
> -#define MICFIL_VAD0_ZCD_ZCDADJ_SHIFT   8
> -#define MICFIL_VAD0_ZCD_ZCDADJ_WIDTH   4
> -#define MICFIL_VAD0_ZCD_ZCDADJ_MASK
> ((BIT(MICFIL_VAD0_ZCD_ZCDADJ_WIDTH) - 1)\
> -                                        << MICFIL_VAD0_ZCD_ZCDADJ_SHIFT)
> -#define MICFIL_VAD0_ZCD_ZCDADJ(v)      (((v) <<
> MICFIL_VAD0_ZCD_ZCDADJ_SHIFT)\
> -                                        & MICFIL_VAD0_ZCD_ZCDADJ_MASK)
> +#define MICFIL_VAD0_ZCD_ZCDTH          GENMASK(25, 16)
> +#define MICFIL_VAD0_ZCD_ZCDADJ_SHIFT   GENMASK(11, 8)
>  #define MICFIL_VAD0_ZCD_ZCDAND         BIT(4)
>  #define MICFIL_VAD0_ZCD_ZCDAUT         BIT(2)
>  #define MICFIL_VAD0_ZCD_ZCDEN          BIT(0)
> @@ -199,11 +122,6 @@
>  #define MICFIL_OUTGAIN_CHX_SHIFT(v)    (4 * (v))
>
>  /* Constants */
> -#define MICFIL_DMA_IRQ_DISABLED(v)     ((v) & MICFIL_CTRL1_DISEL_MASK)
> -#define MICFIL_DMA_ENABLED(v)          ((0x1 << MICFIL_CTRL1_DISEL_SHIFT)
> \
> -                                        == ((v) &
> MICFIL_CTRL1_DISEL_MASK))
> -#define MICFIL_IRQ_ENABLED(v)          ((0x2 << MICFIL_CTRL1_DISEL_SHIFT)
> \
> -                                        == ((v) &
> MICFIL_CTRL1_DISEL_MASK))
>  #define MICFIL_OUTPUT_CHANNELS         8
>  #define MICFIL_FIFO_NUM                        8
>
> @@ -215,6 +133,5 @@
>  #define MICFIL_SLEEP_MIN               90000 /* in us */
>  #define MICFIL_SLEEP_MAX               100000 /* in us */
>  #define MICFIL_DMA_MAXBURST_RX         6
> -#define MICFIL_CTRL2_OSR_DEFAULT       (0 << MICFIL_CTRL2_CICOSR_SHIFT)
>
>  #endif /* _FSL_MICFIL_H */
> --
> 2.30.2
>
>
