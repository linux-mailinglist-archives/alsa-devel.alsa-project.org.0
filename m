Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FBD10346
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 01:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 234541692;
	Wed,  1 May 2019 01:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 234541692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556666584;
	bh=IEUhX6r8ifAlMvmDnJnTi1XH/v4quMi/am9mc0cs1No=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WyMI8Gck+BPSx6kasorQKD4UXA0v6+2zraA6YYzNBjVUun5f1bCTYxj43AU4nRXwG
	 7lAHK3kFp+VAsf3yHumcXm3jhwzzclUuVCja2yc3rhpl8Dp3sSiDjt6ZSPwXH128+d
	 Vni99QIwuuWpzu9rzg4UhA69jeRz317IdHl1dmwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E812CF8977A;
	Wed,  1 May 2019 01:10:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36C95F89726; Wed,  1 May 2019 01:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38D3CF89731
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 01:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38D3CF89731
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 16:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="166540975"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2019 16:10:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 18:09:31 -0500
Message-Id: <20190430230934.4321-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 16/19] ASoC: SOF: intel: hda: add
	hw_params_upon_resume flag for hda stream
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The prepare() ioctl for BE dai link gets called both
when the stream is started and when it is resumed from
suspend. SOF uses this ioctl to set the hw params
again only if the stream has been suspended.

When the stream is started, the hw_params ioctl gets called
before prepare() and hw_params is set for the BE dai link.
So the prepare call does not need to do anything further.

When the stream resumes after system suspend, SOF requires
that the hw_params be set again for the BE dai. In order
to determine which streams should set the hw params
during prepare(), an internal flag called "hw_params_upon_resume"
is introduced in struct sof_intel_hda_stream. The flag is set
for hda streams when the sof device suspends and is
cleared after hw_params is set.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     |  1 +
 sound/soc/sof/intel/cnl.c     |  1 +
 sound/soc/sof/intel/hda-dai.c | 23 ++++++++++++++---------
 sound/soc/sof/intel/hda-dsp.c | 16 ++++++++++++++++
 sound/soc/sof/intel/hda.h     |  2 ++
 sound/soc/sof/ops.h           |  6 ++++++
 sound/soc/sof/pm.c            |  3 +++
 sound/soc/sof/sof-priv.h      |  1 +
 8 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 026dde839621..d1fb2f2ba1e1 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -91,6 +91,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.resume			= hda_dsp_resume,
 	.runtime_suspend	= hda_dsp_runtime_suspend,
 	.runtime_resume		= hda_dsp_runtime_resume,
+	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
 };
 EXPORT_SYMBOL(sof_apl_ops);
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index d128839b2450..2eac20bbcaea 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -225,6 +225,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.resume			= hda_dsp_resume,
 	.runtime_suspend	= hda_dsp_runtime_suspend,
 	.runtime_resume		= hda_dsp_runtime_resume,
+	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
 };
 EXPORT_SYMBOL(sof_cnl_ops);
 
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 830328af19c5..e1decf25aeac 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -131,12 +131,17 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_ext_stream *link_dev;
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct sof_intel_hda_stream *hda_stream;
 	struct hda_pipe_params p_params = {0};
 	struct hdac_ext_link *link;
 	int stream_tag;
 
 	link_dev = snd_soc_dai_get_dma_data(dai, substream);
 
+	hda_stream = container_of(link_dev, struct sof_intel_hda_stream,
+				  hda_stream);
+	hda_stream->hw_params_upon_resume = 0;
+
 	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
 	if (!link)
 		return -EINVAL;
@@ -168,22 +173,22 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 static int hda_link_pcm_prepare(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct hdac_ext_stream *link_dev =
+				snd_soc_dai_get_dma_data(dai, substream);
+	struct sof_intel_hda_stream *hda_stream;
 	struct snd_sof_dev *sdev =
-		snd_soc_component_get_drvdata(dai->component);
-	struct snd_sof_pcm *spcm;
+				snd_soc_component_get_drvdata(dai->component);
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	int stream = substream->stream;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
-	if (!spcm)
-		return -EINVAL;
+	hda_stream = container_of(link_dev, struct sof_intel_hda_stream,
+				  hda_stream);
 
 	/* setup hw_params again only if resuming from system suspend */
-	if (!spcm->hw_params_upon_resume[stream])
+	if (!hda_stream->hw_params_upon_resume)
 		return 0;
 
-	dev_dbg(sdev->dev, "hda: prepare stream %d dir %d\n",
-		spcm->pcm.pcm_id, substream->stream);
+	dev_dbg(sdev->dev, "hda: prepare stream dir %d\n", substream->stream);
 
 	return hda_link_hw_params(substream, &rtd->dpcm[stream].hw_params,
 				  dai);
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 311fed502e09..5b73115a0b78 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -453,3 +453,19 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, int state)
 
 	return 0;
 }
+
+void hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct sof_intel_hda_stream *hda_stream;
+	struct hdac_ext_stream *stream;
+	struct hdac_stream *s;
+
+	/* set internal flag for BE */
+	list_for_each_entry(s, &bus->stream_list, list) {
+		stream = stream_to_hdac_ext_stream(s);
+		hda_stream = container_of(stream, struct sof_intel_hda_stream,
+					  hda_stream);
+		hda_stream->hw_params_upon_resume = 1;
+	}
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 7cb2fb92c4eb..4b00e5d88565 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -409,6 +409,7 @@ static inline struct hda_bus *sof_to_hbus(struct snd_sof_dev *s)
 struct sof_intel_hda_stream {
 	struct hdac_ext_stream hda_stream;
 	struct sof_intel_stream stream;
+	int hw_params_upon_resume; /* set up hw_params upon resume */
 };
 
 #define bus_to_sof_hda(bus) \
@@ -443,6 +444,7 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, int state);
 int hda_dsp_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state);
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
+void hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
 void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags);
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
 
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 2a5d4c63f160..b8e2bf1fee24 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -134,6 +134,12 @@ static inline int snd_sof_dsp_runtime_suspend(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static inline void snd_sof_dsp_hw_params_upon_resume(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev)->set_hw_params_upon_resume)
+		sof_ops(sdev)->set_hw_params_upon_resume(sdev);
+}
+
 static inline int snd_sof_dsp_set_clk(struct snd_sof_dev *sdev, u32 freq)
 {
 	if (sof_ops(sdev)->set_clk)
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index fc599e1b6f65..8ef1d51025d8 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -227,6 +227,9 @@ static void sof_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 				spcm->hw_params_upon_resume[dir] = 1;
 		}
 	}
+
+	/* set internal flag for BE */
+	snd_sof_dsp_hw_params_upon_resume(sdev);
 }
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index bbc285018f9a..170adc21ef17 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -166,6 +166,7 @@ struct snd_sof_dsp_ops {
 	int (*runtime_suspend)(struct snd_sof_dev *sof_dev,
 			       int state); /* optional */
 	int (*runtime_resume)(struct snd_sof_dev *sof_dev); /* optional */
+	void (*set_hw_params_upon_resume)(struct snd_sof_dev *sdev); /* optional */
 
 	/* DSP clocking */
 	int (*set_clk)(struct snd_sof_dev *sof_dev, u32 freq); /* optional */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
