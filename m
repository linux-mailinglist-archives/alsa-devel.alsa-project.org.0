Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4C6CC2B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 11:46:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0252B167F;
	Thu, 18 Jul 2019 11:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0252B167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563443205;
	bh=xajzkgOxLQb19hqYg+Zgy2C7KhdKFFztBADwSbg3fo0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U/E47ZFzPgvUBHQ7ZmgnPfWvyns2JHTjyrZNAZc/v4L19BTDGqIstP+oIyC2DpxiD
	 /VORitrro5eUIMAmK//iQT7zmQ25x3Cea5rBsh7yQc2wx4iG6EeLCeoOF8xC8+PauO
	 LzLKQanfOpy6rgKzOCfcT0IhUNeWm2hEMThQl7BI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2474F803D7;
	Thu, 18 Jul 2019 11:43:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B927DF80362; Thu, 18 Jul 2019 11:43:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5950F80362
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 11:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5950F80362
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 418D6ABF4
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 09:43:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 18 Jul 2019 11:43:21 +0200
Message-Id: <20190718094321.16442-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190718094321.16442-1-tiwai@suse.de>
References: <20190718094321.16442-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/2] ALSA: hda/hdmi - Allow audio component for
	AMD/ATI and Nvidia HDMI
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

AMD/ATI and Nvidia HDMI codec drivers didn't have the audio component
binding like i915, but it worked only with the traditional HD-audio
unsolicited event for the HDMI hotplug detection and the ELD read-up
thereafter.  This has been a problem in many ways: first of all, it
goes through the hardware event transition (from GPU register write,
HD-audio controller trigger, and finally to HD-audio unsolicited event
handling), which is often unreliable and may miss some opportunities.
Second, each unsol event handling and ELD read-up need the explicit
power up / down when the codec is in the runtime suspend.  Last but
not least, which is the most important, the hotplug wakeup may be
missed when the HD-audio controller is in runtime suspend.  Especially
the last point is a big problem due to the recent change relevant with
vga_switcheroo that forcibly enables the runtime PM for AMD HDMI
controllers.

These issues are solved by introducing the audio component; the
hotplug notification is done by a direct function callback, which is
more accurate and reliable, and it can be processed without the actual
hardware access, i.e. no runtime PM trigger is needed, and the
HD-audio gets the event even if it's in runtime suspend.  The same for
ELD query, as it's read directly from the cached ELD bytes stored in
the DRM driver, hence the whole hardware access can be skipped.

So here it is: this patch implements the audio component binding with
AMD/ATI and Nouveau DRM drivers.  The biggest difference from i915
implementation is that this binding is fully optional and it can be
enabled asynchronously on the fly.  That is, the driver will switch
from the HD-audio unsolicited event to the notify callback once when
the DRM component gets bound.  Similarly, when DRM driver gets
unloaded, the HDMI event handling returns to the legacy mode, too.

Also, another difference from i915 is that the new code registers the
component in the codec driver, while i915 HDMI codec assumes the
component binding was already done in the HD-audio controller driver.
Hence the new code does need to de-register the component binding at
the codec exit, too.

Some other details:
- The match component ops assumes that both VGA and HD-audio
  controller PCI entries belong to the same PCI bus, and only accepts
  such an entry.

- The pin2port audio_ops is implemented with assumption of the fixed
  widget layout.  For AMD, it's starting from 3, with step 2 (3, 5, 7,
  ...), while for Nvidia, it's starting from 4, with step 1 (4, 5, 6,
  ...)

As of this patch, the corresponding component isn't implemented in DRM
side, so this change alone won't give any benefit.  By the following
changes in DRM sides, the mission will be completed.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 233 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 211 insertions(+), 22 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index c380596b2e84..2096993eaf28 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -18,6 +18,7 @@
 
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -119,6 +120,7 @@ struct hdmi_pcm {
 };
 
 struct hdmi_spec {
+	struct hda_codec *codec;
 	int num_cvts;
 	struct snd_array cvts; /* struct hdmi_spec_per_cvt */
 	hda_nid_t cvt_nids[4]; /* only for haswell fix */
@@ -163,9 +165,11 @@ struct hdmi_spec {
 	struct hda_multi_out multiout;
 	struct hda_pcm_stream pcm_playback;
 
-	/* i915/powerwell (Haswell+/Valleyview+) specific */
-	bool use_acomp_notifier; /* use i915 eld_notify callback for hotplug */
+	bool use_jack_detect; /* jack detection enabled */
+	bool use_acomp_notifier; /* use eld_notify callback for hotplug */
+	bool acomp_registered; /* audio component registered in this driver */
 	struct drm_audio_component_audio_ops drm_audio_ops;
+	int (*port2pin)(struct hda_codec *, int); /* reverse port/pin mapping */
 
 	struct hdac_chmap chmap;
 	hda_nid_t vendor_nid;
@@ -765,6 +769,10 @@ static void check_presence_and_report(struct hda_codec *codec, hda_nid_t nid,
 static void jack_callback(struct hda_codec *codec,
 			  struct hda_jack_callback *jack)
 {
+	/* stop polling when notification is enabled */
+	if (codec_has_acomp(codec))
+		return;
+
 	/* hda_jack don't support DP MST */
 	check_presence_and_report(codec, jack->nid, 0);
 }
@@ -823,6 +831,9 @@ static void hdmi_unsol_event(struct hda_codec *codec, unsigned int res)
 	int tag = res >> AC_UNSOL_RES_TAG_SHIFT;
 	int subtag = (res & AC_UNSOL_RES_SUBTAG) >> AC_UNSOL_RES_SUBTAG_SHIFT;
 
+	if (codec_has_acomp(codec))
+		return;
+
 	if (!snd_hda_jack_tbl_get_from_tag(codec, tag)) {
 		codec_dbg(codec, "Unexpected HDMI event tag 0x%x\n", tag);
 		return;
@@ -1636,18 +1647,13 @@ static bool hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll)
 			snd_hda_power_down_pm(codec);
 			return false;
 		}
-	}
-
-	if (codec_has_acomp(codec)) {
+		ret = hdmi_present_sense_via_verbs(per_pin, repoll);
+		snd_hda_power_down_pm(codec);
+	} else {
 		sync_eld_via_acomp(codec, per_pin);
 		ret = false; /* don't call snd_hda_jack_report_sync() */
-	} else {
-		ret = hdmi_present_sense_via_verbs(per_pin, repoll);
 	}
 
-	if (!codec_has_acomp(codec))
-		snd_hda_power_down_pm(codec);
-
 	return ret;
 }
 
@@ -2252,6 +2258,8 @@ static int generic_hdmi_init(struct hda_codec *codec)
 	struct hdmi_spec *spec = codec->spec;
 	int pin_idx;
 
+	mutex_lock(&spec->pcm_lock);
+	spec->use_jack_detect = !codec->jackpoll_interval;
 	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
 		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
 		hda_nid_t pin_nid = per_pin->pin_nid;
@@ -2259,11 +2267,15 @@ static int generic_hdmi_init(struct hda_codec *codec)
 
 		snd_hda_set_dev_select(codec, pin_nid, dev_id);
 		hdmi_init_pin(codec, pin_nid);
-		if (!codec_has_acomp(codec))
+		if (codec_has_acomp(codec))
+			continue;
+		if (spec->use_jack_detect)
+			snd_hda_jack_detect_enable(codec, pin_nid);
+		else
 			snd_hda_jack_detect_enable_callback(codec, pin_nid,
-				codec->jackpoll_interval > 0 ?
-				jack_callback : NULL);
+							    jack_callback);
 	}
+	mutex_unlock(&spec->pcm_lock);
 	return 0;
 }
 
@@ -2296,7 +2308,9 @@ static void generic_hdmi_free(struct hda_codec *codec)
 	struct hdmi_spec *spec = codec->spec;
 	int pin_idx, pcm_idx;
 
-	if (codec_has_acomp(codec)) {
+	if (spec->acomp_registered) {
+		snd_hdac_acomp_exit(&codec->bus->core);
+	} else if (codec_has_acomp(codec)) {
 		snd_hdac_acomp_register_notifier(&codec->bus->core, NULL);
 		codec->relaxed_resume = 0;
 	}
@@ -2364,6 +2378,7 @@ static int alloc_generic_hdmi(struct hda_codec *codec)
 	if (!spec)
 		return -ENOMEM;
 
+	spec->codec = codec;
 	spec->ops = generic_standard_hdmi_ops;
 	spec->dev_num = 1;	/* initialize to 1 */
 	mutex_init(&spec->pcm_lock);
@@ -2401,6 +2416,136 @@ static int patch_generic_hdmi(struct hda_codec *codec)
 	return 0;
 }
 
+/*
+ * generic audio component binding
+ */
+
+/* turn on / off the unsol event jack detection dynamically */
+static void reprogram_jack_detect(struct hda_codec *codec, hda_nid_t nid,
+				  bool use_acomp)
+{
+	struct hda_jack_tbl *tbl;
+
+	tbl = snd_hda_jack_tbl_get(codec, nid);
+	if (tbl) {
+		/* clear unsol even if component notifier is used, or re-enable
+		 * if notifier is cleared
+		 */
+		unsigned int val = use_acomp ? 0 : (AC_USRSP_EN | tbl->tag);
+		snd_hda_codec_write_cache(codec, nid, 0,
+					  AC_VERB_SET_UNSOLICITED_ENABLE, val);
+	} else {
+		/* if no jack entry was defined beforehand, create a new one
+		 * at need (i.e. only when notifier is cleared)
+		 */
+		if (!use_acomp)
+			snd_hda_jack_detect_enable(codec, nid);
+	}
+}
+
+/* set up / clear component notifier dynamically */
+static void generic_acomp_notifier_set(struct drm_audio_component *acomp,
+				       bool use_acomp)
+{
+	struct hdmi_spec *spec;
+	int i;
+
+	spec = container_of(acomp->audio_ops, struct hdmi_spec, drm_audio_ops);
+	mutex_lock(&spec->pcm_lock);
+	spec->use_acomp_notifier = use_acomp;
+	spec->codec->relaxed_resume = use_acomp;
+	/* reprogram each jack detection logic depending on the notifier */
+	if (spec->use_jack_detect) {
+		for (i = 0; i < spec->num_pins; i++)
+			reprogram_jack_detect(spec->codec,
+					      get_pin(spec, i)->pin_nid,
+					      use_acomp);
+	}
+	mutex_unlock(&spec->pcm_lock);
+}
+
+/* enable / disable the notifier via master bind / unbind */
+static int generic_acomp_master_bind(struct device *dev,
+				     struct drm_audio_component *acomp)
+{
+	generic_acomp_notifier_set(acomp, true);
+	return 0;
+}
+
+static void generic_acomp_master_unbind(struct device *dev,
+					struct drm_audio_component *acomp)
+{
+	generic_acomp_notifier_set(acomp, false);
+}
+
+/* check whether both HD-audio and DRM PCI devices belong to the same bus */
+static int match_bound_vga(struct device *dev, int subtype, void *data)
+{
+	struct hdac_bus *bus = data;
+	struct pci_dev *pci, *master;
+
+	if (!dev_is_pci(dev) || !dev_is_pci(bus->dev))
+		return 0;
+	master = to_pci_dev(bus->dev);
+	pci = to_pci_dev(dev);
+	return master->bus == pci->bus;
+}
+
+/* audio component notifier for AMD/Nvidia HDMI codecs */
+static void generic_acomp_pin_eld_notify(void *audio_ptr, int port, int dev_id)
+{
+	struct hda_codec *codec = audio_ptr;
+	struct hdmi_spec *spec = codec->spec;
+	hda_nid_t pin_nid = spec->port2pin(codec, port);
+
+	if (!pin_nid)
+		return;
+	if (get_wcaps_type(get_wcaps(codec, pin_nid)) != AC_WID_PIN)
+		return;
+	/* skip notification during system suspend (but not in runtime PM);
+	 * the state will be updated at resume
+	 */
+	if (snd_power_get_state(codec->card) != SNDRV_CTL_POWER_D0)
+		return;
+	/* ditto during suspend/resume process itself */
+	if (snd_hdac_is_in_pm(&codec->core))
+		return;
+
+	check_presence_and_report(codec, pin_nid, dev_id);
+}
+
+/* set up the private drm_audio_ops from the template */
+static void setup_drm_audio_ops(struct hda_codec *codec,
+				const struct drm_audio_component_audio_ops *ops)
+{
+	struct hdmi_spec *spec = codec->spec;
+
+	spec->drm_audio_ops.audio_ptr = codec;
+	/* intel_audio_codec_enable() or intel_audio_codec_disable()
+	 * will call pin_eld_notify with using audio_ptr pointer
+	 * We need make sure audio_ptr is really setup
+	 */
+	wmb();
+	spec->drm_audio_ops.pin2port = ops->pin2port;
+	spec->drm_audio_ops.pin_eld_notify = ops->pin_eld_notify;
+	spec->drm_audio_ops.master_bind = ops->master_bind;
+	spec->drm_audio_ops.master_unbind = ops->master_unbind;
+}
+
+/* initialize the generic HDMI audio component */
+static void generic_acomp_init(struct hda_codec *codec,
+			       const struct drm_audio_component_audio_ops *ops,
+			       int (*port2pin)(struct hda_codec *, int))
+{
+	struct hdmi_spec *spec = codec->spec;
+
+	spec->port2pin = port2pin;
+	setup_drm_audio_ops(codec, ops);
+	if (!snd_hdac_acomp_init(&codec->bus->core, &spec->drm_audio_ops,
+				 match_bound_vga, 0))
+		spec->acomp_registered = true;
+}
+
 /*
  * Intel codec parsers and helpers
  */
@@ -2569,20 +2714,19 @@ static void intel_pin_eld_notify(void *audio_ptr, int port, int pipe)
 	check_presence_and_report(codec, pin_nid, dev_id);
 }
 
+static const struct drm_audio_component_audio_ops intel_audio_ops = {
+	.pin2port = intel_pin2port,
+	.pin_eld_notify = intel_pin_eld_notify,
+};
+
 /* register i915 component pin_eld_notify callback */
 static void register_i915_notifier(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec = codec->spec;
 
 	spec->use_acomp_notifier = true;
-	spec->drm_audio_ops.audio_ptr = codec;
-	/* intel_audio_codec_enable() or intel_audio_codec_disable()
-	 * will call pin_eld_notify with using audio_ptr pointer
-	 * We need make sure audio_ptr is really setup
-	 */
-	wmb();
-	spec->drm_audio_ops.pin2port = intel_pin2port;
-	spec->drm_audio_ops.pin_eld_notify = intel_pin_eld_notify;
+	spec->port2pin = intel_port2pin;
+	setup_drm_audio_ops(codec, &intel_audio_ops);
 	snd_hdac_acomp_register_notifier(&codec->bus->core,
 					&spec->drm_audio_ops);
 	/* no need for forcible resume for jack check thanks to notifier */
@@ -2980,6 +3124,7 @@ static int patch_simple_hdmi(struct hda_codec *codec,
 	if (!spec)
 		return -ENOMEM;
 
+	spec->codec = codec;
 	codec->spec = spec;
 	hdmi_array_init(spec, 1);
 
@@ -3284,6 +3429,26 @@ static int nvhdmi_chmap_validate(struct hdac_chmap *chmap,
 	return 0;
 }
 
+/* map from pin NID to port; port is 0-based */
+/* for Nvidia: assume widget NID starting from 4, with step 1 (4, 5, 6, ...) */
+static int nvhdmi_pin2port(void *audio_ptr, int pin_nid)
+{
+	return pin_nid - 4;
+}
+
+/* reverse-map from port to pin NID: see above */
+static int nvhdmi_port2pin(struct hda_codec *codec, int port)
+{
+	return port + 4;
+}
+
+static const struct drm_audio_component_audio_ops nvhdmi_audio_ops = {
+	.pin2port = nvhdmi_pin2port,
+	.pin_eld_notify = generic_acomp_pin_eld_notify,
+	.master_bind = generic_acomp_master_bind,
+	.master_unbind = generic_acomp_master_unbind,
+};
+
 static int patch_nvhdmi(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec;
@@ -3300,6 +3465,8 @@ static int patch_nvhdmi(struct hda_codec *codec)
 		nvhdmi_chmap_cea_alloc_validate_get_type;
 	spec->chmap.ops.chmap_validate = nvhdmi_chmap_validate;
 
+	generic_acomp_init(codec, &nvhdmi_audio_ops, nvhdmi_port2pin);
+
 	return 0;
 }
 
@@ -3787,6 +3954,26 @@ static int atihdmi_init(struct hda_codec *codec)
 	return 0;
 }
 
+/* map from pin NID to port; port is 0-based */
+/* for AMD: assume widget NID starting from 3, with step 2 (3, 5, 7, ...) */
+static int atihdmi_pin2port(void *audio_ptr, int pin_nid)
+{
+	return pin_nid / 2 - 1;
+}
+
+/* reverse-map from port to pin NID: see above */
+static int atihdmi_port2pin(struct hda_codec *codec, int port)
+{
+	return port * 2 + 3;
+}
+
+static const struct drm_audio_component_audio_ops atihdmi_audio_ops = {
+	.pin2port = atihdmi_pin2port,
+	.pin_eld_notify = generic_acomp_pin_eld_notify,
+	.master_bind = generic_acomp_master_bind,
+	.master_unbind = generic_acomp_master_unbind,
+};
+
 static int patch_atihdmi(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec;
@@ -3835,6 +4022,8 @@ static int patch_atihdmi(struct hda_codec *codec)
 	 */
 	codec->link_down_at_suspend = 1;
 
+	generic_acomp_init(codec, &atihdmi_audio_ops, atihdmi_port2pin);
+
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
