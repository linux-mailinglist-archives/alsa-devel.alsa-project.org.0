Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24AB300E09
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 21:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 413231F02;
	Fri, 22 Jan 2021 21:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 413231F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611348534;
	bh=kx+K2DPfFBpi019qO2j2MQ844/5zR1wNXxEW2GGsG2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hZJo+s2laVVKiweUEjyFoUFKmUjBlPEiNQcLQ7J9JzldHvX7ACIerA2vv4ASUJAVu
	 t9f/VjA5owk6n0JDBtSHdMdT5PTEogXsLA6nCtlRMVIK70j7TlaVSXq6y9VXpkfgGC
	 cHSNkmySfMbPvrS7fi7hKbjjLvG74Wv0s1DXoP2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A38DF8019B;
	Fri, 22 Jan 2021 21:47:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8062CF8016E; Fri, 22 Jan 2021 21:47:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95134F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 21:47:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95134F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k8jP/H3o"
Received: by mail-pl1-x633.google.com with SMTP id e9so3987687plh.3
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 12:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L8h5Iu+gZkxNGhNgn/qYvBSc7dFR+4ytSwJQwUWJ4jU=;
 b=k8jP/H3ouAaOUUYeRmqk4z4abKjDpdx/IlWlqcdjJkNZft8iZYj/nZyzGPz69pbBrD
 78RkJ3u6kItEsX35tmeo9pBU/9O8XTKGBEs3d5I5vKNc+LG05pU3ts9RLlGATSkRiezt
 egZfp0dtB3vov+4K26MIwJBkSZRVIt4iEi70iKQ+pb3MwZNwK05A/8FItQfWMCgaLLu0
 76yoy0zICwgm9C4BOzeSaOMc1Z0YYHlFcZ/AS42GDht47/nEz/LI7zC6OvGfEzizWNiy
 SDM7rOAFC00AFnBlU6OBur7+UNFcvXs6Xacr8ffPiAhZq2mNt1Ux+BQ9fxLsyTVOxv6Y
 sGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L8h5Iu+gZkxNGhNgn/qYvBSc7dFR+4ytSwJQwUWJ4jU=;
 b=ktVah+hHFGpUXB4iz73fwjcVB4BfTCgKpasnTzM363widTQIxkkH6+7F/y9yX6uqKv
 p4jkd9Y1S2bpIbaQ5RfEXmwhQmAd/IamDUeNiyGCUJ1W4D4sJAe52y9EUTp99ImhnDeK
 j6SnxB9na1FUWKUkDVKhBJWD2rK860VosULXFMbeJvcZT9pYUoAiCk5SQihezqGl0XTx
 hBnMa4hzso4twOIGy8C+1qez8uANmIG25AkFVDkwtif8LHgJHbvkNdDNo7FKIjTMPxax
 ZmA8wZASZs37I8OTcn8a6srD0IzUdBK9TkrdUtPSsnjU4hBfKw3bulr7wDZ8ZKXSHfcv
 syxQ==
X-Gm-Message-State: AOAM532MJQybea9RDH/k1VoL9kZnEYeTfAebXzUHkCvuH4c2Cw1GeRq4
 AUTKf4xL6z1OqpeK2/dqBol0p39tm/Bn2sLNgqU=
X-Google-Smtp-Source: ABdhPJyXsaYUWO5H2dYDOlbzftU0DnFFmDgsSxr7oNZoM0EcN0lMt8ZxVPXOhhC8p5XFzxJlDZqseYDZwvi5kD9wTQ4=
X-Received: by 2002:a17:902:7088:b029:df:cbdb:a0a6 with SMTP id
 z8-20020a1709027088b02900dfcbdba0a6mr1613682plk.17.1611348417233; Fri, 22 Jan
 2021 12:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20210122164107.361939-1-hdegoede@redhat.com>
 <20210122164107.361939-10-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-10-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Jan 2021 22:47:46 +0200
Message-ID: <CAHp75VebkLtRbdW_rkpF0yi3jHZFSGg15DPjuiFYq7AS=5WSpA@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] ASoC: arizona-jack: convert into a helper
 library for codec drivers
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On Fri, Jan 22, 2021 at 6:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Convert the arizona extcon driver into a helper library for direct use
> from the arizona codec-drivers, rather then being bound to a separate
> MFD cell.
>
> Note the probe (and remove) sequence is split into 2 parts:
>
> 1. The arizona_jack_codec_dev_probe() function inits a bunch of
> jack-detect specific variables in struct arizona_priv and tries to get
> a number of resources where getting them may fail with -EPROBE_DEFER.
>
> 2. Then once the machine driver has create a snd_sock_jack through
> snd_soc_card_jack_new() it calls snd_soc_component_set_jack() on
> the codec component, which will call the new arizona_jack_set_jack(),
> which sets up jack-detection and requests the IRQs.
>
> This split is necessary, because the IRQ handlers need access to the
> arizona->dapm pointer and the snd_sock_jack which are not available
> when the codec-driver's probe function runs.
>
> Note this requires that machine-drivers for codecs which are converted
> to use the new helper functions from arizona-jack.c are modified to
> create a snd_soc_jack through snd_soc_card_jack_new() and register
> this jack with the codec through snd_soc_component_set_jack().

Okay, it seems that messages are on behalf of the parent while managed
resources are being attached to the actual device.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Pass dev (the codec-device) to devm_regulator_get instead of
>   passing arizona->dev. This is necessary so that the regulator gets
>   properly released when the coded driver unbinds.
> ---
>  sound/soc/codecs/Makefile       |   2 +-
>  sound/soc/codecs/arizona-jack.c | 125 +++++++++++++++-----------------
>  sound/soc/codecs/arizona.h      |   6 ++
>  3 files changed, 65 insertions(+), 68 deletions(-)
>
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index d277f0366e09..2e976cfaa862 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -43,7 +43,7 @@ snd-soc-ak4642-objs := ak4642.o
>  snd-soc-ak4671-objs := ak4671.o
>  snd-soc-ak5386-objs := ak5386.o
>  snd-soc-ak5558-objs := ak5558.o
> -snd-soc-arizona-objs := arizona.o
> +snd-soc-arizona-objs := arizona.o arizona-jack.o
>  snd-soc-bd28623-objs := bd28623.o
>  snd-soc-bt-sco-objs := bt-sco.o
>  snd-soc-cpcap-objs := cpcap.o
> diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
> index a6e8071f84ab..e121490eb379 100644
> --- a/sound/soc/codecs/arizona-jack.c
> +++ b/sound/soc/codecs/arizona-jack.c
> @@ -7,14 +7,12 @@
>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/i2c.h>
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
>  #include <linux/err.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio.h>
>  #include <linux/input.h>
> -#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
> @@ -1337,27 +1335,16 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
>         return 0;
>  }
>
> -static int arizona_extcon_probe(struct platform_device *pdev)
> +int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
>  {
> -       struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
> +       struct arizona *arizona = info->arizona;
>         struct arizona_pdata *pdata = &arizona->pdata;
> -       struct arizona_priv *info;
> -       unsigned int val;
> -       unsigned int clamp_mode;
> -       int jack_irq_fall, jack_irq_rise;
> -       int ret, mode, i, j;
> -
> -       if (!arizona->dapm || !arizona->dapm->card)
> -               return -EPROBE_DEFER;
> -
> -       info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
> -       if (!info)
> -               return -ENOMEM;
> +       int ret, mode;
>
>         if (!dev_get_platdata(arizona->dev))
> -               arizona_extcon_device_get_pdata(&pdev->dev, arizona);
> +               arizona_extcon_device_get_pdata(dev, arizona);
>
> -       info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
> +       info->micvdd = devm_regulator_get(dev, "MICVDD");
>         if (IS_ERR(info->micvdd)) {
>                 ret = PTR_ERR(info->micvdd);
>                 dev_err(arizona->dev, "Failed to get MICVDD: %d\n", ret);
> @@ -1365,12 +1352,10 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>         }
>
>         mutex_init(&info->lock);
> -       info->arizona = arizona;
>         info->last_jackdet = ~(ARIZONA_MICD_CLAMP_STS | ARIZONA_JD1_STS);
>         INIT_DELAYED_WORK(&info->hpdet_work, arizona_hpdet_work);
>         INIT_DELAYED_WORK(&info->micd_detect_work, arizona_micd_detect);
>         INIT_DELAYED_WORK(&info->micd_timeout_work, arizona_micd_timeout_work);
> -       platform_set_drvdata(pdev, info);
>
>         switch (arizona->type) {
>         case WM5102:
> @@ -1404,20 +1389,20 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>                 break;
>         }
>
> -       info->edev = devm_extcon_dev_allocate(&pdev->dev, arizona_cable);
> +       info->edev = devm_extcon_dev_allocate(dev, arizona_cable);
>         if (IS_ERR(info->edev)) {
> -               dev_err(&pdev->dev, "failed to allocate extcon device\n");
> +               dev_err(arizona->dev, "failed to allocate extcon device\n");
>                 return -ENOMEM;
>         }
>
> -       ret = devm_extcon_dev_register(&pdev->dev, info->edev);
> +       ret = devm_extcon_dev_register(dev, info->edev);
>         if (ret < 0) {
>                 dev_err(arizona->dev, "extcon_dev_register() failed: %d\n",
>                         ret);
>                 return ret;
>         }
>
> -       info->input = devm_input_allocate_device(&pdev->dev);
> +       info->input = devm_input_allocate_device(dev);
>         if (!info->input) {
>                 dev_err(arizona->dev, "Can't allocate input dev\n");
>                 ret = -ENOMEM;
> @@ -1448,7 +1433,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>                 else
>                         mode = GPIOF_OUT_INIT_LOW;
>
> -               ret = devm_gpio_request_one(&pdev->dev, pdata->micd_pol_gpio,
> +               ret = devm_gpio_request_one(dev, pdata->micd_pol_gpio,
>                                             mode, "MICD polarity");
>                 if (ret != 0) {
>                         dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
> @@ -1481,17 +1466,38 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>         }
>
>         if (arizona->pdata.hpdet_id_gpio > 0) {
> -               ret = devm_gpio_request_one(&pdev->dev,
> -                                           arizona->pdata.hpdet_id_gpio,
> +               ret = devm_gpio_request_one(dev, arizona->pdata.hpdet_id_gpio,
>                                             GPIOF_OUT_INIT_LOW,
>                                             "HPDET");
>                 if (ret != 0) {
>                         dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
>                                 arizona->pdata.hpdet_id_gpio, ret);
> -                       goto err_gpio;
> +                       gpiod_put(info->micd_pol_gpio);
> +                       return ret;
>                 }
>         }
>
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_probe);
> +
> +int arizona_jack_codec_dev_remove(struct arizona_priv *info)
> +{
> +       gpiod_put(info->micd_pol_gpio);
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_remove);
> +
> +static int arizona_jack_enable_jack_detect(struct arizona_priv *info,
> +                                          struct snd_soc_jack *jack)
> +{
> +       struct arizona *arizona = info->arizona;
> +       struct arizona_pdata *pdata = &arizona->pdata;
> +       unsigned int val;
> +       unsigned int clamp_mode;
> +       int jack_irq_fall, jack_irq_rise;
> +       int ret, i, j;
> +
>         if (arizona->pdata.micd_bias_start_time)
>                 regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
>                                    ARIZONA_MICD_BIAS_STARTTIME_MASK,
> @@ -1532,16 +1538,15 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>         if (arizona->pdata.num_micd_ranges > ARIZONA_MAX_MICD_RANGE) {
>                 dev_err(arizona->dev, "Too many MICD ranges: %d\n",
>                         arizona->pdata.num_micd_ranges);
> +               return -EINVAL;
>         }
>
>         if (info->num_micd_ranges > 1) {
>                 for (i = 1; i < info->num_micd_ranges; i++) {
>                         if (info->micd_ranges[i - 1].max >
>                             info->micd_ranges[i].max) {
> -                               dev_err(arizona->dev,
> -                                       "MICD ranges must be sorted\n");
> -                               ret = -EINVAL;
> -                               goto err_gpio;
> +                               dev_err(arizona->dev, "MICD ranges must be sorted\n");
> +                               return -EINVAL;
>                         }
>                 }
>         }
> @@ -1559,8 +1564,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>                 if (j == ARIZONA_NUM_MICD_BUTTON_LEVELS) {
>                         dev_err(arizona->dev, "Unsupported MICD level %d\n",
>                                 info->micd_ranges[i].max);
> -                       ret = -EINVAL;
> -                       goto err_gpio;
> +                       return -EINVAL;
>                 }
>
>                 dev_dbg(arizona->dev, "%d ohms for MICD threshold %d\n",
> @@ -1629,43 +1633,40 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>         ret = arizona_request_irq(arizona, jack_irq_rise,
>                                   "JACKDET rise", arizona_jackdet, info);
>         if (ret != 0) {
> -               dev_err(&pdev->dev, "Failed to get JACKDET rise IRQ: %d\n",
> -                       ret);
> +               dev_err(arizona->dev, "Failed to get JACKDET rise IRQ: %d\n", ret);
>                 goto err_pm;
>         }
>
>         ret = arizona_set_irq_wake(arizona, jack_irq_rise, 1);
>         if (ret != 0) {
> -               dev_err(&pdev->dev, "Failed to set JD rise IRQ wake: %d\n",
> -                       ret);
> +               dev_err(arizona->dev, "Failed to set JD rise IRQ wake: %d\n", ret);
>                 goto err_rise;
>         }
>
>         ret = arizona_request_irq(arizona, jack_irq_fall,
>                                   "JACKDET fall", arizona_jackdet, info);
>         if (ret != 0) {
> -               dev_err(&pdev->dev, "Failed to get JD fall IRQ: %d\n", ret);
> +               dev_err(arizona->dev, "Failed to get JD fall IRQ: %d\n", ret);
>                 goto err_rise_wake;
>         }
>
>         ret = arizona_set_irq_wake(arizona, jack_irq_fall, 1);
>         if (ret != 0) {
> -               dev_err(&pdev->dev, "Failed to set JD fall IRQ wake: %d\n",
> -                       ret);
> +               dev_err(arizona->dev, "Failed to set JD fall IRQ wake: %d\n", ret);
>                 goto err_fall;
>         }
>
>         ret = arizona_request_irq(arizona, ARIZONA_IRQ_MICDET,
>                                   "MICDET", arizona_micdet, info);
>         if (ret != 0) {
> -               dev_err(&pdev->dev, "Failed to get MICDET IRQ: %d\n", ret);
> +               dev_err(arizona->dev, "Failed to get MICDET IRQ: %d\n", ret);
>                 goto err_fall_wake;
>         }
>
>         ret = arizona_request_irq(arizona, ARIZONA_IRQ_HPDET,
>                                   "HPDET", arizona_hpdet_irq, info);
>         if (ret != 0) {
> -               dev_err(&pdev->dev, "Failed to get HPDET IRQ: %d\n", ret);
> +               dev_err(arizona->dev, "Failed to get HPDET IRQ: %d\n", ret);
>                 goto err_micdet;
>         }
>
> @@ -1677,12 +1678,11 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>
>         ret = regulator_allow_bypass(info->micvdd, true);
>         if (ret != 0)
> -               dev_warn(arizona->dev, "Failed to set MICVDD to bypass: %d\n",
> -                        ret);
> +               dev_warn(arizona->dev, "Failed to set MICVDD to bypass: %d\n", ret);
>
>         ret = input_register_device(info->input);
>         if (ret) {
> -               dev_err(&pdev->dev, "Can't register input device: %d\n", ret);
> +               dev_err(arizona->dev, "Can't register input device: %d\n", ret);
>                 goto err_hpdet;
>         }
>
> @@ -1704,14 +1704,11 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>         arizona_free_irq(arizona, jack_irq_rise, info);
>  err_pm:
>         pm_runtime_put(arizona->dev);
> -err_gpio:
> -       gpiod_put(info->micd_pol_gpio);
>         return ret;
>  }
>
> -static int arizona_extcon_remove(struct platform_device *pdev)
> +static int arizona_jack_disable_jack_detect(struct arizona_priv *info)
>  {
> -       struct arizona_priv *info = platform_get_drvdata(pdev);
>         struct arizona *arizona = info->arizona;
>         int jack_irq_rise, jack_irq_fall;
>         bool change;
> @@ -1739,8 +1736,7 @@ static int arizona_extcon_remove(struct platform_device *pdev)
>                                        ARIZONA_MICD_ENA, 0,
>                                        &change);
>         if (ret < 0) {
> -               dev_err(&pdev->dev, "Failed to disable micd on remove: %d\n",
> -                       ret);
> +               dev_err(arizona->dev, "Failed to disable micd on remove: %d\n", ret);
>         } else if (change) {
>                 regulator_disable(info->micvdd);
>                 pm_runtime_put(arizona->dev);
> @@ -1753,22 +1749,17 @@ static int arizona_extcon_remove(struct platform_device *pdev)
>                            ARIZONA_JD1_ENA, 0);
>         arizona_clk32k_disable(arizona);
>
> -       gpiod_put(info->micd_pol_gpio);
> -
>         return 0;
>  }
>
> -static struct platform_driver arizona_extcon_driver = {
> -       .driver         = {
> -               .name   = "arizona-extcon",
> -       },
> -       .probe          = arizona_extcon_probe,
> -       .remove         = arizona_extcon_remove,
> -};
> -
> -module_platform_driver(arizona_extcon_driver);
> +int arizona_jack_set_jack(struct snd_soc_component *component,
> +                         struct snd_soc_jack *jack, void *data)
> +{
> +       struct arizona_priv *info = snd_soc_component_get_drvdata(component);
>
> -MODULE_DESCRIPTION("Arizona Extcon driver");
> -MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:extcon-arizona");
> +       if (jack)
> +               return arizona_jack_enable_jack_detect(info, jack);
> +       else
> +               return arizona_jack_disable_jack_detect(info);
> +}
> +EXPORT_SYMBOL_GPL(arizona_jack_set_jack);
> diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
> index 7132dbc3c840..fc515845a3e6 100644
> --- a/sound/soc/codecs/arizona.h
> +++ b/sound/soc/codecs/arizona.h
> @@ -386,4 +386,10 @@ static inline int arizona_unregister_notifier(struct snd_soc_component *componen
>
>  int arizona_of_get_audio_pdata(struct arizona *arizona);
>
> +int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev);
> +int arizona_jack_codec_dev_remove(struct arizona_priv *info);
> +
> +int arizona_jack_set_jack(struct snd_soc_component *component,
> +                         struct snd_soc_jack *jack, void *data);
> +
>  #endif
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
