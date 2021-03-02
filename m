Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0E332AC44
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:32:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1F051AC0;
	Tue,  2 Mar 2021 22:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1F051AC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720753;
	bh=AHvSt/KHr8bDpIBuweQuQWxYOsyKo2bqF5QwgwKIs1c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ga46bHCSzDh/bBrKzLCNv3YUpCqmP3BbHomdirl+7xlINb4fehCjBwe0nvvyb35TC
	 6602EE55ZowMAFfUmNdlLiKtPr/VtY3HH6MSksQFKPhaldPys4sutT8FPMyJr/b8AX
	 a/l03/3YvedCCCMdoB1OSaSlntABtJab9RBlisfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129B1F8051F;
	Tue,  2 Mar 2021 22:26:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A67BF80517; Tue,  2 Mar 2021 22:26:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C799F80424
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C799F80424
IronPort-SDR: Ta33YXUIA4TdngKi9lEdvxJjyjWg//t5BNqktIH7q4cCmQcY5rCFuux6WfF1ktBzVPxcl3XMv8
 /nKloGOs6NpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="183603754"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="183603754"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:03 -0800
IronPort-SDR: L76FKCW1g50rq15ieDZkO5QNRZN617RgQcoiFM7H3Q6rc8b91FNE95m+fd5p2qruRTyiOfFGSN
 nqaAP+xtb02A==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223385"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:25:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/24] ASoC: rt1305: clarify expression
Date: Tue,  2 Mar 2021 15:25:09 -0600
Message-Id: <20210302212527.55158-7-pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/rt1305.c:853:63: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
  (pll_code.m_bp ? 0 : pll_code.m_code) << RT1305_PLL_1_M_SFT |
                                                              ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt1305.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 16aa405fb8f0..7a0094578e46 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -850,8 +850,8 @@ static int rt1305_set_component_pll(struct snd_soc_component *component,
 		pll_code.n_code, pll_code.k_code);
 
 	snd_soc_component_write(component, RT1305_PLL1_1,
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT1305_PLL_1_M_SFT |
-		pll_code.m_bp << RT1305_PLL_1_M_BYPASS_SFT |
+		((pll_code.m_bp ? 0 : pll_code.m_code) << RT1305_PLL_1_M_SFT) |
+		(pll_code.m_bp << RT1305_PLL_1_M_BYPASS_SFT) |
 		pll_code.n_code);
 	snd_soc_component_write(component, RT1305_PLL1_2,
 		pll_code.k_code);
-- 
2.25.1

