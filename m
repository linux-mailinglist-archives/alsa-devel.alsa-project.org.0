Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12494950F9
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 16:06:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 929482E2D;
	Thu, 20 Jan 2022 16:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 929482E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642691191;
	bh=lE6Ecbd+351d3T5P64Eru2aSge9LsQ1PYsITAwgJFro=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vWZ6N99XkhpjOukyPyXjBPikZt89XVmXO2MIgogAsLORX8yL5BSeCb3LDQqsAiR+S
	 tqiQR241VdsmNjru0CxgKa6qnnoO6hEmKgt5mUaSgJ1AN+8BQVkU3UgW7JDUl2AZYQ
	 EE8YgidqRPkVcgfbX/RVJaxE25zcrkJ52symJqcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B3E2F8012E;
	Thu, 20 Jan 2022 16:05:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DABD0F80128; Thu, 20 Jan 2022 16:05:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13DDCF80134
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 16:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DDCF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="I254SOZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642691129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MznXZkr8tTainEeJK/O5yHKZF4B5LxQN1m2M1Hu0BmA=;
 b=I254SOZuvTj9DkzgQNXIHQ35Cf7xFfl8Y38FnwVMbZnihCp3UIYSnpE+ZPNfo7ELCmaHeS
 kLhJoamsplkEVnw4WQaTCM56+F2MWLl6jbqHo/fFI/ErttppFxP7q08ItZiWC154nJpfiu
 sBd55SWW9ykLwm8azTE+87svcTFAyMg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-CclXzqKFNACi0y7BgwxiRA-1; Thu, 20 Jan 2022 10:05:28 -0500
X-MC-Unique: CclXzqKFNACi0y7BgwxiRA-1
Received: by mail-ed1-f72.google.com with SMTP id
 z6-20020a50eb46000000b00403a7687b5bso6140258edp.3
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 07:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MznXZkr8tTainEeJK/O5yHKZF4B5LxQN1m2M1Hu0BmA=;
 b=gh47ilQAVjtBZAQBS4qg72eO4zv1NMDpIk6UJlNLhpwxf4Z34dJMNb5r6qYp8OVujq
 x1cixhT/edduboIInxAMCgZYgd+8Lg8TkLCVHX1SuWVnPOUoB3z3DOLZvcSNmwaUooeD
 nzBixM8vZIRM2iZoUKQBnD6VFeqQV3RTuX+NpQwudFYOxb98+pGmMR31I010/Y7ohaWp
 wPmYx3dqJctYp0Tp33/GlWV/cC3ANpKSrI0EdrRodJ8petnduuCgmIoUxqc7tVAcePMw
 S7KPPg18/ykYCg0QrGMKu1SJlyL2rv5zvyYA/NQSHOEGdatoQQ/XA4yX1eVW5JcRngMB
 EL3g==
X-Gm-Message-State: AOAM532remVfa2tFpERPKPP04AQ7Ex4gO1o9lVyUPuI985DucrcAeNez
 UjFGmiypaXTWkcSZmAwbHZp/L4LrrzDmyd1D87UzYCi4D97Ih4X4+r51/sxSKislf9oGAOzqZ/j
 J9OLiseaOhPfw0/GUu5UC3zE=
X-Received: by 2002:a05:6402:51cf:: with SMTP id
 r15mr12733234edd.213.1642691125899; 
 Thu, 20 Jan 2022 07:05:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8pajs2mclo/rm8r6p03vqAxOEyh0ynJepbI8o1LXwvuQCgBXURSpknXKm63OybRCAXjuL3w==
X-Received: by 2002:a05:6402:51cf:: with SMTP id
 r15mr12733209edd.213.1642691125605; 
 Thu, 20 Jan 2022 07:05:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id pg25sm1135150ejb.174.2022.01.20.07.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 07:05:25 -0800 (PST)
Message-ID: <f65fd55b-2e51-6682-bdad-97f9a05c8c17@redhat.com>
Date: Thu, 20 Jan 2022 16:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 5/9] platform/x86: i2c-multi-instantiate: Rename it for
 a generic bus driver name
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
 <20220120134326.5295-6-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120134326.5295-6-sbinding@opensource.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-spi@vger.kernel.org
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

On 1/20/22 14:43, Stefan Binding wrote:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> Rename I2C multi instantiate driver to bus-multi-instantiate for
> upcoming addition of SPI support
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  MAINTAINERS                                   |  4 +-
>  drivers/acpi/scan.c                           |  2 +-
>  drivers/platform/x86/Kconfig                  |  4 +-
>  drivers/platform/x86/Makefile                 |  2 +-
>  ...-instantiate.c => bus-multi-instantiate.c} | 89 +++++++++----------
>  5 files changed, 50 insertions(+), 51 deletions(-)
>  rename drivers/platform/x86/{i2c-multi-instantiate.c => bus-multi-instantiate.c} (53%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e828542b089..4a7e3cff9245 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -388,11 +388,11 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/acpi/arm64
>  
> -ACPI I2C MULTI INSTANTIATE DRIVER
> +ACPI BUS MULTI INSTANTIATE DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/i2c-multi-instantiate.c
> +F:	drivers/platform/x86/bus-multi-instantiate.c
>  
>  ACPI PCC(Platform Communication Channel) MAILBOX DRIVER
>  M:	Sudeep Holla <sudeep.holla@arm.com>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 1331756d4cfc..e4fda14572e7 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1738,7 +1738,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  	 * must be instantiated for each, each with its own i2c_device_id.
>  	 * Normally we only instantiate an i2c-client for the first resource,
>  	 * using the ACPI HID as id. These special cases are handled by the
> -	 * drivers/platform/x86/i2c-multi-instantiate.c driver, which knows
> +	 * drivers/platform/x86/bus-multi-instantiate.c driver, which knows
>  	 * which i2c_device_id to use for each resource.
>  	 */
>  		{"BSG1160", },
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 24deeeb29af2..616da06aa6b9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -990,7 +990,7 @@ config TOPSTAR_LAPTOP
>  
>  	  If you have a Topstar laptop, say Y or M here.
>  
> -config I2C_MULTI_INSTANTIATE
> +config BUS_MULTI_INSTANTIATE
>  	tristate "I2C multi instantiate pseudo device driver"
>  	depends on I2C && ACPI
>  	help
> @@ -999,7 +999,7 @@ config I2C_MULTI_INSTANTIATE
>  	  for each device in the firmware-node.
>  
>  	  To compile this driver as a module, choose M here: the module
> -	  will be called i2c-multi-instantiate.
> +	  will be called bus-multi-instantiate.
>  
>  config MLX_PLATFORM
>  	tristate "Mellanox Technologies platform support"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index c12a9b044fd8..b5852e3fbab1 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -110,7 +110,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
>  
>  # Platform drivers
>  obj-$(CONFIG_FW_ATTR_CLASS)		+= firmware_attributes_class.o
> -obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
> +obj-$(CONFIG_BUS_MULTI_INSTANTIATE)	+= bus-multi-instantiate.o
>  obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
>  obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/bus-multi-instantiate.c
> similarity index 53%
> rename from drivers/platform/x86/i2c-multi-instantiate.c
> rename to drivers/platform/x86/bus-multi-instantiate.c
> index 4956a1df5b90..982dfecfd27c 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/bus-multi-instantiate.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * I2C multi-instantiate driver, pseudo driver to instantiate multiple
> + * Bus multi-instantiate driver, pseudo driver to instantiate multiple
>   * i2c-clients from a single fwnode.
>   *
>   * Copyright 2018 Hans de Goede <hdegoede@redhat.com>
> @@ -21,29 +21,29 @@
>  #define IRQ_RESOURCE_GPIO	1
>  #define IRQ_RESOURCE_APIC	2
>  
> -struct i2c_inst_data {
> +struct bmi_instance {
>  	const char *type;
>  	unsigned int flags;
>  	int irq_idx;
>  };
>  
> -struct i2c_multi_inst_data {
> -	int num_clients;
> -	struct i2c_client *clients[];
> +struct bmi {
> +	int i2c_num;
> +	struct i2c_client *i2c_devs[];
>  };
>  
> -static int i2c_multi_inst_probe(struct platform_device *pdev)
> +static int bmi_probe(struct platform_device *pdev)
>  {
> -	struct i2c_multi_inst_data *multi;
> -	const struct i2c_inst_data *inst_data;
>  	struct i2c_board_info board_info = {};
> +	const struct bmi_instance *inst;
>  	struct device *dev = &pdev->dev;
>  	struct acpi_device *adev;
> +	struct bmi *bmi;
>  	char name[32];
>  	int i, ret;
>  
> -	inst_data = device_get_match_data(dev);
> -	if (!inst_data) {
> +	inst = device_get_match_data(dev);
> +	if (!inst) {
>  		dev_err(dev, "Error ACPI match data is missing\n");
>  		return -ENODEV;
>  	}
> @@ -55,33 +55,32 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	multi = devm_kmalloc(dev, struct_size(multi, clients, ret), GFP_KERNEL);
> -	if (!multi)
> +	bmi = devm_kmalloc(dev, struct_size(bmi, i2c_devs, ret), GFP_KERNEL);
> +	if (!bmi)
>  		return -ENOMEM;
>  
> -	multi->num_clients = ret;
> +	bmi->i2c_num = ret;
>  
> -	for (i = 0; i < multi->num_clients && inst_data[i].type; i++) {
> +	for (i = 0; i < bmi->i2c_num && inst[i].type; i++) {
>  		memset(&board_info, 0, sizeof(board_info));
> -		strlcpy(board_info.type, inst_data[i].type, I2C_NAME_SIZE);
> -		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
> -			 inst_data[i].type, i);
> +		strlcpy(board_info.type, inst[i].type, I2C_NAME_SIZE);
> +		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst[i].type, i);
>  		board_info.dev_name = name;
> -		switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
> +		switch (inst[i].flags & IRQ_RESOURCE_TYPE) {
>  		case IRQ_RESOURCE_GPIO:
> -			ret = acpi_dev_gpio_irq_get(adev, inst_data[i].irq_idx);
> +			ret = acpi_dev_gpio_irq_get(adev, inst[i].irq_idx);
>  			if (ret < 0) {
>  				dev_err(dev, "Error requesting irq at index %d: %d\n",
> -					inst_data[i].irq_idx, ret);
> +						inst[i].irq_idx, ret);
>  				goto error;
>  			}
>  			board_info.irq = ret;
>  			break;
>  		case IRQ_RESOURCE_APIC:
> -			ret = platform_get_irq(pdev, inst_data[i].irq_idx);
> +			ret = platform_get_irq(pdev, inst[i].irq_idx);
>  			if (ret < 0) {
>  				dev_dbg(dev, "Error requesting irq at index %d: %d\n",
> -					inst_data[i].irq_idx, ret);
> +					inst[i].irq_idx, ret);
>  				goto error;
>  			}
>  			board_info.irq = ret;
> @@ -90,48 +89,48 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>  			board_info.irq = 0;
>  			break;
>  		}
> -		multi->clients[i] = i2c_acpi_new_device(dev, i, &board_info);
> -		if (IS_ERR(multi->clients[i])) {
> -			ret = dev_err_probe(dev, PTR_ERR(multi->clients[i]),
> +		bmi->i2c_devs[i] = i2c_acpi_new_device(dev, i, &board_info);
> +		if (IS_ERR(bmi->i2c_devs[i])) {
> +			ret = dev_err_probe(dev, PTR_ERR(bmi->i2c_devs[i]),
>  					    "Error creating i2c-client, idx %d\n", i);
>  			goto error;
>  		}
>  	}
> -	if (i < multi->num_clients) {
> +	if (i < bmi->i2c_num) {
>  		dev_err(dev, "Error finding driver, idx %d\n", i);
>  		ret = -ENODEV;
>  		goto error;
>  	}
>  
> -	platform_set_drvdata(pdev, multi);
> +	platform_set_drvdata(pdev, bmi);
>  	return 0;
>  
>  error:
>  	while (--i >= 0)
> -		i2c_unregister_device(multi->clients[i]);
> +		i2c_unregister_device(bmi->i2c_devs[i]);
>  
>  	return ret;
>  }
>  
> -static int i2c_multi_inst_remove(struct platform_device *pdev)
> +static int bmi_remove(struct platform_device *pdev)
>  {
> -	struct i2c_multi_inst_data *multi = platform_get_drvdata(pdev);
> +	struct bmi *bmi = platform_get_drvdata(pdev);
>  	int i;
>  
> -	for (i = 0; i < multi->num_clients; i++)
> -		i2c_unregister_device(multi->clients[i]);
> +	for (i = 0; i < bmi->i2c_num; i++)
> +		i2c_unregister_device(bmi->i2c_devs[i]);
>  
>  	return 0;
>  }
>  
> -static const struct i2c_inst_data bsg1160_data[]  = {
> +static const struct bmi_instance bsg1160_data[]  = {
>  	{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
>  	{ "bmc150_magn" },
>  	{ "bmg160" },
>  	{}
>  };
>  
> -static const struct i2c_inst_data bsg2150_data[]  = {
> +static const struct bmi_instance bsg2150_data[]  = {
>  	{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
>  	{ "bmc150_magn" },
>  	/* The resources describe a 3th client, but it is not really there. */
> @@ -139,7 +138,7 @@ static const struct i2c_inst_data bsg2150_data[]  = {
>  	{}
>  };
>  
> -static const struct i2c_inst_data int3515_data[]  = {
> +static const struct bmi_instance int3515_data[]  = {
>  	{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
>  	{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
>  	{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
> @@ -148,27 +147,27 @@ static const struct i2c_inst_data int3515_data[]  = {
>  };
>  
>  /*
> - * Note new device-ids must also be added to i2c_multi_instantiate_ids in
> + * Note new device-ids must also be added to bus_multi_instantiate_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>   */
> -static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
> +static const struct acpi_device_id bmi_acpi_ids[] = {
>  	{ "BSG1160", (unsigned long)bsg1160_data },
>  	{ "BSG2150", (unsigned long)bsg2150_data },
>  	{ "INT3515", (unsigned long)int3515_data },
>  	{ }
>  };
> -MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
> +MODULE_DEVICE_TABLE(acpi, bmi_acpi_ids);
>  
> -static struct platform_driver i2c_multi_inst_driver = {
> +static struct platform_driver bmi_driver = {
>  	.driver	= {
> -		.name = "I2C multi instantiate pseudo device driver",
> -		.acpi_match_table = i2c_multi_inst_acpi_ids,
> +		.name = "Bus multi instantiate pseudo device driver",
> +		.acpi_match_table = bmi_acpi_ids,
>  	},
> -	.probe = i2c_multi_inst_probe,
> -	.remove = i2c_multi_inst_remove,
> +	.probe = bmi_probe,
> +	.remove = bmi_remove,
>  };
> -module_platform_driver(i2c_multi_inst_driver);
> +module_platform_driver(bmi_driver);
>  
> -MODULE_DESCRIPTION("I2C multi instantiate pseudo device driver");
> +MODULE_DESCRIPTION("Bus multi instantiate pseudo device driver");
>  MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
>  MODULE_LICENSE("GPL");
> 

