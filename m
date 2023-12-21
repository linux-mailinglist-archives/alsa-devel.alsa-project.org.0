Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95281BC25
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 17:35:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A74D868;
	Thu, 21 Dec 2023 17:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A74D868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703176501;
	bh=vjpz+sAKXIwbLZSiTZGR6xojBu3FzkNP9hISpFnxwbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VeBGRgGYmDqYtqrVXGSj/ribg+Sh/EUoW2E472HxSzympDCyBCU1tV6fmaSPsZPU4
	 5TisznDUzsuLmNT2YXo96+oXj20yMHQW2BizVxwao86tX1sbvlmu7ENAs1Mut3uldm
	 NppGNLST3DlJr2VqVDZlryRFMwnhhFnE2B7iFcng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B58B1F8024E; Thu, 21 Dec 2023 17:34:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0627F804DA;
	Thu, 21 Dec 2023 17:34:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66806F80124; Thu, 21 Dec 2023 17:34:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15F33F800D2
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 17:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F33F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cXw6uxGC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 042C1B8208D;
	Thu, 21 Dec 2023 16:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27CAC433C7;
	Thu, 21 Dec 2023 16:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703176453;
	bh=vjpz+sAKXIwbLZSiTZGR6xojBu3FzkNP9hISpFnxwbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXw6uxGChdfQuSbm9ApIgyxUluls6dWLSxzggSSWLJTROPgqBC0e3ZsG8JtGEFVsL
	 TkyRMfB6KcnlgTo6XWygVwRLs1sjkQFrrxhnbmbAfSIDKo7oA8CVJtM1VN65ARRriq
	 l6MvKquIqJv88ovGlkYoPK9HCtqbi3DWJxV70pSVpmz7KN+4g8muJstlcEJZCRLKN6
	 t331X6kWZ8r7JmUsyxkDfDMQG9kRzqmGK2iGU91dDkdDqOPP0Z4ECjvTUwjjPHaKfE
	 mMCW9nTtMdhKfajBunJuqJE6+wKHi+nWdrl3GIDI+RD+Ok2cBd5MAVMQwpqa+Z1ZuH
	 uhh5E+o1ftKOA==
Date: Thu, 21 Dec 2023 22:04:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	pierre-louis.bossart@linux.intel.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/12] drivers: soundwire: refactor amd soundwire manager
 device node creation
Message-ID: <ZYRpAcmfMtegIvj_@matsya>
References: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
 <20231221073558.3181911-3-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221073558.3181911-3-Vijendar.Mukunda@amd.com>
Message-ID-Hash: UMQHGBF3BU4IIKZUCGNHM2A4SSIO3SKU
X-Message-ID-Hash: UMQHGBF3BU4IIKZUCGNHM2A4SSIO3SKU
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMQHGBF3BU4IIKZUCGNHM2A4SSIO3SKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21-12-23, 13:05, Vijendar Mukunda wrote:

Why is the tag drivers: soundwire: ...??

should have been amd: to indicate amd driver code

> Refactor amd SoundWire manager device node creation logic and
> implement generic functions to have a common functionality for
> SoundWire manager platform device creation, start and exit sequence
> for both legacy(NO DSP) and SOF stack for AMD platforms.
> These functions will be invoked from legacy and SOF stack.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/Makefile        |   2 +-
>  drivers/soundwire/amd_init.c      | 147 ++++++++++++++++++++++++++++++
>  drivers/soundwire/amd_init.h      |  13 +++
>  drivers/soundwire/amd_manager.c   |  16 +---
>  include/linux/soundwire/sdw_amd.h |  54 ++++++++++-
>  5 files changed, 218 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/soundwire/amd_init.c
>  create mode 100644 drivers/soundwire/amd_init.h
> 
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index 657f5888a77b..e80a2c2cf3e7 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -20,7 +20,7 @@ soundwire-bus-y += irq.o
>  endif
>  
>  #AMD driver
> -soundwire-amd-y :=	amd_manager.o
> +soundwire-amd-y := amd_init.o amd_manager.o
>  obj-$(CONFIG_SOUNDWIRE_AMD) += soundwire-amd.o
>  
>  #Cadence Objs
> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
> new file mode 100644
> index 000000000000..d732ab0bfd59
> --- /dev/null
> +++ b/drivers/soundwire/amd_init.c
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * SoundWire AMD Manager Initialize routines
> + *
> + * Initializes and creates SDW devices based on ACPI and Hardware values
> + *
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/export.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "amd_init.h"
> +
> +static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
> +{
> +	int i;
> +
> +	for (i = 0; i < ctx->count; i++) {
> +		if (!(ctx->link_mask & BIT(i)))
> +			continue;
> +		platform_device_unregister(ctx->pdev[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
> +{
> +	struct sdw_amd_ctx *ctx;
> +	struct acpi_device *adev;
> +	struct resource *sdw_res;
> +	struct acp_sdw_pdata sdw_pdata[2];
> +	struct platform_device_info pdevinfo[2];
> +	u32 link_mask;
> +	int count, index;
> +
> +	if (!res)
> +		return NULL;
> +
> +	adev = acpi_fetch_acpi_dev(res->handle);
> +	if (!adev)
> +		return NULL;
> +
> +	if (!res->count)
> +		return NULL;
> +
> +	count = res->count;
> +	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
> +
> +	/*
> +	 * we need to alloc/free memory manually and can't use devm:
> +	 * this routine may be called from a workqueue, and not from
> +	 * the parent .probe.
> +	 * If devm_ was used, the memory might never be freed on errors.
> +	 */
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return NULL;
> +
> +	ctx->count = count;
> +	ctx->link_mask = res->link_mask;
> +	sdw_res = kzalloc(sizeof(*sdw_res), GFP_KERNEL);
> +	if (!sdw_res) {
> +		kfree(ctx);
> +		return NULL;
> +	}
> +	sdw_res->flags = IORESOURCE_MEM;
> +	sdw_res->start = res->addr;
> +	sdw_res->end = res->addr + res->reg_range;
> +	memset(&pdevinfo, 0, sizeof(pdevinfo));
> +	link_mask = ctx->link_mask;
> +	for (index = 0; index < count; index++) {
> +		if (!(link_mask & BIT(index)))
> +			continue;
> +
> +		sdw_pdata[index].instance = index;
> +		sdw_pdata[index].acp_sdw_lock = res->acp_lock;
> +		pdevinfo[index].name = "amd_sdw_manager";
> +		pdevinfo[index].id = index;
> +		pdevinfo[index].parent = res->parent;
> +		pdevinfo[index].num_res = 1;
> +		pdevinfo[index].res = sdw_res;
> +		pdevinfo[index].data = &sdw_pdata[index];
> +		pdevinfo[index].size_data = sizeof(struct acp_sdw_pdata);
> +		pdevinfo[index].fwnode = acpi_fwnode_handle(adev);
> +		ctx->pdev[index] = platform_device_register_full(&pdevinfo[index]);
> +		if (IS_ERR(ctx->pdev[index]))
> +			goto err;
> +	}
> +	kfree(sdw_res);
> +	return ctx;
> +err:
> +	while (index--) {
> +		if (!(link_mask & BIT(index)))
> +			continue;
> +
> +		platform_device_unregister(ctx->pdev[index]);
> +	}
> +
> +	kfree(sdw_res);
> +	kfree(ctx);
> +	return NULL;
> +}
> +
> +static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
> +{
> +	struct amd_sdw_manager *amd_manager;
> +	int i, ret;
> +
> +	/* Startup SDW Manager devices */
> +	for (i = 0; i < ctx->count; i++) {
> +		if (!(ctx->link_mask & BIT(i)))
> +			continue;
> +		amd_manager = dev_get_drvdata(&ctx->pdev[i]->dev);
> +		ret = amd_sdw_manager_start(amd_manager);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
> +{
> +	*sdw_ctx = sdw_amd_probe_controller(res);
> +	if (!*sdw_ctx)
> +		return -ENODEV;
> +
> +	return sdw_amd_startup(*sdw_ctx);
> +}
> +EXPORT_SYMBOL_NS(sdw_amd_probe, SOUNDWIRE_AMD_INIT);
> +
> +void sdw_amd_exit(struct sdw_amd_ctx *ctx)
> +{
> +	sdw_amd_cleanup(ctx);
> +	kfree(ctx->ids);
> +	kfree(ctx);
> +}
> +EXPORT_SYMBOL_NS(sdw_amd_exit, SOUNDWIRE_AMD_INIT);
> +
> +MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
> +MODULE_DESCRIPTION("AMD SoundWire Init Library");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/soundwire/amd_init.h b/drivers/soundwire/amd_init.h
> new file mode 100644
> index 000000000000..f710703ffae9
> --- /dev/null
> +++ b/drivers/soundwire/amd_init.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
> + */
> +
> +#ifndef __AMD_INIT_H
> +#define __AMD_INIT_H
> +
> +#include <linux/soundwire/sdw_amd.h>
> +
> +int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager);
> +
> +#endif
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 3a99f6dcdfaf..c27b0b0f33a6 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -19,6 +19,7 @@
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include "bus.h"
> +#include "amd_init.h"
>  #include "amd_manager.h"
>  
>  #define DRV_NAME "amd_sdw_manager"
> @@ -864,10 +865,8 @@ static void amd_sdw_irq_thread(struct work_struct *work)
>  	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
>  }
>  
> -static void amd_sdw_probe_work(struct work_struct *work)
> +int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
>  {
> -	struct amd_sdw_manager *amd_manager = container_of(work, struct amd_sdw_manager,
> -							   probe_work);
>  	struct sdw_master_prop *prop;
>  	int ret;
>  
> @@ -876,11 +875,11 @@ static void amd_sdw_probe_work(struct work_struct *work)
>  		amd_enable_sdw_pads(amd_manager);
>  		ret = amd_init_sdw_manager(amd_manager);
>  		if (ret)
> -			return;
> +			return ret;
>  		amd_enable_sdw_interrupts(amd_manager);
>  		ret = amd_enable_sdw_manager(amd_manager);
>  		if (ret)
> -			return;
> +			return ret;
>  		amd_sdw_set_frameshape(amd_manager);
>  	}
>  	/* Enable runtime PM */
> @@ -889,6 +888,7 @@ static void amd_sdw_probe_work(struct work_struct *work)
>  	pm_runtime_mark_last_busy(amd_manager->dev);
>  	pm_runtime_set_active(amd_manager->dev);
>  	pm_runtime_enable(amd_manager->dev);
> +	return 0;
>  }
>  
>  static int amd_sdw_manager_probe(struct platform_device *pdev)
> @@ -964,11 +964,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>  	dev_set_drvdata(dev, amd_manager);
>  	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
>  	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
> -	INIT_WORK(&amd_manager->probe_work, amd_sdw_probe_work);
> -	/*
> -	 * Instead of having lengthy probe sequence, use deferred probe.
> -	 */
> -	schedule_work(&amd_manager->probe_work);
>  	return 0;
>  }
>  
> @@ -978,7 +973,6 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
>  	int ret;
>  
>  	pm_runtime_disable(&pdev->dev);
> -	cancel_work_sync(&amd_manager->probe_work);
>  	amd_disable_sdw_interrupts(amd_manager);
>  	sdw_bus_master_delete(&amd_manager->bus);
>  	ret = amd_disable_sdw_manager(amd_manager);
> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
> index 41dd64941cef..064174c2f401 100644
> --- a/include/linux/soundwire/sdw_amd.h
> +++ b/include/linux/soundwire/sdw_amd.h
> @@ -26,6 +26,7 @@
>  #define AMD_SDW_POWER_OFF_MODE		2
>  #define ACP_SDW0	0
>  #define ACP_SDW1	1
> +#define AMD_SDW_MAX_MANAGER_COUNT	2
>  
>  struct acp_sdw_pdata {
>  	u16 instance;
> @@ -63,7 +64,6 @@ struct sdw_amd_dai_runtime {
>   * @reg_mask: register mask structure per manager instance
>   * @amd_sdw_irq_thread: SoundWire manager irq workqueue
>   * @amd_sdw_work: peripheral status work queue
> - * @probe_work: SoundWire manager probe workqueue
>   * @acp_sdw_lock: mutex to protect acp share register access
>   * @status: peripheral devices status array
>   * @num_din_ports: number of input ports
> @@ -87,7 +87,6 @@ struct amd_sdw_manager {
>  	struct sdw_manager_reg_mask *reg_mask;
>  	struct work_struct amd_sdw_irq_thread;
>  	struct work_struct amd_sdw_work;
> -	struct work_struct probe_work;
>  	/* mutex to protect acp common register access */
>  	struct mutex *acp_sdw_lock;
>  
> @@ -120,5 +119,56 @@ struct sdw_amd_acpi_info {
>  	u32 link_mask;
>  };
>  
> +/**
> + * struct sdw_amd_ctx - context allocated by the controller
> + * driver probe
> + * @count: link count
> + * @num_slaves: total number of devices exposed across all enabled links
> + * @link_mask: bit-wise mask listing SoundWire links reported by the
> + * Controller
> + * @ids: array of slave_id, representing Slaves exposed across all enabled
> + * links
> + * @pdev: platform device structure
> + */
> +struct sdw_amd_ctx {
> +	int count;
> +	int num_slaves;
> +	u32 link_mask;
> +	struct sdw_extended_slave_id *ids;
> +	struct platform_device *pdev[AMD_SDW_MAX_MANAGER_COUNT];
> +};
> +
> +/**
> + * struct sdw_amd_res - Soundwire AMD global resource structure,
> + * typically populated by the DSP driver/Legacy driver
> + *
> + * @addr: acp pci device resource start address
> + * @reg_range: ACP register range
> + * @link_mask: bit-wise mask listing links selected by the DSP driver/
> + * legacy driver
> + * @count: link count
> + * @mmio_base: mmio base of SoundWire registers
> + * @handle: ACPI parent handle
> + * @parent: parent device
> + * @dev: device implementing hwparams and free callbacks
> + * @acp_lock: mutex protecting acp common registers access
> + */
> +struct sdw_amd_res {
> +	u32 addr;
> +	u32 reg_range;
> +	u32 link_mask;
> +	int count;
> +	void __iomem *mmio_base;
> +	acpi_handle handle;
> +	struct device *parent;
> +	struct device *dev;
> +	/* use to protect acp common registers access */
> +	struct mutex *acp_lock;
> +};
> +
> +int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **ctx);
> +
> +void sdw_amd_exit(struct sdw_amd_ctx *ctx);
> +
>  int amd_sdw_scan_controller(struct sdw_amd_acpi_info *info);
>  #endif
> -- 
> 2.34.1

-- 
~Vinod
