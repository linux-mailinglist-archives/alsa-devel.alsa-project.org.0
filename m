Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D8477136
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 12:58:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C0D71E73;
	Thu, 16 Dec 2021 12:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C0D71E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639655921;
	bh=AbK7Yq7+uugQLKla80wDQhfAnMDVnoH/1TFs7lVnlIQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FToQHNxV3WqnkKGfB1nPCfj4gDhspbcPc52kmjhH0Z98szj3np2C5yDIDqDybHlit
	 crHLqmniJ2XQwHE4uIUrTWr8cYvgBByRURjebUjoXlMxKJSNbkEcLlIoO+irJbqbq8
	 xEFj+CEPgkX1vBQ9X0ayHWwkLGpZdMPo3RsCrYPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E3EF804F2;
	Thu, 16 Dec 2021 12:56:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67109F80116; Thu, 16 Dec 2021 12:56:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72B1CF80116
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 12:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72B1CF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JU0R67+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639655769; x=1671191769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AbK7Yq7+uugQLKla80wDQhfAnMDVnoH/1TFs7lVnlIQ=;
 b=JU0R67+hhSijBnEjl78S3ME3uE66ZWP5Jq8BhgTwF+KZXU4BQZxeit5p
 YcELwdOw/+CriN5r3pD5OygiNK229+M5/CYx2eTrbRpaYglF+BPSFeww7
 6O7uzPuWBw0V7kcT2TywzsUO500pRD/Pnw45QrkyywE5b8/Fu+VqpPF/e
 l4auyMtJvpx4fN5CqvRdNPSYF6zmBYsgfYh6lcC/WrzUu4S7iOimdFVgt
 NMCIseNT7qIztmthNXHbRT84RoxLjeTB8Z7PSytA709vEW8hrYbhSfGHM
 D4mhbJ0LWpfmC2+s1oGPSImAlnWOet3/s52Tus7PmdgEnKamjDVdrAe4F Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239692042"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="239692042"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 03:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="506248439"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 03:56:02 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: Intel: catpt: Streamline locals declaration for
 PCM-functions
Date: Thu, 16 Dec 2021 12:57:41 +0100
Message-Id: <20211216115743.2130622-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216115743.2130622-1-cezary.rojewski@intel.com>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
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

Group all the catpt_xxx structs together in PCM related functions so
they look more cohesive.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 16146c693c08..939a9b801dec 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -259,9 +259,9 @@ static enum catpt_channel_config catpt_get_channel_config(u32 num_channels)
 static int catpt_dai_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	struct catpt_stream_template *template;
 	struct catpt_stream_runtime *stream;
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	struct resource *res;
 	int ret;
 
@@ -306,8 +306,8 @@ static int catpt_dai_startup(struct snd_pcm_substream *substream,
 static void catpt_dai_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	struct catpt_stream_runtime *stream;
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 
 	stream = snd_soc_dai_get_dma_data(dai, substream);
 
@@ -329,9 +329,9 @@ static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long *ctlvol);
 static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
 				     struct catpt_stream_runtime *stream)
 {
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	struct snd_soc_component *component = dai->component;
 	struct snd_kcontrol *pos;
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	const char *name;
 	int ret;
 	u32 id = stream->info.stream_hw_id;
@@ -374,12 +374,12 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
 {
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct snd_pcm_runtime *rtm = substream->runtime;
+	struct snd_dma_buffer *dmab;
 	struct catpt_stream_runtime *stream;
 	struct catpt_audio_format afmt;
 	struct catpt_ring_info rinfo;
-	struct snd_pcm_runtime *rtm = substream->runtime;
-	struct snd_dma_buffer *dmab;
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	int ret;
 
 	stream = snd_soc_dai_get_dma_data(dai, substream);
@@ -427,8 +427,8 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 static int catpt_dai_hw_free(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	struct catpt_stream_runtime *stream;
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 
 	stream = snd_soc_dai_get_dma_data(dai, substream);
 	if (!stream->allocated)
@@ -444,8 +444,8 @@ static int catpt_dai_hw_free(struct snd_pcm_substream *substream,
 static int catpt_dai_prepare(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	struct catpt_stream_runtime *stream;
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	int ret;
 
 	stream = snd_soc_dai_get_dma_data(dai, substream);
@@ -467,9 +467,9 @@ static int catpt_dai_prepare(struct snd_pcm_substream *substream,
 static int catpt_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			     struct snd_soc_dai *dai)
 {
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
-	struct catpt_stream_runtime *stream;
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct catpt_stream_runtime *stream;
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	snd_pcm_uframes_t pos;
 	int ret;
 
@@ -604,10 +604,10 @@ static snd_pcm_uframes_t
 catpt_component_pointer(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
-	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
-	struct catpt_stream_runtime *stream;
 	struct snd_soc_pcm_runtime *rtm = substream->private_data;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtm, 0);
+	struct catpt_stream_runtime *stream;
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	u32 pos;
 
 	if (rtm->dai_link->no_pcm)
@@ -632,8 +632,8 @@ static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtm,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtm, 0);
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	struct catpt_ssp_device_format devfmt;
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	int ret;
 
 	devfmt.iface = dai->driver->id;
@@ -893,8 +893,8 @@ static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
-	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	struct catpt_stream_runtime *stream;
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	long *ctlvol = (long *)kcontrol->private_value;
 	u32 dspvol;
 	int i;
@@ -925,8 +925,8 @@ static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
-	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	struct catpt_stream_runtime *stream;
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	long *ctlvol = (long *)kcontrol->private_value;
 	int ret, i;
 
@@ -1001,8 +1001,8 @@ static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
-	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	struct catpt_stream_runtime *stream;
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	bool mute;
 	int ret;
 
-- 
2.25.1

