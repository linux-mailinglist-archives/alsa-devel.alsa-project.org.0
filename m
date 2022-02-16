Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248F4B8F2F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 18:34:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4541901;
	Wed, 16 Feb 2022 18:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4541901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645032853;
	bh=/5Z75X78ALFcyYzokybvfeqX1wsQKSnTmKhI75r1Yf0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RjVxjzLyxCxvPzAhvbwcJCOQC+JcTIVz247X6C03GJAY/3KmVlc/gM+ztCQIpUhTJ
	 4LjEje9CSulfnrQH3lsy2JdZU+Bs88q5/R8DQngo2yfeu1gq4VNJ4q+NF6hviUD9Bi
	 rKvKrgf5jUvYbmUUxRKG4JVnAT4fGo7s7x4tl5/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03953F8012E;
	Wed, 16 Feb 2022 18:33:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC105F80128; Wed, 16 Feb 2022 18:33:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF351F800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 18:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF351F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nnYfOuiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645032780; x=1676568780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/5Z75X78ALFcyYzokybvfeqX1wsQKSnTmKhI75r1Yf0=;
 b=nnYfOuiItiSgRJl0BsinhJ/GPWPRyxsXJj71nrt4xZyfgr8/6l3tJF4R
 OI+uYLddETc+KWQSeUvEPwRzMGT29+qLT61m/IJEIIs7FTJ3gBdsNLR6S
 erVFWvWmvstgDG8qEbfxgr4RQSy9OtmMWKrAcnZJ5kjhB9G2Q6pDFEnr7
 08wpoXlAjtYPxXPTHSGYGkFyUGHzmC63LbZpWYytMQhGWOLvAuZID0hpS
 QCtVO6cemEQ8/5JcfYc9CZTvb3JdmgugmAvhRv/jEgoTJRLnIVGCReN8N
 ADjcfTT1h+flSg22Ln3/WpCkg62izyA4WOZXIZVi5w1g0PGbGo2MJ5wRD w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230640251"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230640251"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="545068396"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 16 Feb 2022 09:32:52 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: hda/hdmi: add keep-alive support for ADL-P and DG2
Date: Wed, 16 Feb 2022 19:24:05 +0200
Message-Id: <20220216172405.3994959-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jyri Sarha <jyri.sarha@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

Implement HDA keep alive (KAE) support for Intel display codecs. When no
audio stream is active, the display codec will provide a continuous clock
and a valid but silent audio stream to any connected HDMI/DP receiver.
Without this, upon starting a new playback stream, initial samples may be
lost as many receivers require time to initialize for new clock.

This is a new feature in Intel AlderLake-P display codec implementation
and replaces the Intel i915 silent-stream extension that has been used
on older hardware. Main benefit of the new method is that codec no longer
needs to be kept in D0 power state.

This patch depends on commit 112a87c48e83 ("drm/i915/display: program
audio CDCLK-TS for keepalives").

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Jyri Sarha <jyri.sarha@intel.com>
---
 sound/pci/hda/Kconfig      |  19 ++---
 sound/pci/hda/patch_hdmi.c | 157 +++++++++++++++++++++++++++----------
 2 files changed, 127 insertions(+), 49 deletions(-)

V1->V2:
 - fix unbalance in snd_hda_power_up_pm()/snd_hda_power_down_pm()

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index febe1c2b7d9a..9f6c99c1d87b 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -285,15 +285,16 @@ config SND_HDA_INTEL_HDMI_SILENT_STREAM
 	bool "Enable Silent Stream always for HDMI"
 	depends on SND_HDA_INTEL
 	help
-	  Intel hardware has a feature called 'silent stream', that
-	  keeps external HDMI receiver's analog circuitry powered on
-	  avoiding 2-3 sec silence during playback start. This mechanism
-	  relies on setting channel_id as 0xf, sending info packet and
-	  preventing codec D3 entry (increasing  platform static power
-	  consumption when HDMI receiver is plugged-in). 2-3 sec silence
-	  at the playback start is expected whenever there is format change.
-	  (default is 2 channel format).
-	  Say Y to enable Silent Stream feature.
+	  Say Y to enable HD-Audio Keep Alive (KAE) aka Silent Stream
+	  for HDMI on hardware that supports the feature.
+
+	  When enabled, the HDMI/DisplayPort codec will continue to provide
+	  a continuous clock and a valid but silent data stream to
+	  any connected external receiver. This allows to avoid gaps
+	  at start of playback. Many receivers require multiple seconds
+	  to start playing audio after the clock has been stopped.
+	  This feature can impact power consumption as resources
+	  are kept reserved both at transmitter and receiver.
 
 endif
 
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 64fe025fda86..a7016d51b2ff 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -120,6 +120,12 @@ struct hdmi_pcm {
 	struct snd_kcontrol *eld_ctl;
 };
 
+enum {
+	SILENT_STREAM_OFF = 0,
+	SILENT_STREAM_KAE,	/* use standard HDA Keep-Alive */
+	SILENT_STREAM_I915,	/* Intel i915 extension */
+};
+
 struct hdmi_spec {
 	struct hda_codec *codec;
 	int num_cvts;
@@ -179,7 +185,7 @@ struct hdmi_spec {
 	hda_nid_t vendor_nid;
 	const int *port_map;
 	int port_num;
-	bool send_silent_stream; /* Flag to enable silent stream feature */
+	int silent_stream_type;
 };
 
 #ifdef CONFIG_SND_HDA_COMPONENT
@@ -1665,18 +1671,71 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 #define I915_SILENT_FORMAT_BITS	16
 #define I915_SILENT_FMT_MASK		0xf
 
+static void silent_stream_enable_i915(struct hda_codec *codec,
+				      struct hdmi_spec_per_pin *per_pin)
+{
+	unsigned int format;
+
+	snd_hdac_sync_audio_rate(&codec->core, per_pin->pin_nid,
+				 per_pin->dev_id, I915_SILENT_RATE);
+
+	/* trigger silent stream generation in hw */
+	format = snd_hdac_calc_stream_format(I915_SILENT_RATE, I915_SILENT_CHANNELS,
+					     I915_SILENT_FORMAT, I915_SILENT_FORMAT_BITS, 0);
+	snd_hda_codec_setup_stream(codec, per_pin->cvt_nid,
+				   I915_SILENT_FMT_MASK, I915_SILENT_FMT_MASK, format);
+	usleep_range(100, 200);
+	snd_hda_codec_setup_stream(codec, per_pin->cvt_nid, I915_SILENT_FMT_MASK, 0, format);
+
+	per_pin->channels = I915_SILENT_CHANNELS;
+	hdmi_setup_audio_infoframe(codec, per_pin, per_pin->non_pcm);
+}
+
+static void silent_stream_set_kae(struct hda_codec *codec,
+				  struct hdmi_spec_per_pin *per_pin,
+				  bool enable)
+{
+	unsigned int param;
+
+	codec_dbg(codec, "HDMI: KAE %d cvt-NID=0x%x\n", enable, per_pin->cvt_nid);
+
+	param = snd_hda_codec_read(codec, per_pin->cvt_nid, 0, AC_VERB_GET_DIGI_CONVERT_1, 0);
+	param = (param >> 16) & 0xff;
+
+	if (enable)
+		param |= AC_DIG3_KAE;
+	else
+		param &= ~AC_DIG3_KAE;
+
+	snd_hda_codec_write(codec, per_pin->cvt_nid, 0, AC_VERB_SET_DIGI_CONVERT_3, param);
+}
+
 static void silent_stream_enable(struct hda_codec *codec,
 				 struct hdmi_spec_per_pin *per_pin)
 {
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_cvt *per_cvt;
 	int cvt_idx, pin_idx, err;
-	unsigned int format;
+	int keep_power = 0;
+
+	/*
+	 * Power-up will call hdmi_present_sense, so the PM calls
+	 * have to be done without mutex held.
+	 */
+
+	err = snd_hda_power_up_pm(codec);
+	if (err < 0 && err != -EACCES) {
+		codec_err(codec,
+			  "Failed to power up codec for silent stream enable ret=[%d]\n", err);
+		snd_hda_power_down_pm(codec);
+		return;
+	}
 
 	mutex_lock(&per_pin->lock);
 
 	if (per_pin->setup) {
 		codec_dbg(codec, "hdmi: PCM already open, no silent stream\n");
+		err = -EBUSY;
 		goto unlock_out;
 	}
 
@@ -1703,22 +1762,23 @@ static void silent_stream_enable(struct hda_codec *codec,
 	/* configure unused pins to choose other converters */
 	pin_cvt_fixup(codec, per_pin, 0);
 
-	snd_hdac_sync_audio_rate(&codec->core, per_pin->pin_nid,
-				 per_pin->dev_id, I915_SILENT_RATE);
-
-	/* trigger silent stream generation in hw */
-	format = snd_hdac_calc_stream_format(I915_SILENT_RATE, I915_SILENT_CHANNELS,
-					     I915_SILENT_FORMAT, I915_SILENT_FORMAT_BITS, 0);
-	snd_hda_codec_setup_stream(codec, per_pin->cvt_nid,
-				   I915_SILENT_FMT_MASK, I915_SILENT_FMT_MASK, format);
-	usleep_range(100, 200);
-	snd_hda_codec_setup_stream(codec, per_pin->cvt_nid, I915_SILENT_FMT_MASK, 0, format);
-
-	per_pin->channels = I915_SILENT_CHANNELS;
-	hdmi_setup_audio_infoframe(codec, per_pin, per_pin->non_pcm);
+	switch (spec->silent_stream_type) {
+	case SILENT_STREAM_KAE:
+		silent_stream_set_kae(codec, per_pin, true);
+		break;
+	case SILENT_STREAM_I915:
+		silent_stream_enable_i915(codec, per_pin);
+		keep_power = 1;
+		break;
+	default:
+		break;
+	}
 
  unlock_out:
 	mutex_unlock(&per_pin->lock);
+
+	if (err || !keep_power)
+		snd_hda_power_down_pm(codec);
 }
 
 static void silent_stream_disable(struct hda_codec *codec,
@@ -1726,7 +1786,16 @@ static void silent_stream_disable(struct hda_codec *codec,
 {
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_cvt *per_cvt;
-	int cvt_idx;
+	int cvt_idx, err;
+
+	err = snd_hda_power_up_pm(codec);
+	if (err < 0 && err != -EACCES) {
+		codec_err(codec,
+			  "Failed to power up codec for silent stream disable ret=[%d]\n",
+			  err);
+		snd_hda_power_down_pm(codec);
+		return;
+	}
 
 	mutex_lock(&per_pin->lock);
 	if (!per_pin->silent_stream)
@@ -1741,11 +1810,21 @@ static void silent_stream_disable(struct hda_codec *codec,
 		per_cvt->assigned = 0;
 	}
 
+	if (spec->silent_stream_type == SILENT_STREAM_I915) {
+		/* release ref taken in silent_stream_enable() */
+		snd_hda_power_down_pm(codec);
+	}
+	else if (spec->silent_stream_type == SILENT_STREAM_KAE) {
+		silent_stream_set_kae(codec, per_pin, false);
+	}
+
 	per_pin->cvt_nid = 0;
 	per_pin->silent_stream = false;
 
  unlock_out:
 	mutex_unlock(&per_pin->lock);
+
+	snd_hda_power_down_pm(codec);
 }
 
 /* update ELD and jack state via audio component */
@@ -1767,29 +1846,11 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 	monitor_next = per_pin->sink_eld.monitor_present;
 	mutex_unlock(&per_pin->lock);
 
-	/*
-	 * Power-up will call hdmi_present_sense, so the PM calls
-	 * have to be done without mutex held.
-	 */
-
-	if (spec->send_silent_stream) {
-		int pm_ret;
-
-		if (!monitor_prev && monitor_next) {
-			pm_ret = snd_hda_power_up_pm(codec);
-			if (pm_ret < 0)
-				codec_err(codec,
-				"Monitor plugged-in, Failed to power up codec ret=[%d]\n",
-				pm_ret);
+	if (spec->silent_stream_type) {
+		if (!monitor_prev && monitor_next)
 			silent_stream_enable(codec, per_pin);
-		} else if (monitor_prev && !monitor_next) {
+		else if (monitor_prev && !monitor_next)
 			silent_stream_disable(codec, per_pin);
-			pm_ret = snd_hda_power_down_pm(codec);
-			if (pm_ret < 0)
-				codec_err(codec,
-				"Monitor plugged-out, Failed to power down codec ret=[%d]\n",
-				pm_ret);
-		}
 	}
 }
 
@@ -2982,7 +3043,7 @@ static int intel_hsw_common_init(struct hda_codec *codec, hda_nid_t vendor_nid,
 	 * module param or Kconfig option
 	 */
 	if (send_silent_stream)
-		spec->send_silent_stream = true;
+		spec->silent_stream_type = SILENT_STREAM_I915;
 
 	return parse_intel_hdmi(codec);
 }
@@ -3035,6 +3096,22 @@ static int patch_i915_tgl_hdmi(struct hda_codec *codec)
 	return ret;
 }
 
+static int patch_i915_adlp_hdmi(struct hda_codec *codec)
+{
+	struct hdmi_spec *spec;
+	int res;
+
+	res = patch_i915_tgl_hdmi(codec);
+	if (!res) {
+		spec = codec->spec;
+
+		if (spec->silent_stream_type)
+			spec->silent_stream_type = SILENT_STREAM_KAE;
+	}
+
+	return res;
+}
+
 /* Intel Baytrail and Braswell; with eld notifier */
 static int patch_i915_byt_hdmi(struct hda_codec *codec)
 {
@@ -4391,10 +4468,10 @@ HDA_CODEC_ENTRY(0x80862814, "DG1 HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862815, "Alderlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862816, "Rocketlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862818, "Raptorlake HDMI",	patch_i915_tgl_hdmi),
-HDA_CODEC_ENTRY(0x80862819, "DG2 HDMI",	patch_i915_tgl_hdmi),
+HDA_CODEC_ENTRY(0x80862819, "DG2 HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
-HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_tgl_hdmi),
+HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862880, "CedarTrail HDMI",	patch_generic_hdmi),
 HDA_CODEC_ENTRY(0x80862882, "Valleyview2 HDMI",	patch_i915_byt_hdmi),
 HDA_CODEC_ENTRY(0x80862883, "Braswell HDMI",	patch_i915_byt_hdmi),

base-commit: ffef8d871491c18f64cf05f095740383785cd09a
-- 
2.35.1

