Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2045F89A2
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 08:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB5E1163A;
	Sun,  9 Oct 2022 08:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB5E1163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665296337;
	bh=LnCGJ4ltSqcQH3ZzknXve0w96Y4Gd/FTxP4pXpAnmQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k60BKwXv2J2UhtjdKrXzQrgjVdq0li6dC22sl6Rdw8dwPhy6hZsAUIv3peNKMC2YU
	 IyFJCzC2MucEl97prGkrnrj+DYVlTlCwU9g7OUWVgCC9+wbhZRfo17OQnga0VRGu3P
	 uhNBP7qve1HnXyVP9OTyhPh1jMEsMFsSfUTFORAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34199F800B8;
	Sun,  9 Oct 2022 08:18:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DE35F80517; Sun,  9 Oct 2022 08:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E33BDF800B8
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 08:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E33BDF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D7NYE0Hx"
Received: by mail-lj1-x22f.google.com with SMTP id bn8so10035061ljb.6
 for <alsa-devel@alsa-project.org>; Sat, 08 Oct 2022 23:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=12EYphgmnc/c7perX/VmCZNpBq64skd06e0y/NyYIGQ=;
 b=D7NYE0HxNeaTJ3C4FEym0Oi06jTlJG16omPqXDDBjdsVdj6Dw/mPKt+IrY/SmYKqx5
 e9dutjn+2h2Tj95yF3R5BBWULdHH57mCDCTruPjXS23Qx3YLDt40YFUKR9IiC60mJvhb
 Lnx7xkXdIzpwwKBDysF7a3eAQDRm1ZWI9Czq9CFWeSLKtjIxyUn+6/F+gj+azlXmN+JU
 Iv2dAuXkok0HwGvxO2qBD+wOBk4FZdXjZiXccZFZ4GPFNGX0pLVNSrSMNVz1it4HbGGB
 VTEQ8KynIg0qUEiq69pvNYkd2aLhn5QuhI4+i+abhOtEKTKqlF15hO5g6JA0WWcYDi+N
 dgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=12EYphgmnc/c7perX/VmCZNpBq64skd06e0y/NyYIGQ=;
 b=8GjwqoV7qDgci5mTBhmAqi/qE1fHi9H0/X4ee2Usc1r4dJlYKJbJQqBJr4YD9Ny640
 nWq3puJh9WKjeYRjKx3zCj1xt2iGfYldXa3wYQb2VhO+HjiMsjhxvukGVCnrzt7NQ+mh
 DMxUNklIaVZYlPeHQp3Bdo4dr11h7RcL187icVmVMWj5TlhuKjXezUpfGtlpeji2XOfH
 2ExwQ2nzsr6ExGYNReLp9iiFqYA2x1bipAySJi7fI5XT2qND8A1SKtQ5g0KNAZZ/japX
 gMWyXt+N31hcxq7WfA4yHGDU3qQ273sWkOVuALFiT9o8SgjwChtsi2CISfAdEkFP7V/J
 GDYw==
X-Gm-Message-State: ACrzQf2EPoB8majoiePkIUGVD1MTUai+cpm//G4y99bLpYQzTPgV72XM
 jdffb9I0aEUU23KYXC+u8EyvLA1Gzxu2PZYhALw=
X-Google-Smtp-Source: AMsMyM6z+kNTipjJsXuIHvVzJX3b+5dvY9KhlpsXlaOwLiyi202BpzJkcxa6eDCYr5XZfUGya4f2/oskmkRhS80CQq0=
X-Received: by 2002:a2e:a7c3:0:b0:26e:8dd3:5e41 with SMTP id
 x3-20020a2ea7c3000000b0026e8dd35e41mr2153667ljp.392.1665296271640; Sat, 08
 Oct 2022 23:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
 <20220930064441.2548505-4-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-4-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:17:40 +0800
Message-ID: <CAA+D8AP4X-K2jhkcP-FnO5pHKpB7cY8bESo_zT82eAXLFU+mKA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: imx-pcm-rpmsg: Register different platform
 drivers
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 festevam@gmail.com
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

On Fri, Sep 30, 2022 at 2:46 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> This patch can register different ASoC platform drivers if there are
> several rpmsg channels. Thus sound cards based on different rpmsg
> channels can link to their respective platform drivers. Besides, the
> name of driver is equal to the name of rpmsg channel.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
> index 35049043e532..3157cd5a837e 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -684,7 +684,7 @@ static int imx_rpmsg_pcm_probe(struct platform_device
> *pdev)
>         info->rpdev = container_of(pdev->dev.parent, struct rpmsg_device,
> dev);
>         info->dev = &pdev->dev;
>         /* Setup work queue */
> -       info->rpmsg_wq = alloc_ordered_workqueue("rpmsg_audio",
> +       info->rpmsg_wq = alloc_ordered_workqueue(info->rpdev->id.name,
>                                                  WQ_HIGHPRI |
>                                                  WQ_UNBOUND |
>                                                  WQ_FREEZABLE);
> @@ -723,11 +723,15 @@ static int imx_rpmsg_pcm_probe(struct
> platform_device *pdev)
>         if (ret)
>                 goto fail;
>
> -       component = snd_soc_lookup_component(&pdev->dev, IMX_PCM_DRV_NAME);
> +       component = snd_soc_lookup_component(&pdev->dev, NULL);
>         if (!component) {
>                 ret = -EINVAL;
>                 goto fail;
>         }
> +
> +       /* platform component name is used by machine driver to link with
> */
> +       component->name = info->rpdev->id.name;
> +
>  #ifdef CONFIG_DEBUG_FS
>         component->debugfs_prefix = "rpmsg";
>  #endif
> --
> 2.25.1
>
>
