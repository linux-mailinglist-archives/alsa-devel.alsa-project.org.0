Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D496FCD77
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:26:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 217691682;
	Thu, 14 Nov 2019 19:26:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 217691682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573756014;
	bh=5f73kJ2DEO025QfyIf9Lope4KlEoLnzjLPFfkVvmtE8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZTJkxUwA4FQjPcKiSA0WDms5lS5gaeqoUL8P6J1OHZDEHkREZ3rY6Zcr13M1Q4X7S
	 9sfuCl2MkSMMQVGTlipdDbI+48QLv8IrJj1hGNNChtPbXYufymk2V+GCBLL8S2SKPj
	 XuKtyCZiETvSLzXy9/1P5lSNEea7qt4QSpNAGtcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A718FF8020B;
	Thu, 14 Nov 2019 19:18:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D556F8011E; Thu, 14 Nov 2019 19:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42EC3F8010D
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42EC3F8010D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="195123499"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2019 10:17:49 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 12:16:52 -0600
Message-Id: <20191114181702.22254-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
References: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 12/22] soundwire: bus: fix race condition
	with enumeration_complete signaling
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
 drivers/soundwire/bus.c   | 19 +++++++++++++++++++
 drivers/soundwire/slave.c |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 9f03a915a09a..e34b5ed534b3 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -637,6 +637,25 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
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
+	} else if (status == SDW_SLAVE_ATTACHED) {
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
index 15ac89ecae01..76fdfbd8b50d 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -52,6 +52,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	slave->dev.type = &sdw_slave_type;
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
