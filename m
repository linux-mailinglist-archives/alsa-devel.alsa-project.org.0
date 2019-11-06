Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7AF1EBB
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 20:27:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345491691;
	Wed,  6 Nov 2019 20:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345491691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573068446;
	bh=fH82JokjUMJIKPcwaHyN17UjX9C3TkQrNnCur1F7DFE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOs91/p2uFSLR9zC2yQRXq5UIEcCym5+ppV5WOKTa1ayfAm52FUQaNzVvcfOXeuNk
	 MxVD9oIwYW5ArPHHmnB7tDx8RPuk/hwE4d0e2Uewcmj81dYJ/xHuRvyhHBO7iQenKB
	 5feA9E2zWmd/4Dm90Ss9kj8lUhru2wMIDTYRm0+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C17EEF80636;
	Wed,  6 Nov 2019 20:22:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30A63F80611; Wed,  6 Nov 2019 20:22:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90EEBF8060D
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 20:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90EEBF8060D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 11:22:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="403835074"
Received: from vidhipat-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.33.70])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2019 11:22:31 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 13:22:06 -0600
Message-Id: <20191106192223.6003-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106192223.6003-1-pierre-louis.bossart@linux.intel.com>
References: <20191106192223.6003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 02/19] soundwire: fix race between driver
	probe and update_status callback
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

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c      | 24 +++++++++++++++++++++---
 drivers/soundwire/bus.h      |  1 +
 drivers/soundwire/bus_type.c |  5 +++++
 drivers/soundwire/slave.c    |  2 ++
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4b22ee996a65..903aee258800 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -961,10 +961,28 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 static int sdw_update_slave_status(struct sdw_slave *slave,
 				   enum sdw_slave_status status)
 {
-	if (slave->ops && slave->ops->update_status)
-		return slave->ops->update_status(slave, status);
+	unsigned long time;
 
-	return 0;
+	if (!slave->ops || !slave->ops->update_status)
+		return 0;
+
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
+	return slave->ops->update_status(slave, status);
 }
 
 /**
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index cb482da914da..acb8d11a4c84 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -5,6 +5,7 @@
 #define __SDW_BUS_H
 
 #define DEFAULT_BANK_SWITCH_TIMEOUT 3000
+#define DEFAULT_PROBE_TIMEOUT       2000
 
 #if IS_ENABLED(CONFIG_ACPI)
 int sdw_acpi_find_slaves(struct sdw_bus *bus);
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index fd234f63bf2f..ac484384bd6e 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -118,6 +118,11 @@ static int sdw_slave_drv_probe(struct device *dev)
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
index c87267f12a3b..81b94cd3985e 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -52,6 +52,8 @@ static int sdw_slave_add(struct sdw_bus *bus,
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
