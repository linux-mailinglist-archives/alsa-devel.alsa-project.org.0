Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8364A5EF1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 16:04:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E03817CB;
	Tue,  1 Feb 2022 16:03:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E03817CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643727844;
	bh=Hwr7Zg520D5tmemK3KFQNIO7pFrgYL9h6hSR1ao24zM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CTNmtBrc5zm7X2ZzK+lwrCvjNlNV2MshQRVSWBeLwqWf7UHqNPWiBkQt+/XVn6Zl8
	 qHvFvxNxJZSPkP24A1Bga8qDv1wx/kYu2aEI9vBQlRqiyg/wvw9AYT6DMHsWX316Xc
	 kSN+wDgnJn1AIwzcNSppvsaulWanEzLh9rMweRnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CA0AF80089;
	Tue,  1 Feb 2022 16:02:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6961F80130; Tue,  1 Feb 2022 16:02:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4F98F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 16:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4F98F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="M+0wwcGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643727765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZXW4ikWwqlgBCRGnwXxFczGKcuCYa2j1IpHwO1T0Pw=;
 b=M+0wwcGElErVlbJduQ4LZhuo9/FY5vdijoEdWKyefkp2zM0+4NvBGFUGPjolg7bR01pmnL
 2wjEZn3najrPuLSZIm+2T3psnF7yyPsmWghYLiyPnP2sYuXUr+IuWtdPAZ031iBgBVTQcm
 pWuntAnlhIYjsUr3rVYVRI0C0a66WrI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-mRg7fXu0PCChtHoZWSM8dA-1; Tue, 01 Feb 2022 10:02:43 -0500
X-MC-Unique: mRg7fXu0PCChtHoZWSM8dA-1
Received: by mail-ed1-f70.google.com with SMTP id
 n7-20020a05640205c700b0040b7be76147so4311311edx.10
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 07:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oZXW4ikWwqlgBCRGnwXxFczGKcuCYa2j1IpHwO1T0Pw=;
 b=SzfUH5Bfa8JIpvfKh4mt641fHzFNl6Tv9aEDUMgsSgwh7eem7xrlA0+Gw+ANzh8F4h
 spOJHjVDgEU33h3TvmdmaP0un87Cvf/H49FKzVZkYWrMq034m24ZS+4xrnyXgdW7WmC0
 9Ga2lKa57IsIZ9TveMqIPzVQYxOdSjfQO/sxAqd6jeVNxpN7vspPAZywkzj/UbaMW07a
 mCMR6RFsOuGt5kNTrBpsEQD1fH3Gv5VHxdGtxIVD5QupSTz96jSWH0c9+CGghJO+O6Ze
 PuLfNM7WdZrvV4QZQF79LjKylAzPtB64EAWKd808FQBbwCTk4nMbX2elyqJLDSePxiuq
 WQ8w==
X-Gm-Message-State: AOAM533SGN4Nlpc81oNGOmoqUZu8iooUdvm3EsHyiXDIZYER0+ejlkSC
 SDrnMnzBtH5UlAFH4fM39ifztBBsb/sNzm+6bDxh6MNl8JtXD1DzAL+RKwIpmr/KolA9YoPykaQ
 +xO7kFCTEivcsGXCCItvOWvQ=
X-Received: by 2002:a05:6402:16cf:: with SMTP id
 r15mr25756613edx.406.1643727762668; 
 Tue, 01 Feb 2022 07:02:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvCpVCBTZrtA2YZxbuCtFtMF8gZFN+tTu4VLRzWngSgADBV/xCYwrHYjRoBuJPzr957Nv0tA==
X-Received: by 2002:a05:6402:16cf:: with SMTP id
 r15mr25756583edx.406.1643727762415; 
 Tue, 01 Feb 2022 07:02:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id pg25sm14900182ejb.174.2022.02.01.07.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 07:02:41 -0800 (PST)
Message-ID: <71094091-56ca-0f75-a9c7-fa1cabf2af22@redhat.com>
Date: Tue, 1 Feb 2022 16:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 7/9] platform/x86: serial-multi-instantiate: Add SPI
 support
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-8-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-8-sbinding@opensource.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org
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

Hi,

On 1/21/22 18:24, Stefan Binding wrote:
> Add support for spi bus in serial-multi-instantiate driver
> 
> Some peripherals can have either a I2C or a SPI connection
> to the host (but not both) but use the same HID for both
> types. So it is not possible to use the HID to determine
> whether it is I2C or SPI. The driver must check the node
> to see if it contains I2cSerialBus or SpiSerialBus entries.
> 
> For backwards-compatibility with the existing nodes I2C is
> checked first and if such entries are found ONLY I2C devices
> are created. Since some existing nodes that were already
> handled by this driver could also contain unrelated
> SpiSerialBus nodes that were previously ignored, and this
> preserves that behavior. If there is ever a need to handle
> a node where both I2C and SPI devices must be instantiated
> this can be added in future.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  drivers/platform/x86/Kconfig                  |   2 +-
>  .../platform/x86/serial-multi-instantiate.c   | 174 +++++++++++++++---
>  2 files changed, 151 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2e656909a866..8d1eec208854 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -992,7 +992,7 @@ config TOPSTAR_LAPTOP
>  
>  config SERIAL_MULTI_INSTANTIATE
>  	tristate "Serial bus multi instantiate pseudo device driver"
> -	depends on I2C && ACPI
> +	depends on I2C && SPI && ACPI
>  	help
>  	  Some ACPI-based systems list multiple devices in a single ACPI
>  	  firmware-node. This driver will instantiate separate clients
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 4cd6d72a0741..3f05385ca2cf 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/spi/spi.h>
>  #include <linux/types.h>
>  
>  #define IRQ_RESOURCE_TYPE	GENMASK(1, 0)
> @@ -21,15 +22,28 @@
>  #define IRQ_RESOURCE_GPIO	1
>  #define IRQ_RESOURCE_APIC	2
>  
> +enum smi_bus_type {
> +	SMI_I2C,
> +	SMI_SPI,
> +	SMI_AUTO_DETECT,
> +};
> +
>  struct smi_instance {
>  	const char *type;
>  	unsigned int flags;
>  	int irq_idx;
>  };
>  
> +struct smi_node {
> +	enum smi_bus_type bus_type;
> +	struct smi_instance instances[];
> +};
> +
>  struct smi {
>  	int i2c_num;
> +	int spi_num;
>  	struct i2c_client **i2c_devs;
> +	struct spi_device **spi_devs;
>  };
>  
>  static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
> @@ -59,6 +73,95 @@ static void smi_devs_unregister(struct smi *smi)
>  {
>  	while (smi->i2c_num > 0)
>  		i2c_unregister_device(smi->i2c_devs[--smi->i2c_num]);
> +
> +	while (smi->spi_num > 0)
> +		spi_unregister_device(smi->spi_devs[--smi->spi_num]);
> +}
> +
> +/**
> + * smi_spi_probe - Instantiate multiple SPI devices from inst array
> + * @pdev:	Platform device
> + * @adev:	ACPI device
> + * @smi:	Internal struct for Serial multi instantiate driver
> + * @inst_array:	Array of instances to probe
> + *
> + * Returns the number of SPI devices instantiate, Zero if none is found or a negative error code.
> + */
> +static int smi_spi_probe(struct platform_device *pdev, struct acpi_device *adev, struct smi *smi,
> +			 const struct smi_instance *inst_array)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct spi_controller *ctlr;
> +	struct spi_device *spi_dev;
> +	char name[50];
> +	int i, ret, count;
> +
> +	ret = acpi_spi_count_resources(adev);
> +	if (ret < 0)
> +		return ret;
> +	else if (!ret)
> +		return -ENODEV;
> +
> +	count = ret;
> +
> +	smi->spi_devs = devm_kcalloc(dev, count, sizeof(*smi->spi_devs), GFP_KERNEL);
> +	if (!smi->spi_devs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < count && inst_array[i].type; i++) {
> +
> +		spi_dev = acpi_spi_device_alloc(NULL, adev, i);
> +		if (IS_ERR(spi_dev)) {
> +			ret = PTR_ERR(spi_dev);
> +			dev_err_probe(dev, ret, "failed to allocate SPI device %s from ACPI: %d\n",
> +				      dev_name(&adev->dev), ret);
> +			goto error;
> +		}
> +
> +		ctlr = spi_dev->controller;
> +
> +		strscpy(spi_dev->modalias, inst_array[i].type, sizeof(spi_dev->modalias));
> +
> +		ret = smi_get_irq(pdev, adev, &inst_array[i]);
> +		if (ret < 0) {
> +			spi_dev_put(spi_dev);
> +			goto error;
> +		}
> +		spi_dev->irq = ret;
> +
> +		snprintf(name, sizeof(name), "%s-%s-%s.%d", dev_name(&ctlr->dev), dev_name(dev),
> +			 inst_array[i].type, i);
> +		spi_dev->dev.init_name = name;
> +
> +		ret = spi_add_device(spi_dev);
> +		if (ret) {
> +			dev_err_probe(&ctlr->dev, ret,
> +				      "failed to add SPI device %s from ACPI: %d\n",
> +				      dev_name(&adev->dev), ret);
> +			spi_dev_put(spi_dev);
> +			goto error;
> +		}
> +
> +		dev_dbg(dev, "SPI device %s using chip select %u", name, spi_dev->chip_select);
> +
> +		smi->spi_devs[i] = spi_dev;
> +		smi->spi_num++;
> +	}
> +
> +	if (smi->spi_num < count) {
> +		dev_dbg(dev, "Error finding driver, idx %d\n", i);
> +		ret = -ENODEV;
> +		goto error;
> +	}
> +
> +	dev_info(dev, "Instantiated %d SPI devices.\n", smi->spi_num);
> +
> +	return 0;
> +error:
> +	smi_devs_unregister(smi);
> +
> +	return ret;
> +
>  }
>  
>  /**
> @@ -126,8 +229,8 @@ static int smi_i2c_probe(struct platform_device *pdev, struct acpi_device *adev,
>  
>  static int smi_probe(struct platform_device *pdev)
>  {
> -	const struct smi_instance *inst_array;
>  	struct device *dev = &pdev->dev;
> +	const struct smi_node *node;
>  	struct acpi_device *adev;
>  	struct smi *smi;
>  
> @@ -135,8 +238,8 @@ static int smi_probe(struct platform_device *pdev)
>  	if (!adev)
>  		return -ENODEV;
>  
> -	inst_array = device_get_match_data(dev);
> -	if (!inst_array) {
> +	node = device_get_match_data(dev);
> +	if (!node) {
>  		dev_dbg(dev, "Error ACPI match data is missing\n");
>  		return -ENODEV;
>  	}
> @@ -147,7 +250,21 @@ static int smi_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, smi);
>  
> -	return smi_i2c_probe(pdev, adev, smi, inst_array);
> +	switch (node->bus_type) {
> +	case SMI_I2C:
> +		return smi_i2c_probe(pdev, adev, smi, node->instances);
> +	case SMI_SPI:
> +		return smi_spi_probe(pdev, adev, smi, node->instances);
> +	case SMI_AUTO_DETECT:
> +		if (i2c_acpi_client_count(adev) > 0)
> +			return smi_i2c_probe(pdev, adev, smi, node->instances);
> +		else
> +			return smi_spi_probe(pdev, adev, smi, node->instances);
> +	default:
> +		break;

Please replace this break with : "return -EINVAL" (since we really
should never hit this default case).

With that fixed, please add my R-b to the next version:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> +	}
> +
> +	return 0; /* never reached */
>  }
>  
>  static int smi_remove(struct platform_device *pdev)
> @@ -159,27 +276,36 @@ static int smi_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct smi_instance bsg1160_data[]  = {
> -	{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
> -	{ "bmc150_magn" },
> -	{ "bmg160" },
> -	{}
> +static const struct smi_node bsg1160_data = {
> +	.instances = {
> +		{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
> +		{ "bmc150_magn" },
> +		{ "bmg160" },
> +		{}
> +	},
> +	.bus_type = SMI_I2C,
>  };
>  
> -static const struct smi_instance bsg2150_data[]  = {
> -	{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
> -	{ "bmc150_magn" },
> -	/* The resources describe a 3th client, but it is not really there. */
> -	{ "bsg2150_dummy_dev" },
> -	{}
> +static const struct smi_node bsg2150_data = {
> +	.instances = {
> +		{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
> +		{ "bmc150_magn" },
> +		/* The resources describe a 3th client, but it is not really there. */
> +		{ "bsg2150_dummy_dev" },
> +		{}
> +	},
> +	.bus_type = SMI_I2C,
>  };
>  
> -static const struct smi_instance int3515_data[]  = {
> -	{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
> -	{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
> -	{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
> -	{ "tps6598x", IRQ_RESOURCE_APIC, 3 },
> -	{}
> +static const struct smi_node int3515_data = {
> +	.instances = {
> +		{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
> +		{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
> +		{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
> +		{ "tps6598x", IRQ_RESOURCE_APIC, 3 },
> +		{}
> +	},
> +	.bus_type = SMI_I2C,
>  };
>  
>  /*
> @@ -187,9 +313,9 @@ static const struct smi_instance int3515_data[]  = {
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>   */
>  static const struct acpi_device_id smi_acpi_ids[] = {
> -	{ "BSG1160", (unsigned long)bsg1160_data },
> -	{ "BSG2150", (unsigned long)bsg2150_data },
> -	{ "INT3515", (unsigned long)int3515_data },
> +	{ "BSG1160", (unsigned long)&bsg1160_data },
> +	{ "BSG2150", (unsigned long)&bsg2150_data },
> +	{ "INT3515", (unsigned long)&int3515_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, smi_acpi_ids);
> 

