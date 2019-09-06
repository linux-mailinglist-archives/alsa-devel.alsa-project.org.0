Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A21ABAE9
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 16:32:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4C001669;
	Fri,  6 Sep 2019 16:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4C001669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567780377;
	bh=0PyxxsBMwa6RQ6RFuPVqsSul7ndX90ANXHin8+m5dLk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cE1Xuc89j+0k0VnswuiY+p9k2QmzczSCxooXIrql8tiKWXKyxcJ4gZL/TZ40h3Ref
	 M3mM04tFrl2PM8U1KtKlAUqTQ0MSzoqZ3smhMyfORP8Di3mDzDTuHViWA4QKczLH8h
	 Nc8N2fJGNevilExc6S6cdvNjMB+P4W/pUUWxmdUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66AD5F8060D;
	Fri,  6 Sep 2019 16:29:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50890F805FA; Fri,  6 Sep 2019 16:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38BA8F803D6
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 16:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38BA8F803D6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 07:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; d="scan'208";a="384228425"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2019 07:29:30 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri,  6 Sep 2019 17:29:05 +0300
Message-Id: <20190906142909.770-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906142909.770-1-kai.vehmanen@linux.intel.com>
References: <20190906142909.770-1-kai.vehmanen@linux.intel.com>
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [RFC PATCH v2 2/6] ASoC: Intel: skl-hda-dsp-generic:
	use snd-hda-codec-hdmi
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

Add support for using snd-hda-codec-hdmi driver for HDMI/DP
instead of ASoC hdac-hdmi. This is aligned with how other
HDA codecs are already handled.

When snd-hda-codec-hdmi is used, the PCM device numbers are
parsed from card topology and passed to the codec driver.
This needs to be done at runtime as topology changes may
affect PCM device allocation.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 26 +++++++-
 sound/soc/intel/boards/skl_hda_dsp_common.h  | 69 ++++++++++++++++++++
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  7 --
 3 files changed, 94 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 55fd82e05e2c..23784178015b 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -14,6 +14,9 @@
 #include "../../codecs/hdac_hdmi.h"
 #include "skl_hda_dsp_common.h"
 
+#include <sound/hda_codec.h>
+#include "../../codecs/hdac_hda.h"
+
 #define NAME_SIZE	32
 
 int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
@@ -133,17 +136,38 @@ int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
 	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component = NULL;
 	struct skl_hda_hdmi_pcm *pcm;
+	const char *modname;
+	int use_common_codec = 0;
 	char jack_name[NAME_SIZE];
 	int err;
 
+	/*
+	 * Detect whether this machine driver is used with SOF and
+	 * alter behaviour based on which HDMI codec driver has
+	 * been selected.
+	 */
+	if (!strncmp(card->name, "sof-skl_hda_card", 16)) {
+		for_each_card_components(card, component) {
+			modname = module_name(component->dev->driver->owner);
+			if (!strncmp(component->name, "ehdaudio0D2", 11) &&
+			    !strncmp(modname, "snd_hda_codec_hdmi", 18))
+				use_common_codec = 1;
+		}
+	}
+
+	if (use_common_codec)
+		return skl_hda_hdmi_build_controls(card);
+
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
+		if (!pcm)
+			continue;
+
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
 			 "HDMI/DP, pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					    SND_JACK_AVOUT, &pcm->hdmi_jack,
 					    NULL, 0);
-
 		if (err)
 			return err;
 
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index daa582e513b2..5438631be565 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -14,6 +14,8 @@
 #include <linux/platform_device.h>
 #include <sound/core.h>
 #include <sound/jack.h>
+#include <sound/hda_codec.h>
+#include "../../codecs/hdac_hda.h"
 
 #define HDA_DSP_MAX_BE_DAI_LINKS 7
 
@@ -35,4 +37,71 @@ extern struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS];
 int skl_hda_hdmi_jack_init(struct snd_soc_card *card);
 int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device);
 
+/*
+ * Search card topology and return PCM device number
+ * matching Nth HDMI device (zero-based index).
+ */
+static inline struct snd_pcm *skl_hda_hdmi_pcm_handle(struct snd_soc_card *card,
+						      int hdmi_idx)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	int i = 0;
+	struct snd_pcm *spcm;
+
+	for_each_card_rtds(card, rtd) {
+		spcm = rtd->pcm ?
+			rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].pcm : 0;
+		if (spcm && strstr(spcm->id, "HDMI")) {
+			if (i == hdmi_idx)
+				return rtd->pcm;
+			++i;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Search card topology and register HDMI PCM related controls
+ * to codec driver.
+ */
+static inline int skl_hda_hdmi_build_controls(struct snd_soc_card *card)
+{
+	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component;
+	struct hdac_hda_priv *hda_pvt;
+	struct skl_hda_hdmi_pcm *pcm;
+	struct hda_codec *hcodec;
+	struct snd_pcm *spcm;
+	struct hda_pcm *hpcm;
+	int err = 0, i = 0;
+
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct skl_hda_hdmi_pcm,
+			       head);
+	component = pcm->codec_dai->component;
+	if (!component)
+		return -EINVAL;
+
+	hda_pvt = snd_soc_component_get_drvdata(component);
+	hcodec = &hda_pvt->codec;
+
+	list_for_each_entry(hpcm, &hcodec->pcm_list_head, list) {
+		spcm = skl_hda_hdmi_pcm_handle(card, i);
+		if (spcm) {
+			hpcm->pcm = spcm;
+			hpcm->device = spcm->device;
+			dev_dbg(card->dev,
+				"%s: mapping HDMI converter %d to PCM %d (%p)\n",
+				__func__, i, hpcm->device, spcm);
+		}
+		i++;
+	}
+
+	err = snd_hda_codec_build_controls(hcodec);
+	if (err < 0)
+		dev_err(card->dev, "unable to create controls %d\n", err);
+
+	return err;
+}
+
 #endif /* __SOUND_SOC_HDA_DSP_COMMON_H */
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 9ed68eb4f058..9b6f8cc87f99 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -26,13 +26,6 @@ static const struct snd_soc_dapm_widget skl_hda_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route skl_hda_map[] = {
-	{ "hifi3", NULL, "iDisp3 Tx"},
-	{ "iDisp3 Tx", NULL, "iDisp3_out"},
-	{ "hifi2", NULL, "iDisp2 Tx"},
-	{ "iDisp2 Tx", NULL, "iDisp2_out"},
-	{ "hifi1", NULL, "iDisp1 Tx"},
-	{ "iDisp1 Tx", NULL, "iDisp1_out"},
-
 	{ "Analog Out", NULL, "Codec Output Pin1" },
 	{ "Digital Out", NULL, "Codec Output Pin2" },
 	{ "Alt Analog Out", NULL, "Codec Output Pin3" },
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
