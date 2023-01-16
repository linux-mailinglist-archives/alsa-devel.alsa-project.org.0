Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB33766BA51
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 10:28:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5785E52D0;
	Mon, 16 Jan 2023 10:27:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5785E52D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673861310;
	bh=lcP6+GvmVwUfIEpEX7py58UX/kfyE/OlTEdxu2G2nyk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DUZqb2Ag6u6rUn1+AO4bty4Q2vVqKEZy/SQR2RpIIAIM7rgbnHCNSO7XJM10dPeHh
	 sX1cP1yRSVzbN6kVV1XYUK4XJcCO9WF8WWRXtUy8yVMAhSbF1L3zxg5OHkQx8g3nHB
	 6ioY+6pd9ev/f2Q16KI+zAWLJVPKm8Rk7CIh6pLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2607EF80083;
	Mon, 16 Jan 2023 10:27:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFF2EF8023A; Mon, 16 Jan 2023 10:27:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57771F8023A
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 10:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57771F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MkrUq/l0
Received: by mail-wr1-x436.google.com with SMTP id n7so757085wrx.5
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 01:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0fL8mB8BX2m52K+g0Xkw42Va6IJ7ZctxrJQvVmh1JjM=;
 b=MkrUq/l0saEo60AwJwUf8AHcJO2+n7qw1aAtp0ay/z2nKCLd5VhDAeYTSFUgRv9o5B
 uzCORI8EFl7SWYjqOigPPztXVdVlErhh5xzm9fUef5x2hIGGYoAfw8VPsoDCS3p9LYGi
 2VshFzZX5G1QAnRO+oXmfzt7urXykg9EA2L1zHguXkIh7sVAIdAIA3vtpvssyct97Drx
 48aX9eGRE46Za0eVHRexeHbcfyidQjhzCXwoPP8HTTYziVZE1YL+c1EGrgS7lqKIsveg
 9W+XNwCLPTIxS3CTIH3AIWAblcSh1jSWsigsdQ2snyMV1POH6W2d1G9NvaK8Fg8Gya4/
 S7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0fL8mB8BX2m52K+g0Xkw42Va6IJ7ZctxrJQvVmh1JjM=;
 b=8R/lDoKptaRtHcvzLdECXlWJEPE0SENP6RBL3a5GPzW0EQQeIQ328Ll5cZ2fSueqQS
 ETZQrVy6uJGFptlpaZZL2E2nG6gAYB+5ThzluhUnAlGcqcKHNJG3ofKGYV70A0scx5qI
 o862bgQ23yIBWbsW3ER9tNeLXEHgZfi/j8PQv3p6BEFedXWzSi1NLW/KY6l9c5l/Rmoq
 KVf7d5P/YJw9H1SxC6J/x8Ax0wKH9l7LDm8awvLmFOp9+ke/qhX/tI1Lmfph4DLCcLpS
 l5TWTRs3WdqizGrmZK0EF/m6W6Hx5li9Ujwq7OsLmH5dAGfrRpCAwJiDfgSyKhXZoemF
 W+WQ==
X-Gm-Message-State: AFqh2kpayEoHifJtSzyycKKi0PHxV0V3mLTZjnzh4ju+NsAL/2i5TIjT
 C7YdJ1/6MXPH0hVBYvkhYwDAXzicswNtkKajC1A=
X-Google-Smtp-Source: AMrXdXv1QR3rYL6snx9Uz4+SyO4G6+WLnL97LJ5sRt4kAn1kG/TmNeOUM2MQyhhSRXdr5ezBsE9bux8r91Zp37q7klA=
X-Received: by 2002:adf:e702:0:b0:2bb:e8d1:f660 with SMTP id
 c2-20020adfe702000000b002bbe8d1f660mr1004342wrm.167.1673861250625; Mon, 16
 Jan 2023 01:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20230111161144.3275546-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230111161144.3275546-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 16 Jan 2023 17:27:19 +0800
Message-ID: <CAA+D8AMfNe9wJm9oYhKkOHEqKcCWU2gTKaSAtPNUnHgg00r0UQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_sai: Use dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 12, 2023 at 12:11 AM Alexander Stein <
alexander.stein@ew.tq-group.com> wrote:

> This helps figuring out why the device probe is deferred, e.g. missing
> FSL_EDMA driver.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
> Old:
> root@ls1021:~# cat /sys/kernel/debug/devices_deferred
> sound   fsl-asoc-card: snd_soc_register_card failed: -517
> 2b50000.sai
>
> New:
> root@ls1021:~# cat /sys/kernel/debug/devices_deferred
> sound   fsl-asoc-card: snd_soc_register_card failed: -517
> 2b50000.sai     fsl-sai: Registering PCM dmaengine failed
>
>  sound/soc/fsl/fsl_sai.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 1c9be8a5dcb13..2a38e2bdf9893 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1458,14 +1458,17 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (sai->soc_data->use_imx_pcm) {
>                 ret = imx_pcm_dma_init(pdev);
>                 if (ret) {
> +                       dev_err_probe(dev, ret, "PCM DMA init failed\n");
>                         if (!IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA))
>                                 dev_err(dev, "Error: You must enable the
> imx-pcm-dma support!\n");
>                         goto err_pm_get_sync;
>                 }
>         } else {
>                 ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
> -               if (ret)
> +               if (ret) {
> +                       dev_err_probe(dev, ret, "Registering PCM dmaengine
> failed\n");
>                         goto err_pm_get_sync;
> +               }
>         }
>
>         ret = devm_snd_soc_register_component(dev, &fsl_component,
> --
> 2.34.1
>
>
