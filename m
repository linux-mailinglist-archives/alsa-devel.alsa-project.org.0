Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2988B3B8E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 197BB218B;
	Fri, 26 Apr 2024 17:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 197BB218B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145508;
	bh=W9iY+W8Ir/bYUCAzgNoBK3HNcIWzj09vrJHQqaOdzIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lz3sC3ZZA1kXHo6mRpYh0reMXRL5M0YhKrFPZTCJ6TTFlJT7T+ZVVsTcpcRHtqbdC
	 UQs48C2O95J9e/jcDjP5aq+cEaAtedXQFSjQiV+VFsOLTAKdyBRxRMAFzK1fdHfUex
	 5lwTXspHqWqFdWurQWiWosjk4NM7yyBqSjGtvZqg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 111C0F896B8; Fri, 26 Apr 2024 17:26:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E3FF896DD;
	Fri, 26 Apr 2024 17:26:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A730EF805E7; Fri, 26 Apr 2024 17:26:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E903F80602
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E903F80602
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X4lHkvfe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145156; x=1745681156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W9iY+W8Ir/bYUCAzgNoBK3HNcIWzj09vrJHQqaOdzIQ=;
  b=X4lHkvfeZEbTpe0cgHxqT8UOjufClgipWL62QVTT2Dp+QfF1AsvGU5T1
   +M18L41XHSqK7OIrWpK5hcBjTyKPsojm6xS4jA3/7tON5FZhJU3Ju7ytA
   63w4KYEiMzjJAXiP+sz41N5JvWROSlE7lBocHW/iC8GYe+FYcYZu3LkcT
   Y7UxdnjC/phvWuatxP7fys9EiuH03lndeABDmF1Rm+o2Uph7kVxFjlQmg
   BZVmYWF8Qsg5zhyRj/g9wL6Dh2FTl/s0CHyHDm+dzwwXeZqRO6uPBnYrA
   S4yzes6zkBqLDKamlHEvnuSPZRGg3L2qOiqQJ09XJXM+blhXLY8ING32L
   A==;
X-CSE-ConnectionGUID: Ty9ld1MJR7+ZPtXyr91t7g==
X-CSE-MsgGUID: BC0EUrCNRAegPJcX7XcmkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291364"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291364"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:52 -0700
X-CSE-ConnectionGUID: obhoe3E6TOyfxx7y42g2zw==
X-CSE-MsgGUID: Ip9g5DBrTquF2CcsSodhRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259613"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/23] ASoC: Intel: sof-rt5682: setup pll_id only when needed
Date: Fri, 26 Apr 2024 10:25:27 -0500
Message-Id: <20240426152529.38345-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KRYNT6OBALJYLRQ2B4ITWBQQJ5U56L4L
X-Message-ID-Hash: KRYNT6OBALJYLRQ2B4ITWBQQJ5U56L4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRYNT6OBALJYLRQ2B4ITWBQQJ5U56L4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

The variable 'pll_id' is needed only when we use snd_soc_dai_set_pll()
to setup PLL. Move the code segment to improve some readability.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 58 ++++++++++++++---------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 668b1672f570..6a79dd5271cc 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -320,35 +320,6 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 		pll_in = params_rate(params) * 50;
 	}
 
-	switch (ctx->codec_type) {
-	case CODEC_RT5650:
-		pll_id = 0; /* not used in codec driver */
-		clk_id = RT5645_SCLK_S_PLL1;
-		break;
-	case CODEC_RT5682:
-		pll_id = RT5682_PLL1;
-		clk_id = RT5682_SCLK_S_PLL1;
-		break;
-	case CODEC_RT5682S:
-		/*
-		 * For MCLK = 24.576MHz and sample rate = 96KHz case, use PLL1  We don't test
-		 * pll_out or params_rate() here since rt5682s PLL2 doesn't support 24.576MHz
-		 * input, so we have no choice but to use PLL1. Besides, we will not use PLL at
-		 * all if pll_in == pll_out. ex, MCLK = 24.576Mhz and sample rate = 48KHz
-		 */
-		if (pll_in == 24576000) {
-			pll_id = RT5682S_PLL1;
-			clk_id = RT5682S_SCLK_S_PLL1;
-		} else {
-			pll_id = RT5682S_PLL2;
-			clk_id = RT5682S_SCLK_S_PLL2;
-		}
-		break;
-	default:
-		dev_err(rtd->dev, "invalid codec type %d\n", ctx->codec_type);
-		return -EINVAL;
-	}
-
 	pll_out = params_rate(params) * 512;
 
 	/* when MCLK is 512FS, no need to set PLL configuration additionally. */
@@ -369,6 +340,35 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 	} else {
+		switch (ctx->codec_type) {
+		case CODEC_RT5650:
+			pll_id = 0; /* not used in codec driver */
+			clk_id = RT5645_SCLK_S_PLL1;
+			break;
+		case CODEC_RT5682:
+			pll_id = RT5682_PLL1;
+			clk_id = RT5682_SCLK_S_PLL1;
+			break;
+		case CODEC_RT5682S:
+			/*
+			 * For MCLK = 24.576MHz and sample rate = 96KHz case, use PLL1  We don't test
+			 * pll_out or params_rate() here since rt5682s PLL2 doesn't support 24.576MHz
+			 * input, so we have no choice but to use PLL1. Besides, we will not use PLL at
+			 * all if pll_in == pll_out. ex, MCLK = 24.576Mhz and sample rate = 48KHz
+			 */
+			if (pll_in == 24576000) {
+				pll_id = RT5682S_PLL1;
+				clk_id = RT5682S_SCLK_S_PLL1;
+			} else {
+				pll_id = RT5682S_PLL2;
+				clk_id = RT5682S_SCLK_S_PLL2;
+			}
+			break;
+		default:
+			dev_err(rtd->dev, "invalid codec type %d\n", ctx->codec_type);
+			return -EINVAL;
+		}
+
 		/* Configure pll for codec */
 		ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source, pll_in,
 					  pll_out);
-- 
2.40.1

