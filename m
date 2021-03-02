Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3632AC45
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:33:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EDF41AC4;
	Tue,  2 Mar 2021 22:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EDF41AC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720782;
	bh=M+ewk9nSURprNLTT9tKDACLSnewXy1y40IscaGL4nWA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IAtxNIo/EIfgjs0gnu+DKs6rSiG+4IHrkm5JZzmA0vd93XaCaK2XiSJWKnEi5pJr/
	 u5x+EyJVuzCAIYE/jp/CSH43SbZ7RbMcL9Ppr1x9nnf2w9Qf4tHTH9mmn96/vT5Rx3
	 hDMb3qA0m9exyNNe0jLHuhWtwLHblszjpF8zV1ZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A96E9F80526;
	Tue,  2 Mar 2021 22:26:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24808F8032C; Tue,  2 Mar 2021 22:26:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72D1AF8032C
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D1AF8032C
IronPort-SDR: WoYfQTabQM0uTMmzm/c4/4D57aubUTpJrnQ/d0g7HOH9bLZhUCnfh5+UYK768887YJ3HG93qFw
 JfXcYvCWoB0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="183603755"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="183603755"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:03 -0800
IronPort-SDR: HWyD0XAnFdiOxb1Gu3FkIskal8AbJvnCEc+M0vYdjd2a3YJXn+oAEsxjwjvyl7dIgYMMcn+3EP
 /AjinOILgQaQ==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223393"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:25:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/24] ASoC: rt1308: clarify expression
Date: Tue,  2 Mar 2021 15:25:10 -0600
Message-Id: <20210302212527.55158-8-pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/rt1308.c:676:40: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
  pll_code.k_code << RT1308_PLL1_K_SFT |
                                       ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt1308.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index 76e65844543d..b4e5546e2e21 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -673,10 +673,10 @@ static int rt1308_set_component_pll(struct snd_soc_component *component,
 		pll_code.n_code, pll_code.k_code);
 
 	snd_soc_component_write(component, RT1308_PLL_1,
-		pll_code.k_code << RT1308_PLL1_K_SFT |
-		pll_code.m_bp << RT1308_PLL1_M_BYPASS_SFT |
-		(pll_code.m_bp ? 0 : pll_code.m_code) << RT1308_PLL1_M_SFT |
-		pll_code.n_code << RT1308_PLL1_N_SFT);
+		(pll_code.k_code << RT1308_PLL1_K_SFT) |
+		(pll_code.m_bp << RT1308_PLL1_M_BYPASS_SFT) |
+		((pll_code.m_bp ? 0 : pll_code.m_code) << RT1308_PLL1_M_SFT) |
+		(pll_code.n_code << RT1308_PLL1_N_SFT));
 
 	rt1308->pll_in = freq_in;
 	rt1308->pll_out = freq_out;
-- 
2.25.1

