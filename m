Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4336972B
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 18:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0734516B9;
	Fri, 23 Apr 2021 18:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0734516B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619195783;
	bh=QlF65tbkdapZHK1qr25I+mGXhmoeYojY5XioNhEH+u4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FPq6aA9lxWk4MvcD9bJJG2z1MjUIGLx66Hvsp+QoA4PxopOTgvrG3bsuRiBJjBD7B
	 ZGernUw/qffte185pfyBzIameFNAyFsqf2uximrUQvDS8620ADtkdwNflpAE4vgQlN
	 OVJHJHQs9QtVpe2Gn8Qaga00HCivWDm2LHJeXEvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 766AEF8032D;
	Fri, 23 Apr 2021 18:34:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACDE2F80256; Fri, 23 Apr 2021 18:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 026D0F800E3
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 18:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 026D0F800E3
IronPort-SDR: x2CLRifxoJI1kXJKMhoiGD9HaBgZabVG4AcwwdwR+1Ku3FU55j3XKgC0QRPzyotaZpQj8FG9xi
 1oyumEVbWT3A==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="195652407"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="195652407"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 09:34:39 -0700
IronPort-SDR: rpZLg5udqXrZcBqnpMpeR3lPdn7JWhpIoGW874AaSlOuNI2kJHFzAcUv/Z2M6uYD21DjXJRDW0
 d5hU2WgE3VlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="456284236"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 23 Apr 2021 09:34:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0401213C; Fri, 23 Apr 2021 19:34:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v1 02/14] spi: pxa2xx: Utilize MMIO and physical base from
 struct ssp_device
Date: Fri, 23 Apr 2021 19:34:25 +0300
Message-Id: <20210423163437.89306-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
References: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
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

We have a duplication of MMIO and physical base addresses in
the struct driver_data, get rid of it and reuse members from
struct ssp_device instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx-dma.c |  4 ++--
 drivers/spi/spi-pxa2xx.c     |  4 +---
 drivers/spi/spi-pxa2xx.h     | 14 ++++----------
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-dma.c b/drivers/spi/spi-pxa2xx-dma.c
index 37567bc7a523..3b27f356a18f 100644
--- a/drivers/spi/spi-pxa2xx-dma.c
+++ b/drivers/spi/spi-pxa2xx-dma.c
@@ -94,14 +94,14 @@ pxa2xx_spi_dma_prepare_one(struct driver_data *drv_data,
 	cfg.direction = dir;
 
 	if (dir == DMA_MEM_TO_DEV) {
-		cfg.dst_addr = drv_data->ssdr_physical;
+		cfg.dst_addr = drv_data->ssp->phys_base + SSDR;
 		cfg.dst_addr_width = width;
 		cfg.dst_maxburst = chip->dma_burst_size;
 
 		sgt = &xfer->tx_sg;
 		chan = drv_data->controller->dma_tx;
 	} else {
-		cfg.src_addr = drv_data->ssdr_physical;
+		cfg.src_addr = drv_data->ssp->phys_base + SSDR;
 		cfg.src_addr_width = width;
 		cfg.src_maxburst = chip->dma_burst_size;
 
diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 0ef22045b006..82df028c4a71 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -325,7 +325,7 @@ static void lpss_ssp_setup(struct driver_data *drv_data)
 	u32 value;
 
 	config = lpss_get_config(drv_data);
-	drv_data->lpss_base = drv_data->ioaddr + config->offset;
+	drv_data->lpss_base = drv_data->ssp->mmio_base + config->offset;
 
 	/* Enable software chip select control */
 	value = __lpss_ssp_read_priv(drv_data, config->reg_cs_ctrl);
@@ -1729,8 +1729,6 @@ static int pxa2xx_spi_probe(struct platform_device *pdev)
 
 	drv_data->ssp_type = ssp->type;
 
-	drv_data->ioaddr = ssp->mmio_base;
-	drv_data->ssdr_physical = ssp->phys_base + SSDR;
 	if (pxa25x_ssp_comp(drv_data)) {
 		switch (drv_data->ssp_type) {
 		case QUARK_X1000_SSP:
diff --git a/drivers/spi/spi-pxa2xx.h b/drivers/spi/spi-pxa2xx.h
index 1400472bc986..ad9980ebefa6 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -33,10 +33,6 @@ struct driver_data {
 	/* PXA hookup */
 	struct pxa2xx_spi_controller *controller_info;
 
-	/* SSP register addresses */
-	void __iomem *ioaddr;
-	phys_addr_t ssdr_physical;
-
 	/* SSP masks*/
 	u32 dma_cr1;
 	u32 int_cr1;
@@ -87,16 +83,14 @@ struct chip_data {
 	void (*cs_control)(u32 command);
 };
 
-static inline u32 pxa2xx_spi_read(const struct driver_data *drv_data,
-				  unsigned reg)
+static inline u32 pxa2xx_spi_read(const struct driver_data *drv_data, u32 reg)
 {
-	return __raw_readl(drv_data->ioaddr + reg);
+	return pxa_ssp_read_reg(drv_data->ssp, reg);
 }
 
-static  inline void pxa2xx_spi_write(const struct driver_data *drv_data,
-				     unsigned reg, u32 val)
+static inline void pxa2xx_spi_write(const struct driver_data *drv_data, u32 reg, u32 val)
 {
-	__raw_writel(val, drv_data->ioaddr + reg);
+	pxa_ssp_write_reg(drv_data->ssp, reg, val);
 }
 
 #define DMA_ALIGNMENT		8
-- 
2.30.2

