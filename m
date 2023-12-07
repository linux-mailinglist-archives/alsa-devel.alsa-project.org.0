Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD6A809577
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:35:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6CF9950;
	Thu,  7 Dec 2023 23:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6CF9950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988539;
	bh=qQ7Ong4JKR/YOE3/JfcFuu0jPrgvbTLh/EPInQfYhSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nEfRYpSndOsH/K7yMV5rWV0NVXcBKppJxCAWRetqZIFZ/VsB8WtBZxt4fJdfSmU8W
	 /DOiRvtGvqfMvB3HNBae6wTmp7WINgYs/e2eLKnuknw0cjoyPOBBhb2v6b7llMtrwj
	 VYQe2msBIPpDXDDhofru891pQFvnoPM54m3g6lPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE440F805AF; Thu,  7 Dec 2023 23:35:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A97E9F805AF;
	Thu,  7 Dec 2023 23:35:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 037BAF8057F; Thu,  7 Dec 2023 23:35:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FD0FF802E8
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FD0FF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XguUhsrk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988218; x=1733524218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qQ7Ong4JKR/YOE3/JfcFuu0jPrgvbTLh/EPInQfYhSw=;
  b=XguUhsrkzxZFJrqeYVHWbJ7mPv12kZP8qN1BQmjJWig+7vFa13aDRBZE
   vu4Jk52rd92/TTTitLz9yLVpRnUZVaqUGD5INtLnFlHM+B237YMofXyZ1
   zEA7h+c0T/eCMbTwa5YrUPzcfhdrPsLhXSuHuUqqp2IvknwUEx9QBiQPD
   NVvGUfDr6wJPDXopPEOxeChMi4Wd38QGIGo074Xooxv6imnW7LTJgDz9O
   dExKmt1lsVh28RsY6DUmbCEJiZeyR4gn4CmYAUC1qPlwmFsjiiYOEexj0
   UbUfW7Dqv3vsSCJZMtLbRjcryUmz4pyeQSN36XLbDG/FxehwIRPKzOTVA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516636"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516636"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307482"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307482"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 07/16] soundwire: bus: add API for BPT protocol
Date: Thu,  7 Dec 2023 16:29:35 -0600
Message-Id: <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QEAMT7FV7UXB33RLI3MG236PJWFNG5BB
X-Message-ID-Hash: QEAMT7FV7UXB33RLI3MG236PJWFNG5BB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEAMT7FV7UXB33RLI3MG236PJWFNG5BB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add definitions and helpers for the BPT/BRA protocol. Peripheral
drivers (aka ASoC codec drivers) can use this API to send bulk data
such as firmware or tables.

The API is only available when no other audio streams have been
allocated, and only one BTP/BRA stream is allowed per link.  To avoid
the addition of yet another lock, the refcount tests are handled in
the stream master_runtime alloc/free routines where the bus_lock is
already held. Another benefit of this approach is that the same
bus_lock is used to handle runtime and port linked lists, which
reduces the potential for misaligned configurations.

In addition to exclusion with audio streams, BPT transfers have a lot
of overhead, specifically registers writes are needed to enable
transport in DP0. In addition, most DMAs don't handle too well very
small data sets.

This patch suggests a minimum bound of 64 bytes, for smaller transfers
codec drivers should rely on the regular read/write commands in
Column0.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c       | 77 +++++++++++++++++++++++++++++++++++
 drivers/soundwire/bus.h       | 18 ++++++++
 drivers/soundwire/stream.c    | 30 ++++++++++++++
 include/linux/soundwire/sdw.h | 76 ++++++++++++++++++++++++++++++++++
 4 files changed, 201 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index f3fec15c3112..e5758d2ed88f 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -2015,3 +2015,80 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
 	}
 }
 EXPORT_SYMBOL(sdw_clear_slave_status);
+
+int sdw_bpt_close_stream(struct sdw_bus *bus,
+			 struct sdw_slave *slave,
+			 enum sdw_bpt_type mode,
+			 struct sdw_bpt_msg *msg)
+{
+	int ret;
+
+	ret = bus->ops->bpt_close_stream(bus, slave, mode, msg);
+	if (ret < 0)
+		dev_err(bus->dev, "BPT stream close, err %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL(sdw_bpt_close_stream);
+
+int sdw_bpt_open_stream(struct sdw_bus *bus,
+			struct sdw_slave *slave,
+			enum sdw_bpt_type mode,
+			struct sdw_bpt_msg *msg)
+{
+	int ret;
+
+	/* only Bulk Register Access (BRA) is supported for now */
+	if (mode != SDW_BRA)
+		return -EINVAL;
+
+	if (msg->len < SDW_BPT_MSG_MIN_BYTES) {
+		dev_err(bus->dev, "BPT message length %d, min supported %d\n",
+			msg->len, SDW_BPT_MSG_MIN_BYTES);
+		return -EINVAL;
+	}
+
+	if (msg->len % SDW_BPT_MSG_BYTE_ALIGNMENT) {
+		dev_err(bus->dev, "BPT message length %d is not a multiple of %d bytes\n",
+			msg->len, SDW_BPT_MSG_BYTE_ALIGNMENT);
+		return -EINVAL;
+	}
+
+	/* check device is enumerated */
+	if (slave->dev_num == SDW_ENUM_DEV_NUM ||
+	    slave->dev_num > SDW_MAX_DEVICES)
+		return -ENODEV;
+
+	/* make sure all callbacks are defined */
+	if (!bus->ops->bpt_open_stream ||
+	    !bus->ops->bpt_close_stream ||
+	    !bus->ops->bpt_send_async ||
+	    !bus->ops->bpt_wait)
+		return -ENOTSUPP;
+
+	ret = bus->ops->bpt_open_stream(bus, slave, mode, msg);
+	if (ret < 0)
+		dev_err(bus->dev, "BPT stream open, err %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL(sdw_bpt_open_stream);
+
+int sdw_bpt_send_async(struct sdw_bus *bus,
+		       struct sdw_slave *slave,
+		       struct sdw_bpt_msg *msg)
+{
+	if (msg->len > SDW_BPT_MSG_MAX_BYTES)
+		return -EINVAL;
+
+	return bus->ops->bpt_send_async(bus, slave, msg);
+}
+EXPORT_SYMBOL(sdw_bpt_send_async);
+
+int sdw_bpt_wait(struct sdw_bus *bus,
+		 struct sdw_slave *slave,
+		 struct sdw_bpt_msg *msg)
+{
+	return bus->ops->bpt_wait(bus, slave, msg);
+}
+EXPORT_SYMBOL(sdw_bpt_wait);
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index fda6b24ac2da..936852ab3154 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -72,6 +72,24 @@ struct sdw_msg {
 	bool page;
 };
 
+/**
+ * struct sdw_btp_msg - Message structure
+ * @addr: Start Register address accessed in the Slave
+ * @len: number of bytes to transfer. More than 64Kb can be transferred
+ * but a practical limit of SDW_BPT_MSG_MAX_BYTES is enforced.
+ * @dev_num: Slave device number
+ * @flags: transfer flags, indicate if xfer is read or write
+ * @buf: message data buffer (filled by host for write, filled
+ * by Peripheral hardware for reads)
+ */
+struct sdw_bpt_msg {
+	u32 addr;
+	u32 len;
+	u8 dev_num;
+	u8 flags;
+	u8 *buf;
+};
+
 #define SDW_DOUBLE_RATE_FACTOR		2
 #define SDW_STRM_RATE_GROUPING		1
 
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index f9762610f051..b097b1a808f9 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1189,6 +1189,20 @@ static struct sdw_master_runtime
 	struct sdw_master_runtime *m_rt, *walk_m_rt;
 	struct list_head *insert_after;
 
+	if (stream->type == SDW_STREAM_BPT) {
+		if (bus->stream_refcount > 0 || bus->bpt_stream_refcount > 0) {
+			dev_err(bus->dev, "%s: invalid configuration %d streams %d BPT streams\n",
+				__func__, bus->stream_refcount, bus->bpt_stream_refcount);
+			return ERR_PTR(-EBUSY);
+		}
+	} else {
+		if (bus->bpt_stream_refcount > 0) {
+			dev_err(bus->dev, "%s: BTP stream already allocated\n",
+				__func__);
+			return ERR_PTR(-EAGAIN);
+		}
+	}
+
 	m_rt = kzalloc(sizeof(*m_rt), GFP_KERNEL);
 	if (!m_rt)
 		return NULL;
@@ -1217,6 +1231,8 @@ static struct sdw_master_runtime
 	m_rt->stream = stream;
 
 	bus->stream_refcount++;
+	if (stream->type == SDW_STREAM_BPT)
+		bus->bpt_stream_refcount++;
 
 	return m_rt;
 }
@@ -1265,6 +1281,8 @@ static void sdw_master_rt_free(struct sdw_master_runtime *m_rt,
 	list_del(&m_rt->bus_node);
 	kfree(m_rt);
 
+	if (stream->type == SDW_STREAM_BPT)
+		bus->bpt_stream_refcount--;
 	bus->stream_refcount--;
 }
 
@@ -1941,6 +1959,12 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	m_rt = sdw_master_rt_find(bus, stream);
 	if (!m_rt) {
 		m_rt = sdw_master_rt_alloc(bus, stream);
+		if (IS_ERR(m_rt)) {
+			ret = PTR_ERR(m_rt);
+			dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s: %d\n",
+				__func__, stream->name, ret);
+			goto unlock;
+		}
 		if (!m_rt) {
 			dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
 				__func__, stream->name);
@@ -2056,6 +2080,12 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		 * So, allocate m_rt and add Slave to it.
 		 */
 		m_rt = sdw_master_rt_alloc(slave->bus, stream);
+		if (IS_ERR(m_rt)) {
+			ret = PTR_ERR(m_rt);
+			dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s: %d\n",
+				__func__, stream->name, ret);
+			goto unlock;
+		}
 		if (!m_rt) {
 			dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
 				__func__, stream->name);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 1dda65d91bad..e54c5bbd2b91 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -835,6 +835,46 @@ struct sdw_defer {
 	struct sdw_msg *msg;
 };
 
+/*
+ * Add a practical limit to BPT transfer sizes. BPT is typically used
+ * to transfer firmware, and larger firmware transfers will increase
+ * the cold latency beyond typical OS or user requirements.
+ */
+#define SDW_BPT_MSG_MAX_BYTES  (1024 * 1024)
+
+/*
+ * Add a minimum number of bytes for BPT transfer sizes. BPT has a lot of
+ * overhead, enabling/disabling a stream costs 6 write commands, plus the bank
+ * switch that could be delayed in time. In addition, transferring very small
+ * data sets over DMA is known to be problematic on multiple platforms.
+ */
+#define SDW_BPT_MSG_MIN_BYTES      128
+
+/*
+ * Add an alignment requirement for BPT transfer sizes. BPT is
+ * typically with DMAs which are most-efficient with data aligned to a
+ * cache line.  For example HDaudio DMAs strongly recommend to use
+ * multiples of 128 bytes.
+ * This could be a platform-specific value, but that would be problematic for
+ * codec drivers which are typically not platform-specific by definition.
+ * It's probably simpler for everyone to align on a baseline and use regular
+ * read/write commands for the remaining bytes.
+ */
+#define SDW_BPT_MSG_BYTE_ALIGNMENT 128
+
+/**
+ * sdw_bpt_type - SoundWire Bulk Payload Transfer (BPT) type
+ * @SDW_BRA: Soundwire Bulk Register Access (BRA)
+ *
+ * The SoundWire specification allows for implementation-defined
+ * solutions, they would be added after BRA.
+ */
+enum sdw_bpt_type {
+	SDW_BRA,
+};
+
+struct sdw_bpt_msg;
+
 /**
  * struct sdw_master_ops - Master driver ops
  * @read_prop: Read Master properties
@@ -850,6 +890,10 @@ struct sdw_defer {
  * @get_device_num: Callback for vendor-specific device_number allocation
  * @put_device_num: Callback for vendor-specific device_number release
  * @new_peripheral_assigned: Callback to handle enumeration of new peripheral.
+ * @bpt_open_stream: reserve resources for BPT stream
+ * @bpt_close_stream: release resources for BPT stream
+ * @bpt_send_async: send message using BTP protocol
+ * @bpt_wait: wait for message completion using BTP protocol
  */
 struct sdw_master_ops {
 	int (*read_prop)(struct sdw_bus *bus);
@@ -869,6 +913,20 @@ struct sdw_master_ops {
 	void (*new_peripheral_assigned)(struct sdw_bus *bus,
 					struct sdw_slave *slave,
 					int dev_num);
+	int (*bpt_open_stream)(struct sdw_bus *bus,
+			       struct sdw_slave *slave,
+			       enum sdw_bpt_type mode,
+			       struct sdw_bpt_msg *msg);
+	int (*bpt_close_stream)(struct sdw_bus *bus,
+				struct sdw_slave *slave,
+				enum sdw_bpt_type mode,
+				struct sdw_bpt_msg *msg);
+	int (*bpt_send_async)(struct sdw_bus *bus,
+			      struct sdw_slave *slave,
+			      struct sdw_bpt_msg *msg);
+	int (*bpt_wait)(struct sdw_bus *bus,
+			struct sdw_slave *slave,
+			struct sdw_bpt_msg *msg);
 };
 
 /**
@@ -905,6 +963,8 @@ struct sdw_master_ops {
  * synchronization will be used even if a stream only uses a single
  * SoundWire segment.
  * @stream_refcount: number of streams currently using this bus
+ * @btp_stream_refcount: number of BTP streams currently using this bus (should
+ * be zero or one, multiple streams per link is not supported).
  */
 struct sdw_bus {
 	struct device *dev;
@@ -935,6 +995,7 @@ struct sdw_bus {
 	bool multi_link;
 	int hw_sync_min_links;
 	int stream_refcount;
+	int bpt_stream_refcount;
 };
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
@@ -1052,6 +1113,21 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
 int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
 void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
 
+int sdw_bpt_open_stream(struct sdw_bus *bus,
+			struct sdw_slave *slave,
+			enum sdw_bpt_type mode,
+			struct sdw_bpt_msg *msg);
+int sdw_bpt_close_stream(struct sdw_bus *bus,
+			 struct sdw_slave *slave,
+			 enum sdw_bpt_type mode,
+			 struct sdw_bpt_msg *msg);
+int sdw_bpt_send_async(struct sdw_bus *bus,
+		       struct sdw_slave *slave,
+		       struct sdw_bpt_msg *msg);
+int sdw_bpt_wait(struct sdw_bus *bus,
+		 struct sdw_slave *slave,
+		 struct sdw_bpt_msg *msg);
+
 #if IS_ENABLED(CONFIG_SOUNDWIRE)
 
 int sdw_stream_add_slave(struct sdw_slave *slave,
-- 
2.39.2

