Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C05CC3201CA
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:32:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3FC1675;
	Sat, 20 Feb 2021 00:31:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3FC1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613777540;
	bh=9gEHklfxuZujApncHJOXk6U2u4tK0OD6MfNjFsPPg9M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FB39cuiZgOE69aitiODOo6DnC3sf4lVkEiyQv8r0oTS8Zt3HsP+3gRkL0PBQsEbs4
	 Js7zLS/7b6ZLuWftlk6OYOX1275LsaLU7iUqSibnICVblOf3NIIf8b0Uflmeqxk3nc
	 I9Id1Og21hcAbMU+Pgk1aGU+0VS86F2TzLm15bBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3090F80277;
	Sat, 20 Feb 2021 00:30:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 819C1F802A9; Sat, 20 Feb 2021 00:30:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87C80F801F5
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87C80F801F5
IronPort-SDR: cakSsfLOW3TbagWs9p8lBtqBVetDFiPORmfQZMk7VMcmoCKclcgFAThcGbf6qXXBhU9swiAJ9W
 0KMmRsKJryNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293693"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293693"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:29 -0800
IronPort-SDR: 8FE41/OafuIQFCSt+0a+uAkO9CbLdA63YTZhNlLMzQJZnh7Vm9CM7mMLRhB8/lemN2by4dD4BH
 vkMLe6nUjlKA==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662589"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:28 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/9] ASoC: fsl: fsl_asrc: remove useless assignment
Date: Fri, 19 Feb 2021 17:29:29 -0600
Message-Id: <20210219232937.6440-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
References: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 broonie@kernel.org, Fabio Estevam <festevam@gmail.com>
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

sound/soc/fsl/fsl_asrc.c:613:8: style: Variable 'i' is assigned a
value that is never used. [unreadVariable]
 int i = 0, j = 0;
       ^

The same issue occurs for the 'j' variable.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_asrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index c325c984d165..63d236ef5c4d 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -610,7 +610,7 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
 	struct asrc_config *config = pair_priv->config;
 	int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
 	int clk_rate, clk_index;
-	int i = 0, j = 0;
+	int i, j;
 
 	rate[IN] = in_rate;
 	rate[OUT] = out_rate;
-- 
2.25.1

