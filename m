Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9F957B6E8
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 14:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D3281798;
	Wed, 20 Jul 2022 14:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D3281798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658321920;
	bh=v5CDcg0oO+aGe8zOArE5z1UOEBlU2d1PJ/+dooqj6Aw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h567WTsYh+z4P4c4RKITG6oRA/tesMFb54Lw9XjSuDdu05pA3sDs+BwBNKjhG6Kdo
	 Uv9aTtvYpa3YcI3cLDpdH1fBXCou8FWjj8g3TRQr1+LkBo4P/cWjWlMNfmwqojOLi5
	 B1PjwyFfiY4N2BGW3jz+Xomd43XnsqqchBH+SW8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E79CFF804FA;
	Wed, 20 Jul 2022 14:57:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 441E2F8028B; Wed, 20 Jul 2022 14:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4587AF80139
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 14:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4587AF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cpxGORwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658321825; x=1689857825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v5CDcg0oO+aGe8zOArE5z1UOEBlU2d1PJ/+dooqj6Aw=;
 b=cpxGORwgIo+os6cVkbPe9TGg67/egyn3v2mlG1FIMMqMEFodQgPio7p2
 lAuEvA4oQkEunBjmbl4U0g/F1uq+2m+GJpy7PxHeeWR2WMMimPeA7l5dp
 LSYp5eSzIIjN99jHucujFNhHNJ75YMtlstgkJs7QTkUWNqQ4a87LHWDSV
 xDsYofGlpPr/R37ieqA3Ngv7wMlB6yVigryPC32pWF5Gmif6N4UNA1iq6
 qWre/WzlUg4lPve5Lct3585DIimodG35pjkQm7StpDk32Lg3WuMDjG3xx
 oo64pqIvXq744GgZvC/V7ivKLGOplqn+tVIFSCWLhI1XoJ4cWlQPjMklZ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="269797815"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="269797815"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 05:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="656259013"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2022 05:56:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH 1/4] ASoC: hdac_hda: Disconnect struct hdac_hda_priv and
 hda_codec
Date: Wed, 20 Jul 2022 15:06:19 +0200
Message-Id: <20220720130622.146973-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720130622.146973-1-cezary.rojewski@intel.com>
References: <20220720130622.146973-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 peter.ujfalusi@linux.intel.com
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

Preliminary step in making snd_hda_codec_device_init() the only
constructor for struct hda_codec instances. To do that, no struct may
wrap struct hda_codec as its base type.

To drop hdac_to_hda_priv(), hdac_hda_dev_probe() now skips
dev_set_drvdata(). Driver private data will be assigned by owning bus
drivers instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_codec.h                    |  2 --
 sound/soc/codecs/hdac_hda.c                  | 26 ++++++++------------
 sound/soc/codecs/hdac_hda.h                  |  2 +-
 sound/soc/intel/boards/hda_dsp_common.c      |  2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  2 +-
 sound/soc/intel/skylake/skl.c                |  6 ++---
 sound/soc/sof/intel/hda-codec.c              |  6 ++---
 7 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 6d3c82c4b6ac..2a8fe7240f10 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -293,8 +293,6 @@ struct hda_codec {
 #define dev_to_hda_codec(_dev)	container_of(_dev, struct hda_codec, core.dev)
 #define hda_codec_dev(_dev)	(&(_dev)->core.dev)
 
-#define hdac_to_hda_priv(_hdac) \
-			container_of(_hdac, struct hdac_hda_priv, codec.core)
 #define hdac_to_hda_codec(_hdac) container_of(_hdac, struct hda_codec, core)
 
 #define list_for_each_codec(c, bus) \
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
index aeca58246fc7..7e573a887118 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -718,8 +718,8 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	if (!hda_codec)
 		return -ENOMEM;
 
-	hda_codec->codec.bus = skl_to_hbus(skl);
-	hdev = &hda_codec->codec.core;
+	hda_codec->codec->bus = skl_to_hbus(skl);
+	hdev = &hda_codec->codec->core;
 
 	err = snd_hdac_ext_bus_device_init(bus, addr, hdev, HDA_DEV_ASOC);
 	if (err < 0)
@@ -728,7 +728,7 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	/* use legacy bus only for HDA codecs, idisp uses ext bus */
 	if ((res & 0xFFFF0000) != IDISP_INTEL_VENDOR_ID) {
 		hdev->type = HDA_DEV_LEGACY;
-		load_codec_module(&hda_codec->codec);
+		load_codec_module(hda_codec->codec);
 	}
 	return 0;
 #else
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 2f3f4a733d9e..de7c53224ac3 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -142,9 +142,9 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	if (!hda_priv)
 		return -ENOMEM;
 
-	hda_priv->codec.bus = hbus;
-	hdev = &hda_priv->codec.core;
-	codec = &hda_priv->codec;
+	hda_priv->codec->bus = hbus;
+	hdev = &hda_priv->codec->core;
+	codec = hda_priv->codec;
 
 	/* only probe ASoC codec drivers for HDAC-HDMI */
 	if (!hda_codec_use_common_hdmi && (resp & 0xFFFF0000) == IDISP_VID_INTEL)
-- 
2.25.1

