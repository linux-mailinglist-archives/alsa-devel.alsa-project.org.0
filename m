Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01E34B1CB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:05:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770CF1687;
	Fri, 26 Mar 2021 23:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770CF1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796313;
	bh=T3PkMxcc1RGgr3DURsB/4hoasZWJkV6AWIN9blEFXkI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MSYkZbXiarSNCy8fpdbZrR8n2UfOijMf7Mg4GMglySegdJKEgblD9yyGq7KDpuJMD
	 3NVMdwpEPqvINQtV6ZpTryy3ou8jE0Mc1hLrW/k+Wbue5zwuaNpNGrBV734/8/ED5l
	 5ePHJTTV3Y9v0SOvXOuVstkWPASNXx2+YaMiBapg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0106AF804E7;
	Fri, 26 Mar 2021 23:00:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23784F80482; Fri, 26 Mar 2021 23:00:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AE48F8016B
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 23:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE48F8016B
IronPort-SDR: ymr/tJY5fKQFtxgZPSUt51c2Ve3AolFHP3kEVmiEXcwC611Y9WqXXN0j5uzchb9DtgV0RJaRt3
 YJtnO9pgV3Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396744"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396744"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:13 -0700
IronPort-SDR: VJAH5WVjhPt4JQZSA/x4BysEr0LbukiDsMA6a0UaInhYJs94LgfJtIFHyAx7J0a0m8XKAWS0Af
 XGBN3/OuZ5CQ==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706881"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/17] ASoC: tegra: tegra20_das: clarify expression
Date: Fri, 26 Mar 2021 16:59:22 -0500
Message-Id: <20210326215927.936377-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
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

sound/soc/tegra/tegra20_das.c:64:60: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
 reg = otherdap << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P |
                                                           ^
sound/soc/tegra/tegra20_das.c:65:61: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]

  !!sdata2rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P |
                                                            ^
sound/soc/tegra/tegra20_das.c:66:61: style: Boolean result is used in
bitwise operation. Clarify expression with
parentheses. [clarifyCondition]
  !!sdata1rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P |
                                                            ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/tegra/tegra20_das.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 79dba878d854..69c651274c12 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -61,10 +61,10 @@ int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
 
 	addr = TEGRA20_DAS_DAP_CTRL_SEL +
 		(dap * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
-	reg = otherdap << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P |
-		!!sdata2rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P |
-		!!sdata1rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P |
-		!!master << TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P;
+	reg = (otherdap << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P) |
+		(!!sdata2rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P) |
+		(!!sdata1rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P) |
+		(!!master << TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P);
 
 	tegra20_das_write(addr, reg);
 
-- 
2.25.1

