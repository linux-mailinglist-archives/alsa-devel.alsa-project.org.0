Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3981243F07
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 20:53:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 921F41668;
	Thu, 13 Aug 2020 20:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 921F41668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597344804;
	bh=wPRFysFY9QzkCR63w8pzJKDqiHMLuJ3CCV4wGMW6BeE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oAJkz28EOMy49irnlPvqaDoGQWYzNf9DEdDPa9PNLeVmlU1dNV/TsLKHLNWgeRfdR
	 49MPaJwdOl8O3LZlDpPhrSAy0yJzFwQtN0GSOS2GYdlBIt2l9gH7FFvjtSjiegG12q
	 ELSCqrzQTYdPK1v39LDoPAuHLHjzh2+gDqeOqHPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA4E0F8014C;
	Thu, 13 Aug 2020 20:51:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7833F8015B; Thu, 13 Aug 2020 20:51:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5277F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 20:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5277F800F4
IronPort-SDR: oC1sXHXvXpDLLo/cqV29dyfgsGRDjwGYaqc5KuMYbHDKrnjGkFU5CyWaCMIHiWlZRp62LZ74ED
 DVJmk0KHrr/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="133829386"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="133829386"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 11:51:34 -0700
IronPort-SDR: s5UiLBxVfB17waFzE5IGc/kokTfUzKKyMt8JC4l7FQnpwfTJFCIkgJ5zbD2zVf+yWcy6SJZKSf
 3YSSLXJAPhJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="325506606"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2020 11:51:30 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k6IK1-008Urp-Ao; Thu, 13 Aug 2020 21:51:29 +0300
Date: Thu, 13 Aug 2020 21:51:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
Message-ID: <20200813185129.GB1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812205753.29115-3-cezary.rojewski@intel.com>
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

On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:
> Implement dsp lifecycle functions such as core RESET and STALL,
> SRAM power control and LP clock selection. This also adds functions for
> handling transport over DW DMA controller.

...

> +static void catpt_dma_transfer_complete(void *arg)
> +{
> +	struct catpt_dev *cdev = arg;
> +

> +	dev_dbg(cdev->dev, "%s\n", __func__);

Noise. Somebody should provide either trace events, of get used to function tracer / perf.

> +}

...

> +static bool catpt_dma_filter(struct dma_chan *chan, void *param)
> +{

> +	return chan->device->dev == (struct device *)param;

Redundant casting, and please, consider to swap left and right side (in this
case easily to find these and perhaps provide a generic helper function).

> +}

...

> +#define CATPT_DMA_DEVID		1 /* dma engine used */

Not sure I understand what exactly this means.

...

> +#define CATPT_DMA_MAXBURST	0x3

We have DMA engine definitions for that, please avoid magic numbers.

...

> +#define CATPT_DMA_DSP_ADDR_MASK	0xFFF00000

GENMASK()

...

> +	dma_cap_set(DMA_SLAVE, mask);

How this helps with mem2mem channel?

...

> +	chan = dma_request_channel(mask, catpt_dma_filter, cdev->dev);
> +	if (!chan) {
> +		dev_err(cdev->dev, "request channel failed\n");

> +		dump_stack();

Huh?!

> +		return ERR_PTR(-EPROBE_DEFER);
> +	}

...

> +	status = dma_wait_for_async_tx(desc);

> +	catpt_updatel_shim(cdev, HMDC,
> +			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id), 0);

Update even in erroneous case?

> +	return (status == DMA_COMPLETE) ? 0 : -EPROTO;

...

> +static void catpt_dsp_set_srampge(struct catpt_dev *cdev, struct resource *sram,
> +				  unsigned long mask, unsigned long new)
> +{
> +	unsigned long old;
> +	u32 off = sram->start;
> +	u32 b = __ffs(mask);
> +
> +	old = catpt_readl_pci(cdev, VDRTCTL0) & mask;

> +	dev_dbg(cdev->dev, "SRAMPGE [0x%08lx] 0x%08lx -> 0x%08lx",
> +		mask, old, new);

trace event / point?

> +	if (old == new)
> +		return;
> +
> +	catpt_updatel_pci(cdev, VDRTCTL0, mask, new);

> +	udelay(60);

Delays should be commented.

> +
> +	/*
> +	 * dummy read as the very first access after block enable
> +	 * to prevent byte loss in future operations
> +	 */
> +	for_each_clear_bit_from(b, &new, fls(mask)) {

fls_long()

> +		u8 buf[4];
> +
> +		/* newly enabled: new bit=0 while old bit=1 */
> +		if (test_bit(b, &old)) {
> +			dev_dbg(cdev->dev, "sanitize block %ld: off 0x%08x\n",

> +				(b - __ffs(mask)), off);

Unneeded parentheses.

> +			memcpy_fromio(buf, cdev->lpe_ba + off, sizeof(buf));
> +		}
> +		off += CATPT_MEMBLOCK_SIZE;
> +	}
> +}

...

> +	/* offset value given mask's start and invert it as ON=b0 */

> +	new <<= __ffs(mask);
> +	new = ~(new) & mask;

Unneeded parentheses.
And perhaps in one line it will be better to understand:

	new = ~(new << __ffs(mask)) & mask;

...

> +	if (waiti) {
> +		/* wait for DSP to signal WAIT state */
> +		ret = catpt_readl_poll_shim(cdev, ISD,
> +					    reg, (reg & CATPT_ISD_DCPWM),
> +					    500, 10000);
> +		if (ret < 0) {

> +			dev_warn(cdev->dev, "await WAITI timeout\n");

Shouldn't be an error level?

> +			mutex_unlock(&cdev->clk_mutex);
> +			return ret;
> +		}
> +	}

...

> +int catpt_dsp_update_lpclock(struct catpt_dev *cdev)
> +{
> +	struct catpt_stream_runtime *stream;

> +	bool lp;
> +
> +	if (list_empty(&cdev->stream_list))
> +		return catpt_dsp_select_lpclock(cdev, true, true);
> +
> +	lp = true;
> +	list_for_each_entry(stream, &cdev->stream_list, node) {
> +		if (stream->prepared) {
> +			lp = false;
> +			break;
> +		}
> +	}
> +
> +	return catpt_dsp_select_lpclock(cdev, lp, true);

Seems too much duplication.

	struct catpt_stream_runtime *stream;

	list_for_each_entry(stream, &cdev->stream_list, node) {
		if (stream->prepared)
			return catpt_dsp_select_lpclock(cdev, false, true);
	}

	return catpt_dsp_select_lpclock(cdev, true, true);


Better?

> +}

...

> +	/* set D3 */
> +	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
> +	udelay(50);

Don't we have PCI core function for this?

...

> +	/* set D0 */
> +	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);
> +	udelay(100);

Ditto.

...

> +	/* set D3 */
> +	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
> +	udelay(50);

Ditto.

...

> +	/* set D0 */
> +	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);

Ditto.

-- 
With Best Regards,
Andy Shevchenko


