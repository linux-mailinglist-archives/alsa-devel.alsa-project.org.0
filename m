Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30B7F1EE3
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 20:35:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E4011669;
	Wed,  6 Nov 2019 20:34:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E4011669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573068934;
	bh=sMzMbOv2xvEhN8mRxH05kBFd6UgSNZSdwy6WhjXm6co=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GGf2qsqIBpGv3UP/y0BHzp+UhWxAdKNmPDMJwKbAK3hpCO/8TwOdGP6qgIdD6KgFZ
	 NbOoaExE1RLIneycHiU8KABYA0eXMe68cAZ3xzvFuj+Ag2Je1gkBBsouBE1ooHOnn8
	 YtfJelx3JboKMztVbKGtqLxPUmFMMpc+dZ9UinJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5774CF8076B;
	Wed,  6 Nov 2019 20:23:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 544C0F806E7; Wed,  6 Nov 2019 20:22:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E372EF80673
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 20:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E372EF80673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 11:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="403835150"
Received: from vidhipat-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.33.70])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2019 11:22:47 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 13:22:17 -0600
Message-Id: <20191106192223.6003-14-pierre-louis.bossart@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v2 13/19] soundwire: bus: add
	initialization_complete signaling
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

init_completion() is called when the Slave device becomes unattached,
as done with enumeration_complete.

The difference with the enumeration_complete case is that complete()
is signaled when the Slave device is fully initialized after the
.update_status() callback is called.

A Slave device driver can decide to wait on either of the two
complete() cases, depending on its initialization code and
requirements.

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c   | 8 ++++++++
 drivers/soundwire/slave.c | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b18110726273..93856747b934 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -648,6 +648,7 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 			__func__, slave->dev_num);
 
 		init_completion(&slave->enumeration_complete);
+		init_completion(&slave->initialization_complete);
 
 	} else if (status == SDW_SLAVE_ATTACHED) {
 		dev_dbg(&slave->dev,
@@ -1050,6 +1051,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 {
 	enum sdw_slave_status prev_status;
 	struct sdw_slave *slave;
+	bool attached_initializing;
 	int i, ret = 0;
 
 	/* first check if any Slaves fell off the bus */
@@ -1095,6 +1097,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 		if (!slave)
 			continue;
 
+		attached_initializing = false;
+
 		switch (status[i]) {
 		case SDW_SLAVE_UNATTACHED:
 			if (slave->status == SDW_SLAVE_UNATTACHED)
@@ -1121,6 +1125,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			if (prev_status == SDW_SLAVE_ALERT)
 				break;
 
+			attached_initializing = true;
+
 			ret = sdw_initialize_slave(slave);
 			if (ret)
 				dev_err(bus->dev,
@@ -1139,6 +1145,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 		if (ret)
 			dev_err(slave->bus->dev,
 				"Update Slave status failed:%d\n", ret);
+		if (attached_initializing)
+			complete(&slave->initialization_complete);
 	}
 
 	return ret;
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 5c6c744e0713..543f4ddd9de0 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -52,6 +52,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	slave->bus = bus;
 	slave->status = SDW_SLAVE_UNATTACHED;
 	init_completion(&slave->enumeration_complete);
+	init_completion(&slave->initialization_complete);
 	slave->dev_num = 0;
 	init_completion(&slave->probe_complete);
 	slave->probed = false;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
