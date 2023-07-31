Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F53C7690AE
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 10:47:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C9F6C0;
	Mon, 31 Jul 2023 10:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C9F6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690793253;
	bh=q8SJvmTRN/QrgEBLtmSIU3TUp+MWJ40CCg6CQ8CCKx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WYaOCKsztfkoYDA6fgZ2i/OWynKp+CLfx/O0Wm43JNAmUDd6GPsyteaeZ0hCH2p2X
	 N+YBKm05hOfJV3ou/dV3+/wkBtfrhzbcuSAhPIXbkrL2v/ybKmuUDjvXClbVOz4mB2
	 YyMuWoxjWx4OmeUWE/GMHIrXD1Mogz7864kRdaFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92EEEF80163; Mon, 31 Jul 2023 10:45:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52DFEF80579;
	Mon, 31 Jul 2023 10:45:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19ADBF8055C; Mon, 31 Jul 2023 10:45:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 288B7F80163
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 10:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 288B7F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XPYF09tZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690793131; x=1722329131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q8SJvmTRN/QrgEBLtmSIU3TUp+MWJ40CCg6CQ8CCKx0=;
  b=XPYF09tZObQ9Jk/cjTwhNzv/IEk0evfSigBooWCA3fFTw3oCcyTi2qmO
   p4uJC6hx7o1dZkXrS6oIMVKAIrWTPV6PD08lJ+BWRTp7QvfxU0odcLtti
   1E/CRR3xq3sXfMH6mCxA2q79os2YV/XvkpiwGmlrX/XfyszpolxCWTHBA
   zS1ZS82B74WbTH5SGoLuhMUiXKcPEPmQsevUSusvO8Pj7qf/49AVaKJev
   fHE4WXKirsiu4dxvTh18dMj5T9F521ZRokV5LYEmOGYM1qIW7TOvGzkni
   ZOReYT7byJfmwHS2YSK2BjCFeElJEaH2MpcldgER7iM61rtC51qgfXDhR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348557536"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="348557536"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 01:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678232351"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="678232351"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 01:45:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 3/3] soundwire: intel_auxdevice: add hybrid IDA-based
 device_number allocation
Date: Mon, 31 Jul 2023 17:13:33 +0800
Message-Id: <20230731091333.3593132-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731091333.3593132-1-yung-chuan.liao@linux.intel.com>
References: <20230731091333.3593132-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q7MJF34O6RVWIY7JQ5QK7WPP53SQHYKD
X-Message-ID-Hash: Q7MJF34O6RVWIY7JQ5QK7WPP53SQHYKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7MJF34O6RVWIY7JQ5QK7WPP53SQHYKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The IDA-based allocation is useful to simplify debug, but it was also
introduced as a prerequisite to deal with the Intel Lunar Lake
hardware programming sequences: the wake-ups have to be handled with a
system-unique SDI address at the HDaudio controller level.

At the time, the restriction introduced by the IDA to 8 devices total
seemed perfectly fine, but recently hardware vendors created
configurations with more than 8 devices.

Add a new allocation strategy to allow for more than 8 devices using
information on the type of devices, and only use the IDA-based
allocation for devices capable of generating a wake.

In theory the information on wake capabilities should come from
firmware, but none of the existing ACPI tables provide it. The drivers
set the 'wake_capable' property, but this cannot be used reliably: if
the driver probe happens *after* the enumeration, then that property
is not initialized yet. Trying to modify the device_number on-the-fly
proved to be an impossible task generating race conditions left and
right.

The only reliable work-around to control the enumeration is to add a
quirk table. It's ugly but until platform firmware improves, hopefully as a
result of MIPI/SDCA stardization, we can expect that quirk table to
grow for each new headset or microphone codec.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 72 +++++++++++++++++++++++++----
 include/linux/soundwire/sdw_intel.h |  7 +++
 2 files changed, 69 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 9d998a010162..238025a0e35c 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -23,9 +23,6 @@
 #include "intel.h"
 #include "intel_auxdevice.h"
 
-/* IDA min selected to avoid conflicts with HDaudio/iDISP SDI values */
-#define INTEL_DEV_NUM_IDA_MIN           4
-
 #define INTEL_MASTER_SUSPEND_DELAY_MS	3000
 
 /*
@@ -44,6 +41,39 @@ static int md_flags;
 module_param_named(sdw_md_flags, md_flags, int, 0444);
 MODULE_PARM_DESC(sdw_md_flags, "SoundWire Intel Master device flags (0x0 all off)");
 
+struct wake_capable_part {
+	const u16 mfg_id;
+	const u16 part_id;
+};
+
+static struct wake_capable_part wake_capable_list[] = {
+	{0x025d, 0x5682},
+	{0x025d, 0x700},
+	{0x025d, 0x711},
+	{0x025d, 0x1712},
+	{0x025d, 0x1713},
+	{0x025d, 0x1716},
+	{0x025d, 0x1717},
+	{0x025d, 0x712},
+	{0x025d, 0x713},
+	{0x025d, 0x714},
+	{0x025d, 0x715},
+	{0x025d, 0x716},
+	{0x025d, 0x717},
+	{0x025d, 0x722},
+};
+
+static bool is_wake_capable(struct sdw_slave *slave)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(wake_capable_list); i++)
+		if (slave->id.part_id == wake_capable_list[i].part_id &&
+		    slave->id.mfg_id == wake_capable_list[i].mfg_id)
+			return true;
+	return false;
+}
+
 static int generic_pre_bank_switch(struct sdw_bus *bus)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
@@ -66,14 +96,26 @@ static void generic_new_peripheral_assigned(struct sdw_bus *bus,
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	int dev_num_min;
+	int dev_num_max;
+	bool wake_capable = slave->prop.wake_capable || is_wake_capable(slave);
+
+	if (wake_capable) {
+		dev_num_min = SDW_INTEL_DEV_NUM_IDA_MIN;
+		dev_num_max = SDW_MAX_DEVICES;
+	} else {
+		dev_num_min = 1;
+		dev_num_max = SDW_INTEL_DEV_NUM_IDA_MIN - 1;
+	}
 
 	/* paranoia check, this should never happen */
-	if (dev_num < INTEL_DEV_NUM_IDA_MIN || dev_num > SDW_MAX_DEVICES)  {
-		dev_err(bus->dev, "%s: invalid dev_num %d\n", __func__, dev_num);
+	if (dev_num < dev_num_min || dev_num > dev_num_max)  {
+		dev_err(bus->dev, "%s: invalid dev_num %d, wake supported %d\n",
+			__func__, dev_num, slave->prop.wake_capable);
 		return;
 	}
 
-	if (sdw->link_res->hw_ops->program_sdi)
+	if (sdw->link_res->hw_ops->program_sdi && wake_capable)
 		sdw->link_res->hw_ops->program_sdi(sdw, dev_num);
 }
 
@@ -129,14 +171,24 @@ static DEFINE_IDA(intel_peripheral_ida);
 
 static int intel_get_device_num_ida(struct sdw_bus *bus, struct sdw_slave *slave)
 {
-	return ida_alloc_range(&intel_peripheral_ida,
-			       INTEL_DEV_NUM_IDA_MIN, SDW_MAX_DEVICES,
-			       GFP_KERNEL);
+	int bit;
+
+	if (slave->prop.wake_capable || is_wake_capable(slave))
+		return ida_alloc_range(&intel_peripheral_ida,
+				       SDW_INTEL_DEV_NUM_IDA_MIN, SDW_MAX_DEVICES,
+				       GFP_KERNEL);
+
+	bit = find_first_zero_bit(slave->bus->assigned, SDW_MAX_DEVICES);
+	if (bit == SDW_MAX_DEVICES)
+		return -ENODEV;
+
+	return bit;
 }
 
 static void intel_put_device_num_ida(struct sdw_bus *bus, struct sdw_slave *slave)
 {
-	return ida_free(&intel_peripheral_ida, slave->dev_num);
+	if (slave->prop.wake_capable || is_wake_capable(slave))
+		ida_free(&intel_peripheral_ida, slave->dev_num);
 }
 
 static struct sdw_master_ops sdw_intel_ops = {
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 11fc88fb0d78..3a824cae7379 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -433,4 +433,11 @@ struct sdw_intel_hw_ops {
 extern const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops;
 extern const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops;
 
+/*
+ * IDA min selected to allow for 5 unconstrained devices per link,
+ * and 6 system-unique Device Numbers for wake-capable devices.
+ */
+
+#define SDW_INTEL_DEV_NUM_IDA_MIN           6
+
 #endif
-- 
2.25.1

