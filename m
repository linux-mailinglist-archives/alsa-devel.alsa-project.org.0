Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A616EC0C
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 18:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 533CA1684;
	Tue, 25 Feb 2020 18:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 533CA1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582650276;
	bh=fWjU7DMJ29NvdGa5YpLMFzVPfhqJtW1bBL4gaNdR0xI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LBdhRy1a4rYg9b+jvWpVj1HO8/vsHF9lkVR+c2MsUhiknYaqxNUHp8ugSIYE4ek22
	 RkYKhfmwpV5wBEW+jibHiBoQaTY6EZbzAkOjLdG0/FBGQ0Lxhf3gtrWyAZr/ljQUAd
	 fYxiK0KkWth+iEoWFIvhI7cAq3bpHkmNLUCz3cbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C384F8028E;
	Tue, 25 Feb 2020 18:01:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7D0AF8028B; Tue, 25 Feb 2020 18:01:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 739AEF80161
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 18:01:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 739AEF80161
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 09:01:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="317139738"
Received: from sorin-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.45.43])
 by orsmga001.jf.intel.com with ESMTP; 25 Feb 2020 09:01:01 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] soundwire: add helper macros for devID fields
Date: Tue, 25 Feb 2020 11:00:41 -0600
Message-Id: <20200225170041.23644-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225170041.23644-1-pierre-louis.bossart@linux.intel.com>
References: <20200225170041.23644-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

Move bit extractors to macros, so that the definitions can be used by
other drivers parsing the MIPI definitions extracted from firmware
tables (ACPI or DT).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c       | 21 +++++----------------
 include/linux/soundwire/sdw.h | 23 +++++++++++++++++++++++
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b8a7a84aca1c..01be7220d117 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -589,22 +589,11 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
 {
 	dev_dbg(bus->dev, "SDW Slave Addr: %llx\n", addr);
 
-	/*
-	 * Spec definition
-	 *   Register		Bit	Contents
-	 *   DevId_0 [7:4]	47:44	sdw_version
-	 *   DevId_0 [3:0]	43:40	unique_id
-	 *   DevId_1		39:32	mfg_id [15:8]
-	 *   DevId_2		31:24	mfg_id [7:0]
-	 *   DevId_3		23:16	part_id [15:8]
-	 *   DevId_4		15:08	part_id [7:0]
-	 *   DevId_5		07:00	class_id
-	 */
-	id->sdw_version = (addr >> 44) & GENMASK(3, 0);
-	id->unique_id = (addr >> 40) & GENMASK(3, 0);
-	id->mfg_id = (addr >> 24) & GENMASK(15, 0);
-	id->part_id = (addr >> 8) & GENMASK(15, 0);
-	id->class_id = addr & GENMASK(7, 0);
+	id->sdw_version = SDW_VERSION(addr);
+	id->unique_id = SDW_UNIQUE_ID(addr);
+	id->mfg_id = SDW_MFG_ID(addr);
+	id->part_id = SDW_PART_ID(addr);
+	id->class_id = SDW_CLASS_ID(addr);
 
 	dev_dbg(bus->dev,
 		"SDW Slave class_id %x, part_id %x, mfg_id %x, unique_id %x, version %x\n",
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b8427df034ce..ee349a4c5349 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -439,6 +439,29 @@ struct sdw_slave_id {
 	__u8 sdw_version:4;
 };
 
+/*
+ * Helper macros to extract the MIPI-defined IDs
+ *
+ * Spec definition
+ *   Register		Bit	Contents
+ *   DevId_0 [7:4]	47:44	sdw_version
+ *   DevId_0 [3:0]	43:40	unique_id
+ *   DevId_1		39:32	mfg_id [15:8]
+ *   DevId_2		31:24	mfg_id [7:0]
+ *   DevId_3		23:16	part_id [15:8]
+ *   DevId_4		15:08	part_id [7:0]
+ *   DevId_5		07:00	class_id
+ *
+ * The MIPI DisCo for SoundWire defines in addition the link_id as bits 51:48
+ */
+
+#define SDW_DISCO_LINK_ID(adr)	(((adr) >> 48) & GENMASK(3, 0))
+#define SDW_VERSION(adr)	(((adr) >> 44) & GENMASK(3, 0))
+#define SDW_UNIQUE_ID(adr)	(((adr) >> 40) & GENMASK(3, 0))
+#define SDW_MFG_ID(adr)		(((adr) >> 24) & GENMASK(15, 0))
+#define SDW_PART_ID(adr)	(((adr) >> 8) & GENMASK(15, 0))
+#define SDW_CLASS_ID(adr)	((adr) & GENMASK(7, 0))
+
 /**
  * struct sdw_slave_intr_status - Slave interrupt status
  * @control_port: control port status
-- 
2.20.1

