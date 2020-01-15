Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF51E13B67D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 01:15:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76DDE1657;
	Wed, 15 Jan 2020 01:14:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76DDE1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579047336;
	bh=B5MfYlEbhuolxnUo78RqYxD5Ai6fzsVctNiUKMtJuwk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oqMyLzG8u592k+DEhIuueJZ9wNYXCaq7Y8O+yT1WZtPWRiyjqXG792oG6Yu7mM0I3
	 dwuP18xS1Xwl9vrnlJMyh0h8yTvXOil5OGuHeXP2hdgXV2+32nyLA1sUICwC0u5QHu
	 DUEYoEnI+W7EEeBTi2MD/aJc+cFeuXdg4OcWEcsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDE3F80299;
	Wed, 15 Jan 2020 01:10:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 012C7F80290; Wed, 15 Jan 2020 01:09:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFFF0F8027D
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 01:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFFF0F8027D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 16:09:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="273468575"
Received: from emkilgox-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.0.151])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2020 16:09:48 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 14 Jan 2020 18:08:40 -0600
Message-Id: <20200115000844.14695-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115000844.14695-1-pierre-louis.bossart@linux.intel.com>
References: <20200115000844.14695-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 06/10] soundwire: bus: add helper to clear
	Slave status to UNATTACHED
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

When resuming with a bus reset, we need to re-enumerate and restart
from UNATTACHED. The helper added in this patch helps implement a more
robust state machine avoiding race conditions on resume.

The unattach request is stored and will be used by Slave drivers, if
needed: Intel validation exposed a corner case where the Slave device
may transition to D3 when streaming stops, but streaming restarts
before the Master transitions to D3. In that case, the Slave status
was not cleared as UNATTACHED by the Master resuming, and the
wait_for_completion will time out.

When the slave resumes, it can check if a Master-initiated
re-enumeration and initialization took place and skip the
wait_for_completion() if there is no reason to wait.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c | 27 +++++++++++++++++++++++++++
 drivers/soundwire/bus.h |  8 ++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index dfe27e3ca815..57dec61142e5 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1163,3 +1163,30 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 	return ret;
 }
 EXPORT_SYMBOL(sdw_handle_slave_status);
+
+void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
+{
+	struct sdw_slave *slave;
+	int i;
+
+	/* Check all non-zero devices */
+	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
+		mutex_lock(&bus->bus_lock);
+		if (test_bit(i, bus->assigned) == false) {
+			mutex_unlock(&bus->bus_lock);
+			continue;
+		}
+		mutex_unlock(&bus->bus_lock);
+
+		slave = sdw_get_slave(bus, i);
+		if (!slave)
+			continue;
+
+		if (slave->status != SDW_SLAVE_UNATTACHED)
+			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
+
+		/* keep track of request, used in pm_runtime resume */
+		slave->unattach_request = request;
+	}
+}
+EXPORT_SYMBOL(sdw_clear_slave_status);
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index acb8d11a4c84..204204a26db8 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -165,4 +165,12 @@ sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
 	return sdw_write(slave, addr, tmp);
 }
 
+/*
+ * At the moment we only track Master-initiated hw_reset.
+ * Additional fields can be added as needed
+ */
+#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
+
+void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
+
 #endif /* __SDW_BUS_H */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
