Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0DC53E001
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 05:19:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA568112;
	Mon,  6 Jun 2022 05:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA568112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654485577;
	bh=TgM0Fiob9GEotlNK6TPEvQqfkyZ2IzjPVRb92mCH/n0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qe6ymBShXwYW4tWxJji/yfoWwTCGtuTNLIqgVtFF7pPhyVk2PXafmQ64tXpIgVAQN
	 iK8VP+ahj/TA4lthnlJSEz6j/6cVYSaltkYp0M8zmnvMqMSjVrWe5fYYF+PaAGd//L
	 nerkPw5g3g9BvgeO+0JbFSEpMZaFJeZ1THVerU4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60823F80089;
	Mon,  6 Jun 2022 05:18:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9AF4F801D8; Mon,  6 Jun 2022 05:18:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B4D9F80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 05:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B4D9F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Jsu9VIl9"
Received: by mail-lf1-x131.google.com with SMTP id t25so21288258lfg.7
 for <alsa-devel@alsa-project.org>; Sun, 05 Jun 2022 20:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xYV/s+XdTrp51h0m3iHkp7+B6YHRFew7BBznSGqnGvQ=;
 b=Jsu9VIl92GVcM25IcagXtGSOCYPSusp7itsUDAkRl6aeBbieiL+gW/oljIEKQ99RnU
 Tu+1SOz+IIwZNTQnwlrvJpXfZiBpblQpujdLhrsA5/gRyNpZoWc+R532G/BBKYZvdwVA
 4zCE2zuysY7lbCYI05nW+DEWuDzL2cR+2kJL/Srwv0GodRiWACOZf7qEsIfyvubbBiw9
 wGQytoGras9/aA6jPq7FfKWPM+qXWtUQX0zRbdIKuYx7LPwJ8vMCuKranL35jlHVSfT1
 QmKWGgksRzTuGFjwbnRIcruQMjvZrAEfyYIxVaF136QmVkMWoWAMMIKd9OioeeESeeUW
 mOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xYV/s+XdTrp51h0m3iHkp7+B6YHRFew7BBznSGqnGvQ=;
 b=fXfuQZIopyZ5Vp/fcsrnaiMN0MEQkp4eP2qbb+p8N/U2+WKRpLS7vcs3GYu/h6DnV6
 yIbp34UodhG4thu2zOTOgAuCZELpPgTxUaTvbjPyvl4tL0Yi2+hwNYr5Ee4tXvKDyg6I
 qHm0sMMN+8p83dQ/VUImeSu0CsDQEcAmiAwmMOdK6sx31D+Sq1m/7qzwmeGlmbLYYPz+
 GtIOAJfu9MZtmwK18oNF0tLvep6MJ35mBpvXAZXiR1NJOrwZqxrqB1EB/XIFD0tgvklU
 LxT7I60+b54ROG1GNjA+tayij+U4NcPT3anALqiJr8oW3AE7rMhifriLSahruVjPhtuD
 MiGQ==
X-Gm-Message-State: AOAM530fcC4h3Q1GQTno5AoeuJUYtWFpn/typtMBxI5LO8Ff63ZOVuxn
 lOFEivAJj64UCRvVi1VCgb6lx9oA4Roe/psPGBIbDBX3gp0=
X-Google-Smtp-Source: ABdhPJwYqXK4EOPtozSFEpBjVxSmfarI1fmQMyKnBROF0i/rAwAZ7QEn0uVIVjCSFi17v2PFRnTPZbNG7I3rbncxQ8o=
X-Received: by 2002:a05:6512:3e25:b0:478:fd30:7b7c with SMTP id
 i37-20020a0565123e2500b00478fd307b7cmr19488016lfv.285.1654485507911; Sun, 05
 Jun 2022 20:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220601092342.3328644-1-m.felsch@pengutronix.de>
In-Reply-To: <20220601092342.3328644-1-m.felsch@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 11:18:16 +0800
Message-ID: <CAA+D8ANDU0bb-u5Tvg+Sad3Y-MW32eysXThOLmYRNwiZXN3OeA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_sai: use local device pointer
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

> Use a local variable to dereference the device pointer once and use the
> local variable in further calls. No functional changes.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 53 +++++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 26 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index fa950dde5310..a7637d602f3c 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1004,6 +1004,7 @@ static int fsl_sai_runtime_resume(struct device
> *dev);
>  static int fsl_sai_probe(struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
> +       struct device *dev = &pdev->dev;
>         struct fsl_sai *sai;
>         struct regmap *gpr;
>         struct resource *res;
> @@ -1012,12 +1013,12 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         int irq, ret, i;
>         int index;
>
> -       sai = devm_kzalloc(&pdev->dev, sizeof(*sai), GFP_KERNEL);
> +       sai = devm_kzalloc(dev, sizeof(*sai), GFP_KERNEL);
>         if (!sai)
>                 return -ENOMEM;
>
>         sai->pdev = pdev;
> -       sai->soc_data = of_device_get_match_data(&pdev->dev);
> +       sai->soc_data = of_device_get_match_data(dev);
>
>         sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
>
> @@ -1032,18 +1033,18 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                         ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);
>         }
>
> -       sai->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> &fsl_sai_regmap_config);
> +       sai->regmap = devm_regmap_init_mmio(dev, base,
> &fsl_sai_regmap_config);
>         if (IS_ERR(sai->regmap)) {
> -               dev_err(&pdev->dev, "regmap init failed\n");
> +               dev_err(dev, "regmap init failed\n");
>                 return PTR_ERR(sai->regmap);
>         }
>
> -       sai->bus_clk = devm_clk_get(&pdev->dev, "bus");
> +       sai->bus_clk = devm_clk_get(dev, "bus");
>         /* Compatible with old DTB cases */
>         if (IS_ERR(sai->bus_clk) && PTR_ERR(sai->bus_clk) != -EPROBE_DEFER)
> -               sai->bus_clk = devm_clk_get(&pdev->dev, "sai");
> +               sai->bus_clk = devm_clk_get(dev, "sai");
>         if (IS_ERR(sai->bus_clk)) {
> -               dev_err(&pdev->dev, "failed to get bus clock: %ld\n",
> +               dev_err(dev, "failed to get bus clock: %ld\n",
>                                 PTR_ERR(sai->bus_clk));
>                 /* -EPROBE_DEFER */
>                 return PTR_ERR(sai->bus_clk);
> @@ -1051,9 +1052,9 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>
>         for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
>                 sprintf(tmp, "mclk%d", i);
> -               sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
> +               sai->mclk_clk[i] = devm_clk_get(dev, tmp);
>                 if (IS_ERR(sai->mclk_clk[i])) {
> -                       dev_err(&pdev->dev, "failed to get mclk%d clock:
> %ld\n",
> +                       dev_err(dev, "failed to get mclk%d clock: %ld\n",
>                                         i + 1, PTR_ERR(sai->mclk_clk[i]));
>                         sai->mclk_clk[i] = NULL;
>                 }
> @@ -1068,10 +1069,10 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (irq < 0)
>                 return irq;
>
> -       ret = devm_request_irq(&pdev->dev, irq, fsl_sai_isr, IRQF_SHARED,
> +       ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
>                                np->name, sai);
>         if (ret) {
> -               dev_err(&pdev->dev, "failed to claim irq %u\n", irq);
> +               dev_err(dev, "failed to claim irq %u\n", irq);
>                 return ret;
>         }
>
> @@ -1088,7 +1089,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (of_find_property(np, "fsl,sai-synchronous-rx", NULL) &&
>             of_find_property(np, "fsl,sai-asynchronous", NULL)) {
>                 /* error out if both synchronous and asynchronous are
> present */
> -               dev_err(&pdev->dev, "invalid binding for synchronous
> mode\n");
> +               dev_err(dev, "invalid binding for synchronous mode\n");
>                 return -EINVAL;
>         }
>
> @@ -1109,7 +1110,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>             of_device_is_compatible(np, "fsl,imx6ul-sai")) {
>                 gpr =
> syscon_regmap_lookup_by_compatible("fsl,imx6ul-iomuxc-gpr");
>                 if (IS_ERR(gpr)) {
> -                       dev_err(&pdev->dev, "cannot find iomuxc
> registers\n");
> +                       dev_err(dev, "cannot find iomuxc registers\n");
>                         return PTR_ERR(gpr);
>                 }
>
> @@ -1127,23 +1128,23 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
>
>         platform_set_drvdata(pdev, sai);
> -       pm_runtime_enable(&pdev->dev);
> -       if (!pm_runtime_enabled(&pdev->dev)) {
> -               ret = fsl_sai_runtime_resume(&pdev->dev);
> +       pm_runtime_enable(dev);
> +       if (!pm_runtime_enabled(dev)) {
> +               ret = fsl_sai_runtime_resume(dev);
>                 if (ret)
>                         goto err_pm_disable;
>         }
>
> -       ret = pm_runtime_get_sync(&pdev->dev);
> +       ret = pm_runtime_get_sync(dev);
>         if (ret < 0) {
> -               pm_runtime_put_noidle(&pdev->dev);
> +               pm_runtime_put_noidle(dev);
>                 goto err_pm_get_sync;
>         }
>
>         /* Get sai version */
> -       ret = fsl_sai_check_version(&pdev->dev);
> +       ret = fsl_sai_check_version(dev);
>         if (ret < 0)
> -               dev_warn(&pdev->dev, "Error reading SAI version: %d\n",
> ret);
> +               dev_warn(dev, "Error reading SAI version: %d\n", ret);
>
>         /* Select MCLK direction */
>         if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
> @@ -1152,7 +1153,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                                    FSL_SAI_MCTL_MCLK_EN,
> FSL_SAI_MCTL_MCLK_EN);
>         }
>
> -       ret = pm_runtime_put_sync(&pdev->dev);
> +       ret = pm_runtime_put_sync(dev);
>         if (ret < 0)
>                 goto err_pm_get_sync;
>
> @@ -1165,12 +1166,12 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                 if (ret)
>                         goto err_pm_get_sync;
>         } else {
> -               ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +               ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
>                 if (ret)
>                         goto err_pm_get_sync;
>         }
>
> -       ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
> +       ret = devm_snd_soc_register_component(dev, &fsl_component,
>                                               &sai->cpu_dai_drv, 1);
>         if (ret)
>                 goto err_pm_get_sync;
> @@ -1178,10 +1179,10 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         return ret;
>
>  err_pm_get_sync:
> -       if (!pm_runtime_status_suspended(&pdev->dev))
> -               fsl_sai_runtime_suspend(&pdev->dev);
> +       if (!pm_runtime_status_suspended(dev))
> +               fsl_sai_runtime_suspend(dev);
>  err_pm_disable:
> -       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_disable(dev);
>
>         return ret;
>  }
> --
> 2.30.2
>
>
