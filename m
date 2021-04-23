Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C75369737
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 18:38:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12FB516AF;
	Fri, 23 Apr 2021 18:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12FB516AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619195937;
	bh=a1kuP7pJyuVNwKbaVuU2zPH8wdOPw6VRz/YUhwzSLtU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+h0uq4BssOLa2qgnDi0iQJOV09qpbgUs2XbC+AzwiRapu1JZFGwk55pplFDn4M3m
	 in8kBwX+55Qh/9jgbgOG7KffrBaJgOj+QtzMCzx9IEsfCGWugl1eku74JXrWUfMTsc
	 Ntkbqz0whJRekGLCg9UZCLe4vo/2OQDGE/q/bvlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C46F804D9;
	Fri, 23 Apr 2021 18:35:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 142E3F804AF; Fri, 23 Apr 2021 18:35:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00403F802D2
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 18:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00403F802D2
IronPort-SDR: qrD0lNDdZQ8QoJ+vQVljnpxBn6TJSxZXcB03T5FaO95NWZc6QIFqNeYRo5d9HA+TZWWxAT1pJ1
 930K8i0raVaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="281424840"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="281424840"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 09:34:46 -0700
IronPort-SDR: 6xA0Mi8CKiWMRG1KFusnYfYvVd0Nn/aRW2ePEoUSML/Gts2GCVKhplyi1dpKECTZOjZ4ksZtLZ
 Mi2OGIt5NjzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="614764930"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2021 09:34:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 30C5B52A; Fri, 23 Apr 2021 19:34:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v1 10/14] spi: pxa2xx: Extract pxa2xx_spi_update() helper
Date: Fri, 23 Apr 2021 19:34:33 +0300
Message-Id: <20210423163437.89306-10-andriy.shevchenko@linux.intel.com>
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

There are few places that repeat the logic of "update if changed".
Extract pxa2xx_spi_update() helper to deduplicate that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index f85c7439757c..4b3237f14ead 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -200,6 +200,12 @@ static bool is_mmp2_ssp(const struct driver_data *drv_data)
 	return drv_data->ssp_type == MMP2_SSP;
 }
 
+static void pxa2xx_spi_update(const struct driver_data *drv_data, u32 reg, u32 mask, u32 value)
+{
+	if ((pxa2xx_spi_read(drv_data, reg) & mask) != value)
+		pxa2xx_spi_write(drv_data, reg, value & mask);
+}
+
 static u32 pxa2xx_spi_get_ssrc1_change_mask(const struct driver_data *drv_data)
 {
 	switch (drv_data->ssp_type) {
@@ -1081,19 +1087,12 @@ static int pxa2xx_spi_transfer_one(struct spi_controller *controller,
 			dma_mapped ? "DMA" : "PIO");
 
 	if (is_lpss_ssp(drv_data)) {
-		if ((pxa2xx_spi_read(drv_data, SSIRF) & 0xff)
-		    != chip->lpss_rx_threshold)
-			pxa2xx_spi_write(drv_data, SSIRF,
-					 chip->lpss_rx_threshold);
-		if ((pxa2xx_spi_read(drv_data, SSITF) & 0xffff)
-		    != chip->lpss_tx_threshold)
-			pxa2xx_spi_write(drv_data, SSITF,
-					 chip->lpss_tx_threshold);
+		pxa2xx_spi_update(drv_data, SSIRF, GENMASK(7, 0), chip->lpss_rx_threshold);
+		pxa2xx_spi_update(drv_data, SSITF, GENMASK(15, 0), chip->lpss_tx_threshold);
 	}
 
-	if (is_quark_x1000_ssp(drv_data) &&
-	    (pxa2xx_spi_read(drv_data, DDS_RATE) != chip->dds_rate))
-		pxa2xx_spi_write(drv_data, DDS_RATE, chip->dds_rate);
+	if (is_quark_x1000_ssp(drv_data))
+		pxa2xx_spi_update(drv_data, DDS_RATE, GENMASK(23, 0), chip->dds_rate);
 
 	/* Stop the SSP */
 	if (!is_mmp2_ssp(drv_data))
@@ -1102,15 +1101,11 @@ static int pxa2xx_spi_transfer_one(struct spi_controller *controller,
 	if (!pxa25x_ssp_comp(drv_data))
 		pxa2xx_spi_write(drv_data, SSTO, chip->timeout);
 
+	/* first set CR1 without interrupt and service enables */
+	pxa2xx_spi_update(drv_data, SSCR1, change_mask, cr1);
+
 	/* see if we need to reload the config registers */
-	if ((pxa2xx_spi_read(drv_data, SSCR0) != cr0)
-	    || (pxa2xx_spi_read(drv_data, SSCR1) & change_mask)
-	    != (cr1 & change_mask)) {
-		/* first set CR1 without interrupt and service enables */
-		pxa2xx_spi_write(drv_data, SSCR1, cr1 & change_mask);
-		/* Update the other bits */
-		pxa2xx_spi_write(drv_data, SSCR0, cr0);
-	}
+	pxa2xx_spi_update(drv_data, SSCR0, GENMASK(31, 0), cr0);
 
 	/* Restart the SSP */
 	pxa_ssp_enable(drv_data->ssp);
-- 
2.30.2

