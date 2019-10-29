Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9366EE8E4E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 18:39:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 140A22290;
	Tue, 29 Oct 2019 18:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 140A22290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572370772;
	bh=WrbCeWx+vtlk8DcVVBCWYQsmAQP3xZSSq1GQLuhAhZQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UksfYpZv7ZvLTKlwRnYxYoBIdDqB/wy8k2TNaNd2mwZ+KPw5IVouJg5za+HfJVNDE
	 gpyBde9vpDc71Lya92zXFnFi55gVrnYmA+b0go14ONde9BNB6tYi7RXQCmP9xvm6xy
	 hjlKEhvs5xs8qn83ss7in4RG4MzVUKbvFulfU2+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E1DF80638;
	Tue, 29 Oct 2019 18:34:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75F3BF805FB; Tue, 29 Oct 2019 18:34:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0CA0F803D7
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 18:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0CA0F803D7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CX0z/Tk+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Cv973n/sBG6rGgWLKSdG7DeUM8cne/DY2Ru6rgPvu14=; b=CX0z/Tk+I/uG
 2KzY6eIyEfJoXhJiUppaL520l4N4ICYrGPdIACK/wsSeBF6o+nZq9edJGH2gS7WzNIUQy+wS+tAPg
 MU8FkPEp5UAF+mBPhZhaTFaF6q85llQVYJQ7fcLH1pzPwLD5Mp3l/nRryd4+5CsdNJcJFjPUjsXZq
 UdLWw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPVNt-0002kg-CR; Tue, 29 Oct 2019 17:34:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C862F2742990; Tue, 29 Oct 2019 17:34:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191029134017.18901-3-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191029173420.C862F2742990@ypsilon.sirena.org.uk>
Date: Tue, 29 Oct 2019 17:34:20 +0000 (GMT)
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, julia.lawall@lip6.fr,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: hdac_hda: add support for HDMI/DP as a
	HDA codec" to the asoc tree
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

The patch

   ASoC: hdac_hda: add support for HDMI/DP as a HDA codec

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 608b8c36c37114289e3ea328783161f542fdf71d Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 29 Oct 2019 15:40:10 +0200
Subject: [PATCH] ASoC: hdac_hda: add support for HDMI/DP as a HDA codec

Handle all HDA codecs using same logic, including HDMI/DP.

Call to snd_hda_codec_build_controls() is delayed for HDMI/DP HDA
devices. This is needed to discover the PCM device numbers as
defined in topology.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191029134017.18901-3-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdac_hda.c | 114 ++++++++++++++++++++++++++++++++----
 sound/soc/codecs/hdac_hda.h |  13 +++-
 2 files changed, 114 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 91242b6f8ea7..298761a26180 100644
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
+		snd_hdac_display_power(hdev->bus,
+				       HDA_CODEC_IDX_CONTROLLER, true);
+
 	ret = snd_hda_codec_device_new(hcodec->bus, component->card->snd_card,
 				       hdev->addr, hcodec);
 	if (ret < 0) {
@@ -366,20 +445,31 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
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
 
+	if (hda_pvt->need_display_power)
+		snd_hdac_display_power(hdev->bus,
+				       HDA_CODEC_IDX_CONTROLLER, false);
+
 	/*
 	 * hdac_device core already sets the state to active and calls
 	 * get_noresume. So enable runtime and set the device to suspend.
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
