Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDFE13B674
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 01:13:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31827178B;
	Wed, 15 Jan 2020 01:12:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31827178B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579047181;
	bh=QhZixX70pHDv0g6/fJdTJTueK06/C4Yw+TA3boz3kFc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U6nGK8JMowj88ac9vVEy33ePovH7uSY9tKV8h7EmWeWEnC2e5RdpPNAJoQ4v4aDGP
	 +EPL+5wcCiaSLT8drpZYcG+JzWAkbuVvJ+Knt7urkFGoT+PoPTxMsCxBpkb/oST2iR
	 okHXw/NrdqeOOOx2ltpZMCpC0uceJMd4AYmEWqDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E2F8F80273;
	Wed, 15 Jan 2020 01:09:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48B58F8014D; Wed, 15 Jan 2020 01:09:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E80B7F800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 01:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E80B7F800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 16:09:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="273468548"
Received: from emkilgox-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.0.151])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2020 16:09:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 14 Jan 2020 18:08:36 -0600
Message-Id: <20200115000844.14695-3-pierre-louis.bossart@linux.intel.com>
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
Subject: [alsa-devel] [PATCH 02/10] soundwire: bus: fix race condition with
	enumeration_complete signaling
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

This patch adds the signaling needed for Slave drivers to wait until
the enumeration completes so that race conditions when issuing
read/write commands are avoided. The calls for wait_for_completion()
will be added in codec drivers in follow-up patches.

The order between init_completion() and complete() is deterministic,
the Slave is marked as UNATTACHED either during a Master-initiated
HardReset, or when the hardware detects the Slave no longer reports as
ATTACHED.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c   | 20 ++++++++++++++++++++
 drivers/soundwire/slave.c |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4980dfd6f3a3..a2267c3a1d2d 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -610,6 +610,26 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 				    enum sdw_slave_status status)
 {
 	mutex_lock(&slave->bus->bus_lock);
+
+	dev_vdbg(&slave->dev,
+		 "%s: changing status slave %d status %d new status %d\n",
+		 __func__, slave->dev_num, slave->status, status);
+
+	if (status == SDW_SLAVE_UNATTACHED) {
+		dev_dbg(&slave->dev,
+			"%s: initializing completion for Slave %d\n",
+			__func__, slave->dev_num);
+
+		init_completion(&slave->enumeration_complete);
+
+	} else if ((status == SDW_SLAVE_ATTACHED) &&
+		   (slave->status == SDW_SLAVE_UNATTACHED)) {
+		dev_dbg(&slave->dev,
+			"%s: signaling completion for Slave %d\n",
+			__func__, slave->dev_num);
+
+		complete(&slave->enumeration_complete);
+	}
 	slave->status = status;
 	mutex_unlock(&slave->bus->bus_lock);
 }
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 08db0488e02d..e767a78066ee 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -46,6 +46,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	slave->dev.of_node = of_node_get(to_of_node(fwnode));
 	slave->bus = bus;
 	slave->status = SDW_SLAVE_UNATTACHED;
+	init_completion(&slave->enumeration_complete);
 	slave->dev_num = 0;
 	init_completion(&slave->probe_complete);
 	slave->probed = false;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
