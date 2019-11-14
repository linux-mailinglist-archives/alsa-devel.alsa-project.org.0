Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB64FC042
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 07:39:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EB291679;
	Thu, 14 Nov 2019 07:38:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EB291679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573713548;
	bh=pMX3LxlWiVHaHaUjYFOFsq/hDPe4Mtu1PKLXvwo+xro=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jlTv+yDdyB09znO/lju9a8pl1lbMQABfweoSRCDw1EXAGYEeLyn86Zf/MVtQIqSNg
	 ZuQvqdFjduQMwCHajeWQdLU/r4gemKmMxQq7tHbmlAj35gpHWnJotWs+gxoGk32pi1
	 DWN+3/imGeVySR8cIKspWe8+kYpb+DD4gMZE+TcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CFBBF8011A;
	Thu, 14 Nov 2019 07:34:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65E77F800E9; Thu, 14 Nov 2019 04:37:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD50F8007E
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 04:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD50F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="gWEw0oIH"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcccbd40000>; Wed, 13 Nov 2019 19:36:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 19:37:47 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 13 Nov 2019 19:37:47 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 14 Nov 2019 03:37:45 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Thu, 14 Nov 2019 09:07:03 +0530
Message-ID: <20191114033704.18171-5-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191114033704.18171-1-nmahale@nvidia.com>
References: <20191114033704.18171-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573702612; bh=U6onyXWtphlhNbYX3phVxMriLAGfx0Vm5Fi2XrQc5Uc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=gWEw0oIHtG/gN8SbL++XnbfDXR8LKbIWANHmgHXnKP0G8Ii4olDPj7UuvT12XeLbz
 o0TyXHKw2ltE/osov3Sske0tG4BUAChcRfcEPr2ILYVskyHV+DwMdUjvOTqSdW0dIO
 ifYLOphEF8qmUm2ZR0wL8hZXS9hMt4XoAdFSuZq8NtR5EEMWWi8ZaZO/9IG5RXKJvN
 /5iqlh+wFioGQhNwGfdnS5UluoDeb3Ymv2wHuNcpoXKjdz+L8SEP2VMDlkcckrZ5Yc
 wBbSkl4O9AsBc0b+TTFm9PPIPEQa7kV1Ykmcs1ZDRe4WwLxiuG5Z/+1RdZxv0qZ3ek
 nNOydXldLTAdg==
X-Mailman-Approved-At: Thu, 14 Nov 2019 07:34:48 +0100
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v1 4/5] ALSA: hda - Add DP-MST support for
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

Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 91 +++++++++++++++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 30 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 39eeb7c7407c..fe58e711d259 100644
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
@@ -870,11 +886,12 @@ static void haswell_verify_D0(struct hda_codec *codec,
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
 
@@ -904,13 +921,15 @@ static int hdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t pin_nid,
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
@@ -1284,6 +1303,7 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
 	hda_nid_t pin_nid = per_pin->pin_nid;
+	int dev_id = per_pin->dev_id;
 
 	if (!(get_wcaps(codec, pin_nid) & AC_WCAP_CONN_LIST)) {
 		codec_warn(codec,
@@ -1292,6 +1312,8 @@ static int hdmi_read_pin_conn(struct hda_codec *codec, int pin_idx)
 		return -EINVAL;
 	}
 
+	snd_hda_set_dev_select(codec, pin_nid, dev_id);
+
 	/* all the device entries on the same pin have the same conn list */
 	per_pin->num_mux_nids = snd_hda_get_connections(codec, pin_nid,
 							per_pin->mux_nids,
@@ -1503,6 +1525,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_eld *eld = &spec->temp_eld;
 	hda_nid_t pin_nid = per_pin->pin_nid;
+	int dev_id = per_pin->dev_id;
 	/*
 	 * Always execute a GetPinSense verb here, even when called from
 	 * hdmi_intrinsic_event; for some NVIDIA HW, the unsolicited
@@ -1515,7 +1538,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	bool ret;
 	bool do_repoll = false;
 
-	present = snd_hda_jack_pin_sense(codec, pin_nid, per_pin->dev_id);
+	present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
 
 	mutex_lock(&per_pin->lock);
 	eld->monitor_present = !!(present & AC_PINSENSE_PRESENCE);
@@ -1529,8 +1552,8 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 		codec->addr, pin_nid, eld->monitor_present, eld->eld_valid);
 
 	if (eld->eld_valid) {
-		if (spec->ops.pin_get_eld(codec, pin_nid, eld->eld_buffer,
-						     &eld->eld_size) < 0)
+		if (spec->ops.pin_get_eld(codec, pin_nid, dev_id,
+					  eld->eld_buffer, &eld->eld_size) < 0)
 			eld->eld_valid = false;
 		else {
 			if (snd_hdmi_parse_eld(codec, &eld->info, eld->eld_buffer,
@@ -1866,7 +1889,6 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 	struct hdmi_spec *spec = codec->spec;
 	int pin_idx;
 	struct hdmi_spec_per_pin *per_pin;
-	hda_nid_t pin_nid;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	bool non_pcm;
 	int pinctl, stripe;
@@ -1890,7 +1912,6 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 		goto unlock;
 	}
 	per_pin = get_pin(spec, pin_idx);
-	pin_nid = per_pin->pin_nid;
 
 	/* Verify pin:cvt selections to avoid silent audio after S3.
 	 * After S3, the audio driver restores pin:cvt selections
@@ -1905,8 +1926,8 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 	/* Call sync_audio_rate to set the N/CTS/M manually if necessary */
 	/* Todo: add DP1.2 MST audio support later */
 	if (codec_has_acomp(codec))
-		snd_hdac_sync_audio_rate(&codec->core, pin_nid, per_pin->dev_id,
-					 runtime->rate);
+		snd_hdac_sync_audio_rate(&codec->core, per_pin->pin_nid,
+					 per_pin->dev_id, runtime->rate);
 
 	non_pcm = check_non_pcm_per_cvt(codec, cvt_nid);
 	mutex_lock(&per_pin->lock);
@@ -1924,16 +1945,17 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 	hdmi_setup_audio_infoframe(codec, per_pin, non_pcm);
 	mutex_unlock(&per_pin->lock);
 	if (spec->dyn_pin_out) {
-		pinctl = snd_hda_codec_read(codec, pin_nid, 0,
+		snd_hda_set_dev_select(codec, per_pin->pin_nid, per_pin->dev_id);
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
@@ -1985,6 +2007,7 @@ static int hdmi_pcm_close(struct hda_pcm_stream *hinfo,
 		per_pin = get_pin(spec, pin_idx);
 
 		if (spec->dyn_pin_out) {
+			snd_hda_set_dev_select(codec, per_pin->pin_nid, per_pin->dev_id);
 			pinctl = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
 					AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
 			snd_hda_codec_write(codec, per_pin->pin_nid, 0,
@@ -2359,7 +2382,7 @@ static const struct hda_codec_ops generic_hdmi_patch_ops = {
 };
 
 static const struct hdmi_ops generic_standard_hdmi_ops = {
-	.pin_get_eld				= snd_hdmi_get_eld,
+	.pin_get_eld				= hdmi_pin_get_eld,
 	.pin_setup_infoframe			= hdmi_pin_setup_infoframe,
 	.pin_hbr_setup				= hdmi_pin_hbr_setup,
 	.setup_stream				= hdmi_setup_stream,
@@ -2736,10 +2759,12 @@ static void register_i915_notifier(struct hda_codec *codec)
 
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
@@ -3705,16 +3730,19 @@ static int patch_tegra_hdmi(struct hda_codec *codec)
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
-					int active_channels, int conn_type)
+static void atihdmi_pin_setup_infoframe(struct hda_codec *codec, hda_nid_t pin_nid,
+					int dev_id, int ca, int active_channels,
+					int conn_type)
 {
+	WARN_ON(dev_id != 0);
 	snd_hda_codec_write(codec, pin_nid, 0, ATI_VERB_SET_CHANNEL_ALLOCATION, ca);
 }
 
@@ -3905,10 +3933,12 @@ static void atihdmi_paired_cea_alloc_to_tlv_chmap(struct hdac_chmap *hchmap,
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
@@ -3934,9 +3964,9 @@ static int atihdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t pin_nid,
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
@@ -3946,7 +3976,8 @@ static int atihdmi_setup_stream(struct hda_codec *codec, hda_nid_t cvt_nid,
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
