Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9650F1E72
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 20:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56CA51667;
	Wed,  6 Nov 2019 20:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56CA51667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573067803;
	bh=vr/EgzLgrNZEMFqfGBdxE3S/7lsn7mbnBIpIu8LlxCU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=foxrz0rl6hherGUwwA+fZJfXXvm8lVU8rWfqURf6EsP6pCRYRMiItSu7v3B/4RdB+
	 DTZQ0gKzONCiMvDABecxDrY55F5hLLDToo0L1/ea0utSBxAD2gfoukaV4qOH+FDLMw
	 UVgvZGsGbntK1InBdCVBkfhPDx1VV/ddmRTdRmnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC714F80611;
	Wed,  6 Nov 2019 20:14:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC466F805FB; Wed,  6 Nov 2019 20:14:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8DEFF800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 20:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8DEFF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 11:14:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="402465659"
Received: from vidhipat-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.33.70])
 by fmsmga005.fm.intel.com with ESMTP; 06 Nov 2019 11:14:05 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 13:13:46 -0600
Message-Id: <20191106191358.5712-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106191358.5712-1-pierre-louis.bossart@linux.intel.com>
References: <20191106191358.5712-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 02/14] soundwire: rename dev_to_sdw_dev macro
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

Since we want to introduce master devices, rename macro so that we
have consistency between slave and master device access, following the
Grey Bus example.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/base/regmap/regmap-sdw.c |  4 ++--
 drivers/soundwire/bus.c          |  2 +-
 drivers/soundwire/bus_type.c     | 11 ++++++-----
 drivers/soundwire/slave.c        |  2 +-
 include/linux/soundwire/sdw.h    |  3 ++-
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/base/regmap/regmap-sdw.c b/drivers/base/regmap/regmap-sdw.c
index 50a66382d87d..d1fc0c22180a 100644
--- a/drivers/base/regmap/regmap-sdw.c
+++ b/drivers/base/regmap/regmap-sdw.c
@@ -10,7 +10,7 @@
 static int regmap_sdw_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct device *dev = context;
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
 
 	return sdw_write(slave, reg, val);
 }
@@ -18,7 +18,7 @@ static int regmap_sdw_write(void *context, unsigned int reg, unsigned int val)
 static int regmap_sdw_read(void *context, unsigned int reg, unsigned int *val)
 {
 	struct device *dev = context;
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	int read;
 
 	read = sdw_read(slave, reg);
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index be5d437058ed..4b22ee996a65 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -110,7 +110,7 @@ EXPORT_SYMBOL(sdw_add_bus_master);
 
 static int sdw_delete_slave(struct device *dev, void *data)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	struct sdw_bus *bus = slave->bus;
 
 	sdw_slave_debugfs_exit(slave);
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 370b94752662..c0585bcc8a41 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -33,7 +33,7 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
 
 static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	struct sdw_driver *drv = drv_to_sdw_slave_driver(ddrv);
 
 	return !!sdw_get_device_id(slave, drv);
@@ -49,7 +49,7 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
 
 static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	char modalias[32];
 
 	sdw_slave_modalias(slave, modalias, sizeof(modalias));
@@ -69,7 +69,7 @@ EXPORT_SYMBOL_GPL(sdw_bus_type);
 
 static int sdw_drv_probe(struct device *dev)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
 	const struct sdw_device_id *id;
 	int ret;
@@ -115,8 +115,9 @@ static int sdw_drv_probe(struct device *dev)
 
 static int sdw_drv_remove(struct device *dev)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
+
 	int ret = 0;
 
 	if (drv->remove)
@@ -129,7 +130,7 @@ static int sdw_drv_remove(struct device *dev)
 
 static void sdw_drv_shutdown(struct device *dev)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
 
 	if (drv->shutdown)
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 19919975bb6d..48a513680db6 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -9,7 +9,7 @@
 
 static void sdw_slave_release(struct device *dev)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
 
 	kfree(slave);
 }
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index a58939d3b611..3b618d7e6641 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -576,7 +576,8 @@ struct sdw_slave {
 	struct completion initialization_complete;
 };
 
-#define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
+#define to_sdw_slave_device(d) \
+	container_of(d, struct sdw_slave, dev)
 
 struct sdw_driver {
 	const char *name;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
