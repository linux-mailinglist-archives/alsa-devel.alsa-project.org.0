Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C7FCD48
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:20:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD911691;
	Thu, 14 Nov 2019 19:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD911691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573755656;
	bh=KxWthV9wYkKdBIcOtoE3YyQmEK13n3SprZA+cnNwmt8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKmHKGPNF7it7VOPYLyEL4STw5TxjzQuFtY7jsofMvptWJNKuu62mjbK8iZahOXQE
	 50S0lC/3PratmmsDyakWNtCbEls54HbSLvKeKNcP1fp4Wyj4oqkMPJuRQ86KbvYjye
	 JXKACT+fh65wHT2ShiZ5J0QNovD/y6RcWp2CS94c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC22CF80116;
	Thu, 14 Nov 2019 19:17:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82734F800CC; Thu, 14 Nov 2019 19:17:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56206F80084
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:17:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56206F80084
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="195123378"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2019 10:17:30 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 12:16:42 -0600
Message-Id: <20191114181702.22254-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
References: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 02/22] soundwire: bus: fix race condition
	with probe_complete signaling
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

The driver probe takes care of basic initialization and is invoked
when a Slave becomes attached, after a match between the Slave DevID
registers and ACPI/DT entries.

The update_status callback is invoked when a Slave state changes,
e.g. when it is assigned a non-zero Device Number and it reports with
an ATTACHED/ALERT state.

The state change detection is usually hardware-based and based on the
SoundWire frame rate (e.g. double-digit microseconds) while the probe
is a pure software operation, which may involve a kernel module
load. In corner cases, it's possible that the state changes before the
probe completes.

This patch suggests the use of wait_for_completion to avoid races on
startup, so that the update_status callback does not rely on invalid
pointers/data structures.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c      | 25 ++++++++++++++++++++++---
 drivers/soundwire/bus.h      |  1 +
 drivers/soundwire/bus_type.c |  5 +++++
 drivers/soundwire/slave.c    |  2 ++
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4b22ee996a65..d99acbc614c6 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -961,10 +961,29 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 static int sdw_update_slave_status(struct sdw_slave *slave,
 				   enum sdw_slave_status status)
 {
-	if (slave->ops && slave->ops->update_status)
-		return slave->ops->update_status(slave, status);
+	unsigned long time;
 
-	return 0;
+	if (!slave->probed) {
+		/*
+		 * the slave status update is typically handled in an
+		 * interrupt thread, which can race with the driver
+		 * probe, e.g. when a module needs to be loaded.
+		 *
+		 * make sure the probe is complete before updating
+		 * status.
+		 */
+		time = wait_for_completion_timeout(&slave->probe_complete,
+				msecs_to_jiffies(DEFAULT_PROBE_TIMEOUT));
+		if (!time) {
+			dev_err(&slave->dev, "Probe not complete, timed out\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	if (!slave->ops || !slave->ops->update_status)
+		return 0;
+
+	return slave->ops->update_status(slave, status);
 }
 
 /**
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index be01a5f3d00b..93e7bbab0938 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -5,6 +5,7 @@
 #define __SDW_BUS_H
 
 #define DEFAULT_BANK_SWITCH_TIMEOUT 3000
+#define DEFAULT_PROBE_TIMEOUT       2000
 
 int sdw_uevent(struct device *dev, struct kobj_uevent_env *env);
 
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index df1271f6db61..c9dbc98ac028 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -120,6 +120,11 @@ static int sdw_slave_drv_probe(struct device *dev)
 	slave->bus->clk_stop_timeout = max_t(u32, slave->bus->clk_stop_timeout,
 					     slave->prop.clk_stop_timeout);
 
+	slave->probed = true;
+	complete(&slave->probe_complete);
+
+	dev_dbg(dev, "probe complete\n");
+
 	return 0;
 }
 
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 014c3ece1f17..15ac89ecae01 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -53,6 +53,8 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	slave->bus = bus;
 	slave->status = SDW_SLAVE_UNATTACHED;
 	slave->dev_num = 0;
+	init_completion(&slave->probe_complete);
+	slave->probed = false;
 
 	mutex_lock(&bus->bus_lock);
 	list_add_tail(&slave->node, &bus->slaves);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
