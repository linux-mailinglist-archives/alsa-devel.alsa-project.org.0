Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4831D8F48
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 07:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A64A17BE;
	Tue, 19 May 2020 07:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A64A17BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589866875;
	bh=nQOCAVdcW9eyQ0cX6ETuwyzQ1JNfxkEVPole7C7SjMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fzTk77LcyNQprXpDiJNXRipM1TVvXpaLRHByTtQb7B1mlhFimSv7qxskod4qfmnNC
	 aUjGwZrWUvHcJzg+8xeQu+VhbckEvYYQkvBUmy5HGgXWagRdCXu306b/CVDc2gBYMP
	 hsvxdCxiyKOHMJvXWV+H9cwciWjz/C/EzsVmDVvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FBCAF80291;
	Tue, 19 May 2020 07:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA6B5F8028F; Tue, 19 May 2020 07:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E4FFF80161
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 07:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E4FFF80161
IronPort-SDR: j1VZGib11Eg7Id2wciFBFW0lXowv6V6l+zyADSZfxhm0SB0Wl9live14aedCQhuTSJyZjF+x3T
 KjSoyuvCM3Hg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 22:38:25 -0700
IronPort-SDR: tBKYjLeBqzgaLsxqg4erk2WPHigFqqhPGPQD8amOevMp+6HwX2shKqEDBC+OhhfgBya8z+/HLb
 pbcFj3QHp8MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; d="scan'208";a="288836565"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga004.fm.intel.com with ESMTP; 18 May 2020 22:38:20 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 3/5] soundwire: bus: add unique bus id
Date: Tue, 19 May 2020 01:43:20 +0800
Message-Id: <20200518174322.31561-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
References: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Adding an unique id for each bus.

Suggested-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 20 ++++++++++++++++++++
 include/linux/soundwire/sdw.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 24064dbd74fa..2d24f183061d 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -9,6 +9,19 @@
 #include <linux/soundwire/sdw.h>
 #include "bus.h"
 
+static DEFINE_IDA(sdw_ida);
+
+static int sdw_get_id(struct sdw_bus *bus)
+{
+	int rc = ida_alloc(&sdw_ida, GFP_KERNEL);
+
+	if (rc < 0)
+		return rc;
+
+	bus->id = rc;
+	return 0;
+}
+
 /**
  * sdw_bus_master_add() - add a bus Master instance
  * @bus: bus instance
@@ -29,6 +42,12 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		return -ENODEV;
 	}
 
+	ret = sdw_get_id(bus);
+	if (ret) {
+		dev_err(bus->dev, "Failed to get bus id\n");
+		return ret;
+	}
+
 	if (!bus->ops) {
 		dev_err(bus->dev, "SoundWire Bus ops are not set\n");
 		return -EINVAL;
@@ -144,6 +163,7 @@ void sdw_bus_master_delete(struct sdw_bus *bus)
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
 
 	sdw_bus_debugfs_exit(bus);
+	ida_free(&sdw_ida, bus->id);
 }
 EXPORT_SYMBOL(sdw_bus_master_delete);
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 2003e8c55538..a32cb26f1815 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -789,6 +789,7 @@ struct sdw_master_ops {
  * struct sdw_bus - SoundWire bus
  * @dev: Master linux device
  * @link_id: Link id number, can be 0 to N, unique for each Master
+ * @id: bus system-wide unique id
  * @slaves: list of Slaves on this bus
  * @assigned: Bitmap for Slave device numbers.
  * Bit set implies used number, bit clear implies unused number.
@@ -813,6 +814,7 @@ struct sdw_master_ops {
 struct sdw_bus {
 	struct device *dev;
 	unsigned int link_id;
+	int id;
 	struct list_head slaves;
 	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
 	struct mutex bus_lock;
-- 
2.17.1

