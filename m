Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0551B32AC51
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:35:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8895E1AF7;
	Tue,  2 Mar 2021 22:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8895E1AF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720940;
	bh=BRnrxiuYZkmHlSN0fltmA3kO2VZt7Nyo8TY3l7m9wc0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KzSWYnnD12bOg8diu7N82Sh8X0KnXRPsxLToJePJGk9RU6Eby/6nkb1c3tVvT4WSD
	 6wRuZnMk/AdVS0EjKtHeaPfgGhUN7LGkXIwI9T69lLAO3pEvw86GjGRptV2FgyfvrM
	 cjnQ+Z1LU34+QstUohD4vi/bBsMwiepNOaFn6Dfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07BBDF80551;
	Tue,  2 Mar 2021 22:26:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8229AF80527; Tue,  2 Mar 2021 22:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D17EF804B1
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D17EF804B1
IronPort-SDR: MH2DZzcRMETzlhyuZKhcGMtQSM2TP20tkU7HSOSw/89PFlXpoPhuNS1kIas0/geSzSiYx5ghdc
 qdwsUiH7x6Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174631441"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174631441"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:14 -0800
IronPort-SDR: ojVFlyp+qxoGQ9vjzJn50ABx5G0vh2TF1GzlGsXaw6X6g+gSNJ5vNFky6M5UmSF00AtLIVt1ui
 Q+N27EvkwLVQ==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223487"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:13 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 22/24] ASoC: rt5682: clarify expression
Date: Tue,  2 Mar 2021 15:25:25 -0600
Message-Id: <20210302212527.55158-23-pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/rt5682.c:2401:65: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
      (pll_code.m_bp ? 0 : pll_code.m_code) << RT5682_PLL_M_SFT |

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index b306ac4b9b2e..e4542200009d 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2396,10 +2396,10 @@ static int rt5682_set_component_pll(struct snd_soc_component *component,
 			pll_code.n_code, pll_code.k_code);
 
 		snd_soc_component_write(component, RT5682_PLL_CTRL_1,
-			pll_code.n_code << RT5682_PLL_N_SFT | pll_code.k_code);
+			(pll_code.n_code << RT5682_PLL_N_SFT) | pll_code.k_code);
 		snd_soc_component_write(component, RT5682_PLL_CTRL_2,
-		    (pll_code.m_bp ? 0 : pll_code.m_code) << RT5682_PLL_M_SFT |
-		    pll_code.m_bp << RT5682_PLL_M_BP_SFT | RT5682_PLL_RST);
+			((pll_code.m_bp ? 0 : pll_code.m_code) << RT5682_PLL_M_SFT) |
+			(pll_code.m_bp << RT5682_PLL_M_BP_SFT | RT5682_PLL_RST));
 	}
 
 	rt5682->pll_in[pll_id] = freq_in;
-- 
2.25.1

