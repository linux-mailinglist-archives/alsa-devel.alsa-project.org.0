Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3F08B34C4
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 12:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09C3C1CF;
	Fri, 26 Apr 2024 12:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09C3C1CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714125658;
	bh=DUVgDs0/gvFlo4f+lMztb4TNTC7UqT0l2BjujtY77hY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Psdxaj25oMxMxbBDpu3ZgipzzoQukusJsSYMduIrmDgso7uX0iEtvLFgCfGEYudNY
	 smcMtdu9dig+QZuCh5rlzdq9kK1VW8Z4UAWZUlzPT+mg2czefXaTX10d5jBepRCfjs
	 ZO1KfyLrZDXR8BcdGc8KmPePlrlXALJxhLuYsITM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63AC6F805F8; Fri, 26 Apr 2024 11:59:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A0A2F805F3;
	Fri, 26 Apr 2024 11:59:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3ACDF80423; Fri, 26 Apr 2024 11:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D47DF8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 11:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D47DF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HMndcyhK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125417; x=1745661417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DUVgDs0/gvFlo4f+lMztb4TNTC7UqT0l2BjujtY77hY=;
  b=HMndcyhK2IOJhANSSkyr9LkASu+EPmC5oXWubDjHTfpB8c7VRc88McWV
   CQwsNMlcei36IVXJ7RfxDHmmK53y+eGghnbtQrNMYg8mjoWQTcYCYIlZB
   LX2QX7eEq3mjdAfD5kojmp8Qv9428stiGIVUaSdfQMgDO3CqCaXywYLMp
   Fwlrnu6zLoDtCN4UMBeAgHe6bdYSRPQsWhdF1S6O9iPtb5AE6wbanHMpt
   c9/YMoKcDzLms5LIIRzK3PH6uStAK6sDxZEuAMxioeVZfY8/YQuOoJ49a
   qG7gWRCBKE38mBAsUUdqxs2dU1m11kFlR9mw9HGF+1Z9G4mWeoXHb4hps
   Q==;
X-CSE-ConnectionGUID: 6J3Q5j/xRZeM2G4HqG9fJw==
X-CSE-MsgGUID: rFtrjQJYQPKHg1xbFeESoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409184"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="20409184"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:56:51 -0700
X-CSE-ConnectionGUID: JimNMcCbRmCgssMA9AEfhQ==
X-CSE-MsgGUID: VXfDG88vQIuOE7DecZbNLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25460546"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/8] ASoC: pcm: Reverse iterate DAIs when shutting them down
Date: Fri, 26 Apr 2024 11:57:26 +0200
Message-Id: <20240426095733.3946951-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D7XTR5F3LRDSDJRWEY7KJLPYZA535UAU
X-Message-ID-Hash: D7XTR5F3LRDSDJRWEY7KJLPYZA535UAU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7XTR5F3LRDSDJRWEY7KJLPYZA535UAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During startup snd_soc_dai_startup() is launched in ascending order and
the exact same thing is done during shutdown procedure. Reverse the
order in the latter so that it is symmetric to the former.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h | 4 ++++
 sound/soc/soc-pcm.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0376f7e4c15d..a4747c3d0856 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1225,6 +1225,10 @@ struct snd_soc_pcm_runtime {
 	     ((i) < (rtd)->dai_link->num_cpus + (rtd)->dai_link->num_codecs) &&	\
 		     ((dai) = (rtd)->dais[i]);				\
 	     (i)++)
+#define for_each_rtd_dais_reverse(rtd, i, dai)					\
+	for ((i) = (rtd)->dai_link->num_cpus + (rtd)->dai_link->num_codecs - 1;	\
+	     (i) >= 0 && ((dai) = (rtd)->dais[i]);				\
+	     (i)--)
 #define for_each_rtd_ch_maps(rtd, i, ch_maps) for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
 
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b0e1bd7f588b..711b2f49ed88 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -724,7 +724,7 @@ static int soc_pcm_clean(struct snd_soc_pcm_runtime *rtd,
 		}
 	}
 
-	for_each_rtd_dais(rtd, i, dai)
+	for_each_rtd_dais_reverse(rtd, i, dai)
 		snd_soc_dai_shutdown(dai, substream, rollback);
 
 	snd_soc_link_shutdown(substream, rollback);
-- 
2.25.1

