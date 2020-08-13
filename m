Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36B243EE1
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 20:33:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755E61660;
	Thu, 13 Aug 2020 20:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755E61660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597343602;
	bh=PXHv/Q7s3K2B7tS7l6p1/5zLvKsnaEaWeZozIyOUwjw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EiezY5UTriJITPiwYNBVUKos4hXQkQgb0up7jdCVxGRodlHFd/sH19nRhbmCa15ru
	 2p+bSuOCeJ7ipMQYTFF1TN8y0+n6zXuLua1WhFaWxCvAMl2mqRtGdjSOHE/yQe1gfS
	 UNxk7SXqnu2RlPXvZNi+Ry2+GuvEPLEiGpx2wwgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C06F80161;
	Thu, 13 Aug 2020 20:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37FC4F8015B; Thu, 13 Aug 2020 20:31:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02BF8F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 20:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02BF8F800F4
IronPort-SDR: a5PkVUlqVxcSFqArNYi45GY3Oo3eCst93MtqotVMULH+ciYN+D7FsJCsKQ5+nRfG49w2uQR0gl
 Qgua6FINMdFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="153531503"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="153531503"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 11:31:24 -0700
IronPort-SDR: VT4x6Td6kwllOIF7lEqn7Ke3D5r7qwsMRUI1zfe2025WhjPGSav1uaU1U+iXfOzkThVLZpX/SK
 29Z7Pn1p7GMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="325501939"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2020 11:31:19 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k6HyO-008UdG-Hc; Thu, 13 Aug 2020 21:29:08 +0300
Date: Thu, 13 Aug 2020 21:29:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 01/13] ASoC: Intel: Add catpt device
Message-ID: <20200813182908.GA1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-2-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812205753.29115-2-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

On Wed, Aug 12, 2020 at 10:57:41PM +0200, Cezary Rojewski wrote:
> Declare base structures, registers and device routines for the catpt
> solution. Catpt deprecates and is a direct replacement for
> sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point both.

Before doing v5 give a chance to review entire series, please!

...

> +static inline bool catpt_resource_overlapping(struct resource *r1,
> +					      struct resource *r2,
> +					      struct resource *ret)
> +{
> +	if (!resource_overlaps(r1, r2))
> +		return false;
> +	ret->start = max(r1->start, r2->start);
> +	ret->end = min(r1->end, r2->end);
> +	return true;
> +}

JFYI, I have just submitted a series [1] that includes this helper [2]
to be available for all.

[1]: https://lore.kernel.org/linux-acpi/20200813175729.15088-1-andriy.shevchenko@linux.intel.com/
[2]: https://lore.kernel.org/linux-acpi/20200813175729.15088-4-andriy.shevchenko@linux.intel.com/

...

> +struct catpt_dev {
> +	struct device *dev;

> +	struct dw_dma_chip *dmac;

Is it possible to use opaque pointer here? It will be better if in the future
(I think unlikely, but still) somebody decides to use this with another DMA
engine.

> +	struct catpt_ipc ipc;
> +
> +	void __iomem *pci_ba;
> +	void __iomem *lpe_ba;
> +	u32 lpe_base;
> +	int irq;
> +
> +	const struct catpt_spec *spec;
> +	struct completion fw_ready;
> +
> +	struct resource dram;
> +	struct resource iram;
> +	struct resource *scratch;
> +
> +	struct catpt_mixer_stream_info mixer;
> +	struct catpt_module_type modules[CATPT_MODULE_COUNT];
> +	struct catpt_ssp_device_format devfmt[CATPT_SSP_COUNT];
> +	struct list_head stream_list;
> +	spinlock_t list_lock;
> +	struct mutex clk_mutex;
> +
> +	struct catpt_dx_context dx_ctx;
> +	void *dxbuf_vaddr;
> +	dma_addr_t dxbuf_paddr;
> +};

...

> +#define CATPT_IPC_ERROR(err) ((err < 0) ? err : -EREMOTEIO)

err -> (err) in all cases of right side.

...

> +struct catpt_stream_runtime {
> +	struct snd_pcm_substream *substream;
> +
> +	struct catpt_stream_template *template;
> +	struct catpt_stream_info info;
> +	struct resource *persistent;
> +	struct snd_dma_buffer pgtbl;
> +

> +	bool allocated:1;
> +	bool prepared:1;

Does this ':1' make any sense?

> +	struct list_head node;
> +};

...

> +#ifdef CONFIG_PM

Perhaps __maybe_unused?

...

> +	ret = catpt_dsp_stall(cdev, true);
> +	if (ret < 0)

I'm wondering if all these ' < 0' all over the code make sense? What do you
expect out of positive returned values if any?

> +		goto exit;

...

> +#ifdef CONFIG_PM_SLEEP

Perhaps __maybe_unused?

...

> +	board = platform_device_register_data(NULL, mach->drv_name,
> +					PLATFORM_DEVID_NONE,
> +					(const void *)mach, sizeof(*mach));
> +	if (!board) {

Here obviously not correct check.

> +		dev_err(cdev->dev, "board register failed\n");
> +		return PTR_ERR(board);
> +	}
> +
> +	ret = devm_add_action(cdev->dev, board_pdev_unregister, board);
> +	if (ret < 0) {
> +		platform_device_unregister(board);

> +		return ret;
> +	}
> +
> +	return 0;

return ret;

...

> +	mutex_init(&cdev->clk_mutex);

+ blank line.

> +	/*
> +	 * Mark both device formats as uninitialized. Once corresponding
> +	 * cpu_dai's pcm is created, proper values are assigned

Please, use period(s) in multi-line comments.

> +	 */

...

> +static int catpt_acpi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct catpt_dev *cdev;
> +	struct resource *res;
> +	int ret;
> +
> +	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +	if (!cdev)
> +		return -ENOMEM;


> +	cdev->spec = device_get_match_data(dev);
> +	if (!cdev->spec)
> +		return -ENODEV;

You may save some cycles if you do this before memory allocations.

> +	catpt_dev_init(cdev, dev);
> +
> +	/* map DSP bar address */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +	cdev->lpe_ba = devm_ioremap(dev, res->start, resource_size(res));
> +	if (!cdev->lpe_ba)
> +		return -EIO;
> +	cdev->lpe_base = res->start;

Why the region is not get requested?

> +	/* map PCI bar address */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return -ENODEV;
> +	cdev->pci_ba = devm_ioremap(dev, res->start, resource_size(res));
> +	if (!cdev->pci_ba)
> +		return -EIO;

Ditto.

> +	/* alloc buffer for storing DRAM context during dx transitions */
> +	cdev->dxbuf_vaddr = dma_alloc_coherent(dev, catpt_dram_size(cdev),

dmam_alloc_coherent() ?

> +					       &cdev->dxbuf_paddr, GFP_KERNEL);
> +	if (!cdev->dxbuf_vaddr)
> +		return -ENOMEM;

> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		goto irq_err;
> +	cdev->irq = ret;

But you may return directly if you get IRQ resource before allocation (despite
previous comment).

> +
> +	platform_set_drvdata(pdev, cdev);
> +
> +	ret = devm_request_threaded_irq(dev, cdev->irq, catpt_dsp_irq_handler,
> +					catpt_dsp_irq_thread,
> +					IRQF_SHARED, "AudioDSP", cdev);
> +	if (ret < 0)
> +		goto irq_err;
> +
> +	ret = catpt_probe_components(cdev);

return ...

> +	if (ret < 0)
> +		goto irq_err;
> +	return 0;
> +
> +irq_err:
> +	dma_free_coherent(cdev->dev, catpt_dram_size(cdev),
> +			  cdev->dxbuf_vaddr, cdev->dxbuf_paddr);
> +
> +	return ret;

This will be gone...

> +}

...

> +static const struct acpi_device_id catpt_ids[] = {
> +	{ "INT33C8", (unsigned long)&lpt_desc },
> +	{ "INT3438", (unsigned long)&wpt_desc },

> +	{ },

No need to have comma in terminator line.

> +};

...

> +static struct platform_driver catpt_acpi_driver = {
> +	.probe = catpt_acpi_probe,
> +	.remove = catpt_acpi_remove,
> +	.driver = {
> +		.name = "catpt_adsp",

> +		.acpi_match_table = ACPI_PTR(catpt_ids),

ACPI_PTR() either bogus (when you have depends on ACPI) or mistake that brings
you compiler warning (unused variable).

I highly recommend in new code avoid completely ACPI_PTR() and of_match_ptr()
macros.

> +		.pm = &catpt_dev_pm,
> +	},
> +};

...

> +#include <linux/iopoll.h>

Missed headers:
bits.h (note, the below guarantees to provide this one)
bitops.h
io.h (writel(), readl(), etc)

...

> +/* DSP Shim registers */
> +
> +#define CATPT_SHIM_CS1		0x0

Please, keep all register definitions of the same width, like 0x00 here or so.

...

> +#define CATPT_CS_SFCR(ssp)	BIT(27 + ssp)

In all macros, try to be a little bit defensive, e.g. here ssp -> (ssp).

...

> +#define CATPT_HMDC_HDDA(e, ch)	BIT(8 * e + ch)

...or e -> (e) and ch -> (ch) here.

...

> +#define CATPT_CS_DEFAULT	0x8480040E
> +#define CATPT_IMC_DEFAULT	0x7FFF0003
> +#define CATPT_IMD_DEFAULT	0x7FFF0003
> +#define CATPT_CLKCTL_DEFAULT	0x7FF

These looks like set of bit fields, can we describe them either in comments
or in the values like GENMASK(x, y) | BIT(z) ?

...

> +/* PCI Configuration registers */
> +
> +#define CATPT_PCI_PMCS		0x84

Why?! We have PCI capability and entire infrastructure for that in PCI core.

...

> +#define CATPT_PMCS_PS		GENMASK(1, 0)
> +#define CATPT_PMCS_PS_D3HOT	(0x3 << 0)

Ditto.

...

> +#define CATPT_SSP_SSC0		0x0
> +#define CATPT_SSP_SSC1		0x4
> +#define CATPT_SSP_SSS		0x8
> +#define CATPT_SSP_SSIT		0xC
> +#define CATPT_SSP_SSD		0x10
> +#define CATPT_SSP_SSTO		0x28
> +#define CATPT_SSP_SSPSP		0x2C
> +#define CATPT_SSP_SSTSA		0x30
> +#define CATPT_SSP_SSRSA		0x34
> +#define CATPT_SSP_SSTSS		0x38
> +#define CATPT_SSP_SSC2		0x40
> +#define CATPT_SSP_SSPSP2	0x44

Isn't it PXA2xx register set? Can you use their definitions?

...

> +#define CATPT_SSP_SSC0_DEFAULT		0x0
> +#define CATPT_SSP_SSC1_DEFAULT		0x0
> +#define CATPT_SSP_SSS_DEFAULT		0xF004
> +#define CATPT_SSP_SSIT_DEFAULT		0x0
> +#define CATPT_SSP_SSD_DEFAULT		0xC43893A3
> +#define CATPT_SSP_SSTO_DEFAULT		0x0
> +#define CATPT_SSP_SSPSP_DEFAULT		0x0
> +#define CATPT_SSP_SSTSA_DEFAULT		0x0
> +#define CATPT_SSP_SSRSA_DEFAULT		0x0
> +#define CATPT_SSP_SSTSS_DEFAULT		0x0
> +#define CATPT_SSP_SSC2_DEFAULT		0x0
> +#define CATPT_SSP_SSPSP2_DEFAULT	0x0

These defaults lack of comments.

-- 
With Best Regards,
Andy Shevchenko


