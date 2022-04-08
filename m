Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA84F9421
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:31:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353D71A00;
	Fri,  8 Apr 2022 13:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353D71A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417485;
	bh=Qm+UCnf2ehrHnyB/Q/aVWd7YST1uUQc7iS2HAQ8TtJo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1ns5Keseq1Ps3E0Lw94OtecmA3JHTMvRW6QNqBMN9X/sj9jJhxqWHqb6ECWMn+ZB
	 sY4j8X9YQ74kLEXkFb62HYKsW0faz5KsCrcGaBy38REZtTD1nji/pDKHjgSXIQ+ui1
	 Sh3w3R4NQDBib26RDvH5H7ES4fAqshHUvkWPL87I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC5DF8052F;
	Fri,  8 Apr 2022 13:29:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0F85F80054; Fri,  8 Apr 2022 13:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 280A3F80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 280A3F80054
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo6-0004tW-Gx; Fri, 08 Apr 2022 13:29:38 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo6-001n6G-Uz; Fri, 08 Apr 2022 13:29:37 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo2-005ZB9-V1; Fri, 08 Apr 2022 13:29:34 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 10/21] dmaengine: imx-sdma: error out on unsupported
 transfer types
Date: Fri,  8 Apr 2022 13:29:17 +0200
Message-Id: <20220408112928.1326755-11-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408112928.1326755-1-s.hauer@pengutronix.de>
References: <20220408112928.1326755-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
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
Acked-By: Vinod Koul <vkoul@kernel.org>
---

Notes:
    Changes since v2:
    - Use prefix dmaengine:

 drivers/dma/imx-sdma.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 80261a905eb5b..0e70843567cef 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -940,7 +940,7 @@ static irqreturn_t sdma_int_handler(int irq, void *dev_id)
 /*
  * sets the pc of SDMA script according to the peripheral type
  */
-static void sdma_get_pc(struct sdma_channel *sdmac,
+static int sdma_get_pc(struct sdma_channel *sdmac,
 		enum sdma_peripheral_type peripheral_type)
 {
 	struct sdma_engine *sdma = sdmac->sdma;
@@ -1039,13 +1039,17 @@ static void sdma_get_pc(struct sdma_channel *sdmac,
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
@@ -1213,6 +1217,7 @@ static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
 static int sdma_config_channel(struct dma_chan *chan)
 {
 	struct sdma_channel *sdmac = to_sdma_chan(chan);
+	int ret;
 
 	sdma_disable_channel(chan);
 
@@ -1233,7 +1238,9 @@ static int sdma_config_channel(struct dma_chan *chan)
 		break;
 	}
 
-	sdma_get_pc(sdmac, sdmac->peripheral_type);
+	ret = sdma_get_pc(sdmac, sdmac->peripheral_type);
+	if (ret)
+		return ret;
 
 	if ((sdmac->peripheral_type != IMX_DMATYPE_MEMORY) &&
 			(sdmac->peripheral_type != IMX_DMATYPE_DSP)) {
@@ -1349,7 +1356,9 @@ static int sdma_alloc_chan_resources(struct dma_chan *chan)
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

