Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF98B34CA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 12:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E6ADF6;
	Fri, 26 Apr 2024 12:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E6ADF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714125715;
	bh=WvPxcJCAnFWnb26FV2ZBZGxjnmSM3tYTZTkWyMv25OM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g1qjPdFJ1VfVhXmmo/tBjspUgHD/m1wiWo0lDeEHNnmOuU0vbPGbkEYLXMxEEQPp0
	 sd5CBgaIKmhZut+reTrx14yBQ/t+1w1CYiRR5Dye5yut+fbxzKmrqm/SliPc1PaIAK
	 bmD8jUqYlZq1yv8VErREiSdhDYukislL3F6K/YsQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 979F4F8069F; Fri, 26 Apr 2024 11:59:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88BC4F8069A;
	Fri, 26 Apr 2024 11:59:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AFB0F802E8; Fri, 26 Apr 2024 11:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 003FCF8056F
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 11:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 003FCF8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f9YogoKO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125426; x=1745661426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WvPxcJCAnFWnb26FV2ZBZGxjnmSM3tYTZTkWyMv25OM=;
  b=f9YogoKO6VL9iUEB1trvlYDopcV80HztE6CSlO9XMS2nNkPAH68OuctU
   Xdo9UtLwNkjWdFB406I5wLW1ImB4iPKvClqQiqy1kLCeUU/TkRGw8SXig
   n0BLewsiaB6IYCR67Djf0AGfaSOLbTF4IlJck+Bbvj8DmSWVpau4TWMV3
   3QF+DqR0EcU8ViUJ6kp8cVrGUw0rzU2wAgA2IcotAIHKff4xo4eL25TMQ
   bCZRY1jsTBaJqNsbxUbguN3IXeTS5DAEmmZrZHPtptN2F9piRTmpDMtaz
   9dtBx3UF4N5J5NFrDH+FnjMHwvDUwyXKNv7KyXlUjR72z3scYmPJr2ujY
   g==;
X-CSE-ConnectionGUID: RLOah4LlQw6FNoo15xc/UQ==
X-CSE-MsgGUID: azNlrvuRS9+RLSMkMGaVGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409234"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="20409234"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:57:05 -0700
X-CSE-ConnectionGUID: AqEiny2qSouGxqljEvUXcQ==
X-CSE-MsgGUID: Lo7qdTGzR26njZq/LEbXBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25460633"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:57:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 8/8] ASoC: Intel: avs: Clean up hw constraints initialization
Date: Fri, 26 Apr 2024 11:57:33 +0200
Message-Id: <20240426095733.3946951-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 53RDXCCPKVCKKSXDLI3P7ZTHNNG4W4QX
X-Message-ID-Hash: 53RDXCCPKVCKKSXDLI3P7ZTHNNG4W4QX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/53RDXCCPKVCKKSXDLI3P7ZTHNNG4W4QX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Provide a separate function that initializes all PCM hardware
constraints for the driver. No functional changes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 84 ++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 40 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 168e16e82116..845b5ed9eb1b 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -448,19 +448,6 @@ static const struct snd_soc_dai_ops avs_dai_hda_be_ops = {
 	.trigger = avs_dai_hda_be_trigger,
 };
 
-static const unsigned int rates[] = {
-	8000, 11025, 12000, 16000,
-	22050, 24000, 32000, 44100,
-	48000, 64000, 88200, 96000,
-	128000, 176400, 192000,
-};
-
-static const struct snd_pcm_hw_constraint_list hw_rates = {
-	.count = ARRAY_SIZE(rates),
-	.list = rates,
-	.mask = 0,
-};
-
 static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
 {
 	struct snd_interval *interval = hw_param_interval(params, rule->var);
@@ -481,40 +468,33 @@ static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_h
 	return snd_interval_refine(interval, &to);
 }
 
-static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+static int avs_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct avs_dma_data *data;
-	struct hdac_bus *bus;
-	struct hdac_ext_stream *host_stream;
+	static const unsigned int rates[] = {
+		8000, 11025, 12000, 16000,
+		22050, 24000, 32000, 44100,
+		48000, 64000, 88200, 96000,
+		128000, 176400, 192000,
+	};
+	static const struct snd_pcm_hw_constraint_list rate_list = {
+		.count = ARRAY_SIZE(rates),
+		.list = rates,
+	};
 	int ret;
 
-	ret = avs_dai_startup(substream, dai);
-	if (ret)
-		return ret;
-
-	data = snd_soc_dai_get_dma_data(dai, substream);
-	bus = &data->adev->base.core;
-
-	host_stream = snd_hdac_ext_stream_assign(bus, substream, HDAC_EXT_STREAM_TYPE_HOST);
-	if (!host_stream) {
-		ret = -EBUSY;
-		goto err;
-	}
-
-	data->host_stream = host_stream;
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 	if (ret < 0)
-		goto err;
+		return ret;
 
-	/* avoid wrap-around with wall-clock */
+	/* Avoid wrap-around with wall-clock. */
 	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME, 20, 178000000);
 	if (ret < 0)
-		goto err;
+		return ret;
 
-	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_rates);
+	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &rate_list);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	/* Adjust buffer and period size based on the audio format. */
 	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, hw_rule_param_size, NULL,
@@ -524,16 +504,40 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 			    SNDRV_PCM_HW_PARAM_FORMAT, SNDRV_PCM_HW_PARAM_CHANNELS,
 			    SNDRV_PCM_HW_PARAM_RATE, -1);
 
+	return ret;
+}
+
+static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *host_stream;
+	struct avs_dma_data *data;
+	struct hdac_bus *bus;
+	int ret;
+
+	ret = avs_pcm_hw_constraints_init(substream);
+	if (ret)
+		return ret;
+
+	ret = avs_dai_startup(substream, dai);
+	if (ret)
+		return ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	bus = &data->adev->base.core;
+
+	host_stream = snd_hdac_ext_stream_assign(bus, substream, HDAC_EXT_STREAM_TYPE_HOST);
+	if (!host_stream) {
+		avs_dai_shutdown(substream, dai);
+		return -EBUSY;
+	}
+
+	data->host_stream = host_stream;
 	snd_pcm_set_sync(substream);
 
 	dev_dbg(dai->dev, "%s fe STARTUP tag %d str %p",
 		__func__, hdac_stream(host_stream)->stream_tag, substream);
 
 	return 0;
-
-err:
-	kfree(data);
-	return ret;
 }
 
 static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-- 
2.25.1

