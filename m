Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48E4DC150
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 09:32:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF3691904;
	Thu, 17 Mar 2022 09:31:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF3691904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647505965;
	bh=hYGxH2zw+YWjTNpQWt2LjOMsC1FM30IAJWv1y+Qklyo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7F+Lah702OTe8g7/4kas7So0gX8DbLDkLWh39BoDP0D/jNuXFrFPXCEu7u1uSF4p
	 Aa9nKfJzWCEU4pVmAZNphmfpy3b28MxCpsvV/qV6Z3zt0Juda3optcNYggrQqL8czr
	 pyK7Bma/XjiXkZ5GDiwgPmAxsYe5FSeIEsG51zGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FDC8F8023A;
	Thu, 17 Mar 2022 09:29:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFD4AF8053E; Thu, 17 Mar 2022 09:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7581FF80124
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 09:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7581FF80124
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUo-00068z-7j; Thu, 17 Mar 2022 09:28:34 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUm-0027U0-Tk; Thu, 17 Mar 2022 09:28:32 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/19] dma: imx-sdma: error out on unsupported transfer types
Date: Thu, 17 Mar 2022 09:28:08 +0100
Message-Id: <20220317082818.503143-10-s.hauer@pengutronix.de>
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

The i.MX SDMA driver currently silently ignores unsupported transfer
types. These transfer types are specified in the dma channel description
in the device tree, so they should really be checked.
Issue a message and error out when we hit unsupported transfer types.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 75ec0754d4ad4..1038f6bc7f846 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -924,7 +924,7 @@ static irqreturn_t sdma_int_handler(int irq, void *dev_id)
 /*
  * sets the pc of SDMA script according to the peripheral type
  */
-static void sdma_get_pc(struct sdma_channel *sdmac,
+static int sdma_get_pc(struct sdma_channel *sdmac,
 		enum sdma_peripheral_type peripheral_type)
 {
 	struct sdma_engine *sdma = sdmac->sdma;
@@ -1023,13 +1023,17 @@ static void sdma_get_pc(struct sdma_channel *sdmac,
 		emi_2_per = sdma->script_addrs->ext_mem_2_ipu_addr;
 		break;
 	default:
-		break;
+		dev_err(sdma->dev, "Unsupported transfer type %d\n",
+			peripheral_type);
+		return -EINVAL;
 	}
 
 	sdmac->pc_from_device = per_2_emi;
 	sdmac->pc_to_device = emi_2_per;
 	sdmac->device_to_device = per_2_per;
 	sdmac->pc_to_pc = emi_2_emi;
+
+	return 0;
 }
 
 static int sdma_load_context(struct sdma_channel *sdmac)
@@ -1197,6 +1201,7 @@ static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
 static int sdma_config_channel(struct dma_chan *chan)
 {
 	struct sdma_channel *sdmac = to_sdma_chan(chan);
+	int ret;
 
 	sdma_disable_channel(chan);
 
@@ -1217,7 +1222,9 @@ static int sdma_config_channel(struct dma_chan *chan)
 		break;
 	}
 
-	sdma_get_pc(sdmac, sdmac->peripheral_type);
+	ret = sdma_get_pc(sdmac, sdmac->peripheral_type);
+	if (ret)
+		return ret;
 
 	if ((sdmac->peripheral_type != IMX_DMATYPE_MEMORY) &&
 			(sdmac->peripheral_type != IMX_DMATYPE_DSP)) {
@@ -1333,7 +1340,9 @@ static int sdma_alloc_chan_resources(struct dma_chan *chan)
 		mem_data.dma_request2 = 0;
 		data = &mem_data;
 
-		sdma_get_pc(sdmac, IMX_DMATYPE_MEMORY);
+		ret = sdma_get_pc(sdmac, IMX_DMATYPE_MEMORY);
+		if (ret)
+			return ret;
 	}
 
 	switch (data->priority) {
-- 
2.30.2

