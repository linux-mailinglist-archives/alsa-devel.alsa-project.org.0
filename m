Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0483B8B3B3E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:24:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AFDCE8E;
	Fri, 26 Apr 2024 17:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AFDCE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145068;
	bh=B+qnbfKGxF53UUuVHpaWIUfNY181CpLVuoKVGa7skpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QPETnsLl7WI5zJrkBrcSrwBxEgGucrwZj7LZ1fHjpUJPxV0MfIhW5aUVFzFiSbXKQ
	 dLsMrsCOWGTR3Ic3SOxe1u8eXjJwQ3zWtiIRIo1rk6GuuZVnJ8a5ZsUd7gJ7L/yyJS
	 nOl7wcpYmiTpyKEM/eaB441h0Mym7hCoXSawtkeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3B25F806AD; Fri, 26 Apr 2024 17:22:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03A4DF806BB;
	Fri, 26 Apr 2024 17:22:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E173F805BE; Fri, 26 Apr 2024 17:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A947F80568
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A947F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YrrJFCfv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144910; x=1745680910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B+qnbfKGxF53UUuVHpaWIUfNY181CpLVuoKVGa7skpQ=;
  b=YrrJFCfvKHMtoGgrOnBjMlJdpRBg4VH7m+UzBRneOEE2IcE0gsqxlgy4
   xFBWEnWipkIcZ2N11tTjrEg6fRE+Q17Xp1vx19BHMZ296VTPqwytvt6Lb
   yux6a2SdISe4rRcmmRF3hg8axVhMV6qMufuNCYHVBR15b4ICJiTLT5Y45
   NqsXjiNY2sU4mT0BXWxfoVa0Kco3aXyDQEHx+vin8HNQvfmODj4KBIM8D
   wlcfgH4oMTwavFaJeRYmIKdsEAZlZSIRfzhdk80aHslHXOcKOWYgT2ZTA
   NFlgHbX7YVxSUoghz21AGQLw6xuycz+ouL3aBm+RDqDy2DQ8vFf4nIwYy
   Q==;
X-CSE-ConnectionGUID: 2VIFY8DFTLylaWnwQGFIMQ==
X-CSE-MsgGUID: NoNaLTcPTcqpsnyGsJjIYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290632"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:44 -0700
X-CSE-ConnectionGUID: Qp10kG6pT8yVpCgnhl65ig==
X-CSE-MsgGUID: U/5AsQU4SDu6nu5qMrIOmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259033"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/12] ASoC: Intel: sof_sdw: add a space before cfg-amp in
 components
Date: Fri, 26 Apr 2024 10:21:19 -0500
Message-Id: <20240426152123.36284-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KLCLCYKTEJ6QDEZIAR5I723V3OKOBRH3
X-Message-ID-Hash: KLCLCYKTEJ6QDEZIAR5I723V3OKOBRH3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLCLCYKTEJ6QDEZIAR5I723V3OKOBRH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

UCM parse amp with Regex " cfg-amp:([0-9]+)". The "ASoC: Intel: sof_sdw:
remove FOUR_SPEAKER quirks" patch removed "cfg-spk:%d " from components
which removed the necessary space as well and cause UCM can't parse the
amp number properly.

Fixes: 744866d28fe6 ("ASoC: Intel: sof_sdw: remove FOUR_SPEAKER quirks")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b9a5fcb42847..f0622aa1b748 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1983,7 +1983,7 @@ static int mc_probe(struct platform_device *pdev)
 		amp_num += codec_info_list[i].amp_num;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "cfg-amp:%d", amp_num);
+					  " cfg-amp:%d", amp_num);
 	if (!card->components)
 		return -ENOMEM;
 
-- 
2.40.1

