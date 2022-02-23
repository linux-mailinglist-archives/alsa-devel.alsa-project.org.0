Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B05DA4C45A7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C50193C;
	Fri, 25 Feb 2022 14:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C50193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794883;
	bh=mL+3A2Vh8pNv0p3qQeywELwmAOfks6TKf0crKSZtVMo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPdensFwOfNH3TKcy4sX0KyStpPITmimCRm5Apd22RWPEiX2hVWHdUqr/HTE1d19i
	 6UDmTTbLnViJc6qxZT3SDXCpE8XbXVkBZs3/A3X2qOnQOjQqjSEKbJ7YXZXDRZTk65
	 4w9VuGl64015raEVoePg4/zmIPPcEhjDFTWCR/PU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00897F8053E;
	Fri, 25 Feb 2022 14:11:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26F7CF80237; Wed, 23 Feb 2022 22:33:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2841AF800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 22:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2841AF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Zr7wTZFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645652002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JVrDSsHDee470/2N5kdB0CUYnm9UIRcjrM+Vqrir8YU=;
 b=Zr7wTZFxWBcr56DUsJkJ1ZKYZmLGX8efarU8b697hShCmmKmsR3zhdl2L7KdwPtgkHvVb0
 L/ItOHUQzRKHXfhnq+yt4dBXt3te1FdBJZ/FQde6nZmn4T148HZd0Tk5VC6ETM6FuYtxVu
 5cvS8yV7HGRlDpBl7f5SBeqV2+aRThs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-6D98f-zKOvmeWVtU2ZyV0Q-1; Wed, 23 Feb 2022 16:33:19 -0500
X-MC-Unique: 6D98f-zKOvmeWVtU2ZyV0Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 e1-20020adfa741000000b001e2e74c3d4eso10703879wrd.12
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 13:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JVrDSsHDee470/2N5kdB0CUYnm9UIRcjrM+Vqrir8YU=;
 b=Bx9B/BPf79LFig72LgfsK9cr2d9T+/Y3ULWROgIo4ezrqmZ3aJkIsWpPFZii8a0j0k
 zsx/jLdZ5wPEYVvmKFCAhEJ+8VH29c9cOzWI692PFs0xr9fkE46MdgLh/Kgvr6BlGJuF
 XwQAgy3jPxZhH3+AQ8eaRTZoarqhXN1S4Z/svDWHS+Oc8lTLJSRgusV5xiWmVdX5bXYb
 S+z93dCpfciRMDntinZZpirBV8atDCUeDR/kzi9d5YV9UcAG7fTLd4cGvN7wyVxjSRU2
 y8+y8+3uVAUV2AQIjxBE6O06wyPiV2OZ5+sWlPjwQ0GuB49O9chxuOmOgBkQQkyYbTUr
 Wjpg==
X-Gm-Message-State: AOAM530OtsB181LquXPflNpIRbR4V6bblnZ15t8O6FcO0cMMM4OaMA7E
 xC2piYWM++GrYu1iMrfoLFLtq/vys1NCSxBoKs61sOH/v9JJtKsFpdaX+UvgZMvMBTM1D928TSc
 g11/bOl4Q0NUYW34V/zB61eg=
X-Received: by 2002:a5d:6f0a:0:b0:1e4:a354:a7e with SMTP id
 ay10-20020a5d6f0a000000b001e4a3540a7emr1081126wrb.423.1645651998033; 
 Wed, 23 Feb 2022 13:33:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVh3zKelOjcgzztRyyTOBFC5U69RZ7Dwi6phYx+UQ7pZLlXHi6mmPrXmx8tSFwquULC08JMw==
X-Received: by 2002:a5d:6f0a:0:b0:1e4:a354:a7e with SMTP id
 ay10-20020a5d6f0a000000b001e4a3540a7emr1081114wrb.423.1645651997698; 
 Wed, 23 Feb 2022 13:33:17 -0800 (PST)
Received: from redhat.com ([2.55.166.187])
 by smtp.gmail.com with ESMTPSA id l5sm677279wmq.7.2022.02.23.13.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 13:33:17 -0800 (PST)
Date: Wed, 23 Feb 2022 16:33:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 01/11] driver: platform: add and use helper for safer
 setting of driver_override
Message-ID: <20220223162538-mutt-send-email-mst@kernel.org>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
 <20220223191310.347669-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20220223191310.347669-2-krzysztof.kozlowski@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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

On Wed, Feb 23, 2022 at 08:13:00PM +0100, Krzysztof Kozlowski wrote:
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
>     (do_one_initcall) from [<c0f012c0>] (kernel_init_freeable+0x3d0/0x4d8)
>     (kernel_init_freeable) from [<c0a7def0>] (kernel_init+0x8/0x114)
>     (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> 
> Provide a helper which clearly documents the usage of driver_override.
> This will allow later to reuse the helper and reduce amount of
> duplicated code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/base/driver.c           | 44 +++++++++++++++++++++++++++++++++
>  drivers/base/platform.c         | 24 +++---------------
>  include/linux/device/driver.h   |  1 +
>  include/linux/platform_device.h |  6 ++++-
>  4 files changed, 54 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/base/driver.c b/drivers/base/driver.c
> index 8c0d33e182fd..79efe51bb4c0 100644
> --- a/drivers/base/driver.c
> +++ b/drivers/base/driver.c
> @@ -30,6 +30,50 @@ static struct device *next_device(struct klist_iter *i)
>  	return dev;
>  }
>  
> +/*
> + * set_driver_override() - Helper to set or clear driver override.
> + * @dev: Device to change
> + * @override: Address of string to change (e.g. &device->driver_override);
> + *            The contents will be freed and hold newly allocated override.
> + * @s: NULL terminated string, new driver name to force a match, pass empty

Don't you mean NUL terminated?
Do all callers really validate that it's NUL terminated?

> + *     string to clear it
> + *
> + * Helper to setr or clear driver override in a device, intended for the cases

set?

> + * when the driver_override field is allocated by driver/bus code.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int driver_set_override(struct device *dev, char **override, const char *s)
> +{
> +	char *new, *old, *cp;
> +
> +	if (!dev || !override || !s)
> +		return -EINVAL;
> +
> +	new = kstrndup(s, strlen(s), GFP_KERNEL);


what's the point of this kstrndup then? why not just kstrdup?

> +	if (!new)
> +		return -ENOMEM;
> +
> +	cp = strchr(new, '\n');
> +	if (cp)
> +		*cp = '\0';
> +
> +	device_lock(dev);
> +	old = *override;
> +	if (strlen(new)) {

We are re-reading the string like 3 times here.

> +		*override = new;
> +	} else {
> +		kfree(new);
> +		*override = NULL;
> +	}
> +	device_unlock(dev);
> +
> +	kfree(old);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(driver_set_override);
> +
>  /**
>   * driver_for_each_device - Iterator for devices bound to a driver.
>   * @drv: Driver we're iterating.
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 6cb04ac48bf0..d8853b32ea10 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1275,31 +1275,15 @@ static ssize_t driver_override_store(struct device *dev,
>  				     const char *buf, size_t count)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> -	char *driver_override, *old, *cp;
> +	int ret;
>  
>  	/* We need to keep extra room for a newline */
>  	if (count >= (PAGE_SIZE - 1))
>  		return -EINVAL;

Given everyone seems to repeat this check, how about passing
in count and doing the validation in the helper?
We will then also avoid the need to do strlen and strchr.


> -	driver_override = kstrndup(buf, count, GFP_KERNEL);
> -	if (!driver_override)
> -		return -ENOMEM;
> -
> -	cp = strchr(driver_override, '\n');
> -	if (cp)
> -		*cp = '\0';
> -
> -	device_lock(dev);
> -	old = pdev->driver_override;
> -	if (strlen(driver_override)) {
> -		pdev->driver_override = driver_override;
> -	} else {
> -		kfree(driver_override);
> -		pdev->driver_override = NULL;
> -	}
> -	device_unlock(dev);
> -
> -	kfree(old);
> +	ret = driver_set_override(dev, &pdev->driver_override, buf);
> +	if (ret)
> +		return ret;
>  
>  	return count;
>  }
> diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> index 15e7c5e15d62..81c0d9f65a40 100644
> --- a/include/linux/device/driver.h
> +++ b/include/linux/device/driver.h
> @@ -151,6 +151,7 @@ extern int __must_check driver_create_file(struct device_driver *driver,
>  extern void driver_remove_file(struct device_driver *driver,
>  			       const struct driver_attribute *attr);
>  
> +int driver_set_override(struct device *dev, char **override, const char *s);
>  extern int __must_check driver_for_each_device(struct device_driver *drv,
>  					       struct device *start,
>  					       void *data,
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index 7c96f169d274..37ac14459499 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -31,7 +31,11 @@ struct platform_device {
>  	struct resource	*resource;
>  
>  	const struct platform_device_id	*id_entry;
> -	char *driver_override; /* Driver name to force a match */
> +	/*
> +	 * Driver name to force a match, use
> +	 * driver_set_override() to set or clear it.
> +	 */
> +	char *driver_override;
>  
>  	/* MFD cell pointer */
>  	struct mfd_cell *mfd_cell;
> -- 
> 2.32.0

