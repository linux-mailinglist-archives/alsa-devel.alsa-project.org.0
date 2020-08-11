Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D285224195D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 12:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A70166C;
	Tue, 11 Aug 2020 12:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A70166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597140251;
	bh=SrcNCcfibpFox5gzxpnLdA0zsNB9xBiA2HEEF4DXWIA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tcV2KzJ8viMWGdTQDDfydIbcMShyGBvlF4zX7nT+d+fxUqZjL0zwhQSd15aJCCbCO
	 mDKB1GEWU8KBKZQnLEVr9ItROeAwzAPB8dq1uJXb01h+GXboVkWgOUiXcsrj0n6wJS
	 NoBklUHvOdElRqX8mhaEIZZ8bp+8vBSI8GmDKI2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3BA1F802E2;
	Tue, 11 Aug 2020 12:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5453EF802DB; Tue, 11 Aug 2020 12:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FFD3F8015B
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 12:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FFD3F8015B
IronPort-SDR: XKPXINxce1ewm0wcfNWsAUAWrIHxwM0F8YHVPH2WG3YDMCcTGxuSxWYtserN/Afs/hXDZtyNEi
 N2oiGCYB/o4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="152924770"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="152924770"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 03:00:57 -0700
IronPort-SDR: fAGRFdcPb3nDYJigy6VZiGGvuE+3BdwlG6eiCxZDVz7vrUGQriN8RyRu+DNN6V9lGX9Jzfgthw
 JAkx92yG0K0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="494625238"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2020 03:00:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/13] ASoC: Intel: catpt: Define DSP operations
Date: Tue, 11 Aug 2020 12:00:23 +0200
Message-Id: <20200811100034.6875-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811100034.6875-1-cezary.rojewski@intel.com>
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
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

Implement dsp lifecycle functions such as core RESET and STALL,
SRAM power control and LP clock selection. This also adds functions for
handling transport over DW DMA controller.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/dsp.c | 497 ++++++++++++++++++++++++++++++++++++
 1 file changed, 497 insertions(+)
 create mode 100644 sound/soc/intel/catpt/dsp.c

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
new file mode 100644
index 000000000000..7752a1be0158
--- /dev/null
+++ b/sound/soc/intel/catpt/dsp.c
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/dma-mapping.h>
+#include <linux/acpi_dma.h>
+#include <linux/firmware.h>
+#include "core.h"
+#include "messages.h"
+#include "registers.h"
+#include "trace.h"
+
+static void catpt_dma_transfer_complete(void *arg)
+{
+	struct catpt_dev *cdev = arg;
+
+	dev_dbg(cdev->dev, "%s\n", __func__);
+}
+
+static bool catpt_dma_filter(struct dma_chan *chan, void *param)
+{
+	return chan->device->dev == (struct device *)param;
+}
+
+#define CATPT_DMA_DEVID		1 /* dma engine used */
+#define CATPT_DMA_MAXBURST	0x3
+#define CATPT_DMA_DSP_ADDR_MASK	0xFFF00000
+
+struct dma_chan *catpt_dma_request_config_chan(struct catpt_dev *cdev)
+{
+	struct dma_slave_config config;
+	struct dma_chan *chan;
+	dma_cap_mask_t mask;
+	int ret;
+
+	dma_cap_zero(mask);
+	dma_cap_set(DMA_SLAVE, mask);
+	dma_cap_set(DMA_MEMCPY, mask);
+
+	chan = dma_request_channel(mask, catpt_dma_filter, cdev->dev);
+	if (!chan) {
+		dev_err(cdev->dev, "request channel failed\n");
+		dump_stack();
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	memset(&config, 0, sizeof(config));
+	config.direction = DMA_MEM_TO_DEV;
+	config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	config.src_maxburst = CATPT_DMA_MAXBURST;
+	config.dst_maxburst = CATPT_DMA_MAXBURST;
+
+	ret = dmaengine_slave_config(chan, &config);
+	if (ret) {
+		dev_err(cdev->dev, "slave config failed: %d\n", ret);
+		dma_release_channel(chan);
+		return ERR_PTR(ret);
+	}
+
+	return chan;
+}
+
+static int catpt_dma_memcpy(struct catpt_dev *cdev, struct dma_chan *chan,
+			    dma_addr_t dst_addr, dma_addr_t src_addr,
+			    size_t size)
+{
+	struct dma_async_tx_descriptor *desc;
+	enum dma_status status;
+
+	desc = dmaengine_prep_dma_memcpy(chan, dst_addr, src_addr, size,
+					 DMA_CTRL_ACK);
+	if (!desc) {
+		dev_err(cdev->dev, "prep dma memcpy failed\n");
+		return -EIO;
+	}
+
+	/* enable demand mode for dma channel */
+	catpt_updatel_shim(cdev, HMDC,
+			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id),
+			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id));
+	desc->callback = catpt_dma_transfer_complete;
+	desc->callback_param = cdev;
+	dmaengine_submit(desc);
+
+	status = dma_wait_for_async_tx(desc);
+	catpt_updatel_shim(cdev, HMDC,
+			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id), 0);
+
+	return (status == DMA_COMPLETE) ? 0 : -EPROTO;
+}
+
+int catpt_dma_memcpy_todsp(struct catpt_dev *cdev, struct dma_chan *chan,
+			   dma_addr_t dst_addr, dma_addr_t src_addr,
+			   size_t size)
+{
+	return catpt_dma_memcpy(cdev, chan, dst_addr | CATPT_DMA_DSP_ADDR_MASK,
+				src_addr, size);
+}
+
+int catpt_dma_memcpy_fromdsp(struct catpt_dev *cdev, struct dma_chan *chan,
+			     dma_addr_t dst_addr, dma_addr_t src_addr,
+			     size_t size)
+{
+	return catpt_dma_memcpy(cdev, chan, dst_addr,
+				src_addr | CATPT_DMA_DSP_ADDR_MASK, size);
+}
+
+int catpt_dmac_probe(struct catpt_dev *cdev)
+{
+	struct dw_dma_chip *dmac;
+	struct resource res;
+	int ret;
+
+	dmac = devm_kzalloc(cdev->dev, sizeof(*dmac), GFP_KERNEL);
+	if (!dmac)
+		return -ENOMEM;
+
+	memset(&res, 0, sizeof(res));
+	res.start = cdev->lpe_base +
+		    cdev->spec->host_dma_offset[CATPT_DMA_DEVID];
+	res.end = res.start + (CATPT_DMA_REGS_SIZE - 1);
+	res.flags = IORESOURCE_MEM;
+	dmac->dev = cdev->dev;
+	dmac->irq = cdev->irq;
+
+	dmac->regs = devm_ioremap_resource(cdev->dev, &res);
+	if (IS_ERR(dmac->regs))
+		return PTR_ERR(dmac->regs);
+
+	ret = dma_coerce_mask_and_coherent(cdev->dev, DMA_BIT_MASK(31));
+	if (ret < 0)
+		return ret;
+	/*
+	 * Caller is responsible for putting device in D0 to allow
+	 * for I/O and memory access before probing DW
+	 */
+	ret = dw_dma_probe(dmac);
+	if (ret < 0)
+		return ret;
+
+	cdev->dmac = dmac;
+	return 0;
+}
+
+void catpt_dmac_remove(struct catpt_dev *cdev)
+{
+	/*
+	 * As do_dma_remove() juggles with pm_runtime_get_xxx() and
+	 * pm_runtime_put_xxx() while both ADSP and DW 'devices' are part of
+	 * the same module, caller makes sure pm_runtime_disable() is invoked
+	 * before removing DW to prevent postmortem resume and suspend
+	 */
+	dw_dma_remove(cdev->dmac);
+}
+
+static void catpt_dsp_set_srampge(struct catpt_dev *cdev, struct resource *sram,
+				  unsigned long mask, unsigned long new)
+{
+	unsigned long old;
+	u32 off = sram->start;
+	u32 b = __ffs(mask);
+
+	old = catpt_readl_pci(cdev, VDRTCTL0) & mask;
+	dev_dbg(cdev->dev, "SRAMPGE [0x%08lx] 0x%08lx -> 0x%08lx",
+		mask, old, new);
+
+	if (old == new)
+		return;
+
+	catpt_updatel_pci(cdev, VDRTCTL0, mask, new);
+	udelay(60);
+
+	/*
+	 * dummy read as the very first access after block enable
+	 * to prevent byte loss in future operations
+	 */
+	for_each_clear_bit_from(b, &new, fls(mask)) {
+		u8 buf[4];
+
+		/* newly enabled: new bit=0 while old bit=1 */
+		if (test_bit(b, &old)) {
+			dev_dbg(cdev->dev, "sanitize block %ld: off 0x%08x\n",
+				(b - __ffs(mask)), off);
+			memcpy_fromio(buf, cdev->lpe_ba + off, sizeof(buf));
+		}
+		off += CATPT_MEMBLOCK_SIZE;
+	}
+}
+
+void catpt_dsp_update_srampge(struct catpt_dev *cdev, struct resource *sram,
+			      unsigned long mask)
+{
+	struct resource *res;
+	unsigned long new = 0;
+
+	/* flag all busy blocks */
+	for (res = sram->child; res; res = res->sibling) {
+		u32 h, l;
+
+		h = (res->end - sram->start) / CATPT_MEMBLOCK_SIZE;
+		l = (res->start - sram->start) / CATPT_MEMBLOCK_SIZE;
+		new |= GENMASK(h, l);
+	}
+
+	/* offset value given mask's start and invert it as ON=b0 */
+	new <<= __ffs(mask);
+	new = ~(new) & mask;
+
+	/* disable core clock gating */
+	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE, 0);
+
+	catpt_dsp_set_srampge(cdev, sram, mask, new);
+
+	/* enable core clock gating */
+	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE,
+			  CATPT_VDRTCTL2_DCLCGE);
+}
+
+int catpt_dsp_stall(struct catpt_dev *cdev, bool stall)
+{
+	u32 reg, val;
+
+	val = stall ? CATPT_CS_STALL : 0;
+	catpt_updatel_shim(cdev, CS, CATPT_CS_STALL, val);
+
+	return catpt_readl_poll_shim(cdev, CS,
+				     reg, (reg & CATPT_CS_STALL) == val,
+				     500, 10000);
+}
+
+static int catpt_dsp_reset(struct catpt_dev *cdev, bool reset)
+{
+	u32 reg, val;
+
+	val = reset ? CATPT_CS_RST : 0;
+	catpt_updatel_shim(cdev, CS, CATPT_CS_RST, val);
+
+	return catpt_readl_poll_shim(cdev, CS,
+				     reg, (reg & CATPT_CS_RST) == val,
+				     500, 10000);
+}
+
+void lpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable)
+{
+	u32 val;
+
+	val = enable ? LPT_VDRTCTL0_APLLSE : 0;
+	catpt_updatel_pci(cdev, VDRTCTL0, LPT_VDRTCTL0_APLLSE, val);
+}
+
+void wpt_dsp_pll_shutdown(struct catpt_dev *cdev, bool enable)
+{
+	u32 val;
+
+	val = enable ? WPT_VDRTCTL2_APLLSE : 0;
+	catpt_updatel_pci(cdev, VDRTCTL2, WPT_VDRTCTL2_APLLSE, val);
+}
+
+static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
+{
+	u32 mask, reg, val;
+	int ret;
+
+	mutex_lock(&cdev->clk_mutex);
+
+	val = lp ? CATPT_CS_LPCS : 0;
+	reg = catpt_readl_shim(cdev, CS) & CATPT_CS_LPCS;
+	dev_dbg(cdev->dev, "LPCS [0x%08lx] 0x%08x -> 0x%08x",
+		CATPT_CS_LPCS, reg, val);
+
+	if (reg == val) {
+		mutex_unlock(&cdev->clk_mutex);
+		return 0;
+	}
+
+	if (waiti) {
+		/* wait for DSP to signal WAIT state */
+		ret = catpt_readl_poll_shim(cdev, ISD,
+					    reg, (reg & CATPT_ISD_DCPWM),
+					    500, 10000);
+		if (ret < 0) {
+			dev_warn(cdev->dev, "await WAITI timeout\n");
+			mutex_unlock(&cdev->clk_mutex);
+			return ret;
+		}
+	}
+
+	ret = catpt_readl_poll_shim(cdev, CLKCTL,
+				    reg, !(reg & CATPT_CLKCTL_CFCIP),
+				    500, 10000);
+	if (ret < 0)
+		dev_warn(cdev->dev, "clock change still in progress\n");
+
+	/* default to DSP core & audio fabric high clock */
+	val |= CATPT_CS_DCS_HIGH;
+	mask = CATPT_CS_LPCS | CATPT_CS_DCS;
+	catpt_updatel_shim(cdev, CS, mask, val);
+
+	ret = catpt_readl_poll_shim(cdev, CLKCTL,
+				    reg, !(reg & CATPT_CLKCTL_CFCIP),
+				    500, 10000);
+	if (ret < 0)
+		dev_warn(cdev->dev, "clock change still in progress\n");
+
+	/* update PLL accordingly */
+	cdev->spec->pll_shutdown(cdev, lp);
+
+	mutex_unlock(&cdev->clk_mutex);
+	return 0;
+}
+
+int catpt_dsp_update_lpclock(struct catpt_dev *cdev)
+{
+	struct catpt_stream_runtime *stream;
+	bool lp;
+
+	if (list_empty(&cdev->stream_list))
+		return catpt_dsp_select_lpclock(cdev, true, true);
+
+	lp = true;
+	list_for_each_entry(stream, &cdev->stream_list, node) {
+		if (stream->prepared) {
+			lp = false;
+			break;
+		}
+	}
+
+	return catpt_dsp_select_lpclock(cdev, lp, true);
+}
+
+/* bring registers to their defaults as HW won't reset itself */
+static void catpt_dsp_set_regs_defaults(struct catpt_dev *cdev)
+{
+	int i;
+
+	catpt_writel_shim(cdev, CS, CATPT_CS_DEFAULT);
+	catpt_writel_shim(cdev, ISC, CATPT_ISC_DEFAULT);
+	catpt_writel_shim(cdev, ISD, CATPT_ISD_DEFAULT);
+	catpt_writel_shim(cdev, IMC, CATPT_IMC_DEFAULT);
+	catpt_writel_shim(cdev, IMD, CATPT_IMD_DEFAULT);
+	catpt_writel_shim(cdev, IPCC, CATPT_IPCC_DEFAULT);
+	catpt_writel_shim(cdev, IPCD, CATPT_IPCD_DEFAULT);
+	catpt_writel_shim(cdev, CLKCTL, CATPT_CLKCTL_DEFAULT);
+	catpt_writel_shim(cdev, CS2, CATPT_CS2_DEFAULT);
+	catpt_writel_shim(cdev, LTRC, CATPT_LTRC_DEFAULT);
+	catpt_writel_shim(cdev, HMDC, CATPT_HMDC_DEFAULT);
+
+	for (i = 0; i < CATPT_SSP_COUNT; i++) {
+		catpt_writel_ssp(cdev, i, SSC0, CATPT_SSP_SSC0_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSC1, CATPT_SSP_SSC1_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSS, CATPT_SSP_SSS_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSIT, CATPT_SSP_SSIT_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSD, CATPT_SSP_SSD_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSTO, CATPT_SSP_SSTO_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSPSP, CATPT_SSP_SSPSP_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSTSA, CATPT_SSP_SSTSA_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSRSA, CATPT_SSP_SSRSA_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSTSS, CATPT_SSP_SSTSS_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSC2, CATPT_SSP_SSC2_DEFAULT);
+		catpt_writel_ssp(cdev, i, SSPSP2, CATPT_SSP_SSPSP2_DEFAULT);
+	}
+}
+
+int lpt_dsp_power_down(struct catpt_dev *cdev)
+{
+	catpt_dsp_reset(cdev, true);
+
+	/* set 24Mhz clock for both SSPs */
+	catpt_updatel_shim(cdev, CS, CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1),
+			   CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1));
+	catpt_dsp_select_lpclock(cdev, true, false);
+
+	/* DRAM power gating all */
+	catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask,
+			      cdev->spec->dram_mask);
+	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask,
+			      cdev->spec->iram_mask);
+
+	/* set D3 */
+	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
+	udelay(50);
+
+	return 0;
+}
+
+int lpt_dsp_power_up(struct catpt_dev *cdev)
+{
+	/* SRAM power gating none */
+	catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask, 0);
+	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->dram_mask, 0);
+
+	/* set D0 */
+	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);
+	udelay(100);
+
+	catpt_dsp_select_lpclock(cdev, false, false);
+	catpt_updatel_shim(cdev, CS,
+			CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1),
+			CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1));
+	udelay(50);
+
+	catpt_dsp_reset(cdev, false);
+	/* generate int deassert msg to fix inversed int logic */
+	catpt_updatel_shim(cdev, IMC, CATPT_IMC_IPCDB | CATPT_IMC_IPCCD, 0);
+
+	return 0;
+}
+
+int wpt_dsp_power_down(struct catpt_dev *cdev)
+{
+	u32 mask, val;
+
+	/* disable core clock gating */
+	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE, 0);
+
+	catpt_dsp_reset(cdev, true);
+	/* set 24Mhz clock for both SSPs */
+	catpt_updatel_shim(cdev, CS, CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1),
+			   CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1));
+	catpt_dsp_select_lpclock(cdev, true, false);
+	/* disable MCLK */
+	catpt_updatel_shim(cdev, CLKCTL, CATPT_CLKCTL_SMOS, 0);
+
+	catpt_dsp_set_regs_defaults(cdev);
+
+	/* switch clock gating */
+	mask = CATPT_VDRTCTL2_CGEALL & (~CATPT_VDRTCTL2_DCLCGE);
+	val = mask & (~CATPT_VDRTCTL2_DTCGE);
+	catpt_updatel_pci(cdev, VDRTCTL2, mask, val);
+	/* enable DTCGE separatelly */
+	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DTCGE,
+			  CATPT_VDRTCTL2_DTCGE);
+
+	/* SRAM power gating all */
+	catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask,
+			      cdev->spec->dram_mask);
+	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask,
+			      cdev->spec->iram_mask);
+	mask = WPT_VDRTCTL0_D3SRAMPGD | WPT_VDRTCTL0_D3PGD;
+	catpt_updatel_pci(cdev, VDRTCTL0, mask, WPT_VDRTCTL0_D3PGD);
+
+	/* set D3 */
+	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
+	udelay(50);
+
+	/* enable core clock gating */
+	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE,
+			  CATPT_VDRTCTL2_DCLCGE);
+	udelay(50);
+
+	return 0;
+}
+
+int wpt_dsp_power_up(struct catpt_dev *cdev)
+{
+	u32 mask, val;
+
+	/* disable core clock gating */
+	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE, 0);
+
+	/* switch clock gating */
+	mask = CATPT_VDRTCTL2_CGEALL & (~CATPT_VDRTCTL2_DCLCGE);
+	val = mask & (~CATPT_VDRTCTL2_DTCGE);
+	catpt_updatel_pci(cdev, VDRTCTL2, mask, val);
+
+	/* set D0 */
+	catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);
+
+	/* SRAM power gating none */
+	mask = WPT_VDRTCTL0_D3SRAMPGD | WPT_VDRTCTL0_D3PGD;
+	catpt_updatel_pci(cdev, VDRTCTL0, mask, mask);
+	catpt_dsp_set_srampge(cdev, &cdev->dram, cdev->spec->dram_mask, 0);
+	catpt_dsp_set_srampge(cdev, &cdev->iram, cdev->spec->iram_mask, 0);
+
+	catpt_dsp_set_regs_defaults(cdev);
+
+	/* restore MCLK */
+	catpt_updatel_shim(cdev, CLKCTL, CATPT_CLKCTL_SMOS, CATPT_CLKCTL_SMOS);
+	catpt_dsp_select_lpclock(cdev, false, false);
+	/* set 24Mhz clock for both SSPs */
+	catpt_updatel_shim(cdev, CS, CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1),
+			   CATPT_CS_SBCS(0) | CATPT_CS_SBCS(1));
+	catpt_dsp_reset(cdev, false);
+
+	/* enable core clock gating */
+	catpt_updatel_pci(cdev, VDRTCTL2, CATPT_VDRTCTL2_DCLCGE,
+			  CATPT_VDRTCTL2_DCLCGE);
+
+	/* generate int deassert msg to fix inversed int logic */
+	catpt_updatel_shim(cdev, IMC, CATPT_IMC_IPCDB | CATPT_IMC_IPCCD, 0);
+
+	return 0;
+}
-- 
2.17.1

