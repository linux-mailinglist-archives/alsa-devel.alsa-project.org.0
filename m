Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6333691D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:46:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7CE16F9;
	Thu, 11 Mar 2021 01:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7CE16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423584;
	bh=nVGFD5peGQPWsp1kXbi5dVfkENJXp53gDFa9kB2yVrg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGha1xJfko3iIg2jay0xrbIVspAW+IlRKK4cl3nCvbhSESIL9JZRgEESj2EIS/z6t
	 DZmpQpsUI84HNzyDftEm5KLpQikzumGyYNdB1IGSVyirgFwOz/h0pF6PSkEBdwAwCo
	 Ls+9nTcvWGibd8P/c40kELIJD9BjOH6g0NEBBTJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 506CAF8020D;
	Thu, 11 Mar 2021 01:44:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5C4DF80430; Thu, 11 Mar 2021 01:44:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94176F802E7
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94176F802E7
IronPort-SDR: 7TxMN1NmcsKsHd62tZOKfrekRfmP3ch8dMBe6yS9pZt6+/A5R5KWLrpLyXHJmP/kLXQnxiSoe9
 eghJinLdK1SA==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176185743"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="176185743"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:46 -0800
IronPort-SDR: pn41bQbDDSZkaoPmMqnoz+495aIQ26n5QLbU6U0vqVz6CJkKgvpsNU+e9ut7kbQrCR5Mk7kkOM
 mSMQsQ8yHCRg==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370385623"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/10] ASoC: wm8978: clarify expression
Date: Wed, 10 Mar 2021 18:43:28 -0600
Message-Id: <20210311004332.120901-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, patches@opensource.cirrus.com, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
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

cppcheck warning:

sound/soc/codecs/wm8978.c:727:57: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
 enum wm8978_sysclk_src current_clk_id = clking & 0x100 ?
                                                        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm8978.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 4b5ecd142249..7091e1a9d516 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -724,7 +724,7 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 	/* Sampling rate mask = 0xe (for filters) */
 	u16 add_ctl = snd_soc_component_read(component, WM8978_ADDITIONAL_CONTROL) & ~0xe;
 	u16 clking = snd_soc_component_read(component, WM8978_CLOCKING);
-	enum wm8978_sysclk_src current_clk_id = clking & 0x100 ?
+	enum wm8978_sysclk_src current_clk_id = (clking & 0x100) ?
 		WM8978_PLL : WM8978_MCLK;
 	unsigned int f_sel, diff, diff_best = INT_MAX;
 	int i, best = 0;
-- 
2.25.1

