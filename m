Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E680D8B34C7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 12:01:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B74411C;
	Fri, 26 Apr 2024 12:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B74411C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714125691;
	bh=cJfd0VnFG9YhYzSbRGhfArwkT7UjXbxFfPxrSep4Cqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ic653mzhz7QWgcWC0ujOokdn0alL4MzMfDWOJnAYs9rz4zNme3uQItHbRXKknmZWr
	 2yqRLkDe0Hgl9BdUJNqaPMED5vv9BfGGnPtHlmo4FFZeoP4HcQFYIPuW22xCQEHyNL
	 8AQpClIbONACKjFczCIEMu7cY1ZNa0KlDCegtSdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 274E8F80672; Fri, 26 Apr 2024 11:59:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 835F7F8063C;
	Fri, 26 Apr 2024 11:59:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 495FDF802E8; Fri, 26 Apr 2024 11:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E9EBF804B0
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 11:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E9EBF804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ai4Ix6ke
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125422; x=1745661422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cJfd0VnFG9YhYzSbRGhfArwkT7UjXbxFfPxrSep4Cqo=;
  b=ai4Ix6keApFb78PBg9kBfvv7DqYObeubByNCJSCLlpP9XkC/nh6T+JvC
   qSdgCPJRcX8JlWYRV5xJQAkAB375MjtX5itLGbyawKa4nOYCEc+SdMmjU
   n/myW0TF9JEQ8KSgGm0IiXl3N6jepdPoSOs4UYZKm9sOeRzL7xGukvtV0
   4cjmb/7arWoI/peky1fycJfDHYIrcX4NW18j9L4ESjFb95UvA5dmPxLxh
   4r2VWe4cmgz/ZWhJVStdOhXXM3CMXZujR/p+s9dpsMD3f4KBl06gR5K2y
   TwK4uQQgVCSXOMVZdqf9Su5/K1nF0WJ5E90ebSsVrZvIJxg7yVUDhj+sc
   w==;
X-CSE-ConnectionGUID: +wxr/gJ7R+ultXU8lIpOFQ==
X-CSE-MsgGUID: oktz+YdcTqKibfI6LTfdsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409219"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="20409219"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:57:01 -0700
X-CSE-ConnectionGUID: M4cu62lWSBC3dDGtRsxc1w==
X-CSE-MsgGUID: BYxq9KG7QBKbrSV8+KE7uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25460615"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/8] ASoC: Intel: avs: Remove redundancy around DAI prepare
Date: Fri, 26 Apr 2024 11:57:31 +0200
Message-Id: <20240426095733.3946951-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6QHFTIHY43CTMOQL5XDZG35U6NEISQCU
X-Message-ID-Hash: 6QHFTIHY43CTMOQL5XDZG35U6NEISQCU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QHFTIHY43CTMOQL5XDZG35U6NEISQCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop unused arguments in the avs_dai_prepare() function. With the
function updated, it matches its template in snd_soc_dai_ops and can be
referenced throughout the pcm.c file without need of any wrappers.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 0771a9716f4b..d4557b7b1c6c 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -151,8 +151,7 @@ static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
 	return avs_dai_hw_params(substream, fe_hw_params, be_hw_params, dai, dma_id);
 }
 
-static int avs_dai_prepare(struct avs_dev *adev, struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
+static int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
 	int ret;
@@ -201,11 +200,6 @@ static int avs_dai_nonhda_be_hw_free(struct snd_pcm_substream *substream, struct
 	return 0;
 }
 
-static int avs_dai_nonhda_be_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-{
-	return avs_dai_prepare(to_avs_dev(dai->dev), substream, dai);
-}
-
 static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				     struct snd_soc_dai *dai)
 {
@@ -261,7 +255,7 @@ static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.shutdown = avs_dai_shutdown,
 	.hw_params = avs_dai_nonhda_be_hw_params,
 	.hw_free = avs_dai_nonhda_be_hw_free,
-	.prepare = avs_dai_nonhda_be_prepare,
+	.prepare = avs_dai_prepare,
 	.trigger = avs_dai_nonhda_be_trigger,
 };
 
@@ -381,7 +375,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		snd_hdac_ext_bus_link_set_stream_id(link, hdac_stream(link_stream)->stream_tag);
 
-	ret = avs_dai_prepare(to_avs_dev(dai->dev), substream, dai);
+	ret = avs_dai_prepare(substream, dai);
 	if (ret)
 		return ret;
 
@@ -672,7 +666,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		return ret;
 
-	ret = avs_dai_prepare(data->adev, substream, dai);
+	ret = avs_dai_prepare(substream, dai);
 	if (ret)
 		return ret;
 
-- 
2.25.1

