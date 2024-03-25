Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576B88B3E4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D337D23DE;
	Mon, 25 Mar 2024 23:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D337D23DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711405275;
	bh=F5xeQ4td7SO4wmvJXZDw6F6IWvj10XXOp3w00j0UwLM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R2AraTu2jbIisFH3ZHW62eRLKkfeVaTPHFIq8bXwWOzjjM+QexpYtwrr6Cc4E3xzv
	 3aOLZqQXcLn8VBvLgNYClm8RX4acr2oOw3Dll5UkWJlflE6hYIkJJ9r8mYqtdnCWrG
	 dIZRCihaTeWTl841MmZ42bg1BdQuQt4dgZSV+HZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03397F805BB; Mon, 25 Mar 2024 23:19:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF35F805A8;
	Mon, 25 Mar 2024 23:19:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8478F80563; Mon, 25 Mar 2024 23:19:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6316EF8025F
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6316EF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OU3Pxwks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405178; x=1742941178;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F5xeQ4td7SO4wmvJXZDw6F6IWvj10XXOp3w00j0UwLM=;
  b=OU3Pxwks6paK6uTAkobX9MHFEaY8y7LcAEFqvyGLRFSZI9D3GFXyO+gI
   oL9nQ5fEbZvaF7aKCihPV1Zt6y0r/zP/NmD8UTCW+g+rKKvMIMr1lOeDb
   n4AJOK/McptfjY/2wRKF5IsEkVur5X7wol4PTAKjQNeKmWcyv7p3hjxEC
   J41Jo97LIhEEoqSX8RCKERgfZ7e92MPKehAb7kp+UMiTkl9iNZ7idtgvN
   5ufiScr3WYg3qJKE4vhWjM/sjDMafpoIuzwWWMh/UGZaqXa6HPRYI2dx1
   4mAFkRmr+gKKWM8drLlC62mygUbVXw4AVBIYVJtJUk4XYz5TgVihjKhn5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="23916830"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="23916830"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="46753039"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:19:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH] ASoC: hdac_hda: improve error logs
Date: Mon, 25 Mar 2024 17:19:25 -0500
Message-Id: <20240325221925.206507-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ETVIIEHQZLEK6PD5VUNMFGCYWH7GF4P3
X-Message-ID-Hash: ETVIIEHQZLEK6PD5VUNMFGCYWH7GF4P3
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETVIIEHQZLEK6PD5VUNMFGCYWH7GF4P3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We have a couple of duplicate logs and missing information, add
__func__ consistently and make sure useful error codes are logged.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 44 ++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 6aa3223985be..29c88de5508b 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -230,7 +230,8 @@ static int hdac_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	format_val = snd_hdac_stream_format(params_channels(params), bits, params_rate(params));
 	if (!format_val) {
 		dev_err(dai->dev,
-			"invalid format_val, rate=%d, ch=%d, format=%d, maxbps=%d\n",
+			"%s: invalid format_val, rate=%d, ch=%d, format=%d, maxbps=%d\n",
+			__func__,
 			params_rate(params), params_channels(params),
 			params_format(params), maxbps);
 
@@ -266,14 +267,12 @@ static int hdac_hda_dai_prepare(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct hda_pcm_stream *hda_stream;
 	struct hdac_hda_priv *hda_pvt;
-	struct hdac_device *hdev;
 	unsigned int format_val;
 	struct hda_pcm *pcm;
 	unsigned int stream;
 	int ret = 0;
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
-	hdev = &hda_pvt->codec->core;
 	pcm = snd_soc_find_pcm_from_dai(hda_pvt, dai);
 	if (!pcm)
 		return -EINVAL;
@@ -286,7 +285,7 @@ static int hdac_hda_dai_prepare(struct snd_pcm_substream *substream,
 	ret = snd_hda_codec_prepare(hda_pvt->codec, hda_stream,
 				    stream, format_val, substream);
 	if (ret < 0)
-		dev_err(&hdev->dev, "codec prepare failed %d\n", ret);
+		dev_err(dai->dev, "%s: failed %d\n", __func__, ret);
 
 	return ret;
 }
@@ -298,6 +297,7 @@ static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
 	struct hdac_hda_priv *hda_pvt;
 	struct hda_pcm_stream *hda_stream;
 	struct hda_pcm *pcm;
+	int ret;
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
 	pcm = snd_soc_find_pcm_from_dai(hda_pvt, dai);
@@ -308,7 +308,11 @@ static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
 
 	hda_stream = &pcm->stream[substream->stream];
 
-	return hda_stream->ops.open(hda_stream, hda_pvt->codec, substream);
+	ret = hda_stream->ops.open(hda_stream, hda_pvt->codec, substream);
+	if (ret < 0)
+		dev_err(dai->dev, "%s: failed %d\n", __func__, ret);
+
+	return ret;
 }
 
 static void hdac_hda_dai_close(struct snd_pcm_substream *substream,
@@ -367,7 +371,7 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 		pcm_name = "HDMI 3";
 		break;
 	default:
-		dev_err(&hcodec->core.dev, "invalid dai id %d\n", dai->id);
+		dev_err(dai->dev, "%s: invalid dai id %d\n", __func__, dai->id);
 		return NULL;
 	}
 
@@ -381,7 +385,7 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 		}
 	}
 
-	dev_err(&hcodec->core.dev, "didn't find PCM for DAI %s\n", dai->name);
+	dev_err(dai->dev, "%s: didn't find PCM for DAI %s\n", __func__, dai->name);
 	return NULL;
 }
 
@@ -411,7 +415,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
-		dev_err(&hdev->dev, "hdac link not found\n");
+		dev_err(&hdev->dev, "%s: hdac link not found\n", __func__);
 		return -EIO;
 	}
 
@@ -429,7 +433,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	ret = snd_hda_codec_device_new(hcodec->bus, component->card->snd_card,
 				       hdev->addr, hcodec, true);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "failed to create hda codec %d\n", ret);
+		dev_err(&hdev->dev, "%s: failed to create hda codec %d\n", __func__, ret);
 		goto error_no_pm;
 	}
 
@@ -446,7 +450,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 		if (fw) {
 			ret = snd_hda_load_patch(hcodec->bus, fw->size, fw->data);
 			if (ret < 0) {
-				dev_err(&hdev->dev, "failed to load hda patch %d\n", ret);
+				dev_err(&hdev->dev, "%s: failed to load hda patch %d\n", __func__, ret);
 				goto error_no_pm;
 			}
 			release_firmware(fw);
@@ -470,13 +474,13 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 
 	ret = snd_hda_codec_set_name(hcodec, hcodec->preset->name);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "name failed %s\n", hcodec->preset->name);
+		dev_err(&hdev->dev, "%s: name failed %s\n", __func__, hcodec->preset->name);
 		goto error_pm;
 	}
 
 	ret = snd_hdac_regmap_init(&hcodec->core);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "regmap init failed\n");
+		dev_err(&hdev->dev, "%s: regmap init failed\n", __func__);
 		goto error_pm;
 	}
 
@@ -484,16 +488,16 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	if (patch) {
 		ret = patch(hcodec);
 		if (ret < 0) {
-			dev_err(&hdev->dev, "patch failed %d\n", ret);
+			dev_err(&hdev->dev, "%s: patch failed %d\n", __func__, ret);
 			goto error_regmap;
 		}
 	} else {
-		dev_dbg(&hdev->dev, "no patch file found\n");
+		dev_dbg(&hdev->dev, "%s: no patch file found\n", __func__);
 	}
 
 	ret = snd_hda_codec_parse_pcms(hcodec);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "unable to map pcms to dai %d\n", ret);
+		dev_err(&hdev->dev, "%s: unable to map pcms to dai %d\n", __func__, ret);
 		goto error_patch;
 	}
 
@@ -501,8 +505,8 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	if (!is_hdmi_codec(hcodec)) {
 		ret = snd_hda_codec_build_controls(hcodec);
 		if (ret < 0) {
-			dev_err(&hdev->dev, "unable to create controls %d\n",
-				ret);
+			dev_err(&hdev->dev, "%s: unable to create controls %d\n",
+				__func__, ret);
 			goto error_patch;
 		}
 	}
@@ -548,7 +552,7 @@ static void hdac_hda_codec_remove(struct snd_soc_component *component)
 
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
-		dev_err(&hdev->dev, "hdac link not found\n");
+		dev_err(&hdev->dev, "%s: hdac link not found\n", __func__);
 		return;
 	}
 
@@ -624,7 +628,7 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 	/* hold the ref while we probe */
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
-		dev_err(&hdev->dev, "hdac link not found\n");
+		dev_err(&hdev->dev, "%s: hdac link not found\n", __func__);
 		return -EIO;
 	}
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
@@ -640,7 +644,7 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 						ARRAY_SIZE(hdac_hda_dais));
 
 	if (ret < 0) {
-		dev_err(&hdev->dev, "failed to register HDA codec %d\n", ret);
+		dev_err(&hdev->dev, "%s: failed to register HDA codec %d\n", __func__, ret);
 		return ret;
 	}
 
-- 
2.40.1

