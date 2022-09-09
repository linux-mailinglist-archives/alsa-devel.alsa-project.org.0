Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D845B3187
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 10:19:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7970D166A;
	Fri,  9 Sep 2022 10:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7970D166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662711548;
	bh=bjUVpk4QonA3QvEzLqSz+UauNOk0IQ+PVvR7NxGEJ/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a8GtusD8DX/iSiAfvwX8dzYNHpSgDfSd2suYYN5MvS1F6PwtD0YcLw4IO3zWR+VXv
	 /xPsRyIYgbPktCRsB3z2TTJB0y8bBBlFRWAK/8n478eFlEaxWq1FhGdwhKE/0LypW+
	 HC1sLm1gQ1zg7pkhflngUOLKlr8rbiWOaDDlfLTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0ECEF8011C;
	Fri,  9 Sep 2022 10:18:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11FE9F8023A; Fri,  9 Sep 2022 10:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9352AF8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 10:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9352AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hlmGvOHw"
Received: by mail-lj1-x22f.google.com with SMTP id p5so901701ljc.13
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 01:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=1Xxb1gbsxOZhm11k1w2e0SYXylK0kiiXO8W2BjXma0A=;
 b=hlmGvOHwjwkeI5xXvI6LKsUi3EIgIAak8gh0BBf1X80ZbsiaqJDJ13KpOzEX5NR64Z
 E8bEH5NduK3Z/BVSmwPPpGdScOgUb/lc731/tWs03chcRZjI54IkuX+PXoJE5YuOawgO
 gjo0VJLTK6BWKEogHuEdZzQamMy+I0C4Ep6aqf2UtH3BuDYvBYG255h4tCv+39NFitYd
 QpkTv4ZWHTMVOeJHjIYSNFxErB1j2ZmnyUjdkm1z4UhfkzKGJqkmOHYsiz5G+eWwXAsH
 CWUugyCOJP891pqNuUQ5h+zvUc2ieVSyibYvEyAzLsZFF5IY2EOKBZjPUF5HPoo7oxUJ
 lfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1Xxb1gbsxOZhm11k1w2e0SYXylK0kiiXO8W2BjXma0A=;
 b=O0bALr41u+3L129UFaFYLcEkv1rojFLGHeVpRt4ebvJ3LF/WDF+s0hME2JMcnlXQvs
 gC3+Yr5jBFa3jsomKe+R3JUSv7ugo53ND5dwmsuhR6lhyL+gdqN2ij2eh92cIgTT06rt
 FxX1ptOiELqzygKB/b88o317/QorkouU44oWZSRAYaxijCRjVIXHCfI9ZJ7NYNMiENcH
 ao57dJ/M8LMSvM4BaGroeYwN5x8Fzg3lPQnT3ZoYKI17SrNMjC1jx7SK/2wsR/FXMU+/
 V2B1UtVsYXjI9iquw0aEFQBmMy/LwIWYPXeuJ5Juh5gUlBQCG7NzG7bKTszNoq9/jwaw
 MWTg==
X-Gm-Message-State: ACgBeo3o30DyLZNxd9JlPyoT5EVC0TMj01SOtYGVE3SoeaShHqtAiU0i
 o8CNysaytDxooiW7E6K0MBX2iXdkre7HS9xvJqM=
X-Google-Smtp-Source: AA6agR5748beTDTt/05DXlmb7O+iEhiybzEq1atQtNenM1uGKfvdxRrAXSyEbRk9lUy18kXVXnrYYKKKdtBNpBk+0mo=
X-Received: by 2002:a05:651c:23a2:b0:26b:dce9:3410 with SMTP id
 bk34-20020a05651c23a200b0026bdce93410mr1711504ljb.392.1662711477226; Fri, 09
 Sep 2022 01:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220908133319.2149486-1-robert.rosengren@axis.com>
In-Reply-To: <20220908133319.2149486-1-robert.rosengren@axis.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 9 Sep 2022 16:17:45 +0800
Message-ID: <CAA+D8AOj4J8RcojJGK+hC0YphVSO+SpbYJkDmG9P75ecjrGK-Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: add ALSA event on dpll locked
To: robert.rosengren@axis.com
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 kernel@axis.com, Fabio Estevam <festevam@gmail.com>
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

Hi

On Thu, Sep 8, 2022 at 9:33 PM <robert.rosengren@axis.com> wrote:

> From: Robert Rosengren <robert.rosengren@axis.com>
>
> Add an ALSA event on the RX Sample Rate controller upon the dpll locked
> interrupt, making it possible for audio applications to monitor changes
> in the hardware.
>
> Signed-off-by: Robert Rosengren <robert.rosengren@axis.com>
> ---
>  sound/soc/fsl/fsl_spdif.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
> index 7fc1c96929bb..1679a21ffdca 100644
> --- a/sound/soc/fsl/fsl_spdif.c
> +++ b/sound/soc/fsl/fsl_spdif.c
> @@ -44,6 +44,8 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3,
> 0x4, 0xa, 0xb };
>
>  #define DEFAULT_RXCLK_SRC      1
>
> +#define RX_SAMPLE_RATE_KCONTROL "RX Sample Rate"
> +
>  /**
>   * struct fsl_spdif_soc_data: soc specific data
>   *
> @@ -122,6 +124,7 @@ struct fsl_spdif_priv {
>         const struct fsl_spdif_soc_data *soc;
>         struct spdif_mixer_control fsl_spdif_control;
>         struct snd_soc_dai_driver cpu_dai_drv;
> +       struct snd_soc_dai *dai;
>         struct platform_device *pdev;
>         struct regmap *regmap;
>         bool dpll_locked;
> @@ -223,9 +226,19 @@ static void spdif_irq_dpll_lock(struct fsl_spdif_priv
> *spdif_priv)
>         locked &= SRPC_DPLL_LOCKED;
>
>         dev_dbg(&pdev->dev, "isr: Rx dpll %s \n",
> -                       locked ? "locked" : "loss lock");
> +               locked ? "locked" : "loss lock");
>
>         spdif_priv->dpll_locked = locked ? true : false;
> +
> +       if (spdif_priv->dai) {
> +               struct snd_soc_component *component =
> spdif_priv->dai->component;
> +               struct snd_kcontrol *kctl =
> snd_soc_card_get_kcontrol(component->card,
> +                                               RX_SAMPLE_RATE_KCONTROL);
>

Alignment should match open parenthesis


> +
> +               if (kctl)
> +                       snd_ctl_notify(component->card->snd_card,
> +                               SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
>
Alignment should match open parenthesis

Best regards
Wang shengjiu

> +       }
>  }
>
>  /* Receiver found illegal symbol interrupt handler */
> @@ -1197,7 +1210,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
>         /* DPLL lock info get controller */
>         {
>                 .iface = SNDRV_CTL_ELEM_IFACE_PCM,
> -               .name = "RX Sample Rate",
> +               .name = RX_SAMPLE_RATE_KCONTROL,
>                 .access = SNDRV_CTL_ELEM_ACCESS_READ |
>                         SNDRV_CTL_ELEM_ACCESS_VOLATILE,
>                 .info = fsl_spdif_rxrate_info,
> @@ -1241,6 +1254,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls_rcm[]
> = {
>  static int fsl_spdif_dai_probe(struct snd_soc_dai *dai)
>  {
>         struct fsl_spdif_priv *spdif_private =
> snd_soc_dai_get_drvdata(dai);
> +       spdif_private->dai = dai;
>
>         snd_soc_dai_init_dma_data(dai, &spdif_private->dma_params_tx,
>                                   &spdif_private->dma_params_rx);
> --
> 2.30.2
>
>
