Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F258B3B7D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:30:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CBB5210F;
	Fri, 26 Apr 2024 17:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CBB5210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145440;
	bh=8xb9CTljEsAsammvjDjYTYN3LOKkRjHFFUmPijaKb2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Las1Al0PKp9xwykEymilklNTPkHeZ+/uB0kKPR9Sxv8hxkl0Jy6AS0gG7I8xYEHu4
	 od2WfLVDa2/S16Rw9qDXtVJs5b2KHPNkiR7ZFsm206gWlwBj35fMmJYhG8kjCxRywH
	 niQt6oC3UCPUvHKEYfn9wXNOQzMe2rNtuvhUToGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82C06F80C32; Fri, 26 Apr 2024 17:26:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9136F80C6F;
	Fri, 26 Apr 2024 17:26:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8D82F80696; Fri, 26 Apr 2024 17:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 495C2F805EB
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 495C2F805EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mbfb7Jzc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145154; x=1745681154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8xb9CTljEsAsammvjDjYTYN3LOKkRjHFFUmPijaKb2w=;
  b=mbfb7JzchT6Zx4y3KDA8AKfCosN2XPFnKkY6b9a/vo0wl5fK0NfmUGkJ
   /fUohn4gxFuIyUxfHDY/kUjHVQGhsOtuWayGhYhZN3FoHiF1Q4+/nkI6j
   /IMWZULpZCGclZfPZNtzFWVvcl1rDCgNlnTYX37OEqdfDLIlR+zkdVFBv
   SsZOzGcN48A2fxbUO6MjVzC9K4lGjQmeVIzs59GYndhRtwAxrETrJr1OV
   6HveBo+2M5f5uJE55Q58SfL+xFBmrqSvDusKpO7cT5Yr3y9QpBv1gL5ye
   SymvXumg/E3vHpOFLTCg4E73MwIz0pYKi/j6LYolngyme7plJPTEI3BzD
   A==;
X-CSE-ConnectionGUID: CpNSYfmPQS+b2v80XxfByg==
X-CSE-MsgGUID: dtWWX0tXTy+95Y/h9Ad/8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291348"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291348"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:50 -0700
X-CSE-ConnectionGUID: ydVepSTTRdKbktrdkQFcbg==
X-CSE-MsgGUID: Ph6QY0G4Sl+hIZeL177Nmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259598"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/23] ASoC: Intel: sof-rt5682: add mclk_en to
 sof_rt5682_private
Date: Fri, 26 Apr 2024 10:25:23 -0500
Message-Id: <20240426152529.38345-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P4PKGSWIRI5EA4CB6RGNWBENXNS3MVZK
X-Message-ID-Hash: P4PKGSWIRI5EA4CB6RGNWBENXNS3MVZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4PKGSWIRI5EA4CB6RGNWBENXNS3MVZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a variable mclk_en to sof_rt5682_private structure to reduce
global variable access. No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.h | 2 ++
 sound/soc/intel/boards/sof_rt5682.c        | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 644f6b4a1b7b..dfcc2c5c25cc 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -101,10 +101,12 @@ struct sof_da7219_private {
  *
  * @mclk: mclk clock data
  * @is_legacy_cpu: true for BYT/CHT boards
+ * @mclk_en: true for mclk pin is connected
  */
 struct sof_rt5682_private {
 	struct clk *mclk;
 	bool is_legacy_cpu;
+	bool mclk_en;
 };
 
 /*
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index efca7604040e..654c2428f625 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -165,7 +165,7 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int extra_jack_data;
 	int ret, mclk_freq;
 
-	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
+	if (ctx->rt5682.mclk_en) {
 		mclk_freq = sof_dai_get_mclk(rtd);
 		if (mclk_freq <= 0) {
 			dev_err(rtd->dev, "invalid mclk freq %d\n", mclk_freq);
@@ -278,7 +278,7 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
-	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
+	if (ctx->rt5682.mclk_en) {
 		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
 			ret = clk_prepare_enable(ctx->rt5682.mclk);
 			if (ret < 0) {
@@ -728,6 +728,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN)
+		ctx->rt5682.mclk_en = true;
+
 	/* need to get main clock from pmc */
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
 		ctx->rt5682.mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-- 
2.40.1

