Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BB9717447
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 05:17:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69326839;
	Wed, 31 May 2023 05:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69326839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685503067;
	bh=GccidoCGBBrPr39HCfpwoXhpbs9LH6bwAbwZCyps1i8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m0SkG30oPpfe/+EM97APQndqtc5hWcW4YrOnNhFdZ4ZzEcbMNsxaeHNkGnYeA9DIy
	 UeNjHIS9D7icZH90YDvopQvS+NF37YrdZuXWpNW2meZWCcu1AhspVHEeyHxS3Uy2Pp
	 4tPcNRFIRqJD2lS/roZCXUMzRHPmatMEAxNQ6W/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D9CCF80564; Wed, 31 May 2023 05:16:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE2AFF80558;
	Wed, 31 May 2023 05:16:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3517F80086; Wed, 31 May 2023 05:16:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 119C6F80086
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 05:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 119C6F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T7Pm8uTT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685502942; x=1717038942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GccidoCGBBrPr39HCfpwoXhpbs9LH6bwAbwZCyps1i8=;
  b=T7Pm8uTTs+cb9ETeOqpeIG2IPSYjA5CxEPjI9G7aYvw46VO2QvB8+30P
   fRK84xxLe3KIRdxr5EUowEh6Yg15H90/8cU5P3wXwA6AW7JdjV7FLG+lJ
   T6GCt8byy+Cq1Xl8fzWG+6QXC+YYR4O6Wkr2LKr4o72L4TeLChpb+2A9w
   455ej+yJb4u5jlsyBmYq/kaCiiZ2/imlxekgSLpm8L4Ej9cremZUMgKRa
   58zTEJMiz3cHfiISOIIHTIas3johhomfJnOdX4rFYp8+fUFNLlQYsUMX6
   qMud4cspzCCCIPybq4anqVWL0DxITXo1LmWKtd6sygWi78vCrrJ5TUddY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357507656"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="357507656"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 20:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="739769481"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="739769481"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 20:15:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/4] soundwire: add enum to control device number allocation
Date: Wed, 31 May 2023 11:37:33 +0800
Message-Id: <20230531033736.792464-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G6QBNUJJROXTX6MFOWESUQ2MITAGCVYX
X-Message-ID-Hash: G6QBNUJJROXTX6MFOWESUQ2MITAGCVYX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6QBNUJJROXTX6MFOWESUQ2MITAGCVYX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Commit c60561014257 ("soundwire: bus: allow device number to be unique
at system level") introduced two strategies to allocate device
numbers.

a) a default unconstrained allocation, where each bus can allocate
Device Numbers independently.

b) an ida-based allocation. In this case each Device Number will be
unique at the system-level.

The IDA-based allocation is useful to simplify debug, but it was also
introduced as a prerequisite to deal with the Intel Lunar Lake
hardware programming sequences: the wake-ups have to be handled with a
system-unique SDI address at the HDaudio controller level.

At the time, the restriction introduced by the IDA to 8 devices total
seemed perfectly fine, but recently hardware vendors created
configurations with more than 8 devices.

This patch provides an iso-functionality change, with the allocation
selected with an enum instead of an 'ida_min' value. Follow-up patches
will add a new allocation strategy to allow for more than 8 devices
using information on the type of devices, and only use the IDA-based
allocation for devices capable of generating a wake.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c             |  4 ++--
 drivers/soundwire/intel_auxdevice.c |  1 +
 include/linux/soundwire/sdw.h       | 16 +++++++++++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b44f8d0affa6..e8c1c55a2a73 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -159,7 +159,7 @@ static int sdw_delete_slave(struct device *dev, void *data)
 
 	if (slave->dev_num) { /* clear dev_num if assigned */
 		clear_bit(slave->dev_num, bus->assigned);
-		if (bus->dev_num_ida_min)
+		if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA)
 			ida_free(&sdw_peripheral_ida, slave->dev_num);
 	}
 	list_del_init(&slave->node);
@@ -701,7 +701,7 @@ static int sdw_get_device_num(struct sdw_slave *slave)
 {
 	int bit;
 
-	if (slave->bus->dev_num_ida_min) {
+	if (slave->bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA) {
 		bit = ida_alloc_range(&sdw_peripheral_ida,
 				      slave->bus->dev_num_ida_min, SDW_MAX_DEVICES,
 				      GFP_KERNEL);
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 0daa6ca9a224..30f3d2ab80fd 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -165,6 +165,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 	cdns->msg_count = 0;
 
 	bus->link_id = auxdev->id;
+	bus->dev_num_alloc = SDW_DEV_NUM_ALLOC_IDA;
 	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
 	bus->clk_stop_timeout = 1;
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index c076a3f879b3..4656d6d0f3bb 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -864,6 +864,17 @@ struct sdw_master_ops {
 	void (*new_peripheral_assigned)(struct sdw_bus *bus, int dev_num);
 };
 
+/**
+ * enum sdw_dev_num_alloc - Device Number allocation strategies
+ * @SDW_DEV_NUM_ALLOC_DEFAULT: unconstrained first-come-first-serve allocation,
+ * using range [1, 11]
+ * @SDW_DEV_NUM_ALLOC_IDA: IDA-based allocation, using range [ida_min, 11]
+ */
+enum sdw_dev_num_alloc {
+	SDW_DEV_NUM_ALLOC_DEFAULT = 0,
+	SDW_DEV_NUM_ALLOC_IDA,
+};
+
 /**
  * struct sdw_bus - SoundWire bus
  * @dev: Shortcut to &bus->md->dev to avoid changing the entire code.
@@ -895,9 +906,11 @@ struct sdw_master_ops {
  * meaningful if multi_link is set. If set to 1, hardware-based
  * synchronization will be used even if a stream only uses a single
  * SoundWire segment.
+ * @dev_num_alloc: bus-specific device number allocation
  * @dev_num_ida_min: if set, defines the minimum values for the IDA
  * used to allocate system-unique device numbers. This value needs to be
- * identical across all SoundWire bus in the system.
+ * identical across all SoundWire bus in the system. Only used if @sdw_num_alloc
+ * is not default.
  */
 struct sdw_bus {
 	struct device *dev;
@@ -922,6 +935,7 @@ struct sdw_bus {
 	u32 bank_switch_timeout;
 	bool multi_link;
 	int hw_sync_min_links;
+	enum sdw_dev_num_alloc dev_num_alloc;
 	int dev_num_ida_min;
 };
 
-- 
2.25.1

