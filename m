Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD54632AC3A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:29:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4765E194A;
	Tue,  2 Mar 2021 22:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4765E194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720595;
	bh=VcT/MthC8HtAabfeF9biAKaOm/hzkxjrolN1uollbc0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=huzKQ5KDw1anKCob2qp/KF1qvDDqa9aWmA82MCTgOMrXPng6N04zLTsENSwNhmx9r
	 amn3MPX8IsTQhHxjJklN3pRTE22ebExpewMyfCg7/8lxrLu3T/fOxIcMcbHUrHGe2Z
	 tYWV/u2OjAfhwUAee2LCrbNCFEtJFd93ovSYyOyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AACBF802E2;
	Tue,  2 Mar 2021 22:26:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB7D0F804D9; Tue,  2 Mar 2021 22:26:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47F2BF802E3
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F2BF802E3
IronPort-SDR: r5hdmPbdoPuaDGyUemn6pBCx7duJlqCMfSkTxjajuyHTg5OHVoWxvv89eOlR1a/3jf0hTE8Bft
 EtzUczNVGLlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174631381"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174631381"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:06 -0800
IronPort-SDR: +d9qI94QJJKLczfzpmm1/75y5yOfQTivrT2Xf2/IrZabioEVHUMjcCjOYj6mSxkAQ8URcqLy1O
 oOLVsECfN+mw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223458"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:04 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/24] ASoC: rt5663: clarify expression
Date: Tue,  2 Mar 2021 15:25:18 -0600
Message-Id: <20210302212527.55158-16-pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/rt5663.c:2955:63: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
  (pll_code.m_bp ? 0 : pll_code.m_code) << RT5663_PLL_M_SHIFT |
                                                              ^
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5663.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 619fb9a031e3..be9fc58ff681 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -2952,8 +2952,8 @@ static int rt5663_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 	snd_soc_component_write(component, RT5663_PLL_1,
 		pll_code.n_code << RT5663_PLL_N_SHIFT | pll_code.k_code);
 	snd_soc_component_write(component, RT5663_PLL_2,
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT5663_PLL_M_SHIFT |
-		pll_code.m_bp << RT5663_PLL_M_BP_SHIFT);
+		((pll_code.m_bp ? 0 : pll_code.m_code) << RT5663_PLL_M_SHIFT) |
+		(pll_code.m_bp << RT5663_PLL_M_BP_SHIFT));
 
 	rt5663->pll_in = freq_in;
 	rt5663->pll_out = freq_out;
-- 
2.25.1

