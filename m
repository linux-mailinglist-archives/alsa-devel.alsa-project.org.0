Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7392758BD
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 15:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 946E51754;
	Wed, 23 Sep 2020 15:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 946E51754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600867883;
	bh=pBjAj7vmYEn7AiRSESWzHUsE7ZIJpJ2u4w9rpkzLsj0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7BR2d8ZnL/i7Pj/1NoBG086GaY0CYKTusjtfAqe63S7ptyY1ZDJ4q7j+pN3JKv24
	 Hvi9WkoMjM2lr0kXWGawXEAEoucTHQxP18I9nJnZDd5/lQNkhdxYVw9gJJ+nA6PIXh
	 2qKxlhrzBnAPaelumyd81ANbKLoCfLQrGD/5aSc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE65F802FF;
	Wed, 23 Sep 2020 15:26:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A720F802FE; Wed, 23 Sep 2020 15:26:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 445C9F802F8
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 15:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 445C9F802F8
IronPort-SDR: KexSyhCqM4NtD9rt/FHJ+4cxVYayTBIJ+KyTwmxCZ8T2MD8H+YlFm/yEL5oePPmyCStGVqcL0G
 duBx4Ymo6YbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="140897765"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="140897765"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:26:43 -0700
IronPort-SDR: vDxY2jLBLHDluPbluN3cwYpQEuZ6XVmS0c+EQ9gkazXJpP6uYhZxxp5d62Joj02H/bsu9w0Pj7
 nKoiwVfBnJvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="338658619"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 23 Sep 2020 06:26:38 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kL4n4-001P4i-SZ; Wed, 23 Sep 2020 16:26:34 +0300
Date: Wed, 23 Sep 2020 16:26:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v8 04/14] ASoC: Intel: catpt: Define DSP operations
Message-ID: <20200923132634.GH3956970@smile.fi.intel.com>
References: <20200923122508.3360-1-cezary.rojewski@intel.com>
 <20200923122508.3360-5-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923122508.3360-5-cezary.rojewski@intel.com>
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

On Wed, Sep 23, 2020 at 02:24:58PM +0200, Cezary Rojewski wrote:
> Implement dsp lifecycle functions such as core RESET and STALL,
> SRAM power control and LP clock selection. This also adds functions for
> handling transport over DW DMA controller.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/catpt/core.h |  34 ++++
>  sound/soc/intel/catpt/dsp.c  | 334 +++++++++++++++++++++++++++++++++++
>  2 files changed, 368 insertions(+)
> 
> diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
> index 3c860c0645dc..9e9b3dceedce 100644
> --- a/sound/soc/intel/catpt/core.h
> +++ b/sound/soc/intel/catpt/core.h
> @@ -99,6 +99,10 @@ struct catpt_dev {
>  	struct resource dram;
>  	struct resource iram;
>  	struct resource *scratch;
> +
> +	struct list_head stream_list;
> +	spinlock_t list_lock;
> +	struct mutex clk_mutex;
>  };
>  
>  int catpt_dmac_probe(struct catpt_dev *cdev);
> @@ -111,6 +115,16 @@ int catpt_dma_memcpy_fromdsp(struct catpt_dev *cdev, struct dma_chan *chan,
>  			     dma_addr_t dst_addr, dma_addr_t src_addr,
>  			     size_t size);
>  
> +void lpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable);
> +void wpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable);
> +int lpt_dsp_power_up(struct catpt_dev *cdev);
> +int lpt_dsp_power_down(struct catpt_dev *cdev);
> +int wpt_dsp_power_up(struct catpt_dev *cdev);
> +int wpt_dsp_power_down(struct catpt_dev *cdev);
> +int catpt_dsp_stall(struct catpt_dev *cdev, bool stall);
> +void catpt_dsp_update_srampge(struct catpt_dev *cdev, struct resource *sram,
> +			      unsigned long mask);
> +int catpt_dsp_update_lpclock(struct catpt_dev *cdev);
>  irqreturn_t catpt_dsp_irq_handler(int irq, void *dev_id);
>  irqreturn_t catpt_dsp_irq_thread(int irq, void *dev_id);
>  
> @@ -129,4 +143,24 @@ int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
>  
>  int catpt_coredump(struct catpt_dev *cdev);
>  
> +#include <sound/memalloc.h>
> +#include <uapi/sound/asound.h>
> +
> +struct snd_pcm_substream;
> +struct catpt_stream_template;
> +
> +struct catpt_stream_runtime {
> +	struct snd_pcm_substream *substream;
> +
> +	struct catpt_stream_template *template;
> +	struct catpt_stream_info info;
> +	struct resource *persistent;
> +	struct snd_dma_buffer pgtbl;
> +
> +	bool allocated;
> +	bool prepared;
> +
> +	struct list_head node;
> +};
> +
>  #endif
> diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
> index 9d988b05c8cf..2a52d1bf4e00 100644
> --- a/sound/soc/intel/catpt/dsp.c
> +++ b/sound/soc/intel/catpt/dsp.c
> @@ -8,7 +8,10 @@
>  #include <linux/devcoredump.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/firmware.h>
> +#include <linux/pci.h>
> +#include <linux/pxa2xx_ssp.h>
>  #include "core.h"
> +#include "messages.h"
>  #include "registers.h"
>  
>  static bool catpt_dma_filter(struct dma_chan *chan, void *param)
> @@ -138,6 +141,337 @@ void catpt_dmac_remove(struct catpt_dev *cdev)
>  	dw_dma_remove(cdev->dmac);
>  }
>  
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
> +
> +	if (old == new)
> +		return;
> +
> +	catpt_updatel_pci(cdev, VDRTCTL0, mask, new);
> +	/* wait for SRAM power gating to propagate */
> +	udelay(60);
> +
> +	/*
> +	 * Dummy read as the very first access after block enable
> +	 * to prevent byte loss in future operations.
> +	 */
> +	for_each_clear_bit_from(b, &new, fls_long(mask)) {
> +		u8 buf[4];
> +
> +		/* newly enabled: new bit=0 while old bit=1 */
> +		if (test_bit(b, &old)) {
> +			dev_dbg(cdev->dev, "sanitize block %ld: off 0x%08x\n",
> +				b - __ffs(mask), off);
> +			memcpy_fromio(buf, cdev->lpe_ba + off, sizeof(buf));
> +		}
> +		off += CATPT_MEMBLOCK_SIZE;
> +	}
> +}
> +
> +void catpt_dsp_update_srampge(struct catpt_dev *cdev, struct resource *sram,
> +			      unsigned long mask)
> +{
> +	struct resource *res;
> +	unsigned long new = 0;
> +
> +	/* flag all busy blocks */
> +	for (res = sram->child; res; res = res->sibling) {
> +		u32 h, l;
> +
> +		h = (res->end - sram->start) / CATPT_MEMBLOCK_SIZE;
> +		l = (res->start - sram->start) / CATPT_MEMBLOCK_SIZE;
> +		new |= GENMASK(h, l);
> +	}
> +
> +	/* offset value given mask's start and invert it as ON=b0 */
> +	new = ~(new << __ffs(mask)) & mask;
> +
> +	/* disable core clock gating */
> +	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE, 0);
> +
> +	catpt_dsp_set_srampge(cdev, sram, mask, new);
> +
> +	/* enable core clock gating */
> +	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE,
> +			  CATPT_VDRTCTL2_DCLCGE);
> +}
> +
> +int catpt_dsp_stall(struct catpt_dev *cdev, bool stall)
> +{
> +	u32 reg, val;
> +
> +	val = stall ? CATPT_CS_STALL : 0;
> +	catpt_updatel_shim(cdev, CS1, CATPT_CS_STALL, val);
> +
> +	return catpt_readl_poll_shim(cdev, CS1,
> +				     reg, (reg & CATPT_CS_STALL) == val,
> +				     500, 10000);
> +}
> +
> +static int catpt_dsp_reset(struct catpt_dev *cdev, bool reset)
> +{
> +	u32 reg, val;
> +
> +	val = reset ? CATPT_CS_RST : 0;
> +	catpt_updatel_shim(cdev, CS1, CATPT_CS_RST, val);
> +
> +	return catpt_readl_poll_shim(cdev, CS1,
> +				     reg, (reg & CATPT_CS_RST) == val,
> +				     500, 10000);
> +}
> +
> +void lpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable)
> +{
> +	u32 val;
> +
> +	val = enable ? LPT_VDRTCTL0_APLLSE : 0;
> +	catpt_updatel_pci(cdev, VDRTCTL0, LPT_VDRTCTL0_APLLSE, val);
> +}
> +
> +void wpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable)
> +{
> +	u32 val;
> +
> +	val = enable ? WPT_VDRTCTL2_APLLSE : 0;
> +	catpt_updatel_pci(cdev, VDRTCTL2, WPT_VDRTCTL2_APLLSE, val);
> +}
> +
> +static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
> +{
> +	u32 mask, reg, val;
> +	int ret;
> +
> +	mutex_lock(&cdev->clk_mutex);
> +
> +	val = lp ? CATPT_CS_LPCS : 0;
> +	reg = catpt_readl_shim(cdev, CS1) & CATPT_CS_LPCS;
> +	dev_dbg(cdev->dev, "LPCS [0x%08lx] 0x%08x -> 0x%08x",
> +		CATPT_CS_LPCS, reg, val);
> +
> +	if (reg == val) {
> +		mutex_unlock(&cdev->clk_mutex);
> +		return 0;
> +	}
> +
> +	if (waiti) {
> +		/* wait for DSP to signal WAIT state */
> +		ret = catpt_readl_poll_shim(cdev, ISD,
> +					    reg, (reg & CATPT_ISD_DCPWM),
> +					    500, 10000);
> +		if (ret) {
> +			dev_err(cdev->dev, "await WAITI timeout\n");
> +			mutex_unlock(&cdev->clk_mutex);
> +			return ret;
> +		}
> +	}
> +
> +	ret = catpt_readl_poll_shim(cdev, CLKCTL,
> +				    reg, !(reg & CATPT_CLKCTL_CFCIP),
> +				    500, 10000);
> +	if (ret)
> +		dev_warn(cdev->dev, "clock change still in progress\n");
> +
> +	/* default to DSP core & audio fabric high clock */
> +	val |= CATPT_CS_DCS_HIGH;
> +	mask = CATPT_CS_LPCS | CATPT_CS_DCS;
> +	catpt_updatel_shim(cdev, CS1, mask, val);
> +
> +	ret = catpt_readl_poll_shim(cdev, CLKCTL,
> +				    reg, !(reg & CATPT_CLKCTL_CFCIP),
> +				    500, 10000);
> +	if (ret)
> +		dev_warn(cdev->dev, "clock change still in progress\n");
> +
> +	/* update PLL accordingly */
> +	cdev->spec->pll_shutdown(cdev, lp);
> +
> +	mutex_unlock(&cdev->clk_mutex);
> +	return 0;
> +}
> +
> +int catpt_dsp_update_lpclock(struct catpt_dev *cdev)
> +{
> +	struct catpt_stream_runtime *stream;
> +
> +	list_for_each_entry(stream, &cdev->stream_list, node)
> +		if (stream->prepared)
> +			return catpt_dsp_select_lpclock(cdev, false, true);
> +
> +	return catpt_dsp_select_lpclock(cdev, true, true);
> +}
> +
> +/* bring registers to their defaults as HW won't reset itself */
> +static void catpt_dsp_set_regs_defaults(struct catpt_dev *cdev)
> +{
> +	int i;
> +
> +	catpt_writel_shim(cdev, CS1, CATPT_CS_DEFAULT);
> +	catpt_writel_shim(cdev, ISC, CATPT_ISC_DEFAULT);
> +	catpt_writel_shim(cdev, ISD, CATPT_ISD_DEFAULT);
> +	catpt_writel_shim(cdev, IMC, CATPT_IMC_DEFAULT);
> +	catpt_writel_shim(cdev, IMD, CATPT_IMD_DEFAULT);
> +	catpt_writel_shim(cdev, IPCC, CATPT_IPCC_DEFAULT);
> +	catpt_writel_shim(cdev, IPCD, CATPT_IPCD_DEFAULT);
> +	catpt_writel_shim(cdev, CLKCTL, CATPT_CLKCTL_DEFAULT);
> +	catpt_writel_shim(cdev, CS2, CATPT_CS2_DEFAULT);
> +	catpt_writel_shim(cdev, LTRC, CATPT_LTRC_DEFAULT);
> +	catpt_writel_shim(cdev, HMDC, CATPT_HMDC_DEFAULT);
> +
> +	for (i = 0; i < CATPT_SSP_COUNT; i++) {
> +		catpt_writel_ssp(cdev, i, SSCR0, CATPT_SSC0_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSCR1, CATPT_SSC1_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSSR, CATPT_SSS_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSITR, CATPT_SSIT_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSDR, CATPT_SSD_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSTO, CATPT_SSTO_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSPSP, CATPT_SSPSP_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSTSA, CATPT_SSTSA_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSRSA, CATPT_SSRSA_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSTSS, CATPT_SSTSS_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSCR2, CATPT_SSCR2_DEFAULT);
> +		catpt_writel_ssp(cdev, i, SSPSP2, CATPT_SSPSP2_DEFAULT);
> +	}
> +}
> +
> +int lpt_dsp_power_down(struct catpt_dev *cdev)
> +{
> +	catpt_dsp_reset(cdev, true);
> +
> +	/* set 24Mhz clock for both SSPs */
> +	catpt_updatel_shim(cdev, CS1, CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1),
> +			   CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1));
> +	catpt_dsp_select_lpclock(cdev, true, false);
> +
> +	/* DRAM power gating all */
> +	catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask,
> +			      cdev->spec->dram_mask);
> +	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask,
> +			      cdev->spec->iram_mask);
> +
> +	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
> +	/* give hw time to drop off */
> +	udelay(50);
> +
> +	return 0;
> +}
> +
> +int lpt_dsp_power_up(struct catpt_dev *cdev)
> +{
> +	/* SRAM power gating none */
> +	catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask, 0);
> +	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask, 0);
> +
> +	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D0);
> +	/* give hw time to wake up */
> +	udelay(100);
> +
> +	catpt_dsp_select_lpclock(cdev, false, false);
> +	catpt_updatel_shim(cdev, CS1,
> +			   CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1),
> +			   CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1));
> +	/* stagger DSP reset after clock selection */
> +	udelay(50);
> +
> +	catpt_dsp_reset(cdev, false);
> +	/* generate int deassert msg to fix inversed int logic */
> +	catpt_updatel_shim(cdev, IMC, CATPT_IMC_IPCDB | CATPT_IMC_IPCCD, 0);
> +
> +	return 0;
> +}
> +
> +int wpt_dsp_power_down(struct catpt_dev *cdev)
> +{
> +	u32 mask, val;
> +
> +	/* disable core clock gating */
> +	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE, 0);
> +
> +	catpt_dsp_reset(cdev, true);
> +	/* set 24Mhz clock for both SSPs */
> +	catpt_updatel_shim(cdev, CS1, CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1),
> +			   CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1));
> +	catpt_dsp_select_lpclock(cdev, true, false);
> +	/* disable MCLK */
> +	catpt_updatel_shim(cdev, CLKCTL, CATPT_CLKCTL_SMOS, 0);
> +
> +	catpt_dsp_set_regs_defaults(cdev);
> +
> +	/* switch clock gating */
> +	mask = CATPT_VDRTCTL2_CGEALL & (~CATPT_VDRTCTL2_DCLCGE);
> +	val = mask & (~CATPT_VDRTCTL2_DTCGE);
> +	catpt_updatel_pci(cdev, VDRTCTL2, mask, val);
> +	/* enable DTCGE separatelly */
> +	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DTCGE,
> +			  CATPT_VDRTCTL2_DTCGE);
> +
> +	/* SRAM power gating all */
> +	catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask,
> +			      cdev->spec->dram_mask);
> +	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask,
> +			      cdev->spec->iram_mask);
> +	mask = WPT_VDRTCTL0_D3SRAMPGD | WPT_VDRTCTL0_D3PGD;
> +	catpt_updatel_pci(cdev, VDRTCTL0, mask, WPT_VDRTCTL0_D3PGD);
> +
> +	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
> +	/* give hw time to drop off */
> +	udelay(50);
> +
> +	/* enable core clock gating */
> +	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE,
> +			  CATPT_VDRTCTL2_DCLCGE);
> +	udelay(50);
> +
> +	return 0;
> +}
> +
> +int wpt_dsp_power_up(struct catpt_dev *cdev)
> +{
> +	u32 mask, val;
> +
> +	/* disable core clock gating */
> +	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE, 0);
> +
> +	/* switch clock gating */
> +	mask = CATPT_VDRTCTL2_CGEALL & (~CATPT_VDRTCTL2_DCLCGE);
> +	val = mask & (~CATPT_VDRTCTL2_DTCGE);
> +	catpt_updatel_pci(cdev, VDRTCTL2, mask, val);
> +
> +	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D0);
> +
> +	/* SRAM power gating none */
> +	mask = WPT_VDRTCTL0_D3SRAMPGD | WPT_VDRTCTL0_D3PGD;
> +	catpt_updatel_pci(cdev, VDRTCTL0, mask, mask);
> +	catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask, 0);
> +	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask, 0);
> +
> +	catpt_dsp_set_regs_defaults(cdev);
> +
> +	/* restore MCLK */
> +	catpt_updatel_shim(cdev, CLKCTL, CATPT_CLKCTL_SMOS, CATPT_CLKCTL_SMOS);
> +	catpt_dsp_select_lpclock(cdev, false, false);
> +	/* set 24Mhz clock for both SSPs */
> +	catpt_updatel_shim(cdev, CS1, CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1),
> +			   CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1));
> +	catpt_dsp_reset(cdev, false);
> +
> +	/* enable core clock gating */
> +	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE,
> +			  CATPT_VDRTCTL2_DCLCGE);
> +
> +	/* generate int deassert msg to fix inversed int logic */
> +	catpt_updatel_shim(cdev, IMC, CATPT_IMC_IPCDB | CATPT_IMC_IPCCD, 0);
> +
> +	return 0;
> +}
> +
>  #define CATPT_DUMP_MAGIC		0xcd42
>  #define CATPT_DUMP_SECTION_ID_FILE	0x00
>  #define CATPT_DUMP_SECTION_ID_IRAM	0x01
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


