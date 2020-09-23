Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B42758C9
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 15:33:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 475FD174D;
	Wed, 23 Sep 2020 15:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 475FD174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600868032;
	bh=Fx0yfh4UjsK7nbMcgPO2WNHjaoBbHkEaZ1tnKyVVYu8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J05fhdsvhBySwsdMfS64nIOa58BlIkrkypbHizzGOap03/pBUBzcr9mFx0pOJbzzt
	 hK84+oft3w2yNE+Gh78awoHhbANffm73hqYDUt1+eUb0547qRszuMQexM4xhUPgJH7
	 WDuDkFdTPV9w0yWEUalzBMDW9UJLuk2zvyF55wII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FE8AF802E1;
	Wed, 23 Sep 2020 15:31:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3943F802DD; Wed, 23 Sep 2020 15:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31B58F802DC
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 15:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31B58F802DC
IronPort-SDR: dJZNla4XblViFZpRAB2+uKS1MyRaFZT15/mrkTJsZBs/nEhfVTwWNpNnxdpaUlkVVnfrnh3t7o
 nLmo1vf1bsKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="148626910"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="148626910"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:31:33 -0700
IronPort-SDR: fT4zQUv5/otAk56Tpv9ds+PRG8g14vZwew9ur2M0mx/jxCj8Yz2bnnMR0BqnaYfzMZK0mwFLxL
 Yo+utiyHlpjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="338659950"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 23 Sep 2020 06:31:29 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kL4rl-001P8w-Hz; Wed, 23 Sep 2020 16:31:25 +0300
Date: Wed, 23 Sep 2020 16:31:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v8 07/14] ASoC: Intel: catpt: Device driver lifecycle
Message-ID: <20200923133125.GK3956970@smile.fi.intel.com>
References: <20200923122508.3360-1-cezary.rojewski@intel.com>
 <20200923122508.3360-8-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923122508.3360-8-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On Wed, Sep 23, 2020 at 02:25:01PM +0200, Cezary Rojewski wrote:
> Implement ACPI device probing and removal functions as well as handlers
> for its PM capabilities. Device probing also takes care of enumerating
> ADSP subsystem components.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/catpt/device.c | 344 +++++++++++++++++++++++++++++++++
>  1 file changed, 344 insertions(+)
>  create mode 100644 sound/soc/intel/catpt/device.c
> 
> diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
> new file mode 100644
> index 000000000000..e7dc2fb69ea8
> --- /dev/null
> +++ b/sound/soc/intel/catpt/device.c
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright(c) 2020 Intel Corporation. All rights reserved.
> +//
> +// Author: Cezary Rojewski <cezary.rojewski@intel.com>
> +//
> +// Special thanks to:
> +//    Marcin Barlik <marcin.barlik@intel.com>
> +//    Piotr Papierkowski <piotr.papierkowski@intel.com>
> +//
> +// for sharing LPT-LP and WTP-LP AudioDSP architecture expertise and
> +// helping backtrack its historical background
> +//
> +
> +#include <linux/acpi.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <sound/soc.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/soc-acpi-intel-match.h>
> +#include "core.h"
> +#include "registers.h"
> +
> +static int __maybe_unused catpt_suspend(struct device *dev)
> +{
> +	struct catpt_dev *cdev = dev_get_drvdata(dev);
> +	struct dma_chan *chan;
> +	int ret;
> +
> +	chan = catpt_dma_request_config_chan(cdev);
> +	if (IS_ERR(chan))
> +		return PTR_ERR(chan);
> +
> +	memset(&cdev->dx_ctx, 0, sizeof(cdev->dx_ctx));
> +	ret = catpt_ipc_enter_dxstate(cdev, CATPT_DX_STATE_D3, &cdev->dx_ctx);
> +	if (ret) {
> +		ret = CATPT_IPC_ERROR(ret);
> +		goto release_dma_chan;
> +	}
> +
> +	ret = catpt_dsp_stall(cdev, true);
> +	if (ret)
> +		goto release_dma_chan;
> +
> +	ret = catpt_store_memdumps(cdev, chan);
> +	if (ret) {
> +		dev_err(cdev->dev, "store memdumps failed: %d\n", ret);
> +		goto release_dma_chan;
> +	}
> +
> +	ret = catpt_store_module_states(cdev, chan);
> +	if (ret) {
> +		dev_err(cdev->dev, "store module states failed: %d\n", ret);
> +		goto release_dma_chan;
> +	}
> +
> +	ret = catpt_store_streams_context(cdev, chan);
> +	if (ret)
> +		dev_err(cdev->dev, "store streams ctx failed: %d\n", ret);
> +
> +release_dma_chan:
> +	dma_release_channel(chan);
> +	if (ret)
> +		return ret;
> +	return cdev->spec->power_down(cdev);
> +}
> +
> +static int __maybe_unused catpt_resume(struct device *dev)
> +{
> +	struct catpt_dev *cdev = dev_get_drvdata(dev);
> +	int ret, i;
> +
> +	ret = cdev->spec->power_up(cdev);
> +	if (ret)
> +		return ret;
> +
> +	if (!module_is_live(dev->driver->owner)) {
> +		dev_info(dev, "module unloading, skipping fw boot\n");
> +		return 0;
> +	}
> +
> +	ret = catpt_boot_firmware(cdev, true);
> +	if (ret) {
> +		dev_err(cdev->dev, "boot firmware failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* reconfigure SSP devices after Dx transition */
> +	for (i = 0; i < CATPT_SSP_COUNT; i++) {
> +		if (cdev->devfmt[i].iface == UINT_MAX)
> +			continue;
> +
> +		ret = catpt_ipc_set_device_format(cdev, &cdev->devfmt[i]);
> +		if (ret)
> +			return CATPT_IPC_ERROR(ret);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused catpt_runtime_suspend(struct device *dev)
> +{
> +	return catpt_suspend(dev);
> +}
> +
> +static int __maybe_unused catpt_runtime_resume(struct device *dev)
> +{
> +	return catpt_resume(dev);
> +}
> +
> +static const struct dev_pm_ops catpt_dev_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(catpt_suspend, catpt_resume)
> +	SET_RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_runtime_resume, NULL)
> +};
> +
> +/* machine board owned by CATPT is removed with this hook */
> +static void board_pdev_unregister(void *data)
> +{
> +	platform_device_unregister(data);
> +}
> +
> +static int catpt_register_board(struct catpt_dev *cdev)
> +{
> +	const struct catpt_spec *spec = cdev->spec;
> +	struct snd_soc_acpi_mach *mach;
> +	struct platform_device *board;
> +
> +	mach = snd_soc_acpi_find_machine(spec->machines);
> +	if (!mach) {
> +		dev_info(cdev->dev, "no machines present\n");
> +		return 0;
> +	}
> +
> +	mach->mach_params.platform = "catpt-platform";
> +	board = platform_device_register_data(NULL, mach->drv_name,
> +					PLATFORM_DEVID_NONE,
> +					(const void *)mach, sizeof(*mach));
> +	if (IS_ERR(board)) {
> +		dev_err(cdev->dev, "board register failed\n");
> +		return PTR_ERR(board);
> +	}
> +
> +	return devm_add_action_or_reset(cdev->dev, board_pdev_unregister,
> +					board);
> +}
> +
> +static int catpt_probe_components(struct catpt_dev *cdev)
> +{
> +	int ret;
> +
> +	ret = cdev->spec->power_up(cdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = catpt_dmac_probe(cdev);
> +	if (ret) {
> +		dev_err(cdev->dev, "DMAC probe failed: %d\n", ret);
> +		goto err_dmac_probe;
> +	}
> +
> +	ret = catpt_first_boot_firmware(cdev);
> +	if (ret) {
> +		dev_err(cdev->dev, "first fw boot failed: %d\n", ret);
> +		goto err_boot_fw;
> +	}
> +
> +	ret = catpt_register_plat_component(cdev);
> +	if (ret) {
> +		dev_err(cdev->dev, "register plat comp failed: %d\n", ret);
> +		goto err_boot_fw;
> +	}
> +
> +	ret = catpt_register_board(cdev);
> +	if (ret) {
> +		dev_err(cdev->dev, "register board failed: %d\n", ret);
> +		goto err_reg_board;
> +	}
> +
> +	/* reflect actual ADSP state in pm_runtime */
> +	pm_runtime_set_active(cdev->dev);
> +
> +	pm_runtime_set_autosuspend_delay(cdev->dev, 2000);
> +	pm_runtime_use_autosuspend(cdev->dev);
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_enable(cdev->dev);
> +	return 0;
> +
> +err_reg_board:
> +	snd_soc_unregister_component(cdev->dev);
> +err_boot_fw:
> +	catpt_dmac_remove(cdev);
> +err_dmac_probe:
> +	cdev->spec->power_down(cdev);
> +
> +	return ret;
> +}
> +
> +static void catpt_dev_init(struct catpt_dev *cdev, struct device *dev,
> +			   const struct catpt_spec *spec)
> +{
> +	cdev->dev = dev;
> +	cdev->spec = spec;
> +	init_completion(&cdev->fw_ready);
> +	INIT_LIST_HEAD(&cdev->stream_list);
> +	spin_lock_init(&cdev->list_lock);
> +	mutex_init(&cdev->clk_mutex);
> +
> +	/*
> +	 * Mark both device formats as uninitialized. Once corresponding
> +	 * cpu_dai's pcm is created, proper values are assigned.
> +	 */
> +	cdev->devfmt[CATPT_SSP_IFACE_0].iface = UINT_MAX;
> +	cdev->devfmt[CATPT_SSP_IFACE_1].iface = UINT_MAX;
> +
> +	catpt_ipc_init(&cdev->ipc, dev);
> +
> +	catpt_sram_init(&cdev->dram, spec->host_dram_offset,
> +			catpt_dram_size(cdev));
> +	catpt_sram_init(&cdev->iram, spec->host_iram_offset,
> +			catpt_iram_size(cdev));
> +}
> +
> +static int catpt_acpi_probe(struct platform_device *pdev)
> +{
> +	const struct catpt_spec *spec;
> +	struct catpt_dev *cdev;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	int ret;
> +
> +	spec = device_get_match_data(dev);
> +	if (!spec)
> +		return -ENODEV;
> +
> +	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +	if (!cdev)
> +		return -ENOMEM;
> +
> +	catpt_dev_init(cdev, dev, spec);
> +
> +	/* map DSP bar address */
> +	cdev->lpe_ba = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(cdev->lpe_ba))
> +		return PTR_ERR(cdev->lpe_ba);
> +	cdev->lpe_base = res->start;
> +
> +	/* map PCI bar address */
> +	cdev->pci_ba = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(cdev->pci_ba))
> +		return PTR_ERR(cdev->pci_ba);
> +
> +	/* alloc buffer for storing DRAM context during dx transitions */
> +	cdev->dxbuf_vaddr = dmam_alloc_coherent(dev, catpt_dram_size(cdev),
> +						&cdev->dxbuf_paddr, GFP_KERNEL);
> +	if (!cdev->dxbuf_vaddr)
> +		return -ENOMEM;
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
> +	cdev->irq = ret;
> +
> +	platform_set_drvdata(pdev, cdev);
> +
> +	ret = devm_request_threaded_irq(dev, cdev->irq, catpt_dsp_irq_handler,
> +					catpt_dsp_irq_thread,
> +					IRQF_SHARED, "AudioDSP", cdev);
> +	if (ret)
> +		return ret;
> +
> +	return catpt_probe_components(cdev);
> +}
> +
> +static int catpt_acpi_remove(struct platform_device *pdev)
> +{
> +	struct catpt_dev *cdev = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(cdev->dev);
> +
> +	snd_soc_unregister_component(cdev->dev);
> +	catpt_dmac_remove(cdev);
> +	cdev->spec->power_down(cdev);
> +
> +	catpt_sram_free(&cdev->iram);
> +	catpt_sram_free(&cdev->dram);
> +
> +	return 0;
> +}
> +
> +static struct catpt_spec lpt_desc = {
> +	.machines = snd_soc_acpi_intel_haswell_machines,
> +	.core_id = 0x01,
> +	.host_dram_offset = 0x000000,
> +	.host_iram_offset = 0x080000,
> +	.host_shim_offset = 0x0E7000,
> +	.host_dma_offset = { 0x0F0000, 0x0F8000 },
> +	.host_ssp_offset = { 0x0E8000, 0x0E9000 },
> +	.dram_mask = LPT_VDRTCTL0_DSRAMPGE_MASK,
> +	.iram_mask = LPT_VDRTCTL0_ISRAMPGE_MASK,
> +	.pll_shutdown = lpt_dsp_pll_shutdown,
> +	.power_up = lpt_dsp_power_up,
> +	.power_down = lpt_dsp_power_down,
> +};
> +
> +static struct catpt_spec wpt_desc = {
> +	.machines = snd_soc_acpi_intel_broadwell_machines,
> +	.core_id = 0x02,
> +	.host_dram_offset = 0x000000,
> +	.host_iram_offset = 0x0A0000,
> +	.host_shim_offset = 0x0FB000,
> +	.host_dma_offset = { 0x0FE000, 0x0FF000 },
> +	.host_ssp_offset = { 0x0FC000, 0x0FD000 },
> +	.dram_mask = WPT_VDRTCTL0_DSRAMPGE_MASK,
> +	.iram_mask = WPT_VDRTCTL0_ISRAMPGE_MASK,
> +	.pll_shutdown = wpt_dsp_pll_shutdown,
> +	.power_up = wpt_dsp_power_up,
> +	.power_down = wpt_dsp_power_down,
> +};
> +
> +static const struct acpi_device_id catpt_ids[] = {
> +	{ "INT33C8", (unsigned long)&lpt_desc },
> +	{ "INT3438", (unsigned long)&wpt_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, catpt_ids);
> +
> +static struct platform_driver catpt_acpi_driver = {
> +	.probe = catpt_acpi_probe,
> +	.remove = catpt_acpi_remove,
> +	.driver = {
> +		.name = "intel_catpt",
> +		.acpi_match_table = catpt_ids,
> +		.pm = &catpt_dev_pm,
> +	},
> +};
> +module_platform_driver(catpt_acpi_driver);
> +
> +MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
> +MODULE_DESCRIPTION("Intel LPT/WPT AudioDSP driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


