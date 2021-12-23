Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9762047E26D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:39:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B6821890;
	Thu, 23 Dec 2021 12:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B6821890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259579;
	bh=XN787V49axW00iMlfaQVBeQ8NOlw1M/w9PJnOTlBoP4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZsaKcn8Az5PzMMpyFi7X4kqBxegjCkwB+iEq8suQ4h1Nnq7XfUz7DsBJ+qrHpSSDq
	 naIuUWVpbeCxiryz2jeVK/sMMnAUISCYBCn499+68SUAJiqCTrjaCZ8uB/gA4eUNyS
	 WUdNw2uociS3x2+veijogoAciQ2CvLy7CCN+oipU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88FB8F80525;
	Thu, 23 Dec 2021 12:36:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 336B0F8051D; Thu, 23 Dec 2021 12:36:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43AD7F80115
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43AD7F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g8JcsqUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259390; x=1671795390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XN787V49axW00iMlfaQVBeQ8NOlw1M/w9PJnOTlBoP4=;
 b=g8JcsqUt2GLToisjfkQBWprULhd1FfW9RCepd3qOwTP9zes+MwSuZ7iO
 /zW0mygWhTw+tuWWtlOrY+lIDXmfKtXNjwmrMnSD6e5JdnC6crJbvCCFT
 zQ9tlx168XoNBtqRCH279Vec1Os1Zy160IBXxFL0P/1CDzhCX4yF8H7+D
 8dQDKEf6kxmcbI0/5ZLeKbRQa7aS1/G+ICMxguobzmy1TT5sv6RdaTlJK
 yGOhXNBm+sSRW+de0DqFXioSptXbI65d2aRC+dcVpzVpMOrVumURxrDlS
 Ez2un97CidOLyfDc6AX7PwLov2BYPbXNb9u9FD/PjecE4PQlJvU/BdZNs Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180822"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180822"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065110"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:24 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 07/20] ASoC: SOF: Introduce new firmware state: SOF_FW_CRASHED
Date: Thu, 23 Dec 2021 13:36:15 +0200
Message-Id: <20211223113628.18582-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The SOF_FW_CRASHED state is meant to indicate the unfortunate case when the
firmware has crashed after a successful boot.

IPC tx timeout is not treated as indication of a firmware crash as it tends
to happen regularly while the firmware is operational.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
---
 sound/soc/sof/debug.c    | 1 +
 sound/soc/sof/ipc.c      | 2 +-
 sound/soc/sof/ops.c      | 2 ++
 sound/soc/sof/pm.c       | 7 +++++++
 sound/soc/sof/sof-priv.h | 1 +
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index cf7d95c33afe..5941316751dd 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -939,6 +939,7 @@ static const struct soc_fw_state_info {
 	{SOF_FW_BOOT_FAILED, "SOF_FW_BOOT_FAILED"},
 	{SOF_FW_BOOT_READY_FAILED, "SOF_FW_BOOT_READY_FAILED"},
 	{SOF_FW_BOOT_COMPLETE, "SOF_FW_BOOT_COMPLETE"},
+	{SOF_FW_CRASHED, "SOF_FW_CRASHED"},
 };
 
 static void snd_sof_dbg_print_fw_state(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 12860da1d373..898f261e8603 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -302,7 +302,7 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 	struct snd_sof_ipc_msg *msg;
 	int ret;
 
-	if (ipc->disable_ipc_tx)
+	if (ipc->disable_ipc_tx || sdev->fw_state == SOF_FW_CRASHED)
 		return -ENODEV;
 
 	/*
diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index edfd080a3e4f..ed46f33ce72b 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -176,6 +176,8 @@ void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset, bool non_recoverabl
 
 		snd_sof_dsp_dbg_dump(sdev, "DSP panic!",
 				     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
+		if (non_recoverable)
+			sof_set_fw_state(sdev, SOF_FW_CRASHED);
 		snd_sof_trace_notify_for_error(sdev);
 	}
 }
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index ac8ae6e422a7..f22b5ee23478 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -312,6 +312,13 @@ int snd_sof_prepare(struct device *dev)
 	/* will suspend to S3 by default */
 	sdev->system_suspend_target = SOF_SUSPEND_S3;
 
+	/*
+	 * if the firmware is crashed then we try to aim for S3 to reboot the
+	 * firmware
+	 */
+	if (sdev->fw_state == SOF_FW_CRASHED)
+		return 0;
+
 	if (!desc->use_acpi_target_states)
 		return 0;
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 0f849cdbfbc8..9bb30b2a516f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -382,6 +382,7 @@ enum snd_sof_fw_state {
 	SOF_FW_BOOT_FAILED,
 	SOF_FW_BOOT_READY_FAILED, /* firmware booted but fw_ready op failed */
 	SOF_FW_BOOT_COMPLETE,
+	SOF_FW_CRASHED,
 };
 
 /*
-- 
2.34.1

