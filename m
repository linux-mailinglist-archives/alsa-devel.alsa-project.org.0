Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1EA3015B0
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jan 2021 15:12:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6421AB7;
	Sat, 23 Jan 2021 15:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6421AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611411125;
	bh=xuL74MA2r57c6Mp9XPvkL7zKV6jhtO7nxmy2l1ME8a0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RK30LWjvkZkiVr0oqJRsymgNq83fTYQJip27/72miX7JW31W6opuF0Vx868iGbowC
	 GPw3EumNZ6a4gRQ4QOcOeIELH1BhwIpz1Bxojpmh8haHa+scQTejmtvFEe0IxpKwi0
	 ODM0HvkmQCOSmBVwzYAGkYr4shF67ylbF4sCOsAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C0E0F8027D;
	Sat, 23 Jan 2021 15:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5D41F8027D; Sat, 23 Jan 2021 15:10:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C8D7F80255
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 15:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C8D7F80255
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/3] ASoC: codec/ingenic: Depend on MACH_INGENIC
Date: Sat, 23 Jan 2021 14:09:57 +0000
Message-Id: <20210123140958.12895-2-paul@crapouillou.net>
In-Reply-To: <20210123140958.12895-1-paul@crapouillou.net>
References: <20210123140958.12895-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Christophe Branchereau <cbranchereau@gmail.com>
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

No need to show the options to build Ingenic-specific drivers on all
MIPS kernel configurations if Ingenic SoCs support is not enabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/codecs/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 9bf6bfdaf11e..7c66fda7fa2b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -712,7 +712,7 @@ config SND_SOC_CX2072X
 	  Enable support for Conexant CX20721 and CX20723 codec chips.
 
 config SND_SOC_JZ4740_CODEC
-	depends on MIPS || COMPILE_TEST
+	depends on MACH_INGENIC || COMPILE_TEST
 	depends on OF
 	select REGMAP_MMIO
 	tristate "Ingenic JZ4740 internal CODEC"
@@ -724,7 +724,7 @@ config SND_SOC_JZ4740_CODEC
 	  will be called snd-soc-jz4740-codec.
 
 config SND_SOC_JZ4725B_CODEC
-	depends on MIPS || COMPILE_TEST
+	depends on MACH_INGENIC || COMPILE_TEST
 	depends on OF
 	select REGMAP
 	tristate "Ingenic JZ4725B internal CODEC"
@@ -736,7 +736,7 @@ config SND_SOC_JZ4725B_CODEC
 	  will be called snd-soc-jz4725b-codec.
 
 config SND_SOC_JZ4770_CODEC
-	depends on MIPS || COMPILE_TEST
+	depends on MACH_INGENIC || COMPILE_TEST
 	depends on OF
 	select REGMAP
 	tristate "Ingenic JZ4770 internal CODEC"
-- 
2.29.2

