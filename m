Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB633496224
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 16:32:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 511A42A87;
	Fri, 21 Jan 2022 16:31:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 511A42A87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642779162;
	bh=ghPb6W9mnuBssZw26HQmR3xIwED8it0OFjD9L43IzpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gsm94ftSmctlHE6YOBwpWg/mN+sjnNvymSQmDU6rfpCxgQVcftnFZPQYFvJNtyw9y
	 Pkn7gEu9zr6UaE47pvMQb8V/ja9yyOJ+Ag7MH7LSjE7DH2A15Opd8PiXfEuZUo6fiE
	 uD9dpd7XbQB+ankUgycIwPX3soAIAfK80qzGnblo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7C29F800F8;
	Fri, 21 Jan 2022 16:31:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC87AF8028B; Fri, 21 Jan 2022 16:31:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A913F800F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 16:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A913F800F8
Received: by mail-qt1-f169.google.com with SMTP id p3so4978312qtn.13
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 07:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rME91G10LbMwjd1cUGII2jEQ4QGLXAF7AX0WrqfLbCk=;
 b=uZIhiYFJlVLHjmHUXFfWFvawXfY9lv5PR7frUb2LVGCP8eXI7Mieu8kImJbArvn7fY
 Othkt0aesDJDxDwBFwu+P+Oa0K5sh7wEuLLiO4zitH/jMcbPDXXdXbIJyq6Lw0fQjTXa
 7dqLiGKNz0VnC0FbqpdAjmsvliF4bZyWaeN5xO1n0ts2Iqt3ETnEuSXeVlYWXr7bbr2g
 //P4J3yiIM0e/8sOnoYkbm8n2nA8O8yeS7mU7GvOi+tMhDlMIz8BFXQK3QEpn0yRaoyI
 GCf0m50JzVXkNlHpTLExLFE31KYWX+Y3cuC0Qx+08AX+sqFbTc5uzQNzkjZv0vV63sLF
 dZ6g==
X-Gm-Message-State: AOAM530xzZUyfY4wD+TRS75dQVJwFjb4jObAQjXhT/SU8EuEWeiT6+Ii
 Bf9tLAEANTq9UpUt9r5s66ZPFna8armVD5AHFt9pvI2J
X-Google-Smtp-Source: ABdhPJwNG8YNZiSu4JNAVSf8ki5vZw7/gTxzhAXfN8HWyanvekUYm22BQ4P7TLf+rRHaCPI5SXBR9Lpw94zo7Wjrk80=
X-Received: by 2002:a05:622a:118b:: with SMTP id
 m11mr3625476qtk.369.1642779088105; 
 Fri, 21 Jan 2022 07:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20220121143254.6432-1-sbinding@opensource.cirrus.com>
 <20220121143254.6432-8-sbinding@opensource.cirrus.com>
In-Reply-To: <20220121143254.6432-8-sbinding@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 21 Jan 2022 16:31:17 +0100
Message-ID: <CAJZ5v0gK=-SXUDekg_2DtOuMsn6Ls4gS+nymei2Qa9ZEFvqGcA@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] platform/x86: serial-multi-instantiate: Add SPI
 support
To: Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 patches@opensource.cirrus.com, linux-spi <linux-spi@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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

On Fri, Jan 21, 2022 at 3:33 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
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
>  drivers/acpi/scan.c                           |  13 +-
>  drivers/platform/x86/Kconfig                  |  10 +-
>  .../platform/x86/serial-multi-instantiate.c   | 174 +++++++++++++++---
>  3 files changed, 161 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 8b237eb4e029..38c4f55960f4 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1734,12 +1734,13 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>         bool is_serial_bus_slave = false;
>         static const struct acpi_device_id ignore_serial_bus_ids[] = {
>         /*
> -        * These devices have multiple I2cSerialBus resources and an i2c-client
> -        * must be instantiated for each, each with its own i2c_device_id.
> -        * Normally we only instantiate an i2c-client for the first resource,
> -        * using the ACPI HID as id. These special cases are handled by the
> -        * drivers/platform/x86/serial-multi-instantiate.c driver, which knows
> -        * which i2c_device_id to use for each resource.
> +        * These devices have multiple I2cSerialBus/SpiSerialBus resources
> +        * and an (i2c/spi)-client must be instantiated for each, each with
> +        * its own i2c_device_id/spi_device_id.
> +        * Normally we only instantiate an (i2c/spi)-client for the first
> +        * resource, using the ACPI HID as id. These special cases are handled
> +        * by the drivers/platform/x86/serial-multi-instantiate.c driver, which
> +        * knows which i2c_device_id or spi_device_id to use for each resource.
>          */
>                 {"BSG1160", },
>                 {"BSG2150", },
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 5b65d687f046..28f5bbf0f27a 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -991,12 +991,12 @@ config TOPSTAR_LAPTOP
>           If you have a Topstar laptop, say Y or M here.
>
>  config SERIAL_MULTI_INSTANTIATE
> -       tristate "I2C multi instantiate pseudo device driver"
> -       depends on I2C && ACPI
> +       tristate "I2C and SPI multi instantiate pseudo device driver"
> +       depends on I2C && SPI && ACPI

Should this be (I2C || SPI) && ACPI ?

>         help
> -         Some ACPI-based systems list multiple i2c-devices in a single ACPI
> -         firmware-node. This driver will instantiate separate i2c-clients
> -         for each device in the firmware-node.
> +         Some ACPI-based systems list multiple i2c/spi devices in a
> +         single ACPI firmware-node. This driver will instantiate separate
> +         i2c-clients or spi-devices for each device in the firmware-node.
>
>           To compile this driver as a module, choose M here: the module
>           will be called serial-multi-instantiate.
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 162ec20a861a..535c80789852 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Serial multi-instantiate driver, pseudo driver to instantiate multiple
> - * i2c-clients from a single fwnode.
> + * i2c-clients or spi-devices from a single fwnode.
>   *
>   * Copyright 2018 Hans de Goede <hdegoede@redhat.com>
>   */
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/spi/spi.h>
>  #include <linux/types.h>
>
>  #define IRQ_RESOURCE_TYPE      GENMASK(1, 0)
> @@ -21,15 +22,28 @@
>  #define IRQ_RESOURCE_GPIO      1
>  #define IRQ_RESOURCE_APIC      2
>
> +enum smi_bus_type {
> +       SMI_I2C,
> +       SMI_SPI,
> +       SMI_AUTO_DETECT,
> +};
> +
>  struct smi_instance {
>         const char *type;
>         unsigned int flags;
>         int irq_idx;
>  };
>
> +struct smi_node {
> +       enum smi_bus_type bus_type;
> +       struct smi_instance instances[];
> +};
> +
>  struct smi {
>         int i2c_num;
> +       int spi_num;
>         struct i2c_client **i2c_devs;
> +       struct spi_device **spi_devs;
>  };
>
>  static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
> @@ -60,6 +74,93 @@ static void smi_devs_unregister(struct smi *smi)
>  {
>         while (smi->i2c_num > 0)
>                 i2c_unregister_device(smi->i2c_devs[--smi->i2c_num]);
> +
> +       while (smi->spi_num > 0)
> +               spi_unregister_device(smi->spi_devs[--smi->spi_num]);
> +}
> +
> +/**
> + * smi_spi_probe - Instantiate multiple SPI devices from inst array
> + * @pdev:      Platform device
> + * @adev:      ACPI device
> + * @smi:       Internal struct for Serial multi instantiate driver
> + * @inst:      Array of instances to probe

This is called inst_array below.

> + *
> + * Returns the number of SPI devices instantiate, Zero if none is found or a negative error code.
> + */
> +static int smi_spi_probe(struct platform_device *pdev, struct acpi_device *adev, struct smi *smi,
> +                        const struct smi_instance *inst_array)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct spi_controller *ctlr;
> +       struct spi_device *spi_dev;
> +       char name[50];
> +       int i, ret, count;
> +
> +       ret = acpi_spi_count_resources(adev);
> +       if (ret <= 0)
> +               return ret == 0 ? -ENODEV : ret;
> +
> +       count = ret;
> +
> +       smi->spi_devs = devm_kcalloc(dev, count, sizeof(*smi->spi_devs), GFP_KERNEL);
> +       if (!smi->spi_devs)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < count && inst_array[i].type; i++) {
> +
> +               spi_dev = acpi_spi_device_alloc(NULL, adev, i);
> +               if (IS_ERR(spi_dev)) {
> +                       ret = PTR_ERR(spi_dev);
> +                       dev_err_probe(dev, ret, "failed to allocate SPI device %s from ACPI: %d\n",
> +                                     dev_name(&adev->dev), ret);
> +                       goto error;
> +               }
> +
> +               ctlr = spi_dev->controller;
> +
> +               strscpy(spi_dev->modalias, inst_array[i].type, sizeof(spi_dev->modalias));
> +
> +               ret = smi_get_irq(pdev, adev, &inst_array[i]);
> +               if (ret < 0) {
> +                       spi_dev_put(spi_dev);
> +                       goto error;
> +               }
> +               spi_dev->irq = ret;
> +
> +               snprintf(name, sizeof(name), "%s-%s-%s.%d", dev_name(&ctlr->dev), dev_name(dev),
> +                        inst_array[i].type, i);
> +               spi_dev->dev.init_name = name;
> +
> +               ret = spi_add_device(spi_dev);
> +               if (ret) {
> +                       dev_err_probe(&ctlr->dev, ret,
> +                                     "failed to add SPI device %s from ACPI: %d\n",
> +                                     dev_name(&adev->dev), ret);
> +                       spi_dev_put(spi_dev);
> +                       goto error;
> +               }
> +
> +               dev_dbg(dev, "SPI device %s using chip select %u", name, spi_dev->chip_select);
> +
> +               smi->spi_devs[i] = spi_dev;
> +               smi->spi_num++;
> +       }
> +
> +       if (smi->spi_num < count) {
> +               dev_err(dev, "Error finding driver, idx %d\n", i);

Another kind of debug message.

> +               ret = -ENODEV;
> +               goto error;
> +       }
> +
> +       dev_info(dev, "Instantiated %d SPI devices.\n", smi->spi_num);
> +
> +       return 0;
> +error:
> +       smi_devs_unregister(smi);
> +
> +       return ret;
> +
>  }
>
>  /**
> @@ -125,13 +226,13 @@ static int smi_i2c_probe(struct platform_device *pdev, struct acpi_device *adev,
>
>  static int smi_probe(struct platform_device *pdev)
>  {
> -       const struct smi_instance *inst_array;
>         struct device *dev = &pdev->dev;
> +       const struct smi_node *node;
>         struct acpi_device *adev;
>         struct smi *smi;
>
> -       inst_array = device_get_match_data(dev);
> -       if (!inst_array) {
> +       node = device_get_match_data(dev);
> +       if (!node) {
>                 dev_err(dev, "Error ACPI match data is missing\n");
>                 return -ENODEV;
>         }
> @@ -146,7 +247,21 @@ static int smi_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, smi);
>
> -       return smi_i2c_probe(pdev, adev, smi, inst_array);
> +       switch (node->bus_type) {
> +       case SMI_I2C:
> +               return smi_i2c_probe(pdev, adev, smi, node->instances);
> +       case SMI_SPI:
> +               return smi_spi_probe(pdev, adev, smi, node->instances);
> +       case SMI_AUTO_DETECT:
> +               if (i2c_acpi_client_count(adev) > 0)
> +                       return smi_i2c_probe(pdev, adev, smi, node->instances);
> +               else
> +                       return smi_spi_probe(pdev, adev, smi, node->instances);
> +       default:
> +               break;

Why is this needed?

> +       }
> +
> +       return 0; /* never reached */
>  }
>
>  static int smi_remove(struct platform_device *pdev)
> @@ -158,27 +273,36 @@ static int smi_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> -static const struct smi_instance bsg1160_data[]  = {
> -       { "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
> -       { "bmc150_magn" },
> -       { "bmg160" },
> -       {}
> +static const struct smi_node bsg1160_data = {
> +       .instances = {
> +               { "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
> +               { "bmc150_magn" },
> +               { "bmg160" },
> +               {}
> +       },
> +       .bus_type = SMI_I2C,
>  };
>
> -static const struct smi_instance bsg2150_data[]  = {
> -       { "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
> -       { "bmc150_magn" },
> -       /* The resources describe a 3th client, but it is not really there. */
> -       { "bsg2150_dummy_dev" },
> -       {}
> +static const struct smi_node bsg2150_data = {
> +       .instances = {
> +               { "bmc150_accel", IRQ_RESOURCE_GPIO, 0 },
> +               { "bmc150_magn" },
> +               /* The resources describe a 3th client, but it is not really there. */
> +               { "bsg2150_dummy_dev" },
> +               {}
> +       },
> +       .bus_type = SMI_I2C,
>  };
>
> -static const struct smi_instance int3515_data[]  = {
> -       { "tps6598x", IRQ_RESOURCE_APIC, 0 },
> -       { "tps6598x", IRQ_RESOURCE_APIC, 1 },
> -       { "tps6598x", IRQ_RESOURCE_APIC, 2 },
> -       { "tps6598x", IRQ_RESOURCE_APIC, 3 },
> -       {}
> +static const struct smi_node int3515_data = {
> +       .instances = {
> +               { "tps6598x", IRQ_RESOURCE_APIC, 0 },
> +               { "tps6598x", IRQ_RESOURCE_APIC, 1 },
> +               { "tps6598x", IRQ_RESOURCE_APIC, 2 },
> +               { "tps6598x", IRQ_RESOURCE_APIC, 3 },
> +               {}
> +       },
> +       .bus_type = SMI_I2C,
>  };
>
>  /*
> @@ -186,9 +310,9 @@ static const struct smi_instance int3515_data[]  = {
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>   */
>  static const struct acpi_device_id smi_acpi_ids[] = {
> -       { "BSG1160", (unsigned long)bsg1160_data },
> -       { "BSG2150", (unsigned long)bsg2150_data },
> -       { "INT3515", (unsigned long)int3515_data },
> +       { "BSG1160", (unsigned long)&bsg1160_data },
> +       { "BSG2150", (unsigned long)&bsg2150_data },
> +       { "INT3515", (unsigned long)&int3515_data },
>         { }
>  };
>  MODULE_DEVICE_TABLE(acpi, smi_acpi_ids);
> --
> 2.25.1
>
