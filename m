Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 433FA8B34CD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 12:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E70B70;
	Fri, 26 Apr 2024 12:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E70B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714125741;
	bh=HlGJubqfkIRgU0Aeu+B9moA7xbvwpSC/vQ/7n6B7G14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KY8jGyRC2JQ5+OTcNv+ek2Pv2ta9YJmkmGe032HmFgfZ1CnnT3kI9itSua3Wjg9GE
	 iZz82yojOFPBuV8Yf7CdFePHHVrkEVX+8khTktKj2uWogFD0YNxxLObN0MgNDoVgFb
	 E8WRUcRLCjvTO0gOnezX44ospplWHY0KbyselgEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5D0BF806B2; Fri, 26 Apr 2024 11:59:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E532F806B9;
	Fri, 26 Apr 2024 11:59:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E21C2F802E8; Fri, 26 Apr 2024 11:57:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 346D0F80568
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 11:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346D0F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bTNNZ5jx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125424; x=1745661424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HlGJubqfkIRgU0Aeu+B9moA7xbvwpSC/vQ/7n6B7G14=;
  b=bTNNZ5jxDjcsEEDtB+DzJlSGD2sWR5SeG7v9neSjGoL/eAYu6qkFRJp0
   h+pI5a8Jgqs2BqXigkuvToCSrl57n7i5bQ/EEzrfjooFUEM6QKrYjUDfy
   ZGfFziwFv/CgyYO2B+4yaK8vboS/deUvZ18g2gEV/h6EWgyLaax5ECK7o
   lMVoMrD82fd2pXvQQ2BtNj8doL4jNxZ3JEvKwXdfitN1PCIq/hGIr4eIL
   5qhCspfv9bwa3lCC3yqrR9S5dxnvaswjgTj/QO+d5OaMBnlyB+Bd2bIho
   8QoqPetSmc2ueN02LFdt55D5ACc7oi1Fit6TTOK7/mIZwdi0o3E6sQb8h
   Q==;
X-CSE-ConnectionGUID: LrVWS3lfTV6Qk5+wTkTKOA==
X-CSE-MsgGUID: ywcFLu9VRaGfAkVVMfepng==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409228"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="20409228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:57:03 -0700
X-CSE-ConnectionGUID: S4q3g+JSQxKtyJq+NaF/mg==
X-CSE-MsgGUID: mkAr/ahCRF+rt2XpJa8naw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25460623"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:57:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 7/8] ASoC: Intel: avs: Store pointer to link_stream in
 dma_data
Date: Fri, 26 Apr 2024 11:57:32 +0200
Message-Id: <20240426095733.3946951-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H7RJ4MOSRZLIJQD35BPGMQF3VSGLMM4I
X-Message-ID-Hash: H7RJ4MOSRZLIJQD35BPGMQF3VSGLMM4I
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7RJ4MOSRZLIJQD35BPGMQF3VSGLMM4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While the HDAudio codec driver expectations must be met - store valid
pointer to HDAudio LINK stream in substream->runtime->private_data - the
code is more readable and easier to maintain if dma_data stores pointers
to both HOST and LINK stream.

DAI BE operations can refer to the LINK stream with data->link_stream,
similarly to how DAI FE operations access the HOST stream with
data->host_stream.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 40 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index d4557b7b1c6c..168e16e82116 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -23,13 +23,12 @@ struct avs_dma_data {
 	struct avs_tplg_path_template *template;
 	struct avs_path *path;
 	struct avs_dev *adev;
-	/*
-	 * link stream is stored within substream's runtime
-	 * private_data to fulfill the needs of codec BE path
-	 *
-	 * host stream assigned
-	 */
-	struct hdac_ext_stream *host_stream;
+
+	/* LINK-stream utilized in BE operations while HOST in FE ones. */
+	union {
+		struct hdac_ext_stream *link_stream;
+		struct hdac_ext_stream *host_stream;
+	};
 
 	struct snd_pcm_substream *substream;
 };
@@ -263,6 +262,7 @@ static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct sn
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_stream;
+	struct avs_dma_data *data;
 	struct hda_codec *codec;
 	int ret;
 
@@ -278,18 +278,18 @@ static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct sn
 		return -EBUSY;
 	}
 
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	data->link_stream = link_stream;
 	substream->runtime->private_data = link_stream;
 	return 0;
 }
 
 static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *link_stream;
+	struct avs_dma_data *data = snd_soc_dai_get_dma_data(dai, substream);
 
-	link_stream = substream->runtime->private_data;
-	snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
+	snd_hdac_ext_stream_release(data->link_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	substream->runtime->private_data = NULL;
-
 	avs_dai_shutdown(substream, dai);
 }
 
@@ -297,16 +297,13 @@ static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
-	struct hdac_ext_stream *link_stream;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 	if (data->path)
 		return 0;
 
-	link_stream = substream->runtime->private_data;
-
 	return avs_dai_be_hw_params(substream, hw_params, dai,
-				    hdac_stream(link_stream)->stream_tag - 1);
+				    hdac_stream(data->link_stream)->stream_tag - 1);
 }
 
 static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
@@ -323,7 +320,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 	if (!data->path)
 		return 0;
 
-	link_stream = substream->runtime->private_data;
+	link_stream = data->link_stream;
 	link_stream->link_prepared = false;
 	avs_path_free(data->path);
 	data->path = NULL;
@@ -347,13 +344,16 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	struct snd_soc_pcm_stream *stream_info;
 	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
+	struct avs_dma_data *data;
 	struct hda_codec *codec;
 	struct hdac_bus *bus;
 	unsigned int format_val;
 	unsigned int bits;
 	int ret;
 
-	link_stream = runtime->private_data;
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	link_stream = data->link_stream;
+
 	if (link_stream->link_prepared)
 		return 0;
 
@@ -387,14 +387,12 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct hdac_ext_stream *link_stream;
 	struct avs_dma_data *data;
 	int ret = 0;
 
 	dev_dbg(dai->dev, "entry %s cmd=%d\n", __func__, cmd);
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
-	link_stream = substream->runtime->private_data;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -403,7 +401,7 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_stream_start(link_stream);
+		snd_hdac_ext_stream_start(data->link_stream);
 
 		ret = avs_path_pause(data->path);
 		if (ret < 0) {
@@ -426,7 +424,7 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ret < 0)
 			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
 
-		snd_hdac_ext_stream_clear(link_stream);
+		snd_hdac_ext_stream_clear(data->link_stream);
 
 		ret = avs_path_reset(data->path);
 		if (ret < 0)
-- 
2.25.1

