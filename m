Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B54C832AC55
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:36:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46E7E19FD;
	Tue,  2 Mar 2021 22:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46E7E19FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720984;
	bh=uW1LMlV7iQTVtexkWuUHbpGOnRf5yNNEFq9POn6+7Jo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=neSET6yJoy5eh9ivMnEo3M2lffNdEyFEMvvAYUhkQzPY+fOELaLimiKa/ViNzrfLi
	 V6reoTjzFuGlSzp1wPdaYBd/TD38+okTImhJMe7hy91M4uWqloYE5hOgnqFdrPwtWv
	 XtdVjLKN2V+yNhjx3LyS6UGYwAOsuqGLCmlEN/N0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E0ACF8055A;
	Tue,  2 Mar 2021 22:26:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94194F8052E; Tue,  2 Mar 2021 22:26:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4A63F804D1
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4A63F804D1
IronPort-SDR: qSGJcAnflutKmPO9t/1Qqfwv40tpXBaEa+FQHIsCbAZDvqsCnRNPWyLNZ8mpTgI12M6q2bX/xl
 QOMIdbYffB/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174631453"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174631453"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:17 -0800
IronPort-SDR: pC9NKtUICHh4s6qodHufeA2cQjkaWUPwgZSGCuHlh+bWzgDtCE3g7QpHfXZp/K1CHCjtYTxFtV
 iCLbrckwha9A==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223494"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:16 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 24/24] ASoC: rt5682: remove useless initialization
Date: Tue,  2 Mar 2021 15:25:27 -0600
Message-Id: <20210302212527.55158-25-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
References: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

cppcheck complains about a possible null pointer dereference, but the
problem is rather an useless initialization before walking through a
list.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 8d5b8f01f55c..559dc6db1f7c 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2751,7 +2751,7 @@ static int rt5682_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
 	struct snd_soc_component *component = rt5682->component;
-	struct snd_soc_dai *dai = NULL;
+	struct snd_soc_dai *dai;
 	unsigned long factor;
 
 	if (!rt5682_clk_check(rt5682))
-- 
2.25.1

