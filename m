Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B23AB79A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 17:36:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E06111779;
	Thu, 17 Jun 2021 17:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E06111779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623944161;
	bh=45+OUeUcuxmZh903VUSQwJcvNaT3B5aCS0N5FDP6NmQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GvI6Tlg+YppN8Y43dpx1Ym31Zsb1VSYpBCcrkQXTzWMV4Xk8DcPonL+IrfLVdwZqT
	 zUTlL3CoYl/oWu1s4u9As2AC61tHDS51eM9FXQv47pWBbNyoHSTSndAXjxl7SIX7/2
	 Cylf7UFiXqmUekoqC69W5s+eUQPDDCuu6Zm4uhp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 508EAF8025E;
	Thu, 17 Jun 2021 17:34:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1018F8025A; Thu, 17 Jun 2021 17:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8317F80088
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 17:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8317F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Z0VTMRJs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HFQxis003388; Thu, 17 Jun 2021 10:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=ZWlX/sKpUGcPSj/SPb1oTSUr/7SHFkb0kqclKOs2YCA=;
 b=Z0VTMRJs6DLqlqEepZKhSG2qH+h8LtSHY90a9+/MfEtvMp7E6ZzhgMHF0856i3WysZBa
 +ZShuFzY8xq4aIcEpaiPbB7/5HebVAFWK0VnZxnVt9vUFZie5eUUxMNbkTR7YJS1Nb1C
 ZKzp0RNzQhAV4LPKGZ8f9MdRmgbZF3RhmeZF23/nis9QS6vdVmfr7PpqCY9dE9VAJaZ7
 ZjJPo+k5TciZ84JsBYlBU2EbUl1VdOCROuW7/keBwZqXC+AWc59jt9pQ6mJ763sm1cHF
 2wzgW6rn3BezkxszftsIdbozDqP7Ij1X+dzPJt/KdKXNMj4UtoNV/WH8TrCkQcBpzGef tw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 397ab2jq1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Jun 2021 10:34:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 17 Jun
 2021 16:34:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 17 Jun 2021 16:34:21 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.68])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C0BE52B2;
 Thu, 17 Jun 2021 15:34:19 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH] soundwire: stream: Use polling for DP Prepare completion
Date: Thu, 17 Jun 2021 16:34:10 +0100
Message-ID: <20210617153410.27922-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FPNt1Es1ya0FIeLF4-ytsavhjvH8W67v
X-Proofpoint-GUID: FPNt1Es1ya0FIeLF4-ytsavhjvH8W67v
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106170098
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

sdw_prep_deprep_slave_ports() cannot use the port interrupt to signal
CP_SM completion because it is called while holding the bus lock, which
blocks the alert handler from running.

Change to polling the PREPARESTATUS register and remove the
infrastructure that was implemented for the previous interrupt waiting.

A new configuration field 'ch_prep_poll_us' is added to struct
sdw_dpn_prop so that the peripheral driver may select a polling interval.
If this is left at zero a default interval of 500 usec is used.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.c       |  2 --
 drivers/soundwire/slave.c     |  4 ----
 drivers/soundwire/stream.c    | 24 ++++++++++++++----------
 include/linux/soundwire/sdw.h |  8 ++++++--
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index adcbf3969110..606fc26d407f 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1351,7 +1351,6 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 		 */
 
 		if (status & SDW_DP0_INT_PORT_READY) {
-			complete(&slave->port_ready[0]);
 			clear |= SDW_DP0_INT_PORT_READY;
 		}
 
@@ -1429,7 +1428,6 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		 * for ports implementing CP_SM.
 		 */
 		if (status & SDW_DPN_INT_PORT_READY) {
-			complete(&slave->port_ready[port]);
 			clear |= SDW_DPN_INT_PORT_READY;
 		}
 
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 669d7573320b..55ca884ea951 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -26,7 +26,6 @@ int sdw_slave_add(struct sdw_bus *bus,
 {
 	struct sdw_slave *slave;
 	int ret;
-	int i;
 
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
 	if (!slave)
@@ -62,9 +61,6 @@ int sdw_slave_add(struct sdw_bus *bus,
 	slave->probed = false;
 	slave->first_interrupt_done = false;
 
-	for (i = 0; i < SDW_MAX_PORTS; i++)
-		init_completion(&slave->port_ready[i]);
-
 	mutex_lock(&bus->bus_lock);
 	list_add_tail(&slave->node, &bus->slaves);
 	mutex_unlock(&bus->bus_lock);
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 1eaedaaba094..bd6b3b64de90 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -8,11 +8,13 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/time.h>
 #include <sound/soc.h>
 #include "bus.h"
 
@@ -419,11 +421,10 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 				       struct sdw_port_runtime *p_rt,
 				       bool prep)
 {
-	struct completion *port_ready;
 	struct sdw_dpn_prop *dpn_prop;
 	struct sdw_prepare_ch prep_ch;
-	unsigned int time_left;
 	bool intr = false;
+	unsigned long prep_poll_us, prep_timeout_us;
 	int ret = 0, val;
 	u32 addr;
 
@@ -478,16 +479,19 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 		}
 
 		/* Wait for completion on port ready */
-		port_ready = &s_rt->slave->port_ready[prep_ch.num];
-		time_left = wait_for_completion_timeout(port_ready,
-				msecs_to_jiffies(dpn_prop->ch_prep_timeout));
+		prep_timeout_us = dpn_prop->ch_prep_timeout * USEC_PER_MSEC;
+		if (dpn_prop->ch_prep_poll_us)
+			prep_poll_us = dpn_prop->ch_prep_poll_us;
+		else
+			prep_poll_us = SDW_DEFAULT_DP_PREP_POLL_US;
 
-		val = sdw_read(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
-		val &= p_rt->ch_mask;
-		if (!time_left || val) {
+		ret = read_poll_timeout(sdw_read, val, ((val & p_rt->ch_mask) == 0),
+					prep_poll_us, prep_timeout_us, false,
+					s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
+		if (ret < 0) {
 			dev_err(&s_rt->slave->dev,
-				"Chn prep failed for port:%d\n", prep_ch.num);
-			return -ETIMEDOUT;
+				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
+			return ret;
 		}
 	}
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ddbeb00799e4..4e5290b083bf 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -67,6 +67,9 @@ enum {
 #define SDW_BLOCK_PACKG_PER_PORT	BIT(0)
 #define SDW_BLOCK_PACKG_PER_CH		BIT(1)
 
+/* Default interval to poll for DP prepare completion */
+#define SDW_DEFAULT_DP_PREP_POLL_US	500
+
 /**
  * enum sdw_slave_status - Slave status
  * @SDW_SLAVE_UNATTACHED: Slave is not attached with the bus.
@@ -295,6 +298,8 @@ struct sdw_dpn_audio_mode {
  * @simple_ch_prep_sm: If the port supports simplified channel prepare state
  * machine
  * @ch_prep_timeout: Port-specific timeout value, in milliseconds
+ * @ch_prep_poll_us: Interval to poll for CP_SM prepare completion. Zero means
+ *                   poll at SDW_DEFAULT_DP_PREP_POLL_US intervals.
  * @imp_def_interrupts: If set, each bit corresponds to support for
  * implementation-defined interrupts
  * @max_ch: Maximum channels supported
@@ -321,6 +326,7 @@ struct sdw_dpn_prop {
 	u32 max_grouping;
 	bool simple_ch_prep_sm;
 	u32 ch_prep_timeout;
+	u32 ch_prep_poll_us;
 	u32 imp_def_interrupts;
 	u32 max_ch;
 	u32 min_ch;
@@ -641,7 +647,6 @@ struct sdw_slave_ops {
  * @prop: Slave properties
  * @debugfs: Slave debugfs
  * @node: node for bus list
- * @port_ready: Port ready completion flag for each Slave port
  * @m_port_map: static Master port map for each Slave port
  * @dev_num: Current Device Number, values can be 0 or dev_num_sticky
  * @dev_num_sticky: one-time static Device Number assigned by Bus
@@ -673,7 +678,6 @@ struct sdw_slave {
 	struct dentry *debugfs;
 #endif
 	struct list_head node;
-	struct completion port_ready[SDW_MAX_PORTS];
 	unsigned int m_port_map[SDW_MAX_PORTS];
 	u16 dev_num;
 	u16 dev_num_sticky;
-- 
2.20.1

