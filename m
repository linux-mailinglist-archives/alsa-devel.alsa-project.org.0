Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5453DFD4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 04:49:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB001865;
	Mon,  6 Jun 2022 04:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB001865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654483780;
	bh=ezfIsHfQ2+mtvAp+FAYPUU5UYyRsQZxnxxCIx099qic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s2crLFIYP93i9jUurgRE6/tqekQ+9wWkrfLDjK1GglBwpkLJ/nzjxvSNDteqyT50A
	 ZlR6Tpund8IrlhxWUWO4CRmGg8cWDE3N/FJQvA6Vr3VwC04gNtk3w3PkOpM/iY+OFG
	 3ER10i2RF7inGNREfx0t06XtyuSXIfPCrOSOzKUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7700BF80109;
	Mon,  6 Jun 2022 04:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6484F801D8; Mon,  6 Jun 2022 04:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F8A8F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 04:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F8A8F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YxK8uSmp"
Received: by mail-lf1-x12f.google.com with SMTP id be31so21248080lfb.10
 for <alsa-devel@alsa-project.org>; Sun, 05 Jun 2022 19:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sv6oZK17zG5gvA5QEnVohTQARmrTfyrgFMPCXyJ6Nxc=;
 b=YxK8uSmp4knvlPLa1cmR9hlwFc95gbYXpVzlMto5nfIcsC3ZLT0aP1aQPf5uv+moXg
 tWnfGqKYNy1Qr3ZFAy7KEFRkZ50DGvFameg0CeUDWckVcZkU9tV4DxLrjS9XehN50swp
 HhP3FOlgxpoFah4fMB9z+pg4iYNY2i3dnLOVxfqxyHLetCeMYMKOyWqK0z474Cc9ZNj9
 w13cN6ZEIrEK1biiTr9DvWz7mRvCRNxRsQmiFF50w6PzHLalu6y+NPNEbUNT4Ng9y3js
 RqXYg8O43eqRLDmwobIRlJfxHIThWRqndXOThQzJ9yoNie6KDPszi4nfrFjjyDNc0hOB
 yBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sv6oZK17zG5gvA5QEnVohTQARmrTfyrgFMPCXyJ6Nxc=;
 b=N1srIA8WNNMUdh7Au7zXIZgk5u9qlFW7TiDtwVomyfe4SQPraV9X8KcYnybu7TKGDR
 9bHiGbo51ygqgGpa2IhWpFu7QRgO5Do6kHB6cM6P/PaqEhb7BBQwLR485iTFiNeiXw0z
 OP/qILmSrAYufo743Qhc7mOf7ZECtGRmLCpqFBWzVFLp0Z7lWF15/4QNE/YYWL85mOx/
 eVAoo6V10SaIcOMtMxqsIjihyLLQ31BN1Yeith1mYXAl8LhdBaB+p80h4ww64nowIFpr
 siUOTTG/urInziG10ZBGJMR7tJIRiurltlfdZwVD7/sh+ugTxkdGsKTbLZ785NzEkC+i
 +lng==
X-Gm-Message-State: AOAM533HAcCTLUqrtFLruEdtdsY0I6J2plJEdfNSi6dBp59YTdqnslRj
 8JcoRsU+09XaOOP6uk5K2l0+QYTz4xbZ2z3D/yQ=
X-Google-Smtp-Source: ABdhPJxguDa9DnaYK7r4Z2SKweViulzegbAUrScOFa7SaHNHi81lzmI5LDHNMrkF0P8kmDDqES8dZzNdIH7nlCCSkng=
X-Received: by 2002:a05:6512:3e25:b0:478:fd30:7b7c with SMTP id
 i37-20020a0565123e2500b00478fd307b7cmr19433458lfv.285.1654483710697; Sun, 05
 Jun 2022 19:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220601092342.3328644-1-m.felsch@pengutronix.de>
 <20220601092342.3328644-2-m.felsch@pengutronix.de>
In-Reply-To: <20220601092342.3328644-2-m.felsch@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 10:48:19 +0800
Message-ID: <CAA+D8AMKt8SH2M_zd-6dYBAb2X=3X1p5V=yW72bXohjBCBh9wg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_sai: convert to dev_err_probe
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

> Make use of the new macro to get device defered information for free
> and to cleanup the code a bit. No functional changes.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  sound/soc/fsl/fsl_sai.c | 33 +++++++++++----------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index a7637d602f3c..3e54f1f71c1e 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1034,21 +1034,15 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         }
>
>         sai->regmap = devm_regmap_init_mmio(dev, base,
> &fsl_sai_regmap_config);
> -       if (IS_ERR(sai->regmap)) {
> -               dev_err(dev, "regmap init failed\n");
> -               return PTR_ERR(sai->regmap);
> -       }
> +       if (IS_ERR(sai->regmap))
> +               return dev_err_probe(dev, PTR_ERR(sai->regmap), "regmap
> init failed\n");
>
>         sai->bus_clk = devm_clk_get(dev, "bus");
>         /* Compatible with old DTB cases */
>         if (IS_ERR(sai->bus_clk) && PTR_ERR(sai->bus_clk) != -EPROBE_DEFER)
>                 sai->bus_clk = devm_clk_get(dev, "sai");
> -       if (IS_ERR(sai->bus_clk)) {
> -               dev_err(dev, "failed to get bus clock: %ld\n",
> -                               PTR_ERR(sai->bus_clk));
> -               /* -EPROBE_DEFER */
> -               return PTR_ERR(sai->bus_clk);
> -       }
> +       if (IS_ERR(sai->bus_clk))
> +               return dev_err_probe(dev, PTR_ERR(sai->bus_clk), "failed
> to get bus clock\n");
>
>         for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
>                 sprintf(tmp, "mclk%d", i);
> @@ -1067,14 +1061,12 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>
>         irq = platform_get_irq(pdev, 0);
>         if (irq < 0)
> -               return irq;
> +               return dev_err_probe(dev, irq, "failed to get the irq\n");
>

This change is not needed,  platform_get_irq() has done the same operation.

best regards
wang shengjiu

>
>         ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
>                                np->name, sai);
> -       if (ret) {
> -               dev_err(dev, "failed to claim irq %u\n", irq);
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to claim irq %u\n",
> irq);
>
>         memcpy(&sai->cpu_dai_drv, &fsl_sai_dai_template,
>                sizeof(fsl_sai_dai_template));
> @@ -1089,8 +1081,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (of_find_property(np, "fsl,sai-synchronous-rx", NULL) &&
>             of_find_property(np, "fsl,sai-asynchronous", NULL)) {
>                 /* error out if both synchronous and asynchronous are
> present */
> -               dev_err(dev, "invalid binding for synchronous mode\n");
> -               return -EINVAL;
> +               return dev_err_probe(dev, -EINVAL, "invalid binding for
> synchronous mode\n");
>         }
>
>         if (of_find_property(np, "fsl,sai-synchronous-rx", NULL)) {
> @@ -1109,14 +1100,12 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
>             of_device_is_compatible(np, "fsl,imx6ul-sai")) {
>                 gpr =
> syscon_regmap_lookup_by_compatible("fsl,imx6ul-iomuxc-gpr");
> -               if (IS_ERR(gpr)) {
> -                       dev_err(dev, "cannot find iomuxc registers\n");
> -                       return PTR_ERR(gpr);
> -               }
> +               if (IS_ERR(gpr))
> +                       return dev_err_probe(dev, PTR_ERR(gpr), "cannot
> find iomuxc registers\n");
>
>                 index = of_alias_get_id(np, "sai");
>                 if (index < 0)
> -                       return index;
> +                       return dev_err_probe(dev, index, "cannot find sai
> aliases\n");
>
>                 regmap_update_bits(gpr, IOMUXC_GPR1, MCLK_DIR(index),
>                                    MCLK_DIR(index));
> --
> 2.30.2
>
>
