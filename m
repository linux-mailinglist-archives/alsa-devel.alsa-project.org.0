Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F89493EA1
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 17:54:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E528B3168;
	Wed, 19 Jan 2022 17:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E528B3168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642611273;
	bh=LPdkWkp4vT/3QumRNSwdmdYyprivSQSNAPhQJcZ9BCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RdxmndQLsw2bV8SYL6i+rjxCTGayCJ4BGdVY7ZdokUhdPl+B29bCjhzX64FORXsEf
	 VGwZhrJXsS+NGwfDUhZSYXrI0itlbPv19elyGruEDk1EfLWMME9KCGmsaq/ivSSQo7
	 SDMl4jMcb8maEJl++sVwrermk+8rA7w0bKC6YbQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C12F80212;
	Wed, 19 Jan 2022 17:53:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AE87F801F7; Wed, 19 Jan 2022 17:53:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5DDBF80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 17:53:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5DDBF80128
Received: by mail-qt1-f178.google.com with SMTP id h15so2648987qtx.0
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 08:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rSEzk8BcF5dmOAChCxcAbNaCIVCH+wJKAituA5N0HnY=;
 b=zFSnxk/CqPbvc1XPb3PYXpibeFWJunZ//W3u5HkVWL53gyLeUD7yHNGGSWd9n8nTO/
 g2OzjSkvjWybplOy5Km+/FHrPNmig0blrgdrsZaiS9iZK27SXvRPVwLMAliZ4BoQ7o1V
 42rp5qP1XZAjphKUShbZSSDKFim2YnfanqRMVzUmyzV5QJK2iDvX5GVuuCXmCkC5aL/2
 R7ub+HgznX2I5K3DecsYkmjYZI4OHOysu2ZyhsMlsCg/BcQ+s1yqgRmom1U7kDTMHhGu
 hu2443MA0i45utdkaPTdMD37oRKt7KqeZcs7b/s+0FDqWaSNZTdrdly/3UNzFsPC2vVa
 Rgxw==
X-Gm-Message-State: AOAM532TumfBwih3kJmPYO1nSridNmHu1hUVnUsAIqSkuqrQY9c3Fr/s
 8iewPHJv/LN6ErvgEfL4AbGW+nC9IrG9YZw8ePI=
X-Google-Smtp-Source: ABdhPJxL6fAiWPnaDWtmGlMi8gk6mzbi83/3qUonNzAa3s8SLHRIwSduaptcTiEeu+Awb67ILI4/Jr/XlzTEvfA7fWw=
X-Received: by 2002:a05:622a:1881:: with SMTP id
 v1mr25662181qtc.327.1642611196009; 
 Wed, 19 Jan 2022 08:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20220118145251.1548-1-sbinding@opensource.cirrus.com>
 <20220118145251.1548-6-sbinding@opensource.cirrus.com>
In-Reply-To: <20220118145251.1548-6-sbinding@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 19 Jan 2022 17:53:05 +0100
Message-ID: <CAJZ5v0g0n201FPcG9LBNG3e4UdNYSWmj_1sN3MxLxmK=GoF+tA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] platform/x86: i2c-multi-instantiate: Move it to
 drivers/acpi folder
To: Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
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

On Tue, Jan 18, 2022 at 3:53 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>
> Moving I2C multi instantiate driver to drivers/acpi folder for
> upcoming conversion into a generic bus multi instantiate
> driver for SPI and I2C
>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Why are you moving it away from platform/x86?

Adding SPI to the mix doesn't seem to be a sufficient reason.

If this were going to be needed on non-x86, that would be a good
reason for moving it, but is that actually the case?  If so, why isn't
that mentioned in the changelog above?

> ---
>  MAINTAINERS                                           |  2 +-
>  drivers/acpi/Kconfig                                  | 11 +++++++++++
>  drivers/acpi/Makefile                                 |  1 +
>  .../{platform/x86 => acpi}/i2c-multi-instantiate.c    |  0
>  drivers/acpi/scan.c                                   |  2 +-
>  drivers/platform/x86/Kconfig                          | 11 -----------
>  drivers/platform/x86/Makefile                         |  1 -
>  7 files changed, 14 insertions(+), 14 deletions(-)
>  rename drivers/{platform/x86 => acpi}/i2c-multi-instantiate.c (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e828542b089..546f9e149d28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -392,7 +392,7 @@ ACPI I2C MULTI INSTANTIATE DRIVER
>  M:     Hans de Goede <hdegoede@redhat.com>
>  L:     platform-driver-x86@vger.kernel.org
>  S:     Maintained
> -F:     drivers/platform/x86/i2c-multi-instantiate.c
> +F:     drivers/acpi/i2c-multi-instantiate.c
>
>  ACPI PCC(Platform Communication Channel) MAILBOX DRIVER
>  M:     Sudeep Holla <sudeep.holla@arm.com>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index ba45541b1f1f..2fd78366af6f 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -295,6 +295,17 @@ config ACPI_PROCESSOR
>           To compile this driver as a module, choose M here:
>           the module will be called processor.
>
> +config ACPI_I2C_MULTI_INST
> +       tristate "I2C multi instantiate pseudo device driver"
> +       depends on I2C
> +       help
> +         Some ACPI-based systems list multiple i2c-devices in a single ACPI
> +         firmware-node. This driver will instantiate separate i2c-clients
> +         for each device in the firmware-node.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called i2c-multi-instantiate.
> +
>  config ACPI_IPMI
>         tristate "IPMI"
>         depends on IPMI_HANDLER
> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> index bb757148e7ba..d4db7fb0baf0 100644
> --- a/drivers/acpi/Makefile
> +++ b/drivers/acpi/Makefile
> @@ -104,6 +104,7 @@ obj-$(CONFIG_ACPI_SPCR_TABLE)       += spcr.o
>  obj-$(CONFIG_ACPI_DEBUGGER_USER) += acpi_dbg.o
>  obj-$(CONFIG_ACPI_PPTT)        += pptt.o
>  obj-$(CONFIG_ACPI_PFRUT)       += pfr_update.o pfr_telemetry.o
> +obj-$(CONFIG_ACPI_I2C_MULTI_INST)      += i2c-multi-instantiate.o
>
>  # processor has its own "processor." module_param namespace
>  processor-y                    := processor_driver.o
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/acpi/i2c-multi-instantiate.c
> similarity index 100%
> rename from drivers/platform/x86/i2c-multi-instantiate.c
> rename to drivers/acpi/i2c-multi-instantiate.c
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 1331756d4cfc..3e85a02f6ba2 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1738,7 +1738,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>          * must be instantiated for each, each with its own i2c_device_id.
>          * Normally we only instantiate an i2c-client for the first resource,
>          * using the ACPI HID as id. These special cases are handled by the
> -        * drivers/platform/x86/i2c-multi-instantiate.c driver, which knows
> +        * drivers/acpi/i2c-multi-instantiate.c driver, which knows
>          * which i2c_device_id to use for each resource.
>          */
>                 {"BSG1160", },
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 24deeeb29af2..37c1c150508d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -990,17 +990,6 @@ config TOPSTAR_LAPTOP
>
>           If you have a Topstar laptop, say Y or M here.
>
> -config I2C_MULTI_INSTANTIATE
> -       tristate "I2C multi instantiate pseudo device driver"
> -       depends on I2C && ACPI
> -       help
> -         Some ACPI-based systems list multiple i2c-devices in a single ACPI
> -         firmware-node. This driver will instantiate separate i2c-clients
> -         for each device in the firmware-node.
> -
> -         To compile this driver as a module, choose M here: the module
> -         will be called i2c-multi-instantiate.
> -
>  config MLX_PLATFORM
>         tristate "Mellanox Technologies platform support"
>         depends on I2C && REGMAP
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index c12a9b044fd8..6c7870190564 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -110,7 +110,6 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)        += topstar-laptop.o
>
>  # Platform drivers
>  obj-$(CONFIG_FW_ATTR_CLASS)            += firmware_attributes_class.o
> -obj-$(CONFIG_I2C_MULTI_INSTANTIATE)    += i2c-multi-instantiate.o
>  obj-$(CONFIG_MLX_PLATFORM)             += mlx-platform.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)          += touchscreen_dmi.o
>  obj-$(CONFIG_WIRELESS_HOTKEY)          += wireless-hotkey.o
> --
> 2.25.1
>
