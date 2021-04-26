Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CC936BB5B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 23:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E187E16F3;
	Mon, 26 Apr 2021 23:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E187E16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619473799;
	bh=K3cgBOQTDUw8//vKPX4LptHpXvZFRNpYTFB5jZYxNS4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=std+XsJpbSuW84Tg85r7EnM4GBgit/ZpNxc6L8UjhTAUBprQVcCTLhgSl72NuA5QO
	 A/nS/ASGEbj9B00QcXTn1HX58dxBtmqGffgra795WV9M2TFeLcIf7tuQn5+2tWgvPR
	 vH71we+9PJ3mcrvky0iQYH/2sElWY2/SosOITtok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2D34F80430;
	Mon, 26 Apr 2021 23:47:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F45AF80423; Mon, 26 Apr 2021 23:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C32FF8016C
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 23:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C32FF8016C
IronPort-SDR: nzmL6iP864Ik6lMuihppLWDtr4HJXWZDZZQe/zX/NQjhAw9sx2Wqv/ualUBK/jwY7BFT0PfX98
 3ep5PhSGAMQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="260363958"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="260363958"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 14:47:21 -0700
IronPort-SDR: JVq19usS/GYEIv/xJ5XMeVTRrkoYPodQmFojKzO/GB0v3dOB/HJmJ3bc6ldxa8LtPe+D7zWCfO
 uufxuc/8GrHw==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="422810280"
Received: from bcochran-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.24.80])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 14:47:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: codecs: rt1019: clarify expression
Date: Mon, 26 Apr 2021 16:47:00 -0500
Message-Id: <20210426214701.235106-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426214701.235106-1-pierre-louis.bossart@linux.intel.com>
References: <20210426214701.235106-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warning, add parentheses:

sound/soc/codecs/rt1019.c:375:61: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
  (pll_code.m_bp ? 0 : pll_code.m_code) << RT1019_PLL_M_SFT |
                                                            ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt1019.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index 10656a5927f1..1ed85eca4888 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -372,8 +372,8 @@ static int rt1019_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 		RT1019_AUTO_BITS_SEL_MANU | RT1019_AUTO_CLK_SEL_MANU);
 	snd_soc_component_update_bits(component, RT1019_PLL_1,
 		RT1019_PLL_M_MASK | RT1019_PLL_M_BP_MASK | RT1019_PLL_Q_8_8_MASK,
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT1019_PLL_M_SFT |
-		pll_code.m_bp << RT1019_PLL_M_BP_SFT |
+		((pll_code.m_bp ? 0 : pll_code.m_code) << RT1019_PLL_M_SFT) |
+		(pll_code.m_bp << RT1019_PLL_M_BP_SFT) |
 		((pll_code.n_code >> 8) & RT1019_PLL_Q_8_8_MASK));
 	snd_soc_component_update_bits(component, RT1019_PLL_2,
 		RT1019_PLL_Q_7_0_MASK, pll_code.n_code & RT1019_PLL_Q_7_0_MASK);
-- 
2.25.1

