Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD23A3541
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 22:58:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2CA017E2;
	Thu, 10 Jun 2021 22:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2CA017E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623358714;
	bh=ecisgEzfIz10iiXyJqZ/4caQ5CCaWzOKgqYzCwXjOzk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mi7UK/omBc/gpAdTmvD8479C5AErE9xgkb4eVG/vnUPLZmKVVNkTTpj4KnO9oyBd0
	 qm1y24wTvyDnH5auWM7Yo65/14+n8GX6DAtZvCivUo9fHh01sltHSBiaYPxmUvbOmJ
	 3POsTXP1CunjqAq+6mmosXZyCmPkqWUqfJa5OYy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA2BEF804F2;
	Thu, 10 Jun 2021 22:54:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74130F804E1; Thu, 10 Jun 2021 22:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEC25F804C1
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 22:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC25F804C1
IronPort-SDR: CoyCA/dOxRCTCgHW5Qiti98r3BpuFiXdySIIEU3xtK73fdBAHC7PP3dZV9VrzTQ1R1wgxW+Hr2
 qN1J2QpnngNA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="226812427"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="226812427"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:55 -0700
IronPort-SDR: gcQZYQCH+6WA7x1mbu/yPvt8EDmyj2u1jkr/xinkL/9vtHp3amMiu/5tGGHOXh8DEOjW56yyAi
 0GSRudbnQ7OA==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="620183651"
Received: from umedepal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.170.65])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/8] ASoC: SOF: Intel: add .ack support for HDaudio platforms
Date: Thu, 10 Jun 2021 15:53:26 -0500
Message-Id: <20210610205326.1176400-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
wrap-around after the DMA RUN bits are set. The hdac stream structure
is extended to keep track of the previous appl_ptr, and compared with
the suggested value. When a rewind is detected, a negative error code
is returned and the ALSA core will restore the old value in
pcm_lib_apply_appl_ptr().

Rewinds are only used by PulseAudio. If rewinds are disabled by
mistake in a distribution where PulseAudio is used, the user may hear
volume changes and notification with a delay, depending on the size of
the ring buffer and latency constraints. Practical experiments with
Ubuntu default settings did not show any audible issues.

Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio_ext.h      |  5 ++-
 sound/soc/sof/intel/Kconfig      | 10 ++++++
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/cnl.c        |  1 +
 sound/soc/sof/intel/hda-pcm.c    | 57 ++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-stream.c |  2 ++
 sound/soc/sof/intel/hda.h        |  1 +
 sound/soc/sof/intel/tgl.c        |  1 +
 8 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index a125e3814b58..33e1aa61d088 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -51,7 +51,8 @@ enum hdac_ext_stream_type {
  * @decoupled: stream host and link is decoupled
  * @link_locked: link is locked
  * @link_prepared: link is prepared
- * link_substream: link substream
+ * @link_substream: link substream
+ * @old_appl_ptr: last appl_ptr to double-check rewinds when SPIB is used.
  */
 struct hdac_ext_stream {
 	struct hdac_stream hstream;
@@ -71,6 +72,8 @@ struct hdac_ext_stream {
 	bool link_prepared;
 
 	struct snd_pcm_substream *link_substream;
+
+	snd_pcm_uframes_t old_appl_ptr;
 };
 
 #define hdac_stream(s)		(&(s)->hstream)
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 219cf0bf9633..904eabd958d9 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -249,6 +249,16 @@ config SND_SOC_SOF_HDA_PROBES
 	  Say Y if you want to enable probes.
 	  If unsure, select "N".
 
+config SND_SOC_SOF_HDA_DISABLE_REWINDS
+	bool "SOF Intel-HDA disable rewinds"
+	help
+	  This option disables ALSA rewinds for HDaudio platforms, which
+	  will help enable power savings capabilities.
+	  ALSA rewinds are only used by PulseAudio, so can be disabled
+	  for all distributions relying on PipeWire, JACK or CRAS.
+	  Say Y if you want to disable rewinds.
+	  If unsure, select "N".
+
 endif ## SND_SOC_SOF_HDA_COMMON
 
 config SND_SOC_SOF_HDA_LINK_BASELINE
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index c7ed2b3d6abc..854b90a9a511 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -73,6 +73,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.pcm_hw_free	= hda_dsp_stream_hw_free,
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
+	.pcm_ack	= hda_dsp_pcm_ack,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
 	/* probe callbacks */
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 821f25fbcf08..93e075ccb8b8 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -278,6 +278,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.pcm_hw_free	= hda_dsp_stream_hw_free,
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
+	.pcm_ack	= hda_dsp_pcm_ack,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
 	/* probe callbacks */
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index aaa7686c00ee..b53194c63057 100644
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
@@ -140,12 +147,51 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
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
+	if (!hda_disable_rewinds)
+		return 0;
+
+	/*
+	 * paranoia check: if a rewind request took place after the RUN bits were programmed,
+	 * deny it since hardware only supports monotonic (modulo) increments for SPIB.
+	 */
+	if (hstream->running) {
+		if (runtime->control->appl_ptr < stream->old_appl_ptr)
+			return -EINVAL;
+		stream->old_appl_ptr = runtime->control->appl_ptr;
+	}
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
 	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct hdac_ext_stream *stream = stream_to_hdac_ext_stream(hstream);
 
+	stream->old_appl_ptr = runtime->control->appl_ptr;
+
 	return hda_dsp_stream_trigger(sdev, stream, cmd);
 }
 
@@ -234,6 +280,13 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
+	/*
+	 * if we want the .ack to work, we need to prevent the status and
+	 * control from being mapped
+	 */
+	if (hda_disable_rewinds)
+		runtime->hw.info |= SNDRV_PCM_INFO_NO_STATUS_MMAP;
+
 	/*
 	 * All playback and D0i3 compatible streams are DMI L1 capable, others need
 	 * pause push/release to be disabled
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 4e49b7b16b4c..96b892dbf7b8 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -621,6 +621,8 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 					SOF_HDA_REG_PP_PPCTL, mask, 0);
 	spin_unlock_irq(&bus->reg_lock);
 
+	hda_dsp_stream_spib_config(sdev, link_dev, HDA_DSP_SPIB_DISABLE, 0);
+
 	stream->substream = NULL;
 
 	return 0;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 4d44f8910393..a3a04890ca4f 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -543,6 +543,7 @@ int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream, int cmd);
 snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream);
+int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream);
 
 /*
  * DSP Stream Operations.
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 2ed788304414..79b6e8a7c905 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -68,6 +68,7 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 	.pcm_hw_free	= hda_dsp_stream_hw_free,
 	.pcm_trigger	= hda_dsp_pcm_trigger,
 	.pcm_pointer	= hda_dsp_pcm_pointer,
+	.pcm_ack	= hda_dsp_pcm_ack,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
 	/* probe callbacks */
-- 
2.25.1

