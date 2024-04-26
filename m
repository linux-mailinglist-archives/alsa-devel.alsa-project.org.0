Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 748EB8B34C0
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 12:00:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2579F6;
	Fri, 26 Apr 2024 12:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2579F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714125617;
	bh=aT40F+YO05hp/H238joGV3KbhgSHr4J7qmCIqNioPjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=szYVlUSeN/ZgBhtQA+rr8refVPcJ/u0LYy9OihduvSibSHybl+VPg/9MpMxzMJTXn
	 +/n7ijIUYocv1yMmV3JhVrAzmgucczCHtI2Y/OjzXBxAoDBkbuj+U+4I6bM3UTbf31
	 jhYtzc0wek4IOKbEotvH2q6l869TQu3fkSZsaFSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2E9FF802E8; Fri, 26 Apr 2024 11:59:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBDC4F800B5;
	Fri, 26 Apr 2024 11:59:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13EBCF80571; Fri, 26 Apr 2024 11:57:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A70A4F80423
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 11:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A70A4F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SrT2q4Gs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125417; x=1745661417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aT40F+YO05hp/H238joGV3KbhgSHr4J7qmCIqNioPjc=;
  b=SrT2q4GsJg1TJO1/w9pBkK+t+oSZQQGmCqOlFu5sy//yF/NMR8opH5oD
   CfAmBr4Ar5VMCrnEZOb2XEWz9NHSFpdidRq2gpNxfsL3LyEpP8+M/oU7v
   j4lUy1E3NkY6mIHG4enx2G+etRHcS8H+ZhVKgqDP1D4kutl2uS69cD1bV
   9BJBiw3JG6VRGfWtKaQ2Xp7JeY4metkde+MWf4w/xTuKwcEMvug0kEKl+
   cOehBQ0Q2yjbVocwoh3rTFBH8GuErzRobItp1zRU78n49XueKicsldm29
   mhl/U6f9qRGuPMB/47QM/QDJ4X3/shvhCqNQtwyxW0cKYSOCWtSDPq1pZ
   w==;
X-CSE-ConnectionGUID: nENsjHPcSxaVrzIaNSOoSQ==
X-CSE-MsgGUID: gXJzdUbFTRq3wd1ovZGrvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409191"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="20409191"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:56:53 -0700
X-CSE-ConnectionGUID: MAMBGvDDSg2mnyUh2qhitw==
X-CSE-MsgGUID: STkHw4WIRxqxfl/tXNneag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25460560"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/8] ASoC: Intel: avs: Relocate HDA BE DAI specific operations
Date: Fri, 26 Apr 2024 11:57:27 +0200
Message-Id: <20240426095733.3946951-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GKPDRPO5XVX7IK3AMP6L3XVHBMHIDMOP
X-Message-ID-Hash: GKPDRPO5XVX7IK3AMP6L3XVHBMHIDMOP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKPDRPO5XVX7IK3AMP6L3XVHBMHIDMOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DAI's startup()/shutdown() shall deal with allocation and freeing of
resources needed to facilitate streaming over it. Currently for HDAudio
BE DAIs some of that task is done in component->open()/close(). Relocate
the relevant pieces to address that.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 55 ++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 77a7e8f93951..f3cd54f355ef 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -277,12 +277,36 @@ static const struct snd_soc_dai_ops avs_dai_hda_be_ops;
 
 static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	return avs_dai_startup(substream, dai, false, &avs_dai_hda_be_ops);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct hdac_ext_stream *link_stream;
+	struct hda_codec *codec;
+	int ret;
+
+	ret = avs_dai_startup(substream, dai, false, &avs_dai_hda_be_ops);
+	if (ret)
+		return ret;
+
+	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
+	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
+						 HDAC_EXT_STREAM_TYPE_LINK);
+	if (!link_stream) {
+		avs_dai_nonhda_be_shutdown(substream, dai);
+		return -EBUSY;
+	}
+
+	substream->runtime->private_data = link_stream;
+	return 0;
 }
 
 static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	return avs_dai_nonhda_be_shutdown(substream, dai);
+	struct hdac_ext_stream *link_stream;
+
+	link_stream = substream->runtime->private_data;
+	snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
+	substream->runtime->private_data = NULL;
+
+	avs_dai_nonhda_be_shutdown(substream, dai);
 }
 
 static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
@@ -1576,8 +1600,6 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct hdac_ext_stream *link_stream;
-	struct hda_codec *codec;
 
 	if (!rtd->dai_link->no_pcm) {
 		struct snd_pcm_hardware hwparams = avs_pcm_hardware;
@@ -1609,30 +1631,6 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 		return snd_soc_set_runtime_hwparams(substream, &hwparams);
 	}
 
-	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
-	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
-					     HDAC_EXT_STREAM_TYPE_LINK);
-	if (!link_stream)
-		return -EBUSY;
-
-	substream->runtime->private_data = link_stream;
-	return 0;
-}
-
-static int avs_component_hda_close(struct snd_soc_component *component,
-				   struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct hdac_ext_stream *link_stream;
-
-	/* only BE DAI links are handled here */
-	if (!rtd->dai_link->no_pcm)
-		return 0;
-
-	link_stream = substream->runtime->private_data;
-	snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
-	substream->runtime->private_data = NULL;
-
 	return 0;
 }
 
@@ -1643,7 +1641,6 @@ static const struct snd_soc_component_driver avs_hda_component_driver = {
 	.suspend		= avs_component_suspend,
 	.resume			= avs_component_resume,
 	.open			= avs_component_hda_open,
-	.close			= avs_component_hda_close,
 	.pointer		= avs_component_pointer,
 	.mmap			= avs_component_mmap,
 	.pcm_construct		= avs_component_construct,
-- 
2.25.1

