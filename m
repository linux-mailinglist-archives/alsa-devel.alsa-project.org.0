Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA6512385F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 22:06:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2A801670;
	Tue, 17 Dec 2019 22:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2A801670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576616816;
	bh=ZXSF/1Ta2HM61IjXtNqR7CUKufsi8YX5YmDrKKjqZi8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LadBsyf6ecD8a65d2sHXmD2QV1e16qlkHQltCPiPXz6t+QHciamJpPcLcMpkFJ6Kf
	 nc+Nv/FXM8Qzl04ndIwVGQ90QFnk4aYke0EdPIYJCEsjdtkxQbY/yLLFOV4I+LsQom
	 NpKay8ErMMP5hcotVcsJAn4TC8/KCmGMZUFVwjio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20416F80269;
	Tue, 17 Dec 2019 22:03:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C592F80268; Tue, 17 Dec 2019 22:03:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9279AF80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 22:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9279AF80100
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 13:03:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="240560957"
Received: from smcdonal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.83.42])
 by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2019 13:03:22 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 15:03:00 -0600
Message-Id: <20191217210314.20410-4-pierre-louis.bossart@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v5 03/17] soundwire: rename
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
