Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 049624A5EB4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 15:56:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6EDC17E6;
	Tue,  1 Feb 2022 15:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6EDC17E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643727411;
	bh=adnT6Y5btmpGJ8V+Zsv/o8s2hAwfrGN8jj/e29uvgkM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nuHJG1Y/OGSmm9hbxzZ3iFCnz/LC4vn5KFuwce2Gkx0Lk1ffFYFh0rGQ5IbA8AyeS
	 43rQnka37XdwfbNJOReKEhfbOR8Hs/Xbhuy+LUYc0iGkAlkqpyNOoakSRlKKesAhjK
	 aA6ywBR1+WlgjHPxJKnBEaBh3cS6Mil50DMm8qZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DBBAF80089;
	Tue,  1 Feb 2022 15:56:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47243F80130; Tue,  1 Feb 2022 15:55:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64CD5F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 15:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64CD5F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AG3jq7Jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643727351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYh+QaAtf8lTpXUCd9OATCvMzzj1cElaALeswGwuCzo=;
 b=AG3jq7Jo/0koCCXhM7D4Ly1LwJJ8cAOBUjYTnuWRxyLPJVHAqmMJc3RlXCwSITK7LwCX7E
 kRGnyJPsEmWPn3fJUbB0sfoqdcqhxx2wbHE8nRVF2WxRWDorghLnIAQXE9rpdYFqRTSWU+
 CAEtCKsIP+PxhPejjL+8grmridjeIa8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-OOroyKWeNUSoRAxbJ80hWw-1; Tue, 01 Feb 2022 09:55:50 -0500
X-MC-Unique: OOroyKWeNUSoRAxbJ80hWw-1
Received: by mail-ed1-f70.google.com with SMTP id
 h21-20020aa7c955000000b0040390b2bfc5so8790243edt.15
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 06:55:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tYh+QaAtf8lTpXUCd9OATCvMzzj1cElaALeswGwuCzo=;
 b=j8DZeio1mqKLDDp41UARRmEJaGjm+3LRQMakxAK2dIq/CW4qt7tEL+9XNBeWqLJ3Tc
 zDER+IHhE254Fy3P2DAkxHOqJHXCguCKqoRc4yvxmr3Dk8XC/hcppHQE9Ka1hB+087Uo
 L0o6+djFx0baeJ+UV+RqAm2WmUigBCaH8ehYcBkvR6AJlZK5ZcHwlvWnvotnxGtVw6uX
 EPFAgjvfF2JrpcI1FEsJg3B0uNAnM2kzh40CkLv6xYE/dBECEiHzHI5nFZsgazhOwiFV
 iuJ6Cim2fCn5Nxmd3gLqsROIMYrWcUaUZqWZf6vQ1TUC4lVsSHH4OwKwkYxPhtXMdv25
 Gvxg==
X-Gm-Message-State: AOAM533TC1QDUhzDBVvnAHyKo4K/L6Wb9T0+Py24pKmFJaL+bgL4iHhZ
 jI16ftIbUWQKjY43plWDAyu3kTDNLw0+qGs+Wx585Gl353tRKqbGrc1OdU4hwGsEoropM5QWcYj
 liViYkQwOD2NBM5z8PO/lDss=
X-Received: by 2002:a17:906:2a91:: with SMTP id
 l17mr20665851eje.245.1643727349464; 
 Tue, 01 Feb 2022 06:55:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOfd9zKq15m/IjdSYVRVNsuh8qaYCmOtysVEldK1wLQHYHJExGsH3L6G+WF5GF+vfl2Ufimg==
X-Received: by 2002:a17:906:2a91:: with SMTP id
 l17mr20665819eje.245.1643727349121; 
 Tue, 01 Feb 2022 06:55:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id kq16sm14581782ejb.163.2022.02.01.06.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:55:48 -0800 (PST)
Message-ID: <f8e3502a-6e01-8df6-be66-ef0c3e1b7446@redhat.com>
Date: Tue, 1 Feb 2022 15:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 5/9] platform/x86: i2c-multi-instantiate: Rename it for
 a generic serial driver name
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-6-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-6-sbinding@opensource.cirrus.com>
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

On 1/21/22 18:24, Stefan Binding wrote:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> Rename I2C multi instantiate driver to serial-multi-instantiate for
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
>  drivers/acpi/scan.c                           | 13 +--
>  drivers/platform/x86/Kconfig                  | 10 +-
>  drivers/platform/x86/Makefile                 |  2 +-
>  ...stantiate.c => serial-multi-instantiate.c} | 91 +++++++++----------
>  5 files changed, 60 insertions(+), 60 deletions(-)
>  rename drivers/platform/x86/{i2c-multi-instantiate.c => serial-multi-instantiate.c} (51%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e828542b089..be50537ea6bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -388,11 +388,11 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/acpi/arm64
>  
> -ACPI I2C MULTI INSTANTIATE DRIVER
> +ACPI SERIAL MULTI INSTANTIATE DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/i2c-multi-instantiate.c
> +F:	drivers/platform/x86/serial-multi-instantiate.c
>  
>  ACPI PCC(Platform Communication Channel) MAILBOX DRIVER
>  M:	Sudeep Holla <sudeep.holla@arm.com>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 1331756d4cfc..48db5e80c2dc 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1734,12 +1734,13 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  	bool is_serial_bus_slave = false;
>  	static const struct acpi_device_id ignore_serial_bus_ids[] = {
>  	/*
> -	 * These devices have multiple I2cSerialBus resources and an i2c-client
> -	 * must be instantiated for each, each with its own i2c_device_id.
> -	 * Normally we only instantiate an i2c-client for the first resource,
> -	 * using the ACPI HID as id. These special cases are handled by the
> -	 * drivers/platform/x86/i2c-multi-instantiate.c driver, which knows
> -	 * which i2c_device_id to use for each resource.
> +	 * These devices have multiple SerialBus resources and a client
> +	 * device must be instantiated for each of them, each with
> +	 * its own device id.
> +	 * Normally we only instantiate one client device for the first
> +	 * resource, using the ACPI HID as id. These special cases are handled
> +	 * by the drivers/platform/x86/serial-multi-instantiate.c driver, which
> +	 * knows which client device id to use for each resource.
>  	 */
>  		{"BSG1160", },
>  		{"BSG2150", },
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 24deeeb29af2..2e656909a866 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -990,16 +990,16 @@ config TOPSTAR_LAPTOP
>  
>  	  If you have a Topstar laptop, say Y or M here.
>  
> -config I2C_MULTI_INSTANTIATE
> -	tristate "I2C multi instantiate pseudo device driver"
> +config SERIAL_MULTI_INSTANTIATE
> +	tristate "Serial bus multi instantiate pseudo device driver"
>  	depends on I2C && ACPI
>  	help
> -	  Some ACPI-based systems list multiple i2c-devices in a single ACPI
> -	  firmware-node. This driver will instantiate separate i2c-clients
> +	  Some ACPI-based systems list multiple devices in a single ACPI
> +	  firmware-node. This driver will instantiate separate clients
>  	  for each device in the firmware-node.
>  
>  	  To compile this driver as a module, choose M here: the module
> -	  will be called i2c-multi-instantiate.
> +	  will be called serial-multi-instantiate.
>  
>  config MLX_PLATFORM
>  	tristate "Mellanox Technologies platform support"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index c12a9b044fd8..9527088bba7f 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -110,7 +110,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
>  
>  # Platform drivers
>  obj-$(CONFIG_FW_ATTR_CLASS)		+= firmware_attributes_class.o
> -obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
> +obj-$(CONFIG_SERIAL_MULTI_INSTANTIATE)	+= serial-multi-instantiate.o
>  obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
>  obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> similarity index 51%
> rename from drivers/platform/x86/i2c-multi-instantiate.c
> rename to drivers/platform/x86/serial-multi-instantiate.c
> index 4956a1df5b90..33cbb0caed33 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * I2C multi-instantiate driver, pseudo driver to instantiate multiple
> - * i2c-clients from a single fwnode.
> + * Serial multi-instantiate driver, pseudo driver to instantiate multiple
> + * client devices from a single fwnode.
>   *
>   * Copyright 2018 Hans de Goede <hdegoede@redhat.com>
>   */
> @@ -21,29 +21,29 @@
>  #define IRQ_RESOURCE_GPIO	1
>  #define IRQ_RESOURCE_APIC	2
>  
> -struct i2c_inst_data {
> +struct smi_instance {
>  	const char *type;
>  	unsigned int flags;
>  	int irq_idx;
>  };
>  
> -struct i2c_multi_inst_data {
> -	int num_clients;
> -	struct i2c_client *clients[];
> +struct smi {
> +	int i2c_num;
> +	struct i2c_client *i2c_devs[];
>  };
>  
> -static int i2c_multi_inst_probe(struct platform_device *pdev)
> +static int smi_probe(struct platform_device *pdev)
>  {
> -	struct i2c_multi_inst_data *multi;
> -	const struct i2c_inst_data *inst_data;
>  	struct i2c_board_info board_info = {};
> +	const struct smi_instance *inst;
>  	struct device *dev = &pdev->dev;
>  	struct acpi_device *adev;
> +	struct smi *smi;
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
> +	smi = devm_kmalloc(dev, struct_size(smi, i2c_devs, ret), GFP_KERNEL);
> +	if (!smi)
>  		return -ENOMEM;
>  
> -	multi->num_clients = ret;
> +	smi->i2c_num = ret;
>  
> -	for (i = 0; i < multi->num_clients && inst_data[i].type; i++) {
> +	for (i = 0; i < smi->i2c_num && inst[i].type; i++) {
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
> +		smi->i2c_devs[i] = i2c_acpi_new_device(dev, i, &board_info);
> +		if (IS_ERR(smi->i2c_devs[i])) {
> +			ret = dev_err_probe(dev, PTR_ERR(smi->i2c_devs[i]),
>  					    "Error creating i2c-client, idx %d\n", i);
>  			goto error;
>  		}
>  	}
> -	if (i < multi->num_clients) {
> +	if (i < smi->i2c_num) {
>  		dev_err(dev, "Error finding driver, idx %d\n", i);
>  		ret = -ENODEV;
>  		goto error;
>  	}
>  
> -	platform_set_drvdata(pdev, multi);
> +	platform_set_drvdata(pdev, smi);
>  	return 0;
>  
>  error:
>  	while (--i >= 0)
> -		i2c_unregister_device(multi->clients[i]);
> +		i2c_unregister_device(smi->i2c_devs[i]);
>  
>  	return ret;
>  }
>  
> -static int i2c_multi_inst_remove(struct platform_device *pdev)
> +static int smi_remove(struct platform_device *pdev)
>  {
> -	struct i2c_multi_inst_data *multi = platform_get_drvdata(pdev);
> +	struct smi *smi = platform_get_drvdata(pdev);
>  	int i;
>  
> -	for (i = 0; i < multi->num_clients; i++)
> -		i2c_unregister_device(multi->clients[i]);
> +	for (i = 0; i < smi->i2c_num; i++)
> +		i2c_unregister_device(smi->i2c_devs[i]);
>  
>  	return 0;
>  }
>  
> -static const struct i2c_inst_data bsg1160_data[]  = {
> +static const struct smi_instance bsg1160_data[]  = {
>  	{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
>  	{ "bmc150_magn" },
>  	{ "bmg160" },
>  	{}
>  };
>  
> -static const struct i2c_inst_data bsg2150_data[]  = {
> +static const struct smi_instance bsg2150_data[]  = {
>  	{ "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
>  	{ "bmc150_magn" },
>  	/* The resources describe a 3th client, but it is not really there. */
> @@ -139,7 +138,7 @@ static const struct i2c_inst_data bsg2150_data[]  = {
>  	{}
>  };
>  
> -static const struct i2c_inst_data int3515_data[]  = {
> +static const struct smi_instance int3515_data[]  = {
>  	{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
>  	{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
>  	{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
> @@ -148,27 +147,27 @@ static const struct i2c_inst_data int3515_data[]  = {
>  };
>  
>  /*
> - * Note new device-ids must also be added to i2c_multi_instantiate_ids in
> + * Note new device-ids must also be added to serial_multi_instantiate_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>   */
> -static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
> +static const struct acpi_device_id smi_acpi_ids[] = {
>  	{ "BSG1160", (unsigned long)bsg1160_data },
>  	{ "BSG2150", (unsigned long)bsg2150_data },
>  	{ "INT3515", (unsigned long)int3515_data },
>  	{ }
>  };
> -MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
> +MODULE_DEVICE_TABLE(acpi, smi_acpi_ids);
>  
> -static struct platform_driver i2c_multi_inst_driver = {
> +static struct platform_driver smi_driver = {
>  	.driver	= {
> -		.name = "I2C multi instantiate pseudo device driver",
> -		.acpi_match_table = i2c_multi_inst_acpi_ids,
> +		.name = "Serial bus multi instantiate pseudo device driver",
> +		.acpi_match_table = smi_acpi_ids,
>  	},
> -	.probe = i2c_multi_inst_probe,
> -	.remove = i2c_multi_inst_remove,
> +	.probe = smi_probe,
> +	.remove = smi_remove,
>  };
> -module_platform_driver(i2c_multi_inst_driver);
> +module_platform_driver(smi_driver);
>  
> -MODULE_DESCRIPTION("I2C multi instantiate pseudo device driver");
> +MODULE_DESCRIPTION("Serial multi instantiate pseudo device driver");
>  MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
>  MODULE_LICENSE("GPL");
> 

