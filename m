Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D1206866
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 01:30:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F67517DE;
	Wed, 24 Jun 2020 01:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F67517DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592955006;
	bh=1qjrHfsCSMjwkCO0sRXrAdGXVrEWf4h/ll7EgMJu1s8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RJsbCIw3vWMALr8Wgfx7Zq9BWq1pXuCYKpsHF1HK2UHkut+44ImhMDVVMHPiPpMWy
	 hVBrTx8Ug8VeQ387d9YlcFCe2Gacde2lsPutYTrevWo4YCFXHR5sbXBz0k5It3+EQv
	 ya6uESsCQhP5wAcZvlcaxm9wEjUWJg8zgzi7bK1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A79D4F8012F;
	Wed, 24 Jun 2020 01:28:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8003F80234; Wed, 24 Jun 2020 01:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAC15F8012F
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 01:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAC15F8012F
IronPort-SDR: rDMrRI02Trmua3GxAp9uZPGHTkXQvl0feyrjHvALCP/jT0AWljMXTM13TTBx1G0SqDjiR3nr9X
 mkyZiA0Ki0dA==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="228949781"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; d="scan'208";a="228949781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 16:28:08 -0700
IronPort-SDR: BCqzoQLeggTBlsYZROfL/Bdf4frmJ0tbcY9H9ASgGrHaGBjilICaTwzomm309RK+oHJ5eLfTbh
 I4bzmxjDXMkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; d="scan'208";a="293362091"
Received: from joycetoh-desk.sc.intel.com ([172.25.206.187])
 by orsmga002.jf.intel.com with ESMTP; 23 Jun 2020 16:28:07 -0700
From: Harsha Priya <harshapriya.n@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
Date: Tue, 23 Jun 2020 16:26:36 -0700
Message-Id: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: kai.vehmanen@intel.com, Harsha Priya <harshapriya.n@intel.com>,
 Emmanuel Jillela <emmanuel.jillela@intel.com>
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

External HDMI receivers have analog circuitry that needs to be powered-on
when exiting standby, and a mechanism to detect PCM v. IEC61937 data.
These two steps take time and up to 2-3 seconds of audio may be muted
when starting playback.

Intel hardware can keep the link active with a 'silent stream', so that
the receiver does not go through those two steps when valid audio is
transmitted. This mechanism relies on an info packet and preventing the
codec from going to D3, which will increase the platform static power
consumption. The info packet assumes a basic 2ch stereo, and the silent
stream is enabled when connecting a monitor. In case of format changes the
detection of PCM v. IEC61937 needs to be re-run. In this case there is no
way to avoid the 2-3s mute.

The silent stream is enabled with a Kconfig option, as well as a kernel
parameter should there be a need to override the build time default.

Silent stream is supported in Intel platforms Skylake and beyond.
Tested HDMI plug-out plug-in from Intel Cometlake based Chromebook
connected to few different monitors.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
Signed-off-by: Emmanuel Jillela <emmanuel.jillela@intel.com>
---

 sound/pci/hda/Kconfig      | 16 ++++++++++++++++
 sound/pci/hda/patch_hdmi.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 7ba542e45a3d..8804808410b3 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -232,4 +232,20 @@ config SND_HDA_POWER_SAVE_DEFAULT
 
 endif
 
+config SND_HDA_INTEL_HDMI_SILENT_STREAM
+	bool "Enable Silent Stream always for HDMI"
+	depends on SND_HDA
+	help
+	  Intel hardware has a feature called 'silent stream', that
+	  keeps external HDMI receiver's analog circuitry powered on
+	  avoiding 2-3 sec silence during playback start. This mechanism
+	  relies on an info packet and preventing the codec from going to
+	  D3. (increasing the platform static power consumption when a
+	  HDMI receiver is plugged-in). 2-3 sec silence at the playback
+	  start is expected whenever there is format change. (default is
+	  2 channel format).
+	  Say Y to enable Silent Stream feature.
+
+endif
+
 endmenu
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index fbd7cc6026d8..52bb81c952af 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -42,6 +42,11 @@ static bool enable_acomp = true;
 module_param(enable_acomp, bool, 0444);
 MODULE_PARM_DESC(enable_acomp, "Enable audio component binding (default=yes)");
 
+static bool enable_silent_stream =
+IS_ENABLED(CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM);
+module_param(enable_silent_stream, bool, 0644);
+MODULE_PARM_DESC(enable_silent_stream, "Enable Silent Stream for HDMI receivers");
+
 struct hdmi_spec_per_cvt {
 	hda_nid_t cvt_nid;
 	int assigned;
@@ -1634,21 +1639,50 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	snd_hda_power_down_pm(codec);
 }
 
+static void silent_stream_enable(struct hda_codec *codec,
+			struct hdmi_spec_per_pin *per_pin)
+{
+	codec_dbg(codec, "hdmi: Enabling silent stream for NID %d\n",
+			per_pin->pin_nid);
+
+	mutex_lock(&per_pin->lock);
+	if (!per_pin->channels)
+		per_pin->channels = 2;
+	hdmi_setup_audio_infoframe(codec, per_pin, per_pin->non_pcm);
+	mutex_unlock(&per_pin->lock);
+}
+
 /* update ELD and jack state via audio component */
 static void sync_eld_via_acomp(struct hda_codec *codec,
 			       struct hdmi_spec_per_pin *per_pin)
 {
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_eld *eld = &spec->temp_eld;
+	bool monitor_prev, monitor_next;
 
 	mutex_lock(&per_pin->lock);
 	eld->monitor_present = false;
+	monitor_prev = per_pin->sink_eld.monitor_present;
 	eld->eld_size = snd_hdac_acomp_get_eld(&codec->core, per_pin->pin_nid,
 				      per_pin->dev_id, &eld->monitor_present,
 				      eld->eld_buffer, ELD_MAX_SIZE);
 	eld->eld_valid = (eld->eld_size > 0);
 	update_eld(codec, per_pin, eld, 0);
+	monitor_next = per_pin->sink_eld.monitor_present;
 	mutex_unlock(&per_pin->lock);
+
+	/*
+	 * Power-up will call hdmi_present_sense, so the PM calls
+	 * have to be done without mutex held.
+	 */
+
+	if (enable_silent_stream) {
+		if (!monitor_prev && monitor_next) {
+			snd_hda_power_up_pm(codec);
+			silent_stream_enable(codec, per_pin);
+		} else if (monitor_prev && !monitor_next)
+			snd_hda_power_down_pm(codec);
+	}
 }
 
 static void hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll)
-- 
2.17.1

