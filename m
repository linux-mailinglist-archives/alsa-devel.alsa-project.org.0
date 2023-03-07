Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53E6ADCD9
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:09:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48ABE143A;
	Tue,  7 Mar 2023 12:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48ABE143A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678187364;
	bh=eOCXqC/6P19MA2TVfR20xSJUyuKNC3v4khTA8eCOvdI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mnWG4dFoFn4NfqWBbTo+EI/+ZWDppVZDqUOh/ReuEcPmLWra1Izgb1gvHdA8z4Fih
	 Bkqrd0Mv0RQUcSPY/vE9PGFH79HVOXLROuiT6Tk84RBPzzNenPKj1o5cnpKPuJDlzP
	 4UVBnpEBY8p3JqCeoxWYaKiFNa38cPg8wA/vbYBA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8322F800C9;
	Tue,  7 Mar 2023 12:08:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 480ECF804B1; Tue,  7 Mar 2023 12:08:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66857F80236
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66857F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iaSS6s1h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678187309; x=1709723309;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eOCXqC/6P19MA2TVfR20xSJUyuKNC3v4khTA8eCOvdI=;
  b=iaSS6s1hkQSnJK/sv7UGwchp4JJ+0McQ4KQxDxMm/bVn7Ut2TOMMY8E4
   ENxCs4ZQDj6zo9I/CR/EssIiMQeNfiL2mbfsISdCMmQUV6Xle4ib3i06C
   iZ69clz0SP1w/PruD+Pir5U40sV5MAJG86rLb9DAj2eHdUzFC//wyWEtS
   ma4bilBSYo/t2VlY2fgohEPgMV5Le+wCmDqbS+CeHdNIiETdIfCuRzXW4
   8K/Vk59FG192TW+8y6B+TXrmoBIHBf0dW8UHTx45OrmT0K2+7maW0O151
   NlfcgeQk/TdYElSI057/oBQOP0Vsw8Tsflct76b5cFbXGODOZ6yh0qzCm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338147914"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="338147914"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:08:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740687943"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="740687943"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:08:24 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4-mtrace: process pending logs upon FW crash
Date: Tue,  7 Mar 2023 13:08:46 +0200
Message-Id: <20230307110846.2265-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IWEZJKAKFDDL3U3MEIGCYH4HVSYQPJ72
X-Message-ID-Hash: IWEZJKAKFDDL3U3MEIGCYH4HVSYQPJ72
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWEZJKAKFDDL3U3MEIGCYH4HVSYQPJ72/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

If the DSP firmware has crashed, some log messages may be pending in the
mtrace buffer, but not consumed by the driver as no IPC notification has
been sent by the firmware. Check the buffer status for all mtrace slots
and ensure any pending log messages are processed before DSP is possibly
powered down and the log buffer contents is lost.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-mtrace.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
index 0ec6ef681012..2b4659a1768e 100644
--- a/sound/soc/sof/ipc4-mtrace.c
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -609,6 +609,16 @@ static void ipc4_mtrace_free(struct snd_sof_dev *sdev)
 	ipc4_mtrace_disable(sdev);
 }
 
+static int sof_ipc4_mtrace_update_pos_all_cores(struct snd_sof_dev *sdev)
+{
+	int i;
+
+	for (i = 0; i < sdev->num_cores; i++)
+		sof_ipc4_mtrace_update_pos(sdev, i);
+
+	return 0;
+}
+
 int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core)
 {
 	struct sof_mtrace_priv *priv = sdev->fw_trace_data;
@@ -642,6 +652,16 @@ int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core)
 	return 0;
 }
 
+static void ipc4_mtrace_fw_crashed(struct snd_sof_dev *sdev)
+{
+	/*
+	 * The DSP might not be able to send SOF_IPC4_NOTIFY_LOG_BUFFER_STATUS
+	 * messages anymore, so check the log buffer status on all
+	 * cores and process any pending messages.
+	 */
+	sof_ipc4_mtrace_update_pos_all_cores(sdev);
+}
+
 static int ipc4_mtrace_resume(struct snd_sof_dev *sdev)
 {
 	return ipc4_mtrace_enable(sdev);
@@ -655,6 +675,7 @@ static void ipc4_mtrace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state)
 const struct sof_ipc_fw_tracing_ops ipc4_mtrace_ops = {
 	.init = ipc4_mtrace_init,
 	.free = ipc4_mtrace_free,
+	.fw_crashed = ipc4_mtrace_fw_crashed,
 	.suspend = ipc4_mtrace_suspend,
 	.resume = ipc4_mtrace_resume,
 };
-- 
2.39.2

