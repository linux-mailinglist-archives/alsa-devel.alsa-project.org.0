Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D7D101E93
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 09:51:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091A116A0;
	Tue, 19 Nov 2019 09:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091A116A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574153487;
	bh=eRNwqvZ+0s02la6b2pE4W2tuzlf+0zkti5jX/UpPyZY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pEOW5Ymssyxw0/XR8VVDdyN44rTpdKAjN+de7jQ9SjWWmrX538ac6s7w+vHXQT1cD
	 H/kCu/KpR26HmIS4gDyDX0D++m0Utgu7AraxXNPkHgRA+Op0rS8k0iM//69mvI0esN
	 uJR3H7GA5mnffFxA9QNbI6LDAVUq1zJM/lmZw32o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35708F80162;
	Tue, 19 Nov 2019 09:47:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEEFCF8015D; Tue, 19 Nov 2019 09:47:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55E06F800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 09:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55E06F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="es3zGbNi"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3ac2e0002>; Tue, 19 Nov 2019 00:47:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:47:45 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 19 Nov 2019 00:47:45 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 19 Nov 2019 08:47:43 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Tue, 19 Nov 2019 14:17:09 +0530
Message-ID: <20191119084710.29267-4-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191119084710.29267-1-nmahale@nvidia.com>
References: <20191119084710.29267-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574153263; bh=iNOOcWhyT1cwHvy6q53wOFCDvGSR6hSuF7A2l01It/Y=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=es3zGbNi8qO0H87H4KwiXhuaYPNTOHGwSomV8u5YmFc7Pz1okMhEurNF2BAkFGbnv
 JoFQMEGvuACPGXCej/jeOP6QN4/CR/pmGx7Br3AvEvCkDQS7EX0z1A4/GcVmlK/jS6
 YfhtJ8oMzf7SnORxpZvs/Hb9IO/wqocNgPxGB/5P/pjQmzcBJIohMY694bI06Dj6RA
 cMlxXgOx23zTap/35OV/kfTcF+m0OqjNNx2OVwDwnoh+msGWy86hpRo+VIkGpnWDhr
 zS+hrX0x3pi6J/hyScIy/37uUqwSjh6X0BeDP3cX5p5XORRufyqRNrGRY//dzBE5Mv
 8NKEb2e9EPMCg==
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v3 3/4] ALSA: hda - Add DP-MST support for
	non-acomp codecs
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

This patch make it possible for non-acomp codecs to set
dyn_pcm_assign/dp_mst and get DP-MST audio support.

Document change notification HDA040-A for the Intel High Definition
Audio 1.0a specification introduces a Device Select verb for Digital
Display Pin Widgets that are multi-stream capable. This verb selects
a Device Entry that is used by subsequent Pin Widget verbs.
Once the Device Entry is selected, all subsequent Pin Widget verbs
controlling the sink device will be directed to the selected Device
Entry until the Device Select verb is updated with a new value.

These Pin Widget verbs include:

  * Connection Select
  * Get Connection List Entry
  * Amplifier Gain/Mute
  * Power State
  * Pin Widget Control
  * ELD Data
  * DIP-Size
  * DIP-Index
  * DIP-Data
  * DIP-XmitCtrl
  * Content Protection Control
  * ASP Channel Mapping

This patch adds calls to snd_hda_set_dev_select() to direct each of
these Pin Widget control verbs to the correct Device Entry.

snd_hda_get_connections() does not return per-device connection
list, therefore make use snd_hda_get_raw_connections() instead of
snd_hda_get_connections().

Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 100 ++++++++++++++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 84d410a93ed8..1ba485da17c0 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -97,16 +97,19 @@ struct hdmi_spec_per_pin {
 /* operations used by generic code that can be overridden by patches */
 struct hdmi_ops {
 	int (*pin_get_eld)(struct hda_codec *codec, hda_nid_t pin_nid,
-			   unsigned char *buf, int *eld_size);
+			   int dev_id, unsigned char *buf, int *eld_size);
 
 	void (*pin_setup_infoframe)(struct hda_codec *codec, hda_nid_t pin_nid,
+				    int dev_id,
 				    int ca, int active_channels, int conn_type);
 
 	/* enable/disable HBR (HD passthrough) */
-	int (*pin_hbr_setup)(struct hda_codec *codec, hda_nid_t pin_nid, bool hbr);
+	int (*pin_hbr_setup)(struct hda_codec *codec, hda_nid_t pin_nid,
+			     int dev_id, bool hbr);
 
 	int (*setup_stream)(struct hda_codec *codec, hda_nid_t cvt_nid,
-			    hda_nid_t pin_nid, u32 stream_tag, int format);
+			    hda_nid_t pin_nid, int dev_id, u32 stream_tag,
+			    int format);
 
 	void (*pin_cvt_fixup)(struct hda_codec *codec,
 			      struct hdmi_spec_per_pin *per_pin,
@@ -652,8 +655,16 @@ static bool hdmi_infoframe_uptodate(struct hda_codec *codec, hda_nid_t pin_nid,
 	return true;
 }
 
+static int hdmi_pin_get_eld(struct hda_codec *codec, hda_nid_t nid,
+			    int dev_id, unsigned char *buf, int *eld_size)
+{
+	snd_hda_set_dev_select(codec, nid, dev_id);
+
+	return snd_hdmi_get_eld(codec, nid, buf, eld_size);
+}
+
 static void hdmi_pin_setup_infoframe(struct hda_codec *codec,
-				     hda_nid_t pin_nid,
+				     hda_nid_t pin_nid, int dev_id,
 				     int ca, int active_channels,
 				     int conn_type)
 {
@@ -683,6 +694,8 @@ static void hdmi_pin_setup_infoframe(struct hda_codec *codec,
 		return;
 	}
 
+	snd_hda_set_dev_select(codec, pin_nid, dev_id);
+
 	/*
 	 * sizeof(ai) is used instead of sizeof(*hdmi_ai) or
 	 * sizeof(*dp_ai) to avoid partial match/update problems when
@@ -708,6 +721,7 @@ static void hdmi_setup_audio_infoframe(struct hda_codec *codec,
 	struct hdmi_spec *spec = codec->spec;
 	struct hdac_chmap *chmap = &spec->chmap;
 	hda_nid_t pin_nid = per_pin->pin_nid;
+	int dev_id = per_pin->dev_id;
 	int channels = per_pin->channels;
 	int active_channels;
 	struct hdmi_eld *eld;
@@ -716,6 +730,8 @@ static void hdmi_setup_audio_infoframe(struct hda_codec *codec,
 	if (!channels)
 		return;
 
+	snd_hda_set_dev_select(codec, pin_nid, dev_id);
+
 	/* some HW (e.g. HSW+) needs reprogramming the amp at each time */
 	if (get_wcaps(codec, pin_nid) & AC_WCAP_OUT_AMP)
 		snd_hda_codec_write(codec, pin_nid, 0,
@@ -741,8 +757,8 @@ static void hdmi_setup_audio_infoframe(struct hda_codec *codec,
 				pin_nid, non_pcm, ca, channels,
 				per_pin->chmap, per_pin->chmap_set);
 
-	spec->ops.pin_setup_infoframe(codec, pin_nid, ca, active_channels,
-				      eld->info.conn_type);
+	spec->ops.pin_setup_infoframe(codec, pin_nid, dev_id,
+				      ca, active_channels, eld->info.conn_type);
 
 	per_pin->non_pcm = non_pcm;
 }
@@ -884,11 +900,12 @@ static void haswell_verify_D0(struct hda_codec *codec,
 	((format & AC_FMT_TYPE_NON_PCM) && (format & AC_FMT_CHAN_MASK) == 7)
 
 static int hdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t pin_nid,
-			      bool hbr)
+			      int dev_id, bool hbr)
 {
 	int pinctl, new_pinctl;
 
 	if (snd_hda_query_pin_caps(codec, pin_nid) & AC_PINCAP_HBR) {
+		snd_hda_set_dev_select(codec, pin_nid, dev_id);
 		pinctl = snd_hda_codec_read(codec, pin_nid, 0,
 					    AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
 
@@ -918,13 +935,15 @@ static int hdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t pin_nid,
 }
 
 static int hdmi_setup_stream(struct hda_codec *codec, hda_nid_t cvt_nid,
-			      hda_nid_t pin_nid, u32 stream_tag, int format)
+			      hda_nid_t pin_nid, int dev_id,
+			      u32 stream_tag, int format)
 {
 	struct hdmi_spec *spec = codec->spec;
 	unsigned int param;
 	int err;
 
-	err = spec->ops.pin_hbr_setup(codec, pin_nid, is_hbr_format(format));
+	err = spec->ops.pin_hbr_setup(codec, pin_nid, dev_id,
+				      is_hbr_format(format));
 
 	if (err) {
 		codec_dbg(codec, "hdmi_setup_stream: HBR is not supported\n");
@@ -1298,6 +1317,7 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
 	hda_nid_t pin_nid = per_pin->pin_nid;
+	int dev_id = per_pin->dev_id;
 
 	if (!(get_wcaps(codec, pin_nid) & AC_WCAP_CONN_LIST)) {
 		codec_warn(codec,
@@ -1306,10 +1326,12 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
 		return -EINVAL;
 	}
 
+	snd_hda_set_dev_select(codec, pin_nid, dev_id);
+
 	/* all the device entries on the same pin have the same conn list */
-	per_pin->num_mux_nids = snd_hda_get_connections(codec, pin_nid,
-							per_pin->mux_nids,
-							HDA_MAX_CONNECTIONS);
+	per_pin->num_mux_nids =
+		snd_hda_get_raw_connections(codec, pin_nid, per_pin->mux_nids,
+					    HDA_MAX_CONNECTIONS);
 
 	return 0;
 }
@@ -1517,6 +1539,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_eld *eld = &spec->temp_eld;
 	hda_nid_t pin_nid = per_pin->pin_nid;
+	int dev_id = per_pin->dev_id;
 	/*
 	 * Always execute a GetPinSense verb here, even when called from
 	 * hdmi_intrinsic_event; for some NVIDIA HW, the unsolicited
@@ -1529,7 +1552,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	bool ret;
 	bool do_repoll = false;
 
-	present = snd_hda_jack_pin_sense(codec, pin_nid, per_pin->dev_id);
+	present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
 
 	mutex_lock(&per_pin->lock);
 	eld->monitor_present = !!(present & AC_PINSENSE_PRESENCE);
@@ -1543,8 +1566,8 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 		codec->addr, pin_nid, eld->monitor_present, eld->eld_valid);
 
 	if (eld->eld_valid) {
-		if (spec->ops.pin_get_eld(codec, pin_nid, eld->eld_buffer,
-						     &eld->eld_size) < 0)
+		if (spec->ops.pin_get_eld(codec, pin_nid, dev_id,
+					  eld->eld_buffer, &eld->eld_size) < 0)
 			eld->eld_valid = false;
 		else {
 			if (snd_hdmi_parse_eld(codec, &eld->info, eld->eld_buffer,
@@ -1881,7 +1904,6 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 	struct hdmi_spec *spec = codec->spec;
 	int pin_idx;
 	struct hdmi_spec_per_pin *per_pin;
-	hda_nid_t pin_nid;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	bool non_pcm;
 	int pinctl, stripe;
@@ -1905,7 +1927,6 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 		goto unlock;
 	}
 	per_pin = get_pin(spec, pin_idx);
-	pin_nid = per_pin->pin_nid;
 
 	/* Verify pin:cvt selections to avoid silent audio after S3.
 	 * After S3, the audio driver restores pin:cvt selections
@@ -1920,8 +1941,8 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 	/* Call sync_audio_rate to set the N/CTS/M manually if necessary */
 	/* Todo: add DP1.2 MST audio support later */
 	if (codec_has_acomp(codec))
-		snd_hdac_sync_audio_rate(&codec->core, pin_nid, per_pin->dev_id,
-					 runtime->rate);
+		snd_hdac_sync_audio_rate(&codec->core, per_pin->pin_nid,
+					 per_pin->dev_id, runtime->rate);
 
 	non_pcm = check_non_pcm_per_cvt(codec, cvt_nid);
 	mutex_lock(&per_pin->lock);
@@ -1939,16 +1960,18 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 	hdmi_setup_audio_infoframe(codec, per_pin, non_pcm);
 	mutex_unlock(&per_pin->lock);
 	if (spec->dyn_pin_out) {
-		pinctl = snd_hda_codec_read(codec, pin_nid, 0,
+		snd_hda_set_dev_select(codec, per_pin->pin_nid,
+				       per_pin->dev_id);
+		pinctl = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
 					    AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
-		snd_hda_codec_write(codec, pin_nid, 0,
+		snd_hda_codec_write(codec, per_pin->pin_nid, 0,
 				    AC_VERB_SET_PIN_WIDGET_CONTROL,
 				    pinctl | PIN_OUT);
 	}
 
 	/* snd_hda_set_dev_select() has been called before */
-	err = spec->ops.setup_stream(codec, cvt_nid, pin_nid,
-				 stream_tag, format);
+	err = spec->ops.setup_stream(codec, cvt_nid, per_pin->pin_nid,
+				     per_pin->dev_id, stream_tag, format);
  unlock:
 	mutex_unlock(&spec->pcm_lock);
 	return err;
@@ -2000,6 +2023,8 @@ static int hdmi_pcm_close(struct hda_pcm_stream *hinfo,
 		per_pin = get_pin(spec, pin_idx);
 
 		if (spec->dyn_pin_out) {
+			snd_hda_set_dev_select(codec, per_pin->pin_nid,
+					       per_pin->dev_id);
 			pinctl = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
 					AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
 			snd_hda_codec_write(codec, per_pin->pin_nid, 0,
@@ -2377,7 +2402,7 @@ static const struct hda_codec_ops generic_hdmi_patch_ops = {
 };
 
 static const struct hdmi_ops generic_standard_hdmi_ops = {
-	.pin_get_eld				= snd_hdmi_get_eld,
+	.pin_get_eld				= hdmi_pin_get_eld,
 	.pin_setup_infoframe			= hdmi_pin_setup_infoframe,
 	.pin_hbr_setup				= hdmi_pin_hbr_setup,
 	.setup_stream				= hdmi_setup_stream,
@@ -2575,7 +2600,8 @@ static void intel_haswell_fixup_connect_list(struct hda_codec *codec,
 	hda_nid_t conns[4];
 	int nconns;
 
-	nconns = snd_hda_get_connections(codec, nid, conns, ARRAY_SIZE(conns));
+	nconns = snd_hda_get_raw_connections(codec, nid, conns,
+					     ARRAY_SIZE(conns));
 	if (nconns == spec->num_cvts &&
 	    !memcmp(conns, spec->cvt_nids, spec->num_cvts * sizeof(hda_nid_t)))
 		return;
@@ -2753,10 +2779,12 @@ static void register_i915_notifier(struct hda_codec *codec)
 
 /* setup_stream ops override for HSW+ */
 static int i915_hsw_setup_stream(struct hda_codec *codec, hda_nid_t cvt_nid,
-				 hda_nid_t pin_nid, u32 stream_tag, int format)
+				 hda_nid_t pin_nid, int dev_id, u32 stream_tag,
+				 int format)
 {
 	haswell_verify_D0(codec, cvt_nid, pin_nid);
-	return hdmi_setup_stream(codec, cvt_nid, pin_nid, stream_tag, format);
+	return hdmi_setup_stream(codec, cvt_nid, pin_nid, dev_id,
+				 stream_tag, format);
 }
 
 /* pin_cvt_fixup ops override for HSW+ and VLV+ */
@@ -3722,16 +3750,19 @@ static int patch_tegra_hdmi(struct hda_codec *codec)
 #define ATI_HBR_ENABLE 0x10
 
 static int atihdmi_pin_get_eld(struct hda_codec *codec, hda_nid_t nid,
-			   unsigned char *buf, int *eld_size)
+			       int dev_id, unsigned char *buf, int *eld_size)
 {
+	WARN_ON(dev_id != 0);
 	/* call hda_eld.c ATI/AMD-specific function */
 	return snd_hdmi_get_eld_ati(codec, nid, buf, eld_size,
 				    is_amdhdmi_rev3_or_later(codec));
 }
 
-static void atihdmi_pin_setup_infoframe(struct hda_codec *codec, hda_nid_t pin_nid, int ca,
+static void atihdmi_pin_setup_infoframe(struct hda_codec *codec,
+					hda_nid_t pin_nid, int dev_id, int ca,
 					int active_channels, int conn_type)
 {
+	WARN_ON(dev_id != 0);
 	snd_hda_codec_write(codec, pin_nid, 0, ATI_VERB_SET_CHANNEL_ALLOCATION, ca);
 }
 
@@ -3922,10 +3953,12 @@ static void atihdmi_paired_cea_alloc_to_tlv_chmap(struct hdac_chmap *hchmap,
 }
 
 static int atihdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t pin_nid,
-				 bool hbr)
+				 int dev_id, bool hbr)
 {
 	int hbr_ctl, hbr_ctl_new;
 
+	WARN_ON(dev_id != 0);
+
 	hbr_ctl = snd_hda_codec_read(codec, pin_nid, 0, ATI_VERB_GET_HBR_CONTROL, 0);
 	if (hbr_ctl >= 0 && (hbr_ctl & ATI_HBR_CAPABLE)) {
 		if (hbr)
@@ -3951,9 +3984,9 @@ static int atihdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t pin_nid,
 }
 
 static int atihdmi_setup_stream(struct hda_codec *codec, hda_nid_t cvt_nid,
-				hda_nid_t pin_nid, u32 stream_tag, int format)
+				hda_nid_t pin_nid, int dev_id,
+				u32 stream_tag, int format)
 {
-
 	if (is_amdhdmi_rev3_or_later(codec)) {
 		int ramp_rate = 180; /* default as per AMD spec */
 		/* disable ramp-up/down for non-pcm as per AMD spec */
@@ -3963,7 +3996,8 @@ static int atihdmi_setup_stream(struct hda_codec *codec, hda_nid_t cvt_nid,
 		snd_hda_codec_write(codec, cvt_nid, 0, ATI_VERB_SET_RAMP_RATE, ramp_rate);
 	}
 
-	return hdmi_setup_stream(codec, cvt_nid, pin_nid, stream_tag, format);
+	return hdmi_setup_stream(codec, cvt_nid, pin_nid, dev_id,
+				 stream_tag, format);
 }
 
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
