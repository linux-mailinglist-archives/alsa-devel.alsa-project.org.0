Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADC06BE16
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 16:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A8A167B;
	Wed, 17 Jul 2019 16:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A8A167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563373107;
	bh=P1kPQaWqMVzBzeDlGhvAzBQj1ZowoEOflJtRcMpDFQM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UdZHOZCocyCbJPe4zIIxQ9TNkpQL5A2Q8FsNkyphO5J8L9BX/pQrpKbYvP0TnAcWB
	 mYv8XjEz9Dka/NW5gYw4ZcRFtgWYmYbz/ftYfLbCmUtgW58Q+5ILSCIK8kKg5cmtZx
	 cI9PJ8v6NdtGTABEc7FeSVTEWpK51FZvbz1cVx3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93970F800C4;
	Wed, 17 Jul 2019 16:16:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B562AF80363; Wed, 17 Jul 2019 16:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C90E7F800C4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 16:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C90E7F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MSqynF88"
Received: by mail-wr1-x444.google.com with SMTP id c2so21819277wrm.8
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZZcVxXdCKPNPl6+lggmT8DR0YSM2gxFTtIZwcqwnGP8=;
 b=MSqynF8857YSedcDHHa+UztsOW+1jKfIgBIK9j2PvnsMujQ3XAObmFVAaMY+yKONaD
 TjQhHhgWy6KcVvU2LyRyicXS3eCDJCfXQQ90+4bPc6YTu9e+V3Reti4WcJKZ5yPOTzLN
 R6vLXgufTHVDpZWk2ABVF8A0Zg7f1BPoZlM49+KOv5M4bWlOD/OeJgsLlZJuArz44E4h
 jcwbK9dWanUuneYP8ApKv/5RIoiqm6gu89xGFwOSYZYGOZp8QeaBp3g0DNPWa0akEuXM
 mvUyegjBgXW1IGWbSkI5yJBfJdzZbwvfyps4f0/iUnc6WB0LSh6/ZxgyS6wKY60tVUBv
 DxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZZcVxXdCKPNPl6+lggmT8DR0YSM2gxFTtIZwcqwnGP8=;
 b=m6q4URc8WtFemb/MU0/XPNQ2tAj4kryMhCDkb/HBu+ai1hTYxZwaBQ6uDG2+OPYeND
 +0Wqy+lCbFH2NoqGXfDw7qTW+n/sqCZxpwT2T1u5DKaWNQcNEFnffVp8JjfPa4zefYgu
 DDCMVpBhJzJhV0x9DSb74+oPk9t0rUqBafwmLMat8frCbZTOLOAMHRyQDZRjZ2sWsLvK
 fEGdcJbU6ym6cHbBJI/QkQ01wGuV3Z0zNgzwve3D+JDBx1gW9jQc4q/DWbg5IldWB+A/
 lk2jU690NUDNp91383wSUosrCcPFfFmHXHBALCqN0sTPcTOOsloxlhOAIzVjEDQU9NvS
 UqPw==
X-Gm-Message-State: APjAAAUDzYXpCGKu4o1oWs+N+qMsIF0LaDwwIzwI7CQNP/OvrYA9avtf
 asXicwqWeo3CASaeAOCoPNieZlprvVhkAwlxPY0=
X-Google-Smtp-Source: APXvYqwxU74fVFPXhObESTwLbcf7FMLDJyKCP+iXlJ/CMc412opePg6obyNiU88ZavVI15si7msp/W32peucL4NCgHE=
X-Received: by 2002:a05:6000:14b:: with SMTP id
 r11mr43812681wrx.196.1563372996848; 
 Wed, 17 Jul 2019 07:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
In-Reply-To: <20190717105635.18514-4-l.stach@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 17 Jul 2019 17:16:25 +0300
Message-ID: <CAEnQRZCCTwMJKQnvP2mSQPcKNwtoAaMdXmQt_H+CGro=zVLsNA@mail.gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Angus Ainslie <angus@akkea.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, patchwork-lst@pengutronix.de,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 17, 2019 at 1:59 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> The SAI block on the i.MX8M moved the register layout, as 2 version
> registers were added at the start of the register map. We deal with
> this by moving the start of the regmap, so both register layouts
> look the same to accesses going through the regmap.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

This is a little bit tricky. We need the verid register in order
to differentiate IPs which can support 1:1 ratio for bclk:mclk

I am working now for upstreaming all SAI patches that we have
in our internal tree.

> ---
>  .../devicetree/bindings/sound/fsl-sai.txt     |  2 +-
>  sound/soc/fsl/fsl_sai.c                       | 19 +++++++++++++++++++
>  sound/soc/fsl/fsl_sai.h                       |  1 +
>  3 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index 2e726b983845..037871d2f505 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -8,7 +8,7 @@ codec/DSP interfaces.
>  Required properties:
>
>    - compatible         : Compatible list, contains "fsl,vf610-sai",
> -                         "fsl,imx6sx-sai" or "fsl,imx6ul-sai"
> +                         "fsl,imx6sx-sai", "fsl,imx6ul-sai" or "fsl,imx8mq-sai"
>
>    - reg                        : Offset and length of the register set for the device.
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index b3cd055a61c7..a10201078e40 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -808,6 +808,16 @@ static int fsl_sai_probe(struct platform_device *pdev)
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
>
> +       /*
> +        * New versions of the SAI have 2 32bit version registers added at the
> +        * start of the register map. To avoid dealing with this shift all over
> +        * the driver, we move the start of the regmap to make both register
> +        * layouts look the same to the regmap. This means we can't read the
> +        * version registers through the regmap, but this is small price to pay.
> +        */
> +       if (sai->soc_data->has_version_registers)
> +               base += 8;
> +
>         sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
>                         "bus", base, &fsl_sai_regmap_config);
>
> @@ -923,18 +933,27 @@ static int fsl_sai_remove(struct platform_device *pdev)
>
>  static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
>         .use_imx_pcm = false,
> +       .has_version_registers = false,
>         .fifo_depth = 32,
>  };
>
>  static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
>         .use_imx_pcm = true,
> +       .has_version_registers = false,
>         .fifo_depth = 32,
>  };
>
> +static const struct fsl_sai_soc_data fsl_sai_imx8m_data = {
> +       .use_imx_pcm = true,
> +       .has_version_registers = true,
> +       .fifo_depth = 128,
> +};
> +
>  static const struct of_device_id fsl_sai_ids[] = {
>         { .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
>         { .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
>         { .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
> +       { .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8m_data },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_sai_ids);
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 7c1ef671da28..b6a9053ed400 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -128,6 +128,7 @@
>
>  struct fsl_sai_soc_data {
>         bool use_imx_pcm;
> +       bool has_version_registers;
>         unsigned int fifo_depth;
>  };
>
> --
> 2.20.1
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
