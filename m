Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD476D238
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76E656C0;
	Wed,  2 Aug 2023 17:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76E656C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990731;
	bh=9zcvg//WylNXc9U6cfVGksjHJOsyWWYtGl8IYeYbxco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cgw9IWs4XQQqQSrn8lfVY9YAaPMv2KU/WG4h13HeFHRrKf+PJX1fOrXL4cQf66gxN
	 VWVudEcJ1GZP/kqajD6bnGT63bQDyK87oo097px8EZk+DLiLx4j5DRSxr3sbtvP6Pq
	 6TvC18dD5YcOYYx68u0JSnCwvsqtsfMzZec4bIco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64A4CF8057D; Wed,  2 Aug 2023 17:37:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D97F80570;
	Wed,  2 Aug 2023 17:37:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 672D8F80558; Wed,  2 Aug 2023 17:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D348F8025A
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D348F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EIG6cs08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990617; x=1722526617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9zcvg//WylNXc9U6cfVGksjHJOsyWWYtGl8IYeYbxco=;
  b=EIG6cs08JvdSXhhim61/Fd/J1hk+mpi3e429anGxWzTuODEE2S+8ZEXl
   TR0l9xj1MpTCc2Sjir+plWnlOlwjm4StFPHy+gx97Ke2G+uJ/TJ9JWlno
   RrkFeKrJtoHst3jpVcPmZX39qWAb2IpVy4Ao7v5w3iGIsF9nbbsNJOOrq
   slL6KGgvw+qmJi0Sk0mzCVb8Fq8j+wZPHvzzFLvDeAHat9y4KzzSuSJRQ
   BOvu1j2JU4cXfSRLs/S2YV17yzXVgaclrnsoj/Rh0ss5VccAe0UObnsYI
   5AOo/x399CXuixiSrpDw47DDlYhDx5k34kZm5ldDa65TTku4JflyMMQ+/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350731"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350731"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722886918"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722886918"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 01/16] ASoC: SoundWire codecs: return error status in probe
Date: Wed,  2 Aug 2023 10:36:14 -0500
Message-Id: <20230802153629.53576-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5RAPKSUJCRVZPQGMK6SHMJWFVCKA4CNK
X-Message-ID-Hash: 5RAPKSUJCRVZPQGMK6SHMJWFVCKA4CNK
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5RAPKSUJCRVZPQGMK6SHMJWFVCKA4CNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason the first batch of SoundWire codec drivers squelch
errors in the SoundWire probe callback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt1308-sdw.c | 4 +---
 sound/soc/codecs/rt5682-sdw.c | 4 +---
 sound/soc/codecs/rt700-sdw.c  | 4 +---
 sound/soc/codecs/rt711-sdw.c  | 4 +---
 sound/soc/codecs/rt715-sdw.c  | 4 +---
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index f43520ca3187..a7740549d35c 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -715,9 +715,7 @@ static int rt1308_sdw_probe(struct sdw_slave *slave,
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	rt1308_sdw_init(&slave->dev, regmap, slave);
-
-	return 0;
+	return rt1308_sdw_init(&slave->dev, regmap, slave);
 }
 
 static int rt1308_sdw_remove(struct sdw_slave *slave)
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 4968a8c0064d..7d53dd62ce17 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -674,9 +674,7 @@ static int rt5682_sdw_probe(struct sdw_slave *slave,
 	if (IS_ERR(regmap))
 		return -EINVAL;
 
-	rt5682_sdw_init(&slave->dev, regmap, slave);
-
-	return 0;
+	return rt5682_sdw_init(&slave->dev, regmap, slave);
 }
 
 static int rt5682_sdw_remove(struct sdw_slave *slave)
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 8b28e47775cc..53e7973e0bf9 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -452,9 +452,7 @@ static int rt700_sdw_probe(struct sdw_slave *slave,
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	rt700_init(&slave->dev, sdw_regmap, regmap, slave);
-
-	return 0;
+	return rt700_init(&slave->dev, sdw_regmap, regmap, slave);
 }
 
 static int rt700_sdw_remove(struct sdw_slave *slave)
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 33dced388f9e..530d1ae32c04 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -453,9 +453,7 @@ static int rt711_sdw_probe(struct sdw_slave *slave,
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	rt711_init(&slave->dev, sdw_regmap, regmap, slave);
-
-	return 0;
+	return rt711_init(&slave->dev, sdw_regmap, regmap, slave);
 }
 
 static int rt711_sdw_remove(struct sdw_slave *slave)
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 6db87442b783..d09b3061096d 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -508,9 +508,7 @@ static int rt715_sdw_probe(struct sdw_slave *slave,
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	rt715_init(&slave->dev, sdw_regmap, regmap, slave);
-
-	return 0;
+	return rt715_init(&slave->dev, sdw_regmap, regmap, slave);
 }
 
 static int rt715_sdw_remove(struct sdw_slave *slave)
-- 
2.39.2

