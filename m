Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D12512593F7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 17:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5186D17E4;
	Tue,  1 Sep 2020 17:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5186D17E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598974434;
	bh=GNnGTcTDHcTUhGB1Ba5G2wOKJQqBzFz3xUwK9y+A6fs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vMYvv5HAZkLPKtv3sGFVCVO/SrEFCxX/Jtm5z9WL/gRC3MDyjYc/8kJhb9nixE/5x
	 RWhrm5DXvdYEellyl0BE8SV93fmi1U8w7rZ5eamBTb4l4t9fGd1L7RN5hemD3dSfPw
	 A/YTPcUk+R6o+e/clkcarTwdXwYY2/YLT7DH2MyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 764AAF8020D;
	Tue,  1 Sep 2020 17:32:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95772F80217; Tue,  1 Sep 2020 17:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6971CF801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 17:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6971CF801DA
IronPort-SDR: cauRK3n7GFqylIQf2qYR9ME7821zPJVGkLs0y6ErstLzcw6Wu+2ytjdFoiV8IwrxZ/8QHRK1p3
 MrZ0+GA0zZFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="137236649"
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="137236649"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 08:31:38 -0700
IronPort-SDR: pkDuqk6gy+7QbfeMLLFA52VjNiqeLshImgB8aHX3Sjjj3hPtHrVb+jrcquUgjGPWbEa2to8nbZ
 bK6Skyg6+D0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="502282204"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2020 08:31:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ASoC: Intel: haswell: Power transition refactor"
Date: Tue,  1 Sep 2020 17:30:41 +0200
Message-Id: <20200901153041.14771-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

This reverts commit 8ec7d6043263ecf250b9b7c0dd8ade899487538a.

While addressing existing power-cycle limitations for
sound/soc/intel/haswell solution, change brings regression for standard
audio userspace flows e.g.: when using PulseAudio.

Occasional sound-card initialization fail is still better than
pernament audio distortions, so revert the change.

Fixes: 8ec7d6043263 ("ASoC: Intel: haswell: Power transition refactor")
Reported-by: Christian Bundy <christianbundy@fraction.io>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/haswell/sst-haswell-dsp.c | 185 ++++++++++------------
 1 file changed, 81 insertions(+), 104 deletions(-)

diff --git a/sound/soc/intel/haswell/sst-haswell-dsp.c b/sound/soc/intel/haswell/sst-haswell-dsp.c
index de80e19454c1..88c3f63bded9 100644
--- a/sound/soc/intel/haswell/sst-haswell-dsp.c
+++ b/sound/soc/intel/haswell/sst-haswell-dsp.c
@@ -243,92 +243,45 @@ static irqreturn_t hsw_irq(int irq, void *context)
 	return ret;
 }
 
-#define CSR_DEFAULT_VALUE 0x8480040E
-#define ISC_DEFAULT_VALUE 0x0
-#define ISD_DEFAULT_VALUE 0x0
-#define IMC_DEFAULT_VALUE 0x7FFF0003
-#define IMD_DEFAULT_VALUE 0x7FFF0003
-#define IPCC_DEFAULT_VALUE 0x0
-#define IPCD_DEFAULT_VALUE 0x0
-#define CLKCTL_DEFAULT_VALUE 0x7FF
-#define CSR2_DEFAULT_VALUE 0x0
-#define LTR_CTRL_DEFAULT_VALUE 0x0
-#define HMD_CTRL_DEFAULT_VALUE 0x0
-
-static void hsw_set_shim_defaults(struct sst_dsp *sst)
-{
-	sst_dsp_shim_write_unlocked(sst, SST_CSR, CSR_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_ISRX, ISC_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_ISRD, ISD_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_IMRX, IMC_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_IMRD, IMD_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_IPCX, IPCC_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_IPCD, IPCD_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_CLKCTL, CLKCTL_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_CSR2, CSR2_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_LTRC, LTR_CTRL_DEFAULT_VALUE);
-	sst_dsp_shim_write_unlocked(sst, SST_HMDC, HMD_CTRL_DEFAULT_VALUE);
-}
-
-/* all clock-gating minus DCLCGE and DTCGE */
-#define SST_VDRTCL2_CG_OTHER	0xB7D
-
 static void hsw_set_dsp_D3(struct sst_dsp *sst)
 {
+	u32 val;
 	u32 reg;
 
-	/* disable clock core gating */
+	/* Disable core clock gating (VDRTCTL2.DCLCGE = 0) */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg &= ~(SST_VDRTCL2_DCLCGE);
+	reg &= ~(SST_VDRTCL2_DCLCGE | SST_VDRTCL2_DTCGE);
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	/* stall, reset and set 24MHz XOSC */
-	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR,
-			SST_CSR_24MHZ_LPCS | SST_CSR_STALL | SST_CSR_RST,
-			SST_CSR_24MHZ_LPCS | SST_CSR_STALL | SST_CSR_RST);
-
-	/* DRAM power gating all */
-	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
-	reg |= SST_VDRTCL0_ISRAMPGE_MASK |
-		SST_VDRTCL0_DSRAMPGE_MASK;
-	reg &= ~(SST_VDRTCL0_D3SRAMPGD);
-	reg |= SST_VDRTCL0_D3PGD;
-	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL0);
-	udelay(50);
+	/* enable power gating and switch off DRAM & IRAM blocks */
+	val = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
+	val |= SST_VDRTCL0_DSRAMPGE_MASK |
+		SST_VDRTCL0_ISRAMPGE_MASK;
+	val &= ~(SST_VDRTCL0_D3PGD | SST_VDRTCL0_D3SRAMPGD);
+	writel(val, sst->addr.pci_cfg + SST_VDRTCTL0);
 
-	/* PLL shutdown enable */
-	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg |= SST_VDRTCL2_APLLSE_MASK;
-	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
+	/* switch off audio PLL */
+	val = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
+	val |= SST_VDRTCL2_APLLSE_MASK;
+	writel(val, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	/* disable MCLK */
+	/* disable MCLK(clkctl.smos = 0) */
 	sst_dsp_shim_update_bits_unlocked(sst, SST_CLKCTL,
-			SST_CLKCTL_MASK, 0);
-
-	/* switch clock gating */
-	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg |= SST_VDRTCL2_CG_OTHER;
-	reg &= ~(SST_VDRTCL2_DTCGE);
-	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
-	/* enable DTCGE separatelly */
-	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg |= SST_VDRTCL2_DTCGE;
-	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
+		SST_CLKCTL_MASK, 0);
 
-	/* set shim defaults */
-	hsw_set_shim_defaults(sst);
-
-	/* set D3 */
-	reg = readl(sst->addr.pci_cfg + SST_PMCS);
-	reg |= SST_PMCS_PS_MASK;
-	writel(reg, sst->addr.pci_cfg + SST_PMCS);
+	/* Set D3 state, delay 50 us */
+	val = readl(sst->addr.pci_cfg + SST_PMCS);
+	val |= SST_PMCS_PS_MASK;
+	writel(val, sst->addr.pci_cfg + SST_PMCS);
 	udelay(50);
 
-	/* enable clock core gating */
+	/* Enable core clock gating (VDRTCTL2.DCLCGE = 1), delay 50 us */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg |= SST_VDRTCL2_DCLCGE;
+	reg |= SST_VDRTCL2_DCLCGE | SST_VDRTCL2_DTCGE;
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
+
 	udelay(50);
+
 }
 
 static void hsw_reset(struct sst_dsp *sst)
@@ -346,62 +299,75 @@ static void hsw_reset(struct sst_dsp *sst)
 		SST_CSR_RST | SST_CSR_STALL, SST_CSR_STALL);
 }
 
-/* recommended CSR state for power-up */
-#define SST_CSR_D0_MASK (0x18A09C0C | SST_CSR_DCS_MASK)
-
 static int hsw_set_dsp_D0(struct sst_dsp *sst)
 {
-	u32 reg;
+	int tries = 10;
+	u32 reg, fw_dump_bit;
 
-	/* disable clock core gating */
+	/* Disable core clock gating (VDRTCTL2.DCLCGE = 0) */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg &= ~(SST_VDRTCL2_DCLCGE);
+	reg &= ~(SST_VDRTCL2_DCLCGE | SST_VDRTCL2_DTCGE);
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	/* switch clock gating */
-	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg |= SST_VDRTCL2_CG_OTHER;
-	reg &= ~(SST_VDRTCL2_DTCGE);
-	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
+	/* Disable D3PG (VDRTCTL0.D3PGD = 1) */
+	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
+	reg |= SST_VDRTCL0_D3PGD;
+	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL0);
 
-	/* set D0 */
+	/* Set D0 state */
 	reg = readl(sst->addr.pci_cfg + SST_PMCS);
-	reg &= ~(SST_PMCS_PS_MASK);
+	reg &= ~SST_PMCS_PS_MASK;
 	writel(reg, sst->addr.pci_cfg + SST_PMCS);
 
-	/* DRAM power gating none */
-	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
-	reg &= ~(SST_VDRTCL0_ISRAMPGE_MASK |
-		SST_VDRTCL0_DSRAMPGE_MASK);
-	reg |= SST_VDRTCL0_D3SRAMPGD;
-	reg |= SST_VDRTCL0_D3PGD;
-	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL0);
-	mdelay(10);
+	/* check that ADSP shim is enabled */
+	while (tries--) {
+		reg = readl(sst->addr.pci_cfg + SST_PMCS) & SST_PMCS_PS_MASK;
+		if (reg == 0)
+			goto finish;
+
+		msleep(1);
+	}
+
+	return -ENODEV;
 
-	/* set shim defaults */
-	hsw_set_shim_defaults(sst);
+finish:
+	/* select SSP1 19.2MHz base clock, SSP clock 0, turn off Low Power Clock */
+	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR,
+		SST_CSR_S1IOCS | SST_CSR_SBCS1 | SST_CSR_LPCS, 0x0);
+
+	/* stall DSP core, set clk to 192/96Mhz */
+	sst_dsp_shim_update_bits_unlocked(sst,
+		SST_CSR, SST_CSR_STALL | SST_CSR_DCS_MASK,
+		SST_CSR_STALL | SST_CSR_DCS(4));
 
-	/* restore MCLK */
+	/* Set 24MHz MCLK, prevent local clock gating, enable SSP0 clock */
 	sst_dsp_shim_update_bits_unlocked(sst, SST_CLKCTL,
-			SST_CLKCTL_MASK, SST_CLKCTL_MASK);
+		SST_CLKCTL_MASK | SST_CLKCTL_DCPLCG | SST_CLKCTL_SCOE0,
+		SST_CLKCTL_MASK | SST_CLKCTL_DCPLCG | SST_CLKCTL_SCOE0);
 
-	/* PLL shutdown disable */
+	/* Stall and reset core, set CSR */
+	hsw_reset(sst);
+
+	/* Enable core clock gating (VDRTCTL2.DCLCGE = 1), delay 50 us */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg &= ~(SST_VDRTCL2_APLLSE_MASK);
+	reg |= SST_VDRTCL2_DCLCGE | SST_VDRTCL2_DTCGE;
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR,
-			SST_CSR_D0_MASK, SST_CSR_SBCS0 | SST_CSR_SBCS1 |
-			SST_CSR_STALL | SST_CSR_DCS(4));
 	udelay(50);
 
-	/* enable clock core gating */
+	/* switch on audio PLL */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg |= SST_VDRTCL2_DCLCGE;
+	reg &= ~SST_VDRTCL2_APLLSE_MASK;
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	/* clear reset */
-	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR, SST_CSR_RST, 0);
+	/* set default power gating control, enable power gating control for all blocks. that is,
+	can't be accessed, please enable each block before accessing. */
+	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
+	reg |= SST_VDRTCL0_DSRAMPGE_MASK | SST_VDRTCL0_ISRAMPGE_MASK;
+	/* for D0, always enable the block(DSRAM[0]) used for FW dump */
+	fw_dump_bit = 1 << SST_VDRTCL0_DSRAMPGE_SHIFT;
+	writel(reg & ~fw_dump_bit, sst->addr.pci_cfg + SST_VDRTCTL0);
+
 
 	/* disable DMA finish function for SSP0 & SSP1 */
 	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR2, SST_CSR2_SDFD_SSP1,
@@ -418,6 +384,12 @@ static int hsw_set_dsp_D0(struct sst_dsp *sst)
 	sst_dsp_shim_update_bits(sst, SST_IMRD, (SST_IMRD_DONE | SST_IMRD_BUSY |
 				SST_IMRD_SSP0 | SST_IMRD_DMAC), 0x0);
 
+	/* clear IPC registers */
+	sst_dsp_shim_write(sst, SST_IPCX, 0x0);
+	sst_dsp_shim_write(sst, SST_IPCD, 0x0);
+	sst_dsp_shim_write(sst, 0x80, 0x6);
+	sst_dsp_shim_write(sst, 0xe0, 0x300a);
+
 	return 0;
 }
 
@@ -443,6 +415,11 @@ static void hsw_sleep(struct sst_dsp *sst)
 {
 	dev_dbg(sst->dev, "HSW_PM dsp runtime suspend\n");
 
+	/* put DSP into reset and stall */
+	sst_dsp_shim_update_bits(sst, SST_CSR,
+		SST_CSR_24MHZ_LPCS | SST_CSR_RST | SST_CSR_STALL,
+		SST_CSR_RST | SST_CSR_STALL | SST_CSR_24MHZ_LPCS);
+
 	hsw_set_dsp_D3(sst);
 	dev_dbg(sst->dev, "HSW_PM dsp runtime suspend exit\n");
 }
-- 
2.17.1

