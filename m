Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F91729D5F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45AFDF2;
	Fri,  9 Jun 2023 16:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45AFDF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322406;
	bh=F64htUb4xomJnUgmv7OEFAWWoGzoGyTQai5dOhd5ivM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F0TD2zzu6ezMacxftkqtRadEmJKXf1f37UMorxI4zqgX+pPVCTcWPwGFwKUkLmkov
	 jP3yXHPGpMafl365eoIECXDawhJu5NeAHYD2Inn2SOxc8IC+i0Y4zmIMPtKJTupG2Z
	 rzjg0EQ5gD9JlBwFEAptxRQmKrYctewnN2LnXWD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F71BF8064C; Fri,  9 Jun 2023 16:47:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B139AF8065A;
	Fri,  9 Jun 2023 16:47:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B5BEF80254; Thu,  8 Jun 2023 15:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C07B6F8016C
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 15:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C07B6F8016C
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5F8D6807B;
	Thu,  8 Jun 2023 21:57:53 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 21:57:53 +0800
Received: from SD-Server.starfivetech.com (183.27.98.122) by
 EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 8 Jun 2023 21:57:52 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Dan Carpenter <dan.carpenter@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Walker Chen <walker.chen@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] ASoC: starfive: Remove some unused macros
Date: Thu, 8 Jun 2023 21:57:50 +0800
Message-ID: <20230608135750.11041-3-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230608135750.11041-1-walker.chen@starfivetech.com>
References: <20230608135750.11041-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.122]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PQADBXPKYKUXFM3IEW64HDQGIMG3FBPY
X-Message-ID-Hash: PQADBXPKYKUXFM3IEW64HDQGIMG3FBPY
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQADBXPKYKUXFM3IEW64HDQGIMG3FBPY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These macros are unused and can be dropped.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 sound/soc/starfive/jh7110_tdm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index a9a3d52bdd2a..e4bdba20c499 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -25,11 +25,8 @@
 #include <sound/soc-dai.h>
 
 #define TDM_PCMGBCR			0x00
-	#define PCMGBCR_MASK		0x1e
 	#define PCMGBCR_ENABLE		BIT(0)
-	#define PCMGBCR_TRITXEN		BIT(4)
 	#define CLKPOL_BIT		5
-	#define TRITXEN_BIT		4
 	#define ELM_BIT			3
 	#define SYNCM_BIT		2
 	#define MS_BIT			1
@@ -42,11 +39,6 @@
 	#define LRJ_BIT			1
 #define TDM_PCMRXCR			0x08
 	#define PCMRXCR_RXEN		BIT(0)
-	#define PCMRXCR_RXSL_MASK	0xc
-	#define PCMRXCR_RXSL_16BIT	0x4
-	#define PCMRXCR_RXSL_32BIT	0x8
-	#define PCMRXCR_SCALE_MASK	0xf0
-	#define PCMRXCR_SCALE_1CH	0x10
 #define TDM_PCMDIV			0x0c
 
 #define JH7110_TDM_FIFO			0x170c0000
-- 
2.17.1

