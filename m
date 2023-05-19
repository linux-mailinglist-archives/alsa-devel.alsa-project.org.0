Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F33FF7096EB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 13:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32D87209;
	Fri, 19 May 2023 13:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32D87209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684497408;
	bh=lobxPCKWfcsY0E/0K7qViyiItbMxfZAYDogS+Iul9ZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qs61P/N7C5J8oSyZkyFLGZtMbSm8vycqAOaIGkT/mLuPvmEBj6U/9t0TOg1eD45Jw
	 hie0ST6sjjEGTTk8lirky8nV4Rl8tr1LzEyzzrYZ2k0tHoQMXppu4tOdilNmHv9zXv
	 VK5yORtnOGFOMKBTi7mlbWZhSaiY7OSXONV/wWhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 767C5F80563; Fri, 19 May 2023 13:55:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F7FBF8016D;
	Fri, 19 May 2023 13:55:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FC2BF8053D; Fri, 19 May 2023 13:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33B34F80272
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 13:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33B34F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PUIq200n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684497301; x=1716033301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lobxPCKWfcsY0E/0K7qViyiItbMxfZAYDogS+Iul9ZM=;
  b=PUIq200nWpUuB6CidUX/14tKi1rnabjKz5W9c0Za5aAVQOGzvAZ/XcZF
   Z83EMsaE/D9Y9/p8gQHrsphUUG2orKc6ctk10HDvmJEJS3+3LrxI7ehFQ
   a0TPCHPNhy+LyG3OrFKdzsff5kt27ZPl6FHyU1D91yq6+sf6fwkwRpwl2
   JewzpIGiorX9d+m4NHX9/Z9B5IpwKgfdKr398pCMRCXoNBT06uv7SL4Us
   N9G2XjeKhna/t4KeEz741cWva27oLt9D9wB4aPFE+ZtxQ5S1OzEphYWKc
   vnqCvKNbliuBvdehSrmfly9aPeJ61YvORv3mpnX/2V0wH33Sqj2vQ3QIJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="336946034"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="336946034"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 04:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705593802"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="705593802"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 19 May 2023 04:54:56 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 2/5] ASoC: topology: Remove redundant logs
Date: Fri, 19 May 2023 21:56:08 +0200
Message-Id: <20230519195611.4068853-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PDOHZCGLUSZQ2NRG2NZQ2ZXVG25LXPVC
X-Message-ID-Hash: PDOHZCGLUSZQ2NRG2NZQ2ZXVG25LXPVC
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDOHZCGLUSZQ2NRG2NZQ2ZXVG25LXPVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_tplg_add_kcontrol() logs all the failures in detail already.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 242abbd875fa..b5c47b3c63ab 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -700,10 +700,8 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 
 	/* register control here */
 	ret = soc_tplg_add_kcontrol(tplg, &kc, &sbe->dobj.control.kcontrol);
-	if (ret < 0) {
-		dev_err(tplg->dev, "ASoC: failed to add %s\n", be->hdr.name);
+	if (ret < 0)
 		goto err;
-	}
 
 	list_add(&sbe->dobj.list, &tplg->comp->dobj_list);
 
@@ -783,10 +781,8 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 
 	/* register control here */
 	ret = soc_tplg_add_kcontrol(tplg, &kc, &sm->dobj.control.kcontrol);
-	if (ret < 0) {
-		dev_err(tplg->dev, "ASoC: failed to add %s\n", mc->hdr.name);
+	if (ret < 0)
 		goto err;
-	}
 
 	list_add(&sm->dobj.list, &tplg->comp->dobj_list);
 
@@ -950,10 +946,8 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 
 	/* register control here */
 	ret = soc_tplg_add_kcontrol(tplg, &kc, &se->dobj.control.kcontrol);
-	if (ret < 0) {
-		dev_err(tplg->dev, "ASoC: could not add kcontrol %s\n", ec->hdr.name);
+	if (ret < 0)
 		goto err;
-	}
 
 	list_add(&se->dobj.list, &tplg->comp->dobj_list);
 
-- 
2.34.1

