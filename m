Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE0172B8B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 23:38:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767631685;
	Thu, 27 Feb 2020 23:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767631685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582843103;
	bh=y8SacCxTjk8VJzJNDLjXrQIe7Ton5BaqLu9iEus3Gmw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D1gT8D+eh4aaQ3X8Am0DKOp4wZczvLUAEAE0qJ5qnYD8M0qlcITojxbtRqesviwqB
	 f14wRCa6Us2apnVFvkFJscJ05asR7P2Tjnpuu2VfkoPUdboOlsggxhpHvlCy6uKKxF
	 fK0p4vBljDEETx86P+SQiUc6BVSglivCyBIK5VEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D73FF802E0;
	Thu, 27 Feb 2020 23:32:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA161F802A2; Thu, 27 Feb 2020 23:32:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 773A0F8028C
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 23:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 773A0F8028C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 14:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="411194879"
Received: from azeira-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.147.250])
 by orsmga005.jf.intel.com with ESMTP; 27 Feb 2020 14:32:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/8] soundwire: intel: add wake interrupt support
Date: Thu, 27 Feb 2020 16:32:05 -0600
Message-Id: <20200227223206.5020-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

When system is suspended in clock stop mode on intel platforms, both
master and slave are in clock stop mode and soundwire bus is taken
over by a glue hardware. The bus message for jack event is processed
by this glue hardware, which will trigger an interrupt to resume audio
pci device. Then audio pci driver will resume soundwire master and slave,
transfer bus ownership to master, finally slave will report jack event
to master and codec driver is triggered to check jack status.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c      | 45 ++++++++++++++++++++++++++++++++++
 drivers/soundwire/intel_init.c | 12 +++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index eafa2016c76d..4cc6c857dd09 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1255,6 +1255,50 @@ static int intel_master_remove(struct sdw_master_device *md)
 	return 0;
 }
 
+static int intel_master_process_wakeen_event(struct sdw_master_device *md)
+{
+	struct sdw_intel *sdw;
+	struct sdw_slave *slave;
+	struct sdw_bus *bus;
+	void __iomem *shim;
+	u16 wake_sts;
+
+	sdw = md->pdata;
+
+	if (sdw->cdns.bus.prop.hw_disabled) {
+		dev_info(&md->dev,
+			 "SoundWire master %d is disabled, ignoring\n",
+			 sdw->cdns.bus.link_id);
+		return 0;
+	}
+
+	shim = sdw->link_res->shim;
+	wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
+
+	if (!(wake_sts & BIT(sdw->instance)))
+		return 0;
+
+	/* disable WAKEEN interrupt ASAP to prevent interrupt flood */
+	intel_shim_wake(sdw, false);
+
+	bus = &sdw->cdns.bus;
+
+	/*
+	 * wake up master and slave so that slave can notify master
+	 * the wakeen event and let codec driver check codec status
+	 */
+	list_for_each_entry(slave, &bus->slaves, node) {
+		if (slave->prop.wake_capable) {
+			if (slave->status != SDW_SLAVE_ATTACHED &&
+			    slave->status != SDW_SLAVE_ALERT)
+				continue;
+
+			pm_request_resume(&slave->dev);
+		}
+	}
+
+	return 0;
+}
 
 static struct sdw_master_driver intel_sdw_driver = {
 	.driver = {
@@ -1265,6 +1309,7 @@ static struct sdw_master_driver intel_sdw_driver = {
 	.probe = intel_master_probe,
 	.startup = intel_master_startup,
 	.remove = intel_master_remove,
+	.process_wake_event = intel_master_process_wakeen_event,
 };
 module_sdw_master_driver(intel_sdw_driver);
 
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 954b21b4712d..91ec91127f2a 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -413,5 +413,17 @@ void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 }
 EXPORT_SYMBOL_NS(sdw_intel_exit, SOUNDWIRE_INTEL_INIT);
 
+void sdw_intel_process_wakeen_event(struct sdw_intel_ctx *ctx)
+{
+	struct sdw_intel_link_res *link;
+
+	if (!ctx->links)
+		return;
+
+	list_for_each_entry(link, &ctx->link_list, list)
+		sdw_master_device_process_wake_event(link->md);
+}
+EXPORT_SYMBOL_NS(sdw_intel_process_wakeen_event, SOUNDWIRE_INTEL_INIT);
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("Intel Soundwire Init Library");
-- 
2.20.1

