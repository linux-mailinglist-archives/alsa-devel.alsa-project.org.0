Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3F7493F44
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 18:45:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E005530FF;
	Wed, 19 Jan 2022 18:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E005530FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642614347;
	bh=E8dO/AX0vHeqpUcZ8QpLca5CSTtu3zDm12um7xmGtw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nt66qcdt+8QuTSCaO5IV+58sj9ZjQ7uELaYqYNQNnoG0WLCWNhL8wPFaQzjmUvOqk
	 SP1OsPBn3zi9GvKy3t52ss9jtpMGeIfCYptDRjsT4/IYrM7YSyHpXWrBAnWd2TRY4d
	 fdmMwIwgIeQxcx8QVkM3MzUiG+nlDtE7/2MoJ/VU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44CC7F80212;
	Wed, 19 Jan 2022 18:44:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC26F801F7; Wed, 19 Jan 2022 18:44:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 965E7F80100
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 18:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 965E7F80100
Received: by mail-qv1-f54.google.com with SMTP id u26so3915693qva.7
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 09:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w6ErTGvgHe67gNzRtGnvhidwqqNvSKerDvzsL2m5wv8=;
 b=1ghEEgIjMlZRMgl5tLZ2wHi5gMCFs4y8ByzJVEP8iSPYYTEWGcsfEiNT+X5apor2zx
 3FysWC4EULxxbepTCL/j0JNOdPdeyEoJ/sHn12lKB4xanRcMJaOt8zknwd2jJUVSNgbU
 NrI3te+E3mFRa4mP4drID/Vefh/eQf20O6doTMaULrSva9Ngidw/m3UxCMIWM3Ob7lkG
 kCxrJL6KrbHsrsul5iXCqRUb5qXA/iva9wgsiNtXWxj8dqjq9893e89axwk8s0D8ZJAN
 QPT+bSSefKpVHj9YPmlLFbVwntwZqTZV37Xw9LRWJenIICwKbU7T3dQOTeF7fxVd2Ui3
 qg0Q==
X-Gm-Message-State: AOAM533TMuD7hAPOSaWGQWx5G2xacGBHFoMma0zfnC5VeqrinBD9qc6J
 o3HhXyhv5mW/GWBvQmXizjKCuiEL4fHhZ4/ZC5E=
X-Google-Smtp-Source: ABdhPJzI3lLGuR3qUzh5KbBVc/sdRf2oVrQ/kIBS+lpxwoBt3e1yuaPz0CEjFf17i0UqEVApbLEKOwx1R40x8nHA6I4=
X-Received: by 2002:a05:6214:2469:: with SMTP id
 im9mr16635370qvb.52.1642614265659; 
 Wed, 19 Jan 2022 09:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20220118145251.1548-1-sbinding@opensource.cirrus.com>
 <20220118145251.1548-6-sbinding@opensource.cirrus.com>
 <CAJZ5v0g0n201FPcG9LBNG3e4UdNYSWmj_1sN3MxLxmK=GoF+tA@mail.gmail.com>
 <a3522b5e-fb36-b959-d2ea-d141d3ad9999@opensource.cirrus.com>
In-Reply-To: <a3522b5e-fb36-b959-d2ea-d141d3ad9999@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 19 Jan 2022 18:44:14 +0100
Message-ID: <CAJZ5v0h8MWb3sSuqWHUcm9TVWP0uJ+=GmzAuqVtNag2LP+0kYQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] platform/x86: i2c-multi-instantiate: Move it to
 drivers/acpi folder
To: Lucas tanure <tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
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

On Wed, Jan 19, 2022 at 6:33 PM Lucas tanure
<tanureal@opensource.cirrus.com> wrote:
>
> On 1/19/22 16:53, Rafael J. Wysocki wrote:
> > On Tue, Jan 18, 2022 at 3:53 PM Stefan Binding
> > <sbinding@opensource.cirrus.com> wrote:
> >>
> >> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> >>
> >> Moving I2C multi instantiate driver to drivers/acpi folder for
> >> upcoming conversion into a generic bus multi instantiate
> >> driver for SPI and I2C
> >>
> >> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> >> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> >
> > Why are you moving it away from platform/x86?
> >
> > Adding SPI to the mix doesn't seem to be a sufficient reason.
> >
> > If this were going to be needed on non-x86, that would be a good
> > reason for moving it, but is that actually the case?  If so, why isn't
> > that mentioned in the changelog above?
> >
>
> It was a request made by Andy Shevchenko:
> https://lkml.org/lkml/2021/12/3/347

But he hasn't given any reasons why that'd be better.

> There is no plan to use our CS35L41 HDA with non-x86 platforms and we
> can't comment about i2c-multi-instantiate use.
> For us it can stay in x86 folder until an actual request.

I'd prefer that if Hans agrees.

> >> ---
> >>   MAINTAINERS                                           |  2 +-
> >>   drivers/acpi/Kconfig                                  | 11 +++++++++++
> >>   drivers/acpi/Makefile                                 |  1 +
> >>   .../{platform/x86 => acpi}/i2c-multi-instantiate.c    |  0
> >>   drivers/acpi/scan.c                                   |  2 +-
> >>   drivers/platform/x86/Kconfig                          | 11 -----------
> >>   drivers/platform/x86/Makefile                         |  1 -
> >>   7 files changed, 14 insertions(+), 14 deletions(-)
> >>   rename drivers/{platform/x86 => acpi}/i2c-multi-instantiate.c (100%)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 4e828542b089..546f9e149d28 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -392,7 +392,7 @@ ACPI I2C MULTI INSTANTIATE DRIVER
> >>   M:     Hans de Goede <hdegoede@redhat.com>
> >>   L:     platform-driver-x86@vger.kernel.org
> >>   S:     Maintained
> >> -F:     drivers/platform/x86/i2c-multi-instantiate.c
> >> +F:     drivers/acpi/i2c-multi-instantiate.c
> >>
> >>   ACPI PCC(Platform Communication Channel) MAILBOX DRIVER
> >>   M:     Sudeep Holla <sudeep.holla@arm.com>
> >> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> >> index ba45541b1f1f..2fd78366af6f 100644
> >> --- a/drivers/acpi/Kconfig
> >> +++ b/drivers/acpi/Kconfig
> >> @@ -295,6 +295,17 @@ config ACPI_PROCESSOR
> >>            To compile this driver as a module, choose M here:
> >>            the module will be called processor.
> >>
> >> +config ACPI_I2C_MULTI_INST
> >> +       tristate "I2C multi instantiate pseudo device driver"
> >> +       depends on I2C
> >> +       help
> >> +         Some ACPI-based systems list multiple i2c-devices in a single ACPI
> >> +         firmware-node. This driver will instantiate separate i2c-clients
> >> +         for each device in the firmware-node.
> >> +
> >> +         To compile this driver as a module, choose M here: the module
> >> +         will be called i2c-multi-instantiate.
> >> +
> >>   config ACPI_IPMI
> >>          tristate "IPMI"
> >>          depends on IPMI_HANDLER
> >> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> >> index bb757148e7ba..d4db7fb0baf0 100644
> >> --- a/drivers/acpi/Makefile
> >> +++ b/drivers/acpi/Makefile
> >> @@ -104,6 +104,7 @@ obj-$(CONFIG_ACPI_SPCR_TABLE)       += spcr.o
> >>   obj-$(CONFIG_ACPI_DEBUGGER_USER) += acpi_dbg.o
> >>   obj-$(CONFIG_ACPI_PPTT)        += pptt.o
> >>   obj-$(CONFIG_ACPI_PFRUT)       += pfr_update.o pfr_telemetry.o
> >> +obj-$(CONFIG_ACPI_I2C_MULTI_INST)      += i2c-multi-instantiate.o
> >>
> >>   # processor has its own "processor." module_param namespace
> >>   processor-y                    := processor_driver.o
> >> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/acpi/i2c-multi-instantiate.c
> >> similarity index 100%
> >> rename from drivers/platform/x86/i2c-multi-instantiate.c
> >> rename to drivers/acpi/i2c-multi-instantiate.c
> >> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> >> index 1331756d4cfc..3e85a02f6ba2 100644
> >> --- a/drivers/acpi/scan.c
> >> +++ b/drivers/acpi/scan.c
> >> @@ -1738,7 +1738,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
> >>           * must be instantiated for each, each with its own i2c_device_id.
> >>           * Normally we only instantiate an i2c-client for the first resource,
> >>           * using the ACPI HID as id. These special cases are handled by the
> >> -        * drivers/platform/x86/i2c-multi-instantiate.c driver, which knows
> >> +        * drivers/acpi/i2c-multi-instantiate.c driver, which knows
> >>           * which i2c_device_id to use for each resource.
> >>           */
> >>                  {"BSG1160", },
> >> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> >> index 24deeeb29af2..37c1c150508d 100644
> >> --- a/drivers/platform/x86/Kconfig
> >> +++ b/drivers/platform/x86/Kconfig
> >> @@ -990,17 +990,6 @@ config TOPSTAR_LAPTOP
> >>
> >>            If you have a Topstar laptop, say Y or M here.
> >>
> >> -config I2C_MULTI_INSTANTIATE
> >> -       tristate "I2C multi instantiate pseudo device driver"
> >> -       depends on I2C && ACPI
> >> -       help
> >> -         Some ACPI-based systems list multiple i2c-devices in a single ACPI
> >> -         firmware-node. This driver will instantiate separate i2c-clients
> >> -         for each device in the firmware-node.
> >> -
> >> -         To compile this driver as a module, choose M here: the module
> >> -         will be called i2c-multi-instantiate.
> >> -
> >>   config MLX_PLATFORM
> >>          tristate "Mellanox Technologies platform support"
> >>          depends on I2C && REGMAP
> >> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> >> index c12a9b044fd8..6c7870190564 100644
> >> --- a/drivers/platform/x86/Makefile
> >> +++ b/drivers/platform/x86/Makefile
> >> @@ -110,7 +110,6 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)        += topstar-laptop.o
> >>
> >>   # Platform drivers
> >>   obj-$(CONFIG_FW_ATTR_CLASS)            += firmware_attributes_class.o
> >> -obj-$(CONFIG_I2C_MULTI_INSTANTIATE)    += i2c-multi-instantiate.o
> >>   obj-$(CONFIG_MLX_PLATFORM)             += mlx-platform.o
> >>   obj-$(CONFIG_TOUCHSCREEN_DMI)          += touchscreen_dmi.o
> >>   obj-$(CONFIG_WIRELESS_HOTKEY)          += wireless-hotkey.o
> >> --
> >> 2.25.1
> >>
>
