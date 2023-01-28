Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA6267FDA0
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Jan 2023 09:25:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC988E0E;
	Sun, 29 Jan 2023 09:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC988E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674980745;
	bh=7R+Y0pFZ9qQaQE2Of8Zyt01fF+w51NH/3ezIsAynqvk=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fQTX/MrNNEdAYNnFn5yrpYuAVLm6rVkBala72eBL2KdXZanTzHMKK841Allml15/B
	 X9Iv1coJTEbEMB4t10s6pD+zQQKxTjpLonaL5kLw3e4nN1k55Ctx15HoskxSbCU909
	 /Rm122U0zXfCk0P7f9DcFvtoKk9xWXXWdmOl3iAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E0DBF8055B;
	Sun, 29 Jan 2023 09:23:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F4E6F8027D; Sat, 28 Jan 2023 16:58:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C59C4F80074
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 16:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C59C4F80074
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d4enHA5M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 728A460B4D;
 Sat, 28 Jan 2023 15:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC8FC433D2;
 Sat, 28 Jan 2023 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674921508;
 bh=7R+Y0pFZ9qQaQE2Of8Zyt01fF+w51NH/3ezIsAynqvk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d4enHA5MJ371GrPucjk++EVvYqWfJUb0Rmdj7ygsHD6FdJSuKLpmLKZObRmyoduRb
 F7/rgXbXthLnxMVJdAyroI/3tQf7IL+wc3TYMiY9DLLWZ9lgFPGplKFOxflb3tFuNt
 UtYcUlsjz0il95gmiB3mk4Bvk/TbRiYPJ9FjEivIPmpDedLPGd1WcinaLHdellNT7Y
 g/L7fp8K98T+nO5sT29tqenfN8c3UVjvN0Ncbjl4SfTpSGVwHHakRtS6Y7/70MN4yc
 AsRCXMaJ9yLeFgwHKcot/dcC5xFelUPaBwh2MZkhTt1C1Gr3icbGZaQVBWurLjEUVb
 0mCC0mntbHQgQ==
Date: Sat, 28 Jan 2023 16:12:17 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v3 4/6] bus: stm32_sys_bus: add support for STM32MP15
 and STM32MP13 system bus
Message-ID: <20230128161217.0e79436e@jic23-huawei>
In-Reply-To: <20230127164040.1047583-5-gatien.chevallier@foss.st.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-5-gatien.chevallier@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 29 Jan 2023 09:23:11 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org,
 alexandre.torgue@foss.st.com, edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, herbert@gondor.apana.org.au,
 Loic PALLARDY <loic.pallardy@st.com>, olivier.moysan@foss.st.com,
 kuba@kernel.org, arnaud.pouliquen@foss.st.com, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, fabrice.gasnier@foss.st.com,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, davem@davemloft.net, linux-i2c@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 27 Jan 2023 17:40:38 +0100
Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:

> This driver is checking the access rights of the different
> peripherals connected to the system bus. If access is denied,
> the associated device tree node is skipped so the platform bus
> does not probe it.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>

Hi Gatien,

A few comments inline,

Thanks,

Jonathan

> diff --git a/drivers/bus/stm32_sys_bus.c b/drivers/bus/stm32_sys_bus.c
> new file mode 100644
> index 000000000000..c12926466bae
> --- /dev/null
> +++ b/drivers/bus/stm32_sys_bus.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +/* ETZPC peripheral as firewall bus */
> +/* ETZPC registers */
> +#define ETZPC_DECPROT			0x10
> +
> +/* ETZPC miscellaneous */
> +#define ETZPC_PROT_MASK			GENMASK(1, 0)
> +#define ETZPC_PROT_A7NS			0x3
> +#define ETZPC_DECPROT_SHIFT		1

This define makes the code harder to read.  What we care about is
the number of bits in the register divided by number of entries.
(which is 2) hence the shift by 1. See below for more on this.


> +
> +#define IDS_PER_DECPROT_REGS		16

> +#define STM32MP15_ETZPC_ENTRIES		96
> +#define STM32MP13_ETZPC_ENTRIES		64

These defines just make the code harder to check.
They aren't magic numbers, but rather just telling us how many
entries there are, so I would just put them in the structures directly.
Their use make it clear what they are without needing to give them a name.


> +struct stm32_sys_bus_match_data {

Comment on naming of this below.

> +	unsigned int max_entries;
> +};
> +

+static int stm32_etzpc_get_access(struct sys_bus_data *pdata, struct device_node *np)
+{
+	int err;
+	u32 offset, reg_offset, sec_val, id;
+
+	err = stm32_sys_bus_get_periph_id(pdata, np, &id);
+	if (err)
+		return err;
+
+	/* Check access configuration, 16 peripherals per register */
+	reg_offset = ETZPC_DECPROT + 0x4 * (id / IDS_PER_DECPROT_REGS);
+	offset = (id % IDS_PER_DECPROT_REGS) << ETZPC_DECPROT_SHIFT;

Use of defines in here is actively unhelpful when it comes to review. I would suggest letting
the maths be self explanatory (even if it's more code).

	offset = (id % IDS_PER_DECPROT_REGS) * (sizeof(u32) * BITS_PER_BYTE / IDS_PER_DECPROT_REGS);

Or if you prefer have a define of

#define DECPROT_BITS_PER_ID (sizeof(u32) * BITS_PER_BYTE / IDS_PER_DECPROT_REGS)

and
	offset = (id % IDS_PER_DECPROT_REGS) * DECPROT_BITS_PER_ID;

+
+	/* Verify peripheral is non-secure and attributed to cortex A7 */
+	sec_val = (readl(pdata->sys_bus_base + reg_offset) >> offset) & ETZPC_PROT_MASK;
+	if (sec_val != ETZPC_PROT_A7NS) {
+		dev_dbg(pdata->dev, "Invalid bus configuration: reg_offset %#x, value %d\n",
+			reg_offset, sec_val);
+		return -EACCES;
+	}
+
+	return 0;
+}
+
...

> +static int stm32_sys_bus_probe(struct platform_device *pdev)
> +{
> +	struct sys_bus_data *pdata;
> +	void __iomem *mmio;
> +	struct device_node *np = pdev->dev.of_node;

I'd be consistent. You use dev_of_node() accessor elsewhere, so should
use it here as well.

> +
> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	mmio = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mmio))
> +		return PTR_ERR(mmio);
> +
> +	pdata->sys_bus_base = mmio;
> +	pdata->pconf = of_device_get_match_data(&pdev->dev);
> +	pdata->dev = &pdev->dev;
> +
> +	platform_set_drvdata(pdev, pdata);

Does this get used? I can't immediately spot where but maybe I just
missed it.

> +
> +	stm32_sys_bus_populate(pdata);
> +
> +	/* Populate all available nodes */
> +	return of_platform_populate(np, NULL, NULL, &pdev->dev);

As np only used here, I'd not bother with the local variable in this function.

> +}
> +
> +static const struct stm32_sys_bus_match_data stm32mp15_sys_bus_data = {

Naming a structure after where it comes from is a little unusual and
confusion when a given call gets it from somewhere else.

I'd expect it to be named after what sort of thing it contains.
stm32_sys_bus_info or something like that.

> +	.max_entries = STM32MP15_ETZPC_ENTRIES,
> +};
> +
> +static const struct stm32_sys_bus_match_data stm32mp13_sys_bus_data = {
> +	.max_entries = STM32MP13_ETZPC_ENTRIES,
> +};
> +
> +static const struct of_device_id stm32_sys_bus_of_match[] = {
> +	{ .compatible = "st,stm32mp15-sys-bus", .data = &stm32mp15_sys_bus_data },
> +	{ .compatible = "st,stm32mp13-sys-bus", .data = &stm32mp13_sys_bus_data },

Alphabetical order usually preferred when there isn't a strong reason for
another choice.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, stm32_sys_bus_of_match);
> +
> +static struct platform_driver stm32_sys_bus_driver = {
> +	.probe  = stm32_sys_bus_probe,
> +	.driver = {
> +		.name = "stm32-sys-bus",
> +		.of_match_table = stm32_sys_bus_of_match,
> +	},
> +};
> +
> +static int __init stm32_sys_bus_init(void)
> +{
> +	return platform_driver_register(&stm32_sys_bus_driver);
> +}
> +arch_initcall(stm32_sys_bus_init);
> +

Unwanted trailing blank line.


