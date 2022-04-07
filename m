Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB04F7551
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 07:26:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31144172D;
	Thu,  7 Apr 2022 07:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31144172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649309160;
	bh=umyztphcJ1G6NOmjGnx7U3Ghpywo1L8NZZiw2b9aazA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hF3a3LAubn2TlZUvea0oJoP38E/NstfYPw6139ZbKf+kpbKN+cvFQj9LOI6/pNltp
	 FJUEHmrY3cWu6UJRcTIOJp90XS6hckSM4KtsVxDSZKTeVOAlWtA4O+qYESzz7EO8e8
	 rdplVQ+wDprjpcC3FA4tEyh69/hCKEwz4rGy+a70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85D0FF8026A;
	Thu,  7 Apr 2022 07:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BD5AF8024C; Thu,  7 Apr 2022 07:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CC3EF8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 07:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CC3EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eEOGZJ+z"
Received: by mail-qt1-x831.google.com with SMTP id a11so7190967qtb.12
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 22:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FOEVx2jIEFS35e58xroFgmGCGfJztElRC2Eu4xF6lDg=;
 b=eEOGZJ+zA5LSWpZcXdamHw2ndmGcS5TxYsr1f5PhWLHFiBsgYuV1pIplJJ9io/KcK8
 pOAOyIF6kR6VDkf4xUR2Q3R/Cntbv+4RJsf93Fs79TT0G6OBed3re0bQ7IGPFnSWVIXJ
 JXeBN33U76jWmRYZf80/ORQLJfJ5aFc+QzUMRhVPmoaPS6vH+trv4Y5AaX3oKJMVoSpt
 lLFSsLX9EhTZY/b9jzAfZZfxqO/CP9LPrP82p48m+ACvugRVlXyo/2Mfji9cBT5iyDhb
 DxLQqK9HFshsiaiF0+D67SdlxlL9t/DLjNaLOttJ1yoyqe7OaXfdeKtFq1l75OxYHsLf
 Ts8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FOEVx2jIEFS35e58xroFgmGCGfJztElRC2Eu4xF6lDg=;
 b=WMkjOiENdRodcmYU0K8zk3P5xjUUgSngIg8hbSTGFDq4HA7MRKH2JFlUo9pjoRRL4u
 FCfcueCKsu7Qe/gNXJ2Vowjy71z7oZg1y0fS5xLIk2iMNUDiWin/JLTd27vnMZxqF/lM
 XerjHLq4XrX2cshsEaT9uE10pqxk/2jXZDXZOqTLbFl+JjcPoIVcrdUBgXHappuD2NQr
 HUIizX6eE39EKfvmlM91k9fG53V66k74AoSc6PdlKtuTUsTZompVQRbQ74M170qR1mhk
 KbwqncUMVkypp9hcFZO9RdIRN9boyET9lTl5M17Q2tztsKoM95Pr7kIIRhKfv2BMrVmq
 8lCg==
X-Gm-Message-State: AOAM532sSOJUO1ThjSExqxxNcvon8uP5R/iiNuT53TvL3Fj8BytCaP2G
 mW71O568tH2bAp7eabNeK0mmbHvtymjPRE9JFM4=
X-Google-Smtp-Source: ABdhPJzghS/7PTkk9zAv/ulJSea3Q1zmV4Xgecu246LyhRa6YoDm2E1DG0WPRJmtoh8bXI8BT7opDBj6dpwRNMCZFqg=
X-Received: by 2002:ac8:5b87:0:b0:2e1:fe79:d65d with SMTP id
 a7-20020ac85b87000000b002e1fe79d65dmr10640054qta.480.1649309088047; Wed, 06
 Apr 2022 22:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-17-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-17-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 13:24:37 +0800
Message-ID: <CAA+D8AMcYf2Mx+QVJXOD6nHDMtrRTcXhcya+7fYkBUc9U5x2vQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] ASoC: fsl_micfil: rework quality setting
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

> For the quality setting the quality setting register values are directly
> exposed to the kcontrol and thus to userspace. This is unfortunate
> because the register settings contains invalid bit combinations marked
> as "N/A". For userspace it doesn't make much sense to be able to set
> these just to see that the driver responds with "Please make sure you
> select a valid quality." in the kernel log.
>
> Work around this by adding get/set functions for the quality setting.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  sound/soc/fsl/fsl_micfil.c | 109 ++++++++++++++++++++++++++-----------
>  1 file changed, 77 insertions(+), 32 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index fd3b168a38661..e28a2e2ba5c97 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -31,6 +31,15 @@
>
>  #define MICFIL_OSR_DEFAULT     16
>
> +enum quality {
> +       QUALITY_HIGH,
> +       QUALITY_MEDIUM,
> +       QUALITY_LOW,
> +       QUALITY_VLOW0,
> +       QUALITY_VLOW1,
> +       QUALITY_VLOW2,
> +};
> +
>  struct fsl_micfil {
>         struct platform_device *pdev;
>         struct regmap *regmap;
> @@ -42,7 +51,7 @@ struct fsl_micfil {
>         unsigned int dataline;
>         char name[32];
>         int irq[MICFIL_IRQ_LINES];
> -       int quality;    /*QUALITY 2-0 bits */
> +       enum quality quality;
>         unsigned int osr;
>  };
>
> @@ -66,29 +75,73 @@ static const struct of_device_id fsl_micfil_dt_ids[] =
> {
>  };
>  MODULE_DEVICE_TABLE(of, fsl_micfil_dt_ids);
>
> -/* Table 5. Quality Modes
> - * Medium      0 0 0
> - * High                0 0 1
> - * Very Low 2  1 0 0
> - * Very Low 1  1 0 1
> - * Very Low 0  1 1 0
> - * Low         1 1 1
> - */
>  static const char * const micfil_quality_select_texts[] = {
> -       "Medium", "High",
> -       "N/A", "N/A",
> -       "VLow2", "VLow1",
> -       "VLow0", "Low",
> +       [QUALITY_HIGH] = "High",
> +       [QUALITY_MEDIUM] = "Medium",
> +       [QUALITY_LOW] = "Low",
> +       [QUALITY_VLOW0] = "VLow0",
> +       [QUALITY_VLOW1] = "Vlow1",
> +       [QUALITY_VLOW2] = "Vlow2",
>  };
>
>  static const struct soc_enum fsl_micfil_quality_enum =
> -       SOC_ENUM_SINGLE(REG_MICFIL_CTRL2,
> -                       MICFIL_CTRL2_QSEL_SHIFT,
> -                       ARRAY_SIZE(micfil_quality_select_texts),
> -                       micfil_quality_select_texts);
> +       SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(micfil_quality_select_texts),
> +                           micfil_quality_select_texts);
>
>  static DECLARE_TLV_DB_SCALE(gain_tlv, 0, 100, 0);
>
> +static int micfil_set_quality(struct fsl_micfil *micfil)
> +{
> +       u32 qsel;
> +
> +       switch (micfil->quality) {
> +       case QUALITY_HIGH:
> +               qsel = MICFIL_QSEL_HIGH_QUALITY;
> +               break;
> +       case QUALITY_MEDIUM:
> +               qsel = MICFIL_QSEL_MEDIUM_QUALITY;
> +               break;
> +       case QUALITY_LOW:
> +               qsel = MICFIL_QSEL_LOW_QUALITY;
> +               break;
> +       case QUALITY_VLOW0:
> +               qsel = MICFIL_QSEL_VLOW0_QUALITY;
> +               break;
> +       case QUALITY_VLOW1:
> +               qsel = MICFIL_QSEL_VLOW1_QUALITY;
> +               break;
> +       case QUALITY_VLOW2:
> +               qsel = MICFIL_QSEL_VLOW2_QUALITY;
> +               break;
> +       }
> +
> +       return regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> +                                MICFIL_CTRL2_QSEL,
> +                                FIELD_PREP(MICFIL_CTRL2_QSEL, qsel));
>

 Alignment should match open parenthesis?

+}
> +
> +static int micfil_quality_get(struct snd_kcontrol *kcontrol,
> +                            struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *cmpnt =
> snd_soc_kcontrol_component(kcontrol);
> +       struct fsl_micfil *micfil = snd_soc_component_get_drvdata(cmpnt);
> +
> +       ucontrol->value.integer.value[0] = micfil->quality;
> +
> +       return 0;
> +}
> +
> +static int micfil_quality_set(struct snd_kcontrol *kcontrol,
> +                             struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *cmpnt =
> snd_soc_kcontrol_component(kcontrol);
> +       struct fsl_micfil *micfil = snd_soc_component_get_drvdata(cmpnt);
> +
> +       micfil->quality = ucontrol->value.integer.value[0];
> +
> +       return micfil_set_quality(micfil);
> +}
> +
>  static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
>         SOC_SINGLE_SX_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
>                           MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0x7, gain_tlv),
> @@ -108,7 +161,7 @@ static const struct snd_kcontrol_new
> fsl_micfil_snd_controls[] = {
>                           MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0x7, gain_tlv),
>         SOC_ENUM_EXT("MICFIL Quality Select",
>                      fsl_micfil_quality_enum,
> -                    snd_soc_get_enum_double, snd_soc_put_enum_double),
> +                    micfil_quality_get, micfil_quality_set),
>  };
>
>  /* The SRES is a self-negated bit which provides the CPU with the
> @@ -208,22 +261,21 @@ static int fsl_set_clock_params(struct device *dev,
> unsigned int rate)
>  {
>         struct fsl_micfil *micfil = dev_get_drvdata(dev);
>         int clk_div = 8;
> +       int osr = MICFIL_OSR_DEFAULT;
>         int ret;
>
> -       ret = clk_set_rate(micfil->mclk, rate * clk_div * micfil->osr * 8);
> +       ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
>         if (ret)
>                 return ret;
>
> -       /* set CICOSR */
> -       ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> -                                MICFIL_CTRL2_CICOSR,
> -                                FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 -
> MICFIL_OSR_DEFAULT));
> +       ret = micfil_set_quality(micfil);
>         if (ret)
>                 return ret;
>
>         ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> -                                MICFIL_CTRL2_CLKDIV,
> -                                FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div));
> +                                MICFIL_CTRL2_CLKDIV | MICFIL_CTRL2_CICOSR,
> +                                FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div) |
> +                                FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 -
> osr));
>
>         return ret;
>  }
> @@ -276,13 +328,6 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
> *cpu_dai)
>         struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
>         int ret;
>
> -       /* set qsel to medium */
> -       ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
> -                       MICFIL_CTRL2_QSEL,
> -                       FIELD_PREP(MICFIL_CTRL2_QSEL,
> MICFIL_QSEL_MEDIUM_QUALITY));
> -       if (ret)
> -               return ret;
> -
>

The default qsel is medium,  with this change, it seems the default qsel is
changed to
HIGH. it is better to keep medium in this patch.


>         /* set default gain to max_gain */
>         regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x77777777);
>
> --
> 2.30.2
>
>
