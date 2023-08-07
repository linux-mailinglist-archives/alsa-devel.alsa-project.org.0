Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 969957730F1
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B100843;
	Mon,  7 Aug 2023 23:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B100843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442732;
	bh=kkjD2YgcnPb/YGquupC0278X5ncJUVKhKIpM50C7Xk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gRiDedY9UB2ddJUDKCftomNzSDIk5S3xAp5Kow30Mw2ACiZjELd3sJ+RugGIuEmdX
	 JyOtMirp4SxHDhpYkop4wbAatT/FF5k65m/4MA5eeYXpyEgo9/mQGEjhybQdBGBCcV
	 tIqjjiEYvZNUuvEMAquj2QaJysrRW3h9z6pQLU38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4621EF8056F; Mon,  7 Aug 2023 23:10:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9841F8056F;
	Mon,  7 Aug 2023 23:10:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB158F80558; Mon,  7 Aug 2023 23:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 859DDF80116
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 859DDF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eVBniyQZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442617; x=1722978617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kkjD2YgcnPb/YGquupC0278X5ncJUVKhKIpM50C7Xk8=;
  b=eVBniyQZhc7WW5k4mYp1zQXlLHwaStBWjcItXf/LMRifhZAtbKhW1ZsZ
   lxLs0KWReCQX3U7HohnJnDCE9GYqqvwyy6NkDUEOVV2Z3XKvAtBKyBaVG
   A3mUK4yrRxe0/M7A/cpXTod/IvXMaeL1fsShJ3Inup0JRRNA0Ir8MDMRB
   1UCxAFZAodqkkSeZjUlGSUuYaYf3o4jNPQ/cQCcVjSZmeSD42xDJZfIYm
   k5lBoJkj36DJnMx3FScFL/VaOGH6PvWaeAJjWYEuUQz5nA0K+G+LJZrFT
   lvcgtfRZz2VcW0fSOnr7tBB3QSp6tPBduu6rF1/9f1onG5w1Yu5tkTn3j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244306"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244306"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465164"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465164"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 02/20] ASoC: SOF: Intel: fix u16/32 confusion in LSDIID
Date: Mon,  7 Aug 2023 16:09:41 -0500
Message-Id: <20230807210959.506849-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B2DQLM2UPXSQYBJOLJZELZHEYQRHTFBH
X-Message-ID-Hash: B2DQLM2UPXSQYBJOLJZELZHEYQRHTFBH
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Likely a combination of copy-paste and test coverage problem. Oops.

Fixes: 87a6ddc0cf1c ("ASoC: SOF: Intel: hda-mlink: program SoundWire LSDIID registers")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index acad3ea2f471..df87b3791c23 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -331,14 +331,14 @@ static bool hdaml_link_check_cmdsync(u32 __iomem *lsync, u32 cmdsync_mask)
 	return !!(val & cmdsync_mask);
 }
 
-static void hdaml_link_set_lsdiid(u32 __iomem *lsdiid, int dev_num)
+static void hdaml_link_set_lsdiid(u16 __iomem *lsdiid, int dev_num)
 {
-	u32 val;
+	u16 val;
 
-	val = readl(lsdiid);
+	val = readw(lsdiid);
 	val |= BIT(dev_num);
 
-	writel(val, lsdiid);
+	writew(val, lsdiid);
 }
 
 static void hdaml_shim_map_stream_ch(u16 __iomem *pcmsycm, int lchan, int hchan,
-- 
2.39.2

