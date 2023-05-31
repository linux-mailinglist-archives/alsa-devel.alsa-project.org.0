Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C032717446
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 05:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC3A820;
	Wed, 31 May 2023 05:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC3A820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685503060;
	bh=cDPxAfvdGUM1tm5hvXaDY204P9qt4B3UxsBRfKyYP3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K3yQX2CuZuuCrb2Iul1xYp0oDkq/HKqPX3vJjORgl4EFpJcu+suTY0rOS7DIIU9LC
	 bzA4AWM7UCi73wb1AkgwzAhz3LDsHR1CxxoaZblBzkFbtCi+s/eTFXnoP/pitdKTz9
	 pXpapbdCWisALPElXfTTAznLSPlJxN5MsSif3qEg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CF63F8055C; Wed, 31 May 2023 05:16:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 749DBF80553;
	Wed, 31 May 2023 05:16:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EB2DF80528; Wed, 31 May 2023 05:15:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E546F8026A
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 05:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E546F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E8cW8vR4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685502943; x=1717038943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cDPxAfvdGUM1tm5hvXaDY204P9qt4B3UxsBRfKyYP3M=;
  b=E8cW8vR4L5BAtmkJt6TAfIuxQTEPQIJ4ok5sGTKQ8m+CVpXo4/Jz8APq
   RrHNxhRctM3maKXMkteUcSXIL+wsSxnLdfosJlbXyOBs0zFeTUujHIeA7
   4EEy/kDPUwImbSxHNSPLHp+eHeZiSc1ajnGylkiZULI3KoXrEZ8HE5lUj
   1HebgK25eeDNpsTkn111f4suGPSiH62jCsHxUCWTQOBLW6AA+JHrKCoth
   AOAehOaa4lbiUKGuyxnpclw2qpWvem8vDBSN3WhUZvAXdd076+R9EUtyH
   GxcNSAkELT/Fccis/wcr/eMT1pZyHdW36BW63ffPghu9iFzhMMXEXhbsn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357507662"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="357507662"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 20:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="739769514"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="739769514"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 20:15:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 2/4] soundwire: introduce SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY
Date: Wed, 31 May 2023 11:37:34 +0800
Message-Id: <20230531033736.792464-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OIHP6MIO5EAQUOQR7HF4PM7KGHYF5COF
X-Message-ID-Hash: OIHP6MIO5EAQUOQR7HF4PM7KGHYF5COF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIHP6MIO5EAQUOQR7HF4PM7KGHYF5COF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

This patch adds a new Device Number allocation strategy, with the IDA
used only for devices that are wake-capable.

"regular" devices such as amplifiers will use Device Numbers
[1..min_ida-1].

"wake-capable" devices such as jack or microphone codecs will use
Device Numbers [min_ida..11].

This hybrid strategy extends the number of supported devices in a
system by only constraining the allocation if required, e.g. in the
case of Intel LunarLake platforms the wake-capable devices are
required to have a unique address to use the HDaudio SDI and HDAudio
WAKEEN/WAKESTS registers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 26 +++++++++++++++++++++-----
 include/linux/soundwire/sdw.h |  4 ++++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index e8c1c55a2a73..6f465cce8369 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -159,7 +159,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
 
 	if (slave->dev_num) { /* clear dev_num if assigned */
 		clear_bit(slave->dev_num, bus->assigned);
-		if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA)
+		if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA ||
+		    (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY &&
+		     slave->prop.wake_capable))
 			ida_free(&sdw_peripheral_ida, slave->dev_num);
 	}
 	list_del_init(&slave->node);
@@ -699,17 +701,31 @@ EXPORT_SYMBOL(sdw_compare_devid);
 /* called with bus_lock held */
 static int sdw_get_device_num(struct sdw_slave *slave)
 {
+	struct sdw_bus *bus = slave->bus;
 	int bit;
 
-	if (slave->bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA) {
+	if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA ||
+	    (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY &&
+	     slave->prop.wake_capable)) {
 		bit = ida_alloc_range(&sdw_peripheral_ida,
-				      slave->bus->dev_num_ida_min, SDW_MAX_DEVICES,
+				      bus->dev_num_ida_min, SDW_MAX_DEVICES,
 				      GFP_KERNEL);
 		if (bit < 0)
 			goto err;
 	} else {
-		bit = find_first_zero_bit(slave->bus->assigned, SDW_MAX_DEVICES);
-		if (bit == SDW_MAX_DEVICES) {
+		int max_devices = SDW_MAX_DEVICES;
+
+		if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY &&
+		    !slave->prop.wake_capable) {
+			max_devices = bus->dev_num_ida_min - 1;
+
+			/* range check */
+			if (max_devices < 1 || max_devices > SDW_MAX_DEVICES)
+				return -EINVAL;
+		}
+
+		bit = find_first_zero_bit(bus->assigned, max_devices);
+		if (bit == max_devices) {
 			bit = -ENODEV;
 			goto err;
 		}
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 4656d6d0f3bb..8a7541ac735e 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -869,10 +869,14 @@ struct sdw_master_ops {
  * @SDW_DEV_NUM_ALLOC_DEFAULT: unconstrained first-come-first-serve allocation,
  * using range [1, 11]
  * @SDW_DEV_NUM_ALLOC_IDA: IDA-based allocation, using range [ida_min, 11]
+ * @SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY: Hybrid allocation where wake-capable devices rely on
+ * IDA-based allocation and range [ida_min, 11], while regular devices rely on default
+ * allocation in range [1, ida_min - 1]
  */
 enum sdw_dev_num_alloc {
 	SDW_DEV_NUM_ALLOC_DEFAULT = 0,
 	SDW_DEV_NUM_ALLOC_IDA,
+	SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY,
 };
 
 /**
-- 
2.25.1

