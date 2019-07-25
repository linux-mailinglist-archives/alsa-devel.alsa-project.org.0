Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 500B975A7C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 00:18:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83C71F29;
	Fri, 26 Jul 2019 00:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83C71F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564093127;
	bh=Q6gpf6b2MK7jLrzah6DZZxSartKmyBB2wcQh4JLEdpc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3gz9R0RF0Iuf7Irsg7rsysyxkw+gfCXGNZPlfOOGbaVTCWp3UYSo0osNs6IKzBvb
	 xr4ffIITJqMoUebnlXhhD6akrm6ONgyDKmwyhfxZzXpwFlaJGtEzHmFl99BrC4VdR5
	 OO2zPz2WMEdX+TlCGOPnpmpTlYY5BietG/vascQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A136F803D0;
	Fri, 26 Jul 2019 00:17:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F3D2F803D0; Fri, 26 Jul 2019 00:17:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC677F800F5
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 00:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC677F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tBxt6As/"
Received: by mail-pl1-x641.google.com with SMTP id a93so23880122pla.7
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f+t6jbc1e2fwX6vAlkrzuMXuLiicaUEhNVvQHHY1xA0=;
 b=tBxt6As/HYsgjOazvloK9O0Mjop6Bn56B5HpXHSoqdI5WVRldDkFUpbbjL4TopoZd2
 J7vYPmE/m4aVBfZE48gzykZH2pLoAk/ENWS8OsjZL5gyAcIWf8nMAkci8B/raK29BWFO
 KIDyd+zcF3jL6kQ4DqoI8CLwuCWFnpLEyoQ+wSyHr2322Q940asEEMMtPIRQWBf3NA5t
 vy386+OJGM44cNKMiWm5wKAzU3beuPa1wWQ16i4RAA3464n6OjLqHnJ9EooueRxK3ARL
 j24WiDLZH/M2wWET5e+S7Sl2S5dFOBOX6VnaGI6RVLNjfHZelJxZkuRmG+E0Wx/w36dm
 yf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=f+t6jbc1e2fwX6vAlkrzuMXuLiicaUEhNVvQHHY1xA0=;
 b=ul9Z5SLtcsn4ooYk1UbfFEDejOtuxJgq6Kmzu0bZ04XSquCzCiMTEavT0ike6NnClR
 hADgLvTsMcZGe5Fgjdkd7l5U3XLYumzgEHLceVYRfnKyKLLXWPuEva4aC2i7XUzEnofj
 6wd9aejxQnrmut5SOrSW6KsTjfj08zH/kTS3QhIKJ8lvMJLRKe1forsWD0cICy8/gqP7
 yfFKHrmYjx85c/TvrKrc1qsbxFwLJ4UZ42rsqPHMMvL6paMQiIC+k9PXmb8RaosoU+Sv
 FjLTcrkMBZFpOpLqi+BuSQdBLuPQHNghDRNPD6K9DOGOAG3tUNcEW9OXH71BNe0pf2zm
 BxEg==
X-Gm-Message-State: APjAAAW4OFmtQo4dxOr4OVJfkmaSVxKQBrYpnK2+uDwFM007YvjwOD8U
 MAGKSlOMYCGbkngJ5Vlf/ak=
X-Google-Smtp-Source: APXvYqy5sOalZc7jCdn8Z9ZMzKMzw/2OyExZAds1bLvX/QRXsNnz9PyIEHHW8gjFX8wSRsOEm/5AsQ==
X-Received: by 2002:a17:902:d917:: with SMTP id
 c23mr93058293plz.248.1564093014781; 
 Thu, 25 Jul 2019 15:16:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g8sm49495815pgk.1.2019.07.25.15.16.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 15:16:53 -0700 (PDT)
Date: Thu, 25 Jul 2019 15:16:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20190725221652.GA31672@roeck-us.net>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-10-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725220215.460-10-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, Artur Rojek <contact@artur-rojek.eu>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 09/11] hwmon: Drop obsolete JZ4740 driver
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

On Thu, Jul 25, 2019 at 06:02:13PM -0400, Paul Cercueil wrote:
> The JZ4740 boards now use the iio-hwmon driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/Kconfig        |  10 ---
>  drivers/hwmon/Makefile       |   1 -
>  drivers/hwmon/jz4740-hwmon.c | 135 -----------------------------------
>  3 files changed, 146 deletions(-)
>  delete mode 100644 drivers/hwmon/jz4740-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 650dd71f9724..2199ac1d0ba7 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -660,16 +660,6 @@ config SENSORS_IT87
>  	  This driver can also be built as a module. If so, the module
>  	  will be called it87.
>  
> -config SENSORS_JZ4740
> -	tristate "Ingenic JZ4740 SoC ADC driver"
> -	depends on MACH_JZ4740 && MFD_JZ4740_ADC
> -	help
> -	  If you say yes here you get support for reading adc values from the ADCIN
> -	  pin on Ingenic JZ4740 SoC based boards.
> -
> -	  This driver can also be built as a module. If so, the module will be
> -	  called jz4740-hwmon.
> -
>  config SENSORS_JC42
>  	tristate "JEDEC JC42.4 compliant memory module temperature sensors"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 8db472ea04f0..1e82e912a5c4 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -85,7 +85,6 @@ obj-$(CONFIG_SENSORS_INA2XX)	+= ina2xx.o
>  obj-$(CONFIG_SENSORS_INA3221)	+= ina3221.o
>  obj-$(CONFIG_SENSORS_IT87)	+= it87.o
>  obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
> -obj-$(CONFIG_SENSORS_JZ4740)	+= jz4740-hwmon.o
>  obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
>  obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
>  obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
> diff --git a/drivers/hwmon/jz4740-hwmon.c b/drivers/hwmon/jz4740-hwmon.c
> deleted file mode 100644
> index bec5befd1d8b..000000000000
> --- a/drivers/hwmon/jz4740-hwmon.c
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
> - * JZ4740 SoC HWMON driver
> - */
> -
> -#include <linux/err.h>
> -#include <linux/interrupt.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/io.h>
> -
> -#include <linux/completion.h>
> -#include <linux/mfd/core.h>
> -
> -#include <linux/hwmon.h>
> -
> -struct jz4740_hwmon {
> -	void __iomem *base;
> -	int irq;
> -	const struct mfd_cell *cell;
> -	struct platform_device *pdev;
> -	struct completion read_completion;
> -	struct mutex lock;
> -};
> -
> -static irqreturn_t jz4740_hwmon_irq(int irq, void *data)
> -{
> -	struct jz4740_hwmon *hwmon = data;
> -
> -	complete(&hwmon->read_completion);
> -	return IRQ_HANDLED;
> -}
> -
> -static ssize_t in0_input_show(struct device *dev,
> -			      struct device_attribute *dev_attr, char *buf)
> -{
> -	struct jz4740_hwmon *hwmon = dev_get_drvdata(dev);
> -	struct platform_device *pdev = hwmon->pdev;
> -	struct completion *completion = &hwmon->read_completion;
> -	long t;
> -	unsigned long val;
> -	int ret;
> -
> -	mutex_lock(&hwmon->lock);
> -
> -	reinit_completion(completion);
> -
> -	enable_irq(hwmon->irq);
> -	hwmon->cell->enable(pdev);
> -
> -	t = wait_for_completion_interruptible_timeout(completion, HZ);
> -
> -	if (t > 0) {
> -		val = readw(hwmon->base) & 0xfff;
> -		val = (val * 3300) >> 12;
> -		ret = sprintf(buf, "%lu\n", val);
> -	} else {
> -		ret = t ? t : -ETIMEDOUT;
> -	}
> -
> -	hwmon->cell->disable(pdev);
> -	disable_irq(hwmon->irq);
> -
> -	mutex_unlock(&hwmon->lock);
> -
> -	return ret;
> -}
> -
> -static DEVICE_ATTR_RO(in0_input);
> -
> -static struct attribute *jz4740_attrs[] = {
> -	&dev_attr_in0_input.attr,
> -	NULL
> -};
> -
> -ATTRIBUTE_GROUPS(jz4740);
> -
> -static int jz4740_hwmon_probe(struct platform_device *pdev)
> -{
> -	int ret;
> -	struct device *dev = &pdev->dev;
> -	struct jz4740_hwmon *hwmon;
> -	struct device *hwmon_dev;
> -
> -	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> -	if (!hwmon)
> -		return -ENOMEM;
> -
> -	hwmon->cell = mfd_get_cell(pdev);
> -
> -	hwmon->irq = platform_get_irq(pdev, 0);
> -	if (hwmon->irq < 0) {
> -		dev_err(&pdev->dev, "Failed to get platform irq: %d\n",
> -			hwmon->irq);
> -		return hwmon->irq;
> -	}
> -
> -	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(hwmon->base))
> -		return PTR_ERR(hwmon->base);
> -
> -	hwmon->pdev = pdev;
> -	init_completion(&hwmon->read_completion);
> -	mutex_init(&hwmon->lock);
> -
> -	ret = devm_request_irq(dev, hwmon->irq, jz4740_hwmon_irq, 0,
> -			       pdev->name, hwmon);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> -		return ret;
> -	}
> -	disable_irq(hwmon->irq);
> -
> -	hwmon_dev = devm_hwmon_device_register_with_groups(dev, "jz4740", hwmon,
> -							   jz4740_groups);
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> -}
> -
> -static struct platform_driver jz4740_hwmon_driver = {
> -	.probe	= jz4740_hwmon_probe,
> -	.driver = {
> -		.name = "jz4740-hwmon",
> -	},
> -};
> -
> -module_platform_driver(jz4740_hwmon_driver);
> -
> -MODULE_DESCRIPTION("JZ4740 SoC HWMON driver");
> -MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:jz4740-hwmon");
> -- 
> 2.21.0.593.g511ec345e18
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
