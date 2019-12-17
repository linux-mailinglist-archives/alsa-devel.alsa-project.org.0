Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 478ED12385E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 22:06:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D11C984F;
	Tue, 17 Dec 2019 22:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D11C984F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576616802;
	bh=xVPfmTZ4IgptlU5PsczOBFE8pYtSB1fiFYKbxsOmPjs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K50K6/5Qeo5qhORt6uGpipSm6N+gq+TS3C2kfhASS4oCQISbo14XWzmlDRJgT3G8e
	 Cc9ORDTGxlZ/bJm8PLod7fFSPOIHGvXLqUjy4OUqbyirtGv1kiXEnE0RRSgGvJHq9v
	 WXJyRvq2KpqDFR40AU8sPn1d/dR4fHcPcy2eXaTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C878FF80277;
	Tue, 17 Dec 2019 22:03:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17506F80269; Tue, 17 Dec 2019 22:03:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D756DF80218
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 22:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D756DF80218
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 13:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="240560950"
Received: from smcdonal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.83.42])
 by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2019 13:03:20 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 15:02:59 -0600
Message-Id: <20191217210314.20410-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v5 02/17] soundwire: rename dev_to_sdw_dev macro
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
have consistency between slave and master device access.

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
index b7c9eca4332a..5b1180f1e6b5 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -582,7 +582,8 @@ struct sdw_slave {
 	u32 unattach_request;
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
