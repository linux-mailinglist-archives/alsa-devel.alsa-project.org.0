Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E916232AC3E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:30:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A9B19FF;
	Tue,  2 Mar 2021 22:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A9B19FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720626;
	bh=rbaA60XavB4L9DigIFLjc+45mYu2DT58qLv36MF/DCc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVSSKYICkkwwfVHU2IEdTsycL7UnSzbsp+7asG0+CF4WsR9WwPWmBpdGD5JGTEujB
	 wwma5xg2Eq7cR5z+GSVTlirAxlTUVUrVIarKkQE4OHOOcwiBFZ1zgodFgqUdkGhJfl
	 wyG3mS/Z0uZua86rCd7svRuY9yMWjoyXoVVChLkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 334E2F804F1;
	Tue,  2 Mar 2021 22:26:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2165F804F2; Tue,  2 Mar 2021 22:26:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 516E2F802E2
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 516E2F802E2
IronPort-SDR: ewzK+i/+gdiPRr2RZsvuKpzUf3h/1f1MZkjdaxRl4YD2Y7FMwmUoVmDkoOtlCxMS/ICNSAcvtj
 cdAdgaI2mHhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="183603750"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="183603750"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:03 -0800
IronPort-SDR: YwP9GO8mlC+68hxfZeq1dSCe9rGRrbqxxI94O0qL8PusUgzj0BoX5aaXPCq77tazvaIwWnIEJV
 hN5SBvAf4ARw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223364"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:25:49 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/24] ASoC: rt1011: clarify expression
Date: Tue,  2 Mar 2021 15:25:06 -0600
Message-Id: <20210302212527.55158-4-pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/rt1011.c:1781:63: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]

  (pll_code.m_bp ? 0 : pll_code.m_code) << RT1011_PLL1_QM_SFT |
                                                              ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt1011.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 39a9f17ca0a9..238cb66f4c6a 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1778,8 +1778,9 @@ static int rt1011_set_component_pll(struct snd_soc_component *component,
 		pll_code.n_code, pll_code.k_code);
 
 	snd_soc_component_write(component, RT1011_PLL_1,
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT1011_PLL1_QM_SFT |
-		pll_code.m_bp << RT1011_PLL1_BPM_SFT | pll_code.n_code);
+		((pll_code.m_bp ? 0 : pll_code.m_code) << RT1011_PLL1_QM_SFT) |
+		(pll_code.m_bp << RT1011_PLL1_BPM_SFT) |
+		pll_code.n_code);
 	snd_soc_component_write(component, RT1011_PLL_2,
 		pll_code.k_code);
 
-- 
2.25.1

