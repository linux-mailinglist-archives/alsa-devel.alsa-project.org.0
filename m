Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D77FD6BD
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:28:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B99A19F6;
	Wed, 29 Nov 2023 13:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B99A19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701260890;
	bh=uOW2A0mYCKbBP9wV0mHLSuP9O/Xs5XHTPZ1vl+89yMU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=noVwnyBaKRkgG4l076SDvQIDJ3aQamYOxncpil8P3lQqFq9SD7k+L1os177pS0Ozd
	 +QsbbO8SmXh/17m1cpLSRJ/1+ChrQ/Kcrte6gDk/H42aGMOc/3jUFYhYhY+GCpaJ2F
	 5Fpr+vFVyre0JEOt9QpLlQKkV6jsuquNz40bzhLE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC3ADF8016E; Wed, 29 Nov 2023 13:27:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0013CF8007E;
	Wed, 29 Nov 2023 13:27:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 137B8F8016E; Wed, 29 Nov 2023 13:27:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D9A7F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:27:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D9A7F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eVsrVfPR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701260859; x=1732796859;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uOW2A0mYCKbBP9wV0mHLSuP9O/Xs5XHTPZ1vl+89yMU=;
  b=eVsrVfPRL5kHmdNbuJPPmiDoE3HNo6sHLl+fzTfjDOCtt3lXTBUW3kCi
   d3sBx8HxkMysLletX9rALBsj08bGkoY3jJkrx9vvkbmC8bc3N/W1HeQ0e
   DKxpxgBk68xgcUW9tujp+T6yGsknQg7ZtOQ9kbyNb0ArTT7k8cOXTrMLf
   5OP7yLHFg5bPdpFJwPHxWimYlraxKtd7YxVD07jHTN9OvoogdSv6zMyvB
   Lwc/GjHRQ+SXi0jTMt6Izl8KuTFL4nrUplnyze6hk+ZOb+2SVbKcZ8+jr
   ruBg0Z8n6Afq6GMZB6Hc16c5leVTojDT03s+quOzcSOKI9QAHlAxeQvC6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392020447"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392020447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17173566"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:27:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4: Move window offset configuration earlier
Date: Wed, 29 Nov 2023 14:28:05 +0200
Message-ID: <20231129122805.10635-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MSWXJNF624TWB7UUYNRVBG5MPRSU7I3U
X-Message-ID-Hash: MSWXJNF624TWB7UUYNRVBG5MPRSU7I3U
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSWXJNF624TWB7UUYNRVBG5MPRSU7I3U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With the added exception handling support if the firmware fails to boot
up we are trying to do a panic dump from the telemetry slot. The slot
offsets would have been configured only after receiving the FW_READY
message which makes this panic dump unusable for early boot failures.

With IPC4 the DSP window offsets are at standard places unlike IPC3 where
the offsets needs to be queried from the FW_READY message.

Move the offset configuration to sof_ipc4_init from the fw_ready handler.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 55 ++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 145d319e041f..ac5c6bc66d2a 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -576,40 +576,12 @@ EXPORT_SYMBOL(sof_ipc4_find_debug_slot_offset_by_type);
 
 static int ipc4_fw_ready(struct snd_sof_dev *sdev, struct sof_ipc4_msg *ipc4_msg)
 {
-	int inbox_offset, inbox_size, outbox_offset, outbox_size;
-
 	/* no need to re-check version/ABI for subsequent boots */
 	if (!sdev->first_boot)
 		return 0;
 
-	/* Set up the windows for IPC communication */
-	inbox_offset = snd_sof_dsp_get_mailbox_offset(sdev);
-	if (inbox_offset < 0) {
-		dev_err(sdev->dev, "%s: No mailbox offset\n", __func__);
-		return inbox_offset;
-	}
-	inbox_size = SOF_IPC4_MSG_MAX_SIZE;
-	outbox_offset = snd_sof_dsp_get_window_offset(sdev, SOF_IPC4_OUTBOX_WINDOW_IDX);
-	outbox_size = SOF_IPC4_MSG_MAX_SIZE;
-
-	sdev->fw_info_box.offset = snd_sof_dsp_get_window_offset(sdev, SOF_IPC4_INBOX_WINDOW_IDX);
-	sdev->fw_info_box.size = sizeof(struct sof_ipc4_fw_registers);
-	sdev->dsp_box.offset = inbox_offset;
-	sdev->dsp_box.size = inbox_size;
-	sdev->host_box.offset = outbox_offset;
-	sdev->host_box.size = outbox_size;
-
-	sdev->debug_box.offset = snd_sof_dsp_get_window_offset(sdev,
-							SOF_IPC4_DEBUG_WINDOW_IDX);
-
 	sof_ipc4_create_exception_debugfs_node(sdev);
 
-	dev_dbg(sdev->dev, "mailbox upstream 0x%x - size 0x%x\n",
-		inbox_offset, inbox_size);
-	dev_dbg(sdev->dev, "mailbox downstream 0x%x - size 0x%x\n",
-		outbox_offset, outbox_size);
-	dev_dbg(sdev->dev, "debug box 0x%x\n", sdev->debug_box.offset);
-
 	return sof_ipc4_init_msg_memory(sdev);
 }
 
@@ -796,11 +768,38 @@ static const struct sof_ipc_pm_ops ipc4_pm_ops = {
 static int sof_ipc4_init(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	int inbox_offset;
 
 	mutex_init(&ipc4_data->pipeline_state_mutex);
 
 	xa_init_flags(&ipc4_data->fw_lib_xa, XA_FLAGS_ALLOC);
 
+	/* Set up the windows for IPC communication */
+	inbox_offset = snd_sof_dsp_get_mailbox_offset(sdev);
+	if (inbox_offset < 0) {
+		dev_err(sdev->dev, "%s: No mailbox offset\n", __func__);
+		return inbox_offset;
+	}
+
+	sdev->dsp_box.offset = inbox_offset;
+	sdev->dsp_box.size = SOF_IPC4_MSG_MAX_SIZE;
+	sdev->host_box.offset = snd_sof_dsp_get_window_offset(sdev,
+							SOF_IPC4_OUTBOX_WINDOW_IDX);
+	sdev->host_box.size = SOF_IPC4_MSG_MAX_SIZE;
+
+	sdev->debug_box.offset = snd_sof_dsp_get_window_offset(sdev,
+							SOF_IPC4_DEBUG_WINDOW_IDX);
+
+	sdev->fw_info_box.offset = snd_sof_dsp_get_window_offset(sdev,
+							SOF_IPC4_INBOX_WINDOW_IDX);
+	sdev->fw_info_box.size = sizeof(struct sof_ipc4_fw_registers);
+
+	dev_dbg(sdev->dev, "mailbox upstream %#x - size %#x\n",
+		sdev->dsp_box.offset, SOF_IPC4_MSG_MAX_SIZE);
+	dev_dbg(sdev->dev, "mailbox downstream %#x - size %#x\n",
+		sdev->host_box.offset, SOF_IPC4_MSG_MAX_SIZE);
+	dev_dbg(sdev->dev, "debug box %#x\n", sdev->debug_box.offset);
+
 	return 0;
 }
 
-- 
2.43.0

