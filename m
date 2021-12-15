Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4C476044
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:09:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7656D1A74;
	Wed, 15 Dec 2021 19:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7656D1A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639591766;
	bh=pD/EZ6/m+t80Q47WulBWu7GKlKzMdMT5r27prPGQc50=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RpsHZB3w9dwuGfGq3PL7ZYfJpXOcsJpKqkzM9mE36bj3Cw1CE7TrtwZt9bFWEgJQB
	 tmP1qShRBKVNijGVFBUqUE4ODY0NHb9OAzqPjfvCpnL3hEALsd3UaYEY9U9M4y7Okt
	 a5Y9ZfYTPEI1R/8SKLw6BPr7m+2/YBwVAfBAUH58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81AC1F80516;
	Wed, 15 Dec 2021 19:07:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A772F801F5; Wed, 15 Dec 2021 19:07:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C853F801F5
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:06:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C853F801F5
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="302670996"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="302670996"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="662015041"
Received: from manamie-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.37.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:12 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/8] ASoC: SOF: ipc: Rename send parameter in
 snd_sof_ipc_set_get_comp_data()
Date: Wed, 15 Dec 2021 10:03:57 -0800
Message-Id: <20211215180404.53254-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
References: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Rename the send parameter to set in snd_sof_ipc_set_get_comp_data() and
sof_set_get_large_ctrl_data() to be more aligned with the function name.

No functional change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c       | 17 ++++++++---------
 sound/soc/sof/sof-audio.h |  3 +--
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 6771b444065d..670d780241a3 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -745,7 +745,7 @@ static int sof_get_ctrl_copy_params(enum sof_ipc_ctrl_type ctrl_type,
 static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 				       struct sof_ipc_ctrl_data *cdata,
 				       struct sof_ipc_ctrl_data_params *sparams,
-				       bool send)
+				       bool set)
 {
 	struct sof_ipc_ctrl_data *partdata;
 	size_t send_bytes;
@@ -760,7 +760,7 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 	if (!partdata)
 		return -ENOMEM;
 
-	if (send)
+	if (set)
 		err = sof_get_ctrl_copy_params(cdata->type, cdata, partdata,
 					       sparams);
 	else
@@ -789,7 +789,7 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 		msg_bytes -= send_bytes;
 		partdata->elems_remaining = msg_bytes;
 
-		if (send)
+		if (set)
 			memcpy(sparams->dst, sparams->src + offset, send_bytes);
 
 		err = sof_ipc_tx_message_unlocked(sdev->ipc,
@@ -801,7 +801,7 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 		if (err < 0)
 			break;
 
-		if (!send)
+		if (!set)
 			memcpy(sparams->dst + offset, sparams->src, send_bytes);
 
 		offset += pl_size;
@@ -819,8 +819,7 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 				  u32 ipc_cmd,
 				  enum sof_ipc_ctrl_type ctrl_type,
-				  enum sof_ipc_ctrl_cmd ctrl_cmd,
-				  bool send)
+				  enum sof_ipc_ctrl_cmd ctrl_cmd, bool set)
 {
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
@@ -858,7 +857,7 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 		/* write/read value header via mmaped region */
 		send_bytes = sizeof(struct sof_ipc_ctrl_value_chan) *
 		cdata->num_elems;
-		if (send)
+		if (set)
 			err = snd_sof_dsp_block_write(sdev, SOF_FW_BLK_TYPE_IRAM,
 						      scontrol->readback_offset,
 						      cdata->chanv, send_bytes);
@@ -870,7 +869,7 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 
 		if (err)
 			dev_err_once(sdev->dev, "error: %s TYPE_IRAM failed\n",
-				     send ? "write to" :  "read from");
+				     set ? "write to" :  "read from");
 		return err;
 	}
 
@@ -934,7 +933,7 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 		return -EINVAL;
 	}
 
-	err = sof_set_get_large_ctrl_data(sdev, cdata, &sparams, send);
+	err = sof_set_get_large_ctrl_data(sdev, cdata, &sparams, set);
 
 	if (err < 0)
 		dev_err(sdev->dev, "error: set/get large ctrl ipc comp %d\n",
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index e419e7082c28..1c1d68e220d5 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -242,8 +242,7 @@ static inline void snd_sof_compr_init_elapsed_work(struct work_struct *work) { }
 int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 				  u32 ipc_cmd,
 				  enum sof_ipc_ctrl_type ctrl_type,
-				  enum sof_ipc_ctrl_cmd ctrl_cmd,
-				  bool send);
+				  enum sof_ipc_ctrl_cmd ctrl_cmd, bool set);
 
 /* DAI link fixup */
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
-- 
2.25.1

