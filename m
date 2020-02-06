Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA7154934
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:29:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CFB816A0;
	Thu,  6 Feb 2020 17:29:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CFB816A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581006598;
	bh=LAl6/2v3HASpqXomPbz22EWquP9JTtCc9Er3MhtecGg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pUuPgrWVLRBgKLnkGx6kCmWvduw/7P5mX73uX/gGH9mB+8ANA5s/O4pAqNj8Sh3Xo
	 m5OZU6atkhBmhML9dTz957LRO8tTajY9yQemYNUvFmbaEx1oka4+RtIh51OMkUGMLt
	 ISAq9Qn/3qdBF3h4to9fSlkJsfD+Dvt6UUg9Qy94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6018CF801DB;
	Thu,  6 Feb 2020 17:28:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F57BF80248; Thu,  6 Feb 2020 17:28:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2C92F800AB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2C92F800AB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF8ECAF00;
 Thu,  6 Feb 2020 16:28:07 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:28:02 +0100
Message-Id: <20200206162804.4734-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206162804.4734-1-tiwai@suse.de>
References: <20200206162804.4734-1-tiwai@suse.de>
Cc: Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/4] ALSA: hda/hdmi: Don't use standard
	hda_jack for generic HDMI jacks
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

The current HDMI codec driver code manages the jack detection in two
different ways: for Intel codecs with audio component, the driver
creates snd_jack objects by itself while the standard hda_jack stuff
is used for the rest.  This was basically because the audio component
doesn't need the pin sense reading and the unsol event handling, hence
it just needs to report the corresponding jacks directly.

It was a bit messy but not too messy until the driver got DP-MST
support for Nvidia that re-uses the part of dyn_pcm_assign feature
while keeping the pin sense and the unsol event handling.  Now, for
DP-MST, we use hda_jack for pin sensing and unsol events but use the
own snd_jack objects.  Meanwhile for non-DP-MST, hda_jack is used for
pin sense and unsol events, and the jacks are bound on hda_jack.

Moreover, there is a polling mode support where the unsol event isn't
used.  For those, we also have special handling.

For simplifying those messes, this patch unifies the snd_jack handling
over all generic HDMI codes.  The driver creates snd_jack objects just
like Intel codecs did in the past but now for all devices.  For the
system without audio component binding, we still need the pin sense
and the unsol event handling, and those are still done with the
hda_jack table as before.  But hda_jack is no longer used for the
actual snd_jack handling.

Since the hda_jack is no longer used for jack reporting, we removed
snd_hda_jack_report_sync() calls, which also allowed to simplify the
return type of hda_present_sense() and co.  pin_idx_to_pcm_jack() was
simplified as well because it behaves same for all cases now.

Note that the hda_jack is still used for the simple HDMI codecs; they
are really simple enough, so no big reason to change intrusively.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 219 ++++++++++++---------------------------------
 1 file changed, 57 insertions(+), 162 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index c65d16dea08c..98a8c4f97d6b 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -154,7 +154,6 @@ struct hdmi_spec {
 	struct hda_multi_out multiout;
 	struct hda_pcm_stream pcm_playback;
 
-	bool use_jack_detect; /* jack detection enabled */
 	bool use_acomp_notifier; /* use eld_notify callback for hotplug */
 	bool acomp_registered; /* audio component registered in this driver */
 	struct drm_audio_component_audio_ops drm_audio_ops;
@@ -753,7 +752,7 @@ static void hdmi_setup_audio_infoframe(struct hda_codec *codec,
  * Unsolicited events
  */
 
-static bool hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll);
+static void hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll);
 
 static void check_presence_and_report(struct hda_codec *codec, hda_nid_t nid,
 				      int dev_id)
@@ -764,8 +763,7 @@ static void check_presence_and_report(struct hda_codec *codec, hda_nid_t nid,
 	if (pin_idx < 0)
 		return;
 	mutex_lock(&spec->pcm_lock);
-	if (hdmi_present_sense(get_pin(spec, pin_idx), 1))
-		snd_hda_jack_report_sync(codec);
+	hdmi_present_sense(get_pin(spec, pin_idx), 1);
 	mutex_unlock(&spec->pcm_lock);
 }
 
@@ -1542,35 +1540,38 @@ static struct snd_jack *pin_idx_to_pcm_jack(struct hda_codec *codec,
 					    struct hdmi_spec_per_pin *per_pin)
 {
 	struct hdmi_spec *spec = codec->spec;
-	struct snd_jack *jack = NULL;
-	struct hda_jack_tbl *jack_tbl;
-
-	/* if !dyn_pcm_assign, get jack from hda_jack_tbl
-	 * in !dyn_pcm_assign case, spec->pcm_rec[].jack is not
-	 * NULL even after snd_hda_jack_tbl_clear() is called to
-	 * free snd_jack. This may cause access invalid memory
-	 * when calling snd_jack_report
+
+	if (per_pin->pcm_idx >= 0)
+		return spec->pcm_rec[per_pin->pcm_idx].jack;
+	else
+		return NULL;
+}
+
+static void do_update_eld(struct hda_codec *codec,
+			  struct hdmi_spec_per_pin *per_pin,
+			  struct hdmi_eld *eld)
+{
+	struct snd_jack *pcm_jack;
+	bool changed;
+
+	/*
+	 * pcm_idx >=0 before update_eld() means it is in monitor
+	 * disconnected event. Jack must be fetched before update_eld().
 	 */
-	if (per_pin->pcm_idx >= 0 && spec->dyn_pcm_assign) {
-		jack = spec->pcm_rec[per_pin->pcm_idx].jack;
-	} else if (!spec->dyn_pcm_assign) {
-		/*
-		 * jack tbl doesn't support DP MST
-		 * DP MST will use dyn_pcm_assign,
-		 * so DP MST will never come here
-		 */
-		jack_tbl = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
-						    per_pin->dev_id);
-		if (jack_tbl)
-			jack = jack_tbl->jack;
-	}
-	return jack;
+	pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
+	changed = update_eld(codec, per_pin, eld);
+	if (!pcm_jack)
+		pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
+	if (changed && pcm_jack)
+		snd_jack_report(pcm_jack,
+				(eld->monitor_present && eld->eld_valid) ?
+				SND_JACK_AVOUT : 0);
 }
+
 /* update ELD and jack state via HD-audio verbs */
-static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
+static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 					 int repoll)
 {
-	struct hda_jack_tbl *jack;
 	struct hda_codec *codec = per_pin->codec;
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_eld *eld = &spec->temp_eld;
@@ -1585,9 +1586,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	 * the unsolicited response to avoid custom WARs.
 	 */
 	int present;
-	bool ret;
 	bool do_repoll = false;
-	struct snd_jack *pcm_jack = NULL;
 
 	present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
 
@@ -1615,53 +1614,12 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 			do_repoll = true;
 	}
 
-	if (do_repoll) {
+	if (do_repoll)
 		schedule_delayed_work(&per_pin->work, msecs_to_jiffies(300));
-	} else {
-		/*
-		 * pcm_idx >=0 before update_eld() means it is in monitor
-		 * disconnected event. Jack must be fetched before
-		 * update_eld().
-		 */
-		pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
-		update_eld(codec, per_pin, eld);
-		if (!pcm_jack)
-			pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
-	}
-
-	ret = !repoll || !eld->monitor_present || eld->eld_valid;
-
-	jack = snd_hda_jack_tbl_get_mst(codec, pin_nid, per_pin->dev_id);
-	if (jack) {
-		jack->block_report = !ret;
-		jack->pin_sense = (eld->monitor_present && eld->eld_valid) ?
-			AC_PINSENSE_PRESENCE : 0;
-
-		if (spec->dyn_pcm_assign && pcm_jack && !do_repoll) {
-			int state = 0;
-
-			if (jack->pin_sense & AC_PINSENSE_PRESENCE)
-				state = SND_JACK_AVOUT;
-			snd_jack_report(pcm_jack, state);
-		}
+	else
+		do_update_eld(codec, per_pin, eld);
 
-		/*
-		 * snd_hda_jack_pin_sense() call at the beginning of this
-		 * function, updates jack->pins_sense and clears
-		 * jack->jack_dirty, therefore snd_hda_jack_report_sync() will
-		 * not override the jack->pin_sense.
-		 *
-		 * snd_hda_jack_report_sync() is superfluous for dyn_pcm_assign
-		 * case. The jack->pin_sense update was already performed, and
-		 * hda_jack->jack is NULL for dyn_pcm_assign.
-		 *
-		 * Don't call snd_hda_jack_report_sync() for
-		 * dyn_pcm_assign.
-		 */
-		ret = ret && !spec->dyn_pcm_assign;
-	}
 	mutex_unlock(&per_pin->lock);
-	return ret;
 }
 
 /* update ELD and jack state via audio component */
@@ -1670,8 +1628,6 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 {
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_eld *eld = &spec->temp_eld;
-	struct snd_jack *jack = NULL;
-	bool changed;
 	int size;
 
 	mutex_lock(&per_pin->lock);
@@ -1694,21 +1650,11 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 		eld->eld_size = 0;
 	}
 
-	/* pcm_idx >=0 before update_eld() means it is in monitor
-	 * disconnected event. Jack must be fetched before update_eld()
-	 */
-	jack = pin_idx_to_pcm_jack(codec, per_pin);
-	changed = update_eld(codec, per_pin, eld);
-	if (jack == NULL)
-		jack = pin_idx_to_pcm_jack(codec, per_pin);
-	if (changed && jack)
-		snd_jack_report(jack,
-				(eld->monitor_present && eld->eld_valid) ?
-				SND_JACK_AVOUT : 0);
+	do_update_eld(codec, per_pin, eld);
 	mutex_unlock(&per_pin->lock);
 }
 
-static bool hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll)
+static void hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll)
 {
 	struct hda_codec *codec = per_pin->codec;
 	int ret;
@@ -1718,16 +1664,13 @@ static bool hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll)
 		ret = snd_hda_power_up_pm(codec);
 		if (ret < 0 && pm_runtime_suspended(hda_codec_dev(codec))) {
 			snd_hda_power_down_pm(codec);
-			return false;
+			return;
 		}
-		ret = hdmi_present_sense_via_verbs(per_pin, repoll);
+		hdmi_present_sense_via_verbs(per_pin, repoll);
 		snd_hda_power_down_pm(codec);
 	} else {
 		sync_eld_via_acomp(codec, per_pin);
-		ret = false; /* don't call snd_hda_jack_report_sync() */
 	}
-
-	return ret;
 }
 
 static void hdmi_repoll_eld(struct work_struct *work)
@@ -1747,8 +1690,7 @@ static void hdmi_repoll_eld(struct work_struct *work)
 		per_pin->repoll_count = 0;
 
 	mutex_lock(&spec->pcm_lock);
-	if (hdmi_present_sense(per_pin, per_pin->repoll_count))
-		snd_hda_jack_report_sync(per_pin->codec);
+	hdmi_present_sense(per_pin, per_pin->repoll_count);
 	mutex_unlock(&spec->pcm_lock);
 }
 
@@ -2194,15 +2136,23 @@ static void free_hdmi_jack_priv(struct snd_jack *jack)
 	pcm->jack = NULL;
 }
 
-static int add_hdmi_jack_kctl(struct hda_codec *codec,
-			       struct hdmi_spec *spec,
-			       int pcm_idx,
-			       const char *name)
+static int generic_hdmi_build_jack(struct hda_codec *codec, int pcm_idx)
 {
+	char hdmi_str[32] = "HDMI/DP";
+	struct hdmi_spec *spec = codec->spec;
+	struct hdmi_spec_per_pin *per_pin = get_pin(spec, pcm_idx);
 	struct snd_jack *jack;
+	int pcmdev = get_pcm_rec(spec, pcm_idx)->device;
 	int err;
 
-	err = snd_jack_new(codec->card, name, SND_JACK_AVOUT, &jack,
+	if (pcmdev > 0)
+		sprintf(hdmi_str + strlen(hdmi_str), ",pcm=%d", pcmdev);
+	if (!spec->dyn_pcm_assign &&
+	    !is_jack_detectable(codec, per_pin->pin_nid))
+		strncat(hdmi_str, " Phantom",
+			sizeof(hdmi_str) - strlen(hdmi_str) - 1);
+
+	err = snd_jack_new(codec->card, hdmi_str, SND_JACK_AVOUT, &jack,
 			   true, false);
 	if (err < 0)
 		return err;
@@ -2213,48 +2163,6 @@ static int add_hdmi_jack_kctl(struct hda_codec *codec,
 	return 0;
 }
 
-static int generic_hdmi_build_jack(struct hda_codec *codec, int pcm_idx)
-{
-	char hdmi_str[32] = "HDMI/DP";
-	struct hdmi_spec *spec = codec->spec;
-	struct hdmi_spec_per_pin *per_pin;
-	struct hda_jack_tbl *jack;
-	int pcmdev = get_pcm_rec(spec, pcm_idx)->device;
-	bool phantom_jack;
-	int ret;
-
-	if (pcmdev > 0)
-		sprintf(hdmi_str + strlen(hdmi_str), ",pcm=%d", pcmdev);
-
-	if (spec->dyn_pcm_assign)
-		return add_hdmi_jack_kctl(codec, spec, pcm_idx, hdmi_str);
-
-	/* for !dyn_pcm_assign, we still use hda_jack for compatibility */
-	/* if !dyn_pcm_assign, it must be non-MST mode.
-	 * This means pcms and pins are statically mapped.
-	 * And pcm_idx is pin_idx.
-	 */
-	per_pin = get_pin(spec, pcm_idx);
-	phantom_jack = !is_jack_detectable(codec, per_pin->pin_nid);
-	if (phantom_jack)
-		strncat(hdmi_str, " Phantom",
-			sizeof(hdmi_str) - strlen(hdmi_str) - 1);
-	ret = snd_hda_jack_add_kctl_mst(codec, per_pin->pin_nid,
-					per_pin->dev_id, hdmi_str, phantom_jack,
-					0, NULL);
-	if (ret < 0)
-		return ret;
-	jack = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
-					per_pin->dev_id);
-	if (jack == NULL)
-		return 0;
-	/* assign jack->jack to pcm_rec[].jack to
-	 * align with dyn_pcm_assign mode
-	 */
-	spec->pcm_rec[pcm_idx].jack = jack->jack;
-	return 0;
-}
-
 static int generic_hdmi_build_controls(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec = codec->spec;
@@ -2343,7 +2251,6 @@ static int generic_hdmi_init(struct hda_codec *codec)
 	int pin_idx;
 
 	mutex_lock(&spec->bind_lock);
-	spec->use_jack_detect = !codec->jackpoll_interval;
 	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
 		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
 		hda_nid_t pin_nid = per_pin->pin_nid;
@@ -2353,12 +2260,8 @@ static int generic_hdmi_init(struct hda_codec *codec)
 		hdmi_init_pin(codec, pin_nid);
 		if (codec_has_acomp(codec))
 			continue;
-		if (spec->use_jack_detect)
-			snd_hda_jack_detect_enable(codec, pin_nid, dev_id);
-		else
-			snd_hda_jack_detect_enable_callback_mst(codec, pin_nid,
-								dev_id,
-								jack_callback);
+		snd_hda_jack_detect_enable_callback_mst(codec, pin_nid, dev_id,
+							jack_callback);
 	}
 	mutex_unlock(&spec->bind_lock);
 	return 0;
@@ -2520,12 +2423,6 @@ static void reprogram_jack_detect(struct hda_codec *codec, hda_nid_t nid,
 		unsigned int val = use_acomp ? 0 : (AC_USRSP_EN | tbl->tag);
 		snd_hda_codec_write_cache(codec, nid, 0,
 					  AC_VERB_SET_UNSOLICITED_ENABLE, val);
-	} else {
-		/* if no jack entry was defined beforehand, create a new one
-		 * at need (i.e. only when notifier is cleared)
-		 */
-		if (!use_acomp)
-			snd_hda_jack_detect_enable(codec, nid, dev_id);
 	}
 }
 
@@ -2541,13 +2438,11 @@ static void generic_acomp_notifier_set(struct drm_audio_component *acomp,
 	spec->use_acomp_notifier = use_acomp;
 	spec->codec->relaxed_resume = use_acomp;
 	/* reprogram each jack detection logic depending on the notifier */
-	if (spec->use_jack_detect) {
-		for (i = 0; i < spec->num_pins; i++)
-			reprogram_jack_detect(spec->codec,
-					      get_pin(spec, i)->pin_nid,
-					      get_pin(spec, i)->dev_id,
-					      use_acomp);
-	}
+	for (i = 0; i < spec->num_pins; i++)
+		reprogram_jack_detect(spec->codec,
+				      get_pin(spec, i)->pin_nid,
+				      get_pin(spec, i)->dev_id,
+				      use_acomp);
 	mutex_unlock(&spec->bind_lock);
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
