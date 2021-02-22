Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B8321263
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 09:54:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6D731675;
	Mon, 22 Feb 2021 09:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6D731675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613984052;
	bh=80XVqyS1GeDJKM+wRSyTCDPJS+poXNv6IjXaV89xGys=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fshqnm8mnMxpzLTnZjbLb2ZbEelaEAyK3d5KcfQpmk/nrCsDyehW3LJFDsU7SXNht
	 gSOAcN4rvpJRirldoL2H3pxvjhlCwjOiV08U9MUZjfRGXHAXhGW1NR+rIyhu7pdoAG
	 CBw6x5qRUQDd1SyS01VvyH7FeD4ubBn+jTdVAfvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E79AF8026F;
	Mon, 22 Feb 2021 09:52:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F4CF8025E; Mon, 22 Feb 2021 09:52:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE421F80129
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 09:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE421F80129
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id ABE4B20032D;
 Mon, 22 Feb 2021 09:52:30 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5B90E20028F;
 Mon, 22 Feb 2021 09:52:25 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A070F40281;
 Mon, 22 Feb 2021 09:52:18 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_sai: Add pm qos cpu latency support
Date: Mon, 22 Feb 2021 16:40:20 +0800
Message-Id: <1613983220-5373-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On SoCs such as i.MX7ULP, cpuidle has some levels which
may disable system/bus clocks, so need to add pm_qos to
prevent cpuidle from entering low level idles and make sure
system/bus clocks are enabled when sai is active.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
 sound/soc/fsl/fsl_sai.h |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5e65b456d3e2..a22679dea578 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/pm_qos.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -1177,6 +1178,7 @@ static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.fifo_depth = 32,
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = false,
+	.flags = 0,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
@@ -1185,6 +1187,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.fifo_depth = 32,
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = true,
+	.flags = 0,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
@@ -1193,6 +1196,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
 	.fifo_depth = 16,
 	.reg_offset = 8,
 	.mclk0_is_mclk1 = false,
+	.flags = PMQOS_CPU_LATENCY,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
@@ -1201,6 +1205,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
 	.fifo_depth = 128,
 	.reg_offset = 8,
 	.mclk0_is_mclk1 = false,
+	.flags = 0,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
@@ -1209,6 +1214,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
 	.fifo_depth = 64,
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = false,
+	.flags = 0,
 };
 
 static const struct of_device_id fsl_sai_ids[] = {
@@ -1235,6 +1241,9 @@ static int fsl_sai_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(sai->bus_clk);
 
+	if (sai->soc_data->flags & PMQOS_CPU_LATENCY)
+		cpu_latency_qos_remove_request(&sai->pm_qos_req);
+
 	regcache_cache_only(sai->regmap, true);
 
 	return 0;
@@ -1264,6 +1273,9 @@ static int fsl_sai_runtime_resume(struct device *dev)
 			goto disable_tx_clk;
 	}
 
+	if (sai->soc_data->flags & PMQOS_CPU_LATENCY)
+		cpu_latency_qos_add_request(&sai->pm_qos_req, 0);
+
 	regcache_cache_only(sai->regmap, false);
 	regcache_mark_dirty(sai->regmap);
 	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index ff2619f1b214..bc60030967dd 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -216,12 +216,15 @@
 #define FSL_SAI_MAXBURST_TX 6
 #define FSL_SAI_MAXBURST_RX 6
 
+#define PMQOS_CPU_LATENCY   BIT(0)
+
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
 	bool use_edma;
 	bool mclk0_is_mclk1;
 	unsigned int fifo_depth;
 	unsigned int reg_offset;
+	unsigned int flags;
 };
 
 /**
@@ -273,6 +276,7 @@ struct fsl_sai {
 	struct snd_dmaengine_dai_dma_data dma_params_tx;
 	struct fsl_sai_verid verid;
 	struct fsl_sai_param param;
+	struct pm_qos_request pm_qos_req;
 };
 
 #define TX 1
-- 
2.27.0

