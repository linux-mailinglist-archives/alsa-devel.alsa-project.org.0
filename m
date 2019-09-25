Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D66BDD1A
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 13:28:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FC0516F2;
	Wed, 25 Sep 2019 13:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FC0516F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569410928;
	bh=MrUlkGe8MYjXA68uPUmiJ2g1j1QenwKX4LLFKC5uhZw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fzTC+qgZyptm0dXBe3gNy4Hp9505gnDrcrchqEgse2XmItN7XOsrmt/gn+cGYYfWl
	 VjhQ45guawhsMYInj5apN3v3jP76F9iGikxBlmu0G+YBKgYEgG8x4m52GYS+yiV+28
	 U8LOqlHWUPnO5X1gfbOD9FGzCguG9m+cVXojkFH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A2AF80611;
	Wed, 25 Sep 2019 13:24:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CE5FF805FA; Wed, 25 Sep 2019 13:24:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C7F9F8049A
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 13:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C7F9F8049A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 04:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="218955871"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2019 04:24:17 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Wed, 25 Sep 2019 14:24:02 +0300
Message-Id: <20190925112409.1762-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925112409.1762-1-kai.vehmanen@linux.intel.com>
References: <20190925112409.1762-1-kai.vehmanen@linux.intel.com>
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v5 2/9] ASoC: hdac_hda: add support for HDMI/DP
	as a HDA codec
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

Handle all HDA codecs using same logic, including HDMI/DP.

Call to snd_hda_codec_build_controls() is delayed for HDMI/DP HDA
devices. This is needed to discover the PCM device numbers as
defined in topology.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 110 ++++++++++++++++++++++++++++++++----
 sound/soc/codecs/hdac_hda.h |  13 ++++-
 2 files changed, 110 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 91242b6f8ea7..4b79a02d31f0 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -14,13 +14,11 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/hdaudio_ext.h>
+#include <sound/hda_i915.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_register.h>
-#include "hdac_hda.h"
 
-#define HDAC_ANALOG_DAI_ID		0
-#define HDAC_DIGITAL_DAI_ID		1
-#define HDAC_ALT_ANALOG_DAI_ID		2
+#include "hdac_hda.h"
 
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S8 | \
 			SNDRV_PCM_FMTBIT_U8 | \
@@ -32,6 +30,11 @@
 			SNDRV_PCM_FMTBIT_U32_LE | \
 			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
+#define STUB_HDMI_RATES	(SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
+				 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
+				 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |\
+				 SNDRV_PCM_RATE_192000)
+
 static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai);
 static void hdac_hda_dai_close(struct snd_pcm_substream *substream,
@@ -121,7 +124,46 @@ static struct snd_soc_dai_driver hdac_hda_dais[] = {
 		.formats = STUB_FORMATS,
 		.sig_bits = 24,
 	},
-}
+},
+{
+	.id = HDAC_HDMI_0_DAI_ID,
+	.name = "intel-hdmi-hifi1",
+	.ops = &hdac_hda_dai_ops,
+	.playback = {
+		.stream_name    = "hifi1",
+		.channels_min   = 1,
+		.channels_max   = 32,
+		.rates          = STUB_HDMI_RATES,
+		.formats        = STUB_FORMATS,
+		.sig_bits = 24,
+	},
+},
+{
+	.id = HDAC_HDMI_1_DAI_ID,
+	.name = "intel-hdmi-hifi2",
+	.ops = &hdac_hda_dai_ops,
+	.playback = {
+		.stream_name    = "hifi2",
+		.channels_min   = 1,
+		.channels_max   = 32,
+		.rates          = STUB_HDMI_RATES,
+		.formats        = STUB_FORMATS,
+		.sig_bits = 24,
+	},
+},
+{
+	.id = HDAC_HDMI_2_DAI_ID,
+	.name = "intel-hdmi-hifi3",
+	.ops = &hdac_hda_dai_ops,
+	.playback = {
+		.stream_name    = "hifi3",
+		.channels_min   = 1,
+		.channels_max   = 32,
+		.rates          = STUB_HDMI_RATES,
+		.formats        = STUB_FORMATS,
+		.sig_bits = 24,
+	},
+},
 
 };
 
@@ -135,10 +177,11 @@ static int hdac_hda_dai_set_tdm_slot(struct snd_soc_dai *dai,
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
 	pcm = &hda_pvt->pcm[dai->id];
+
 	if (tx_mask)
-		pcm[dai->id].stream_tag[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
+		pcm->stream_tag[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
 	else
-		pcm[dai->id].stream_tag[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
+		pcm->stream_tag[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
 
 	return 0;
 }
@@ -278,6 +321,12 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 	struct hda_pcm *cpcm;
 	const char *pcm_name;
 
+	/*
+	 * map DAI ID to the closest matching PCM name, using the naming
+	 * scheme used by hda-codec snd_hda_gen_build_pcms() and for
+	 * HDMI in hda_codec patch_hdmi.c)
+	 */
+
 	switch (dai->id) {
 	case HDAC_ANALOG_DAI_ID:
 		pcm_name = "Analog";
@@ -288,13 +337,22 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 	case HDAC_ALT_ANALOG_DAI_ID:
 		pcm_name = "Alt Analog";
 		break;
+	case HDAC_HDMI_0_DAI_ID:
+		pcm_name = "HDMI 0";
+		break;
+	case HDAC_HDMI_1_DAI_ID:
+		pcm_name = "HDMI 1";
+		break;
+	case HDAC_HDMI_2_DAI_ID:
+		pcm_name = "HDMI 2";
+		break;
 	default:
 		dev_err(&hcodec->core.dev, "invalid dai id %d\n", dai->id);
 		return NULL;
 	}
 
 	list_for_each_entry(cpcm, &hcodec->pcm_list_head, list) {
-		if (strpbrk(cpcm->name, pcm_name))
+		if (strstr(cpcm->name, pcm_name))
 			return cpcm;
 	}
 
@@ -302,6 +360,18 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 	return NULL;
 }
 
+static bool is_hdmi_codec(struct hda_codec *hcodec)
+{
+	struct hda_pcm *cpcm;
+
+	list_for_each_entry(cpcm, &hcodec->pcm_list_head, list) {
+		if (cpcm->pcm_type == HDA_PCM_TYPE_HDMI)
+			return true;
+	}
+
+	return false;
+}
+
 static int hdac_hda_codec_probe(struct snd_soc_component *component)
 {
 	struct hdac_hda_priv *hda_pvt =
@@ -322,6 +392,15 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
 
+	/*
+	 * Ensure any HDA display is powered at codec probe.
+	 * After snd_hda_codec_device_new(), display power is
+	 * managed by runtime PM.
+	 */
+	if (hda_pvt->need_display_power)
+		snd_hdac_display_power(hdev->bus, HDA_CODEC_IDX_CONTROLLER,
+				       true);
+
 	ret = snd_hda_codec_device_new(hcodec->bus, component->card->snd_card,
 				       hdev->addr, hcodec);
 	if (ret < 0) {
@@ -366,16 +445,23 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 		dev_dbg(&hdev->dev, "no patch file found\n");
 	}
 
+	/* configure codec for 1:1 PCM:DAI mapping */
+	hcodec->mst_no_extra_pcms = 1;
+
 	ret = snd_hda_codec_parse_pcms(hcodec);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "unable to map pcms to dai %d\n", ret);
 		goto error;
 	}
 
-	ret = snd_hda_codec_build_controls(hcodec);
-	if (ret < 0) {
-		dev_err(&hdev->dev, "unable to create controls %d\n", ret);
-		goto error;
+	/* HDMI controls need to be created in machine drivers */
+	if (!is_hdmi_codec(hcodec)) {
+		ret = snd_hda_codec_build_controls(hcodec);
+		if (ret < 0) {
+			dev_err(&hdev->dev, "unable to create controls %d\n",
+				ret);
+			goto error;
+		}
 	}
 
 	hcodec->core.lazy_cache = true;
diff --git a/sound/soc/codecs/hdac_hda.h b/sound/soc/codecs/hdac_hda.h
index 6b1bd4f428e7..e145cec085b8 100644
--- a/sound/soc/codecs/hdac_hda.h
+++ b/sound/soc/codecs/hdac_hda.h
@@ -6,6 +6,16 @@
 #ifndef __HDAC_HDA_H__
 #define __HDAC_HDA_H__
 
+enum {
+	HDAC_ANALOG_DAI_ID = 0,
+	HDAC_DIGITAL_DAI_ID,
+	HDAC_ALT_ANALOG_DAI_ID,
+	HDAC_HDMI_0_DAI_ID,
+	HDAC_HDMI_1_DAI_ID,
+	HDAC_HDMI_2_DAI_ID,
+	HDAC_LAST_DAI_ID = HDAC_HDMI_2_DAI_ID,
+};
+
 struct hdac_hda_pcm {
 	int stream_tag[2];
 	unsigned int format_val[2];
@@ -13,7 +23,8 @@ struct hdac_hda_pcm {
 
 struct hdac_hda_priv {
 	struct hda_codec codec;
-	struct hdac_hda_pcm pcm[2];
+	struct hdac_hda_pcm pcm[HDAC_LAST_DAI_ID];
+	bool need_display_power;
 };
 
 #define hdac_to_hda_priv(_hdac) \
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
