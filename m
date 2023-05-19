Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7822C7096F1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 13:57:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF9B5200;
	Fri, 19 May 2023 13:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF9B5200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684497455;
	bh=ZaZVVwu0Td0cLklbKrANj9tQeRb/0u72Qu93yS6nUpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=buOuOmeIUQLLyxt9P9seA+HSxU27FHCWMbe8KHAgMw2MxO+eYs43ZJ2o57vgfTtwn
	 10MzCFUEtvRQqWux8Rg01Y3HgSEcMBTUKkNGHahiHRocA6us0DbBAVDhIJF7cZNS35
	 JzxobqEOvw8tLcu4tVFVZR+z/jwqi/HOXl5F4w4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FF57F805AE; Fri, 19 May 2023 13:55:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD37AF8058C;
	Fri, 19 May 2023 13:55:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9D49F80557; Fri, 19 May 2023 13:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAEB9F80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 13:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAEB9F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jcyi2Hsz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684497306; x=1716033306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZaZVVwu0Td0cLklbKrANj9tQeRb/0u72Qu93yS6nUpI=;
  b=Jcyi2HszzaAgkYbKkkAIbrwZ7oZVs58S8cYUaNLL4dbmE5a3z4LQPF5l
   0Wcz9n2HNYaZ9HfMTS70efM0yeReOU2bfewedo9KMiIPVVSifwAgpaKzx
   dKtBcMMAxKDDpF98062XiKntnnbhw1OsA214uFEQLraU79FQvBUiHu6YG
   6fwc7wiCiSh3oc05JLevF3ovLT67qPgtPgDPyhy8jhNvAvTz7adndxzWQ
   1qVFaiGL4btosaIuJXNFehFRXBJzUQpioG5qSYEPML3ekd1jXJebCc2MB
   zXh8DgR+jQEJkEKSGEkrUzNTpogtRS0hlE1DTQkTm59Jcah3Y9SgDNBpn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="336946056"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="336946056"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 04:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705593837"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="705593837"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 19 May 2023 04:55:02 -0700
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
Subject: [PATCH 5/5] ASoC: topology: Remove redundant log
Date: Fri, 19 May 2023 21:56:11 +0200
Message-Id: <20230519195611.4068853-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UK2OKY46ELVLBYMM5RJ3M7NZHD35CZI6
X-Message-ID-Hash: UK2OKY46ELVLBYMM5RJ3M7NZHD35CZI6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UK2OKY46ELVLBYMM5RJ3M7NZHD35CZI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_tplg_valid_header() logs all the failures in detail already.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 9bb4c6d2a2c9..20fd46a41cbb 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2486,11 +2486,8 @@ static int soc_tplg_process_headers(struct soc_tplg *tplg)
 
 			/* make sure header is valid before loading */
 			ret = soc_tplg_valid_header(tplg, hdr);
-			if (ret < 0) {
-				dev_err(tplg->dev,
-					"ASoC: topology: invalid header: %d\n", ret);
+			if (ret < 0)
 				return ret;
-			}
 
 			/* load the header object */
 			ret = soc_tplg_load_header(tplg, hdr);
-- 
2.34.1

