Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AE024CDEB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 08:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E66441691;
	Fri, 21 Aug 2020 08:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E66441691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597990994;
	bh=L4CoTQdEXnSYXvZHMlbt4xRnLsxvNk0XwTvpCa5dZ2M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UIWWWNulWZgoT38a2Kr3HWXBQPuoHNDMJeCHg6IR0kMshPP1ghlAQ1d2d63EMOTlt
	 4ZoKj61RkUQLia5V/Hfzjavqe9rmxOeBd/MfIsNsZpH4dubWtOCgdV2MKQGpHpA2Ea
	 5RGx6LcgGoEIa8zLGPVpeXk7rpsMLyCZaLK0OUEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21934F800D2;
	Fri, 21 Aug 2020 08:20:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEBA2F80253; Fri, 21 Aug 2020 08:20:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4912AF80216
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 08:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4912AF80216
IronPort-SDR: mA6I2SKnWSRmo2Wag4CU3XWH1EB+XEsstkb+Zdn4evWJ7rI7rbgm5AGCST6W3QPNhm5CXho0H2
 /guiuXJxjhYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="153075497"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="153075497"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 23:20:33 -0700
IronPort-SDR: gITo8TI2LbskaMirDuHdPwWILb1yV6i0Khmv7OPNOTr9HnEUuNsvMYcXbHONtDkB1IapTfu665
 ktyyF6kfw5HQ==
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="498427119"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 23:20:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/3] soundwire: fix port_ready[] dynamic allocation in
 mipi_disco
Date: Fri, 21 Aug 2020 02:26:38 +0800
Message-Id: <20200820182639.11572-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820182639.11572-1-yung-chuan.liao@linux.intel.com>
References: <20200820182639.11572-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The existing code allocates memory for the total number of ports.
This only works if the ports are contiguous, but will break if e.g. a
Devices uses port0, 1, and 14. The port_ready[] array would contain 3
elements, which would lead to an out-of-bounds access. Conversely in
other cases, the wrong port index would be used leading to timeouts on
prepare.

This can be fixed by allocating for the worst-case of 15
ports (DP0..DP14). In addition since the number is now fixed, we can
use an array instead of a dynamic allocation.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/mipi_disco.c | 18 +-----------------
 drivers/soundwire/slave.c      |  4 ++++
 include/linux/soundwire/sdw.h  |  2 +-
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 4ae62b452b8c..55a9c51c84c1 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -289,7 +289,7 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 	struct sdw_slave_prop *prop = &slave->prop;
 	struct device *dev = &slave->dev;
 	struct fwnode_handle *port;
-	int num_of_ports, nval, i, dp0 = 0;
+	int nval;
 
 	device_property_read_u32(dev, "mipi-sdw-sw-interface-revision",
 				 &prop->mipi_revision);
@@ -352,7 +352,6 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 			return -ENOMEM;
 
 		sdw_slave_read_dp0(slave, port, prop->dp0_prop);
-		dp0 = 1;
 	}
 
 	/*
@@ -383,21 +382,6 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 	sdw_slave_read_dpn(slave, prop->sink_dpn_prop, nval,
 			   prop->sink_ports, "sink");
 
-	/* some ports are bidirectional so check total ports by ORing */
-	nval = prop->source_ports | prop->sink_ports;
-	num_of_ports = hweight32(nval) + dp0; /* add DP0 */
-
-	/* Allocate port_ready based on num_of_ports */
-	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
-					 sizeof(*slave->port_ready),
-					 GFP_KERNEL);
-	if (!slave->port_ready)
-		return -ENOMEM;
-
-	/* Initialize completion */
-	for (i = 0; i < num_of_ports; i++)
-		init_completion(&slave->port_ready[i]);
-
 	return 0;
 }
 EXPORT_SYMBOL(sdw_slave_read_prop);
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 0839445ee07b..a762ee24e6fa 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -25,6 +25,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 {
 	struct sdw_slave *slave;
 	int ret;
+	int i;
 
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
 	if (!slave)
@@ -58,6 +59,9 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	init_completion(&slave->probe_complete);
 	slave->probed = false;
 
+	for (i = 0; i < SDW_MAX_PORTS; i++)
+		init_completion(&slave->port_ready[i]);
+
 	mutex_lock(&bus->bus_lock);
 	list_add_tail(&slave->node, &bus->slaves);
 	mutex_unlock(&bus->bus_lock);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 0aa4c6af7554..63e71645fd13 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -619,7 +619,7 @@ struct sdw_slave {
 	struct dentry *debugfs;
 #endif
 	struct list_head node;
-	struct completion *port_ready;
+	struct completion port_ready[SDW_MAX_PORTS];
 	enum sdw_clk_stop_mode curr_clk_stop_mode;
 	u16 dev_num;
 	u16 dev_num_sticky;
-- 
2.17.1

