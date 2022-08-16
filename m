Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 564B2595981
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 13:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0332F1657;
	Tue, 16 Aug 2022 13:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0332F1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660648198;
	bh=RBDOGV0sl9mYzG5wbF8IUssb6KuD6ZLHc026APAznRo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e/aHySl+hEwX1Aj3CiNnGyD2E/gKH0YnI3XZILDRLdskpgukO56BdlGKoLMRZo5Fr
	 u+rkN4BkdiTboRuJ+GpUpx23nhRyBpnYty9d4klDcVTJVmIyjhB3O9n0/L7Ny01ARN
	 q0+tHeTXN/xHg4rDMV7D1EXpA2O6KNQxTDxFWVQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52569F80082;
	Tue, 16 Aug 2022 13:07:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FA35F80566; Tue, 16 Aug 2022 13:07:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6658F804BB
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 13:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6658F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Fwmj/bed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660648062; x=1692184062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RBDOGV0sl9mYzG5wbF8IUssb6KuD6ZLHc026APAznRo=;
 b=Fwmj/bedrcF3Mi0U06cU6osZLDYe46soYwn6qCwWqhBgJfojyf1EcP1h
 FHLFQ3aK/wcI9rKqOVLSFOxE06QGvy/sMnKR/QAi52C22YnWg2AqhJhcH
 yqryPhRXpBtyROkGiE5zRWwHup6eBKMZ7bcJwwEo+DP4Nv4+ciYfytrZ9
 Vj85s7E6i+yJTrVXu283wacwtt3+8fhgzqD2P7FSdE87gkIJ4WtU/Z65/
 NquEpwDurecamvoy0guXwUG7HxtFSFED44QKhPmjxyPz8W4eHWivlGsEo
 agXlNgvQGoYWgJgxVxZWNW1tsVcSoEkPBD5PFsnld3HuR2e9YLUXX7Hn+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="271960459"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="271960459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 04:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="782986179"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2022 04:07:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [RESEND PATCH v2 3/6] ASoC: Intel: Drop hdac_ext usage for codec
 device creation
Date: Tue, 16 Aug 2022 13:17:24 +0200
Message-Id: <20220816111727.3218543-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816111727.3218543-1-cezary.rojewski@intel.com>
References: <20220816111727.3218543-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

To make snd_hda_codec_device_init() the only constructor for struct
hda_codec instances remaining tasks are:

1) no struct may wrap struct hda_codec as its base type
2) bus drivers (skylake and sof) which are the current hdac_ext users
   need to be adjusted to make use of newly added codec init and exit
   routines instead
3) as bus drivers (skylake and sof) are to be responsible for creating
   codec device and assigning it to hdac_hda_priv->codec,
   hdac_hda_dev_probe() has to be freed of that job

To keep git bisect happy, all of these in made in one-go.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdac_hda.c                  | 26 +++++++-----------
 sound/soc/codecs/hdac_hda.h                  |  2 +-
 sound/soc/intel/boards/hda_dsp_common.c      |  2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  2 +-
 sound/soc/intel/skylake/skl.c                | 26 ++++++++----------
 sound/soc/sof/intel/hda-codec.c              | 29 ++++++++------------
 6 files changed, 36 insertions(+), 51 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 8debcee59224..77df4c5b274a 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -246,7 +246,7 @@ static int hdac_hda_dai_hw_free(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	hda_stream = &pcm->stream[substream->stream];
-	snd_hda_codec_cleanup(&hda_pvt->codec, hda_stream, substream);
+	snd_hda_codec_cleanup(hda_pvt->codec, hda_stream, substream);
 
 	return 0;
 }
@@ -264,7 +264,7 @@ static int hdac_hda_dai_prepare(struct snd_pcm_substream *substream,
 	int ret = 0;
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
-	hdev = &hda_pvt->codec.core;
+	hdev = &hda_pvt->codec->core;
 	pcm = snd_soc_find_pcm_from_dai(hda_pvt, dai);
 	if (!pcm)
 		return -EINVAL;
@@ -274,7 +274,7 @@ static int hdac_hda_dai_prepare(struct snd_pcm_substream *substream,
 	stream = hda_pvt->pcm[dai->id].stream_tag[substream->stream];
 	format_val = hda_pvt->pcm[dai->id].format_val[substream->stream];
 
-	ret = snd_hda_codec_prepare(&hda_pvt->codec, hda_stream,
+	ret = snd_hda_codec_prepare(hda_pvt->codec, hda_stream,
 				    stream, format_val, substream);
 	if (ret < 0)
 		dev_err(&hdev->dev, "codec prepare failed %d\n", ret);
@@ -299,7 +299,7 @@ static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
 
 	hda_stream = &pcm->stream[substream->stream];
 
-	return hda_stream->ops.open(hda_stream, &hda_pvt->codec, substream);
+	return hda_stream->ops.open(hda_stream, hda_pvt->codec, substream);
 }
 
 static void hdac_hda_dai_close(struct snd_pcm_substream *substream,
@@ -317,7 +317,7 @@ static void hdac_hda_dai_close(struct snd_pcm_substream *substream,
 
 	hda_stream = &pcm->stream[substream->stream];
 
-	hda_stream->ops.close(hda_stream, &hda_pvt->codec, substream);
+	hda_stream->ops.close(hda_stream, hda_pvt->codec, substream);
 
 	snd_hda_codec_pcm_put(pcm);
 }
@@ -325,7 +325,7 @@ static void hdac_hda_dai_close(struct snd_pcm_substream *substream,
 static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 						 struct snd_soc_dai *dai)
 {
-	struct hda_codec *hcodec = &hda_pvt->codec;
+	struct hda_codec *hcodec = hda_pvt->codec;
 	struct hda_pcm *cpcm;
 	const char *pcm_name;
 
@@ -394,8 +394,8 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 			snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm =
 			snd_soc_component_get_dapm(component);
-	struct hdac_device *hdev = &hda_pvt->codec.core;
-	struct hda_codec *hcodec = &hda_pvt->codec;
+	struct hdac_device *hdev = &hda_pvt->codec->core;
+	struct hda_codec *hcodec = hda_pvt->codec;
 	struct hdac_ext_link *hlink;
 	hda_codec_patch_t patch;
 	int ret;
@@ -515,8 +515,8 @@ static void hdac_hda_codec_remove(struct snd_soc_component *component)
 {
 	struct hdac_hda_priv *hda_pvt =
 		      snd_soc_component_get_drvdata(component);
-	struct hdac_device *hdev = &hda_pvt->codec.core;
-	struct hda_codec *codec = &hda_pvt->codec;
+	struct hdac_device *hdev = &hda_pvt->codec->core;
+	struct hda_codec *codec = hda_pvt->codec;
 	struct hdac_ext_link *hlink = NULL;
 
 	hlink = snd_hdac_ext_bus_get_link(hdev->bus, dev_name(&hdev->dev));
@@ -584,7 +584,6 @@ static const struct snd_soc_component_driver hdac_hda_codec = {
 static int hdac_hda_dev_probe(struct hdac_device *hdev)
 {
 	struct hdac_ext_link *hlink;
-	struct hdac_hda_priv *hda_pvt;
 	int ret;
 
 	/* hold the ref while we probe */
@@ -595,10 +594,6 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 	}
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
 
-	hda_pvt = hdac_to_hda_priv(hdev);
-	if (!hda_pvt)
-		return -ENOMEM;
-
 	/* ASoC specific initialization */
 	ret = devm_snd_soc_register_component(&hdev->dev,
 					 &hdac_hda_codec, hdac_hda_dais,
@@ -608,7 +603,6 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 		return ret;
 	}
 
-	dev_set_drvdata(&hdev->dev, hda_pvt);
 	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
 
 	return ret;
diff --git a/sound/soc/codecs/hdac_hda.h b/sound/soc/codecs/hdac_hda.h
index d0efc5e254ae..fc19c34ca00e 100644
--- a/sound/soc/codecs/hdac_hda.h
+++ b/sound/soc/codecs/hdac_hda.h
@@ -23,7 +23,7 @@ struct hdac_hda_pcm {
 };
 
 struct hdac_hda_priv {
-	struct hda_codec codec;
+	struct hda_codec *codec;
 	struct hdac_hda_pcm pcm[HDAC_LAST_DAI_ID];
 	bool need_display_power;
 };
diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index 83c7dfbccd9d..04b7d4f7f9e2 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -54,7 +54,7 @@ int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
 		return -EINVAL;
 
 	hda_pvt = snd_soc_component_get_drvdata(comp);
-	hcodec = &hda_pvt->codec;
+	hcodec = hda_pvt->codec;
 
 	list_for_each_entry(hpcm, &hcodec->pcm_list_head, list) {
 		spcm = hda_dsp_hdmi_pcm_handle(card, i);
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 81144efb4b44..879ebba52832 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -190,7 +190,7 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 			 * all codecs are on the same bus, so it's sufficient
 			 * to look up only the first one
 			 */
-			snd_hda_set_power_save(hda_pvt->codec.bus,
+			snd_hda_set_power_save(hda_pvt->codec->bus,
 					       HDA_CODEC_AUTOSUSPEND_DELAY_MS);
 			break;
 		}
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 33b0ed6b0534..c7c1cad2a753 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -694,7 +694,7 @@ static void skl_codec_device_exit(struct device *dev)
 	snd_hdac_device_exit(dev_to_hdac_dev(dev));
 }
 
-static __maybe_unused struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
+static struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
 {
 	struct hda_codec *codec;
 	int ret;
@@ -729,9 +729,8 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	struct skl_dev *skl = bus_to_skl(bus);
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
 	struct hdac_hda_priv *hda_codec;
-	int err;
 #endif
-	struct hdac_device *hdev;
+	struct hda_codec *codec;
 
 	mutex_lock(&bus->cmd_mutex);
 	snd_hdac_bus_send_cmd(bus, cmd);
@@ -747,25 +746,22 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	if (!hda_codec)
 		return -ENOMEM;
 
-	hda_codec->codec.bus = skl_to_hbus(skl);
-	hdev = &hda_codec->codec.core;
+	codec = skl_codec_device_init(bus, addr);
+	if (IS_ERR(codec))
+		return PTR_ERR(codec);
 
-	err = snd_hdac_ext_bus_device_init(bus, addr, hdev, HDA_DEV_ASOC);
-	if (err < 0)
-		return err;
+	hda_codec->codec = codec;
+	dev_set_drvdata(&codec->core.dev, hda_codec);
 
 	/* use legacy bus only for HDA codecs, idisp uses ext bus */
 	if ((res & 0xFFFF0000) != IDISP_INTEL_VENDOR_ID) {
-		hdev->type = HDA_DEV_LEGACY;
-		load_codec_module(&hda_codec->codec);
+		codec->core.type = HDA_DEV_LEGACY;
+		load_codec_module(hda_codec->codec);
 	}
 	return 0;
 #else
-	hdev = devm_kzalloc(&skl->pci->dev, sizeof(*hdev), GFP_KERNEL);
-	if (!hdev)
-		return -ENOMEM;
-
-	return snd_hdac_ext_bus_device_init(bus, addr, hdev, HDA_DEV_ASOC);
+	codec = skl_codec_device_init(bus, addr);
+	return PTR_ERR_OR_ZERO(codec);
 #endif /* CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC */
 }
 
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 4c128ba02340..73336648cd25 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -114,8 +114,7 @@ static void hda_codec_device_exit(struct device *dev)
 	snd_hdac_device_exit(dev_to_hdac_dev(dev));
 }
 
-static __maybe_unused struct hda_codec *
-hda_codec_device_init(struct hdac_bus *bus, int addr, int type)
+static struct hda_codec *hda_codec_device_init(struct hdac_bus *bus, int addr, int type)
 {
 	struct hda_codec *codec;
 	int ret;
@@ -145,11 +144,10 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
-	struct hda_codec *codec;
 	int type = HDA_DEV_LEGACY;
 #endif
 	struct hda_bus *hbus = sof_to_hbus(sdev);
-	struct hdac_device *hdev;
+	struct hda_codec *codec;
 	u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
 		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
 	u32 resp = -1;
@@ -172,20 +170,20 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	if (!hda_priv)
 		return -ENOMEM;
 
-	hda_priv->codec.bus = hbus;
-	hdev = &hda_priv->codec.core;
-	codec = &hda_priv->codec;
-
 	/* only probe ASoC codec drivers for HDAC-HDMI */
 	if (!hda_codec_use_common_hdmi && (resp & 0xFFFF0000) == IDISP_VID_INTEL)
 		type = HDA_DEV_ASOC;
 
-	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev, type);
+	codec = hda_codec_device_init(&hbus->core, address, type);
+	ret = PTR_ERR_OR_ZERO(codec);
 	if (ret < 0)
 		return ret;
 
+	hda_priv->codec = codec;
+	dev_set_drvdata(&codec->core.dev, hda_priv);
+
 	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL) {
-		if (!hdev->bus->audio_component) {
+		if (!hbus->core.audio_component) {
 			dev_dbg(sdev->dev,
 				"iDisp hw present but no driver\n");
 			ret = -ENOENT;
@@ -211,15 +209,12 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 
 out:
 	if (ret < 0) {
-		snd_hdac_device_unregister(hdev);
-		put_device(&hdev->dev);
+		snd_hdac_device_unregister(&codec->core);
+		put_device(&codec->core.dev);
 	}
 #else
-	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
-	if (!hdev)
-		return -ENOMEM;
-
-	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev, HDA_DEV_ASOC);
+	codec = hda_codec_device_init(&hbus->core, address);
+	ret = PTR_ERR_OR_ZERO(codec);
 #endif
 
 	return ret;
-- 
2.25.1

