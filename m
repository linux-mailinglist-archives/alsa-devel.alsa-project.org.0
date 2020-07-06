Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 051DD2160B7
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 22:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2421655;
	Mon,  6 Jul 2020 22:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2421655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594068927;
	bh=SVNuGtiExaNj6fKOjSpEd9gYuf/+pE21GPvhoYKokO8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mWpy+IpTF1DhYZqmPFYM1qqriMXYfRFnTzwCdoavTJ6RcB2Z7cKsL1fWWCiZz2xD/
	 n3ju1itMAwnDzD31KGnp1QGes+J+vYWPLusmQH4I6FBMZqtZpVDiKA9ljORUyjXczD
	 gcIG5qZZp8RoxXfhpobWPFim2JDJYUgp9v2yxbHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A45EBF8015C;
	Mon,  6 Jul 2020 22:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79DFFF8015A; Mon,  6 Jul 2020 22:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CE5EF8010A
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 22:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CE5EF8010A
IronPort-SDR: 7AxB6E5Fj8TEHzr8Yb8PB+Brq90SbDLflq9ciHBOJ+c3mrwfweJa1Fz192N3sgE6S7Iav/nZ3n
 qggAK7hMHKIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="146577293"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="146577293"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 13:53:27 -0700
IronPort-SDR: v8qefnw1PX/m3OCUsoNNP9BC62kkNYsBPirSr/GfBOdE1jUV4GUosgH+Oa3+/Ubj3wougCuBDp
 b3pyv42WdBxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="297124385"
Received: from joycetoh-desk.sc.intel.com ([172.25.206.187])
 by orsmga002.jf.intel.com with ESMTP; 06 Jul 2020 13:53:27 -0700
From: Harsha Priya <harshapriya.n@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v3] ALSA: hda/hdmi: Add Intel silent stream support
Date: Mon,  6 Jul 2020 13:53:17 -0700
Message-Id: <1594068797-14011-1-git-send-email-harshapriya.n@intel.com>
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

Intel hardware (Haswell and beyond) can keep the link active
with a 'silent stream', so that the receiver does not go through those
two steps when valid audio is transmitted. This mechanism relies
on an setting the channel_id as 0xf, sending info packet and preventing
the codec from going to D3,  which will increase the platform
static power consumption. The info packet assumes a basic 2ch stereo,
and the silent stream is enabled when connecting a monitor.
In case of format changes the detection of PCM v. IEC61937 needs to
be re-run. In this case there is no way to avoid the 2-3s mute.

The silent stream is enabled with a Kconfig option, as well as a kernel
parameter should there be a need to override the build time default.
This approach is used based on the power_save capability as an example,
but in the future, it may be used with a kcontrol,
depending on UCM support for HDaudio legacy.

Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
Signed-off-by: Emmanuel Jillela <emmanuel.jillela@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reported-by: kernel test robot <lkp@intel.com>
---
Change History:

v3:
- Removed eld_valid check along side of silent stream enable check
  as its redundant with the monitor_present variable
- Limited the change to take affect only for Haswell and beyond Intel platforms
- As per the spec, setting the channel_id as 0xf before sending info packet
- Fixed issue reported by Kernel Test Robot (tag added)
- Tested on Intel Cometlake based Chromebook connected to few different monitors
  and docks.  

v2:
- Kconfig symbol depends on SND_HDA_INTEL.
- Added valid eld check to along side of silent stream enable check,
  under which silent stream is enabled.
- Error prints added for codec power up, power down functions.
- The silent stream is enabled with a Kconfig/module parameter
  following the power_save capability as an example. But in the future,
  it may be used with a kcontrol, depending on UCM support for HDaudio legacy.

v1:
- Initial version.

 sound/pci/hda/Kconfig      | 14 ++++++++++
 sound/pci/hda/patch_hdmi.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 3f9abda..bf213e5 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -239,6 +239,20 @@ config SND_HDA_POWER_SAVE_DEFAULT
 	  The default time-out value in seconds for HD-audio automatic
 	  power-save mode.  0 means to disable the power-save mode.
 
+config SND_HDA_INTEL_HDMI_SILENT_STREAM
+	bool "Enable Silent Stream always for HDMI"
+	depends on SND_HDA_INTEL
+	help
+	  Intel hardware has a feature called 'silent stream', that
+	  keeps external HDMI receiver's analog circuitry powered on
+	  avoiding 2-3 sec silence during playback start. This mechanism
+	  relies on setting channel_id as 0xf, sending info packet and
+	  preventing codec D3 entry (increasing  platform static power
+	  consumption when HDMI receiver is plugged-in). 2-3 sec silence
+	  at the playback start is expected whenever there is format change.
+	  (default is 2 channel format).
+	  Say Y to enable Silent Stream feature.
+
 endif
 
 endmenu
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index e2b21ef..18eabcf 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -42,6 +42,11 @@ static bool enable_acomp = true;
 module_param(enable_acomp, bool, 0444);
 MODULE_PARM_DESC(enable_acomp, "Enable audio component binding (default=yes)");
 
+static bool enable_silent_stream =
+IS_ENABLED(CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM);
+module_param(enable_silent_stream, bool, 0644);
+MODULE_PARM_DESC(enable_silent_stream, "Enable Silent Stream for HDMI devices");
+
 struct hdmi_spec_per_cvt {
 	hda_nid_t cvt_nid;
 	int assigned;
@@ -167,6 +172,7 @@ struct hdmi_spec {
 	hda_nid_t vendor_nid;
 	const int *port_map;
 	int port_num;
+	bool send_silent_stream; /* Flag to enable silent stream feature */
 };
 
 #ifdef CONFIG_SND_HDA_COMPONENT
@@ -1634,21 +1640,72 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	snd_hda_power_down_pm(codec);
 }
 
+static void silent_stream_enable(struct hda_codec *codec,
+				struct hdmi_spec_per_pin *per_pin)
+{
+	unsigned int newval, oldval;
+
+	codec_dbg(codec, "hdmi: enabling silent stream for NID %d\n",
+			per_pin->pin_nid);
+
+	mutex_lock(&per_pin->lock);
+
+	if (!per_pin->channels)
+		per_pin->channels = 2;
+
+	oldval = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
+			AC_VERB_GET_CONV, 0);
+	newval = (oldval & 0xF0) | 0xF;
+	snd_hda_codec_write(codec, per_pin->pin_nid, 0,
+			AC_VERB_SET_CHANNEL_STREAMID, newval);
+
+	hdmi_setup_audio_infoframe(codec, per_pin, per_pin->non_pcm);
+
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
+	if (spec->send_silent_stream) {
+		int pm_ret;
+
+		if (!monitor_prev && monitor_next) {
+			pm_ret = snd_hda_power_up_pm(codec);
+			if (pm_ret < 0)
+				codec_err(codec,
+				"Monitor plugged-in, Failed to power up codec ret=[%d]\n",
+				pm_ret);
+			silent_stream_enable(codec, per_pin);
+		} else if (monitor_prev && !monitor_next) {
+			pm_ret = snd_hda_power_down_pm(codec);
+			if (pm_ret < 0)
+				codec_err(codec,
+				"Monitor plugged-out, Failed to power down codec ret=[%d]\n",
+				pm_ret);
+		}
+	}
 }
 
 static void hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll)
@@ -2791,6 +2848,13 @@ static int intel_hsw_common_init(struct hda_codec *codec, hda_nid_t vendor_nid,
 	spec->ops.setup_stream = i915_hsw_setup_stream;
 	spec->ops.pin_cvt_fixup = i915_pin_cvt_fixup;
 
+	/*
+	 * Enable silent stream feature, if it is enabled via
+	 * module param or Kconfig option
+	 */
+	if (enable_silent_stream)
+		spec->send_silent_stream = true;
+
 	return parse_intel_hdmi(codec);
 }
 
-- 
2.7.4

