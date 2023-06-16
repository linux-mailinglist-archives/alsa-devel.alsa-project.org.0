Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58184732CC1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9367BA4C;
	Fri, 16 Jun 2023 12:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9367BA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686909823;
	bh=5uUan09521IhdAtIQuxDdPmUuMj3zu+2q5cKVzNhmL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fv21ayjSnIqyTwPA3bsmEiAxYqpZgo0YroO0Dn8Yewpv+v/Jb1ycsh6eAUALQAO5c
	 afP+H1okCE5afa+Wc5JggIqzo3Jf8APXeUE9uBkRl0g/Wq1ziUazNL/E43+59zYwTx
	 QeOBIIxn+n6QDYKhVcoxtBCWBO/oRcbDeJZ9eRjo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE45BF805B0; Fri, 16 Jun 2023 12:01:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FD90F805B0;
	Fri, 16 Jun 2023 12:01:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D0C1F80558; Fri, 16 Jun 2023 12:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E356EF80558
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E356EF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QJ6xzB0N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686909673; x=1718445673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5uUan09521IhdAtIQuxDdPmUuMj3zu+2q5cKVzNhmL0=;
  b=QJ6xzB0NjZj6xm2Zd1C0k65fv6znUYEa0I3kloKXdEXG3aNYNuXHhKFa
   qZyO+bJZVk4d37olDBE2aJVCFLC/0ej3z6LKt5SklDfQaUUb7tg9BFd9n
   fCXbBOkrbo15wroaK9pdy/BhuBtM82+ibdvUlqdiogdh6WBZOew/hFPb4
   7oLfJEt0J3pQ+AGLZmSo1H7aI9i+aWLB2b9Qh5mxGTLJAWJneGEoG9iO5
   BPrQguQAm9wlqgf5V8gLCn3QjPQZwBBqQDcLGxHXAL3ntymVznKVwiTNS
   7kbwsCEsP7H9TPspu0U7jZl1fpGizdtkc15iwlaw09l9aC9pBAYDle+o/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362591666"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="362591666"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825689436"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="825689436"
Received: from kjaffe-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.114.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 6/8] ASoC: SOF: ipc4: Switch to use the sof_debug:bit11 to
 dump message payload
Date: Fri, 16 Jun 2023 12:00:37 +0200
Message-Id: <20230616100039.378150-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
References: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A3KRHIW7P6CVNUBV2LA7BPKNT2CVPLEA
X-Message-ID-Hash: A3KRHIW7P6CVNUBV2LA7BPKNT2CVPLEA
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3KRHIW7P6CVNUBV2LA7BPKNT2CVPLEA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Use the SOF_DBG_DUMP_IPC_MESSAGE_PAYLOAD flag to print the message payload
instead of the DEBUG_VERBOSE, which would need code modification and kernel
re-compilation.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 46 +++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 246b56d24a6f..ab6eddd91bb7 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -17,15 +17,6 @@
 #include "ipc4-priv.h"
 #include "ops.h"
 
-#ifdef DEBUG_VERBOSE
-#define sof_ipc4_dump_payload(sdev, ipc_data, size)			\
-		print_hex_dump_debug("Message payload: ",		\
-				     DUMP_PREFIX_OFFSET,		\
-				     16, 4, ipc_data, size, false)
-#else
-#define sof_ipc4_dump_payload(sdev, ipc_data, size)	do { } while (0)
-#endif
-
 static const struct sof_ipc4_fw_status {
 	int status;
 	char *msg;
@@ -256,6 +247,13 @@ static void sof_ipc4_log_header(struct device *dev, u8 *text, struct sof_ipc4_ms
 }
 #endif
 
+static void sof_ipc4_dump_payload(struct snd_sof_dev *sdev,
+				  void *ipc_data, size_t size)
+{
+	print_hex_dump_debug("Message payload: ", DUMP_PREFIX_OFFSET,
+			     16, 4, ipc_data, size, false);
+}
+
 static int sof_ipc4_get_reply(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc_msg *msg = sdev->msg;
@@ -362,9 +360,6 @@ static int sof_ipc4_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 			   void *reply_data, size_t reply_bytes, bool no_pm)
 {
 	struct snd_sof_ipc *ipc = sdev->ipc;
-#ifdef DEBUG_VERBOSE
-	struct sof_ipc4_msg *msg = NULL;
-#endif
 	int ret;
 
 	if (!msg_data)
@@ -386,19 +381,21 @@ static int sof_ipc4_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 
 	ret = ipc4_tx_msg_unlocked(ipc, msg_data, msg_bytes, reply_data, reply_bytes);
 
+	if (sof_debug_check_flag(SOF_DBG_DUMP_IPC_MESSAGE_PAYLOAD)) {
+		struct sof_ipc4_msg *msg = NULL;
+
+		/* payload is indicated by non zero msg/reply_bytes */
+		if (msg_bytes)
+			msg = msg_data;
+		else if (reply_bytes)
+			msg = reply_data;
+
+		if (msg)
+			sof_ipc4_dump_payload(sdev, msg->data_ptr, msg->data_size);
+	}
+
 	mutex_unlock(&ipc->tx_mutex);
 
-#ifdef DEBUG_VERBOSE
-	/* payload is indicated by non zero msg/reply_bytes */
-	if (msg_bytes)
-		msg = msg_data;
-	else if (reply_bytes)
-		msg = reply_data;
-
-	if (msg)
-		sof_ipc4_dump_payload(sdev, msg->data_ptr, msg->data_size);
-#endif
-
 	return ret;
 }
 
@@ -516,7 +513,8 @@ static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 	if (!set && payload_bytes != offset)
 		ipc4_msg->data_size = offset;
 
-	sof_ipc4_dump_payload(sdev, ipc4_msg->data_ptr, ipc4_msg->data_size);
+	if (sof_debug_check_flag(SOF_DBG_DUMP_IPC_MESSAGE_PAYLOAD))
+		sof_ipc4_dump_payload(sdev, ipc4_msg->data_ptr, ipc4_msg->data_size);
 
 out:
 	mutex_unlock(&sdev->ipc->tx_mutex);
-- 
2.37.2

