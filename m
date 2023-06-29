Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEDC7424CD
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:10:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFFFD845;
	Thu, 29 Jun 2023 13:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFFFD845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688037029;
	bh=XvI3xXcqB64eE96w9YN9pF7lOIpn0f0azKVPycgVQ/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B7rlu0LquIEOBvKTqsKh2g1fnj06+WRwXzxNg21Jl0CIQ5nYzL9iGsCw9n7Y2/1zE
	 lrYFEyl0WEYBdceEAEKqUGj7HicmKcKwQ+cJE4T4/0KU+T5bJoasOusBqbb6Kh8B4i
	 J/9wu1YodXGtwgtnTJV+HjL6e27c06QtXNxXoo/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAEE0F805D8; Thu, 29 Jun 2023 13:07:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D639F805D4;
	Thu, 29 Jun 2023 13:07:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B3E7F80589; Thu, 29 Jun 2023 13:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21E30F8057B
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E30F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y2iD+Rkp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688036835; x=1719572835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XvI3xXcqB64eE96w9YN9pF7lOIpn0f0azKVPycgVQ/0=;
  b=Y2iD+Rkp2CzqCFmmGmkWtaHS+mzyWlJBkIikLTG4EeqaEpB2NeMZBEUC
   BCEX4uNY66F2pAbKVt7dUhzPcGl9R7YL0YX1P+HfFP88qUxTyd1KkK8ZC
   Zrr0pYEh6RDztjOvGpdIIME7EYVv01o1+0mAAOvEXwgQq+ct314CLwIPg
   zC4nOktTsq2eeOUI96nkkTx94lo084yD/A1wSNHy5oztURoJ7EcINtNrL
   a0eLZsiFQVVEL24dsom5hfXLcDcis1rjrmpU9EWjmDNSvf/Qi6oGLBRHd
   oOF9pgNIBOLO8coGwcg3ihvQbpKCPyBYLWN9IaC91D+yw11Eqv6rfPeuP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365543671"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="365543671"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 04:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047732754"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="1047732754"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 04:07:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	zhuning@everest-semi.com,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 8/8] ASoC: Intel: avs: rt5682: Tidy up hw_params()
Date: Thu, 29 Jun 2023 13:24:49 +0200
Message-Id: <20230629112449.1755928-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230629112449.1755928-1-cezary.rojewski@intel.com>
References: <20230629112449.1755928-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GZKC6X4YPAQIITJKU2VMRHNFG2HJ5IAT
X-Message-ID-Hash: GZKC6X4YPAQIITJKU2VMRHNFG2HJ5IAT
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZKC6X4YPAQIITJKU2VMRHNFG2HJ5IAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To improve readability, reword several local variables to better match
their counterparts in declarations of soc-dai.h. For similar reasons,
wording for few comments is streamlined while redundant comments are
removed.

No functional changes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/rt5682.c | 35 +++++++++++++----------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index bd0902bb5a37..b93468ae0977 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -145,39 +145,36 @@ avs_rt5682_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_para
 {
 	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
-	int clk_id, clk_freq;
-	int pll_out, ret;
+	int pll_source, freq_in, freq_out;
+	int ret;
 
 	if (avs_rt5682_quirk & AVS_RT5682_MCLK_EN) {
-		clk_id = RT5682_PLL1_S_MCLK;
+		pll_source = RT5682_PLL1_S_MCLK;
 		if (avs_rt5682_quirk & AVS_RT5682_MCLK_24MHZ)
-			clk_freq = 24000000;
+			freq_in = 24000000;
 		else
-			clk_freq = 19200000;
+			freq_in = 19200000;
 	} else {
-		clk_id = RT5682_PLL1_S_BCLK1;
-		clk_freq = params_rate(params) * 50;
+		pll_source = RT5682_PLL1_S_BCLK1;
+		freq_in = params_rate(params) * 50;
 	}
 
-	pll_out = params_rate(params) * 512;
+	freq_out = params_rate(params) * 512;
 
-	ret = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1, pll_source, freq_in, freq_out);
 	if (ret < 0)
-		dev_err(runtime->dev, "snd_soc_dai_set_pll err = %d\n", ret);
+		dev_err(runtime->dev, "Set PLL failed: %d\n", ret);
 
-	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1, pll_out, SND_SOC_CLOCK_IN);
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1, freq_out, SND_SOC_CLOCK_IN);
 	if (ret < 0)
-		dev_err(runtime->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+		dev_err(runtime->dev, "Set sysclk failed: %d\n", ret);
 
-	/* slot_width should equal or large than data length, set them be the same */
+	/* slot_width should be equal or larger than data length. */
 	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x0, 0x0, 2, params_width(params));
-	if (ret < 0) {
-		dev_err(runtime->dev, "set TDM slot err:%d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		dev_err(runtime->dev, "Set TDM slot failed: %d\n", ret);
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_ops avs_rt5682_ops = {
-- 
2.25.1

