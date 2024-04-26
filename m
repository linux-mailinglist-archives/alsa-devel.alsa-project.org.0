Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C2B8B3B77
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:30:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A0C315FB;
	Fri, 26 Apr 2024 17:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A0C315FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145408;
	bh=0lJ6K+KsQ4YP7eBhNs9PYkoJzLuliipAbc+xTk5UWBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SZsWTrDDtnI4D7s/M0X/G27++o3Re3PM9YP3oh7E+J1FYLx+CI65JMXZQCSOeUe5l
	 FVQkoKbatylfKAGQK4QI7IOpZhwALoJ/6GvpTLLDrdKbS6DL4b8+Kn2prG2wXyoaxJ
	 56JG11pME0fluIGidmsJwMLC54QaPoGAZgWql9fo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC993F80856; Fri, 26 Apr 2024 17:26:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F8BF80852;
	Fri, 26 Apr 2024 17:26:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A15CAF80672; Fri, 26 Apr 2024 17:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68316F805C9
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68316F805C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J4Mre+nI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145153; x=1745681153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0lJ6K+KsQ4YP7eBhNs9PYkoJzLuliipAbc+xTk5UWBQ=;
  b=J4Mre+nIltAtiTbyEO0//rrg73twEHHc6sjLw2vaS9UPl53TbprMcBa3
   Z4pSBkLrlGjQNQ2l7a1zaBRmFtx5WbnCmW5HAdRcjS1wVIMqdXXzypCxc
   JA1bxex8Nm/5M3/52kP8kY9Z7Tvs41pevMCLMCVA47D1RFXF5/oWPAn3r
   kSwIm1dctVbz4Fz6XRhokgB4wJ/yAxyV1uyimSgpufcC7DXvGC9DttRCw
   3c/HXDOd9SqcGvpX6MmTR1QCXdW8xCeGSGzqx1lZf6aCZvh6GM8xT7FrI
   H3kVJaUaJMAwGzxXendoInl70ptObg8fGyTJkptsD3F96fOs5HJj+N5e9
   g==;
X-CSE-ConnectionGUID: 0g4yyaneRJa3GXbpRGZq2w==
X-CSE-MsgGUID: TsEKmLduQzG+92O3jUSzXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291339"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291339"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:48 -0700
X-CSE-ConnectionGUID: nvC1Jzk0TsWGrkheGdkyfQ==
X-CSE-MsgGUID: TiKvQZ5CSwOS/oROQRgHEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259590"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/23] ASoC: Intel: sof_rt5682: support MAX98357A on glk
 boards
Date: Fri, 26 Apr 2024 10:25:21 -0500
Message-Id: <20240426152529.38345-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6TJEAUIJLEP5BVFXU4VGZSJ4SEP4KOW
X-Message-ID-Hash: Q6TJEAUIJLEP5BVFXU4VGZSJ4SEP4KOW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6TJEAUIJLEP5BVFXU4VGZSJ4SEP4KOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

For glk boards, MAX98357A speaker amplifier is supported by machine
driver glk_rt5682_mx98357a with sound card name glkrt5682max. Use same
name for backward compatibility with existing devices on market.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 80ecf31c936a..efca7604040e 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -698,6 +698,20 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 		/* overwrite the DAI link order for GLK boards */
 		ctx->link_order_overwrite = GLK_LINK_ORDER;
+
+		/* backward-compatible with existing devices */
+		switch (ctx->amp_type) {
+		case CODEC_MAX98357A:
+			card_name = devm_kstrdup(&pdev->dev, "glkrt5682max",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			sof_audio_card_rt5682.name = card_name;
+			break;
+		default:
+			break;
+		}
 	} else if (soc_intel_is_cml()) {
 		/* backward-compatible with existing devices */
 		switch (ctx->amp_type) {
-- 
2.40.1

