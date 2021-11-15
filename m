Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D204500C4
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 10:01:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78D2E16BD;
	Mon, 15 Nov 2021 10:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78D2E16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636966916;
	bh=t+sujmlGUVrYtWCA2Iqgm4qzwcVm4cE+7MUCYHiTmt8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ny4skhAkHH12PpJfW8vxZxhcncLf84Yt1cZAlklI/EJ9bnucPq+exEZF+Pof5SnI8
	 umjeEeGLbeDdFxv1fp+0TVPY4oaZOQKhSEQru2PxHJJCQBmWcx0Tc+ImbSWPXUhHWx
	 aTnWUWowHnoWAHCkCH7ovicb1lX20L1kXwEx1dCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76902F8052D;
	Mon, 15 Nov 2021 09:57:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF4D1F8027D; Mon, 15 Nov 2021 09:56:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80DB4F80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 09:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80DB4F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E3hAwHAF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97B2063227;
 Mon, 15 Nov 2021 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966551;
 bh=t+sujmlGUVrYtWCA2Iqgm4qzwcVm4cE+7MUCYHiTmt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E3hAwHAFBi1veWTZ9KC3LUqplVBzvhHkJdmHwzLmUaxHGxHQt/Uao9jUuL7+wYtM1
 t5/KCd2DhDnIMvpS1fzLHld+q6AChRUElQMbmbJgDaTpHm5vW1Uyudi7cSpoV3wALW
 3+TEcRqIWccqr7FIxw+On4njyPKMPuD/VUQ+uBZMxLJI2xjFiVqAFgV6Ym1M8MXblp
 H3AtGfulWPCW1XQE3Nvr6vFEwAXxjhfbUBy3AmIdd5/EjenYc84yhK4dgbFVtzWJe/
 uGxVZ0BY9bYvtABbO19Hw4xqxf+bkbhZDmO0g57I7eSW+8dnN8ZNhH3IrlxeCNnqJt
 h19+P/ZGx52Ig==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 10/11] staging: ralink-gdma: stop using slave_id config
Date: Mon, 15 Nov 2021 09:54:02 +0100
Message-Id: <20211115085403.360194-11-arnd@kernel.org>
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

Picking the connection between a DMA controller and its attached device
is done through devicetree using the "dmas" property, which is implemented
by the gdma driver, but it also allows overriding the "req" configuration
with the slave_id field, as it was done in some linux-2.6 era drivers.

There is no driver in the tree that sets these values, so stop
interpreting them before anything accidentally starts relying on it.
Rename the field in the channel from "slave_id" to "req" to better match
the purpose and the naming in the hardware.

If any driver actually starts using this DMA engine, it may be necessary
to implement a .xlate callback that sets this field at probe time.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/ralink-gdma/ralink-gdma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
index b5229bc6eae5..f00240e62e1b 100644
--- a/drivers/staging/ralink-gdma/ralink-gdma.c
+++ b/drivers/staging/ralink-gdma/ralink-gdma.c
@@ -106,7 +106,7 @@ struct gdma_dma_desc {
 struct gdma_dmaengine_chan {
 	struct virt_dma_chan vchan;
 	unsigned int id;
-	unsigned int slave_id;
+	unsigned int req;
 
 	dma_addr_t fifo_addr;
 	enum gdma_dma_transfer_size burst_size;
@@ -194,7 +194,6 @@ static int gdma_dma_config(struct dma_chan *c,
 			dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
 			return -EINVAL;
 		}
-		chan->slave_id = config->slave_id;
 		chan->fifo_addr = config->dst_addr;
 		chan->burst_size = gdma_dma_maxburst(config->dst_maxburst);
 		break;
@@ -203,7 +202,6 @@ static int gdma_dma_config(struct dma_chan *c,
 			dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
 			return -EINVAL;
 		}
-		chan->slave_id = config->slave_id;
 		chan->fifo_addr = config->src_addr;
 		chan->burst_size = gdma_dma_maxburst(config->src_maxburst);
 		break;
@@ -288,12 +286,12 @@ static int rt305x_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
 		dst_addr = chan->fifo_addr;
 		ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED |
 			(8 << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
-			(chan->slave_id << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
+			(chan->req << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
 	} else if (chan->desc->direction == DMA_DEV_TO_MEM) {
 		src_addr = chan->fifo_addr;
 		dst_addr = sg->dst_addr;
 		ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED |
-			(chan->slave_id << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
+			(chan->req << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
 			(8 << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
 	} else if (chan->desc->direction == DMA_MEM_TO_MEM) {
 		/*
@@ -365,12 +363,12 @@ static int rt3883_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
 		dst_addr = chan->fifo_addr;
 		ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED;
 		ctrl1 = (32 << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
-			(chan->slave_id << GDMA_REG_CTRL1_DST_REQ_SHIFT);
+			(chan->req << GDMA_REG_CTRL1_DST_REQ_SHIFT);
 	} else if (chan->desc->direction == DMA_DEV_TO_MEM) {
 		src_addr = chan->fifo_addr;
 		dst_addr = sg->dst_addr;
 		ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED;
-		ctrl1 = (chan->slave_id << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
+		ctrl1 = (chan->req << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
 			(32 << GDMA_REG_CTRL1_DST_REQ_SHIFT) |
 			GDMA_REG_CTRL1_COHERENT;
 	} else if (chan->desc->direction == DMA_MEM_TO_MEM) {
-- 
2.30.2

