Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6834921A4
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 09:52:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 454E917E2;
	Tue, 18 Jan 2022 09:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 454E917E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642495931;
	bh=cC3XuVvXXD+fsZF6jwIuA6G9YJFDScrDZZa8xh9Coc8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sRArJ9jHrtNPvZr96mrmTtBeihS0QhPtQZE1Rp9qJD5QSEOu3Xm/5w+SK0/KN+sea
	 w7A77PIbsy/CF0DVAYpnnGglNSM+xZ+nVU0ty89NJUkD5WqNSlaXxkvy1Uw4Vw8aQw
	 CJ3C2WhwmumEU/l7AceUzqiTnFA12iFO0wDLt14o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAA6BF80240;
	Tue, 18 Jan 2022 09:51:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF461F8023B; Tue, 18 Jan 2022 09:51:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A91DF800D8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 09:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A91DF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J3UEGAhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642495858; x=1674031858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cC3XuVvXXD+fsZF6jwIuA6G9YJFDScrDZZa8xh9Coc8=;
 b=J3UEGAhRPF3fsGJRgMm7xog5Yyu4zcS09bePolhMkaCpfVIUI4Njvzxi
 Nxzg/K0yuiFUFRx31oKFD0JucvQkOBW//v6WV7a+/P2FzpXQN55n5kU6N
 C3Pp5XqWPhPNbf2QshPTkeHJlhcYs4S28Y5F7hpsxy1N32elLpZjCXh1q
 xWxr2xmBV3hpOqBoGpIZbgPhIF9O3oIs4+tExhA/OFydDE+Zd6q/C6TEa
 LcBZpb5v+nVuQnNMcyHINv8bdG7jCd9hAwThjEsSgHIbIHAHhLBPS8iIe
 7VjzCLrERfm1KdisxhcRpsnEfrhtjrFtt+sp9osBf8nzJBJn1srDdXwCt w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="331119549"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="331119549"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 00:50:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="693319884"
Received: from macchian-builder.itwn.intel.com ([10.5.253.188])
 by orsmga005.jf.intel.com with ESMTP; 18 Jan 2022 00:50:51 -0800
From: Mac Chiang <mac.chiang@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: add 512FS MCLK clock configuration
Date: Tue, 18 Jan 2022 03:49:52 -0500
Message-Id: <20220118084952.9555-1-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, shumingf@realtek.com,
 brent.lu@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

codec system clock source support 512FS MCLK synchronous directly, so
no need to set PLL configuration when MCLK 24.576MHz.

Suggested-by: Shuming Fan <shumingf@realtek.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index bd6d2e7dea53..a6efffc14cad 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -61,7 +61,6 @@
 #define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(24)
 #define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(25)
 
-
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0);
@@ -362,6 +361,9 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 	if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT) {
 		pll_id = RT5682S_PLL2;
 		clk_id = RT5682S_SCLK_S_PLL2;
+
+		if (pll_in == 24576000)
+			clk_id = RT5682S_SCLK_S_MCLK;
 	} else {
 		pll_id = RT5682_PLL1;
 		clk_id = RT5682_SCLK_S_PLL1;
@@ -369,11 +371,14 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 
 	pll_out = params_rate(params) * 512;
 
-	/* Configure pll for codec */
-	ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source, pll_in,
-				  pll_out);
-	if (ret < 0)
-		dev_err(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
+	/* when MCLK is 512FS, no need to set PLL configuration additionally. */
+	if (pll_in != 24576000) {
+		/* Configure pll for codec */
+		ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source, pll_in,
+					  pll_out);
+		if (ret < 0)
+			dev_err(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
+	}
 
 	/* Configure sysclk for codec */
 	ret = snd_soc_dai_set_sysclk(codec_dai, clk_id,
-- 
2.20.1

