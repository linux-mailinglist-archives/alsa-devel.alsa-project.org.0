Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BFD8A21C2
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 401B32BE8;
	Fri, 12 Apr 2024 00:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 401B32BE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874803;
	bh=9Qw2Cq3PH55dtnROwvZO0TlbYZU94NAm34n3h9nv0S4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hOH7NXAoCaV3qxukOvDuKOZ8vmiD9INp0yxvNG0jBqMPR1UzXp/htC/CxFdpOVe5K
	 y8u7iC54otZriROIOaw1WBdcmpBo48ih2rOO+6X/RZA0XJRhEXqHw+yBIwXOIw1HQB
	 GFx0vOGyQvqJ/zBCsGQx1BxnrgG7xTjp8DgkHJy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A08EF8063B; Fri, 12 Apr 2024 00:31:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7493F80649;
	Fri, 12 Apr 2024 00:31:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA4ECF80236; Fri, 12 Apr 2024 00:16:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B348DF8057A
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B348DF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KNgn2pfN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873071; x=1744409071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Qw2Cq3PH55dtnROwvZO0TlbYZU94NAm34n3h9nv0S4=;
  b=KNgn2pfNEvAQB3Uab3RPCV8Ws0DuMcbYC+JK1yE5IfKXvA7kikiBcx1U
   x8wrG6iKWFXy2mx33d8WdFXFsi4qpjWI8uCbld+AE0jQmGH7vtRsDT+3/
   jZ8TC6BS8TF20MC3uLQS+DN6qneobrzBPNBSIRSkKfa81DQi3XL84oX9I
   c5rb8aad3fQ+YJOafNoHiwPWcpE9TIuY1WEcdmjy5xeioivrSHDoYZ50z
   FFbRfh9xBpb92wc0IsTCGfgAQZrMvN9xDiY0gsfj6cs0L3IFJ4VLkbVJM
   r50NbLIV5TqMhHCKNKA29+VmeQ1VTqa2a7dpNn2HkeE/hvHIFpxeo+5vT
   A==;
X-CSE-ConnectionGUID: KDWJtEVGQAOZeLYpYP2Jcw==
X-CSE-MsgGUID: 0gUCjU0tSYGC0hIUyllN7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708392"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:21 -0700
X-CSE-ConnectionGUID: K1q6XdaETSSlw34hX7IWuw==
X-CSE-MsgGUID: qAbqon27QxWe1zxH34SteQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628770"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/12] ASoC: Intel: sof_rt5682: use RT5682S_PLL1 if needed
Date: Thu, 11 Apr 2024 17:03:47 -0500
Message-Id: <20240411220347.131267-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G5FG3GYZP7CQCUU5H34KUQYJOJOOQP7D
X-Message-ID-Hash: G5FG3GYZP7CQCUU5H34KUQYJOJOOQP7D
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

When 96KHz sample rate is used, and MCLK is 24.576MHz, we will need
pll_in = 24576000 and pll_out = 49152000 which is not supported by
RT5682S_PLL2. Use RT5682S_PLL1 in this case.
We don't test sample rate because RT5682S_PLL2 doesn't support 24.576MHz
input and in the MCLK = 24.576MHz, sample rate = 48KHz case, i.e.
pll_in == pll_out, PLL will not be used at all.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 735e07ea62bd..062012de3de2 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -340,8 +340,19 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 		clk_id = RT5682_SCLK_S_PLL1;
 		break;
 	case CODEC_RT5682S:
-		pll_id = RT5682S_PLL2;
-		clk_id = RT5682S_SCLK_S_PLL2;
+		/*
+		 * For MCLK = 24.576MHz and sample rate = 96KHz case, use PLL1  We don't test
+		 * pll_out or params_rate() here since rt5682s PLL2 doesn't support 24.576MHz
+		 * input, so we have no choice but to use PLL1. Besides, we will not use PLL at
+		 * all if pll_in == pll_out. ex, MCLK = 24.576Mhz and sample rate = 48KHz
+		 */
+		if (pll_in == 24576000) {
+			pll_id = RT5682S_PLL1;
+			clk_id = RT5682S_SCLK_S_PLL1;
+		} else {
+			pll_id = RT5682S_PLL2;
+			clk_id = RT5682S_SCLK_S_PLL2;
+		}
 		break;
 	default:
 		dev_err(rtd->dev, "invalid codec type %d\n", ctx->codec_type);
-- 
2.40.1

