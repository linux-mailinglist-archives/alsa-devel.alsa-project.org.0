Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C3D32AC4B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:34:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A2D81AE4;
	Tue,  2 Mar 2021 22:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A2D81AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720849;
	bh=DFGkakgEfSUzmqkJpjm7bPis+BfdZNN8inhSskDZ9Nk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UNoj17qpMLnGKwHIfpy0zkD2R9pzu3b4oxuF2OotS1YuFvGxVcfmM94+8GTnTFKAj
	 h1tIHvAzHIxkCcRNPReSFMLMTmLLtBqdq0BN/7p8+PLgpb3anowu5Bk+LuUJg6HUee
	 pWvbLpRzR0/QFI11P0MZ7fKrPjVWWCfHGB1MQP9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F1F3F80535;
	Tue,  2 Mar 2021 22:26:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76BA0F80525; Tue,  2 Mar 2021 22:26:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A238F8049C
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A238F8049C
IronPort-SDR: YwmzBja6sjnEhUL0MNBt35/WcGNlxTk3BTrAa+YDvPANG6727vdqGAxVOpYdCevNJaPELVwvBA
 2uWHz/rXNeyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174631423"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174631423"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:12 -0800
IronPort-SDR: 2IOOAL9MHKFoMV74SijB/WsG/GP9GzfV8AYreD9iXoRt5wpM7utTI4WDLZ6r2WXk3ElcmRfreo
 azCULaczhKwQ==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223479"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/24] ASoC: rt5677: clarify expression
Date: Tue,  2 Mar 2021 15:25:23 -0600
Message-Id: <20210302212527.55158-21-pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/rt5677.c:4571:61: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
  (pll_code.m_bp ? 0 : pll_code.m_code) << RT5677_PLL_M_SFT |
                                                            ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5677.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 9e449d35fc28..bc5d1d73470e 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4568,8 +4568,8 @@ static int rt5677_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 	regmap_write(rt5677->regmap, RT5677_PLL1_CTRL1,
 		pll_code.n_code << RT5677_PLL_N_SFT | pll_code.k_code);
 	regmap_write(rt5677->regmap, RT5677_PLL1_CTRL2,
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT5677_PLL_M_SFT |
-		pll_code.m_bp << RT5677_PLL_M_BP_SFT);
+		((pll_code.m_bp ? 0 : pll_code.m_code) << RT5677_PLL_M_SFT) |
+		(pll_code.m_bp << RT5677_PLL_M_BP_SFT));
 
 	rt5677->pll_in = freq_in;
 	rt5677->pll_out = freq_out;
-- 
2.25.1

