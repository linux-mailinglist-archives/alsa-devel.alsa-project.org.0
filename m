Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F882D6404
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 18:49:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA7411655;
	Thu, 10 Dec 2020 18:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA7411655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607622574;
	bh=nP2drGz/q1SBRJiznWrjLynpgKB7EFq/Aaydv0PSV4M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LNH0Mjrc04Bxi3qS/vYbmyKc+/i9M2iU5rd0d/y3WmlSq44WttXZolvYUiEyLgTAx
	 PTjx8hkNxa3RWTkZyLmoQrvvkWPVk4n1SscFRCls4Ggaff88E7+di0NUaG1+lgGfKZ
	 ssMj+S8KS09m+n0PhzrgEZ3vkGMeFTmK87UUWjEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E18C5F8019D;
	Thu, 10 Dec 2020 18:47:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B473BF8016E; Thu, 10 Dec 2020 18:47:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DA39F80105
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 18:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DA39F80105
IronPort-SDR: 1LqnZLKNDp4SQzEbG0LdjfG/1M1pCxj9TEv1XCuulRSj6DGbIHT17l6gPoLC7H/etHIKA6ENZt
 D2RaNIuH7J7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="235894436"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="235894436"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 09:47:21 -0800
IronPort-SDR: +2jleG8/RJsXph06XPdk8n5ADnUG2f16g5raI3QsuEcw1RQhJUNwptzKt9aYxvW9t815y/iAi3
 8YjHi9lrC52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="369336552"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2020 09:47:20 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: hda/hdmi: fix silent stream for first playback to DP
Date: Thu, 10 Dec 2020 19:44:45 +0200
Message-Id: <20201210174445.3134104-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Harsha Priya <harshapriya.n@intel.com>,
 Emmanuel Jillela <emmanuel.jillela@intel.com>, kai.vehmanen@linux.intel.com
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

A problem exists in enabling silent stream when connection type is
DisplayPort. Silent stream programming is completed when a new DP
receiver is connected, but infoframe transmission does not actually
start until PCM is opened for the first time. This can result in audible
gap of multiple seconds. This only affects the first PCM open.

Fix the issue by properly assigning a converter to the silent stream,
and modifying the required stream ID programming sequence.

This change only affects Intel display audio codecs.

BugLink: https://github.com/thesofproject/linux/issues/2468
Fixes: 951894cf30f4 ("ALSA: hda/hdmi: Add Intel silent stream support")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 98 +++++++++++++++++++++++++++++++++-----
 1 file changed, 86 insertions(+), 12 deletions(-)

v2 changes:
 - locking missing in silent_stream_disable()

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index b0068f8ca46d..2ddc27db8c01 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -78,6 +78,7 @@ struct hdmi_spec_per_pin {
 	int pcm_idx; /* which pcm is attached. -1 means no pcm is attached */
 	int repoll_count;
 	bool setup; /* the stream has been set up by prepare callback */
+	bool silent_stream;
 	int channels; /* current number of channels */
 	bool non_pcm;
 	bool chmap_set;		/* channel-map override by ALSA API? */
@@ -979,6 +980,13 @@ static int hdmi_choose_cvt(struct hda_codec *codec,
 	else
 		per_pin = get_pin(spec, pin_idx);
 
+	if (per_pin && per_pin->silent_stream) {
+		cvt_idx = cvt_nid_to_cvt_index(codec, per_pin->cvt_nid);
+		if (cvt_id)
+			*cvt_id = cvt_idx;
+		return 0;
+	}
+
 	/* Dynamically assign converter to stream */
 	for (cvt_idx = 0; cvt_idx < spec->num_cvts; cvt_idx++) {
 		per_cvt = get_cvt(spec, cvt_idx);
@@ -1642,30 +1650,95 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	snd_hda_power_down_pm(codec);
 }
 
+#define I915_SILENT_RATE		48000
+#define I915_SILENT_CHANNELS		2
+#define I915_SILENT_FORMAT		SNDRV_PCM_FORMAT_S16_LE
+#define I915_SILENT_FORMAT_BITS	16
+#define I915_SILENT_FMT_MASK		0xf
+
 static void silent_stream_enable(struct hda_codec *codec,
-				struct hdmi_spec_per_pin *per_pin)
+				 struct hdmi_spec_per_pin *per_pin)
 {
-	unsigned int newval, oldval;
-
-	codec_dbg(codec, "hdmi: enabling silent stream for NID %d\n",
-			per_pin->pin_nid);
+	struct hdmi_spec *spec = codec->spec;
+	struct hdmi_spec_per_cvt *per_cvt;
+	int cvt_idx, pin_idx, err;
+	unsigned int format;
 
 	mutex_lock(&per_pin->lock);
 
-	if (!per_pin->channels)
-		per_pin->channels = 2;
+	if (per_pin->setup) {
+		codec_dbg(codec, "hdmi: PCM already open, no silent stream\n");
+		goto unlock_out;
+	}
 
-	oldval = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
-			AC_VERB_GET_CONV, 0);
-	newval = (oldval & 0xF0) | 0xF;
-	snd_hda_codec_write(codec, per_pin->pin_nid, 0,
-			AC_VERB_SET_CHANNEL_STREAMID, newval);
+	pin_idx = pin_id_to_pin_index(codec, per_pin->pin_nid, per_pin->dev_id);
+	err = hdmi_choose_cvt(codec, pin_idx, &cvt_idx);
+	if (err) {
+		codec_err(codec, "hdmi: no free converter to enable silent mode\n");
+		goto unlock_out;
+	}
+
+	per_cvt = get_cvt(spec, cvt_idx);
+	per_cvt->assigned = 1;
+	per_pin->cvt_nid = per_cvt->cvt_nid;
+	per_pin->silent_stream = true;
 
+	codec_dbg(codec, "hdmi: enabling silent stream pin-NID=0x%x cvt-NID=0x%x\n",
+		  per_pin->pin_nid, per_cvt->cvt_nid);
+
+	snd_hda_set_dev_select(codec, per_pin->pin_nid, per_pin->dev_id);
+	snd_hda_codec_write_cache(codec, per_pin->pin_nid, 0,
+				  AC_VERB_SET_CONNECT_SEL,
+				  per_pin->mux_idx);
+
+	/* configure unused pins to choose other converters */
+	pin_cvt_fixup(codec, per_pin, 0);
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
 	hdmi_setup_audio_infoframe(codec, per_pin, per_pin->non_pcm);
 
+ unlock_out:
 	mutex_unlock(&per_pin->lock);
 }
 
+static void silent_stream_disable(struct hda_codec *codec,
+				  struct hdmi_spec_per_pin *per_pin)
+{
+	struct hdmi_spec *spec = codec->spec;
+	struct hdmi_spec_per_cvt *per_cvt;
+	int cvt_idx;
+
+	mutex_lock(&per_pin->lock);
+	if (!per_pin->silent_stream)
+		goto unlock_out;
+
+	codec_dbg(codec, "HDMI: disable silent stream on pin-NID=0x%x cvt-NID=0x%x\n",
+		  per_pin->pin_nid, per_pin->cvt_nid);
+
+	cvt_idx = cvt_nid_to_cvt_index(codec, per_pin->cvt_nid);
+	if (cvt_idx >= 0 && cvt_idx < spec->num_cvts) {
+		per_cvt = get_cvt(spec, cvt_idx);
+		per_cvt->assigned = 0;
+	}
+
+	per_pin->cvt_nid = 0;
+	per_pin->silent_stream = false;
+
+ unlock_out:
+	mutex_unlock(&spec->pcm_lock);
+}
+
 /* update ELD and jack state via audio component */
 static void sync_eld_via_acomp(struct hda_codec *codec,
 			       struct hdmi_spec_per_pin *per_pin)
@@ -1701,6 +1774,7 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 				pm_ret);
 			silent_stream_enable(codec, per_pin);
 		} else if (monitor_prev && !monitor_next) {
+			silent_stream_disable(codec, per_pin);
 			pm_ret = snd_hda_power_down_pm(codec);
 			if (pm_ret < 0)
 				codec_err(codec,
-- 
2.29.2

