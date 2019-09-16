Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0CEB430F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 23:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D762C1667;
	Mon, 16 Sep 2019 23:28:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D762C1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568669383;
	bh=KtPXJB5AQRynvYT3aPf6q50SvyqssnuEzFyLSNd5Am0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AEkjUy7XziRt5tuIJrJD9btk5F9NidoVWmxxjKpBkNs13IfcPSxsVWz4UkLAMTDIF
	 yx3SfqAaQMHUrCMTtclSF0juXFBmVYBCCKczhykD1R4m8FzP+zxlQ09tFnco+DCMkH
	 ENT7F4nlQx4OLn0VyCeH3Pd8DXCkeSVa/MoaiTUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD199F8064C;
	Mon, 16 Sep 2019 23:24:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50615F80539; Mon, 16 Sep 2019 23:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DFA6F80539
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 23:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DFA6F80539
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 14:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="201684044"
Received: from dgitin-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.142.45])
 by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2019 14:23:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 16 Sep 2019 16:23:39 -0500
Message-Id: <20190916212342.12578-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916212342.12578-1-pierre-louis.bossart@linux.intel.com>
References: <20190916212342.12578-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 6/9] soundwire: add support for
	sdw_slave_type
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

Currently the bus does not have any explicit support for master
devices.  Add explicit support for sdw_slave_type, so that in
follow-up patches we can add support for the sdw_md_type (md==Master
Device), following the Grey Bus example.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus_type.c       | 9 ++++++++-
 drivers/soundwire/slave.c          | 7 ++++++-
 include/linux/soundwire/sdw_type.h | 6 ++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 9407ebf30012..5df095f4e12f 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -49,9 +49,16 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
 
 static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave;
 	char modalias[32];
 
+	if (is_sdw_slave(dev)) {
+		slave = to_sdw_slave_device(dev);
+	} else {
+		dev_warn(dev, "uevent for unknown Soundwire type\n");
+		return -EINVAL;
+	}
+
 	sdw_slave_modalias(slave, modalias, sizeof(modalias));
 
 	if (add_uevent_var(env, "MODALIAS=%s", modalias))
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 40e41796a499..89854ae8414f 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -14,6 +14,11 @@ static void sdw_slave_release(struct device *dev)
 	kfree(slave);
 }
 
+struct device_type sdw_slave_type = {
+	.name =		"sdw_slave",
+	.release =	sdw_slave_release,
+};
+
 static int sdw_slave_add(struct sdw_bus *bus,
 			 struct sdw_slave_id *id, struct fwnode_handle *fwnode)
 {
@@ -34,9 +39,9 @@ static int sdw_slave_add(struct sdw_bus *bus,
 		     bus->link_id, id->mfg_id, id->part_id,
 		     id->class_id, id->unique_id);
 
-	slave->dev.release = sdw_slave_release;
 	slave->dev.bus = &sdw_bus_type;
 	slave->dev.of_node = of_node_get(to_of_node(fwnode));
+	slave->dev.type = &sdw_slave_type;
 	slave->bus = bus;
 	slave->status = SDW_SLAVE_UNATTACHED;
 	slave->dev_num = 0;
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index 7d4bc6a979bf..c681b3426478 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -5,6 +5,12 @@
 #define __SOUNDWIRE_TYPES_H
 
 extern struct bus_type sdw_bus_type;
+extern struct device_type sdw_slave_type;
+
+static inline int is_sdw_slave(const struct device *dev)
+{
+	return dev->type == &sdw_slave_type;
+}
 
 #define to_sdw_slave_driver(_drv) \
 	container_of(_drv, struct sdw_driver, driver)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
