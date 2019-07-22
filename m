Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B07023C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FC581680;
	Mon, 22 Jul 2019 16:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FC581680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805438;
	bh=ffv9kQ5T4A8HIE9bpv2e3MF3k2f51m3bzeUSXEGv68Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U3exZTAdNuqRagU7tbcuJm19JaD9OKZYLUXfxrzpdBQeQb1fq8bi3D20Vf9BD+grO
	 w5bEvPIxQhosBahEvSToq4YxsUVt2tqdN7Od23V3vF819nkASkwgUBqyTEGOZXEE/j
	 JyPgQcK6Di9uxR4gZt/D+pQp3QUDDcXGLz4Hl9tM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F249FF80633;
	Mon, 22 Jul 2019 16:14:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5D0F80535; Mon, 22 Jul 2019 16:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B78A0F804A9
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B78A0F804A9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733289"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:53 -0500
Message-Id: <20190722141402.7194-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 12/21] ASoC: SOF: Intel: hda: Enable jack
	detection
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

From: Rander Wang <rander.wang@linux.intel.com>

In commit 7d4f606c50ff ("ALSA: hda - WAKEEN feature enabling for
runtime pm"), legacy HD-A driver sets hda controller in reset mode after
entering runtime-suspend. And when resuming from suspend mode, it checks
hda controller & codec status to detect headphone hotplug event. Now
this patch does the same job in SOF runtime pm functions.

And we need to check all the non-hdmi codecs for some cases like playback
with HDMI or capture with DMIC connected to dsp. In these cases, only
controller is active and codecs are suspended, so codecs can't send
unsolicited event to controller. The jack polling operation will activate
codecs and unsolicited event can work even codecs become suspended later.

Tested on whiskylake with hda codecs.

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 44 +++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-dsp.c   | 21 ++++++++--------
 sound/soc/sof/intel/hda.h       |  2 ++
 3 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index b8b37f082309..74d75156135b 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -10,6 +10,7 @@
 
 #include <linux/module.h>
 #include <sound/hdaudio_ext.h>
+#include <sound/hda_register.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_i915.h>
 #include <sound/sof.h>
@@ -37,16 +38,55 @@ static void hda_codec_load_module(struct hda_codec *codec)
 static void hda_codec_load_module(struct hda_codec *codec) {}
 #endif
 
+/* enable controller wake up event for all codecs with jack connectors */
+void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev)
+{
+	struct hda_bus *hbus = sof_to_hbus(sdev);
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct hda_codec *codec;
+	unsigned int mask = 0;
+
+	list_for_each_codec(codec, hbus)
+		if (codec->jacktbl.used)
+			mask |= BIT(codec->core.addr);
+
+	snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, mask);
+}
+
+/* check jack status after resuming from suspend mode */
+void hda_codec_jack_check(struct snd_sof_dev *sdev)
+{
+	struct hda_bus *hbus = sof_to_hbus(sdev);
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct hda_codec *codec;
+
+	/* disable controller Wake Up event*/
+	snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, 0);
+
+	list_for_each_codec(codec, hbus)
+		/*
+		 * Wake up all jack-detecting codecs regardless whether an event
+		 * has been recorded in STATESTS
+		 */
+		if (codec->jacktbl.used)
+			schedule_delayed_work(&codec->jackpoll_work,
+					      codec->jackpoll_interval);
+}
+#else
+void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev) {}
+void hda_codec_jack_check(struct snd_sof_dev *sdev) {}
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
+EXPORT_SYMBOL(hda_codec_jack_wake_enable);
+EXPORT_SYMBOL(hda_codec_jack_check);
 
 /* probe individual codec */
 static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 {
-	struct hda_bus *hbus = sof_to_hbus(sdev);
-	struct hdac_device *hdev;
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
 #endif
+	struct hda_bus *hbus = sof_to_hbus(sdev);
+	struct hdac_device *hdev;
 	u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
 		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
 	u32 resp = -1;
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 3d711d354fb9..f9579edbca68 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -295,6 +295,9 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	hda_dsp_ipc_int_disable(sdev);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	if (runtime_suspend)
+		hda_codec_jack_wake_enable(sdev);
+
 	/* power down all hda link */
 	snd_hdac_ext_bus_link_power_down_all(bus);
 #endif
@@ -329,7 +332,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	return 0;
 }
 
-static int hda_resume(struct snd_sof_dev *sdev)
+static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	struct hdac_bus *bus = sof_to_bus(sdev);
@@ -343,7 +346,6 @@ static int hda_resume(struct snd_sof_dev *sdev)
 	 */
 	snd_sof_pci_update_bits(sdev, PCI_TCSEL, 0x07, 0);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* reset and start hda controller */
 	ret = hda_dsp_ctrl_init_chip(sdev, true);
 	if (ret < 0) {
@@ -352,13 +354,10 @@ static int hda_resume(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	hda_dsp_ctrl_misc_clock_gating(sdev, false);
-
-	/* Reset stream-to-link mapping */
-	list_for_each_entry(hlink, &bus->hlink_list, list)
-		bus->io_ops->reg_writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
-
-	hda_dsp_ctrl_misc_clock_gating(sdev, true);
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* check jack status */
+	if (runtime_resume)
+		hda_codec_jack_check(sdev);
 
 	/* turn off the links that were off before suspend */
 	list_for_each_entry(hlink, &bus->hlink_list, list) {
@@ -407,13 +406,13 @@ static int hda_resume(struct snd_sof_dev *sdev)
 int hda_dsp_resume(struct snd_sof_dev *sdev)
 {
 	/* init hda controller. DSP cores will be powered up during fw boot */
-	return hda_resume(sdev);
+	return hda_resume(sdev, false);
 }
 
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
 {
 	/* init hda controller. DSP cores will be powered up during fw boot */
-	return hda_resume(sdev);
+	return hda_resume(sdev, true);
 }
 
 int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 70909debfeb5..028e865d5e20 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -557,6 +557,8 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
  * HDA Codec operations.
  */
 int hda_codec_probe_bus(struct snd_sof_dev *sdev);
+void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev);
+void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
 #endif /* CONFIG_SND_SOC_SOF_HDA */
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
