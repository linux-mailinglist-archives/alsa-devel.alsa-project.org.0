Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E96E5114EDA
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 11:15:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CC481694;
	Fri,  6 Dec 2019 11:14:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CC481694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575627340;
	bh=zKOg+0q4kuQx+O7PM4rWo5mjPRtjqKd6W3+bL4ahbQw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1aKF1ROWR/a6BHbzJMkkZTz8Ihl/xWwd6kN6zeQV53MgmpivIE6BizsEliwUIPTB
	 lTww11S+zffHtwf42O3kIvfpA1THj6k3KotAjAjKUf0eTFuDZd8FCjPX2m7BR6c18Q
	 Y63oSMrFv5ZsGvo7rNPSQVOqMQFzSIagKYDGpRNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71CECF8028A;
	Fri,  6 Dec 2019 11:08:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E597F80217; Fri,  6 Dec 2019 03:49:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 658E4F80135
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 03:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 658E4F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="hSf3GzoS"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5de9c19f0000>; Thu, 05 Dec 2019 18:49:03 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 05 Dec 2019 18:49:07 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 05 Dec 2019 18:49:07 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 02:49:07 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 02:49:06 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 6 Dec 2019 02:49:06 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.171]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5de9c1a00001>; Thu, 05 Dec 2019 18:49:06 -0800
From: Sowjanya Komatineni <skomatineni@nvidia.com>
To: <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <digetx@gmail.com>, <mperttunen@nvidia.com>,
 <gregkh@linuxfoundation.org>, <sboyd@kernel.org>, <tglx@linutronix.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Thu, 5 Dec 2019 18:48:46 -0800
Message-ID: <1575600535-26877-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575600543; bh=K/215BDN3/EUkng/dntzGRqMc0Dj+/X1dudUcLG+fUw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=hSf3GzoSJY6M609Va3jmF1npQKX2oSzmcEW1CUZa6SBNQTUixtuhQIapFMeQPJeKR
 9np70JJF9Fh5rS6fbqLEHHwFluOrdJ04fqyHeMSsjhJ/rBf5BJbQwosHxhnU+E7WTx
 /IrGeSTghQEFUI/NoaZyJssllFHcG6hdqNoRZQpgxBxyIZluAaqWguxC1/bXRc6UMS
 PFoqxV6HhFB8BFeMVJzcKKK5edKnWFMAjhH6H4Er5JvhhvapG5YPzt+YKAP6XpawVb
 OWP7lJq6l69lB/IsBsqTEuLvS4U7RH9DU91HvVk01PJS/3Qf6l61XE6vrt3vWupbSZ
 oGCtjvLvQQ1nQ==
X-Mailman-Approved-At: Fri, 06 Dec 2019 11:07:58 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, josephl@nvidia.com, linux-clk@vger.kernel.org,
 arnd@arndb.de, daniel.lezcano@linaro.org, krzk@kernel.org,
 mturquette@baylibre.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com,
 markz@nvidia.com, alexios.zavras@intel.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tiwai@suse.com,
 allison@lohutok.net, pdeschrijver@nvidia.com, lgirdwood@gmail.com,
 vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
Subject: [alsa-devel] [PATCH v3 06/15] clk: tegra: Remove tegra_pmc_clk_init
	along with clk ids
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Current Tegra clock driver registers PMC clocks clk_out_1, clk_out_2,
clk_out_3 and blink output in tegra_pmc_init() which does direct Tegra
PMC access during clk_ops and these PMC register read and write access
will not happen when PMC is in secure mode.

Any direct PMC register access from non-secure world will not go
through and all the PMC clocks and blink control are done in Tegra PMC
driver with PMC as clock provider.

This patch removes tegra_pmc_clk_init along with corresponding clk ids
from Tegra clock driver.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/Makefile        |   1 -
 drivers/clk/tegra/clk-id.h        |   7 ---
 drivers/clk/tegra/clk-tegra-pmc.c | 122 --------------------------------------
 drivers/clk/tegra/clk-tegra114.c  |  11 ----
 drivers/clk/tegra/clk-tegra124.c  |  27 +++------
 drivers/clk/tegra/clk-tegra20.c   |   4 --
 drivers/clk/tegra/clk-tegra210.c  |  11 ----
 drivers/clk/tegra/clk-tegra30.c   |  12 ----
 drivers/clk/tegra/clk.h           |   1 -
 9 files changed, 7 insertions(+), 189 deletions(-)
 delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index df966ca06788..1f7c30f87ece 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -12,7 +12,6 @@ obj-y					+= clk-sdmmc-mux.o
 obj-y					+= clk-super.o
 obj-y					+= clk-tegra-audio.o
 obj-y					+= clk-tegra-periph.o
-obj-y					+= clk-tegra-pmc.o
 obj-y					+= clk-tegra-fixed.o
 obj-y					+= clk-tegra-super-gen4.o
 obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index c4faebd32760..5913357a8000 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -32,7 +32,6 @@ enum clk_id {
 	tegra_clk_audio4,
 	tegra_clk_audio4_2x,
 	tegra_clk_audio4_mux,
-	tegra_clk_blink,
 	tegra_clk_bsea,
 	tegra_clk_bsev,
 	tegra_clk_cclk_g,
@@ -46,12 +45,6 @@ enum clk_id {
 	tegra_clk_clk_m,
 	tegra_clk_clk_m_div2,
 	tegra_clk_clk_m_div4,
-	tegra_clk_clk_out_1,
-	tegra_clk_clk_out_1_mux,
-	tegra_clk_clk_out_2,
-	tegra_clk_clk_out_2_mux,
-	tegra_clk_clk_out_3,
-	tegra_clk_clk_out_3_mux,
 	tegra_clk_cml0,
 	tegra_clk_cml1,
 	tegra_clk_csi,
diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
deleted file mode 100644
index bec3e008335f..000000000000
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2012, 2013, NVIDIA CORPORATION.  All rights reserved.
- */
-
-#include <linux/io.h>
-#include <linux/clk-provider.h>
-#include <linux/clkdev.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/delay.h>
-#include <linux/export.h>
-#include <linux/clk/tegra.h>
-
-#include "clk.h"
-#include "clk-id.h"
-
-#define PMC_CLK_OUT_CNTRL 0x1a8
-#define PMC_DPD_PADS_ORIDE 0x1c
-#define PMC_DPD_PADS_ORIDE_BLINK_ENB 20
-#define PMC_CTRL 0
-#define PMC_CTRL_BLINK_ENB 7
-#define PMC_BLINK_TIMER 0x40
-
-struct pmc_clk_init_data {
-	char *mux_name;
-	char *gate_name;
-	const char **parents;
-	int num_parents;
-	int mux_id;
-	int gate_id;
-	char *dev_name;
-	u8 mux_shift;
-	u8 gate_shift;
-};
-
-#define PMC_CLK(_num, _mux_shift, _gate_shift)\
-	{\
-		.mux_name = "clk_out_" #_num "_mux",\
-		.gate_name = "clk_out_" #_num,\
-		.parents = clk_out ##_num ##_parents,\
-		.num_parents = ARRAY_SIZE(clk_out ##_num ##_parents),\
-		.mux_id = tegra_clk_clk_out_ ##_num ##_mux,\
-		.gate_id = tegra_clk_clk_out_ ##_num,\
-		.dev_name = "extern" #_num,\
-		.mux_shift = _mux_shift,\
-		.gate_shift = _gate_shift,\
-	}
-
-static DEFINE_SPINLOCK(clk_out_lock);
-
-static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern1",
-};
-
-static const char *clk_out2_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern2",
-};
-
-static const char *clk_out3_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern3",
-};
-
-static struct pmc_clk_init_data pmc_clks[] = {
-	PMC_CLK(1, 6, 2),
-	PMC_CLK(2, 14, 10),
-	PMC_CLK(3, 22, 18),
-};
-
-void __init tegra_pmc_clk_init(void __iomem *pmc_base,
-				struct tegra_clk *tegra_clks)
-{
-	struct clk *clk;
-	struct clk **dt_clk;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(pmc_clks); i++) {
-		struct pmc_clk_init_data *data;
-
-		data = pmc_clks + i;
-
-		dt_clk = tegra_lookup_dt_id(data->mux_id, tegra_clks);
-		if (!dt_clk)
-			continue;
-
-		clk = clk_register_mux(NULL, data->mux_name, data->parents,
-				data->num_parents,
-				CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
-				pmc_base + PMC_CLK_OUT_CNTRL, data->mux_shift,
-				3, 0, &clk_out_lock);
-		*dt_clk = clk;
-
-
-		dt_clk = tegra_lookup_dt_id(data->gate_id, tegra_clks);
-		if (!dt_clk)
-			continue;
-
-		clk = clk_register_gate(NULL, data->gate_name, data->mux_name,
-					CLK_SET_RATE_PARENT,
-					pmc_base + PMC_CLK_OUT_CNTRL,
-					data->gate_shift, 0, &clk_out_lock);
-		*dt_clk = clk;
-		clk_register_clkdev(clk, data->dev_name, data->gate_name);
-	}
-
-	/* blink */
-	writel_relaxed(0, pmc_base + PMC_BLINK_TIMER);
-	clk = clk_register_gate(NULL, "blink_override", "clk_32k", 0,
-				pmc_base + PMC_DPD_PADS_ORIDE,
-				PMC_DPD_PADS_ORIDE_BLINK_ENB, 0, NULL);
-
-	dt_clk = tegra_lookup_dt_id(tegra_clk_blink, tegra_clks);
-	if (!dt_clk)
-		return;
-
-	clk = clk_register_gate(NULL, "blink", "blink_override", 0,
-				pmc_base + PMC_CTRL,
-				PMC_CTRL_BLINK_ENB, 0, NULL);
-	clk_register_clkdev(clk, "blink", NULL);
-	*dt_clk = clk;
-}
-
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 4efcaaf51b3a..36ba1eb3dbe0 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -778,10 +778,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3] = { .dt_id = TEGRA114_CLK_AUDIO3, .present = true },
 	[tegra_clk_audio4] = { .dt_id = TEGRA114_CLK_AUDIO4, .present = true },
 	[tegra_clk_spdif] = { .dt_id = TEGRA114_CLK_SPDIF, .present = true },
-	[tegra_clk_clk_out_1] = { .dt_id = TEGRA114_CLK_CLK_OUT_1, .present = true },
-	[tegra_clk_clk_out_2] = { .dt_id = TEGRA114_CLK_CLK_OUT_2, .present = true },
-	[tegra_clk_clk_out_3] = { .dt_id = TEGRA114_CLK_CLK_OUT_3, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA114_CLK_BLINK, .present = true },
 	[tegra_clk_xusb_host_src] = { .dt_id = TEGRA114_CLK_XUSB_HOST_SRC, .present = true },
 	[tegra_clk_xusb_falcon_src] = { .dt_id = TEGRA114_CLK_XUSB_FALCON_SRC, .present = true },
 	[tegra_clk_xusb_fs_src] = { .dt_id = TEGRA114_CLK_XUSB_FS_SRC, .present = true },
@@ -803,9 +799,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3_mux] = { .dt_id = TEGRA114_CLK_AUDIO3_MUX, .present = true },
 	[tegra_clk_audio4_mux] = { .dt_id = TEGRA114_CLK_AUDIO4_MUX, .present = true },
 	[tegra_clk_spdif_mux] = { .dt_id = TEGRA114_CLK_SPDIF_MUX, .present = true },
-	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA114_CLK_CLK_OUT_1_MUX, .present = true },
-	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA114_CLK_CLK_OUT_2_MUX, .present = true },
-	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA114_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_dsia_mux] = { .dt_id = TEGRA114_CLK_DSIA_MUX, .present = true },
 	[tegra_clk_dsib_mux] = { .dt_id = TEGRA114_CLK_DSIB_MUX, .present = true },
 	[tegra_clk_cec] = { .dt_id = TEGRA114_CLK_CEC, .present = true },
@@ -866,7 +859,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "extern1", .dev_id = "clk_out_1", .dt_id = TEGRA114_CLK_EXTERN1 },
 	{ .con_id = "extern2", .dev_id = "clk_out_2", .dt_id = TEGRA114_CLK_EXTERN2 },
 	{ .con_id = "extern3", .dev_id = "clk_out_3", .dt_id = TEGRA114_CLK_EXTERN3 },
-	{ .con_id = "blink", .dt_id = TEGRA114_CLK_BLINK },
 	{ .con_id = "cclk_g", .dt_id = TEGRA114_CLK_CCLK_G },
 	{ .con_id = "cclk_lp", .dt_id = TEGRA114_CLK_CCLK_LP },
 	{ .con_id = "sclk", .dt_id = TEGRA114_CLK_SCLK },
@@ -1156,8 +1148,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA114_CLK_PLL_A, TEGRA114_CLK_CLK_MAX, 564480000, 1 },
 	{ TEGRA114_CLK_PLL_A_OUT0, TEGRA114_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA114_CLK_EXTERN1, TEGRA114_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA114_CLK_CLK_OUT_1_MUX, TEGRA114_CLK_EXTERN1, 0, 1 },
-	{ TEGRA114_CLK_CLK_OUT_1, TEGRA114_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA114_CLK_I2S0, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA114_CLK_I2S1, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA114_CLK_I2S2, TEGRA114_CLK_PLL_A_OUT0, 11289600, 0 },
@@ -1359,7 +1349,6 @@ static void __init tegra114_clock_init(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks,
 			     tegra114_audio_plls,
 			     ARRAY_SIZE(tegra114_audio_plls), 24000000);
-	tegra_pmc_clk_init(pmc_base, tegra114_clks);
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra114_clks,
 					&pll_x_params);
 
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index b3110d5b5a6c..24532d70e469 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -902,10 +902,6 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3] = { .dt_id = TEGRA124_CLK_AUDIO3, .present = true },
 	[tegra_clk_audio4] = { .dt_id = TEGRA124_CLK_AUDIO4, .present = true },
 	[tegra_clk_spdif] = { .dt_id = TEGRA124_CLK_SPDIF, .present = true },
-	[tegra_clk_clk_out_1] = { .dt_id = TEGRA124_CLK_CLK_OUT_1, .present = true },
-	[tegra_clk_clk_out_2] = { .dt_id = TEGRA124_CLK_CLK_OUT_2, .present = true },
-	[tegra_clk_clk_out_3] = { .dt_id = TEGRA124_CLK_CLK_OUT_3, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA124_CLK_BLINK, .present = true },
 	[tegra_clk_xusb_host_src] = { .dt_id = TEGRA124_CLK_XUSB_HOST_SRC, .present = true },
 	[tegra_clk_xusb_falcon_src] = { .dt_id = TEGRA124_CLK_XUSB_FALCON_SRC, .present = true },
 	[tegra_clk_xusb_fs_src] = { .dt_id = TEGRA124_CLK_XUSB_FS_SRC, .present = true },
@@ -931,9 +927,6 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3_mux] = { .dt_id = TEGRA124_CLK_AUDIO3_MUX, .present = true },
 	[tegra_clk_audio4_mux] = { .dt_id = TEGRA124_CLK_AUDIO4_MUX, .present = true },
 	[tegra_clk_spdif_mux] = { .dt_id = TEGRA124_CLK_SPDIF_MUX, .present = true },
-	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_1_MUX, .present = true },
-	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_2_MUX, .present = true },
-	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA124_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_cec] = { .dt_id = TEGRA124_CLK_CEC, .present = true },
 };
 
@@ -991,7 +984,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "extern1", .dev_id = "clk_out_1", .dt_id = TEGRA124_CLK_EXTERN1 },
 	{ .con_id = "extern2", .dev_id = "clk_out_2", .dt_id = TEGRA124_CLK_EXTERN2 },
 	{ .con_id = "extern3", .dev_id = "clk_out_3", .dt_id = TEGRA124_CLK_EXTERN3 },
-	{ .con_id = "blink", .dt_id = TEGRA124_CLK_BLINK },
 	{ .con_id = "cclk_g", .dt_id = TEGRA124_CLK_CCLK_G },
 	{ .con_id = "cclk_lp", .dt_id = TEGRA124_CLK_CCLK_LP },
 	{ .con_id = "sclk", .dt_id = TEGRA124_CLK_SCLK },
@@ -1301,8 +1293,6 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_PLL_A, TEGRA124_CLK_CLK_MAX, 564480000, 1 },
 	{ TEGRA124_CLK_PLL_A_OUT0, TEGRA124_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA124_CLK_EXTERN1, TEGRA124_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA124_CLK_CLK_OUT_1_MUX, TEGRA124_CLK_EXTERN1, 0, 1 },
-	{ TEGRA124_CLK_CLK_OUT_1, TEGRA124_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA124_CLK_I2S0, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S1, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S2, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
@@ -1457,11 +1447,9 @@ static void __init tegra132_clock_apply_init_table(void)
  * tegra124_132_clock_init_pre - clock initialization preamble for T124/T132
  * @np: struct device_node * of the DT node for the SoC CAR IP block
  *
- * Register most of the clocks controlled by the CAR IP block, along
- * with a few clocks controlled by the PMC IP block.  Everything in
- * this function should be common to Tegra124 and Tegra132.  XXX The
- * PMC clock initialization should probably be moved to PMC-specific
- * driver code.  No return value.
+ * Register most of the clocks controlled by the CAR IP block.
+ * Everything in this function should be common to Tegra124 and Tegra132.
+ * No return value.
  */
 static void __init tegra124_132_clock_init_pre(struct device_node *np)
 {
@@ -1504,7 +1492,6 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra124_clks,
 			     tegra124_audio_plls,
 			     ARRAY_SIZE(tegra124_audio_plls), 24576000);
-	tegra_pmc_clk_init(pmc_base, tegra124_clks);
 
 	/* For Tegra124 & Tegra132, PLLD is the only source for DSIA & DSIB */
 	plld_base = readl(clk_base + PLLD_BASE);
@@ -1516,11 +1503,11 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
  * tegra124_132_clock_init_post - clock initialization postamble for T124/T132
  * @np: struct device_node * of the DT node for the SoC CAR IP block
  *
- * Register most of the along with a few clocks controlled by the PMC
- * IP block.  Everything in this function should be common to Tegra124
+ * Register most of the clocks controlled by the CAR IP block.
+ * Everything in this function should be common to Tegra124
  * and Tegra132.  This function must be called after
- * tegra124_132_clock_init_pre(), otherwise clk_base and pmc_base will
- * not be set.  No return value.
+ * tegra124_132_clock_init_pre(), otherwise clk_base will not be set.
+ * No return value.
  */
 static void __init tegra124_132_clock_init_post(struct device_node *np)
 {
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 4d8222f5c638..fe536f1d770d 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -458,7 +458,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "cdev1", .dt_id = TEGRA20_CLK_CDEV1 },
 	{ .con_id = "cdev2", .dt_id = TEGRA20_CLK_CDEV2 },
 	{ .con_id = "clk_32k", .dt_id = TEGRA20_CLK_CLK_32K },
-	{ .con_id = "blink", .dt_id = TEGRA20_CLK_BLINK },
 	{ .con_id = "clk_m", .dt_id = TEGRA20_CLK_CLK_M },
 	{ .con_id = "pll_ref", .dt_id = TEGRA20_CLK_PLL_REF },
 	{ .dev_id = "tegra20-i2s.0", .dt_id = TEGRA20_CLK_I2S1 },
@@ -537,7 +536,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_csi] = { .dt_id = TEGRA20_CLK_CSI, .present = true },
 	[tegra_clk_isp] = { .dt_id = TEGRA20_CLK_ISP, .present = true },
 	[tegra_clk_clk_32k] = { .dt_id = TEGRA20_CLK_CLK_32K, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA20_CLK_BLINK, .present = true },
 	[tegra_clk_hclk] = { .dt_id = TEGRA20_CLK_HCLK, .present = true },
 	[tegra_clk_pclk] = { .dt_id = TEGRA20_CLK_PCLK, .present = true },
 	[tegra_clk_pll_p_out1] = { .dt_id = TEGRA20_CLK_PLL_P_OUT1, .present = true },
@@ -1034,7 +1032,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_PLL_A, TEGRA20_CLK_CLK_MAX, 56448000, 1 },
 	{ TEGRA20_CLK_PLL_A_OUT0, TEGRA20_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA20_CLK_CDEV1, TEGRA20_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA20_CLK_BLINK, TEGRA20_CLK_CLK_MAX, 32768, 1 },
 	{ TEGRA20_CLK_I2S1, TEGRA20_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA20_CLK_I2S2, TEGRA20_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA20_CLK_SDMMC1, TEGRA20_CLK_PLL_P, 48000000, 0 },
@@ -1148,7 +1145,6 @@ static void __init tegra20_clock_init(struct device_node *np)
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra20_clks, NULL);
 	tegra20_periph_clk_init();
 	tegra20_audio_clk_init();
-	tegra_pmc_clk_init(pmc_base, tegra20_clks);
 
 	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA20_CLK_CLK_MAX);
 
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 762cd186f714..af5119481d54 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2417,10 +2417,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3] = { .dt_id = TEGRA210_CLK_AUDIO3, .present = true },
 	[tegra_clk_audio4] = { .dt_id = TEGRA210_CLK_AUDIO4, .present = true },
 	[tegra_clk_spdif] = { .dt_id = TEGRA210_CLK_SPDIF, .present = true },
-	[tegra_clk_clk_out_1] = { .dt_id = TEGRA210_CLK_CLK_OUT_1, .present = true },
-	[tegra_clk_clk_out_2] = { .dt_id = TEGRA210_CLK_CLK_OUT_2, .present = true },
-	[tegra_clk_clk_out_3] = { .dt_id = TEGRA210_CLK_CLK_OUT_3, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA210_CLK_BLINK, .present = true },
 	[tegra_clk_xusb_gate] = { .dt_id = TEGRA210_CLK_XUSB_GATE, .present = true },
 	[tegra_clk_xusb_host_src_8] = { .dt_id = TEGRA210_CLK_XUSB_HOST_SRC, .present = true },
 	[tegra_clk_xusb_falcon_src_8] = { .dt_id = TEGRA210_CLK_XUSB_FALCON_SRC, .present = true },
@@ -2452,9 +2448,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3_mux] = { .dt_id = TEGRA210_CLK_AUDIO3_MUX, .present = true },
 	[tegra_clk_audio4_mux] = { .dt_id = TEGRA210_CLK_AUDIO4_MUX, .present = true },
 	[tegra_clk_spdif_mux] = { .dt_id = TEGRA210_CLK_SPDIF_MUX, .present = true },
-	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_1_MUX, .present = true },
-	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_2_MUX, .present = true },
-	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA210_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_maud] = { .dt_id = TEGRA210_CLK_MAUD, .present = true },
 	[tegra_clk_mipibif] = { .dt_id = TEGRA210_CLK_MIPIBIF, .present = true },
 	[tegra_clk_qspi] = { .dt_id = TEGRA210_CLK_QSPI, .present = true },
@@ -2543,7 +2536,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "extern1", .dev_id = "clk_out_1", .dt_id = TEGRA210_CLK_EXTERN1 },
 	{ .con_id = "extern2", .dev_id = "clk_out_2", .dt_id = TEGRA210_CLK_EXTERN2 },
 	{ .con_id = "extern3", .dev_id = "clk_out_3", .dt_id = TEGRA210_CLK_EXTERN3 },
-	{ .con_id = "blink", .dt_id = TEGRA210_CLK_BLINK },
 	{ .con_id = "cclk_g", .dt_id = TEGRA210_CLK_CCLK_G },
 	{ .con_id = "cclk_lp", .dt_id = TEGRA210_CLK_CCLK_LP },
 	{ .con_id = "sclk", .dt_id = TEGRA210_CLK_SCLK },
@@ -3451,8 +3443,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_PLL_A, TEGRA210_CLK_CLK_MAX, 564480000, 1 },
 	{ TEGRA210_CLK_PLL_A_OUT0, TEGRA210_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA210_CLK_EXTERN1, TEGRA210_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA210_CLK_CLK_OUT_1_MUX, TEGRA210_CLK_EXTERN1, 0, 1 },
-	{ TEGRA210_CLK_CLK_OUT_1, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_I2S0, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA210_CLK_I2S1, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA210_CLK_I2S2, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
@@ -3693,7 +3683,6 @@ static void __init tegra210_clock_init(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra210_clks,
 			     tegra210_audio_plls,
 			     ARRAY_SIZE(tegra210_audio_plls), 24576000);
-	tegra_pmc_clk_init(pmc_base, tegra210_clks);
 
 	/* For Tegra210, PLLD is the only source for DSIA & DSIB */
 	value = readl(clk_base + PLLD_BASE);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index c8bc18e4d7e5..24599ed2e6ff 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -572,7 +572,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "extern1", .dev_id = "clk_out_1", .dt_id = TEGRA30_CLK_EXTERN1 },
 	{ .con_id = "extern2", .dev_id = "clk_out_2", .dt_id = TEGRA30_CLK_EXTERN2 },
 	{ .con_id = "extern3", .dev_id = "clk_out_3", .dt_id = TEGRA30_CLK_EXTERN3 },
-	{ .con_id = "blink", .dt_id = TEGRA30_CLK_BLINK },
 	{ .con_id = "cclk_g", .dt_id = TEGRA30_CLK_CCLK_G },
 	{ .con_id = "cclk_lp", .dt_id = TEGRA30_CLK_CCLK_LP },
 	{ .con_id = "sclk", .dt_id = TEGRA30_CLK_SCLK },
@@ -711,13 +710,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_audio3_2x] = { .dt_id = TEGRA30_CLK_AUDIO3_2X, .present = true },
 	[tegra_clk_audio4_2x] = { .dt_id = TEGRA30_CLK_AUDIO4_2X, .present = true },
 	[tegra_clk_spdif_2x] = { .dt_id = TEGRA30_CLK_SPDIF_2X, .present = true },
-	[tegra_clk_clk_out_1] = { .dt_id = TEGRA30_CLK_CLK_OUT_1, .present = true },
-	[tegra_clk_clk_out_2] = { .dt_id = TEGRA30_CLK_CLK_OUT_2, .present = true },
-	[tegra_clk_clk_out_3] = { .dt_id = TEGRA30_CLK_CLK_OUT_3, .present = true },
-	[tegra_clk_blink] = { .dt_id = TEGRA30_CLK_BLINK, .present = true },
-	[tegra_clk_clk_out_1_mux] = { .dt_id = TEGRA30_CLK_CLK_OUT_1_MUX, .present = true },
-	[tegra_clk_clk_out_2_mux] = { .dt_id = TEGRA30_CLK_CLK_OUT_2_MUX, .present = true },
-	[tegra_clk_clk_out_3_mux] = { .dt_id = TEGRA30_CLK_CLK_OUT_3_MUX, .present = true },
 	[tegra_clk_hclk] = { .dt_id = TEGRA30_CLK_HCLK, .present = true },
 	[tegra_clk_pclk] = { .dt_id = TEGRA30_CLK_PCLK, .present = true },
 	[tegra_clk_i2s0] = { .dt_id = TEGRA30_CLK_I2S0, .present = true },
@@ -1230,9 +1222,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 1 },
 	{ TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 1 },
 	{ TEGRA30_CLK_EXTERN1, TEGRA30_CLK_PLL_A_OUT0, 0, 1 },
-	{ TEGRA30_CLK_CLK_OUT_1_MUX, TEGRA30_CLK_EXTERN1, 0, 0 },
-	{ TEGRA30_CLK_CLK_OUT_1, TEGRA30_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA30_CLK_BLINK, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_I2S0, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA30_CLK_I2S1, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA30_CLK_I2S2, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
@@ -1364,7 +1353,6 @@ static void __init tegra30_clock_init(struct device_node *np)
 	tegra_audio_clk_init(clk_base, pmc_base, tegra30_clks,
 			     tegra30_audio_plls,
 			     ARRAY_SIZE(tegra30_audio_plls), 24000000);
-	tegra_pmc_clk_init(pmc_base, tegra30_clks);
 
 	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA30_CLK_CLK_MAX);
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 416a6b09f6a3..2c9a68302e02 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -854,7 +854,6 @@ void tegra_periph_clk_init(void __iomem *clk_base, void __iomem *pmc_base,
 			struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
 
-void tegra_pmc_clk_init(void __iomem *pmc_base, struct tegra_clk *tegra_clks);
 void tegra_fixed_clk_init(struct tegra_clk *tegra_clks);
 int tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 		       unsigned long *input_freqs, unsigned int num,
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
