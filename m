Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7B24F8F4C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CDCB18C0;
	Fri,  8 Apr 2022 09:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CDCB18C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649402048;
	bh=S9EN8iNK/qI9SS87jjQONxWRA5NPH25Ip3+HbHGcEG8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XkoNXr+ddBd0GLmw8PDISBuB6K5TKTzZ3bibalbkLur/S2pRU+Flac7P8LepaSZOF
	 Pz+IXk7ESNr0qUCnvXDw8fvuh6wpX707ODoM3RnbLj+o9CxROOFcm8Le+7Cgr2/+rj
	 JsYtX8NPKesH+YKhO9TvBaCembPfvHT1RAjpjJfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D39F80311;
	Fri,  8 Apr 2022 09:13:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D97EF8014E; Fri,  8 Apr 2022 09:13:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75591F80116
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 09:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75591F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lztsFSx0"
Received: by mail-qk1-x736.google.com with SMTP id e10so2521598qka.6
 for <alsa-devel@alsa-project.org>; Fri, 08 Apr 2022 00:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kdIgFHb5fDnL/dToN8kTlN0Z73b5bs87ZtK7LnFHQXs=;
 b=lztsFSx0UKH/UWf+nkNDtqVn1wcRazfAmipZV7GPb+veJ2bStT+tPf+RZj/da/+smh
 Yhl1izt1M9dHhnpdlVdNogkvnifhgEbgaruM/xwx0wU0j7KcOViffFnS2o1u4l3lz1+U
 WnarDgl6tpnXQRoQNGa5y9cRt/fALKRt6f0f/502L9KjxqDxCvtEXfbiM9g1XVNSOzY5
 D+Jof/sE0n3baI9xR24ImbGpqyM8ew+q+EPCI1+He+PMAL4zAvh/IFhNM9VQKFRaT2gD
 Q0xonAmusIePlYR6STwaVFLz8jF3ffD1FKMbR+MIrI6LjNNMaOhZDx8ooRygE6UXv3DA
 EtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kdIgFHb5fDnL/dToN8kTlN0Z73b5bs87ZtK7LnFHQXs=;
 b=KtuxUG53kLnQaqyDcVy8txs+ixu2mrildYUpcYyz6zPLKmueaynbmNFpw0zsGGAUnZ
 dzfg9oqDCU2T0ZtDpMtH2JKSz1G6+AyMQSw6z2wgP+sqCHgIjYdHNbZkX/Lv7yxiLNxu
 Jz/279iHjL5j0OZTATOddGEeew23Zm/yrdyMCTYJYngmxhuJZ9tRkervDxM2oMVONexv
 5KT878xq4P0fsrYcDfFwU8sLv9HRbN7Rrun4UkDogYjtCbw5rmqyfuFNH/L+UYt5SWeD
 tYYAZRwETPDJW6NxtYvfx4YW8pOFiJQnNJTU7SaqCwP95Tvlxc7AMsrKHP2aswFq9ffZ
 f8SA==
X-Gm-Message-State: AOAM533LdMgBVZf6HDGYWo+7rv8CtAd3POODH19TFQov/QtUbj3XH13w
 eeT3g43XwlQc5eAlBmDTqaH36v1Ra4NaJaxEmtA=
X-Google-Smtp-Source: ABdhPJxD/M1VAWXSaCut41+el0yPthdOQukDjO2lZdEsBG2KRwAFzox62ggsZJuq2wMjVwbU0z4wf9zXrJ1oQNZnKTE=
X-Received: by 2002:a05:620a:254f:b0:680:f510:22e4 with SMTP id
 s15-20020a05620a254f00b00680f51022e4mr11829557qko.554.1649401977952; Fri, 08
 Apr 2022 00:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
 <20220407084936.223075-22-s.hauer@pengutronix.de>
In-Reply-To: <20220407084936.223075-22-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Apr 2022 15:12:47 +0800
Message-ID: <CAA+D8ANYahhyqZCgSb4wAKMUQBBQSdy78sxrWbHO3PRaTD-saw@mail.gmail.com>
Subject: Re: [PATCH v4 21/21] ASoC: fsl_micfil: Remove debug message
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

On Thu, Apr 7, 2022 at 4:49 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> The micfil driver prints out the IRQ numbers for each interrupt at error
> level. This information is useful for debugging at best, remove it.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang shengjiu

> ---
>
> Notes:
>     Changes since v3:
>     - new patch
>
>  sound/soc/fsl/fsl_micfil.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 8f0ab61fd1b07..be669523a4bf7 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -597,7 +597,6 @@ static int fsl_micfil_probe(struct platform_device
> *pdev)
>         /* get IRQs */
>         for (i = 0; i < MICFIL_IRQ_LINES; i++) {
>                 micfil->irq[i] = platform_get_irq(pdev, i);
> -               dev_err(&pdev->dev, "GET IRQ: %d\n", micfil->irq[i]);
>                 if (micfil->irq[i] < 0)
>                         return micfil->irq[i];
>         }
> --
> 2.30.2
>
>
