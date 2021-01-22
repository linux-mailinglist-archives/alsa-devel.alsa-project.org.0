Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E76300DF6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 21:44:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFACB1F01;
	Fri, 22 Jan 2021 21:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFACB1F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611348273;
	bh=DMCZtVLERLrKNR9BVGn6DH+ZoOvdlhykGrvsKTUvLA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHJnB5daibA8sUk4vcg/BhJSWsKLKn1iSz5FXEHR2gi90STEOKeq3XPGOceLXmL+g
	 Y/86UoaiVv7R6RinUjAjOhTW6my5fjtpHaD9KOMcCgLb33DvaWeXyZS229ergzWR7H
	 qfKoIZrFNsF7H8kUpuw7DvXrQClYxZ7smnxOSv1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B2A0F8016E;
	Fri, 22 Jan 2021 21:43:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3D1FF8016E; Fri, 22 Jan 2021 21:42:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 534BDF80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 21:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 534BDF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="njHYO51l"
Received: by mail-pf1-x42a.google.com with SMTP id j12so4585930pfj.12
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 12:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=05PthPyvl5iM5gx1+ea/6ZO6qWwbH3aECN+X13x7jUI=;
 b=njHYO51lm0GxjnaX+40skXE/3pFlZtm9lU5eRESsBYrQyOghMB0bYzDd2WhYBPH5Ic
 /dU6Ux9KEi9T+POv5R5VTHFz+km0ECUgRZ5vP9bNMJcwGmrj5RCs88UluXY9V/Lj18j2
 i+X5qe1U+NUQ57UDE2YGjy08Nde/KbAVW+QgtQdR1HYk4VQpMOM+9bmrV370y2+EKfZj
 hk0FsIdApPmZ5k9PLh2q/irRCy5gHjRqdVJORWnEB3AI5yoUQAmgq/skKeWe6FKzEmrA
 xChdhyZhazIIWIygSeCphSETQ5dZt/EwZqtWHYrpSgjvUnf9FNqABKt6M9kx2If9vMmG
 Dnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=05PthPyvl5iM5gx1+ea/6ZO6qWwbH3aECN+X13x7jUI=;
 b=omLJwVWf8Cm+dk9wWKmEk9HY40K0tCjUlJeCtiE6yrgYJr9t0Aib/gVnB7wsQgHGsG
 A3NdTtrglYxTdcInJ9o0D9/sCZ4R2IrNKXHa7LiNTHkWedoM09lIAoO6QFj1Ehk1P+22
 LJm9Ce6aUSTRXS/INwVJOzMoRv4za8fpyU23m/60g5ItfP2k5UmCV1zP91NHW1Cl40do
 yA6Myd2T2yUfMaLRSQpUF7sERdvRJ+ZdnGFkn8acJSHoP1Cce8P27XXW+7jBu6xB0BX1
 lAsfnT33VuAO5KRcI2wC8yv3l+yiH+HMlErxksqA4RRPQUpYtTj0zmNsL4QTL7VeeMZt
 wBVw==
X-Gm-Message-State: AOAM533l59aUzhe2sD0V1p/Xi+bUdKCagG0l7p8+JFiLi9NtnfbSD/GI
 BDBmK72o8bQTiAfKBTMLUw2xuqwGyihr0ND5W3s=
X-Google-Smtp-Source: ABdhPJxWs13cN22X8dHT1/04CCQq1lPRv10Z2NeMrKRu8eMEgXSMUmuBY/cx+TUq9GEx5IFo4Hz4JwoSspnH5pSVbTg=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr6636142pfe.40.1611348167525; Fri, 22 Jan
 2021 12:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20210122164107.361939-1-hdegoede@redhat.com>
 <20210122164107.361939-9-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-9-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Jan 2021 22:43:36 +0200
Message-ID: <CAHp75VdEJmZ-krjBmip_TaXyrVMwqLBDr=2xCRwW3fE61tGP4A@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] ASoC: arizona-jack: Use arizona->dev for
 runtime-pm
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
> Drivers for MFD child-devices such as the arizona codec drivers
> and the arizona-extcon driver can choose to either make
> runtime_pm_get/_put calls on their own child-device, which will
> then be propagated to their parent; or they can make them directly
> on their MFD parent-device.
>
> The arizona-extcon code was using runtime_pm_get/_put calls on
> its own child-device where as the codec drivers are using
> runtime_pm_get/_put calls on their parent.
>
> The arizona-extcon MFD cell/child-device has been removed and this
> commit is part of refactoring the arizona-extcon code into a library
> to be used directly from the codec drivers.
>
> Specifically this commit moves the code over to make
> runtime_pm_get/_put calls on the parent device (on arizona->dev)
> bringing the code inline with how the codec drivers do this.
>
> Note this also removes the pm_runtime_enable/_disable calls
> as pm_runtime support has already been enabled on the parent-device
> by the arizona MFD driver.
>
> This is part of a patch series converting the arizona extcon driver into
> a helper library for letting the arizona codec-drivers directly report
> jack state through the standard sound/soc/soc-jack.c functions.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  sound/soc/codecs/arizona-jack.c | 42 ++++++++++++++-------------------
>  sound/soc/codecs/arizona.h      |  1 -
>  2 files changed, 18 insertions(+), 25 deletions(-)
>
> diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
> index 5b40316d0d75..a6e8071f84ab 100644
> --- a/sound/soc/codecs/arizona-jack.c
> +++ b/sound/soc/codecs/arizona-jack.c
> @@ -251,7 +251,7 @@ static void arizona_start_mic(struct arizona_priv *info)
>         unsigned int mode;
>
>         /* Microphone detection can't use idle mode */
> -       pm_runtime_get_sync(info->dev);
> +       pm_runtime_get_sync(arizona->dev);
>
>         if (info->detecting) {
>                 ret = regulator_allow_bypass(info->micvdd, false);
> @@ -296,7 +296,7 @@ static void arizona_start_mic(struct arizona_priv *info)
>                 dev_err(arizona->dev, "Failed to enable micd: %d\n", ret);
>         } else if (!change) {
>                 regulator_disable(info->micvdd);
> -               pm_runtime_put_autosuspend(info->dev);
> +               pm_runtime_put_autosuspend(arizona->dev);
>         }
>  }
>
> @@ -341,8 +341,8 @@ static void arizona_stop_mic(struct arizona_priv *info)
>
>         if (change) {
>                 regulator_disable(info->micvdd);
> -               pm_runtime_mark_last_busy(info->dev);
> -               pm_runtime_put_autosuspend(info->dev);
> +               pm_runtime_mark_last_busy(arizona->dev);
> +               pm_runtime_put_autosuspend(arizona->dev);
>         }
>  }
>
> @@ -534,7 +534,7 @@ static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
>                 info->num_hpdet_res = 0;
>                 info->hpdet_retried = true;
>                 arizona_start_hpdet_acc_id(info);
> -               pm_runtime_put(info->dev);
> +               pm_runtime_put(arizona->dev);
>                 return -EAGAIN;
>         }
>
> @@ -631,7 +631,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
>                 arizona_start_mic(info);
>
>         if (info->hpdet_active) {
> -               pm_runtime_put_autosuspend(info->dev);
> +               pm_runtime_put_autosuspend(arizona->dev);
>                 info->hpdet_active = false;
>         }
>
> @@ -656,7 +656,7 @@ static void arizona_identify_headphone(struct arizona_priv *info)
>         dev_dbg(arizona->dev, "Starting HPDET\n");
>
>         /* Make sure we keep the device enabled during the measurement */
> -       pm_runtime_get_sync(info->dev);
> +       pm_runtime_get_sync(arizona->dev);
>
>         info->hpdet_active = true;
>
> @@ -685,7 +685,7 @@ static void arizona_identify_headphone(struct arizona_priv *info)
>
>  err:
>         arizona_extcon_hp_clamp(info, false);
> -       pm_runtime_put_autosuspend(info->dev);
> +       pm_runtime_put_autosuspend(arizona->dev);
>
>         /* Just report headphone */
>         ret = extcon_set_state_sync(info->edev, EXTCON_JACK_HEADPHONE, true);
> @@ -708,7 +708,7 @@ static void arizona_start_hpdet_acc_id(struct arizona_priv *info)
>         dev_dbg(arizona->dev, "Starting identification via HPDET\n");
>
>         /* Make sure we keep the device enabled during the measurement */
> -       pm_runtime_get_sync(info->dev);
> +       pm_runtime_get_sync(arizona->dev);
>
>         info->hpdet_active = true;
>
> @@ -1006,7 +1006,7 @@ static void arizona_micd_detect(struct work_struct *work)
>         else
>                 arizona_button_reading(info);
>
> -       pm_runtime_mark_last_busy(info->dev);
> +       pm_runtime_mark_last_busy(arizona->dev);
>         mutex_unlock(&info->lock);
>  }
>
> @@ -1090,7 +1090,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
>         cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
>         cancelled_mic = cancel_delayed_work_sync(&info->micd_timeout_work);
>
> -       pm_runtime_get_sync(info->dev);
> +       pm_runtime_get_sync(arizona->dev);
>
>         mutex_lock(&info->lock);
>
> @@ -1110,7 +1110,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
>                 dev_err(arizona->dev, "Failed to read jackdet status: %d\n",
>                         ret);
>                 mutex_unlock(&info->lock);
> -               pm_runtime_put_autosuspend(info->dev);
> +               pm_runtime_put_autosuspend(arizona->dev);
>                 return IRQ_NONE;
>         }
>
> @@ -1210,8 +1210,8 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
>
>         mutex_unlock(&info->lock);
>
> -       pm_runtime_mark_last_busy(info->dev);
> -       pm_runtime_put_autosuspend(info->dev);
> +       pm_runtime_mark_last_busy(arizona->dev);
> +       pm_runtime_put_autosuspend(arizona->dev);
>
>         return IRQ_HANDLED;
>  }
> @@ -1366,7 +1366,6 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>
>         mutex_init(&info->lock);
>         info->arizona = arizona;
> -       info->dev = &pdev->dev;
>         info->last_jackdet = ~(ARIZONA_MICD_CLAMP_STS | ARIZONA_JD1_STS);
>         INIT_DELAYED_WORK(&info->hpdet_work, arizona_hpdet_work);
>         INIT_DELAYED_WORK(&info->micd_detect_work, arizona_micd_detect);
> @@ -1617,9 +1616,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>
>         arizona_extcon_set_mode(info, 0);
>
> -       pm_runtime_enable(&pdev->dev);
> -       pm_runtime_idle(&pdev->dev);
> -       pm_runtime_get_sync(&pdev->dev);
> +       pm_runtime_get_sync(arizona->dev);
>
>         if (info->micd_clamp) {
>                 jack_irq_rise = ARIZONA_IRQ_MICD_CLAMP_RISE;
> @@ -1689,7 +1686,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>                 goto err_hpdet;
>         }
>
> -       pm_runtime_put(&pdev->dev);
> +       pm_runtime_put(arizona->dev);
>
>         return 0;
>
> @@ -1706,8 +1703,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>  err_rise:
>         arizona_free_irq(arizona, jack_irq_rise, info);
>  err_pm:
> -       pm_runtime_put(&pdev->dev);
> -       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_put(arizona->dev);
>  err_gpio:
>         gpiod_put(info->micd_pol_gpio);
>         return ret;
> @@ -1747,7 +1743,7 @@ static int arizona_extcon_remove(struct platform_device *pdev)
>                         ret);
>         } else if (change) {
>                 regulator_disable(info->micvdd);
> -               pm_runtime_put(info->dev);
> +               pm_runtime_put(arizona->dev);
>         }
>
>         regmap_update_bits(arizona->regmap,
> @@ -1759,8 +1755,6 @@ static int arizona_extcon_remove(struct platform_device *pdev)
>
>         gpiod_put(info->micd_pol_gpio);
>
> -       pm_runtime_disable(&pdev->dev);
> -
>         return 0;
>  }
>
> diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
> index d1a263a67bba..7132dbc3c840 100644
> --- a/sound/soc/codecs/arizona.h
> +++ b/sound/soc/codecs/arizona.h
> @@ -93,7 +93,6 @@ struct arizona_priv {
>         bool dvfs_cached;
>
>         /* Variables used by arizona-jack.c code */
> -       struct device *dev;
>         struct mutex lock;
>         struct delayed_work hpdet_work;
>         struct delayed_work micd_detect_work;
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
