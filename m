Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668CEE2566
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 23:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C1611682;
	Wed, 23 Oct 2019 23:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C1611682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571866337;
	bh=ZXSF/1Ta2HM61IjXtNqR7CUKufsi8YX5YmDrKKjqZi8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HkpWhqo2Nknn56wqLDop/I/tJ5J8iyWoW3CQqkrcXsbokI9aXtM09mwpxO1WJG43k
	 U4SD/zvpwt5M1/FfP/lk5jeFj5iKdYANPwX9WtCRj4MlluCQCt0pNWHsl3KFtV3GGM
	 oTQ6LcF+bBZW4QwJavlbFs+EhZzMQEgjrQXWX7Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69916F80612;
	Wed, 23 Oct 2019 23:28:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6919FF805FA; Wed, 23 Oct 2019 23:28:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AD05F80393
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 23:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD05F80393
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 14:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="399541168"
Received: from ayamada-mobl1.gar.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.95.208])
 by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2019 14:28:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 23 Oct 2019 16:28:12 -0500
Message-Id: <20191023212823.608-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 03/14] soundwire: rename
	drv_to_sdw_slave_driver macro
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

Align with previous renames and shorten macro

No functionality change

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus_type.c       | 9 ++++-----
 include/linux/soundwire/sdw_type.h | 3 ++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index c0585bcc8a41..2b2830b622fa 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -34,7 +34,7 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
 static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
 {
 	struct sdw_slave *slave = to_sdw_slave_device(dev);
-	struct sdw_driver *drv = drv_to_sdw_slave_driver(ddrv);
+	struct sdw_driver *drv = to_sdw_slave_driver(ddrv);
 
 	return !!sdw_get_device_id(slave, drv);
 }
@@ -70,7 +70,7 @@ EXPORT_SYMBOL_GPL(sdw_bus_type);
 static int sdw_drv_probe(struct device *dev)
 {
 	struct sdw_slave *slave = to_sdw_slave_device(dev);
-	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
+	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
 	const struct sdw_device_id *id;
 	int ret;
 
@@ -116,8 +116,7 @@ static int sdw_drv_probe(struct device *dev)
 static int sdw_drv_remove(struct device *dev)
 {
 	struct sdw_slave *slave = to_sdw_slave_device(dev);
-	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
-
+	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
 	int ret = 0;
 
 	if (drv->remove)
@@ -131,7 +130,7 @@ static int sdw_drv_remove(struct device *dev)
 static void sdw_drv_shutdown(struct device *dev)
 {
 	struct sdw_slave *slave = to_sdw_slave_device(dev);
-	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
+	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
 
 	if (drv->shutdown)
 		drv->shutdown(slave);
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index abaa21278152..7d4bc6a979bf 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -6,7 +6,7 @@
 
 extern struct bus_type sdw_bus_type;
 
-#define drv_to_sdw_slave_driver(_drv) \
+#define to_sdw_slave_driver(_drv) \
 	container_of(_drv, struct sdw_driver, driver)
 
 #define sdw_register_slave_driver(drv) \
@@ -29,4 +29,5 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 #define module_sdw_driver(__sdw_slave_driver) \
 	module_driver(__sdw_slave_driver, sdw_register_slave_driver, \
 			sdw_unregister_slave_driver)
+
 #endif /* __SOUNDWIRE_TYPES_H */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
