Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD8687BEAF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Mar 2024 15:17:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5217D162C;
	Thu, 14 Mar 2024 15:17:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5217D162C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710425859;
	bh=t3Fhm82IA3qEn//L6TADwfZ/ubG1FO2YvkjqhDWU4X0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZJU5byPAXWbNi/7wDkRrg2Dpedy7OlHBLhKgfTrvRJ4HvFEH+U7+O9tFz23ltFSRI
	 oll0pI0uGhttUTLZ6EA4YskktY9oIWZRRuk54V5sncciZ5diPstuEnBV1/efDtWh3o
	 2ZFF9gRT5MnbtryF+C1BT6S5pbq3KA4D/r/8ORyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 780E6F8025F; Thu, 14 Mar 2024 15:17:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE593F8057D;
	Thu, 14 Mar 2024 15:17:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3B40F8028D; Thu, 14 Mar 2024 15:17:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC235F800E4
	for <alsa-devel@alsa-project.org>; Thu, 14 Mar 2024 15:16:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC235F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=SAOz7PGq;
	dkim=temperror header.d=ew.tq-group.com header.i=@ew.tq-group.com
 header.a=rsa-sha256 header.s=dkim header.b=AueD9i4M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1710425818; x=1741961818;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8iPlLmUMgTAPqy90kGRd7xSvJIZZRBMTH99jyn15Q1U=;
  b=SAOz7PGqYXAbedfpZ6sBvDh90ejhR60tnEen0uFowBjeOQ0edP9KB8PA
   FVJaPwG49s/As1JXoxeO1saKUFEvz3wgwF38gMh3b5NWWf4YmtJFVG5BA
   DRPmbcC1r/kvFvJl+PglgS5loJrjylZCf8Fcq8R1HqfcPM5T0QYjWMICy
   yyRHJgRMCsFXAbjqa6bMrioaDQxnelQZJMLYZsMJUaEk54Ed0O/ntgNOr
   BTmhpwtvrsOMwf6Ufv/w4qpaL5d89D4RVEs44RoMEQCL1A84voH0/suDu
   aPFD9MDviNXQHp/0K7J40d+ZuVHk2R/EwBJcH2ykkU89VSOB/vGZiNrpg
   w==;
X-IronPort-AV: E=Sophos;i="6.07,125,1708383600";
   d="scan'208";a="35915593"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 Mar 2024 15:16:57 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BDCBA16EA37;
	Thu, 14 Mar 2024 15:16:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1710425813; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8iPlLmUMgTAPqy90kGRd7xSvJIZZRBMTH99jyn15Q1U=;
	b=AueD9i4MSbWj8uDoyxhJnFzJjBepny7VkKEApYcIw7tTFraO68yvuhq/FmEgRpDxcKT8EX
	j66+6KUj9UlkVXTFnfoTttuazt9UfiAMkfytU9h2+TG/6S7xsbjKfo47je+NGIqqy3irHU
	Zg3EnXFNQ5IrfIXzV1orSYS7KfpyTneJF+ZmwdhSbdiQR9iwnQta/Nh5gv+NUAPF4rkAmq
	sn9Dk5dN1uPtjvM+J9OPJMm3x4DIOGnBn7r63YtQgE+L+0jMeHbYAOSZmXuTBx0VHe18x3
	u/c8Bt64qTcdfJKQNtaMubrpFyZwYJ2RVM4z+PEF+GMUI1NPI+oXIronXfbNZg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: fsl: fsl_ssi: Add dev_err_probe if PCM DMA init
 fails
Date: Thu, 14 Mar 2024 15:16:42 +0100
Message-Id: <20240314141642.2943605-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Message-ID-Hash: UXT637ZG23VBHU72X56MMJY2PACGL4OI
X-Message-ID-Hash: UXT637ZG23VBHU72X56MMJY2PACGL4OI
X-MailFrom: alexander.stein@ew.tq-group.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXT637ZG23VBHU72X56MMJY2PACGL4OI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This happens especially if this driver is built-in, but SDMA driver
is configured as module.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_ssi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index ab6ec1974807..4ca3a16f7ac0 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1401,8 +1401,10 @@ static int fsl_ssi_imx_probe(struct platform_device *pdev,
 			goto error_pcm;
 	} else {
 		ret = imx_pcm_dma_init(pdev);
-		if (ret)
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to init PCM DMA\n");
 			goto error_pcm;
+		}
 	}
 
 	return 0;
-- 
2.34.1

