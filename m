Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9AD378C68
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 14:44:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B3516AD;
	Mon, 10 May 2021 14:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B3516AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620650640;
	bh=dIDB/SxoNJuLi21uZhvIvfviMOdE+PTg+ElYL4iInOI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gKG11mEwVKsr2IiqbTD/1WnMfvS4hD+aCIa+FXu+AU4/ja3BHpizmm4TPGDX9QXzA
	 h6FPcefjno6ATn+LsM4048MUqrsRi6aTM86/8PZXK6QGNZfvkxyGCmJwzxI5smStFn
	 Bp6D7fo7T5h59XLP/XuLBgOXgqxRKaRpE/SIpMAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B8DAF804AA;
	Mon, 10 May 2021 14:41:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C4E2F8049C; Mon, 10 May 2021 14:41:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5814FF8026B
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 14:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5814FF8026B
IronPort-SDR: zsWKPqENDxdT+57QDXYkiRuLxf3/c163QS8xC4giEKewNbx7qKIMsOqLcvCgRc+kQSoWip0e8y
 osFHdHppkn9A==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="178772965"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="178772965"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 05:41:23 -0700
IronPort-SDR: 4E2lMnY46eJ+FL26nHHvnMJPoubWNMW9P2BnnIjHNn298f92ooHyv0qQ7M+kT25fYr9W6SAUo6
 +hSYSs9LDfdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="436125961"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 10 May 2021 05:41:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A9F301D2; Mon, 10 May 2021 15:41:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v3 08/14] spi: pxa2xx: Reuse int_error_stop() in
 pxa2xx_spi_slave_abort()
Date: Mon, 10 May 2021 15:41:28 +0300
Message-Id: <20210510124134.24638-9-andriy.shevchenko@linux.intel.com>
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

