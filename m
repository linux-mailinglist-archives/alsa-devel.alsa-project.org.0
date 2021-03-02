Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36132AC4C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:34:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCF0B1AE9;
	Tue,  2 Mar 2021 22:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCF0B1AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720873;
	bh=/4VIPjwaSzjHAK+rktReMA9YgtOLLURZ582aQaJAb08=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MurC8B/xDhw/XJC0S+7u6URzJZxZhwaA5cAeIdOX/XN6Ii3bAZ9GtzYjC5bnZN0nT
	 pIBZZFuq6SDCuLJ1C8QBdocR9xJ2PpdIUdOZw9QCTBKADWpuP0Q92HMU5MRyjozOW1
	 YhtaoXuwWj1zruTu3WQI8PqLiFsCIZov/rPFevWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DD4F80536;
	Tue,  2 Mar 2021 22:26:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20886F80482; Tue,  2 Mar 2021 22:26:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61154F80482
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61154F80482
IronPort-SDR: 7XvHje3Vas84u6h5A7tUcPdBatNIyq1pYM44zdRMRGQOw7ejqxas8gk+ih3kM6V4R7FF9sRfy6
 s8TTwHeVuPng==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="183603762"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="183603762"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:04 -0800
IronPort-SDR: AqpxUWlGDX7DoD+K3sKjfu/+YSUpU74kkj3UG0kS2HcdbyCbjCX2tSPSMFXeDh31Blpi7P1X8l
 UBqSpMQZUSAw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223418"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:25:58 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/24] ASoC: rt5645: clarify expression
Date: Tue,  2 Mar 2021 15:25:13 -0600
Message-Id: <20210302212527.55158-11-pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/codecs/rt5645.c:2959:61: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
  (pll_code.m_bp ? 0 : pll_code.m_code) << RT5645_PLL_M_SFT |
                                                            ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5645.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 4db6cd70e32b..c39095fa14ce 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -2956,8 +2956,8 @@ static int rt5645_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 	snd_soc_component_write(component, RT5645_PLL_CTRL1,
 		pll_code.n_code << RT5645_PLL_N_SFT | pll_code.k_code);
 	snd_soc_component_write(component, RT5645_PLL_CTRL2,
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT5645_PLL_M_SFT |
-		pll_code.m_bp << RT5645_PLL_M_BP_SFT);
+		((pll_code.m_bp ? 0 : pll_code.m_code) << RT5645_PLL_M_SFT) |
+		(pll_code.m_bp << RT5645_PLL_M_BP_SFT));
 
 	rt5645->pll_in = freq_in;
 	rt5645->pll_out = freq_out;
-- 
2.25.1

