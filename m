Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A555A3201CE
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:33:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28133167F;
	Sat, 20 Feb 2021 00:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28133167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613777589;
	bh=zKSB7mKbsVNDu+hrWJfus5k1HlBKGdArIzX4Ng8Ydbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NnpYH1m9nyb5HlCpPdDTAFHMxixfz5TZqsGOrrIdkrhVfnq2znnQ6Ua2b1kP4zRI+
	 AHUMW1sI7NCOf6id7v2iaNuXEYqYMNI4VfDc7ZH60E7JolEXzuqNURhQWQkPetN1Me
	 sEgbGkAGJ/AhpeGJaMNfq3yZpGK5TIJhb/f8B/m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7BA0F802D2;
	Sat, 20 Feb 2021 00:30:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E071DF802C8; Sat, 20 Feb 2021 00:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 242B6F8026B
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 242B6F8026B
IronPort-SDR: mstdprKzpXI64bIXGgnqnqTUhqnRC7Zip1yBmhu2kqjPVLiZkbh8yliPA8jCtUX3VCiH0sFuBQ
 TZ2K8KTPyWEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293746"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:36 -0800
IronPort-SDR: VyoqTH3drO05WzEFz7pFbR0O3B2W8LfcnKCPAG7mL61X+hE273j4sLw9TwIZFwrHBTG9qBZHEI
 Dzaopj3D/9Sg==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662737"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/9] ASoC: fsl: fsl_ssi: remove unnecessary tests
Date: Fri, 19 Feb 2021 17:29:33 -0600
Message-Id: <20210219232937.6440-6-pierre-louis.bossart@linux.intel.com>
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

cppcheck warnings:

sound/soc/fsl/fsl_ssi.c:767:34: style: Condition 'div2' is always
false [knownConditionTrueFalse]
 stccr = SSI_SxCCR_PM(pm + 1) | (div2 ? SSI_SxCCR_DIV2 : 0) |
                                 ^
sound/soc/fsl/fsl_ssi.c:722:9: note: Assignment 'div2=0', assigned value is 0
 div2 = 0;
        ^
sound/soc/fsl/fsl_ssi.c:767:34: note: Condition 'div2' is always false
 stccr = SSI_SxCCR_PM(pm + 1) | (div2 ? SSI_SxCCR_DIV2 : 0) |
                                 ^
sound/soc/fsl/fsl_ssi.c:768:4: style: Condition 'psr' is always false
[knownConditionTrueFalse]
  (psr ? SSI_SxCCR_PSR : 0);
   ^
sound/soc/fsl/fsl_ssi.c:721:8: note: Assignment 'psr=0', assigned
value is 0
 psr = 0;
       ^
sound/soc/fsl/fsl_ssi.c:768:4: note: Condition 'psr' is always false
  (psr ? SSI_SxCCR_PSR : 0);
   ^

Upon further analysis, the variables 'div2' and 'psr' are set to zero
and never modified. All the tests can be removed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_ssi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 57811743c294..c57d0428c0a3 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -747,7 +747,7 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 		sub *= 100000;
 		do_div(sub, freq);
 
-		if (sub < savesub && !(i == 0 && psr == 0 && div2 == 0)) {
+		if (sub < savesub && !(i == 0)) {
 			baudrate = tmprate;
 			savesub = sub;
 			pm = i;
@@ -764,8 +764,7 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	stccr = SSI_SxCCR_PM(pm + 1) | (div2 ? SSI_SxCCR_DIV2 : 0) |
-		(psr ? SSI_SxCCR_PSR : 0);
+	stccr = SSI_SxCCR_PM(pm + 1);
 	mask = SSI_SxCCR_PM_MASK | SSI_SxCCR_DIV2 | SSI_SxCCR_PSR;
 
 	/* STCCR is used for RX in synchronous mode */
-- 
2.25.1

