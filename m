Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE088A21B3
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0AAF2BD0;
	Fri, 12 Apr 2024 00:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0AAF2BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874217;
	bh=oqtHSPMLAUON0JmK9Out3TiJRj9J67t4yJqtjUWl/kM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uwnA9AIH6dPQzafnb4baNKCIDxW8bzSIZkjJI95WampoxA2YDjf6OqJMNEcsHNWAA
	 RQyyQx2ZjV1gAcBn9rZjibFPro0KHOd5rNZzAnUAt3VXHVFayS98cdA2iYxck9oUyL
	 ylW6UijGv5/y0QACiV+77JiYiV/nbqRyegvbeS+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75FF2F8057F; Fri, 12 Apr 2024 00:23:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3226AF8058C;
	Fri, 12 Apr 2024 00:23:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42582F800C9; Fri, 12 Apr 2024 00:10:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36BC0F800C9
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36BC0F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Vh0auoVE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873060; x=1744409060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oqtHSPMLAUON0JmK9Out3TiJRj9J67t4yJqtjUWl/kM=;
  b=Vh0auoVETkZ8B+R3iGiHjnLe7Hq/rOSd64K/uuXn4ydjyg/35eLubhz+
   01QeEfWNZiOd/kvc4jxUeSsvlPVZrrl4nuEqNcu5IrG2aKAu7axqr1Hs3
   kBic0yM0UckGUaBBe9TwPhZZp8JMkKKvmr3bpeP88v4QgTjzYwrKN4TyB
   2X8U71NHeg/qzouoriZT8yhj6tNs2x+BG8LzRHRiQVRhWBp188wutV+1u
   1qy98m7zaCvFOcN9GyASa3A8IS96lOCDoQL5vlQPaMqwDc9NflPGkHKtm
   swUb4eaoOs588gRmv/wTDn7yYLBa+vIflcgUBv4akoO54ISwl6o5BMTjU
   g==;
X-CSE-ConnectionGUID: ysKIbRYCQoG/jBo2D1hlCQ==
X-CSE-MsgGUID: LhSQXTzTTKmWAxMPgw8C5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708335"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708335"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:12 -0700
X-CSE-ConnectionGUID: 3ANGd8e5S9W4NuJjisqYnw==
X-CSE-MsgGUID: QqoSnvSjRG20aoIcUe5l5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628698"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/12] ASoC: Intel: sof_sdw: add missing sof_sdw_rt_amp_init
 for Realtek multi-function codecs
Date: Thu, 11 Apr 2024 17:03:36 -0500
Message-Id: <20240411220347.131267-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WBMTZN4YQHLJRRPDXDEBNPDSKRKQJWAR
X-Message-ID-Hash: WBMTZN4YQHLJRRPDXDEBNPDSKRKQJWAR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBMTZN4YQHLJRRPDXDEBNPDSKRKQJWAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We do need "info->amp_num++;" for the speaker dai.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b94835448b1b..8a2cd19d8be6 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -737,6 +737,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_rt_amp_init,
+				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt712_spk_rtd_init,
 			},
 		},
@@ -912,6 +914,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				/* No feedback capability is provided by rt722-sdca codec driver*/
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_rt_amp_init,
+				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt722_spk_rtd_init,
 			},
 			{
-- 
2.40.1

