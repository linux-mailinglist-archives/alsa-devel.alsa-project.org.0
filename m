Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C26664F8D45
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 07:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F56B18BC;
	Fri,  8 Apr 2022 07:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F56B18BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649395382;
	bh=Y5pv8+7ikNfTIXLZAqGMEW3iSKcbdVZYBTiAlpVt048=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NsCWPI8vNgRUxrmEJ/B55BViUi4QVswRQRkKZ6hbSksL9po/Cf5oUlgDowDUdTWox
	 Kl0j7ucD8zNfBiFKQewhxzOQ0eb3CX8G2npEDxsnsaI1WqLeS4JKSMEq/c7fllBDyI
	 hr4fb3lJw7tvEzz8ZQfP5+5aruuqJtkmPGoe4DJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6569F80311;
	Fri,  8 Apr 2022 07:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27743F80054; Fri,  8 Apr 2022 07:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 929ABF80116
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 07:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 929ABF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="moVOEtYQ"
Received: by mail-qk1-x72d.google.com with SMTP id g11so2909913qke.1
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 22:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sYfQrPlhLET9K9SvOt5kEjocjbrXnvlOh/+z1rrjrS4=;
 b=moVOEtYQFLoRUnSiCubV74bLiht9ogEiuN4mxXlRc4Sog9hYTQ08qkOBgEB+blH0PR
 3/tU0f4IcnaCBiO0w6KW+wLnTPz6W6QdjJbO99HSD3nhQKfNJysl8l4zO42gPEQxJd+c
 D0Uyl28IYSjNzhgLJif8JVmFh8aeirevGPvIgCQYOs3sKH0pzaa0oAVGAZEWCHAM/zeP
 VsK2K4WgkFLJF/11uiwLr2gbeE7ShVPInlECFOen8nrBmyESZEMYK/PC7x10smztJD7L
 yvVc3t/8K2WC2Z9eXgAilGkPHitQbUtnT7XZ1TqncmY2Ju3NcoJrCuc22bjzZnIfRRsq
 z1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYfQrPlhLET9K9SvOt5kEjocjbrXnvlOh/+z1rrjrS4=;
 b=aGG8UNabyyptSktC8fam3d5Tfy/xKBQzPl9+v2PlgDMf3IbYzr5VQ0tyXmRlOWFNFg
 e069Fic49GrP9YQb5PLuLj0oKwWastltUj9cJFx5WmWpcDekQtHiddvxlicpjxrKqTSN
 yiJh5Jq98f5Z46CUVfvgvVr0r0oGve7bZhAva8LNExj323ZNQ4S9GueYDqVPV+eDMS6l
 8kjpZsBMkKi9gbDJuVnZClFXFlT2PkVlIO0o0KYjEydQc8xB+JMFxrE91jCe1UA8SjGC
 zmUlfYhc5gcZqNzBqGo6gAhtTNyyxksdfZI4MGcxfB/sRDZqmcw63P0XMjtr2uckiVFd
 2YIQ==
X-Gm-Message-State: AOAM533jsVB/qe9YxT+iQCNTwBrtrRVEIk4Q081ySc13bwRbtT6p7tXR
 T+kZHP5RfiQmxfA1otzmuIlLCTHUn4hFtpmWi/Q=
X-Google-Smtp-Source: ABdhPJyl36VQvkEgxmxm4fsD+7rBtB4JX93JirXFg8Hbpsi5weJGYH5dT9gy8yyjKfwwImerZZQXfd7LcaMjfnipCCM=
X-Received: by 2002:a05:620a:4592:b0:67d:8ed9:8c37 with SMTP id
 bp18-20020a05620a459200b0067d8ed98c37mr11854001qkb.150.1649395312839; Thu, 07
 Apr 2022 22:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
 <20220407084936.223075-22-s.hauer@pengutronix.de>
In-Reply-To: <20220407084936.223075-22-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Apr 2022 13:21:41 +0800
Message-ID: <CAA+D8AMyvOpy9x0sAok6z=wRVhTScJ0xeFOHuCHK_fEWzxYwbA@mail.gmail.com>
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
>

dev_err to dev_dbg, is it better?


>                 if (micfil->irq[i] < 0)
>                         return micfil->irq[i];
>         }
> --
> 2.30.2
>
>
