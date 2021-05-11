Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C737A8F5
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:19:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98D417EC;
	Tue, 11 May 2021 16:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98D417EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620742796;
	bh=QTyNMggU3h2YT7Pbjzukoj3jT+es/jl2/wJVaIwp6jE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AwkmUNQfwTgTm5sIeSYlmCCYVPyeI7BBejDY18f6xHNjM9GlLeoi5GeDHXDbOTt+4
	 nDpkXvHFXgnn+pZUwKZWb9JlJ4N7HvBeXbEvBcSI66lS6qVCMBh7Wo3VKtXlKAxGoa
	 qbFm7dWL6WWfffWnPRw4reA6QuiuifulltzUuZFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9069BF804AC;
	Tue, 11 May 2021 16:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 382B1F804AA; Tue, 11 May 2021 16:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41084F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41084F800E9
IronPort-SDR: KA74kPjha/g/TxhePg2k+2ldIMqxMwBRc9SsLqi1DdKsSCem14DIZg7bpe/6r+ypPlH26LetAR
 QuiwgKSAelag==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="196357518"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196357518"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:17:10 -0700
IronPort-SDR: sMTBIb3UrfRSQTkkHtDsfXe51LMmb48wvkl4bfyOyhDfveDi3YwAl1tAqrPJBG1QCBQk31LH4U
 YBeBMQaF6GGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="621829411"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 11 May 2021 07:17:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 75D003F6; Tue, 11 May 2021 17:17:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v3 4/8] spi: pxa2xx: Extract clear_SSCR1_bits() helper
Date: Tue, 11 May 2021 17:17:21 +0300
Message-Id: <20210511141725.32097-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511141725.32097-1-andriy.shevchenko@linux.intel.com>
References: <20210511141725.32097-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
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

There are few places that repeat the logic of "clear some bits in SSCR1".
Extract clear_SSCR1_bits() helper to deduplicate that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx-dma.c | 4 +---
 drivers/spi/spi-pxa2xx.c     | 7 ++-----
 drivers/spi/spi-pxa2xx.h     | 5 +++++
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-dma.c b/drivers/spi/spi-pxa2xx-dma.c
index 5ca01ad7f460..e581027e99f9 100644
--- a/drivers/spi/spi-pxa2xx-dma.c
+++ b/drivers/spi/spi-pxa2xx-dma.c
@@ -41,9 +41,7 @@ static void pxa2xx_spi_dma_transfer_complete(struct driver_data *drv_data,
 		}
 
 		/* Clear status & disable interrupts */
-		pxa2xx_spi_write(drv_data, SSCR1,
-				 pxa2xx_spi_read(drv_data, SSCR1)
-				 & ~drv_data->dma_cr1);
+		clear_SSCR1_bits(drv_data, drv_data->dma_cr1);
 		write_SSSR_CS(drv_data, drv_data->clear_sr);
 		if (!pxa25x_ssp_comp(drv_data))
 			pxa2xx_spi_write(drv_data, SSTO, 0);
diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 54eaa048651f..3a4ad16614f7 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -733,8 +733,7 @@ static irqreturn_t interrupt_transfer(struct driver_data *drv_data)
 static void handle_bad_msg(struct driver_data *drv_data)
 {
 	pxa2xx_spi_off(drv_data);
-	pxa2xx_spi_write(drv_data, SSCR1,
-			 pxa2xx_spi_read(drv_data, SSCR1) & ~drv_data->int_cr1);
+	clear_SSCR1_bits(drv_data, drv_data->int_cr1);
 	if (!pxa25x_ssp_comp(drv_data))
 		pxa2xx_spi_write(drv_data, SSTO, 0);
 	write_SSSR_CS(drv_data, drv_data->clear_sr);
@@ -1161,9 +1160,7 @@ static void pxa2xx_spi_handle_err(struct spi_controller *controller,
 	pxa2xx_spi_off(drv_data);
 	/* Clear and disable interrupts and service requests */
 	write_SSSR_CS(drv_data, drv_data->clear_sr);
-	pxa2xx_spi_write(drv_data, SSCR1,
-			 pxa2xx_spi_read(drv_data, SSCR1)
-			 & ~(drv_data->int_cr1 | drv_data->dma_cr1));
+	clear_SSCR1_bits(drv_data, drv_data->int_cr1 | drv_data->dma_cr1);
 	if (!pxa25x_ssp_comp(drv_data))
 		pxa2xx_spi_write(drv_data, SSTO, 0);
 
diff --git a/drivers/spi/spi-pxa2xx.h b/drivers/spi/spi-pxa2xx.h
index 739e264feaa6..ed63f7165cd8 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -105,6 +105,11 @@ static inline int pxa25x_ssp_comp(struct driver_data *drv_data)
 	}
 }
 
+static inline void clear_SSCR1_bits(const struct driver_data *drv_data, u32 bits)
+{
+	pxa2xx_spi_write(drv_data, SSCR1, pxa2xx_spi_read(drv_data, SSCR1) & ~bits);
+}
+
 static inline void write_SSSR_CS(struct driver_data *drv_data, u32 val)
 {
 	if (drv_data->ssp_type == CE4100_SSP ||
-- 
2.30.2

