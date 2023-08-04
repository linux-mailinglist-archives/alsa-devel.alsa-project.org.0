Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7832F76F857
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 05:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EC047F4;
	Fri,  4 Aug 2023 05:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EC047F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691119272;
	bh=KMopAtCn67fdLSnPvCGkPIrhm4B/qxG9zoA1XjL7/xA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jbL04WOeHNCvHNkHje4X+B4v/YmxzF5x+KQF13LGbYq1lQquuKbNq3ovm/iks1oJG
	 DD9bzUrap5vS9pMnkW+1aMU+6+R9Rw2foTZfV1sDsFOSFMCdy1Aaea37rAnT7QcAEV
	 NX9k4pQ6MzOPORDVzr9pa0lrVfvg0v5RoVDfQBsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79BF6F8053B; Fri,  4 Aug 2023 05:20:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80BACF801D5;
	Fri,  4 Aug 2023 05:19:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC031F8025A; Fri,  4 Aug 2023 05:19:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 569F6F8015B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 05:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 569F6F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OoIgh32l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691119180; x=1722655180;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KMopAtCn67fdLSnPvCGkPIrhm4B/qxG9zoA1XjL7/xA=;
  b=OoIgh32lQx55tW53tNktOVAch8WtmQBj5N3A7UZBkC5zsTYpfkoYbuqW
   kQPGGDmqSCFSkemy7lodo7HIkAdoEKHvaqxsTIb/EOBiIClLvmE9+7cd0
   HWtKcXFazuqI5D595pxYa6anqLhECKLhUF0T4pSgvv6airKh4yEFyxjVj
   wsCaw0zCqZS6R75UpNcOIS2SIF/GaxgFP7Ds8NWjH+i7Aib5keLcARoM3
   GRzkfvdEAB1LCSD+D/PEkH/G8ItyPO8WtWbubtTwlfB0SQhFrJDCXMADQ
   sXb19NS55D9mMw2oI145b3c54wb1tC6NPrO4qpm/kwiCYGeJdIeuk+3oK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350357686"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200";
   d="scan'208";a="350357686"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 20:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="759368739"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200";
   d="scan'208";a="759368739"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 20:19:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] ASoC: max98363: don't return on success reading revision ID
Date: Fri,  4 Aug 2023 11:47:34 +0800
Message-Id: <20230804034734.3848227-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YOMH5GMRG6ZHAG4REPE66JSQTVFJOGAA
X-Message-ID-Hash: YOMH5GMRG6ZHAG4REPE66JSQTVFJOGAA
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOMH5GMRG6ZHAG4REPE66JSQTVFJOGAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

max98363_io_init needs to keep going when we read revision ID
successfully.

Fixes: 18c0af945fa3 ("ASoC: max98363: add soundwire amplifier driver")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/codecs/max98363.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index b5c69bba0e48..2dfaf4fcfbd3 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -185,10 +185,10 @@ static int max98363_io_init(struct sdw_slave *slave)
 	pm_runtime_get_noresume(dev);
 
 	ret = regmap_read(max98363->regmap, MAX98363_R21FF_REV_ID, &reg);
-	if (!ret) {
+	if (!ret)
 		dev_info(dev, "Revision ID: %X\n", reg);
-		return ret;
-	}
+	else
+		goto out;
 
 	if (max98363->first_hw_init) {
 		regcache_cache_bypass(max98363->regmap, false);
@@ -198,10 +198,11 @@ static int max98363_io_init(struct sdw_slave *slave)
 	max98363->first_hw_init = true;
 	max98363->hw_init = true;
 
+out:
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
-	return 0;
+	return ret;
 }
 
 #define MAX98363_RATES SNDRV_PCM_RATE_8000_192000
-- 
2.25.1

