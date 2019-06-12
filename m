Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E27342D82
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29FF917D5;
	Wed, 12 Jun 2019 19:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29FF917D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360627;
	bh=bQ6q7j0AB042CA2/hiZIiXL13HSP3hixAh3S9HIiOzk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MgxaMCEy1iirXmCLWauuFCaXIq+2Be5YOj1nzvgX4h1XekLs/cUZ4IdaGE33YtNb7
	 AXagLSxqW4kjSjGwkg82OK5SvsnctKTAEllZzAdTZL/YV22TckoWIvOvo8lpay9zKJ
	 SOPid+i+PCWvYpLamFmV+LtKhJJTOlM4e6C6BWMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1770F89752;
	Wed, 12 Jun 2019 19:24:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53F38F8973E; Wed, 12 Jun 2019 19:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C7E0F8970C
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C7E0F8970C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:55 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:39 -0500
Message-Id: <20190612172347.22338-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 07/15] ASoC: SOF: Intel: hda: couple host and
	link DMA during FE hw_free
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Host and link DMA are decoupled during FE hw_params. So,
they must be coupled in hw_free if the link DMA channel
is idle.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/cnl.c        |  1 +
 sound/soc/sof/intel/hda-stream.c | 20 ++++++++++++++++++++
 sound/soc/sof/intel/hda.h        |  2 ++
 sound/soc/sof/ops.h              | 11 +++++++++++
 sound/soc/sof/pcm.c              |  7 +++++++
 sound/soc/sof/sof-priv.h         |  4 ++++
 7 files changed, 46 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index f215d80dce2c..43d1c9f31ec4 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -61,6 +61,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.pcm_open	= hda_dsp_pcm_open,
 	.pcm_close	= hda_dsp_pcm_close,
 	.pcm_hw_params	= hda_dsp_pcm_hw_params,
+	.pcm_hw_free	= hda_dsp_stream_hw_free,
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index d59305787fc3..3840f81767fa 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -219,6 +219,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.pcm_open	= hda_dsp_pcm_open,
 	.pcm_close	= hda_dsp_pcm_close,
 	.pcm_hw_params	= hda_dsp_pcm_hw_params,
+	.pcm_hw_free	= hda_dsp_stream_hw_free,
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
 
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index a3f7c91469ec..ff6ab0c45d8e 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -438,6 +438,26 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	return ret;
 }
 
+int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
+			   struct snd_pcm_substream *substream)
+{
+	struct hdac_stream *stream = substream->runtime->private_data;
+	struct hdac_ext_stream *link_dev = container_of(stream,
+							struct hdac_ext_stream,
+							hstream);
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	u32 mask = 0x1 << stream->index;
+
+	spin_lock(&bus->reg_lock);
+	/* couple host and link DMA if link DMA channel is idle */
+	if (!link_dev->link_locked)
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
+					SOF_HDA_REG_PP_PPCTL, mask, 0);
+	spin_unlock(&bus->reg_lock);
+
+	return 0;
+}
+
 irqreturn_t hda_dsp_stream_interrupt(int irq, void *context)
 {
 	struct hdac_bus *bus = context;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 327621ef5cf3..8812dae9cf7a 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -468,6 +468,8 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct sof_ipc_stream_params *ipc_params);
+int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
+			   struct snd_pcm_substream *substream);
 int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream, int cmd);
 snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index a23297353750..45a3d1091163 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -287,6 +287,17 @@ snd_sof_pcm_platform_hw_params(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+/* host stream hw free */
+static inline int
+snd_sof_pcm_platform_hw_free(struct snd_sof_dev *sdev,
+			     struct snd_pcm_substream *substream)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->pcm_hw_free)
+		return sof_ops(sdev)->pcm_hw_free(sdev, substream);
+
+	return 0;
+}
+
 /* host stream trigger */
 static inline int
 snd_sof_pcm_platform_trigger(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 6dc5f97be0bc..334e9d59b1ba 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -251,6 +251,13 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 
 	cancel_work_sync(&spcm->stream[substream->stream].period_elapsed_work);
 
+	if (ret < 0)
+		return ret;
+
+	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: platform hw free failed\n");
+
 	return ret;
 }
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 4d8c06eaf571..e04418615129 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -143,6 +143,10 @@ struct snd_sof_dsp_ops {
 			     struct snd_pcm_hw_params *params,
 			     struct sof_ipc_stream_params *ipc_params); /* optional */
 
+	/* host stream hw_free */
+	int (*pcm_hw_free)(struct snd_sof_dev *sdev,
+			   struct snd_pcm_substream *substream); /* optional */
+
 	/* host stream trigger */
 	int (*pcm_trigger)(struct snd_sof_dev *sdev,
 			   struct snd_pcm_substream *substream,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
