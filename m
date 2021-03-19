Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A03341D7C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 13:55:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2C11167F;
	Fri, 19 Mar 2021 13:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2C11167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616158546;
	bh=VPjKr+IwUPCtNpbEe98uPyshtFbeqQlrR7Lb8Ts9T/c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NNeYSQ+o6UfaSx0v2rz2fUJUJZRi5xTfhFXBb1RkRP4czvbVQKUGuCnMY1kJVUAmr
	 +oQsa2P2Hrb7VIxuPi3i5dzADIPbKvpAWI2zQGNyILrlUdS5ss8B67DQpprOvhjC6O
	 YE12kjEwiyT//Uyupm3rRI2Vli5Rf9jxtiOv/7GE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5492EF8023C;
	Fri, 19 Mar 2021 13:54:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 182BEF8023C; Fri, 19 Mar 2021 13:54:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43039F800BB
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 13:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43039F800BB
IronPort-SDR: HVutJuLTbR+XvamNIBwqBMmKorSd9lG+B2aBOC+ziBpEQI4jJMeNBNl0apw43tHL5VOoTjPtpJ
 XEfuzPlqhFsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="186540314"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="186540314"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 05:54:00 -0700
IronPort-SDR: FiLC00qKu7QSIuFFPRS3AVT9cc95Xb+/a46WYrxrp4taJs+a4BI3dYT7g0cB7wWmdi90A3Uno/
 4dGojRyBvcGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; d="scan'208";a="441307084"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Mar 2021 05:53:57 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: intel: sof_rt5682: use the topology mclk
Date: Fri, 19 Mar 2021 14:49:50 +0200
Message-Id: <20210319124950.3853994-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319124950.3853994-1-kai.vehmanen@linux.intel.com>
References: <20210319124950.3853994-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Daniel Baluta <daniel.baluta@gmail.com>, daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

We should use the topology configured mclk if it existed, which can make
sure we are aligned with the FW side about the mclk usage.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f4b898c1719f..58548ea0d915 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -16,6 +16,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/sof.h>
 #include <sound/rt5682.h>
 #include <sound/soc-acpi.h>
 #include "../../codecs/rt1015.h"
@@ -268,10 +269,21 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 		}
 
 		clk_id = RT5682_PLL1_S_MCLK;
-		if (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ)
+
+		/* get the tplg configured mclk. */
+		clk_freq = sof_dai_get_mclk(rtd);
+
+		/* mclk from the quirk is the first choice */
+		if (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ) {
+			if (clk_freq != 24000000)
+				dev_warn(rtd->dev, "configure wrong mclk in tplg, please use 24MHz.\n");
 			clk_freq = 24000000;
-		else
+		} else if (clk_freq == 0) {
+			/* use default mclk if not specified correct in topology */
 			clk_freq = 19200000;
+		} else if (clk_freq < 0) {
+			return clk_freq;
+		}
 	} else {
 		clk_id = RT5682_PLL1_S_BCLK1;
 		clk_freq = params_rate(params) * 50;
-- 
2.29.2

