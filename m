Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D950B889
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47F0F16D1;
	Fri, 22 Apr 2022 15:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47F0F16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634397;
	bh=3TzZ94muhsGWomlivMfRE4x2o0qOufT0JaGehGJv5h0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tiGDZdiR8XatihpyD9pLCdeZBduuEs4px1JoJ5jtiQtaex0Y5eu5RD1DOo6GXr6hw
	 RAVCOz//ZPoqwFCHwfnOB4BPX/OQg5UCAMS4hfvOBeNawrhGudA81aB/s8S0QbjU5B
	 +VqyqcqMVJD5rXi+NHV4q8tqZJ7iaf9coXJhCj4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B65EF8027C;
	Fri, 22 Apr 2022 15:31:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59D51F8010B; Wed, 20 Apr 2022 19:13:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09281F8010B
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 19:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09281F8010B
Received: by mail-yb1-f178.google.com with SMTP id w133so1381450ybe.5
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 10:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ASIWAo0HytBTKR5fLcMLGJJVl7MsnssiA8AeEXSjEM=;
 b=pEKP+TKMoug0AOWqwHFjMPQ8bfcwlqmp1Zeww3KBZ2gZ6ZWTDpGoE9foo6UaH5hHPI
 ZABn751ats1W6iU4jDMUmt6jyZiTxIISogflYCBBl7u2cTxmmSaHEXQMVQx8BpU8PwDf
 gpt5araOmthzBsN+VaPnMR12GMm4YX8stmvc7Db3H/eHgp1xcN5fyqm/czltK/sfCgqk
 yv29Z+fCzd79TPKVaQd4BgyMbcOMCHIkljQkb+WqmSNpl+7wlxg0hU6brKqhexFzbuAf
 038yrw2HTT7jU+75jUpmg/VG/x/o3VCToA2JQjDk3AXdF4IYy7D9oszpj2x0sx2IvFNX
 h05g==
X-Gm-Message-State: AOAM530dvbokNFiPIvx9bK7w6m/1EM2mL0sMtwJpSJEs/kAbXTzuGtvz
 wbKHymtJEJ76NfnVdBwOvGT8vZZrA8UEwSYnEto=
X-Google-Smtp-Source: ABdhPJygxTqwH/fYP8f9/TOx3wegsu6FxX5O1kN/quLL9EMh/cabSnVGqayxP5pVJxnDK33VgIW6Cm39TvZfF3wMYBU=
X-Received: by 2002:a25:e082:0:b0:641:cf5:b91f with SMTP id
 x124-20020a25e082000000b006410cf5b91fmr20887561ybg.482.1650474779115; Wed, 20
 Apr 2022 10:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
 <20220419113435.246203-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220419113435.246203-2-krzysztof.kozlowski@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 20 Apr 2022 19:12:48 +0200
Message-ID: <CAJZ5v0ijsLvgeN5y+T1D+iLAkYEOiSTPd0+m5_GMpBnVuqEOKA@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] driver: platform: Add helper for safer setting
 of driver_override
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stuart Yoder <stuyoder@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-spi <linux-spi@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Tue, Apr 19, 2022 at 1:34 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Several core drivers and buses expect that driver_override is a
> dynamically allocated memory thus later they can kfree() it.
>
> However such assumption is not documented, there were in the past and
> there are already users setting it to a string literal. This leads to
> kfree() of static memory during device release (e.g. in error paths or
> during unbind):
>
>     kernel BUG at ../mm/slub.c:3960!
>     Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>     ...
>     (kfree) from [<c058da50>] (platform_device_release+0x88/0xb4)
>     (platform_device_release) from [<c0585be0>] (device_release+0x2c/0x90)
>     (device_release) from [<c0a69050>] (kobject_put+0xec/0x20c)
>     (kobject_put) from [<c0f2f120>] (exynos5_clk_probe+0x154/0x18c)
>     (exynos5_clk_probe) from [<c058de70>] (platform_drv_probe+0x6c/0xa4)
>     (platform_drv_probe) from [<c058b7ac>] (really_probe+0x280/0x414)
>     (really_probe) from [<c058baf4>] (driver_probe_device+0x78/0x1c4)
>     (driver_probe_device) from [<c0589854>] (bus_for_each_drv+0x74/0xb8)
>     (bus_for_each_drv) from [<c058b48c>] (__device_attach+0xd4/0x16c)
>     (__device_attach) from [<c058a638>] (bus_probe_device+0x88/0x90)
>     (bus_probe_device) from [<c05871fc>] (device_add+0x3dc/0x62c)
>     (device_add) from [<c075ff10>] (of_platform_device_create_pdata+0x94/0xbc)
>     (of_platform_device_create_pdata) from [<c07600ec>] (of_platform_bus_create+0x1a8/0x4fc)
>     (of_platform_bus_create) from [<c0760150>] (of_platform_bus_create+0x20c/0x4fc)
>     (of_platform_bus_create) from [<c07605f0>] (of_platform_populate+0x84/0x118)
>     (of_platform_populate) from [<c0f3c964>] (of_platform_default_populate_init+0xa0/0xb8)
>     (of_platform_default_populate_init) from [<c01031f8>] (do_one_initcall+0x8c/0x404)
>
> Provide a helper which clearly documents the usage of driver_override.
> This will allow later to reuse the helper and reduce the amount of
> duplicated code.
>
> Convert the platform driver to use a new helper and make the
> driver_override field const char (it is not modified by the core).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/base/driver.c           | 69 +++++++++++++++++++++++++++++++++
>  drivers/base/platform.c         | 28 ++-----------
>  include/linux/device/driver.h   |  2 +
>  include/linux/platform_device.h |  6 ++-
>  4 files changed, 80 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/base/driver.c b/drivers/base/driver.c
> index 8c0d33e182fd..1b9d47b10bd0 100644
> --- a/drivers/base/driver.c
> +++ b/drivers/base/driver.c
> @@ -30,6 +30,75 @@ static struct device *next_device(struct klist_iter *i)
>         return dev;
>  }
>
> +/**
> + * driver_set_override() - Helper to set or clear driver override.
> + * @dev: Device to change
> + * @override: Address of string to change (e.g. &device->driver_override);
> + *            The contents will be freed and hold newly allocated override.

I would stick to one-line description here and possibly expand them in
the body of the comment.

Regardless, I think that the series is an improvement, so please feel
free to add

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to this patch and

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to the other patches in the series.

> + * @s: NUL-terminated string, new driver name to force a match, pass empty
> + *     string to clear it ("" or "\n", where the latter is only for sysfs
> + *     interface).
> + * @len: length of @s
> + *
> + * Helper to set or clear driver override in a device, intended for the cases
> + * when the driver_override field is allocated by driver/bus code.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int driver_set_override(struct device *dev, const char **override,
> +                       const char *s, size_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!override || !s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +        * Thus we can store one character less to avoid truncation during sysfs
> +        * show.
> +        */
> +       if (len >= (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       if (!len) {
> +               /* Empty string passed - clear override */
> +               device_lock(dev);
> +               old = *override;
> +               *override = NULL;
> +               device_unlock(dev);
> +               kfree(old);
> +
> +               return 0;
> +       }
> +
> +       cp = strnchr(s, len, '\n');
> +       if (cp)
> +               len = cp - s;
> +
> +       new = kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;
> +
> +       device_lock(dev);
> +       old = *override;
> +       if (cp != s) {
> +               *override = new;
> +       } else {
> +               /* "\n" passed - clear override */
> +               kfree(new);
> +               *override = NULL;
> +       }
> +       device_unlock(dev);
> +
> +       kfree(old);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(driver_set_override);
> +
>  /**
>   * driver_for_each_device - Iterator for devices bound to a driver.
>   * @drv: Driver we're iterating.
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 8cc272fd5c99..b684157b7f2f 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1275,31 +1275,11 @@ static ssize_t driver_override_store(struct device *dev,
>                                      const char *buf, size_t count)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
> -       char *driver_override, *old, *cp;
> -
> -       /* We need to keep extra room for a newline */
> -       if (count >= (PAGE_SIZE - 1))
> -               return -EINVAL;
> -
> -       driver_override = kstrndup(buf, count, GFP_KERNEL);
> -       if (!driver_override)
> -               return -ENOMEM;
> -
> -       cp = strchr(driver_override, '\n');
> -       if (cp)
> -               *cp = '\0';
> -
> -       device_lock(dev);
> -       old = pdev->driver_override;
> -       if (strlen(driver_override)) {
> -               pdev->driver_override = driver_override;
> -       } else {
> -               kfree(driver_override);
> -               pdev->driver_override = NULL;
> -       }
> -       device_unlock(dev);
> +       int ret;
>
> -       kfree(old);
> +       ret = driver_set_override(dev, &pdev->driver_override, buf, count);
> +       if (ret)
> +               return ret;
>
>         return count;
>  }
> diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> index 15e7c5e15d62..700453017e1c 100644
> --- a/include/linux/device/driver.h
> +++ b/include/linux/device/driver.h
> @@ -151,6 +151,8 @@ extern int __must_check driver_create_file(struct device_driver *driver,
>  extern void driver_remove_file(struct device_driver *driver,
>                                const struct driver_attribute *attr);
>
> +int driver_set_override(struct device *dev, const char **override,
> +                       const char *s, size_t len);
>  extern int __must_check driver_for_each_device(struct device_driver *drv,
>                                                struct device *start,
>                                                void *data,
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index 7c96f169d274..582d83ed9a91 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -31,7 +31,11 @@ struct platform_device {
>         struct resource *resource;
>
>         const struct platform_device_id *id_entry;
> -       char *driver_override; /* Driver name to force a match */
> +       /*
> +        * Driver name to force a match.  Do not set directly, because core
> +        * frees it.  Use driver_set_override() to set or clear it.
> +        */
> +       const char *driver_override;
>
>         /* MFD cell pointer */
>         struct mfd_cell *mfd_cell;
> --
> 2.32.0
>
