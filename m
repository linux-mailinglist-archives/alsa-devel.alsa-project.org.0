Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73764300E64
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 21:59:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02B941F0E;
	Fri, 22 Jan 2021 21:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02B941F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611349161;
	bh=27/ej4qF+sVQN7KlUbuOl0UIPF9d9O+W57Lk+C/XZCc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnefzE8ffRRLEqXAz0TUHhQjxay1dpkdGKBMyvrY/9MYZDUAj7UWQpnDix08YiAPo
	 bLGGYnBUf2TV1FWVimAfqujK3kyy0HUaKouubwbsFdzJf5igNbo3ATu0/WQx3i6Rvx
	 ecefSgNoCo2vJlveSjWFPm/dl9XLIAZ5ou021rmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10C21F8015B;
	Fri, 22 Jan 2021 21:57:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B025F8016E; Fri, 22 Jan 2021 21:57:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 496E7F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 21:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 496E7F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rjGx/iG3"
Received: by mail-pf1-x42b.google.com with SMTP id u67so4635536pfb.3
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 12:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KD8nfRkuspUBdwY3QBA8hFyJ8cWZLQijtR6nIjNPXq8=;
 b=rjGx/iG3qopn8O1l6Z60zF5KKuQOWQclkt6Z3N8lk0f742lIiOKyqWL8FAh2GubPVB
 CktyH+EUdMDwIoyzJEEItQWJOVp0zPojLunv4kkeiWR8X/nkAvrtQE6uEWfe3hRcwMIF
 QiAalDcTGP/EVhKEbeLEWpa1sp6F/s/efsnED24EOQToARj8rdeY/12wNor7UxAlMsPl
 Vjm2GwEX5Dxf39owmHqPbm+sZ5aKutuB1mh+0UKWtMxzZdGaj821xOTc/cLv1w3X+/zz
 ctAUISe9wZ8Hpm/K1H5+O8IBlNgrzKJ7uL329CVfW+nd/vseRrR8Ho6T2dtojO/T9mq/
 HZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KD8nfRkuspUBdwY3QBA8hFyJ8cWZLQijtR6nIjNPXq8=;
 b=gm2beYiDHleExlO0uf/IoIvaQOPnvSoQMQ/PllBEVJZD3u4HXPDke5bKRjb36U0n/z
 U2Ra1FjIJcbro2khOziPUKUCsD47/cusaOpR5QVd5UTMNLRjM+xg+wkt56DztY6k6lL6
 oRA6+d7ytWQYx4rMltUqCkNeqep6WhGnF6fnBYucDcsrCMBVjSOzhS7lY9p0rDC62ciQ
 R1s4fwoKm0djL7TolZovYD0ssTmtotIeDwtzzZV62oBRHK1z48xOtL7Ugi6O8b7letCt
 ASDBGpk1EdkR/w9t/KRarHCR7H8E22wAdctjetLWyHh1LwmBby7ZEZOZYuy+ynbgdVf+
 Mb8Q==
X-Gm-Message-State: AOAM531Wh8bijYnJFshMolmiJJG60cFvn5YH0fW9mfzqMKIQrZXaWvF9
 c5y66a5MWYOeO9GIRSuqEkva+aJTrt1Wvo3meRs=
X-Google-Smtp-Source: ABdhPJzGozJOgjcNQkilLkF/yxBHze5QdO9nCrumT70boGsJBIhwNwj9/PGSfzo+6nMR/bV5zIbqcITgZY1TyyI+B3k=
X-Received: by 2002:a65:644b:: with SMTP id s11mr6543393pgv.4.1611349058919;
 Fri, 22 Jan 2021 12:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20210122164107.361939-1-hdegoede@redhat.com>
 <20210122164107.361939-13-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-13-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Jan 2021 22:58:28 +0200
Message-ID: <CAHp75VdUU=qf=Uh4htyYqcHeQTLwadznXO=dJcVQxpKrQv6a5g@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] ASoC: arizona: Make the wm5102, wm5110, wm8997
 and wm8998 drivers use the new jack library
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
> Make all arizona codec drivers for which drivers/mfd/arizona-core.c used
> to instantiate a "arizona-extcon" child-device use the new arizona-jack.c
> library for jack-detection.
>
> This has been tested on a Lenovo Yoga Tablet 2 1051L with a WM5102 codec.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  sound/soc/codecs/wm5102.c | 12 +++++++++++-
>  sound/soc/codecs/wm5110.c | 12 +++++++++++-
>  sound/soc/codecs/wm8997.c | 14 ++++++++++++--
>  sound/soc/codecs/wm8998.c |  9 +++++++++
>  4 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
> index 70d353b63fe0..b77595fb3ea8 100644
> --- a/sound/soc/codecs/wm5102.c
> +++ b/sound/soc/codecs/wm5102.c
> @@ -2004,6 +2004,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm5102 = {
>         .remove                 = wm5102_component_remove,
>         .set_sysclk             = arizona_set_sysclk,
>         .set_pll                = wm5102_set_fll,
> +       .set_jack               = arizona_jack_set_jack,
>         .name                   = DRV_NAME,
>         .compress_ops           = &wm5102_compress_ops,
>         .controls               = wm5102_snd_controls,
> @@ -2057,6 +2058,11 @@ static int wm5102_probe(struct platform_device *pdev)
>         if (ret != 0)
>                 return ret;
>
> +       /* This may return -EPROBE_DEFER, so do this early on */
> +       ret = arizona_jack_codec_dev_probe(&wm5102->core, &pdev->dev);
> +       if (ret)
> +               return ret;
> +
>         for (i = 0; i < ARRAY_SIZE(wm5102->fll); i++)
>                 wm5102->fll[i].vco_mult = 1;
>
> @@ -2089,7 +2095,7 @@ static int wm5102_probe(struct platform_device *pdev)
>                                   wm5102);
>         if (ret != 0) {
>                 dev_err(&pdev->dev, "Failed to request DSP IRQ: %d\n", ret);
> -               return ret;
> +               goto err_jack_codec_dev;
>         }
>
>         ret = arizona_set_irq_wake(arizona, ARIZONA_IRQ_DSP_IRQ1, 1);
> @@ -2123,6 +2129,8 @@ static int wm5102_probe(struct platform_device *pdev)
>  err_dsp_irq:
>         arizona_set_irq_wake(arizona, ARIZONA_IRQ_DSP_IRQ1, 0);
>         arizona_free_irq(arizona, ARIZONA_IRQ_DSP_IRQ1, wm5102);
> +err_jack_codec_dev:
> +       arizona_jack_codec_dev_remove(&wm5102->core);
>
>         return ret;
>  }
> @@ -2141,6 +2149,8 @@ static int wm5102_remove(struct platform_device *pdev)
>         arizona_set_irq_wake(arizona, ARIZONA_IRQ_DSP_IRQ1, 0);
>         arizona_free_irq(arizona, ARIZONA_IRQ_DSP_IRQ1, wm5102);
>
> +       arizona_jack_codec_dev_remove(&wm5102->core);
> +
>         return 0;
>  }
>
> diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
> index 4238929b2375..ef22051a3599 100644
> --- a/sound/soc/codecs/wm5110.c
> +++ b/sound/soc/codecs/wm5110.c
> @@ -2370,6 +2370,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm5110 = {
>         .remove                 = wm5110_component_remove,
>         .set_sysclk             = arizona_set_sysclk,
>         .set_pll                = wm5110_set_fll,
> +       .set_jack               = arizona_jack_set_jack,
>         .name                   = DRV_NAME,
>         .compress_ops           = &wm5110_compress_ops,
>         .controls               = wm5110_snd_controls,
> @@ -2424,6 +2425,11 @@ static int wm5110_probe(struct platform_device *pdev)
>                         return ret;
>         }
>
> +       /* This may return -EPROBE_DEFER, so do this early on */
> +       ret = arizona_jack_codec_dev_probe(&wm5110->core, &pdev->dev);
> +       if (ret)
> +               return ret;
> +
>         for (i = 0; i < ARRAY_SIZE(wm5110->fll); i++)
>                 wm5110->fll[i].vco_mult = 3;
>
> @@ -2456,7 +2462,7 @@ static int wm5110_probe(struct platform_device *pdev)
>                                   wm5110);
>         if (ret != 0) {
>                 dev_err(&pdev->dev, "Failed to request DSP IRQ: %d\n", ret);
> -               return ret;
> +               goto err_jack_codec_dev;
>         }
>
>         ret = arizona_set_irq_wake(arizona, ARIZONA_IRQ_DSP_IRQ1, 1);
> @@ -2490,6 +2496,8 @@ static int wm5110_probe(struct platform_device *pdev)
>  err_dsp_irq:
>         arizona_set_irq_wake(arizona, ARIZONA_IRQ_DSP_IRQ1, 0);
>         arizona_free_irq(arizona, ARIZONA_IRQ_DSP_IRQ1, wm5110);
> +err_jack_codec_dev:
> +       arizona_jack_codec_dev_remove(&wm5110->core);
>
>         return ret;
>  }
> @@ -2510,6 +2518,8 @@ static int wm5110_remove(struct platform_device *pdev)
>         arizona_set_irq_wake(arizona, ARIZONA_IRQ_DSP_IRQ1, 0);
>         arizona_free_irq(arizona, ARIZONA_IRQ_DSP_IRQ1, wm5110);
>
> +       arizona_jack_codec_dev_remove(&wm5110->core);
> +
>         return 0;
>  }
>
> diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
> index 229f2986cd96..4f5a848960e0 100644
> --- a/sound/soc/codecs/wm8997.c
> +++ b/sound/soc/codecs/wm8997.c
> @@ -1096,6 +1096,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm8997 = {
>         .remove                 = wm8997_component_remove,
>         .set_sysclk             = arizona_set_sysclk,
>         .set_pll                = wm8997_set_fll,
> +       .set_jack               = arizona_jack_set_jack,
>         .controls               = wm8997_snd_controls,
>         .num_controls           = ARRAY_SIZE(wm8997_snd_controls),
>         .dapm_widgets           = wm8997_dapm_widgets,
> @@ -1132,6 +1133,11 @@ static int wm8997_probe(struct platform_device *pdev)
>
>         arizona_init_dvfs(&wm8997->core);
>
> +       /* This may return -EPROBE_DEFER, so do this early on */
> +       ret = arizona_jack_codec_dev_probe(&wm8997->core, &pdev->dev);
> +       if (ret)
> +               return ret;
> +
>         for (i = 0; i < ARRAY_SIZE(wm8997->fll); i++)
>                 wm8997->fll[i].vco_mult = 1;
>
> @@ -1163,10 +1169,10 @@ static int wm8997_probe(struct platform_device *pdev)
>
>         ret = arizona_init_vol_limit(arizona);
>         if (ret < 0)
> -               return ret;
> +               goto err_jack_codec_dev;
>         ret = arizona_init_spk_irqs(arizona);
>         if (ret < 0)
> -               return ret;
> +               goto err_jack_codec_dev;
>
>         ret = devm_snd_soc_register_component(&pdev->dev,
>                                               &soc_component_dev_wm8997,
> @@ -1181,6 +1187,8 @@ static int wm8997_probe(struct platform_device *pdev)
>
>  err_spk_irqs:
>         arizona_free_spk_irqs(arizona);
> +err_jack_codec_dev:
> +       arizona_jack_codec_dev_remove(&wm8997->core);
>
>         return ret;
>  }
> @@ -1194,6 +1202,8 @@ static int wm8997_remove(struct platform_device *pdev)
>
>         arizona_free_spk_irqs(arizona);
>
> +       arizona_jack_codec_dev_remove(&wm8997->core);
> +
>         return 0;
>  }
>
> diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
> index 5413254295b7..f74af1c46933 100644
> --- a/sound/soc/codecs/wm8998.c
> +++ b/sound/soc/codecs/wm8998.c
> @@ -1316,6 +1316,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm8998 = {
>         .remove                 = wm8998_component_remove,
>         .set_sysclk             = arizona_set_sysclk,
>         .set_pll                = wm8998_set_fll,
> +       .set_jack               = arizona_jack_set_jack,
>         .controls               = wm8998_snd_controls,
>         .num_controls           = ARRAY_SIZE(wm8998_snd_controls),
>         .dapm_widgets           = wm8998_dapm_widgets,
> @@ -1350,6 +1351,11 @@ static int wm8998_probe(struct platform_device *pdev)
>         wm8998->core.arizona = arizona;
>         wm8998->core.num_inputs = 3;    /* IN1L, IN1R, IN2 */
>
> +       /* This may return -EPROBE_DEFER, so do this early on */
> +       ret = arizona_jack_codec_dev_probe(&wm8998->core, &pdev->dev);
> +       if (ret)
> +               return ret;
> +
>         for (i = 0; i < ARRAY_SIZE(wm8998->fll); i++)
>                 wm8998->fll[i].vco_mult = 1;
>
> @@ -1392,6 +1398,7 @@ static int wm8998_probe(struct platform_device *pdev)
>         arizona_free_spk_irqs(arizona);
>  err_pm_disable:
>         pm_runtime_disable(&pdev->dev);
> +       arizona_jack_codec_dev_remove(&wm8998->core);
>
>         return ret;
>  }
> @@ -1405,6 +1412,8 @@ static int wm8998_remove(struct platform_device *pdev)
>
>         arizona_free_spk_irqs(arizona);
>
> +       arizona_jack_codec_dev_remove(&wm8998->core);
> +
>         return 0;
>  }
>
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
