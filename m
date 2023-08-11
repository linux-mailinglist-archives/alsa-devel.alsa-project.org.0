Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C078477954E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24F93DF5;
	Fri, 11 Aug 2023 18:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24F93DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772869;
	bh=o3Iymi84uxDOx5/T+5qB+zgM9bcsFaevCimmEqdMWCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FJ5Tq+I5YdlkvcVQFYVErfw41mgxba0GfNM1sOCfmQL3f0d+p7YsyXH4B2ZznxFCB
	 mg+KB6bc6T16xpDAkgJZuxypL9M+LJ6ACLlQMtRrJlpxZPm0FikE71AQRaN2vUYsC8
	 eLfGw6Tp+DGykk4R8jb+e9bwxrOVtb8yKS+seelI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A138F8061E; Fri, 11 Aug 2023 18:50:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 666C6F8061C;
	Fri, 11 Aug 2023 18:50:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 991B7F805BD; Fri, 11 Aug 2023 18:50:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B64B8F805BD
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64B8F805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n5+C/Ch7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772591; x=1723308591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o3Iymi84uxDOx5/T+5qB+zgM9bcsFaevCimmEqdMWCQ=;
  b=n5+C/Ch7Uv/Cu3pD/omWCCj3Gsg2mSQyYXIlbqO6tmMCinV1+V4v1t0y
   n2RcDbBECDEoBWJsW/jOUiNs9WUYenRCVConkAQGKN36EyBhw+I/p2QLT
   eE//NOR/WZbgrmx7ZCKOQ5jdhCjJx4Rh6hQyoC1d2AHHPfFfem9anhsf7
   weNymaL9ADN/j+6NjPwFM92VHxSQQhfU+AiMQzteOSz4ac+bak5tkdnHb
   /luKy7YMQVjZDIVvDZc7DB7Vv9W4vjFX+Gmpa/hNErh2c8Ep4YO1LIme5
   WKVG0h5lKyjYJsv42INZCb6P4u7BYSOf39+XVp9AAtsN+JAf5ekkSfJKF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371725187"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371725187"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846842888"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="846842888"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 09:49:45 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH 17/17] ASoC: Intel: avs: Kill S24_LE in HDAudio streaming
Date: Fri, 11 Aug 2023 18:48:53 +0200
Message-Id: <20230811164853.1797547-18-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811164853.1797547-1-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S7CZY3ARPGJEXB7W7RN2QQK5XZO4DBYP
X-Message-ID-Hash: S7CZY3ARPGJEXB7W7RN2QQK5XZO4DBYP
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7CZY3ARPGJEXB7W7RN2QQK5XZO4DBYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Eliminate all occurrences of S24_LE within the HDAudio related pcm code,
both HOST and LINK side. Replace those with MSBITS subformats to allow
for granular selection when S32_LE is the format of choice.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c      | 4 +++-
 sound/soc/intel/avs/topology.c | 9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 31737133b991..83cdce8fead4 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1160,8 +1160,10 @@ static const struct snd_pcm_hardware avs_pcm_hardware = {
 				  SNDRV_PCM_INFO_RESUME |
 				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 	.formats		= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+	.subformats		= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_32,
 	.buffer_bytes_max	= AZX_MAX_BUF_SIZE,
 	.period_bytes_min	= 128,
 	.period_bytes_max	= AZX_MAX_BUF_SIZE / 2,
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 118f386d8582..5130261f0b33 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1620,8 +1620,15 @@ static int avs_dai_load(struct snd_soc_component *comp, int index,
 			struct snd_soc_dai_driver *dai_drv, struct snd_soc_tplg_pcm *pcm,
 			struct snd_soc_dai *dai)
 {
-	if (pcm)
+	u64 subformats = SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+			 SNDRV_PCM_SUBFMTBIT_MSBITS_24;
+
+	if (pcm) {
 		dai_drv->ops = &avs_dai_fe_ops;
+		dai_drv->capture.subformats |= subformats;
+		dai_drv->playback.subformats |= subformats;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

