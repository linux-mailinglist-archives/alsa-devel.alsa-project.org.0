Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F18C1311
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:36:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D579EE65;
	Thu,  9 May 2024 18:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D579EE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272608;
	bh=pLIxy8IWSqSn67k2V4Oc3GgyAB0vlj0rr4NhmT8Wuxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eYl/ISx+2a+eCOO9xRf9a/HqwOH2pYn7IZowNW3umUCG2nOr4qO4NNm5uoAuQM3kR
	 ILA6wy8yAAEhhmJ5HlUEuIcUefVEz3hU7Jx+xqK4EC/CmSsF5UfFoAY1IKO1X0tg8M
	 fHlyMMdtwKJEwEn4i9epkbXEo8GbQ8nFmIXQ/59U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 583FFF8067C; Thu,  9 May 2024 18:35:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3872F8067B;
	Thu,  9 May 2024 18:35:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 169BCF80564; Thu,  9 May 2024 18:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4773F80570
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4773F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EgLlW04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272479; x=1746808479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pLIxy8IWSqSn67k2V4Oc3GgyAB0vlj0rr4NhmT8Wuxg=;
  b=EgLlW04S9luDmX8ZQ+X8qbJgY8UilXlqKA+fn6zQ/fNWXSyYaB1Bh1Se
   47soxVKVr/ge+2w6lvw5YNGDHOeKhrmKBUQ4o/8hcZK48OuKOhzTgZUSx
   gcBTrpAKosu+H+luLjxkDiTXQi5a0WRUgF0L/kQwTCCbR48wivvpVkFaP
   S4m/AQNhfSWxvWHScEUEM9CY1UYRXkmnRAh7FCYByAprFq1ncGAgKfWJp
   iGxPesVmULnSXPJu1fkBmRWXsUa92vBjI1uxN6Rpyq2v6UqjEtcdyt+n2
   2eNjicEWLzYEFiBvax2rdU2wYDbCn+zQOYX78fAWU7z0iHAlPT0CI/lrt
   g==;
X-CSE-ConnectionGUID: B/CLxXTWR8K0gWWExoz6pA==
X-CSE-MsgGUID: 1NWkXqB4QHmbx7Bwnl4ZsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017572"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017572"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:30 -0700
X-CSE-ConnectionGUID: JiEly/mhS1OcYkPsZBXJFQ==
X-CSE-MsgGUID: Qn0biBK5T+GReGgpoDmtuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33761024"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/18] ASoC: Intel: sof_nau8825: use max_98373_dai_link
 function
Date: Thu,  9 May 2024 11:34:09 -0500
Message-Id: <20240509163418.67746-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D4VLBRN6VHREU53UL2OJFYOMIZHVLUSM
X-Message-ID-Hash: D4VLBRN6VHREU53UL2OJFYOMIZHVLUSM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4VLBRN6VHREU53UL2OJFYOMIZHVLUSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use max_98373_dai_link() function to initialize dai link of maxim
max98373 speaker amplifier. No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index dd4dc4ec4255..c08b4eef0bcb 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -213,10 +213,7 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 		max_98360a_dai_link(ctx->amp_link);
 		break;
 	case CODEC_MAX98373:
-		ctx->amp_link->codecs = max_98373_components;
-		ctx->amp_link->num_codecs = ARRAY_SIZE(max_98373_components);
-		ctx->amp_link->init = max_98373_spk_codec_init;
-		ctx->amp_link->ops = &max_98373_ops;
+		max_98373_dai_link(dev, ctx->amp_link);
 		break;
 	case CODEC_NAU8318:
 		nau8318_set_dai_link(ctx->amp_link);
-- 
2.40.1

