Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AB24F755B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 07:31:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E6F31742;
	Thu,  7 Apr 2022 07:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E6F31742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649309507;
	bh=XAHCVLdFoFWUzc+t6WrmgqUjks9g6fXSKy4glXRK/fY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPRHFt/+cOgL61RKLZW/FDBrdryWw3bm15CArkmVxlVZx8WpBbmLGiYzRKuTruljT
	 iiA2zngHrfs/aouMRW+dr0/6T9Ij+CjkLdv7yDvC4ngf7J8al28MW5TvSFzo1moUtj
	 8wdk/XZXW2wNfSI1Wbzpwt+hpq2LaAPqmaB3JyUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F574F8026A;
	Thu,  7 Apr 2022 07:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 847EFF80085; Thu,  7 Apr 2022 07:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3056AF80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 07:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3056AF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ElmHq4BG"
Received: by mail-qt1-x82a.google.com with SMTP id v2so7305713qtc.5
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 22:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OsrIF8kArDfjOd9UQuRZYcqMIJXIewgTUvGFPKdebO0=;
 b=ElmHq4BGqTFD0Oj/YOlbFZqfnqFOBQpAlUxC5QaIce8mvaR5455+Hsh1lks8zatqmz
 iJDcaKcePrxPVh0/hir3dMcufOstZYKCI+3GuS+Gj6VRKGTEIEtWhqI6OnCUqOVEbutZ
 escnGiPJiTluaIkPO9MGeZPUyPI/WWZt5/6cpEyIt92tlyrBcn0EviKmLJtboD1xCuV2
 XUKOaNXnIK6uxUdcTpyOma8Lrt7Xz/7/oY7thg5mx2PosoNX9ePy1yUsYcYuaOsyVquB
 nRjD75NA2vnTA16Gnq9likq7ynAU+saNFuWm3y61IrbEk30HetpOJ8NYpFHxqZn7g0t/
 FLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsrIF8kArDfjOd9UQuRZYcqMIJXIewgTUvGFPKdebO0=;
 b=lT1y99Mj4WyvfrEdaJkzoV0guVDpEQhXj8GE5Kdlu99iSAKblq2N849ycvIY2Ra6xX
 qD+oK8r8O+Vs36X13R3NJHmlZf7dZfIrOuZfiiIH70w1cRMqoJBmVU0NJlOzu0HqzDWQ
 ZFK4Tmyc+Uk4J+3CHKe/Oexw5qlgZmVZCBKi+2esnrB+g6mrl7Dljw92JjnT8de00rg3
 WCr5OVvYNrppK35gVQVoITT/yZGL+4AGlOKEEA6EOLPUaDuciuAPWrvIeTwr2eoXpdDC
 D3BIFW+1HH0l3ePvfl5GaCaLIb7JLAxJeLQ7IlF4eN+zfZOJMvE/DrecOe0XZ1WHM+t6
 A1hQ==
X-Gm-Message-State: AOAM5318Ar70iTiAPNuSM7t2bLs599zBWGwIgL1oMqCoFZfKALgMmPHc
 RT0XdEmKDzrl55PpiyNa9tWSnzpm6YPOY8+fJZc=
X-Google-Smtp-Source: ABdhPJyPUnHLpxMda5uxd6bMyWkY4EQmsaYwAdinTHmUT9yu1745gFvUNVbr3oX2XG+y2Pu+ziCxEMVCHdZ+tGTdv1Q=
X-Received: by 2002:a05:622a:1990:b0:2e1:a7bf:9222 with SMTP id
 u16-20020a05622a199000b002e1a7bf9222mr10464430qtc.230.1649309438549; Wed, 06
 Apr 2022 22:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-20-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-20-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Apr 2022 13:30:27 +0800
Message-ID: <CAA+D8APN2KMRmfNjhZrUc=6wYXjQ3h0-tKw3DGGPE=6Tqj79OA@mail.gmail.com>
Subject: Re: [PATCH v3 19/20] ASoC: fsl_micfil: drop support for undocumented
 property
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

> The "fsl,shared-interrupt" property is undocumented and unnecessary.
> Just pass IRQF_SHARED unconditionally.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index f536ea2db89db..99c256f46f38e 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -553,7 +553,6 @@ static int fsl_micfil_probe(struct platform_device
> *pdev)
>         struct resource *res;
>         void __iomem *regs;
>         int ret, i;
> -       unsigned long irqflag = 0;
>
>         micfil = devm_kzalloc(&pdev->dev, sizeof(*micfil), GFP_KERNEL);
>         if (!micfil)
> @@ -617,12 +616,9 @@ static int fsl_micfil_probe(struct platform_device
> *pdev)
>                         return micfil->irq[i];
>         }
>
> -       if (of_property_read_bool(np, "fsl,shared-interrupt"))
> -               irqflag = IRQF_SHARED;
> -
>         /* Digital Microphone interface interrupt */
>         ret = devm_request_irq(&pdev->dev, micfil->irq[0],
> -                              micfil_isr, irqflag,
> +                              micfil_isr, IRQF_SHARED,
>                                micfil->name, micfil);
>         if (ret) {
>                 dev_err(&pdev->dev, "failed to claim mic interface irq
> %u\n",
> @@ -632,7 +628,7 @@ static int fsl_micfil_probe(struct platform_device
> *pdev)
>
>         /* Digital Microphone interface error interrupt */
>         ret = devm_request_irq(&pdev->dev, micfil->irq[1],
> -                              micfil_err_isr, irqflag,
> +                              micfil_err_isr, IRQF_SHARED,
>                                micfil->name, micfil);
>         if (ret) {
>                 dev_err(&pdev->dev, "failed to claim mic interface error
> irq %u\n",
> --
> 2.30.2
>
>
