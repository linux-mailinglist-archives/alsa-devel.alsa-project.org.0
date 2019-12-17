Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 389BE123873
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 22:11:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C300B166C;
	Tue, 17 Dec 2019 22:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C300B166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576617066;
	bh=nRomqNflZGCsGTbZAtXxA6RVDrFzcxizvBgWvpqEpB4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I5v/RU1DNF05LVJR+BsAq55xOwKEKQRJHV3L3Qu0BHD1kKdrmriQU0YrhGv9fBxtL
	 FZE2Ut9hWj6i7B/nOggvheOqybRurXJdtnEH/3XenRZQrDLaiPCXC7dPuLN7AwihVK
	 mGWtpzPsc4MK5GPYlTBwWYdysUyvQJmnSSpiQnTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ADB9F802E2;
	Tue, 17 Dec 2019 22:03:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6CB0F80279; Tue, 17 Dec 2019 22:03:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41371F80269
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 22:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41371F80269
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 13:03:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="240561006"
Received: from smcdonal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.83.42])
 by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2019 13:03:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 15:03:07 -0600
Message-Id: <20191217210314.20410-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v5 10/17] soundwire: register master device
	driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

While we don't have a matching function, setting an device driver is
still necessary for ASoC to register DAI components as well as power
management.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c      |  6 ++++++
 drivers/soundwire/intel_init.c | 10 ++++++++++
 drivers/soundwire/master.c     |  1 +
 include/linux/soundwire/sdw.h  |  1 +
 4 files changed, 18 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 36dbcbab0d65..29ebdb07e622 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -17,6 +17,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
+#include <linux/soundwire/sdw_type.h>
 #include "cadence_master.h"
 #include "bus.h"
 #include "intel.h"
@@ -1058,6 +1059,11 @@ static int intel_master_remove(struct sdw_master_device *md)
 }
 
 struct sdw_md_driver intel_sdw_driver = {
+	.driver = {
+		.name = "intel-sdw",
+		.owner = THIS_MODULE,
+		.bus = &sdw_bus_type,
+	},
 	.probe = intel_master_probe,
 	.startup = intel_master_startup,
 	.remove = intel_master_remove,
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 42f7ae034bea..a30d95ee71b7 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -146,6 +146,7 @@ static struct sdw_intel_ctx
 	struct sdw_master_device *md;
 	u32 link_mask;
 	int count;
+	int err;
 	int i;
 
 	if (!res)
@@ -176,6 +177,12 @@ static struct sdw_intel_ctx
 	link = ctx->links;
 	link_mask = ctx->link_mask;
 
+	err = driver_register(&intel_sdw_driver.driver);
+	if (err) {
+		dev_err(&adev->dev, "failed to register sdw master driver\n");
+		goto register_err;
+	}
+
 	/* Create SDW Master devices */
 	for (i = 0; i < count; i++, link++) {
 		if (link_mask && !(link_mask & BIT(i)))
@@ -209,6 +216,8 @@ static struct sdw_intel_ctx
 err:
 	sdw_intel_cleanup(ctx);
 link_err:
+	driver_unregister(&intel_sdw_driver.driver);
+register_err:
 	kfree(ctx);
 	return NULL;
 }
@@ -350,6 +359,7 @@ EXPORT_SYMBOL(sdw_intel_startup);
 void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 {
 	sdw_intel_cleanup(ctx);
+	driver_unregister(&intel_sdw_driver.driver);
 	kfree(ctx);
 }
 EXPORT_SYMBOL(sdw_intel_exit);
diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
index b018c561708e..1c6bb293468c 100644
--- a/drivers/soundwire/master.c
+++ b/drivers/soundwire/master.c
@@ -46,6 +46,7 @@ struct sdw_master_device *sdw_md_add(struct sdw_md_driver *driver,
 	md->dev.type = &sdw_md_type;
 	md->dev.dma_mask = md->dev.parent->dma_mask;
 	dev_set_name(&md->dev, "sdw-master-%d", md->link_id);
+	md->dev.driver = &driver->driver;
 
 	ret = device_register(&md->dev);
 	if (ret) {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f73c355de5e5..58f50257dfa8 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -630,6 +630,7 @@ struct sdw_md_driver {
 	int (*remove)(struct sdw_master_device *md);
 	int (*autonomous_clock_stop_enable)(struct sdw_master_device *md,
 					    bool state);
+	struct device_driver driver;
 };
 
 #define SDW_SLAVE_ENTRY(_mfg_id, _part_id, _drv_data) \
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
