Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD16101E9
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:43:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA52164F;
	Thu, 27 Oct 2022 21:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA52164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899781;
	bh=CkXgfb2uB0rKr6BruYmDWfLIaYApT/LAJHKPGB+rjzM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mk7Xi2Y0czd1pRiBktDnqZpoNwS6c3PUTVkX3gfQLTgx4dOimdvUQwfdkFVDRCrDQ
	 vaSmu+YYgoh0tCYUhxynA5O73CeIEvZ+AD76I0pl0luh16pDRw7H59i3JiimOZbK6z
	 GxOB8K1M6YUaFE3I6CMN9Rnqht2W5rmHS+tQ3x/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77BDAF805FC;
	Thu, 27 Oct 2022 21:36:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA71CF805C5; Thu, 27 Oct 2022 21:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F549F805AE
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F549F805AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PnwFiRmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899391; x=1698435391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CkXgfb2uB0rKr6BruYmDWfLIaYApT/LAJHKPGB+rjzM=;
 b=PnwFiRmNXlkGKxCn9GRAXKtKjhT3EYgYqQkfI0m/4cBhqIZ/h+1+aXbm
 TCC5zH1KHgQ1DcpcPyOx+ABsFlZNKLdy0jUZzLJrTjSCHm+8Ed+1HW5l4
 juWV0RTut3Q3EgixOYDY40RWnap6ressR7mS+lUItvNINIBIBLInD5Wpy
 sbMo5q78HhS4zEqX4k9+nkTMja1gdrMMih7LLTxYDpzG1xdGiGcvobdks
 ci4kRJJe7mqQxHKWWXuErBgtojNXFBqUrY/71ye+OecPuCzOEQu6fhDGO
 gR7LQoOTz91wQYq7mOAq6J8V0vpwg7u2dImU76wmNkLIP2dzMZos5Rxu8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957891"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957891"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527091"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527091"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 21/21] ASoC: SOF: introduce new DEBUG_NOCODEC mode
Date: Thu, 27 Oct 2022 15:35:40 -0400
Message-Id: <20221027193540.259520-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The existing NOCODEC mode enforces a build-time mutual exclusion with
the HDaudio link support, mostly to avoid any dependency on the
snd_hdac library and references to HDAudio codec/i915 stuff.

This is very useful to track dependencies and test a minimal
configuration, but very painful for developers and CI: a recompilation
and reinstall of the kernel modules is required.

This patch suggests an alternate middle ground where the selection of
the machine driver and all codec-related actions are bypassed at
run-time, contingent on a kernel module parameter being set.

For example setting BIT(10) with
'options snd_sof sof_debug=0x401'
is enough to switch from an HDaudio card to a nocodec one.

This new DEBUG_NOCODEC mode is not suitable for distributions and
end-users. It's not even recommended on all platforms, i.e. the
NOCODEC mode is known not to work on specific devices where the BIOS
did not configure support for I2S/DMIC interfaces. The usual
development devices such as Chromebooks, Up boards and Intel RVP are
the only recommended platforms where this mode can be supported.

Note that the dynamic switch between HDaudio and nocodec may not
always possible depending on hardware layout, pin-mux options, and
BIOS settings. The audio subsustems on Intel platforms has to support
4 types of interfaces and pin-mux can be complicated.

Reviewers might ask: why didn't we do this earlier? The main reason is
that all the codec-related configurations were not cleanly separated
out in the sof/intel directory. With all the cleanups done recently,
adding this opt-in behavior is relatively straightforward.

Tested on UpExtreme (WHL) and UpExtreme i11 (TGL).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Kconfig           | 18 ++++++++--
 sound/soc/sof/intel/Kconfig     |  2 +-
 sound/soc/sof/intel/hda-codec.c | 59 +++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.c       |  5 +++
 sound/soc/sof/sof-priv.h        |  3 ++
 5 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 37f7df5fde17..0b9beb74b0f6 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -97,13 +97,13 @@ config SND_SOC_SOF_NOCODEC
 	tristate
 
 config SND_SOC_SOF_NOCODEC_SUPPORT
-	bool "SOF nocodec mode support"
+	bool "SOF nocodec static mode support"
 	help
 	  This adds support for a dummy/nocodec machine driver fallback
 	  option if no known codec is detected. This is typically only
 	  enabled for developers or devices where the sound card is
 	  controlled externally.
-	  This option is mutually exclusive with the Intel HDAudio support.
+	  This option is mutually exclusive at build time with the Intel HDAudio support.
 	  Selecting it may have negative impacts and prevent e.g. microphone
 	  functionality from being enabled on Intel CoffeeLake and later
 	  platforms.
@@ -136,6 +136,19 @@ config SND_SOC_SOF_DEBUG
 
 if SND_SOC_SOF_DEBUG
 
+config SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT
+	bool "SOF nocodec debug mode support"
+	depends on !SND_SOC_SOF_NOCODEC_SUPPORT
+	help
+	  This adds support for a dummy/nocodec machine driver fallback
+	  option.
+	  Unlike the SND_SOC_SOF_NOCODEC_SUPPORT, this option is NOT
+	  mutually exclusive at build with the Intel HDAudio support. The
+	  selection will be done depending on command line or modprobe.d settings
+	  Distributions should not select this option!
+	  Say Y if you need this nocodec debug fallback option.
+	  If unsure select "N".
+
 config SND_SOC_SOF_FORCE_NOCODEC_MODE
 	bool "SOF force nocodec Mode"
 	depends on SND_SOC_SOF_NOCODEC_SUPPORT
@@ -239,6 +252,7 @@ config SND_SOC_SOF
 	tristate
 	select SND_SOC_TOPOLOGY
 	select SND_SOC_SOF_NOCODEC if SND_SOC_SOF_NOCODEC_SUPPORT
+	select SND_SOC_SOF_NOCODEC if SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 7af495fb6125..36a0e2bf30ff 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -277,7 +277,7 @@ if SND_SOC_SOF_HDA_COMMON
 
 config SND_SOC_SOF_HDA_LINK
 	bool "SOF support for HDA Links(HDA/HDMI)"
-	depends on SND_SOC_SOF_NOCODEC=n
+	depends on SND_SOC_SOF_NOCODEC_SUPPORT=n
 	select SND_SOC_SOF_PROBE_WORK_QUEUE
 	help
 	  This adds support for HDA links(HDA/HDMI) with Sound Open Firmware
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 50a7e3f08285..8a5e99a898ec 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -72,6 +72,10 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable)
 	struct hda_codec *codec;
 	unsigned int mask = 0;
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	if (enable) {
 		list_for_each_codec(codec, hbus)
 			if (codec->jacktbl.used)
@@ -88,6 +92,10 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
 	struct hda_bus *hbus = sof_to_hbus(sdev);
 	struct hda_codec *codec;
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	list_for_each_codec(codec, hbus)
 		/*
 		 * Wake up all jack-detecting codecs regardless whether an event
@@ -201,6 +209,10 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int i, ret;
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	/* probe codecs in avail slots */
 	for (i = 0; i < HDA_MAX_CODECS; i++) {
 
@@ -234,6 +246,10 @@ void hda_codec_detect_mask(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	/* Accept unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
 
@@ -255,6 +271,10 @@ void hda_codec_init_cmd_io(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	/* initialize the codec command I/O */
 	snd_hdac_bus_init_cmd_io(bus);
 }
@@ -264,6 +284,10 @@ void hda_codec_resume_cmd_io(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	/* set up CORB/RIRB buffers if was on before suspend */
 	if (bus->cmd_dma_state)
 		snd_hdac_bus_init_cmd_io(bus);
@@ -274,6 +298,10 @@ void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	/* initialize the codec command I/O */
 	snd_hdac_bus_stop_cmd_io(bus);
 }
@@ -283,6 +311,10 @@ void hda_codec_suspend_cmd_io(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	/* stop the CORB/RIRB DMA if it is On */
 	if (bus->cmd_dma_state)
 		snd_hdac_bus_stop_cmd_io(bus);
@@ -294,6 +326,10 @@ void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	/* clear rirb status */
 	snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
 }
@@ -303,6 +339,9 @@ void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	snd_hdac_set_codec_wakeup(bus, status);
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_set_codec_wakeup, SND_SOC_SOF_HDA_AUDIO_CODEC);
@@ -313,6 +352,10 @@ bool hda_codec_check_rirb_status(struct snd_sof_dev *sdev)
 	bool active = false;
 	u32 rirb_status;
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return false;
+
 	rirb_status = snd_hdac_chip_readb(bus, RIRBSTS);
 	if (rirb_status & RIRB_INT_MASK) {
 		/*
@@ -334,6 +377,10 @@ void hda_codec_device_remove(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	/* codec removal, invoke bus_device_remove */
 	snd_hdac_ext_bus_device_remove(bus);
 }
@@ -347,6 +394,10 @@ void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return;
+
 	if (HDA_IDISP_CODEC(bus->codec_mask)) {
 		dev_dbg(bus->dev, "Turning i915 HDAC power %d\n", enable);
 		snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, enable);
@@ -359,6 +410,10 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int ret;
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return 0;
+
 	/* i915 exposes a HDA codec for HDMI audio */
 	ret = snd_hdac_i915_init(bus);
 	if (ret < 0)
@@ -375,6 +430,10 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		return 0;
+
 	if (!bus->audio_component)
 		return 0;
 
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 62092e2d609c..7306a2649857 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -826,6 +826,10 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)) {
 		const struct snd_sof_of_mach *of_mach;
 
+		if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+		    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+			goto nocodec;
+
 		/* find machine */
 		mach = snd_sof_machine_select(sdev);
 		if (mach) {
@@ -848,6 +852,7 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 		dev_warn(sdev->dev, "Force to use nocodec mode\n");
 	}
 
+nocodec:
 	/* select nocodec mode */
 	dev_warn(sdev->dev, "Using nocodec machine driver\n");
 	mach = devm_kzalloc(sdev->dev, sizeof(*mach), GFP_KERNEL);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d3ede97b6759..876e6fdbef4f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -43,6 +43,9 @@
 #define SOF_DBG_PRINT_IPC_SUCCESS_LOGS		BIT(9) /* print IPC success
 							* in dmesg logs
 							*/
+#define SOF_DBG_FORCE_NOCODEC			BIT(10) /* ignore all codec-related
+							 * configurations
+							 */
 
 /* Flag definitions used for controlling the DSP dump behavior */
 #define SOF_DBG_DUMP_REGS		BIT(0)
-- 
2.34.1

