Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F5C1984C8
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 21:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 923E2166E;
	Mon, 30 Mar 2020 21:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 923E2166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585597658;
	bh=6S78RlF6soaIXwyrG3uWbH3LAfw+KsIwABsPL7PGsEY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eUUgFKqaOSYrZrJcDavETJJ7m4X/SwgRSBFCrpquYWTOBMDAYEC99Vf0Wd38xW17u
	 OAECgh/P9EfZWCBmXDMI2QY92WeXlLsdpe5AWlnqB/9U4qnsAtynit6uhe3edRWrYI
	 /U9HJwXNtlo8gzMITWfqTIM1iw0w8QAV+so4wLBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD313F8010C;
	Mon, 30 Mar 2020 21:45:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93524F80148; Mon, 30 Mar 2020 21:45:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C216DF8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 21:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C216DF8010C
IronPort-SDR: MT+VLBCEF8SYo2unYhcKjEamsW+SWfl5PiCYj3DckA4aP/Ogb7aOdZ7cMxATfZJW5OSkU3xgJU
 ZLIhFlxt0DVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 12:45:43 -0700
IronPort-SDR: Ul0COpqdh9KIA48hO+tVwBNYXf2DGzPcutIzzOcNVCLvzRdV4oyNU6NIvh5TMgcp4sYRnz9BQX
 X5wyvkH55xAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; d="scan'208";a="359273899"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2020 12:45:41 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: haswell: Power transition refactor
Date: Mon, 30 Mar 2020 21:45:20 +0200
Message-Id: <20200330194520.13253-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

Update D0 <-> D3 sequence to correctly transition hardware and DSP core
from and to D3. On top of that, set SHIM registers to their recommended
defaults during D0 and D3 proceduces as HW does not reset registers for
us.

Connected to:
[alsa-devel][BUG] bdw-rt5650 DSP boot timeout
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153098.html

Github issue ticket reference:
https://github.com/thesofproject/linux/pull/1842

Tested on:
- BDW-Y RVP with rt286
- SAMUS with rt5677

Proposed solution (both in July 2019 and on github):
'Revert "ASoC: Intel: Work around to fix HW d3 potential crash issue"'
is NAKed as it only covers the problem up and actually brings back the
undefined behavior: some registers (e.g.: APLLSE) are describing LPT
offsets rather than WPT ones. In consequence, during power-transitions
driver issues incorrect writes and leaves the regs of interest alone.

Existing patch - the non-revert - does not resolve the HW D3 issue at
all as it ignores the recommended sequence and does not initialize
hardware registers as expected. And thus, leaving things as are is also
unacceptable.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/haswell/sst-haswell-dsp.c | 185 ++++++++++++----------
 1 file changed, 104 insertions(+), 81 deletions(-)

diff --git a/sound/soc/intel/haswell/sst-haswell-dsp.c b/sound/soc/intel/haswell/sst-haswell-dsp.c
index 88c3f63bded9..de80e19454c1 100644
--- a/sound/soc/intel/haswell/sst-haswell-dsp.c
+++ b/sound/soc/intel/haswell/sst-haswell-dsp.c
@@ -243,45 +243,92 @@ static irqreturn_t hsw_irq(int irq, void *context)
 	return ret;
 }
 
+#define CSR_DEFAULT_VALUE 0x8480040E
+#define ISC_DEFAULT_VALUE 0x0
+#define ISD_DEFAULT_VALUE 0x0
+#define IMC_DEFAULT_VALUE 0x7FFF0003
+#define IMD_DEFAULT_VALUE 0x7FFF0003
+#define IPCC_DEFAULT_VALUE 0x0
+#define IPCD_DEFAULT_VALUE 0x0
+#define CLKCTL_DEFAULT_VALUE 0x7FF
+#define CSR2_DEFAULT_VALUE 0x0
+#define LTR_CTRL_DEFAULT_VALUE 0x0
+#define HMD_CTRL_DEFAULT_VALUE 0x0
+
+static void hsw_set_shim_defaults(struct sst_dsp *sst)
+{
+	sst_dsp_shim_write_unlocked(sst, SST_CSR, CSR_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_ISRX, ISC_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_ISRD, ISD_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_IMRX, IMC_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_IMRD, IMD_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_IPCX, IPCC_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_IPCD, IPCD_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_CLKCTL, CLKCTL_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_CSR2, CSR2_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_LTRC, LTR_CTRL_DEFAULT_VALUE);
+	sst_dsp_shim_write_unlocked(sst, SST_HMDC, HMD_CTRL_DEFAULT_VALUE);
+}
+
+/* all clock-gating minus DCLCGE and DTCGE */
+#define SST_VDRTCL2_CG_OTHER	0xB7D
+
 static void hsw_set_dsp_D3(struct sst_dsp *sst)
 {
-	u32 val;
 	u32 reg;
 
-	/* Disable core clock gating (VDRTCTL2.DCLCGE = 0) */
+	/* disable clock core gating */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg &= ~(SST_VDRTCL2_DCLCGE | SST_VDRTCL2_DTCGE);
+	reg &= ~(SST_VDRTCL2_DCLCGE);
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	/* enable power gating and switch off DRAM & IRAM blocks */
-	val = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
-	val |= SST_VDRTCL0_DSRAMPGE_MASK |
-		SST_VDRTCL0_ISRAMPGE_MASK;
-	val &= ~(SST_VDRTCL0_D3PGD | SST_VDRTCL0_D3SRAMPGD);
-	writel(val, sst->addr.pci_cfg + SST_VDRTCTL0);
+	/* stall, reset and set 24MHz XOSC */
+	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR,
+			SST_CSR_24MHZ_LPCS | SST_CSR_STALL | SST_CSR_RST,
+			SST_CSR_24MHZ_LPCS | SST_CSR_STALL | SST_CSR_RST);
 
-	/* switch off audio PLL */
-	val = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	val |= SST_VDRTCL2_APLLSE_MASK;
-	writel(val, sst->addr.pci_cfg + SST_VDRTCTL2);
+	/* DRAM power gating all */
+	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
+	reg |= SST_VDRTCL0_ISRAMPGE_MASK |
+		SST_VDRTCL0_DSRAMPGE_MASK;
+	reg &= ~(SST_VDRTCL0_D3SRAMPGD);
+	reg |= SST_VDRTCL0_D3PGD;
+	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL0);
+	udelay(50);
 
-	/* disable MCLK(clkctl.smos = 0) */
-	sst_dsp_shim_update_bits_unlocked(sst, SST_CLKCTL,
-		SST_CLKCTL_MASK, 0);
+	/* PLL shutdown enable */
+	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
+	reg |= SST_VDRTCL2_APLLSE_MASK;
+	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	/* Set D3 state, delay 50 us */
-	val = readl(sst->addr.pci_cfg + SST_PMCS);
-	val |= SST_PMCS_PS_MASK;
-	writel(val, sst->addr.pci_cfg + SST_PMCS);
-	udelay(50);
+	/* disable MCLK */
+	sst_dsp_shim_update_bits_unlocked(sst, SST_CLKCTL,
+			SST_CLKCTL_MASK, 0);
 
-	/* Enable core clock gating (VDRTCTL2.DCLCGE = 1), delay 50 us */
+	/* switch clock gating */
+	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
+	reg |= SST_VDRTCL2_CG_OTHER;
+	reg &= ~(SST_VDRTCL2_DTCGE);
+	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
+	/* enable DTCGE separatelly */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg |= SST_VDRTCL2_DCLCGE | SST_VDRTCL2_DTCGE;
+	reg |= SST_VDRTCL2_DTCGE;
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
+	/* set shim defaults */
+	hsw_set_shim_defaults(sst);
+
+	/* set D3 */
+	reg = readl(sst->addr.pci_cfg + SST_PMCS);
+	reg |= SST_PMCS_PS_MASK;
+	writel(reg, sst->addr.pci_cfg + SST_PMCS);
 	udelay(50);
 
+	/* enable clock core gating */
+	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
+	reg |= SST_VDRTCL2_DCLCGE;
+	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
+	udelay(50);
 }
 
 static void hsw_reset(struct sst_dsp *sst)
@@ -299,75 +346,62 @@ static void hsw_reset(struct sst_dsp *sst)
 		SST_CSR_RST | SST_CSR_STALL, SST_CSR_STALL);
 }
 
+/* recommended CSR state for power-up */
+#define SST_CSR_D0_MASK (0x18A09C0C | SST_CSR_DCS_MASK)
+
 static int hsw_set_dsp_D0(struct sst_dsp *sst)
 {
-	int tries = 10;
-	u32 reg, fw_dump_bit;
+	u32 reg;
 
-	/* Disable core clock gating (VDRTCTL2.DCLCGE = 0) */
+	/* disable clock core gating */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg &= ~(SST_VDRTCL2_DCLCGE | SST_VDRTCL2_DTCGE);
+	reg &= ~(SST_VDRTCL2_DCLCGE);
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	/* Disable D3PG (VDRTCTL0.D3PGD = 1) */
-	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
-	reg |= SST_VDRTCL0_D3PGD;
-	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL0);
+	/* switch clock gating */
+	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
+	reg |= SST_VDRTCL2_CG_OTHER;
+	reg &= ~(SST_VDRTCL2_DTCGE);
+	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	/* Set D0 state */
+	/* set D0 */
 	reg = readl(sst->addr.pci_cfg + SST_PMCS);
-	reg &= ~SST_PMCS_PS_MASK;
+	reg &= ~(SST_PMCS_PS_MASK);
 	writel(reg, sst->addr.pci_cfg + SST_PMCS);
 
-	/* check that ADSP shim is enabled */
-	while (tries--) {
-		reg = readl(sst->addr.pci_cfg + SST_PMCS) & SST_PMCS_PS_MASK;
-		if (reg == 0)
-			goto finish;
-
-		msleep(1);
-	}
-
-	return -ENODEV;
-
-finish:
-	/* select SSP1 19.2MHz base clock, SSP clock 0, turn off Low Power Clock */
-	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR,
-		SST_CSR_S1IOCS | SST_CSR_SBCS1 | SST_CSR_LPCS, 0x0);
+	/* DRAM power gating none */
+	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
+	reg &= ~(SST_VDRTCL0_ISRAMPGE_MASK |
+		SST_VDRTCL0_DSRAMPGE_MASK);
+	reg |= SST_VDRTCL0_D3SRAMPGD;
+	reg |= SST_VDRTCL0_D3PGD;
+	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL0);
+	mdelay(10);
 
-	/* stall DSP core, set clk to 192/96Mhz */
-	sst_dsp_shim_update_bits_unlocked(sst,
-		SST_CSR, SST_CSR_STALL | SST_CSR_DCS_MASK,
-		SST_CSR_STALL | SST_CSR_DCS(4));
+	/* set shim defaults */
+	hsw_set_shim_defaults(sst);
 
-	/* Set 24MHz MCLK, prevent local clock gating, enable SSP0 clock */
+	/* restore MCLK */
 	sst_dsp_shim_update_bits_unlocked(sst, SST_CLKCTL,
-		SST_CLKCTL_MASK | SST_CLKCTL_DCPLCG | SST_CLKCTL_SCOE0,
-		SST_CLKCTL_MASK | SST_CLKCTL_DCPLCG | SST_CLKCTL_SCOE0);
+			SST_CLKCTL_MASK, SST_CLKCTL_MASK);
 
-	/* Stall and reset core, set CSR */
-	hsw_reset(sst);
-
-	/* Enable core clock gating (VDRTCTL2.DCLCGE = 1), delay 50 us */
+	/* PLL shutdown disable */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg |= SST_VDRTCL2_DCLCGE | SST_VDRTCL2_DTCGE;
+	reg &= ~(SST_VDRTCL2_APLLSE_MASK);
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
+	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR,
+			SST_CSR_D0_MASK, SST_CSR_SBCS0 | SST_CSR_SBCS1 |
+			SST_CSR_STALL | SST_CSR_DCS(4));
 	udelay(50);
 
-	/* switch on audio PLL */
+	/* enable clock core gating */
 	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL2);
-	reg &= ~SST_VDRTCL2_APLLSE_MASK;
+	reg |= SST_VDRTCL2_DCLCGE;
 	writel(reg, sst->addr.pci_cfg + SST_VDRTCTL2);
 
-	/* set default power gating control, enable power gating control for all blocks. that is,
-	can't be accessed, please enable each block before accessing. */
-	reg = readl(sst->addr.pci_cfg + SST_VDRTCTL0);
-	reg |= SST_VDRTCL0_DSRAMPGE_MASK | SST_VDRTCL0_ISRAMPGE_MASK;
-	/* for D0, always enable the block(DSRAM[0]) used for FW dump */
-	fw_dump_bit = 1 << SST_VDRTCL0_DSRAMPGE_SHIFT;
-	writel(reg & ~fw_dump_bit, sst->addr.pci_cfg + SST_VDRTCTL0);
-
+	/* clear reset */
+	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR, SST_CSR_RST, 0);
 
 	/* disable DMA finish function for SSP0 & SSP1 */
 	sst_dsp_shim_update_bits_unlocked(sst, SST_CSR2, SST_CSR2_SDFD_SSP1,
@@ -384,12 +418,6 @@ static int hsw_set_dsp_D0(struct sst_dsp *sst)
 	sst_dsp_shim_update_bits(sst, SST_IMRD, (SST_IMRD_DONE | SST_IMRD_BUSY |
 				SST_IMRD_SSP0 | SST_IMRD_DMAC), 0x0);
 
-	/* clear IPC registers */
-	sst_dsp_shim_write(sst, SST_IPCX, 0x0);
-	sst_dsp_shim_write(sst, SST_IPCD, 0x0);
-	sst_dsp_shim_write(sst, 0x80, 0x6);
-	sst_dsp_shim_write(sst, 0xe0, 0x300a);
-
 	return 0;
 }
 
@@ -415,11 +443,6 @@ static void hsw_sleep(struct sst_dsp *sst)
 {
 	dev_dbg(sst->dev, "HSW_PM dsp runtime suspend\n");
 
-	/* put DSP into reset and stall */
-	sst_dsp_shim_update_bits(sst, SST_CSR,
-		SST_CSR_24MHZ_LPCS | SST_CSR_RST | SST_CSR_STALL,
-		SST_CSR_RST | SST_CSR_STALL | SST_CSR_24MHZ_LPCS);
-
 	hsw_set_dsp_D3(sst);
 	dev_dbg(sst->dev, "HSW_PM dsp runtime suspend exit\n");
 }
-- 
2.17.1

