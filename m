Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25040C524
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 14:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B571838;
	Wed, 15 Sep 2021 14:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B571838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631708614;
	bh=BH7TqCWyXk8H6MFJDKxX8wqM7FEhuyTuh2nLaa7rkbg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=glbjE5jVAcOaRsxDCr2hauN0be4Vyle+yYyNvQSIDd3pa96ey6YIPm5Hr5TraprOk
	 9DVQI43NlTcmfsgP0pO1Ap4yGwWKUfdQOivuBNN5A1EoonJza0PkaVXWv4ih8/5WAL
	 pjl/1rYSL7PD7oPuphhGKckroqSHyc5ZKOnhUWpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8411F804EB;
	Wed, 15 Sep 2021 14:21:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21B94F804E2; Wed, 15 Sep 2021 14:21:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8312BF802E8
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 14:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8312BF802E8
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219117491"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219117491"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544901580"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 02/12] ASoC: SOF: ipc: Remove snd_sof_dsp_mailbox_init()
Date: Wed, 15 Sep 2021 15:21:06 +0300
Message-Id: <20210915122116.18317-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
References: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@gmail.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The snd_sof_dsp_mailbox_init() is called only from sof_get_windows()
to set the sdev->dsp_box.offset/size and sdev->host_box.offset/size

Instead of using a function, set the offsets and sizes like we do for the
other boxes in sof_get_windows().

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 16 ----------------
 sound/soc/sof/loader.c   |  8 ++++++--
 sound/soc/sof/sof-priv.h |  3 ---
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index a4fe007a0e4d..9ca3681d266d 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -790,22 +790,6 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 }
 EXPORT_SYMBOL(snd_sof_ipc_set_get_comp_data);
 
-/*
- * IPC layer enumeration.
- */
-
-int snd_sof_dsp_mailbox_init(struct snd_sof_dev *sdev, u32 dspbox,
-			     size_t dspbox_size, u32 hostbox,
-			     size_t hostbox_size)
-{
-	sdev->dsp_box.offset = dspbox;
-	sdev->dsp_box.size = dspbox_size;
-	sdev->host_box.offset = hostbox;
-	sdev->host_box.size = hostbox_size;
-	return 0;
-}
-EXPORT_SYMBOL(snd_sof_dsp_mailbox_init);
-
 int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 2b38a77cd594..5bedb81f6bfb 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -470,8 +470,12 @@ static void sof_get_windows(struct snd_sof_dev *sdev)
 		return;
 	}
 
-	snd_sof_dsp_mailbox_init(sdev, inbox_offset, inbox_size,
-				 outbox_offset, outbox_size);
+	sdev->dsp_box.offset = inbox_offset;
+	sdev->dsp_box.size = inbox_size;
+
+	sdev->host_box.offset = outbox_offset;
+	sdev->host_box.size = outbox_size;
+
 	sdev->stream_box.offset = stream_offset;
 	sdev->stream_box.size = stream_size;
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index fd8423172d8f..b98fc9bf660b 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -503,9 +503,6 @@ void snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id);
 void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev);
 int snd_sof_ipc_stream_pcm_params(struct snd_sof_dev *sdev,
 				  struct sof_ipc_pcm_params *params);
-int snd_sof_dsp_mailbox_init(struct snd_sof_dev *sdev, u32 dspbox,
-			     size_t dspbox_size, u32 hostbox,
-			     size_t hostbox_size);
 int snd_sof_ipc_valid(struct snd_sof_dev *sdev);
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
 		       void *msg_data, size_t msg_bytes, void *reply_data,
-- 
2.33.0

