Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 516BC378C77
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 14:48:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D484316B0;
	Mon, 10 May 2021 14:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D484316B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620650888;
	bh=dYxD+g6pdehKO/yDd4jsuihE3hQGnlILBNiWE904W3I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wcgxdh0WRoW5xOIpJ7dA0flQw3QwTQdBIUvxS2sS2xxagSAUChuv3XBArfGGlKTc6
	 DMmUVHQCnrvyB6uaH1ji+KzzZ/K8LhVBGKX0eoWUrC12DOtuUfa/zpL2i95d7rhD0T
	 V296XiVCO5jTUwvtR4Xoc/6Mt8k4TDUaxF4shULo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43EFFF8051D;
	Mon, 10 May 2021 14:41:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C2ECF804E4; Mon, 10 May 2021 14:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EEF3F804BD
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 14:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EEF3F804BD
IronPort-SDR: UeJvW+7SBR/y3OQWG78voYvbjviz7US7nLtXJUIFLc0JzMqD+QdP+VrFyPV8tznefmkq/GTa9a
 qIvNoeHbcp2g==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="198860857"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="198860857"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 05:41:33 -0700
IronPort-SDR: ZcVxuHri2dD4ciwWI4oWdRZ7p/+LckV0YaOYmYBVU3dzIZcxj8jwlpQ+rXJPkEaSd4kltz9+vn
 CRqglLRb94rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="470783524"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2021 05:41:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 01B99836; Mon, 10 May 2021 15:41:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v3 14/14] spi: pxa2xx: Introduce special type for Merrifield
 SPIs
Date: Mon, 10 May 2021 15:41:34 +0300
Message-Id: <20210510124134.24638-15-andriy.shevchenko@linux.intel.com>
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

Intel Merrifield SPI is actually more closer to PXA3xx. It has extended FIFO
(32 bytes) and additional registers to get or set FIFO thresholds.

Introduce new type for Intel Merrifield SPI host controllers and handle bigger
FIFO size.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx-pci.c |  2 +-
 drivers/spi/spi-pxa2xx.c     | 32 +++++++++++++++++++++++++++++---
 include/linux/pxa2xx_ssp.h   | 16 ++++++++++++++++
 3 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index a259be12d326..dce9ade9a4df 100644
--- a/drivers/spi/spi-pxa2xx-pci.c
+++ b/drivers/spi/spi-pxa2xx-pci.c
@@ -179,7 +179,7 @@ static struct pxa_spi_info spi_info_configs[] = {
 		.rx_param = &bsw2_rx_param,
 	},
 	[PORT_MRFLD] = {
-		.type = PXA27x_SSP,
+		.type = MRFLD_SSP,
 		.max_clk_rate = 25000000,
 		.setup = mrfld_spi_setup,
 	},
diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index af3f01de8f5b..5985b39e2dd6 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -200,6 +200,11 @@ static bool is_mmp2_ssp(const struct driver_data *drv_data)
 	return drv_data->ssp_type == MMP2_SSP;
 }
 
+static bool is_mrfld_ssp(const struct driver_data *drv_data)
+{
+	return drv_data->ssp_type == MRFLD_SSP;
+}
+
 static void pxa2xx_spi_update(const struct driver_data *drv_data, u32 reg, u32 mask, u32 value)
 {
 	if ((pxa2xx_spi_read(drv_data, reg) & mask) != value)
@@ -1087,6 +1092,15 @@ static int pxa2xx_spi_transfer_one(struct spi_controller *controller,
 		pxa2xx_spi_update(drv_data, SSITF, GENMASK(15, 0), chip->lpss_tx_threshold);
 	}
 
+	if (is_mrfld_ssp(drv_data)) {
+		u32 thresh = 0;
+
+		thresh |= SFIFOTT_RxThresh(chip->lpss_rx_threshold);
+		thresh |= SFIFOTT_TxThresh(chip->lpss_tx_threshold);
+
+		pxa2xx_spi_update(drv_data, SFIFOTT, 0xffffffff, thresh);
+	}
+
 	if (is_quark_x1000_ssp(drv_data))
 		pxa2xx_spi_update(drv_data, DDS_RATE, GENMASK(23, 0), chip->dds_rate);
 
@@ -1253,6 +1267,11 @@ static int setup(struct spi_device *spi)
 		tx_hi_thres = 0;
 		rx_thres = RX_THRESH_QUARK_X1000_DFLT;
 		break;
+	case MRFLD_SSP:
+		tx_thres = TX_THRESH_MRFLD_DFLT;
+		tx_hi_thres = 0;
+		rx_thres = RX_THRESH_MRFLD_DFLT;
+		break;
 	case CE4100_SSP:
 		tx_thres = TX_THRESH_CE4100_DFLT;
 		tx_hi_thres = 0;
@@ -1328,9 +1347,16 @@ static int setup(struct spi_device *spi)
 		chip->cr1 |= SSCR1_SPH;
 	}
 
-	chip->lpss_rx_threshold = SSIRF_RxThresh(rx_thres);
-	chip->lpss_tx_threshold = SSITF_TxLoThresh(tx_thres)
-				| SSITF_TxHiThresh(tx_hi_thres);
+	if (is_lpss_ssp(drv_data)) {
+		chip->lpss_rx_threshold = SSIRF_RxThresh(rx_thres);
+		chip->lpss_tx_threshold = SSITF_TxLoThresh(tx_thres) |
+					  SSITF_TxHiThresh(tx_hi_thres);
+	}
+
+	if (is_mrfld_ssp(drv_data)) {
+		chip->lpss_rx_threshold = rx_thres;
+		chip->lpss_tx_threshold = tx_thres;
+	}
 
 	/* set dma burst and threshold outside of chip_info path so that if
 	 * chip_info goes away after setting chip->enable_dma, the
diff --git a/include/linux/pxa2xx_ssp.h b/include/linux/pxa2xx_ssp.h
index fdfbe17e15f4..2b21bc1f3c73 100644
--- a/include/linux/pxa2xx_ssp.h
+++ b/include/linux/pxa2xx_ssp.h
@@ -183,6 +183,21 @@ struct device_node;
 #define SSACD_ACPS(x)		((x) << 4)	/* Audio clock PLL select */
 #define SSACD_SCDX8		BIT(7)		/* SYSCLK division ratio select */
 
+/* Intel Merrifield SSP */
+#define SFIFOL			0x68		/* FIFO level */
+#define SFIFOTT			0x6c		/* FIFO trigger threshold */
+
+#define RX_THRESH_MRFLD_DFLT	16
+#define TX_THRESH_MRFLD_DFLT	16
+
+#define SFIFOL_TFL_MASK		GENMASK(15, 0)	/* Transmit FIFO Level mask */
+#define SFIFOL_RFL_MASK		GENMASK(31, 16)	/* Receive FIFO Level mask */
+
+#define SFIFOTT_TFT		GENMASK(15, 0)	/* Transmit FIFO Threshold (mask) */
+#define SFIFOTT_TxThresh(x)	(((x) - 1) << 0)	/* TX FIFO trigger threshold / level */
+#define SFIFOTT_RFT		GENMASK(31, 16)	/* Receive FIFO Threshold (mask) */
+#define SFIFOTT_RxThresh(x)	(((x) - 1) << 16)	/* RX FIFO trigger threshold / level */
+
 /* LPSS SSP */
 #define SSITF			0x44		/* TX FIFO trigger level */
 #define SSITF_TxHiThresh(x)	(((x) - 1) << 0)
@@ -205,6 +220,7 @@ enum pxa_ssp_type {
 	MMP2_SSP,
 	PXA910_SSP,
 	CE4100_SSP,
+	MRFLD_SSP,
 	QUARK_X1000_SSP,
 	LPSS_LPT_SSP, /* Keep LPSS types sorted with lpss_platforms[] */
 	LPSS_BYT_SSP,
-- 
2.30.2

