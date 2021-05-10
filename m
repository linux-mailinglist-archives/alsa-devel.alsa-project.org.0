Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D64C378C71
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 14:46:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93A9816B0;
	Mon, 10 May 2021 14:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93A9816B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620650778;
	bh=oWVrVC/HN+OqrsnMF3sTBubPFhVqrcICWUaVkmRG4gA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nu/E/QAMjQc5YdlOJIy6OYz8am741BXj5yNjVd6APFwhPCQ386AXin1apSEYYWXPI
	 rudDkaHIez3Qry7tAqntaH8pM2qe//lZZLhy1XwE4+KxIsXRA042SYF/I/3lEG7Aen
	 K32Q4eAL6IV0L3mq+X4Cm9/jEzeZaQOJ2XhkvnBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 326F8F804E5;
	Mon, 10 May 2021 14:41:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DD45F804B2; Mon, 10 May 2021 14:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38ED3F80430
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 14:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38ED3F80430
IronPort-SDR: dK03XN/CD5cbEEaBQyPFT8xxJLM9+LqeEq2RYjgnWrQi1A+uPqSzQLPfSbxjZa3AI16nr6r4t4
 lPXBDFRkdLRg==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="284668270"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="284668270"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 05:41:23 -0700
IronPort-SDR: LGtyGDLOHqcEqXPbZHKArp6Ufc1zaTRThoJ4GQlw0n8oj4eI3abNs25FnMeC40pnWicx6LRo/G
 KFSw8jYjdgQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="433796219"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 10 May 2021 05:41:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id BCE025A3; Mon, 10 May 2021 15:41:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v3 09/14] spi: pxa2xx: Use pxa_ssp_enable()/pxa_ssp_disable()
 in the driver
Date: Mon, 10 May 2021 15:41:29 +0300
Message-Id: <20210510124134.24638-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510124134.24638-1-andriy.shevchenko@linux.intel.com>
References: <20210510124134.24638-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

There are few places that repeat the logic of pxa_ssp_enable() and
pxa_ssp_disable(). Use them instead of open coded variants.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx-dma.c |  4 +---
 drivers/spi/spi-pxa2xx.c     | 36 ++++++++++++++++++------------------
 include/linux/pxa2xx_ssp.h   | 16 ++++++++++++++++
 sound/soc/pxa/pxa-ssp.c      | 16 ----------------
 4 files changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-dma.c b/drivers/spi/spi-pxa2xx-dma.c
index e00dbadd39ec..5ca01ad7f460 100644
--- a/drivers/spi/spi-pxa2xx-dma.c
+++ b/drivers/spi/spi-pxa2xx-dma.c
@@ -50,9 +50,7 @@ static void pxa2xx_spi_dma_transfer_complete(struct driver_data *drv_data,
 
 		if (error) {
 			/* In case we got an error we disable the SSP now */
-			pxa2xx_spi_write(drv_data, SSCR0,
-					 pxa2xx_spi_read(drv_data, SSCR0)
-					 & ~SSCR0_SSE);
+			pxa_ssp_disable(drv_data->ssp);
 			msg->status = -EIO;
 		}
 
diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 087c84e605b9..a27f51f5db65 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -286,13 +286,11 @@ static u32 pxa2xx_configure_sscr0(const struct driver_data *drv_data,
 	case QUARK_X1000_SSP:
 		return clk_div
 			| QUARK_X1000_SSCR0_Motorola
-			| QUARK_X1000_SSCR0_DataSize(bits > 32 ? 8 : bits)
-			| SSCR0_SSE;
+			| QUARK_X1000_SSCR0_DataSize(bits > 32 ? 8 : bits);
 	default:
 		return clk_div
 			| SSCR0_Motorola
 			| SSCR0_DataSize(bits > 16 ? bits - 16 : bits)
-			| SSCR0_SSE
 			| (bits > 16 ? SSCR0_EDSS : 0);
 	}
 }
@@ -498,8 +496,7 @@ static void pxa2xx_spi_off(struct driver_data *drv_data)
 	if (is_mmp2_ssp(drv_data))
 		return;
 
-	pxa2xx_spi_write(drv_data, SSCR0,
-			 pxa2xx_spi_read(drv_data, SSCR0) & ~SSCR0_SSE);
+	pxa_ssp_disable(drv_data->ssp);
 }
 
 static int null_writer(struct driver_data *drv_data)
@@ -1098,25 +1095,26 @@ static int pxa2xx_spi_transfer_one(struct spi_controller *controller,
 	    (pxa2xx_spi_read(drv_data, DDS_RATE) != chip->dds_rate))
 		pxa2xx_spi_write(drv_data, DDS_RATE, chip->dds_rate);
 
+	/* Stop the SSP */
+	if (!is_mmp2_ssp(drv_data))
+		pxa_ssp_disable(drv_data->ssp);
+
+	if (!pxa25x_ssp_comp(drv_data))
+		pxa2xx_spi_write(drv_data, SSTO, chip->timeout);
+
 	/* see if we need to reload the config registers */
 	if ((pxa2xx_spi_read(drv_data, SSCR0) != cr0)
 	    || (pxa2xx_spi_read(drv_data, SSCR1) & change_mask)
 	    != (cr1 & change_mask)) {
-		/* stop the SSP, and update the other bits */
-		if (!is_mmp2_ssp(drv_data))
-			pxa2xx_spi_write(drv_data, SSCR0, cr0 & ~SSCR0_SSE);
-		if (!pxa25x_ssp_comp(drv_data))
-			pxa2xx_spi_write(drv_data, SSTO, chip->timeout);
 		/* first set CR1 without interrupt and service enables */
 		pxa2xx_spi_write(drv_data, SSCR1, cr1 & change_mask);
-		/* restart the SSP */
+		/* Update the other bits */
 		pxa2xx_spi_write(drv_data, SSCR0, cr0);
-
-	} else {
-		if (!pxa25x_ssp_comp(drv_data))
-			pxa2xx_spi_write(drv_data, SSTO, chip->timeout);
 	}
 
+	/* Restart the SSP */
+	pxa_ssp_enable(drv_data->ssp);
+
 	if (is_mmp2_ssp(drv_data)) {
 		u8 tx_level = (pxa2xx_spi_read(drv_data, SSSR)
 					& SSSR_TFL_MASK) >> 8;
@@ -1786,8 +1784,9 @@ static int pxa2xx_spi_probe(struct platform_device *pdev)
 		controller->min_speed_hz =
 			DIV_ROUND_UP(controller->max_speed_hz, 512);
 
+	pxa_ssp_disable(ssp);
+
 	/* Load default SSP configuration */
-	pxa2xx_spi_write(drv_data, SSCR0, 0);
 	switch (drv_data->ssp_type) {
 	case QUARK_X1000_SSP:
 		tmp = QUARK_X1000_SSCR1_RxTresh(RX_THRESH_QUARK_X1000_DFLT) |
@@ -1928,7 +1927,7 @@ static int pxa2xx_spi_remove(struct platform_device *pdev)
 	spi_unregister_controller(drv_data->controller);
 
 	/* Disable the SSP at the peripheral and SOC level */
-	pxa2xx_spi_write(drv_data, SSCR0, 0);
+	pxa_ssp_disable(ssp);
 	clk_disable_unprepare(ssp->clk);
 
 	/* Release DMA */
@@ -1957,7 +1956,8 @@ static int pxa2xx_spi_suspend(struct device *dev)
 	status = spi_controller_suspend(drv_data->controller);
 	if (status != 0)
 		return status;
-	pxa2xx_spi_write(drv_data, SSCR0, 0);
+
+	pxa_ssp_disable(ssp);
 
 	if (!pm_runtime_suspended(dev))
 		clk_disable_unprepare(ssp->clk);
diff --git a/include/linux/pxa2xx_ssp.h b/include/linux/pxa2xx_ssp.h
index 1b6c1a0922bd..fdfbe17e15f4 100644
--- a/include/linux/pxa2xx_ssp.h
+++ b/include/linux/pxa2xx_ssp.h
@@ -254,6 +254,22 @@ static inline u32 pxa_ssp_read_reg(struct ssp_device *dev, u32 reg)
 	return __raw_readl(dev->mmio_base + reg);
 }
 
+static inline void pxa_ssp_enable(struct ssp_device *ssp)
+{
+	u32 sscr0;
+
+	sscr0 = pxa_ssp_read_reg(ssp, SSCR0) | SSCR0_SSE;
+	pxa_ssp_write_reg(ssp, SSCR0, sscr0);
+}
+
+static inline void pxa_ssp_disable(struct ssp_device *ssp)
+{
+	u32 sscr0;
+
+	sscr0 = pxa_ssp_read_reg(ssp, SSCR0) & ~SSCR0_SSE;
+	pxa_ssp_write_reg(ssp, SSCR0, sscr0);
+}
+
 #if IS_ENABLED(CONFIG_PXA_SSP)
 struct ssp_device *pxa_ssp_request(int port, const char *label);
 void pxa_ssp_free(struct ssp_device *);
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index b941adcbb8f9..939e7e28486a 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -61,22 +61,6 @@ static void dump_registers(struct ssp_device *ssp)
 		 pxa_ssp_read_reg(ssp, SSACD));
 }
 
-static void pxa_ssp_enable(struct ssp_device *ssp)
-{
-	uint32_t sscr0;
-
-	sscr0 = __raw_readl(ssp->mmio_base + SSCR0) | SSCR0_SSE;
-	__raw_writel(sscr0, ssp->mmio_base + SSCR0);
-}
-
-static void pxa_ssp_disable(struct ssp_device *ssp)
-{
-	uint32_t sscr0;
-
-	sscr0 = __raw_readl(ssp->mmio_base + SSCR0) & ~SSCR0_SSE;
-	__raw_writel(sscr0, ssp->mmio_base + SSCR0);
-}
-
 static void pxa_ssp_set_dma_params(struct ssp_device *ssp, int width4,
 			int out, struct snd_dmaengine_dai_dma_data *dma)
 {
-- 
2.30.2

