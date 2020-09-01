Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29525895D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 09:38:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22CB16DE;
	Tue,  1 Sep 2020 09:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22CB16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598945915;
	bh=4eIxQuHjLz+GHdbgbz0T5lXxDXAql12r5cIdu2J6wEQ=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0OGbeXq7Nhb0aGf+Q8lWU1CYC0+/cpJUvr2CgxeQjXjmw2A0/bsM/Zs2Nzt8ga+N
	 P4DLb5n0Dnde7/6sMVR9KK7xjpsac6sB8bgaGQeXIfL6JffC6dSMnWO0L52QUFa18M
	 5yaFO/CwJVZIUG3TlpLaEfP2RbHerAycxGt+ZrgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CFF7F801DA;
	Tue,  1 Sep 2020 09:36:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C73DAF80217; Tue,  1 Sep 2020 09:36:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B08B0F801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 09:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B08B0F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VnhVnWJC"
Received: by mail-pg1-x542.google.com with SMTP id 67so226867pgd.12
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 00:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=kB+SZnK0sJkXPueegsNdekLuZ/MjR9UpX90Irxxyzvk=;
 b=VnhVnWJCP27/mVmO155ONgdwRlS85VvnyJzWOT7jautIZGGqr3zliTS6J4SRsFI+3J
 sd+uwQ245EwDzVeb0Roq/gsPN09BWfu7bIcGYX+BrByvVqXdEJWtwtySa9erBzpCTdZ0
 4tIvtJ+5bT84mJLGYgPCLNPN5qHhTgNOwLOnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=kB+SZnK0sJkXPueegsNdekLuZ/MjR9UpX90Irxxyzvk=;
 b=dc5PE9GhaLzt/fNBa3SFzn7sFicoM0JM8XuWnRDENwvr8CVve0lv3nJ/jhBL3wiNno
 vwmisGFgbedqLpylhvMJMpY1G4WQtNueT+el4vzu2/KytBPcVR7WViQMbhGHTLXB+Bof
 3qfGdxOO7gduom1NRusPKMPg9ltNgP9MzJSeq0WfLqLY3rcQ0SmaFJ700L2Pfl1dL2SS
 0X2CBTfNyLZgvuHZJ9O3S5Oku1bDxkl0TmDCA54TOHia5N6EAhXhbvaHWko4EtzFzaz9
 AHO7XAOOi66DlB4x/VkQPgMadBPJ0BqXWd70GVPtoRickWXT7D9Uj/RziaeByycZJ8WQ
 UPOQ==
X-Gm-Message-State: AOAM530BuPtZd3rsLn6YogbTaULuU6m+laUMpVzaaBAP1I3N43PJEVOM
 jb0tXhGM4OVA33vveEA8/UapfQ==
X-Google-Smtp-Source: ABdhPJzi+NLQOZhIdhFlcTmDLitfZg6ADPeHNPuMjIk1v4PT7eu3PAfHn2YnOHJeIOK0+6SWgm123g==
X-Received: by 2002:a63:cd57:: with SMTP id a23mr438823pgj.10.1598945796121;
 Tue, 01 Sep 2020 00:36:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e124sm692938pfa.87.2020.09.01.00.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 00:36:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
From: Stephen Boyd <swboyd@chromium.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
Date: Tue, 01 Sep 2020 00:36:34 -0700
Message-ID: <159894579447.334488.1604209140945740724@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>
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

Quoting Srinivasa Rao Mandadapu (2020-08-30 23:39:22)
> diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
> new file mode 100644
> index 0000000..7e18113
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-hdmi.c
> @@ -0,0 +1,684 @@
> +// SPDX-License-Identifier: GPL-2.0-only
[...]
> +
> +static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substre=
am,
> +               struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
[...]
> +       data_format =3D LPASS_DATA_FORMAT_LINEAR;
> +       ch_sts_buf0 =3D (((data_format << LPASS_DATA_FORMAT_SHIFT) & LPAS=
S_DATA_FORMAT_MASK)
> +                               | ((sampling_freq << LPASS_FREQ_BIT_SHIFT=
) & LPASS_FREQ_BIT_MASK));
> +       ch_sts_buf1 =3D (word_length) & LPASS_WORDLENGTH_MASK;
> +
> +       ret =3D regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_=
CTL_RESET);
> +       if (ret) {
> +               dev_err(dai->dev, "%s error writing to softreset enable :=
 %d\n",

All of these strings bloat the kernel image. Can we just return ret
instead and if something goes wrong we can use a debug patch to figure
out which register write failed? Would a register write even fail to
begin with?

> +                                       __func__, ret);
> +               return ret;
> +       }
> +
> +       ret =3D regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_=
CTL_CLEAR);
> +       if (ret) {
> +               dev_err(dai->dev, "%s error writing to softreset disable =
: %d\n",
> +                                       __func__, ret);
> +               return ret;
> +       }
> +
> +       ret =3D regmap_field_write(drvdata->legacy->legacy_en,
> +                               LPASS_HDMITX_LEGACY_DISABLE);
> +       if (ret) {
> +               dev_err(dai->dev, "%s error writing to legacy_en field : =
%d\n",
> +                                       __func__, ret);
> +               return ret;
> +       }
> +
[...]
>  #define LPAIF_DMACTL_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, CTL)
>  #define LPAIF_DMABASE_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, BA=
SE)
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platf=
orm.c
> index df692ed..607f4c4 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -553,7 +702,21 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq,=
 void *data)
> =20
>         /* Handle per channel interrupts */
>         for (chan =3D 0; chan < LPASS_MAX_DMA_CHANNELS; chan++) {
> -               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->substream[chan=
]) {
> +               switch (v->id) {
> +               case HDMI_INTERFACE:
> +                       val =3D LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
> +                               LPAIF_IRQ_HDMI_METADONE |
> +                               LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan);
> +                       break;
> +               case I2S_INTERFACE:
> +                       val =3D 0;
> +                       break;
> +               default:
> +                       pr_err("%s: invalid  %d interface\n", __func__, v=
->id);

Any reason we can't use dev_err() here?

> +                       return -EINVAL;
> +               }
> +               if (irqs & (LPAIF_IRQ_ALL(chan) | val)
> +                       && drvdata->substream[chan]) {
>                         rv =3D lpass_dma_interrupt_handler(
>                                                 drvdata->substream[chan],
>                                                 drvdata, chan, irqs);
> @@ -644,15 +807,15 @@ int asoc_qcom_lpass_platform_register(struct platfo=
rm_device *pdev)
> =20
>         /* ensure audio hardware is disabled */
>         ret =3D regmap_write(drvdata->lpaif_map,
> -                       LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0);
> +                       IRQ_EN(v, LPAIF_IRQ_PORT_HOST), 0);
>         if (ret) {
>                 dev_err(&pdev->dev, "error writing to irqen reg: %d\n", r=
et);
>                 return ret;
>         }
> =20
>         ret =3D devm_request_irq(&pdev->dev, drvdata->lpaif_irq,
> -                       lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,
> -                       "lpass-irq-lpaif", drvdata);
> +               lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,

Can we use the irq flags from the firmware, i.e. whatever the DT or ACPI
tables say?

> +               pdev->name, drvdata);
>         if (ret) {
>                 dev_err(&pdev->dev, "irq request failed: %d\n", ret);
>                 return ret;
