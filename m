Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 872936960DF
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 11:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C100A93A;
	Tue, 14 Feb 2023 11:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C100A93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676370978;
	bh=5VEJ6MXEP5XiVLpv57NzbmlsX2XekypFLVobUf4A1QQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=haj4FPipXjBaeUuuumy5eKMNcXBAl42P9XLbgmlaWTsPCdUsEw9GBCRZ6bIPzBwld
	 y2DbcdDQibSvEUUk7lAOiPWmTdUw9HhjZ9PIG00cl92nJaBkS5Dsqkh/eomNEShLmQ
	 x96xU06wbGWeJGTuRWP2HedM1iLZnlVy8dmPizsg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 399B2F80542;
	Tue, 14 Feb 2023 11:33:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CECB2F8052D; Tue, 14 Feb 2023 11:33:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE51CF8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 11:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE51CF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CjkIyfK8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676370826; x=1707906826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5VEJ6MXEP5XiVLpv57NzbmlsX2XekypFLVobUf4A1QQ=;
  b=CjkIyfK8hWmgshmHCdw8mtRcQ5TAezoXe5iI0Nk4zeVAKIqJ2T9SYDFL
   xDMzXU26QUEtdRCkIUwtX1MY4/aiL5fhln21WkMaReAjng0gi7alYA2RL
   UkndAlB0H4EKUK8s9LaXkTUQ3T3hS4xzeN1IBd3/zyfhMrOF1ReTAYg0T
   1BoliWBanW3Gj2nd091n1VKMwY0rkFW2E5K09bAlQBrAHtb28M9dy11x7
   b6k1/v1aya3rP3Myp1mC6HhlsAfqmkxKUcIxA9dbPI/VDXKsTpGtZ8Ubu
   Yw3JgJ1ZS5lBurFZXmaeROaVED2O8OYRziaC6YN6bt9TuXpbNxARvb+ct
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395745409"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="395745409"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811971897"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="811971897"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.252.18.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:34 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/5] ASoC: SOF: Introduce a new set_pm_gate() IPC PM op
Date: Tue, 14 Feb 2023 12:33:41 +0200
Message-Id: <20230214103345.30669-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
References: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5GSPE4WZY6QCNCMRY462GPSYEYDTROHE
X-Message-ID-Hash: 5GSPE4WZY6QCNCMRY462GPSYEYDTROHE
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GSPE4WZY6QCNCMRY462GPSYEYDTROHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Set_pm_gate depends on ipc version. This patch defines
the ops for both IPC3 and IPC4.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3.c     | 18 ++++++++++++++++++
 sound/soc/sof/ipc4.c     | 13 +++++++++++++
 sound/soc/sof/sof-priv.h |  2 ++
 3 files changed, 33 insertions(+)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 8e936353c1c0..3de64ea2dc9a 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -1077,10 +1077,28 @@ static int sof_ipc3_ctx_restore(struct snd_sof_dev *sdev)
 	return sof_ipc3_ctx_ipc(sdev, SOF_IPC_PM_CTX_RESTORE);
 }
 
+static int sof_ipc3_set_pm_gate(struct snd_sof_dev *sdev, u32 flags)
+{
+	struct sof_ipc_pm_gate pm_gate;
+	struct sof_ipc_reply reply;
+
+	memset(&pm_gate, 0, sizeof(pm_gate));
+
+	/* configure pm_gate ipc message */
+	pm_gate.hdr.size = sizeof(pm_gate);
+	pm_gate.hdr.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_GATE;
+	pm_gate.flags = flags;
+
+	/* send pm_gate ipc to dsp */
+	return sof_ipc_tx_message_no_pm(sdev->ipc, &pm_gate, sizeof(pm_gate),
+					&reply, sizeof(reply));
+}
+
 static const struct sof_ipc_pm_ops ipc3_pm_ops = {
 	.ctx_save = sof_ipc3_ctx_save,
 	.ctx_restore = sof_ipc3_ctx_restore,
 	.set_core_state = sof_ipc3_set_core_state,
+	.set_pm_gate = sof_ipc3_set_pm_gate,
 };
 
 const struct sof_ipc_ops ipc3_ops = {
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index f3c0c839d177..b27ec16ebdfa 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -656,9 +656,22 @@ static int sof_ipc4_ctx_save(struct snd_sof_dev *sdev)
 	return sof_ipc4_set_core_state(sdev, SOF_DSP_PRIMARY_CORE, false);
 }
 
+static int sof_ipc4_set_pm_gate(struct snd_sof_dev *sdev, u32 flags)
+{
+	struct sof_ipc4_msg msg = {{0}};
+
+	msg.primary = SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_SET_D0IX);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg.extension = flags;
+
+	return sof_ipc4_tx_msg(sdev, &msg, 0, NULL, 0, true);
+}
+
 static const struct sof_ipc_pm_ops ipc4_pm_ops = {
 	.ctx_save = sof_ipc4_ctx_save,
 	.set_core_state = sof_ipc4_set_core_state,
+	.set_pm_gate = sof_ipc4_set_pm_gate,
 };
 
 static int sof_ipc4_init(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 14f7adb2dc12..5f919162a555 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -425,11 +425,13 @@ struct sof_ipc_fw_tracing_ops {
  * @ctx_save:		Optional function pointer for context save
  * @ctx_restore:	Optional function pointer for context restore
  * @set_core_state:	Optional function pointer for turning on/off a DSP core
+ * @set_pm_gate:	Optional function pointer for pm gate settings
  */
 struct sof_ipc_pm_ops {
 	int (*ctx_save)(struct snd_sof_dev *sdev);
 	int (*ctx_restore)(struct snd_sof_dev *sdev);
 	int (*set_core_state)(struct snd_sof_dev *sdev, int core_idx, bool on);
+	int (*set_pm_gate)(struct snd_sof_dev *sdev, u32 flags);
 };
 
 /**
-- 
2.39.1

