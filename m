Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9EB32AC40
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:31:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A0AA1A9B;
	Tue,  2 Mar 2021 22:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A0AA1A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720667;
	bh=Q065eO8MejPruu882TJVdLj59j5lXFpi+/XuT/44aeU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iSdjZeM0zLix4T7zJkfuWPQI0J5CweiOa67M5WRFPehCaXSldLlWjGoIYtuMgfhOy
	 veafYBbOkGzjRU4z4+yvOZxSLA5bG+ASZxNvD6W2+pnAT7hdsMmIRuMnOIXACBX+FF
	 NCdqJH5uFV9sPyk/xLWT7BLK1jlqXWa7BNgRjNPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13974F804FD;
	Tue,  2 Mar 2021 22:26:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75986F8032D; Tue,  2 Mar 2021 22:26:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D270EF80423
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D270EF80423
IronPort-SDR: sjq619QcZt5ytA6CHQJj8IFMq7PM6aDY1wSXv92YB0n58XmlmbDxPpFP4BDY+4qlEsCSrKR60z
 +PcRRlvKvbuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174631400"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174631400"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:08 -0800
IronPort-SDR: 8kCVpxLF5xNGOjvSgtOMdyH4PHmNsboeXcWPD1VC+7Ew769hH21NFvUiYgfzKz69kuqJaGjBMx
 8Wn8nVVC8zEw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223468"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/24] ASoC: rt5668: clarify expression
Date: Tue,  2 Mar 2021 15:25:20 -0600
Message-Id: <20210302212527.55158-18-pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/rt5668.c:2185:61: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
  (pll_code.m_bp ? 0 : pll_code.m_code) << RT5668_PLL_M_SFT |
                                                            ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5668.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index bc69adc9c8b7..d966d6d1bf64 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2182,8 +2182,8 @@ static int rt5668_set_component_pll(struct snd_soc_component *component,
 	snd_soc_component_write(component, RT5668_PLL_CTRL_1,
 		pll_code.n_code << RT5668_PLL_N_SFT | pll_code.k_code);
 	snd_soc_component_write(component, RT5668_PLL_CTRL_2,
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT5668_PLL_M_SFT |
-		pll_code.m_bp << RT5668_PLL_M_BP_SFT);
+		((pll_code.m_bp ? 0 : pll_code.m_code) << RT5668_PLL_M_SFT) |
+		(pll_code.m_bp << RT5668_PLL_M_BP_SFT));
 
 	rt5668->pll_in = freq_in;
 	rt5668->pll_out = freq_out;
-- 
2.25.1

