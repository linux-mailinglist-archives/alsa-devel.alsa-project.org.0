Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959971744D
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 05:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3631884A;
	Wed, 31 May 2023 05:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3631884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685503109;
	bh=ZpdxB1tn4u4OhUdxszyZlKy/CjHo5nh+Kt7t5DnOqAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BrZlw5E/GranuX6rU9uaHQFcA4oKjLeKqInR1c4F8fEcyncSwE7ABPfVQm6g52Jml
	 TzFfT3PQpET54VWbephj0WbNqCWJr+0RZskOf2KyGx4vH9d6XIGsHy6OO6Lochbx0k
	 shEvqRoVoLuxHHdRcAfQ3E6wphSQNAz0FhiIQ3H4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5752F80544; Wed, 31 May 2023 05:17:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79355F8042F;
	Wed, 31 May 2023 05:17:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2311FF800DF; Wed, 31 May 2023 05:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0056AF804FC
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 05:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0056AF804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EzUtO3cO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685502945; x=1717038945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZpdxB1tn4u4OhUdxszyZlKy/CjHo5nh+Kt7t5DnOqAw=;
  b=EzUtO3cO/PTpOEEpNFJtt8ZjQZfpuWGxmS9YYKH0jDLbA1Xx+hvZs/oW
   EQ3VFKUXY2RGJzxsBnT/7627pWLBEQl1LIvwLwTmvGCapdvZy1K/AHQHW
   7Ohjd74TM42YChWOwYdSXeP/j0k4dOstoFCFsLAcVEaJPDDhfxxNvICnD
   HFUXpNp3TRaLmok6gWN8a9l4YVRX/dmKSOAI2N6CwboqLN9kJIdEI7/7C
   J2PYktr4gbBaS5zwiHiVvRzi/mc56tYp7WfpuABE1U4xe3HbahSiPfbcn
   /55hM4hqg9yGDo5G5CeCuAK6Aj+ovGubjO1d7m0o3XD2pFm4TIfqJPu9j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357507684"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="357507684"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 20:15:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="739769540"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="739769540"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 20:15:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 4/4] soundwire: intel_auxdevice: use
 SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY
Date: Wed, 31 May 2023 11:37:36 +0800
Message-Id: <20230531033736.792464-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YS5GAL3T2ADQ2KUGAAP5TWXKTYC7VH32
X-Message-ID-Hash: YS5GAL3T2ADQ2KUGAAP5TWXKTYC7VH32
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YS5GAL3T2ADQ2KUGAAP5TWXKTYC7VH32/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Change the allocation strategy on Intel platforms to use Device Numbers

[1..5]: unconstrained allocation with bus-specific Device Numbers,
typically for amplifiers.

[6..11]: IDA-based system-unique Device Number to be used for
wake-capable devices such as jack codecs or microphone codecs.

These values were chosen based on the typical maximum number of
devices per link given electrical/PHY limitations. This configuration
will e.g. allow for 8 amplifiers on 2 links, and additional devices on
the remaining links.

Example on Dell SDCA device with jack codec, two amplifiers and one
microphone codec: only the jack codec relies on the IDA, others use
the same Device Number 1 on separate links.

rt711-sdca sdw:0:025d:0711:01: signaling enumeration completion for Slave 6
rt1316-sdca sdw:1:025d:1316:01: signaling enumeration completion for Slave 1
rt1316-sdca sdw:2:025d:1316:01: signaling enumeration completion for Slave 1
rt715-sdca sdw:3:025d:0714:01: signaling enumeration completion for Slave 1

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index c1df6f014e6b..917edc75ddfb 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -23,8 +23,12 @@
 #include "intel.h"
 #include "intel_auxdevice.h"
 
-/* IDA min selected to avoid conflicts with HDaudio/iDISP SDI values */
-#define INTEL_DEV_NUM_IDA_MIN           4
+/*
+ * IDA min selected to allow for 5 unconstrained devices per link,
+ * and 6 system-unique Device Numbers for wake-capable devices.
+ */
+
+#define INTEL_DEV_NUM_IDA_MIN           6
 
 #define INTEL_MASTER_SUSPEND_DELAY_MS	3000
 
@@ -66,9 +70,20 @@ static void generic_new_peripheral_assigned(struct sdw_bus *bus,
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	int min_dev = 1;
+	int max_dev = SDW_MAX_DEVICES;
+
+	if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA) {
+		min_dev = INTEL_DEV_NUM_IDA_MIN;
+	} else if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY) {
+		if (slave->prop.wake_capable)
+			min_dev = INTEL_DEV_NUM_IDA_MIN;
+		else
+			max_dev = INTEL_DEV_NUM_IDA_MIN - 1;
+	}
 
 	/* paranoia check, this should never happen */
-	if (dev_num < INTEL_DEV_NUM_IDA_MIN || dev_num > SDW_MAX_DEVICES)  {
+	if (dev_num < min_dev || dev_num > max_dev)  {
 		dev_err(bus->dev, "%s: invalid dev_num %d\n", __func__, dev_num);
 		return;
 	}
@@ -167,7 +182,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 	cdns->msg_count = 0;
 
 	bus->link_id = auxdev->id;
-	bus->dev_num_alloc = SDW_DEV_NUM_ALLOC_IDA;
+	bus->dev_num_alloc = SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY;
 	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
 	bus->clk_stop_timeout = 1;
 
-- 
2.25.1

