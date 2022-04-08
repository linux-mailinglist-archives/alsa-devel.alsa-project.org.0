Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A54C4F9618
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 14:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CACD1A44;
	Fri,  8 Apr 2022 14:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CACD1A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649422117;
	bh=OBOqwCeW+R9WTvT9Qn5l5K5n/lmqk8NoSNmWVUd0oSc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WRK1gY6e6exN7xpP3yG7BG4lg0tfVqoUVLq7/StTteC0SSk4eUq8Nbv+a7koZrvQd
	 VDvJx3pBASDvGxJulsP6X/0bCn46z0qO/P/Ru28jlunwJbMIC6J1gOp1KTIaX5EtmK
	 zgAxT7XMJVfUu9FKxQ8rjr5H4Q7fwQ3z80xrjuSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 818CDF80311;
	Fri,  8 Apr 2022 14:47:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8057CF8014E; Fri,  8 Apr 2022 14:47:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA851F80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 14:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA851F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="anHD87O2"
Received: by mail-qv1-xf36.google.com with SMTP id i15so7410699qvh.0
 for <alsa-devel@alsa-project.org>; Fri, 08 Apr 2022 05:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S9mZxyx2Ja3/vA9arJ2HTYvGHrjBoWxHHKb3cuLZW84=;
 b=anHD87O2xKuGIT1Fgj2k0O9kf2BlLX05R/WSHs3GglHHtNMJi4lSJhLoyydTiGf33T
 4kCA+cEAkQbif6Qf/Husd1V16s6Jurm3ot/guajJnk0CUL3UqI/xcELhIjIb/B1UM53t
 c52C7Ao0OYIrTmWhF8ltuvxiy/AE8Mvxn6TFHUqp9gVpkEpSfNFryI1UbEcnvdcsgGIB
 pkAzs2a0mTVbToihRY+EDszdp5c/oTjlyIWh7aeLAUz7rCGQKJ5qwEQxS/zhARBCjraJ
 oQidZDSOCyaKvgg1Cgyev4lsr7+GSmp9KEvmZqHlkUdh4h7LAsSEGsn68g1SlzauJnrO
 AKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S9mZxyx2Ja3/vA9arJ2HTYvGHrjBoWxHHKb3cuLZW84=;
 b=ERGxHu1EmmBOcLbT3luB1aOzeT1VeyYQ72sMmc1jkZ4Yq4/d8H7izlKgLQ5ZEBsb+e
 U1J6o2SHlgiDpL42JKLin7FMsAJAGXE6GYllvgvc1y5nmwDzDB17GpbVam/0ymyEBO7C
 v6kZRXP04tfzu1/npS+W1F+ivMNqhZPkIMyn/cbSJ4FiAP9IcN3ymakk+zqJ3FyTTOUW
 mRsRh+TkWY0svvDiyXtq2EjvzoRRssnHjk/o6sUMXQJm5ZYQIVVvmsiWj9LpOL0SRIZh
 BKQIa5VMImgMvcatghh/NjivQY8cwSW9xfKeLXISa/vOvhOY6Q5oxzemAJLGmW3Fqzkf
 QGlw==
X-Gm-Message-State: AOAM532n0VGxEDDcZnWBX+/jjMtotw9bft+phm8GQJeyXcsJKZziHg1u
 BDY0XmzztU7VLTVbQBDZ2uD52LKE0t4cD9jqwVc=
X-Google-Smtp-Source: ABdhPJyVyZiVMSVNyupiifrBTU0XBSfb7HgeZJRvo9BLQ9z1jY6fKhUjZwpC6g8GFcFfy9XgQjVB+Q2wYRYPch9qLcI=
X-Received: by 2002:a05:6214:c85:b0:441:2bb9:92fa with SMTP id
 r5-20020a0562140c8500b004412bb992famr15710063qvr.21.1649422044866; Fri, 08
 Apr 2022 05:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220408112928.1326755-1-s.hauer@pengutronix.de>
 <20220408112928.1326755-17-s.hauer@pengutronix.de>
In-Reply-To: <20220408112928.1326755-17-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Apr 2022 20:47:14 +0800
Message-ID: <CAA+D8AMJzV3tN584otxMVZ1AkA8Jjr2qAumT_a436Lp2iDo1tA@mail.gmail.com>
Subject: Re: [PATCH v5 16/21] ASoC: fsl_micfil: rework quality setting
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

On Fri, Apr 8, 2022 at 7:29 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

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
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>
> Notes:
>     Changes since v3:
>     - Leave default quality setting at 'medium'
>
>  sound/soc/fsl/fsl_micfil.c | 109 ++++++++++++++++++++++++++-----------
>  1 file changed, 78 insertions(+), 31 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 4d8dfb2c22290..aecc8a1bcfcd8 100644
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
>  };
>
>  struct fsl_micfil_soc_data {
> @@ -65,29 +74,73 @@ static const struct of_device_id fsl_micfil_dt_ids[] =
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
> +                                 MICFIL_CTRL2_QSEL,
> +                                 FIELD_PREP(MICFIL_CTRL2_QSEL, qsel));
> +}
> +
> +static int micfil_quality_get(struct snd_kcontrol *kcontrol,
> +                             struct snd_ctl_elem_value *ucontrol)
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
> @@ -107,7 +160,7 @@ static const struct snd_kcontrol_new
> fsl_micfil_snd_controls[] = {
>                           MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0x7, gain_tlv),
>         SOC_ENUM_EXT("MICFIL Quality Select",
>                      fsl_micfil_quality_enum,
> -                    snd_soc_get_enum_double, snd_soc_put_enum_double),
> +                    micfil_quality_get, micfil_quality_set),
>  };
>
>  /* The SRES is a self-negated bit which provides the CPU with the
> @@ -207,22 +260,21 @@ static int fsl_set_clock_params(struct device *dev,
> unsigned int rate)
>  {
>         struct fsl_micfil *micfil = dev_get_drvdata(dev);
>         int clk_div = 8;
> +       int osr = MICFIL_OSR_DEFAULT;
>         int ret;
>
> -       ret = clk_set_rate(micfil->mclk, rate * clk_div *
> MICFIL_OSR_DEFAULT * 8);
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
> @@ -275,12 +327,7 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai
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
> +       micfil->quality = QUALITY_MEDIUM;
>
>         /* set default gain to max_gain */
>         regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x77777777);
> --
> 2.30.2
>
>
