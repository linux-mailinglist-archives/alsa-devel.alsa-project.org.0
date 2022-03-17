Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9344DC140
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 09:31:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4EBF18ED;
	Thu, 17 Mar 2022 09:30:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4EBF18ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647505884;
	bh=pu9b/VGEfaa0EGzZkhkPBp1Hb4k2F0QvsISULA7CvUE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zqys7teboJb24DO1U9hzy9I1M4Ezsq24ABd14OnIbt8fgiZkV4OIO8DWML84RVSa5
	 OEAS7BRDfYSYZU4H89D6xkkN6nM714t9FNJXSHF1zZT+LAZFmyAjMkdokcT2E00Z7J
	 FQ8Bq7eD06KLLhmeKjr5Ul6cI0JbYWgVlLuR/Fuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F5A5F80538;
	Thu, 17 Mar 2022 09:28:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22F38F80159; Thu, 17 Mar 2022 09:28:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFC02F8020D
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 09:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFC02F8020D
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUt-000690-4a; Thu, 17 Mar 2022 09:28:39 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUm-0027U3-UI; Thu, 17 Mar 2022 09:28:32 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/19] dma: imx-sdma: Add multi fifo support
Date: Thu, 17 Mar 2022 09:28:09 +0100
Message-Id: <20220317082818.503143-11-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220317082818.503143-1-s.hauer@pengutronix.de>
References: <20220317082818.503143-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 dmaengine@vger.kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>
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

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/dma/imx-sdma.c                | 54 +++++++++++++++++++++++++++
 include/linux/platform_data/dma-imx.h |  7 ++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 1038f6bc7f846..21e1cec2ffde9 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -14,6 +14,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/types.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/mm.h>
 #include <linux/interrupt.h>
@@ -73,6 +74,7 @@
 #define SDMA_CHNENBL0_IMX35	0x200
 #define SDMA_CHNENBL0_IMX31	0x080
 #define SDMA_CHNPRI_0		0x100
+#define SDMA_DONE0_CONFIG	0x1000
 
 /*
  * Buffer descriptor status values.
@@ -180,6 +182,12 @@
 				 BIT(DMA_MEM_TO_DEV) | \
 				 BIT(DMA_DEV_TO_DEV))
 
+#define SDMA_WATERMARK_LEVEL_N_FIFOS	GENMASK(15, 12)
+#define SDMA_WATERMARK_LEVEL_SW_DONE	BIT(23)
+
+#define SDMA_DONE0_CONFIG_DONE_SEL	BIT(7)
+#define SDMA_DONE0_CONFIG_DONE_DIS	BIT(6)
+
 /**
  * struct sdma_script_start_addrs - SDMA script start pointers
  *
@@ -441,6 +449,11 @@ struct sdma_channel {
 	struct work_struct		terminate_worker;
 	struct list_head                terminated;
 	bool				is_ram_script;
+	unsigned int			n_fifos;
+	unsigned int			n_fifos_src;
+	unsigned int			n_fifos_dst;
+	bool				sw_done;
+	u32				sw_done_sel;
 };
 
 #define IMX_DMA_SG_LOOP		BIT(0)
@@ -773,6 +786,14 @@ static void sdma_event_enable(struct sdma_channel *sdmac, unsigned int event)
 	val = readl_relaxed(sdma->regs + chnenbl);
 	__set_bit(channel, &val);
 	writel_relaxed(val, sdma->regs + chnenbl);
+
+	/* Set SDMA_DONEx_CONFIG is sw_done enabled */
+	if (sdmac->sw_done) {
+		val = readl_relaxed(sdma->regs + SDMA_DONE0_CONFIG);
+		val |= SDMA_DONE0_CONFIG_DONE_SEL;
+		val &= ~SDMA_DONE0_CONFIG_DONE_DIS;
+		writel_relaxed(val, sdma->regs + SDMA_DONE0_CONFIG);
+	}
 }
 
 static void sdma_event_disable(struct sdma_channel *sdmac, unsigned int event)
@@ -1022,6 +1043,10 @@ static int sdma_get_pc(struct sdma_channel *sdmac,
 	case IMX_DMATYPE_IPU_MEMORY:
 		emi_2_per = sdma->script_addrs->ext_mem_2_ipu_addr;
 		break;
+	case IMX_DMATYPE_MULTI_SAI:
+		per_2_emi = sdma->script_addrs->sai_2_mcu_addr;
+		emi_2_per = sdma->script_addrs->mcu_2_sai_addr;
+		break;
 	default:
 		dev_err(sdma->dev, "Unsupported transfer type %d\n",
 			peripheral_type);
@@ -1198,6 +1223,15 @@ static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
 	sdmac->watermark_level |= SDMA_WATERMARK_LEVEL_CONT;
 }
 
+static void sdma_set_watermarklevel_for_sais(struct sdma_channel *sdmac)
+{
+	if (sdmac->sw_done)
+		sdmac->watermark_level |= SDMA_WATERMARK_LEVEL_SW_DONE;
+
+	sdmac->watermark_level |=
+			FIELD_PREP(SDMA_WATERMARK_LEVEL_N_FIFOS, sdmac->n_fifos);
+}
+
 static int sdma_config_channel(struct dma_chan *chan)
 {
 	struct sdma_channel *sdmac = to_sdma_chan(chan);
@@ -1234,6 +1268,10 @@ static int sdma_config_channel(struct dma_chan *chan)
 			    sdmac->peripheral_type == IMX_DMATYPE_ASRC)
 				sdma_set_watermarklevel_for_p2p(sdmac);
 		} else {
+			if (sdmac->peripheral_type ==
+					IMX_DMATYPE_MULTI_SAI)
+				sdma_set_watermarklevel_for_sais(sdmac);
+
 			__set_bit(sdmac->event_id0, sdmac->event_mask);
 		}
 
@@ -1669,6 +1707,7 @@ static int sdma_config_write(struct dma_chan *chan,
 		sdmac->watermark_level = dmaengine_cfg->src_maxburst *
 			dmaengine_cfg->src_addr_width;
 		sdmac->word_size = dmaengine_cfg->src_addr_width;
+		sdmac->n_fifos =  sdmac->n_fifos_src;
 	} else if (direction == DMA_DEV_TO_DEV) {
 		sdmac->per_address2 = dmaengine_cfg->src_addr;
 		sdmac->per_address = dmaengine_cfg->dst_addr;
@@ -1682,6 +1721,7 @@ static int sdma_config_write(struct dma_chan *chan,
 		sdmac->watermark_level = dmaengine_cfg->dst_maxburst *
 			dmaengine_cfg->dst_addr_width;
 		sdmac->word_size = dmaengine_cfg->dst_addr_width;
+		sdmac->n_fifos =  sdmac->n_fifos_dst;
 	}
 	sdmac->direction = direction;
 	return sdma_config_channel(chan);
@@ -1691,9 +1731,23 @@ static int sdma_config(struct dma_chan *chan,
 		       struct dma_slave_config *dmaengine_cfg)
 {
 	struct sdma_channel *sdmac = to_sdma_chan(chan);
+	struct sdma_engine *sdma = sdmac->sdma;
 
 	memcpy(&sdmac->slave_config, dmaengine_cfg, sizeof(*dmaengine_cfg));
 
+	if (dmaengine_cfg->peripheral_config) {
+		struct sdma_peripheral_config *sdmacfg = dmaengine_cfg->peripheral_config;
+		if (dmaengine_cfg->peripheral_size != sizeof(struct sdma_peripheral_config)) {
+			dev_err(sdma->dev, "Invalid peripheral size %zu, expected %zu\n",
+				dmaengine_cfg->peripheral_size,
+				sizeof(struct sdma_peripheral_config));
+			return -EINVAL;
+		}
+		sdmac->n_fifos_src = sdmacfg->n_fifos_src;
+		sdmac->n_fifos_dst = sdmacfg->n_fifos_dst;
+		sdmac->sw_done = sdmacfg->sw_done;
+	}
+
 	/* Set ENBLn earlier to make sure dma request triggered after that */
 	if (sdmac->event_id0 >= sdmac->sdma->drvdata->num_events)
 		return -EINVAL;
diff --git a/include/linux/platform_data/dma-imx.h b/include/linux/platform_data/dma-imx.h
index 281adbb26e6bd..4a43a048e1b4d 100644
--- a/include/linux/platform_data/dma-imx.h
+++ b/include/linux/platform_data/dma-imx.h
@@ -39,6 +39,7 @@ enum sdma_peripheral_type {
 	IMX_DMATYPE_SSI_DUAL,	/* SSI Dual FIFO */
 	IMX_DMATYPE_ASRC_SP,	/* Shared ASRC */
 	IMX_DMATYPE_SAI,	/* SAI */
+	IMX_DMATYPE_MULTI_SAI,	/* MULTI FIFOs For Audio */
 };
 
 enum imx_dma_prio {
@@ -65,4 +66,10 @@ static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
 		!strcmp(chan->device->dev->driver->name, "imx-dma");
 }
 
+struct sdma_peripheral_config {
+	int n_fifos_src;
+	int n_fifos_dst;
+	bool sw_done;
+};
+
 #endif
-- 
2.30.2

