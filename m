Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290B4500C2
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 10:01:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DB0116AE;
	Mon, 15 Nov 2021 10:00:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DB0116AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636966879;
	bh=2mwiQpykEAXMR4c+gQ0r0Cque843ND6M/qUoWmqOlf8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pdOHL/E6pO6OLfp0BiRxqm9MGVDrFsdmHXM9m7Aoewne2QE/nEQn0eD/dMvlwVnPH
	 MBGjS9EnUD3E5lYrrFnvPyQdpcroIFgYKV4F68EvoIG1z6S6Ra2pISuWkQOIrYkMLu
	 gYcoO4WVWTNHhUHpXjwljqM2kbBeJiITdBfWG0gE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8805F8051F;
	Mon, 15 Nov 2021 09:57:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43C53F801D5; Mon, 15 Nov 2021 09:55:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B95AF8027D
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 09:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B95AF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pHgGGVZQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A00EC61BE2;
 Mon, 15 Nov 2021 08:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966538;
 bh=2mwiQpykEAXMR4c+gQ0r0Cque843ND6M/qUoWmqOlf8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pHgGGVZQvgwKAmuviD4hubeWYMREgXxWJfeEBFZjz9j7lBnAjNfaItSixiYQ6tjsd
 jlNLqSO0tvDtiPP2nku90UBbbEHEImWKTSBEcAumAqCmZQgGOYbpyk8Rb61A5J0ESC
 99O3hsO+/+1bwks/a9SZtbcyG0O+O/00i2AbMnY7eG3n//Jaz8vyE/OfHd8obW8zPq
 3Ut6okySvy2UdYHuRjo3kbCZGY58jshqcW/NX5g436dbVwon7Kj6IlVof7U6GVjRvg
 28QwkGliURHIe9Bf7nzdJhzb6dqoRlNUVZg2hdB7bsOSgpPSdfvbPnSPLYKcfSwNZz
 a4RwOAKAjsSCg==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Date: Mon, 15 Nov 2021 09:54:00 +0100
Message-Id: <20211115085403.360194-9-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211115085403.360194-1-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Nov 2021 09:57:03 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
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

From: Arnd Bergmann <arnd@arndb.de>

The display driver wants to pass a custom flag to the DMA engine driver,
which it started doing by using the slave_id field that was traditionally
used for a different purpose.

As there is no longer a correct use for the slave_id field, it should
really be removed, and the remaining users changed over to something
different.

The new mechanism for passing nonstandard settings is using the
.peripheral_config field, so use that to pass a newly defined structure
here, making it clear that this will not work in portable drivers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/xilinx/xilinx_dpdma.c  | 12 ++++++++----
 drivers/gpu/drm/xlnx/zynqmp_disp.c |  9 +++++++--
 include/linux/dma/xilinx_dpdma.h   | 11 +++++++++++
 3 files changed, 26 insertions(+), 6 deletions(-)
 create mode 100644 include/linux/dma/xilinx_dpdma.h

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index ce5c66e6897d..e2c1ef7a659c 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/dma/xilinx_dpdma.h>
 #include <linux/dmaengine.h>
 #include <linux/dmapool.h>
 #include <linux/interrupt.h>
@@ -1273,6 +1274,7 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
 			       struct dma_slave_config *config)
 {
 	struct xilinx_dpdma_chan *chan = to_xilinx_chan(dchan);
+	struct xilinx_dpdma_peripheral_config *pconfig;
 	unsigned long flags;
 
 	/*
@@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
 	spin_lock_irqsave(&chan->lock, flags);
 
 	/*
-	 * Abuse the slave_id to indicate that the channel is part of a video
-	 * group.
+	 * Abuse the peripheral_config to indicate that the channel is part
+	 * of a video group.
 	 */
-	if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
-		chan->video_group = config->slave_id != 0;
+	pconfig = config->peripheral_config;
+	if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
+	    config->peripheral_size == sizeof(*pconfig))
+		chan->video_group = pconfig->video_group;
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index ff2b308d8651..11c409cbc88e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -24,6 +24,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dma/xilinx_dpdma.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/module.h>
@@ -1058,14 +1059,18 @@ static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
 
 	/*
-	 * Set slave_id for each DMA channel to indicate they're part of a
+	 * Set pconfig for each DMA channel to indicate they're part of a
 	 * video group.
 	 */
 	for (i = 0; i < info->num_planes; i++) {
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
+		struct xilinx_dpdma_peripheral_config pconfig = {
+			.video_group = true,
+		};
 		struct dma_slave_config config = {
 			.direction = DMA_MEM_TO_DEV,
-			.slave_id = 1,
+			.peripheral_config = &pconfig,
+			.peripheral_size = sizeof(pconfig),
 		};
 
 		dmaengine_slave_config(dma->chan, &config);
diff --git a/include/linux/dma/xilinx_dpdma.h b/include/linux/dma/xilinx_dpdma.h
new file mode 100644
index 000000000000..83a1377f03f8
--- /dev/null
+++ b/include/linux/dma/xilinx_dpdma.h
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef __LINUX_DMA_XILINX_DPDMA_H
+#define __LINUX_DMA_XILINX_DPDMA_H
+
+#include <linux/types.h>
+
+struct xilinx_dpdma_peripheral_config {
+	bool video_group;
+};
+
+#endif /* __LINUX_DMA_XILINX_DPDMA_H */
-- 
2.30.2

