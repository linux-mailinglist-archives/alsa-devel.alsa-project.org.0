Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD141AD1D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 12:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 664C21683;
	Tue, 28 Sep 2021 12:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 664C21683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632825404;
	bh=i030mvZ7uBRpL9yojPG7QEicgEFWKVgNf5rXR9fJHOo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kYpoOpCugPmW8hfghqbTzvpQrseLGiG5RDMwbNbBUVbDsIw11NHP+k0GWXWKeBs23
	 KorMRSdEcp5sEy/8n0ncPYGufSUx+uklFDclC1TijToLDvdn/QW5yRxrE1DiaSd3AH
	 04m2U73hlnhAXEVY0xpgE4GpGexT7HS51I7J6Y/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB9F7F80105;
	Tue, 28 Sep 2021 12:35:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B80DF804AD; Tue, 28 Sep 2021 12:35:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A754BF800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 12:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A754BF800DE
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="310217403"
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="310217403"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 03:35:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="476241959"
Received: from elisabal-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.25])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 03:35:12 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH] ASoC: SOF: add error handling to snd_sof_ipc_msg_data()
Date: Tue, 28 Sep 2021 13:35:16 +0300
Message-Id: <20210928103516.8066-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

If an invalid stream is passed to snd_sof_ipc_msg_data() it won't
fill the provided object with data. The caller has to be able to
recognise such cases to avoid handling invalid data. Make the
function return an error when failing.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c        |  7 +++---
 sound/soc/sof/imx/imx8m.c       |  7 +++---
 sound/soc/sof/intel/hda-ipc.c   | 15 +++++++-----
 sound/soc/sof/intel/hda.h       |  6 ++---
 sound/soc/sof/intel/intel-ipc.c | 14 +++++++----
 sound/soc/sof/ipc.c             | 41 +++++++++++++++++++++++++--------
 sound/soc/sof/ops.h             |  8 +++----
 sound/soc/sof/sof-priv.h        | 12 +++++-----
 8 files changed, 71 insertions(+), 39 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 82ca920a69ab..e6eed53f8644 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -375,11 +375,12 @@ static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	}
 }
 
-static void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
-			      struct snd_pcm_substream *substream,
-			      void *p, size_t sz)
+static int imx8_ipc_msg_data(struct snd_sof_dev *sdev,
+			     struct snd_pcm_substream *substream,
+			     void *p, size_t sz)
 {
 	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
+	return 0;
 }
 
 static int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 76f4ffd9d540..5579cbef4a93 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -238,11 +238,12 @@ static int imx8m_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	}
 }
 
-static void imx8m_ipc_msg_data(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
-			       void *p, size_t sz)
+static int imx8m_ipc_msg_data(struct snd_sof_dev *sdev,
+			      struct snd_pcm_substream *substream,
+			      void *p, size_t sz)
 {
 	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
+	return 0;
 }
 
 static int imx8m_ipc_pcm_params(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index acfeca42604c..11f20a5a62df 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -253,9 +253,9 @@ int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 	return SRAM_WINDOW_OFFSET(id);
 }
 
-void hda_ipc_msg_data(struct snd_sof_dev *sdev,
-		      struct snd_pcm_substream *substream,
-		      void *p, size_t sz)
+int hda_ipc_msg_data(struct snd_sof_dev *sdev,
+		     struct snd_pcm_substream *substream,
+		     void *p, size_t sz)
 {
 	if (!substream || !sdev->stream_box.size) {
 		sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
@@ -268,10 +268,13 @@ void hda_ipc_msg_data(struct snd_sof_dev *sdev,
 					  hda_stream.hstream);
 
 		/* The stream might already be closed */
-		if (hstream)
-			sof_mailbox_read(sdev, hda_stream->stream.posn_offset,
-					 p, sz);
+		if (!hstream)
+			return -ESTRPIPE;
+
+		sof_mailbox_read(sdev, hda_stream->stream.posn_offset, p, sz);
 	}
+
+	return 0;
 }
 
 int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 087fa06d5210..cb5a1b17f153 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -563,9 +563,9 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 			       struct hdac_ext_stream *stream,
 			       int enable, u32 size);
 
-void hda_ipc_msg_data(struct snd_sof_dev *sdev,
-		      struct snd_pcm_substream *substream,
-		      void *p, size_t sz);
+int hda_ipc_msg_data(struct snd_sof_dev *sdev,
+		     struct snd_pcm_substream *substream,
+		     void *p, size_t sz);
 int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
 		       struct snd_pcm_substream *substream,
 		       const struct sof_ipc_pcm_params_reply *reply);
diff --git a/sound/soc/sof/intel/intel-ipc.c b/sound/soc/sof/intel/intel-ipc.c
index de66f8a82a07..df37187c8427 100644
--- a/sound/soc/sof/intel/intel-ipc.c
+++ b/sound/soc/sof/intel/intel-ipc.c
@@ -25,9 +25,9 @@ struct intel_stream {
 };
 
 /* Mailbox-based Intel IPC implementation */
-void intel_ipc_msg_data(struct snd_sof_dev *sdev,
-			struct snd_pcm_substream *substream,
-			void *p, size_t sz)
+int intel_ipc_msg_data(struct snd_sof_dev *sdev,
+		       struct snd_pcm_substream *substream,
+		       void *p, size_t sz)
 {
 	if (!substream || !sdev->stream_box.size) {
 		sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
@@ -35,9 +35,13 @@ void intel_ipc_msg_data(struct snd_sof_dev *sdev,
 		struct intel_stream *stream = substream->runtime->private_data;
 
 		/* The stream might already be closed */
-		if (stream)
-			sof_mailbox_read(sdev, stream->posn_offset, p, sz);
+		if (!stream)
+			return -ESTRPIPE;
+
+		sof_mailbox_read(sdev, stream->posn_offset, p, sz);
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL_NS(intel_ipc_msg_data, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 5d41924f37a6..152d36a6253d 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -394,6 +394,7 @@ static void ipc_comp_notification(struct snd_sof_dev *sdev,
 {
 	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
 	struct sof_ipc_ctrl_data *cdata;
+	int ret;
 
 	switch (msg_type) {
 	case SOF_IPC_COMP_GET_VALUE:
@@ -403,7 +404,12 @@ static void ipc_comp_notification(struct snd_sof_dev *sdev,
 			return;
 
 		/* read back full message */
-		snd_sof_ipc_msg_data(sdev, NULL, cdata, hdr->size);
+		ret = snd_sof_ipc_msg_data(sdev, NULL, cdata, hdr->size);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error: failed to read component event: %d\n", ret);
+			goto err;
+		}
 		break;
 	default:
 		dev_err(sdev->dev, "error: unhandled component message %#x\n", msg_type);
@@ -412,6 +418,7 @@ static void ipc_comp_notification(struct snd_sof_dev *sdev,
 
 	snd_sof_control_notify(sdev, cdata);
 
+err:
 	kfree(cdata);
 }
 
@@ -420,10 +427,14 @@ void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc_cmd_hdr hdr;
 	u32 cmd, type;
-	int err = 0;
+	int err;
 
 	/* read back header */
-	snd_sof_ipc_msg_data(sdev, NULL, &hdr, sizeof(hdr));
+	err = snd_sof_ipc_msg_data(sdev, NULL, &hdr, sizeof(hdr));
+	if (err < 0) {
+		dev_warn(sdev->dev, "failed to read IPC header: %d\n", err);
+		return;
+	}
 	ipc_log_header(sdev->dev, "ipc rx", hdr.cmd);
 
 	cmd = hdr.cmd & SOF_GLB_TYPE_MASK;
@@ -477,12 +488,16 @@ EXPORT_SYMBOL(snd_sof_ipc_msgs_rx);
 static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_type)
 {
 	struct sof_ipc_dma_trace_posn posn;
+	int ret;
 
 	switch (msg_type) {
 	case SOF_IPC_TRACE_DMA_POSITION:
 		/* read back full message */
-		snd_sof_ipc_msg_data(sdev, NULL, &posn, sizeof(posn));
-		snd_sof_trace_update_pos(sdev, &posn);
+		ret = snd_sof_ipc_msg_data(sdev, NULL, &posn, sizeof(posn));
+		if (ret < 0)
+			dev_warn(sdev->dev, "failed to read trace position: %d\n", ret);
+		else
+			snd_sof_trace_update_pos(sdev, &posn);
 		break;
 	default:
 		dev_err(sdev->dev, "error: unhandled trace message %#x\n", msg_type);
@@ -500,7 +515,7 @@ static void ipc_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 	struct snd_sof_pcm_stream *stream;
 	struct sof_ipc_stream_posn posn;
 	struct snd_sof_pcm *spcm;
-	int direction;
+	int direction, ret;
 
 	spcm = snd_sof_find_spcm_comp(scomp, msg_id, &direction);
 	if (!spcm) {
@@ -511,7 +526,11 @@ static void ipc_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 	}
 
 	stream = &spcm->stream[direction];
-	snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	if (ret < 0) {
+		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
+		return;
+	}
 
 	dev_vdbg(sdev->dev, "posn : host 0x%llx dai 0x%llx wall 0x%llx\n",
 		 posn.host_posn, posn.dai_posn, posn.wallclock);
@@ -530,7 +549,7 @@ static void ipc_xrun(struct snd_sof_dev *sdev, u32 msg_id)
 	struct snd_sof_pcm_stream *stream;
 	struct sof_ipc_stream_posn posn;
 	struct snd_sof_pcm *spcm;
-	int direction;
+	int direction, ret;
 
 	spcm = snd_sof_find_spcm_comp(scomp, msg_id, &direction);
 	if (!spcm) {
@@ -540,7 +559,11 @@ static void ipc_xrun(struct snd_sof_dev *sdev, u32 msg_id)
 	}
 
 	stream = &spcm->stream[direction];
-	snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	if (ret < 0) {
+		dev_warn(sdev->dev, "failed to read overrun position: %d\n", ret);
+		return;
+	}
 
 	dev_dbg(sdev->dev,  "posn XRUN: host %llx comp %d size %d\n",
 		posn.host_posn, posn.xrun_comp_id, posn.xrun_size);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index d40ce2581d94..a93aa5b943b2 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -422,11 +422,11 @@ static inline int snd_sof_load_firmware(struct snd_sof_dev *sdev)
 }
 
 /* host DSP message data */
-static inline void snd_sof_ipc_msg_data(struct snd_sof_dev *sdev,
-					struct snd_pcm_substream *substream,
-					void *p, size_t sz)
+static inline int snd_sof_ipc_msg_data(struct snd_sof_dev *sdev,
+				       struct snd_pcm_substream *substream,
+				       void *p, size_t sz)
 {
-	sof_ops(sdev)->ipc_msg_data(sdev, substream, p, sz);
+	return sof_ops(sdev)->ipc_msg_data(sdev, substream, p, sz);
 }
 
 /* host configure DSP HW parameters */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6b1dbae3344c..a6ded5bd0674 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -210,9 +210,9 @@ struct snd_sof_dsp_ops {
 #endif
 
 	/* host read DSP stream data */
-	void (*ipc_msg_data)(struct snd_sof_dev *sdev,
-			     struct snd_pcm_substream *substream,
-			     void *p, size_t sz); /* mandatory */
+	int (*ipc_msg_data)(struct snd_sof_dev *sdev,
+			    struct snd_pcm_substream *substream,
+			    void *p, size_t sz); /* mandatory */
 
 	/* host configure DSP HW parameters */
 	int (*ipc_pcm_params)(struct snd_sof_dev *sdev,
@@ -567,9 +567,9 @@ int sof_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 
 int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id);
 
-void intel_ipc_msg_data(struct snd_sof_dev *sdev,
-			struct snd_pcm_substream *substream,
-			void *p, size_t sz);
+int intel_ipc_msg_data(struct snd_sof_dev *sdev,
+		       struct snd_pcm_substream *substream,
+		       void *p, size_t sz);
 int intel_ipc_pcm_params(struct snd_sof_dev *sdev,
 			 struct snd_pcm_substream *substream,
 			 const struct sof_ipc_pcm_params_reply *reply);
-- 
2.33.0

