Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C229234B1BB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:01:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 056451687;
	Fri, 26 Mar 2021 23:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 056451687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796109;
	bh=eR60m5WUsZSn66SKXMR3vSb8UbM89XiJ55fyh0EZPrE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pJ5Gu5j2Vpjxb0HjhCdGu1dJsAeqp5yZ/gmhke0IPPqqOBZ6g5MGK9onrspqQAeRZ
	 9xEYW6mC2eoWOQAI9fAiolJ2M2SCdzmi+Fj+7Rm4yEKejS56XuIPWjtmtYPLa90mN+
	 OxRFud5IoGE1bSCjWjk7OfG+e0cjBxgNwXbueAlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F5DEF801EC;
	Fri, 26 Mar 2021 23:00:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F653F802DB; Fri, 26 Mar 2021 23:00:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA249F80103
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 22:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA249F80103
IronPort-SDR: S1pyx2ILhwRAZI59ydiY3VjevqU8B7nsvPfqimJtZAbCoCa9v+771Kc8IcIlxX09Hurd5z6ggJ
 EQhOU/NWp6jQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396684"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396684"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:59:54 -0700
IronPort-SDR: Je863sflGveU/77pmbgCmYiQNuc7PUjcdUxpiLAjQaJIPqabbQQaTx5EKNHYVRLp2gvh70oQNi
 Rtltnk7ZomtQ==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706667"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 14:59:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/17] ASoC: amd: renoir: acp3x-pdm-dma: remove unnecessary
 assignments
Date: Fri, 26 Mar 2021 16:59:11 -0500
Message-Id: <20210326215927.936377-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hui Wang <hui.wang@canonical.com>,
 broonie@kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

sound/soc/amd/renoir/acp3x-pdm-dma.c:132:17: style: Variable
'pdm_dma_enable' is assigned a value that is never
used. [unreadVariable]
 pdm_dma_enable = 0x00;
                ^
sound/soc/amd/renoir/acp3x-pdm-dma.c:156:18: style: Variable
'pdm_dma_enable' is assigned a value that is never
used. [unreadVariable]
  pdm_dma_enable = 0x00;
                 ^

indeed those values are never used because the timeout is reset.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 7b14d9a81b97..1acd20439399 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -129,7 +129,6 @@ static int start_pdm_dma(void __iomem *acp_base)
 	enable_pdm_clock(acp_base);
 	rn_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
 	rn_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
-	pdm_dma_enable = 0x00;
 	timeout = 0;
 	while (++timeout < ACP_COUNTER) {
 		pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
@@ -153,7 +152,6 @@ static int stop_pdm_dma(void __iomem *acp_base)
 	if (pdm_dma_enable & 0x01) {
 		pdm_dma_enable = 0x02;
 		rn_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
-		pdm_dma_enable = 0x00;
 		timeout = 0;
 		while (++timeout < ACP_COUNTER) {
 			pdm_dma_enable = rn_readl(acp_base +
-- 
2.25.1

