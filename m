Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDF613AAEC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:26:33 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7020A271C;
	Mon, 13 Jan 2020 23:57:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7020A271C
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D28F8014B;
	Mon, 13 Jan 2020 23:57:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E02F801EB; Mon, 13 Jan 2020 23:57:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 830F5F80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 23:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 830F5F80149
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 14:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="304974676"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by orsmga001.jf.intel.com with ESMTP; 13 Jan 2020 14:56:55 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 16:56:37 -0600
Message-Id: <20200113225637.17313-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH] soundwire: bus: fix device number leak on
	errors
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

If the programming of the dev_number fails due to an IO error, a new
device_number will be assigned, resulting in a leak.

Make sure we only assign a device_number once per Slave device.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c       | 37 ++++++++++++++++++++++-------------
 include/linux/soundwire/sdw.h |  4 +++-
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index be5d437058ed..8f973e70e6f7 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -456,26 +456,35 @@ static int sdw_get_device_num(struct sdw_slave *slave)
 static int sdw_assign_device_num(struct sdw_slave *slave)
 {
 	int ret, dev_num;
+	bool new_device = false;
 
 	/* check first if device number is assigned, if so reuse that */
 	if (!slave->dev_num) {
-		mutex_lock(&slave->bus->bus_lock);
-		dev_num = sdw_get_device_num(slave);
-		mutex_unlock(&slave->bus->bus_lock);
-		if (dev_num < 0) {
-			dev_err(slave->bus->dev, "Get dev_num failed: %d\n",
-				dev_num);
-			return dev_num;
+		if (!slave->dev_num_sticky) {
+			mutex_lock(&slave->bus->bus_lock);
+			dev_num = sdw_get_device_num(slave);
+			mutex_unlock(&slave->bus->bus_lock);
+			if (dev_num < 0) {
+				dev_err(slave->bus->dev, "Get dev_num failed: %d\n",
+					dev_num);
+				return dev_num;
+			}
+			slave->dev_num = dev_num;
+			slave->dev_num_sticky = dev_num;
+			new_device = true;
+		} else {
+			slave->dev_num = slave->dev_num_sticky;
 		}
-	} else {
+	}
+
+	if (!new_device)
 		dev_info(slave->bus->dev,
-			 "Slave already registered dev_num:%d\n",
+			 "Slave already registered, reusing dev_num:%d\n",
 			 slave->dev_num);
 
-		/* Clear the slave->dev_num to transfer message on device 0 */
-		dev_num = slave->dev_num;
-		slave->dev_num = 0;
-	}
+	/* Clear the slave->dev_num to transfer message on device 0 */
+	dev_num = slave->dev_num;
+	slave->dev_num = 0;
 
 	ret = sdw_write(slave, SDW_SCP_DEVNUMBER, dev_num);
 	if (ret < 0) {
@@ -485,7 +494,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 	}
 
 	/* After xfer of msg, restore dev_num */
-	slave->dev_num = dev_num;
+	slave->dev_num = slave->dev_num_sticky;
 
 	return 0;
 }
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b7c9eca4332a..b451bb622335 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -546,7 +546,8 @@ struct sdw_slave_ops {
  * @debugfs: Slave debugfs
  * @node: node for bus list
  * @port_ready: Port ready completion flag for each Slave port
- * @dev_num: Device Number assigned by Bus
+ * @dev_num: Current Device Number, values can be 0 or dev_num_sticky
+ * @dev_num_sticky: one-time static Device Number assigned by Bus
  * @probed: boolean tracking driver state
  * @probe_complete: completion utility to control potential races
  * on startup between driver probe/initialization and SoundWire
@@ -575,6 +576,7 @@ struct sdw_slave {
 	struct list_head node;
 	struct completion *port_ready;
 	u16 dev_num;
+	u16 dev_num_sticky;
 	bool probed;
 	struct completion probe_complete;
 	struct completion enumeration_complete;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
