Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10D8B3B83
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C03C1923;
	Fri, 26 Apr 2024 17:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C03C1923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145473;
	bh=VAgCgLZEmIjB0JFQL5pu1SrjXkf9g15d+++Tsl+Inyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e6+a4X7nRCixOysB40sLcU12cbGuZUmab5Cg3G0FU8/Yj/EaEoSJK1CU/jrgDybbm
	 4wA8XUXdymAtZb5mcEA26DI7jyZ+eXS6/Qi1CU2b5/51oQO97tTJfkkZ+LQooGxEtx
	 tVykH2QTwMXN1xIaarLdjnGRskGkA0XZDC4eVC3Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E740F80714; Fri, 26 Apr 2024 17:26:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D293F80CBA;
	Fri, 26 Apr 2024 17:26:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B26EFF806AD; Fri, 26 Apr 2024 17:26:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C7A2F805F3
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C7A2F805F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FXD3a6iH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145155; x=1745681155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VAgCgLZEmIjB0JFQL5pu1SrjXkf9g15d+++Tsl+Inyc=;
  b=FXD3a6iHPih6kQOKoUAECOtHTmOFPXvtNBScD/UfaZggDgxX3vK9jt6G
   gug9elOVRSit0iGJTiMAASvo8ky5oDTLyuDjTPddkSyJSzIpvEfMEv3Vc
   bKK5jz6mdVdFWfVvx3AjtmWjWOngOYVoIIBYtlqipt1R7+//9LHGYP+fb
   UJzhto2wQPPkQRTeiqZXmZA1DylPsti4HUEHPGD3AsduxVKAh4+LP++xV
   2wePwruDDWUPFe3tlNWCI8PumLx0v3oho2zYKu9tArSCrU7mh3yotYiFb
   O57Qk8QKVqX3k3tNjtK/MMS8zEKufnQA8aMo720ds/uRbThHr5V+D4+Qd
   Q==;
X-CSE-ConnectionGUID: ox12yP/uQuWgGv91GwHIeg==
X-CSE-MsgGUID: 04HLTGrjSouBOAHL18FDUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291352"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291352"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:50 -0700
X-CSE-ConnectionGUID: mhi7Z60CR7WpTssahVEpZw==
X-CSE-MsgGUID: usdiyUIYT7ew0C2ebxJouw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259602"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/23] ASoC: Intel: sof-rt5682: remove
 SOF_RT5682_MCLK_BYTCHT_EN
Date: Fri, 26 Apr 2024 10:25:24 -0500
Message-Id: <20240426152529.38345-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HTQAGIPTHEOQQ3H42S3WZQDNMDC5FB4U
X-Message-ID-Hash: HTQAGIPTHEOQQ3H42S3WZQDNMDC5FB4U
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

From: Brent Lu <brent.lu@intel.com>

We don't need this quirk flag since 'is_legacy_cpu' will be true if
this is a BYT/CHT board.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 39 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 654c2428f625..4c6dfe632edf 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -30,7 +30,6 @@
 
 /* Driver-specific board quirks: from bit 0 to 7 */
 #define SOF_RT5682_MCLK_EN			BIT(0)
-#define SOF_RT5682_MCLK_BYTCHT_EN		BIT(1)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -206,7 +205,7 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 			}
 		}
 
-		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
+		if (ctx->rt5682.is_legacy_cpu) {
 			/*
 			 * The firmware might enable the clock at
 			 * boot (this information may or may not
@@ -279,7 +278,7 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
 	if (ctx->rt5682.mclk_en) {
-		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
+		if (ctx->rt5682.is_legacy_cpu) {
 			ret = clk_prepare_enable(ctx->rt5682.mclk);
 			if (ret < 0) {
 				dev_err(rtd->dev,
@@ -661,7 +660,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 		/* default quirk for legacy cpu */
 		sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
-				   SOF_RT5682_MCLK_BYTCHT_EN |
 				   SOF_SSP_PORT_CODEC(2);
 	}
 
@@ -728,26 +726,27 @@ static int sof_audio_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN)
+	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
 		ctx->rt5682.mclk_en = true;
 
-	/* need to get main clock from pmc */
-	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
-		ctx->rt5682.mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-		if (IS_ERR(ctx->rt5682.mclk)) {
-			ret = PTR_ERR(ctx->rt5682.mclk);
+		/* need to get main clock from pmc */
+		if (ctx->rt5682.is_legacy_cpu) {
+			ctx->rt5682.mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
+			if (IS_ERR(ctx->rt5682.mclk)) {
+				ret = PTR_ERR(ctx->rt5682.mclk);
 
-			dev_err(&pdev->dev,
-				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
-				ret);
-			return ret;
-		}
+				dev_err(&pdev->dev,
+					"Failed to get MCLK from pmc_plt_clk_3: %d\n",
+					ret);
+				return ret;
+			}
 
-		ret = clk_prepare_enable(ctx->rt5682.mclk);
-		if (ret < 0) {
-			dev_err(&pdev->dev,
-				"could not configure MCLK state");
-			return ret;
+			ret = clk_prepare_enable(ctx->rt5682.mclk);
+			if (ret < 0) {
+				dev_err(&pdev->dev,
+					"could not configure MCLK state");
+				return ret;
+			}
 		}
 	}
 
-- 
2.40.1

