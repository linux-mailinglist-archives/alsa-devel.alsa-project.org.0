Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0486011DD68
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 06:07:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF5D173E;
	Fri, 13 Dec 2019 06:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF5D173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576213619;
	bh=HKRoaWFmGzauR/dO86EhCocIQVIUBL2Rjh3HiYirD7M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OiqRgVSxr3SDdA+vrLOyfBHzS3OZHYcE3fhJ9YA4CsinrPuawgEzfsi57KGO7LqH6
	 wCrnVHYnYRyjXMTsIM1j5B8uoDIEY9Oq1xZoxyucsUKcOcQ/w+IJluOi033znqlrUe
	 Ze6kEqq5Wu9JZd8/uIldG+wITrNvT596DY9YKLHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27F05F80258;
	Fri, 13 Dec 2019 06:04:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C030F80259; Fri, 13 Dec 2019 06:04:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D91F2F80139
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 06:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D91F2F80139
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 21:04:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,308,1571727600"; d="scan'208";a="208340676"
Received: from vbagrodi-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.130.70])
 by orsmga008.jf.intel.com with ESMTP; 12 Dec 2019 21:04:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 12 Dec 2019 23:03:55 -0600
Message-Id: <20191213050409.12776-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v4 01/15] soundwire: renames to prepare support
	for master drivers/devices
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

Add clearer references to sdw_slave_driver for internal macros

No change for sdw_driver and module_sdw_driver to avoid compatibility
issues with existing codec devices

No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus_type.c       | 21 +++++++++++----------
 include/linux/soundwire/sdw_type.h | 18 ++++++++++--------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 4a465f55039f..370b94752662 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -34,7 +34,7 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
 static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_driver *drv = drv_to_sdw_driver(ddrv);
+	struct sdw_driver *drv = drv_to_sdw_slave_driver(ddrv);
 
 	return !!sdw_get_device_id(slave, drv);
 }
@@ -70,7 +70,7 @@ EXPORT_SYMBOL_GPL(sdw_bus_type);
 static int sdw_drv_probe(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
+	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
 	const struct sdw_device_id *id;
 	int ret;
 
@@ -116,7 +116,7 @@ static int sdw_drv_probe(struct device *dev)
 static int sdw_drv_remove(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
+	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
 	int ret = 0;
 
 	if (drv->remove)
@@ -130,20 +130,21 @@ static int sdw_drv_remove(struct device *dev)
 static void sdw_drv_shutdown(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
+	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
 
 	if (drv->shutdown)
 		drv->shutdown(slave);
 }
 
 /**
- * __sdw_register_driver() - register a SoundWire Slave driver
+ * __sdw_register_slave_driver() - register a SoundWire Slave driver
  * @drv: driver to register
  * @owner: owning module/driver
  *
  * Return: zero on success, else a negative error code.
  */
-int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
+int __sdw_register_slave_driver(struct sdw_driver *drv,
+				struct module *owner)
 {
 	drv->driver.bus = &sdw_bus_type;
 
@@ -164,17 +165,17 @@ int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
 
 	return driver_register(&drv->driver);
 }
-EXPORT_SYMBOL_GPL(__sdw_register_driver);
+EXPORT_SYMBOL_GPL(__sdw_register_slave_driver);
 
 /**
- * sdw_unregister_driver() - unregisters the SoundWire Slave driver
+ * sdw_unregister_slave_driver() - unregisters the SoundWire Slave driver
  * @drv: driver to unregister
  */
-void sdw_unregister_driver(struct sdw_driver *drv)
+void sdw_unregister_slave_driver(struct sdw_driver *drv)
 {
 	driver_unregister(&drv->driver);
 }
-EXPORT_SYMBOL_GPL(sdw_unregister_driver);
+EXPORT_SYMBOL_GPL(sdw_unregister_slave_driver);
 
 static int __init sdw_bus_init(void)
 {
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index aaa7f4267c14..abaa21278152 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -6,13 +6,15 @@
 
 extern struct bus_type sdw_bus_type;
 
-#define drv_to_sdw_driver(_drv) container_of(_drv, struct sdw_driver, driver)
+#define drv_to_sdw_slave_driver(_drv) \
+	container_of(_drv, struct sdw_driver, driver)
 
-#define sdw_register_driver(drv) \
-	__sdw_register_driver(drv, THIS_MODULE)
+#define sdw_register_slave_driver(drv) \
+	__sdw_register_slave_driver(drv, THIS_MODULE)
 
-int __sdw_register_driver(struct sdw_driver *drv, struct module *owner);
-void sdw_unregister_driver(struct sdw_driver *drv);
+int __sdw_register_slave_driver(struct sdw_driver *drv,
+				struct module *owner);
+void sdw_unregister_slave_driver(struct sdw_driver *drv);
 
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 
@@ -24,7 +26,7 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
  * module init/exit. This eliminates a lot of boilerplate. Each module may only
  * use this macro once, and calling it replaces module_init() and module_exit()
  */
-#define module_sdw_driver(__sdw_driver) \
-	module_driver(__sdw_driver, sdw_register_driver, \
-			sdw_unregister_driver)
+#define module_sdw_driver(__sdw_slave_driver) \
+	module_driver(__sdw_slave_driver, sdw_register_slave_driver, \
+			sdw_unregister_slave_driver)
 #endif /* __SOUNDWIRE_TYPES_H */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
