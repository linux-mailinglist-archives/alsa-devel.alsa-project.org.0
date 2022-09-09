Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D35B31A6
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 10:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD1B8166A;
	Fri,  9 Sep 2022 10:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD1B8166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662712053;
	bh=JrcGYz+axk4mtw3hCvQkjGT/F2NTmj9KdKAVx55zTdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=guXi/4dCKvYEusrIrqqBWAvKL8oQY2E0IKBVIJQxwfYNV013Psvbi0nFsCYJCoI4c
	 r9+s6d9x0A9tcr4cin0yDG7GoP8Ff5kWFrJmPd83OPX68iM3Dyh6WXBXFwD1uscFyP
	 RqaIUw3G5Sxi6yDJWr1/7Vkfo5YmH1mhu5/0NEfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F1A5F8011C;
	Fri,  9 Sep 2022 10:26:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D6E9F8011C; Fri,  9 Sep 2022 10:26:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7977F8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 10:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7977F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bvfo+ZGX"
Received: by mail-lj1-x234.google.com with SMTP id y29so943316ljq.7
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 01:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=TPQei23rVbLf3lVUxKJtGINOs8Ry8xm60ljb9OaQAoA=;
 b=bvfo+ZGXadGigvwlf7iGYkSzxUGafJGyHqw+vYoNBOKdNos7sKlQDwiC+oSA9iwySz
 Z11ZC6R4/sdq5NLYgZIhDP7E9KQ5IWnG72qQVG82G/7nH0Ie5kO6qdKLIRBZqxVhY/vA
 68tdTmYh1aZ6TJj+jte4u9nU9K6Fwzacr7U7Ftgr4HtwMSClX5brB6uBk2JDN3bdVzgX
 BHCToUSSM6Pr9nUlS+5qRcFzRjJsPHhGp1vbuipaAE0zOifDydSdB7eZ2JPt65EpEzoy
 swtR7wTJeBqiUvumxpgj4H8UIeR1PZfiVioqrdRPjU0F7pn6u3WzWKX3dZhRlJYMODTO
 TbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=TPQei23rVbLf3lVUxKJtGINOs8Ry8xm60ljb9OaQAoA=;
 b=P8PZEBmkYZZ+mAs/QwWmcIczPTkVp28ZuRstQNO2QJNfCMCUbvcVlwi6b6F4XDOJI4
 NloRzg/XtF5zx9MGdtTFqtzdU5dhBFNaKirhwtiueTYmlfwRQb5csljSr9aUSakYtGJM
 KIqgHMcH1vYcdSA7ddBv9F7+rhx8632VeNR3Dg5XZ3LEA5txjzcMFhaceYVJshB3D/4n
 MlzFitSYlLwMY8OvfUY0EKrdYnj3FFP8kkYlEyiPot0uZ2pHWzNFVxXAmIhU/GV4uMtY
 zNLnLIIGd7wGvI+yALGx629c5Tx/ULNKWcEc2yMRcoTG6eNvMaZQb7GU8HXpMcIciMR8
 EsDg==
X-Gm-Message-State: ACgBeo1YfT1BrjoXlKRwbxAITEjZ39POPfwb8j2QlkaZd1tX2FiRw6+p
 AJouVXMyVb0lJNkhKFWhNYKA34dD3NjL4+KUtDE=
X-Google-Smtp-Source: AA6agR6sceNaRuwVk3Q3/uIi9DbiISa9CB+jljqrPnnNSXps6sxylloUEBrjhu/MBsKAgHp4PGXgYWgKIRe7aawX5EA=
X-Received: by 2002:a2e:3002:0:b0:26a:b199:46df with SMTP id
 w2-20020a2e3002000000b0026ab19946dfmr3350605ljw.304.1662711983984; Fri, 09
 Sep 2022 01:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220908133319.2149486-1-robert.rosengren@axis.com>
In-Reply-To: <20220908133319.2149486-1-robert.rosengren@axis.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 9 Sep 2022 16:26:12 +0800
Message-ID: <CAA+D8AOeSM4W1nS=oaWfFzYRqzgERh7_-sdh3wj+7iZthYm9Eg@mail.gmail.com>
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
>

warning: Function parameter or member 'dai' not described in
'fsl_spdif_priv'
please add.

Best regards
Wang shengjiu

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
> +
> +               if (kctl)
> +                       snd_ctl_notify(component->card->snd_card,
> +                               SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
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
