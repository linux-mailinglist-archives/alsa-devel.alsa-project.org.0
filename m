Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB2459E12
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:31:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAC2F16BF;
	Tue, 23 Nov 2021 09:30:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAC2F16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656284;
	bh=DMxz9rkJwWZ5AqTdDggA8BLDb3DTgP5Oz0VUo2zj6B4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UjNSBheBwWBL+5yW5Nhn79lKQFTUzjSReoVcm4ypWiiaFmfPMqrX5j4U/rBfBO8DC
	 XUlJz0k7pk8Vn+DCJl90cstMNRd9nDxw6NzAUYzDIA9nFBvgkI+spJXm/+rDtHl1io
	 5iysPR+Vl/DZWbVVND20Tl/ZdnX5rCGtto6/+Uoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40089F805D7;
	Tue, 23 Nov 2021 09:22:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A61DF80212; Mon, 22 Nov 2021 23:23:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 023C1F801F7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 23:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 023C1F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D2LWKDba"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E0A061053;
 Mon, 22 Nov 2021 22:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619811;
 bh=DMxz9rkJwWZ5AqTdDggA8BLDb3DTgP5Oz0VUo2zj6B4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D2LWKDbatUWolgPnSkaWF6uAmXJr7TRUsffIAYil8ieu9gP8qTxDGTlSSeFslk+FX
 lfasUT+qjAZz4FqvxeQbdvqY7gm+Szg9KN11yNlzJ9GOQaUe2v85AHYKYosrXAMyrE
 83Qo7Vahw/aCxC+KQwYxEhvp5nYKM2xiNPHzZz3mpotZj10zImrNUftev0qcZA03Zn
 NQLipAZpiDTgThm7UHwH21MkyStuMHBgZkt8Z6fmCqVtjxInuWYT3q2YF1Ajj0kiB1
 UMwMelZbEWO8BXX6fob9irbYUtNypouPZRN0P8c65LiXoihCRpce5QwQAS3j6Vkxsv
 uUuI47S8VCEng==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 09/11] dmaengine: xilinx_dpdma: stop using slave_id field
Date: Mon, 22 Nov 2021 23:22:01 +0100
Message-Id: <20211122222203.4103644-10-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:57 +0100
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/xilinx/xilinx_dpdma.c  | 17 +++++++++++------
 drivers/gpu/drm/xlnx/zynqmp_disp.c |  9 +++++++--
 include/linux/dma/xilinx_dpdma.h   | 11 +++++++++++
 3 files changed, 29 insertions(+), 8 deletions(-)
 create mode 100644 include/linux/dma/xilinx_dpdma.h

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index ce5c66e6897d..b0f4948b00a5 100644
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
@@ -1282,15 +1284,18 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
 	 * fixed both on the DPDMA side and on the DP controller side.
 	 */
 
-	spin_lock_irqsave(&chan->lock, flags);
-
 	/*
-	 * Abuse the slave_id to indicate that the channel is part of a video
-	 * group.
+	 * Use the peripheral_config to indicate that the channel is part
+	 * of a video group. This requires matching use of the custom
+	 * structure in each driver.
 	 */
-	if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
-		chan->video_group = config->slave_id != 0;
+	pconfig = config->peripheral_config;
+	if (WARN_ON(pconfig && config->peripheral_size != sizeof(*pconfig)))
+		return -EINVAL;
 
+	spin_lock_irqsave(&chan->lock, flags);
+	if (chan->id <= ZYNQMP_DPDMA_VIDEO2 && pconfig)
+		chan->video_group = pconfig->video_group;
 	spin_unlock_irqrestore(&chan->lock, flags);
 
 	return 0;
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
2.29.2

