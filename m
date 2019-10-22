Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0640E0EC6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 01:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75264168A;
	Wed, 23 Oct 2019 01:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75264168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571788341;
	bh=ngsHxz3MkJDjr9hTi/NnQ1XeiDHqe8WSRVmDMqYVICw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZE3p/LyOB0v84dDlZ8jbEypvaaJzivzColUjrLBbRK20q1jKHA7kWkdHgr/Pp1IdS
	 ZqqZju9UCcOen/xuXvBVXYeOWIoP7RgPq2JklXcGZxKGEWguxEpv3QskTZ/dnEmNjH
	 ftHB3F4JuZaJkmyR4kSapb/Zomzxag+2EKgpvUIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17361F80610;
	Wed, 23 Oct 2019 01:48:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6D3EF80322; Wed, 23 Oct 2019 01:48:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D28CCF80322
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 01:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D28CCF80322
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 16:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,218,1569308400"; d="scan'208";a="399211311"
Received: from srajamoh-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.20.203])
 by fmsmga006.fm.intel.com with ESMTP; 22 Oct 2019 16:48:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 22 Oct 2019 18:48:08 -0500
Message-Id: <20191022234808.17432-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
References: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/3] soundwire: ignore uniqueID when irrelevant
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

The uniqueID is useful when there are two or more devices of the same
type (identical manufacturer ID, part ID) on the same link.

When there is a single device of a given type on a link, its uniqueID
is irrelevant. It's not uncommon on actual platforms to see variations
of the uniqueID, or differences between devID registers and ACPI _ADR
fields.

This patch suggests a filter on startup to identify 'single' devices
and tag them accordingly. The uniqueID is then not used for the probe,
and the device name omits the uniqueID as well.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c   |  7 +++---
 drivers/soundwire/slave.c | 52 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fc53dbe57f85..be5d437058ed 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -422,10 +422,11 @@ static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
 
 static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
 {
-	if (slave->id.unique_id != id.unique_id ||
-	    slave->id.mfg_id != id.mfg_id ||
+	if (slave->id.mfg_id != id.mfg_id ||
 	    slave->id.part_id != id.part_id ||
-	    slave->id.class_id != id.class_id)
+	    slave->id.class_id != id.class_id ||
+	    (slave->id.unique_id != SDW_IGNORED_UNIQUE_ID &&
+	     slave->id.unique_id != id.unique_id))
 		return -ENODEV;
 
 	return 0;
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 5dbc76772d21..19919975bb6d 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -29,10 +29,17 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	slave->dev.parent = bus->dev;
 	slave->dev.fwnode = fwnode;
 
-	/* name shall be sdw:link:mfg:part:class:unique */
-	dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x:%x",
-		     bus->link_id, id->mfg_id, id->part_id,
-		     id->class_id, id->unique_id);
+	if (id->unique_id == SDW_IGNORED_UNIQUE_ID) {
+		/* name shall be sdw:link:mfg:part:class */
+		dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x",
+			     bus->link_id, id->mfg_id, id->part_id,
+			     id->class_id);
+	} else {
+		/* name shall be sdw:link:mfg:part:class:unique */
+		dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x:%x",
+			     bus->link_id, id->mfg_id, id->part_id,
+			     id->class_id, id->unique_id);
+	}
 
 	slave->dev.release = sdw_slave_release;
 	slave->dev.bus = &sdw_bus_type;
@@ -103,6 +110,7 @@ static bool find_slave(struct sdw_bus *bus,
 int sdw_acpi_find_slaves(struct sdw_bus *bus)
 {
 	struct acpi_device *adev, *parent;
+	struct acpi_device *adev2, *parent2;
 
 	parent = ACPI_COMPANION(bus->dev);
 	if (!parent) {
@@ -112,10 +120,46 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
 
 	list_for_each_entry(adev, &parent->children, node) {
 		struct sdw_slave_id id;
+		struct sdw_slave_id id2;
+		bool ignore_unique_id = true;
 
 		if (!find_slave(bus, adev, &id))
 			continue;
 
+		/* brute-force O(N^2) search for duplicates */
+		parent2 = parent;
+		list_for_each_entry(adev2, &parent2->children, node) {
+
+			if (adev == adev2)
+				continue;
+
+			if (!find_slave(bus, adev2, &id2))
+				continue;
+
+			if (id.sdw_version != id2.sdw_version ||
+			    id.mfg_id != id2.mfg_id ||
+			    id.part_id != id2.part_id ||
+			    id.class_id != id2.class_id)
+				continue;
+
+			if (id.unique_id != id2.unique_id) {
+				dev_dbg(bus->dev,
+					"Valid unique IDs %x %x for Slave mfg %x part %d\n",
+					id.unique_id, id2.unique_id,
+					id.mfg_id, id.part_id);
+				ignore_unique_id = false;
+			} else {
+				dev_err(bus->dev,
+					"Invalid unique IDs %x %x for Slave mfg %x part %d\n",
+					id.unique_id, id2.unique_id,
+					id.mfg_id, id.part_id);
+				return -ENODEV;
+			}
+		}
+
+		if (ignore_unique_id)
+			id.unique_id = SDW_IGNORED_UNIQUE_ID;
+
 		/*
 		 * don't error check for sdw_slave_add as we want to continue
 		 * adding Slaves
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
