Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727517A5DC2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A898DEC;
	Tue, 19 Sep 2023 11:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A898DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115563;
	bh=lXILLkVDnPG++NGaxfZdr52oMz7U/mUPY+TSxPk4as8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V94RkmJX5bBZ4pWGnaoGYyYJ6c3JhIGufrUWmSEva48IKCd36oB7g/9+cil7E//UI
	 uiaDd89ajq7n8OacGhDRNNdCwZD3aFVehtWqY/awCZUtHmF8S/BC3zI4Qt+ElEMSoP
	 ST51e5bhSoHBpD/3yNFZTrXQdwoCFMWVPN8N9LM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E28BF8055C; Tue, 19 Sep 2023 11:24:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA58CF80563;
	Tue, 19 Sep 2023 11:24:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E76C3F80563; Tue, 19 Sep 2023 11:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76B56F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76B56F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Xv7pKreL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115457; x=1726651457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lXILLkVDnPG++NGaxfZdr52oMz7U/mUPY+TSxPk4as8=;
  b=Xv7pKreLYn+e0CNXgRylikB7dR+FEYfkZCAkwil3WH9hXH0iu3NH55jl
   oF30fjVl4WYbrH8LfmN7xQSIQgFYKz4KSdVzS8Yq05Hp/FqE1VNc1dJiH
   arklgBwAptNaSz8nwZ/99plsQ7S2IkgrqwITQxCV72G2zBy7M0EdOf5KG
   EtDdU4rX9MqA2W+LozIEJTxi9dNAXsn/H1NkaJd1KuBOMg0H2Yub63/Rn
   oQSPPxnIB5R3peUL2tkRXe7ylBExfRclq6Pl0PlRWxL3zH1q5beAswD0P
   Er3e5vziZP0oeyLfhslm6I/IQN/lOxumjYLXd2bFk1D0qrxf8nNVlLfRs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377205164"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="377205164"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861460208"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861460208"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH 2/9] ASoC: SOF: ipc4-mtrace: move debug slot related
 definitions to header.h
Date: Tue, 19 Sep 2023 12:24:09 +0300
Message-ID: <20230919092416.4137-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
References: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KWG6CGWYSOLHHG2FWTSO7KUWDSNXASOF
X-Message-ID-Hash: KWG6CGWYSOLHHG2FWTSO7KUWDSNXASOF
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KWG6CGWYSOLHHG2FWTSO7KUWDSNXASOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

The macro definitions of debug slot can be used by gdb, telemetry
and mtrace log, so move these definitions to header.h from mtrace.
Then these macro definitions can be shared

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 17 +++++++++++++++++
 sound/soc/sof/ipc4-mtrace.c     | 34 +++++++++++----------------------
 2 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index c58f00ef054a..574a9d581f88 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -515,6 +515,23 @@ struct sof_ipc4_notify_resource_data {
 	uint32_t data[6];
 } __packed __aligned(4);
 
+#define SOF_IPC4_DEBUG_DESCRIPTOR_SIZE		12 /* 3 x u32 */
+
+/*
+ * The debug memory window is divided into 16 slots, and the
+ * first slot is used as a recorder for the other 15 slots.
+ */
+#define SOF_IPC4_MAX_DEBUG_SLOTS		15
+#define SOF_IPC4_DEBUG_SLOT_SIZE		0x1000
+
+/* debug log slot types */
+#define SOF_IPC4_DEBUG_SLOT_UNUSED		0x00000000
+#define SOF_IPC4_DEBUG_SLOT_CRITICAL_LOG	0x54524300 /* byte 0: core ID */
+#define SOF_IPC4_DEBUG_SLOT_DEBUG_LOG		0x474f4c00 /* byte 0: core ID */
+#define SOF_IPC4_DEBUG_SLOT_GDB_STUB		0x42444700
+#define SOF_IPC4_DEBUG_SLOT_TELEMETRY		0x4c455400
+#define SOF_IPC4_DEBUG_SLOT_BROKEN		0x44414544
+
 /** @}*/
 
 #endif
diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
index 2b4659a1768e..9f1e33ee8826 100644
--- a/sound/soc/sof/ipc4-mtrace.c
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -41,24 +41,12 @@
  * The two pointers are offsets within the buffer.
  */
 
-#define SOF_MTRACE_DESCRIPTOR_SIZE		12 /* 3 x u32 */
-
 #define FW_EPOCH_DELTA				11644473600LL
 
-#define INVALID_SLOT_OFFSET			0xffffffff
 #define MAX_ALLOWED_LIBRARIES			16
-#define MAX_MTRACE_SLOTS			15
-
-#define SOF_MTRACE_PAGE_SIZE			0x1000
-#define SOF_MTRACE_SLOT_SIZE			SOF_MTRACE_PAGE_SIZE
-
-/* debug log slot types */
-#define SOF_MTRACE_SLOT_UNUSED			0x00000000
-#define SOF_MTRACE_SLOT_CRITICAL_LOG		0x54524300 /* byte 0: core ID */
-#define SOF_MTRACE_SLOT_DEBUG_LOG		0x474f4c00 /* byte 0: core ID */
-#define SOF_MTRACE_SLOT_GDB_STUB		0x42444700
-#define SOF_MTRACE_SLOT_TELEMETRY		0x4c455400
-#define SOF_MTRACE_SLOT_BROKEN			0x44414544
+
+#define SOF_IPC4_INVALID_SLOT_OFFSET		0xffffffff
+
  /* for debug and critical types */
 #define SOF_MTRACE_SLOT_CORE_MASK		GENMASK(7, 0)
 #define SOF_MTRACE_SLOT_TYPE_MASK		GENMASK(31, 8)
@@ -140,7 +128,7 @@ static int sof_ipc4_mtrace_dfs_open(struct inode *inode, struct file *file)
 	if (unlikely(ret))
 		goto out;
 
-	core_data->log_buffer = kmalloc(SOF_MTRACE_SLOT_SIZE, GFP_KERNEL);
+	core_data->log_buffer = kmalloc(SOF_IPC4_DEBUG_SLOT_SIZE, GFP_KERNEL);
 	if (!core_data->log_buffer) {
 		debugfs_file_put(file->f_path.dentry);
 		ret = -ENOMEM;
@@ -212,13 +200,13 @@ static ssize_t sof_ipc4_mtrace_dfs_read(struct file *file, char __user *buffer,
 		return 0;
 	}
 
-	if (core_data->slot_offset == INVALID_SLOT_OFFSET)
+	if (core_data->slot_offset == SOF_IPC4_INVALID_SLOT_OFFSET)
 		return 0;
 
 	/* The log data buffer starts after the two pointer in the slot */
 	log_buffer_offset =  core_data->slot_offset + (sizeof(u32) * 2);
 	/* The log data size excludes the pointers */
-	log_buffer_size = SOF_MTRACE_SLOT_SIZE - (sizeof(u32) * 2);
+	log_buffer_size = SOF_IPC4_DEBUG_SLOT_SIZE - (sizeof(u32) * 2);
 
 	read_ptr = core_data->host_read_ptr;
 	write_ptr = core_data->dsp_write_ptr;
@@ -510,13 +498,13 @@ static void sof_mtrace_find_core_slots(struct snd_sof_dev *sdev)
 	u32 slot_desc_type_offset, type, core;
 	int i;
 
-	for (i = 0; i < MAX_MTRACE_SLOTS; i++) {
+	for (i = 0; i < SOF_IPC4_MAX_DEBUG_SLOTS; i++) {
 		/* The type is the second u32 in the slot descriptor */
 		slot_desc_type_offset = sdev->debug_box.offset;
-		slot_desc_type_offset += SOF_MTRACE_DESCRIPTOR_SIZE * i + sizeof(u32);
+		slot_desc_type_offset += SOF_IPC4_DEBUG_DESCRIPTOR_SIZE * i + sizeof(u32);
 		sof_mailbox_read(sdev, slot_desc_type_offset, &type, sizeof(type));
 
-		if ((type & SOF_MTRACE_SLOT_TYPE_MASK) == SOF_MTRACE_SLOT_DEBUG_LOG) {
+		if ((type & SOF_MTRACE_SLOT_TYPE_MASK) == SOF_IPC4_DEBUG_SLOT_DEBUG_LOG) {
 			core = type & SOF_MTRACE_SLOT_CORE_MASK;
 
 			if (core >= sdev->num_cores) {
@@ -533,7 +521,7 @@ static void sof_mtrace_find_core_slots(struct snd_sof_dev *sdev)
 			 * debug_box + SOF_MTRACE_SLOT_SIZE offset
 			 */
 			core_data->slot_offset = sdev->debug_box.offset;
-			core_data->slot_offset += SOF_MTRACE_SLOT_SIZE * (i + 1);
+			core_data->slot_offset += SOF_IPC4_DEBUG_SLOT_SIZE * (i + 1);
 			dev_dbg(sdev->dev, "slot%d is used for core%u\n", i, core);
 			if (core_data->delayed_pos_update) {
 				sof_ipc4_mtrace_update_pos(sdev, core);
@@ -633,7 +621,7 @@ int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core)
 
 	core_data = &priv->cores[core];
 
-	if (core_data->slot_offset == INVALID_SLOT_OFFSET) {
+	if (core_data->slot_offset == SOF_IPC4_INVALID_SLOT_OFFSET) {
 		core_data->delayed_pos_update = true;
 		return 0;
 	}
-- 
2.42.0

