Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EC253E002
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 05:21:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA7411694;
	Mon,  6 Jun 2022 05:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA7411694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654485697;
	bh=RBpziSqMp8jxASX12UM+2uQcA4RDfjJ7/V+f0J8j0Z0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bebOABgF7bERsIzEkXG5S6DoKLzLTm3TyHk5mp6BjEBKZhk42MyglqVRW/AId5A89
	 9oxS0Hq7hLo9KoPaETmrGb4rstNAAjDHT03RW4lUtQ6VqwrgFKwulYdyUayUKfGhrG
	 Cfr9eAtErvOEfTcQfMzaY8E/Htr5lOYB65HNxIlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70040F80310;
	Mon,  6 Jun 2022 05:20:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F9A4F801D8; Mon,  6 Jun 2022 05:20:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC76FF80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 05:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC76FF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Fop1j2gU"
Received: by mail-lf1-x12e.google.com with SMTP id i29so4549086lfp.3
 for <alsa-devel@alsa-project.org>; Sun, 05 Jun 2022 20:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JBBOhm/oySl2buTR87HVpULyvrffJzB9SuPNOzesUIk=;
 b=Fop1j2gUIvRQGO/VLsO1X+nPzEtD8XZPr1/5f8bzCpn9rIW75ux7KENBir8L7SNM4h
 xwrBMjvmeQA199O8iY7h6mg08LJc2HyLjWtQRiimpOmzht76OyoWv31diaUjx1XNeizd
 TE0MZz3gZIlhkoH6qC8aGb2xi07EbfaS1JGgD2kSRxXcoCo2g8ILwsOYpQwipbZ3eSkC
 L10zfxnM8QW2k1iIRHRr1vYMxVH2vOoBiIXhA0s5sIaHBC2nvddydx2za7zmiSODBaB7
 w7Qt7wuekuNTq7ZRjbb1zQ+HEDnS2nnKKDknpaY7G0Lp/vJrqQNwN5CLHPvp0n1e2SIj
 OqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JBBOhm/oySl2buTR87HVpULyvrffJzB9SuPNOzesUIk=;
 b=FPhSKI7TcVyS9nFM7bpGbpwkstK41cOeMTgX6VrsEJO4YVkbLZxdMqdMvWq7xokyfS
 8/o+//ikGRkTC06Ip/kTzKzounZbojPBgokNFW/vs+aPLayyzz1Oh3JAa5vDTJPG/hCU
 bAuDVtnD+H85XS7xIKt0/8hkubtRX4F1297cWq6WnFKK9TtTB8tQf4mgg4dRRwFfyE4C
 lNKzSnlUXBPG/JJ6aR6zfonUnYwybwbmtoSCjmHxhlQamB2uHnXrAZA7KwAPGjGFSU8V
 T1pRZXSB2otzTz55Y1lijN1xz4h/CX9N5zkFmfJA63uPeQfYGrpDe898k6+6fCxI6hkW
 fMvg==
X-Gm-Message-State: AOAM531fL88P0E2JXc7VJOQh0TxAP267I8V9cUXtrSN0y5aofb1U4KhH
 de7CS3k57pscjqZyehZFNrRxGvHsklG7FsdUMs4=
X-Google-Smtp-Source: ABdhPJyP6Fkw9PeAHNVSWk158HTkNrRp5yhF5FLfqD995zmg8kNq70vYnbiZhMkZ/nUeX90kYWBgB0eBPWA7vYBIAtc=
X-Received: by 2002:a05:6512:3e25:b0:478:fd30:7b7c with SMTP id
 i37-20020a0565123e2500b00478fd307b7cmr19491762lfv.285.1654485627593; Sun, 05
 Jun 2022 20:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220601092342.3328644-1-m.felsch@pengutronix.de>
 <20220601092342.3328644-3-m.felsch@pengutronix.de>
In-Reply-To: <20220601092342.3328644-3-m.felsch@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 11:20:16 +0800
Message-ID: <CAA+D8APDR7w3T5ek5q-mvNsrp-u7sAXCzdT+OCYEr7GkH3L2QA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_sai: add error message in case of missing
 imx-pcm-dma support
To: Marco Felsch <m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
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

On Wed, Jun 1, 2022 at 5:23 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> If the imx-pcm-dma is required we need to have the module enabled. For
> all NXP/FSL sound cards using the ASoC architecture this is the case but
> in case of using the simple-audio-card sound card this isn't the case.
>
> In such case the driver probe fails silently and the card isn't
> available. It took a while to find the missing Kconfig. Make this easier
> for others by printing a error if this the module isn't available but
> required by the HW.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 3e54f1f71c1e..2371da814b09 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1152,8 +1152,11 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>          */
>         if (sai->soc_data->use_imx_pcm) {
>                 ret = imx_pcm_dma_init(pdev);
> -               if (ret)
> +               if (ret) {
> +                       if (!IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA))
> +                               dev_err(dev, "Error: You must enable the
> imx-pcm-dma support!\n");
>                         goto err_pm_get_sync;
> +               }
>         } else {
>                 ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
>                 if (ret)
> --
> 2.30.2
>
>
