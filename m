Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4C11DD6D
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 06:09:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D41A1750;
	Fri, 13 Dec 2019 06:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D41A1750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576213778;
	bh=HGUjfMwDpfFVu+X6RYWYCkVe3metVBlr885cjEMT2eI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pNi6v2PatDzq91G85WsI1U2aEjCPvzyBZ2CaEAEaCxfxdaZk6lp9+pShn7mWkvlbB
	 Jdbri2IE97LO3Zw/45aYQkF7KGIbCqpLLncwP+yWtTHgDdDcv8fDD7GiC3eSSfj18l
	 DHcGF/ViXLcO0pKQ8tyuT9Tft1+iqKk60HdyC4d0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD021F8028A;
	Fri, 13 Dec 2019 06:04:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC737F8025A; Fri, 13 Dec 2019 06:04:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B87F3F80234
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 06:04:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B87F3F80234
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 21:04:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,308,1571727600"; d="scan'208";a="208340723"
Received: from vbagrodi-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.130.70])
 by orsmga008.jf.intel.com with ESMTP; 12 Dec 2019 21:04:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 12 Dec 2019 23:04:00 -0600
Message-Id: <20191213050409.12776-7-pierre-louis.bossart@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v4 06/15] soundwire: add support for
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
devices.

First add explicit support for sdw_slave_type and error checks if this type
is not set.

In follow-up patches we can add support for the sdw_md_type (md==Master
Device), following the Grey Bus example.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus_type.c       | 16 ++++++++++++----
 drivers/soundwire/slave.c          |  7 ++++++-
 include/linux/soundwire/sdw_type.h |  6 ++++++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 9a0fd3ee1014..bbdedce5eb26 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -49,13 +49,21 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
 
 static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
-	struct sdw_slave *slave = to_sdw_slave_device(dev);
+	struct sdw_slave *slave;
 	char modalias[32];
 
-	sdw_slave_modalias(slave, modalias, sizeof(modalias));
+	if (is_sdw_slave(dev)) {
+		slave = to_sdw_slave_device(dev);
+
+		sdw_slave_modalias(slave, modalias, sizeof(modalias));
 
-	if (add_uevent_var(env, "MODALIAS=%s", modalias))
-		return -ENOMEM;
+		if (add_uevent_var(env, "MODALIAS=%s", modalias))
+			return -ENOMEM;
+	} else {
+		/* only Slave device type supported */
+		dev_warn(dev, "uevent for unknown Soundwire type\n");
+		return -EINVAL;
+	}
 
 	return 0;
 }
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 48a513680db6..c87267f12a3b 100644
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
@@ -41,9 +46,9 @@ static int sdw_slave_add(struct sdw_bus *bus,
 			     id->class_id, id->unique_id);
 	}
 
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
