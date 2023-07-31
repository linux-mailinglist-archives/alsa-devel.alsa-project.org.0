Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 047047690AD
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 10:47:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD34184A;
	Mon, 31 Jul 2023 10:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD34184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690793241;
	bh=u6mmbSMHH8jP59to7FzadHeajz1BccvQWhym7sQFvGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gC66zvAML0nD00Hidjqk6F+K4T04jaEoPbG002jtQgv8kw1e9XbDd4rTorWgKDlEl
	 nzvlQEpKY0kk/1V+GGgo7odmbAEMyac96uJrJx3Sl76W5onGRXTQM+Z0pyqU7tj3UQ
	 8oLPD6BCHwtuNUVDAynWFq1RoNqFWZOU3IRmhTs4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36112F80564; Mon, 31 Jul 2023 10:45:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC48FF8055B;
	Mon, 31 Jul 2023 10:45:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F6E2F80563; Mon, 31 Jul 2023 10:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1BCBF80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 10:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1BCBF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TP6aBM9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690793129; x=1722329129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u6mmbSMHH8jP59to7FzadHeajz1BccvQWhym7sQFvGo=;
  b=TP6aBM9dylrPQOqYfHfklCAwgDaN72EP6rKan9lJOehpvL80ofwa7pUl
   ev+mgkPiF6gvofReFOaSZFAhAMtNsxou2vJa3PciThCHR0kDIgosFKlc4
   s6fwFwK43lnhROoHi3taGN4mhwAbYBwAjFqBqBR96vuGtnXEW3SF+oQyt
   vJgPZACHS9lkZpLYxUheRq7hcwEoeMaEEWtgf75GRqX6VN9uGHf+YrOeR
   JqoqduCspJm7N6+judBWOluejpnapeooQMNEijltb6vRsrxZ+Kk5vjtxr
   W/9r58TFU1cfrf9ZOzXVWOiH1Sazy+t8OS7md8uW5uaqO7zXT8cRQadoI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348557487"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="348557487"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 01:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678232312"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="678232312"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 01:45:23 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 2/3] soundwire: bus: add callbacks for device_number
 allocation
Date: Mon, 31 Jul 2023 17:13:32 +0800
Message-Id: <20230731091333.3593132-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731091333.3593132-1-yung-chuan.liao@linux.intel.com>
References: <20230731091333.3593132-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C2BICRYAECJAIGZLGWRYNKOZGR5RFL4N
X-Message-ID-Hash: C2BICRYAECJAIGZLGWRYNKOZGR5RFL4N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2BICRYAECJAIGZLGWRYNKOZGR5RFL4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Rather than add logic in the core for vendor-specific usages, add
callbacks for vendor-specific device_number allocation and release.

This patch only moves the existing IDA-based allocator used only by
Intel to the intel_auxdevice.c file and does not change the
functionality. Follow-up patches will extend the behavior by modifying
the Intel callbacks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c             | 16 +++++++---------
 drivers/soundwire/intel_auxdevice.c | 17 ++++++++++++++++-
 include/linux/soundwire/sdw.h       |  8 ++++----
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index bdd0fed45a8d..0e1e4bedc708 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -12,7 +12,6 @@
 #include "sysfs_local.h"
 
 static DEFINE_IDA(sdw_bus_ida);
-static DEFINE_IDA(sdw_peripheral_ida);
 
 static int sdw_get_id(struct sdw_bus *bus)
 {
@@ -168,8 +167,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 
 	if (slave->dev_num) { /* clear dev_num if assigned */
 		clear_bit(slave->dev_num, bus->assigned);
-		if (bus->dev_num_ida_min)
-			ida_free(&sdw_peripheral_ida, slave->dev_num);
+		if (bus->ops && bus->ops->put_device_num)
+			bus->ops->put_device_num(bus, slave);
 	}
 	list_del_init(&slave->node);
 	mutex_unlock(&bus->bus_lock);
@@ -710,16 +709,15 @@ EXPORT_SYMBOL(sdw_compare_devid);
 /* called with bus_lock held */
 static int sdw_get_device_num(struct sdw_slave *slave)
 {
+	struct sdw_bus *bus = slave->bus;
 	int bit;
 
-	if (slave->bus->dev_num_ida_min) {
-		bit = ida_alloc_range(&sdw_peripheral_ida,
-				      slave->bus->dev_num_ida_min, SDW_MAX_DEVICES,
-				      GFP_KERNEL);
+	if (bus->ops && bus->ops->get_device_num) {
+		bit = bus->ops->get_device_num(bus, slave);
 		if (bit < 0)
 			goto err;
 	} else {
-		bit = find_first_zero_bit(slave->bus->assigned, SDW_MAX_DEVICES);
+		bit = find_first_zero_bit(bus->assigned, SDW_MAX_DEVICES);
 		if (bit == SDW_MAX_DEVICES) {
 			bit = -ENODEV;
 			goto err;
@@ -730,7 +728,7 @@ static int sdw_get_device_num(struct sdw_slave *slave)
 	 * Do not update dev_num in Slave data structure here,
 	 * Update once program dev_num is successful
 	 */
-	set_bit(bit, slave->bus->assigned);
+	set_bit(bit, bus->assigned);
 
 err:
 	return bit;
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index cb2f199f4f97..9d998a010162 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -125,6 +125,20 @@ static int intel_prop_read(struct sdw_bus *bus)
 	return 0;
 }
 
+static DEFINE_IDA(intel_peripheral_ida);
+
+static int intel_get_device_num_ida(struct sdw_bus *bus, struct sdw_slave *slave)
+{
+	return ida_alloc_range(&intel_peripheral_ida,
+			       INTEL_DEV_NUM_IDA_MIN, SDW_MAX_DEVICES,
+			       GFP_KERNEL);
+}
+
+static void intel_put_device_num_ida(struct sdw_bus *bus, struct sdw_slave *slave)
+{
+	return ida_free(&intel_peripheral_ida, slave->dev_num);
+}
+
 static struct sdw_master_ops sdw_intel_ops = {
 	.read_prop = intel_prop_read,
 	.override_adr = sdw_dmi_override_adr,
@@ -134,6 +148,8 @@ static struct sdw_master_ops sdw_intel_ops = {
 	.pre_bank_switch = generic_pre_bank_switch,
 	.post_bank_switch = generic_post_bank_switch,
 	.read_ping_status = cdns_read_ping_status,
+	.get_device_num =  intel_get_device_num_ida,
+	.put_device_num = intel_put_device_num_ida,
 	.new_peripheral_assigned = generic_new_peripheral_assigned,
 };
 
@@ -167,7 +183,6 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 	cdns->msg_count = 0;
 
 	bus->link_id = auxdev->id;
-	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
 	bus->clk_stop_timeout = 1;
 
 	sdw_cdns_probe(cdns);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 94676a3fd0b5..bde93ca6aaa6 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -847,6 +847,8 @@ struct sdw_defer {
  * @post_bank_switch: Callback for post bank switch
  * @read_ping_status: Read status from PING frames, reported with two bits per Device.
  * Bits 31:24 are reserved.
+ * @get_device_num: Callback for vendor-specific device_number allocation
+ * @put_device_num: Callback for vendor-specific device_number release
  * @new_peripheral_assigned: Callback to handle enumeration of new peripheral.
  */
 struct sdw_master_ops {
@@ -862,6 +864,8 @@ struct sdw_master_ops {
 	int (*pre_bank_switch)(struct sdw_bus *bus);
 	int (*post_bank_switch)(struct sdw_bus *bus);
 	u32 (*read_ping_status)(struct sdw_bus *bus);
+	int (*get_device_num)(struct sdw_bus *bus, struct sdw_slave *slave);
+	void (*put_device_num)(struct sdw_bus *bus, struct sdw_slave *slave);
 	void (*new_peripheral_assigned)(struct sdw_bus *bus,
 					struct sdw_slave *slave,
 					int dev_num);
@@ -898,9 +902,6 @@ struct sdw_master_ops {
  * meaningful if multi_link is set. If set to 1, hardware-based
  * synchronization will be used even if a stream only uses a single
  * SoundWire segment.
- * @dev_num_ida_min: if set, defines the minimum values for the IDA
- * used to allocate system-unique device numbers. This value needs to be
- * identical across all SoundWire bus in the system.
  */
 struct sdw_bus {
 	struct device *dev;
@@ -927,7 +928,6 @@ struct sdw_bus {
 	u32 bank_switch_timeout;
 	bool multi_link;
 	int hw_sync_min_links;
-	int dev_num_ida_min;
 };
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
-- 
2.25.1

