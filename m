Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8D337A94F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F0671820;
	Tue, 11 May 2021 16:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F0671820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620743430;
	bh=dIDB/SxoNJuLi21uZhvIvfviMOdE+PTg+ElYL4iInOI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mht4RwuXBs1fyr6xbJ3LCmB/p70XquhNQwB7NBlzGPVhdLBRXDQ2nPzaBPymviy2G
	 n43RQzcmUHmpkBgk5q/wemEnCNQdjHIq6ahg7mgeYF7mCcZ95LE6Hw7useZ9fQzUJc
	 kBvyVSrm4MIy2qHnRiMBJsK9YnY32ESYy8aSq3Os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0884DF804BD;
	Tue, 11 May 2021 16:27:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF569F8049C; Tue, 11 May 2021 16:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A7AFF80156
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A7AFF80156
IronPort-SDR: 6PGZZ8WHezE45W2aVkv7WZgxBd9b1ZrYUFvU5+hE8ieH2NYZmwYebpLwufcCMsVgxSon5lgoQe
 xdFxtXQ0huAg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199506761"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="199506761"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:26:55 -0700
IronPort-SDR: VtRMk9mb/eLdHUBpstMBpeTTdy6MWP3kHaZZM10wqx52X4yB4fdQYKAP3dXyReOzKpidIzsYJa
 8OZVrXI8XJjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="609507425"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 11 May 2021 07:26:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E9A08338; Tue, 11 May 2021 17:27:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v4 2/8] spi: pxa2xx: Reuse int_error_stop() in
 pxa2xx_spi_slave_abort()
Date: Tue, 11 May 2021 17:27:05 +0300
Message-Id: <20210511142711.23244-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511142711.23244-1-andriy.shevchenko@linux.intel.com>
References: <20210511142711.23244-1-andriy.shevchenko@linux.intel.com>
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

It appears that pxa2xx_spi_slave_abort()almost  repeats the functionality
of the int_error_stop(). Reuse int_error_stop() in pxa2xx_spi_slave_abort().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 5572eec68381..087c84e605b9 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -631,7 +631,7 @@ static void int_stop_and_reset(struct driver_data *drv_data)
 	pxa2xx_spi_write(drv_data, SSTO, 0);
 }
 
-static void int_error_stop(struct driver_data *drv_data, const char *msg)
+static void int_error_stop(struct driver_data *drv_data, const char *msg, int err)
 {
 	int_stop_and_reset(drv_data);
 	pxa2xx_spi_flush(drv_data);
@@ -639,7 +639,7 @@ static void int_error_stop(struct driver_data *drv_data, const char *msg)
 
 	dev_err(drv_data->ssp->dev, "%s\n", msg);
 
-	drv_data->controller->cur_msg->status = -EIO;
+	drv_data->controller->cur_msg->status = err;
 	spi_finalize_current_transfer(drv_data->controller);
 }
 
@@ -658,12 +658,12 @@ static irqreturn_t interrupt_transfer(struct driver_data *drv_data)
 	u32 irq_status = pxa2xx_spi_read(drv_data, SSSR) & irq_mask;
 
 	if (irq_status & SSSR_ROR) {
-		int_error_stop(drv_data, "interrupt_transfer: fifo overrun");
+		int_error_stop(drv_data, "interrupt_transfer: fifo overrun", -EIO);
 		return IRQ_HANDLED;
 	}
 
 	if (irq_status & SSSR_TUR) {
-		int_error_stop(drv_data, "interrupt_transfer: fifo underrun");
+		int_error_stop(drv_data, "interrupt_transfer: fifo underrun", -EIO);
 		return IRQ_HANDLED;
 	}
 
@@ -1154,14 +1154,7 @@ static int pxa2xx_spi_slave_abort(struct spi_controller *controller)
 {
 	struct driver_data *drv_data = spi_controller_get_devdata(controller);
 
-	int_stop_and_reset(drv_data);
-	pxa2xx_spi_flush(drv_data);
-	pxa2xx_spi_off(drv_data);
-
-	dev_dbg(drv_data->ssp->dev, "transfer aborted\n");
-
-	drv_data->controller->cur_msg->status = -EINTR;
-	spi_finalize_current_transfer(drv_data->controller);
+	int_error_stop(drv_data, "transfer aborted", -EINTR);
 
 	return 0;
 }
-- 
2.30.2

