Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D583942FCB8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 22:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72BC8189A;
	Fri, 15 Oct 2021 22:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72BC8189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634328140;
	bh=qXot9fk/aVRF9L63q0hJ79hRm/LTUp408AoVOmHO3Co=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TAB20mBdOdexM0MRL0KbTFiZYafU6PuDgdruB7Ktl+fPWnepfK7e8K0VGncrV/Q52
	 8XPYLapwdwIpsVVDI9QFME9vCr8Wk1BOBNw2w1s6by6qyCWQrx1RF2NRuWCBlCYfVe
	 fdFgBqQrKbdsJLDXKhxRObW0a+P3cY/S/dGRe+ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D90F804FB;
	Fri, 15 Oct 2021 21:59:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3AB5F804FA; Fri, 15 Oct 2021 21:59:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4291F80430
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 21:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4291F80430
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="228257937"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="228257937"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="593081858"
Received: from ssureshc-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.190.93])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 4/4] ASoC: SOF: Intel: add .ack support for HDaudio
 platforms
Date: Fri, 15 Oct 2021 14:59:32 -0500
Message-Id: <20211015195932.224925-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
References: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

When we disable rewinds, then the .ack can be used to program SPIB
with the application pointer, which allows the HDaudio DMA to save
power by opportunistically bursting data transfers when the path to
memory is enabled (and conversely to shut it down when there are no
transfer requests).

The SPIB register can only be programmed with incremental values with
wrap-around after the DMA RUN bits are set. For simplicity, we set the
INFO_NO_REWINDS flag in the .open callback when we already need to
program the SNDRV_PCM_INFO_EXPLICIT_SYNC flag.

Rewinds are not used by many applications. One notable application
using rewinds is PulseAudio. Practical experiments with
Ubuntu/PulseAudio default settings did not show any audible issues,
but the user may hear volume changes and notification with a delay,
depending on the size of the ring buffer and latency constraints.

The choice of disabling rewinds is exposed as a kernel parameter and
not a Kconfig option to avoid any undesirable side-effects.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/cnl.c        |  1 +
 sound/soc/sof/intel/hda-pcm.c    | 41 ++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-stream.c |  2 ++
 sound/soc/sof/intel/hda.h        |  1 +
 sound/soc/sof/intel/tgl.c        |  1 +
 6 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 917f78cf6daf..689679014ade 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -78,6 +78,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.pcm_hw_free	= hda_dsp_stream_hw_free,
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
+	.pcm_ack	= hda_dsp_pcm_ack,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
 	/* probe callbacks */
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 3957e2b3db32..d128c08ba726 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -283,6 +283,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.pcm_hw_free	= hda_dsp_stream_hw_free,
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
+	.pcm_ack	= hda_dsp_pcm_ack,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
 	/* probe callbacks */
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index cc8ddef37f37..875350283eac 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -32,6 +32,10 @@ static bool hda_always_enable_dmi_l1;
 module_param_named(always_enable_dmi_l1, hda_always_enable_dmi_l1, bool, 0444);
 MODULE_PARM_DESC(always_enable_dmi_l1, "SOF HDA always enable DMI l1");
 
+static bool hda_disable_rewinds = IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_DISABLE_REWINDS);
+module_param_named(disable_rewinds, hda_disable_rewinds, bool, 0444);
+MODULE_PARM_DESC(disable_rewinds, "SOF HDA disable rewinds");
+
 u32 hda_dsp_get_mult_div(struct snd_sof_dev *sdev, int rate)
 {
 	switch (rate) {
@@ -120,8 +124,11 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 		return ret;
 	}
 
-	/* disable SPIB, to enable buffer wrap for stream */
-	hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
+	/* enable SPIB when rewinds are disabled */
+	if (hda_disable_rewinds)
+		hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_ENABLE, 0);
+	else
+		hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
 
 	/* update no_stream_position flag for ipc params */
 	if (hda && hda->no_ipc_position) {
@@ -140,6 +147,29 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+/* update SPIB register with appl position */
+int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct hdac_ext_stream *stream = stream_to_hdac_ext_stream(hstream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	ssize_t appl_pos, buf_size;
+	u32 spib;
+
+	appl_pos = frames_to_bytes(runtime, runtime->control->appl_ptr);
+	buf_size = frames_to_bytes(runtime, runtime->buffer_size);
+
+	spib = appl_pos % buf_size;
+
+	/* Allowable value for SPIB is 1 byte to max buffer size */
+	if (!spib)
+		spib = buf_size;
+
+	sof_io_write(sdev, stream->spib_addr, spib);
+
+	return 0;
+}
+
 int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream, int cmd)
 {
@@ -234,6 +264,13 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
+	/*
+	 * if we want the .ack to work, we need to prevent the status and
+	 * control from being mapped
+	 */
+	if (hda_disable_rewinds)
+		runtime->hw.info |= SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_EXPLICIT_SYNC;
+
 	/*
 	 * All playback streams are DMI L1 capable, capture streams need
 	 * pause push/release to be disabled
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 1d845c2cbc33..b6f037815344 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -655,6 +655,8 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 					SOF_HDA_REG_PP_PPCTL, mask, 0);
 	spin_unlock_irq(&bus->reg_lock);
 
+	hda_dsp_stream_spib_config(sdev, link_dev, HDA_DSP_SPIB_DISABLE, 0);
+
 	stream->substream = NULL;
 
 	return 0;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 1195018a1f4f..6829d36fbfe9 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -533,6 +533,7 @@ int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream, int cmd);
 snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream);
+int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream);
 
 /*
  * DSP Stream Operations.
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 48da8e7a67bc..2a29058e0c20 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -73,6 +73,7 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 	.pcm_hw_free	= hda_dsp_stream_hw_free,
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
+	.pcm_ack	= hda_dsp_pcm_ack,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
 	/* probe callbacks */
-- 
2.25.1

