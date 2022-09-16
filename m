Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED76D5BA788
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 09:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E52D18BE;
	Fri, 16 Sep 2022 09:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E52D18BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663313735;
	bh=r1xFM1d/VeuoVrYAkhaYwWHAPHd3oQFEMpELTmAkdWQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lWh36MfSMBpopvwwwROuR7VCDvkLIlcGOzicdgH4zSTAFNvGEvFxzHPUmSXkocho6
	 NYIrTw/JxExs9fSkE3xiuD2xEh5In0mMNTTZo50Fm0dEpF2ugkeNBBGIX+F75dL/ei
	 n1rBAqV2bBKOLO+pm0n5loFi801BPhGcFtZ4X4uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3550F8024C;
	Fri, 16 Sep 2022 09:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02370F8019B; Fri, 16 Sep 2022 09:34:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71D28F800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 09:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71D28F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CMkJB63C"
Received: by mail-lj1-x235.google.com with SMTP id s10so24365974ljp.5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 00:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=+KrZs1wDWxExKhVZuq9VbQB8vAEX+/GO+05kcKZyQkQ=;
 b=CMkJB63CW8UfY9qgxsBCcLpm8kJ1TYuhg5CCoqrPM2zsjhyMqhHGi0A+V+ztyCBu9V
 eIBaavcXsgyES6UdCHSRnhaXl2Iwr7aARBQv0HbmVQCXDVhEQSUnB/3DeSLDAqLBzKCt
 rKX9fvsx+CXyDiKiDcTX+ph0VMUVrGgPWemMIK+sxA/a9XZrZRVnbCtaqtU7YFhMLS89
 ZwycqWZQkTriCPz78PA49vUGoaTZrjQ+BMlnJE6tOybdTJubNqtW4yQs7Sy2jczIRyhv
 5gopPleF0gDXeQ7jgpc+/LWN6TKJLPIijQmsUKQf8t9i0X5RDgXWhhAmwbQv6RgfTKvC
 3MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+KrZs1wDWxExKhVZuq9VbQB8vAEX+/GO+05kcKZyQkQ=;
 b=wZOB1lOp5zjyERPI+uxKBrhOn/pyHpSHcQDSkbn/hFaZ4mJ8/GGqmiyF4tJj0ckaeE
 NR+gAPk/z2SuZ57BtzMNjzn68nJuqTc6ZefL2n8g5a3tJpx7Jzalh1ZC0f34ZS2X5i58
 r3BID0AT+jSNa8SBMrznVe6MYW1utlskYmFfp6J7mRdG/kvhw/N/TcspT9zoIrIHWU+U
 TugkUefKKAova9lB1MDmzXRx12+FibV9SeGYdGaH5GhexGA6lSH5HoMxJenBd2a+1Npe
 WP9Fcnfnbw3wGo5sgna8oCgS0DUjAMm4oxtlh84lD/sdelmalrthXHc32rBkGwZJ49mx
 CSFQ==
X-Gm-Message-State: ACrzQf2MPXlYOzjLh/YHwEzFqOo2w6qlPf16+XUuMusZHH0QXC8yaUAT
 28ExDI0D/429sNMAexC8SBvKHy0fDiCd92SM6/c=
X-Google-Smtp-Source: AMsMyM5xmNtG+JOChSzzfIaBx7tOwvOjB7OS4BES0ZusTkDZKwvkz3EEXpM1JsmQf/ndqcljaGgjTKxj7QyVjTp6efc=
X-Received: by 2002:a2e:960e:0:b0:26b:e5ae:cd78 with SMTP id
 v14-20020a2e960e000000b0026be5aecd78mr1026093ljh.129.1663313667324; Fri, 16
 Sep 2022 00:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220912105407.3157868-1-robert.rosengren@axis.com>
In-Reply-To: <20220912105407.3157868-1-robert.rosengren@axis.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 16 Sep 2022 15:34:15 +0800
Message-ID: <CAA+D8AN1-ReuEaQFiJbsUnPo-3eXa2p-rUW7B=tQHesmUEdtSQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_spdif: add ALSA event on dpll locked
To: Robert Rosengren <robert.rosengren@axis.com>
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

On Mon, Sep 12, 2022 at 6:54 PM Robert Rosengren <robert.rosengren@axis.com>
wrote:

> Add an ALSA event on the RX Sample Rate controller upon the dpll locked
> interrupt, making it possible for audio applications to monitor changes
> in the hardware.
>
> Signed-off-by: Robert Rosengren <robert.rosengren@axis.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>
> Notes:
>     v2: Cache RX Sample Rate kcontrol to avoid lookup in interrupt.
>     Properly add description to fsl_spdif_priv.
>     Fix indentation.
>
>  sound/soc/fsl/fsl_spdif.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
> index 7fc1c96929bb..275aba8e0c46 100644
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
> @@ -98,6 +100,8 @@ struct spdif_mixer_control {
>   * @soc: SPDIF soc data
>   * @fsl_spdif_control: SPDIF control data
>   * @cpu_dai_drv: cpu dai driver
> + * @snd_card: sound card pointer
> + * @rxrate_kcontrol: kcontrol for RX Sample Rate
>   * @pdev: platform device pointer
>   * @regmap: regmap handler
>   * @dpll_locked: dpll lock flag
> @@ -122,6 +126,8 @@ struct fsl_spdif_priv {
>         const struct fsl_spdif_soc_data *soc;
>         struct spdif_mixer_control fsl_spdif_control;
>         struct snd_soc_dai_driver cpu_dai_drv;
> +       struct snd_card *snd_card;
> +       struct snd_kcontrol *rxrate_kcontrol;
>         struct platform_device *pdev;
>         struct regmap *regmap;
>         bool dpll_locked;
> @@ -226,6 +232,12 @@ static void spdif_irq_dpll_lock(struct fsl_spdif_priv
> *spdif_priv)
>                         locked ? "locked" : "loss lock");
>
>         spdif_priv->dpll_locked = locked ? true : false;
> +
> +       if (spdif_priv->snd_card && spdif_priv->rxrate_kcontrol) {
> +               snd_ctl_notify(spdif_priv->snd_card,
> +                              SNDRV_CTL_EVENT_MASK_VALUE,
> +                              &spdif_priv->rxrate_kcontrol->id);
> +       }
>  }
>
>  /* Receiver found illegal symbol interrupt handler */
> @@ -1197,7 +1209,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
>         /* DPLL lock info get controller */
>         {
>                 .iface = SNDRV_CTL_ELEM_IFACE_PCM,
> -               .name = "RX Sample Rate",
> +               .name = RX_SAMPLE_RATE_KCONTROL,
>                 .access = SNDRV_CTL_ELEM_ACCESS_READ |
>                         SNDRV_CTL_ELEM_ACCESS_VOLATILE,
>                 .info = fsl_spdif_rxrate_info,
> @@ -1251,6 +1263,13 @@ static int fsl_spdif_dai_probe(struct snd_soc_dai
> *dai)
>                 snd_soc_add_dai_controls(dai, fsl_spdif_ctrls_rcm,
>                                          ARRAY_SIZE(fsl_spdif_ctrls_rcm));
>
> +       spdif_private->snd_card = dai->component->card->snd_card;
> +       spdif_private->rxrate_kcontrol =
> snd_soc_card_get_kcontrol(dai->component->card,
> +
> RX_SAMPLE_RATE_KCONTROL);
> +       if (!spdif_private->rxrate_kcontrol)
> +               dev_err(&spdif_private->pdev->dev, "failed to get %s
> kcontrol\n",
> +                       RX_SAMPLE_RATE_KCONTROL);
> +
>         /*Clear the val bit for Tx*/
>         regmap_update_bits(spdif_private->regmap, REG_SPDIF_SCR,
>                            SCR_VAL_MASK, SCR_VAL_CLEAR);
> --
> 2.30.2
>
>
