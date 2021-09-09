Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA6D4045E2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 08:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E277166E;
	Thu,  9 Sep 2021 08:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E277166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631170634;
	bh=MFziK2BDjVDsaVthqKbaCOCvDRQUNoGAzyOpD02CU5w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bwHBW1cK1UyVpzWYn8EMw/FOhqLx8lpDxK+OE4R32zIf/BT4qNYWQasxX8sQhpqRi
	 lotJ6rsLLnLVPCDTrRrT3cLvxKsa7QesmXtnODTr6lV8Rt2tMMYvjT1vsiLDGlb+rQ
	 B2oESqh3qQrR85MDfAi7R+yeOWUQ5YIpG60HaSwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D00AF80217;
	Thu,  9 Sep 2021 08:55:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9921EF80224; Thu,  9 Sep 2021 08:55:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F3DCF800FC
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 08:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F3DCF800FC
X-UUID: b2aad2fe9f79486eacd995cca291d26e-20210909
X-UUID: b2aad2fe9f79486eacd995cca291d26e-20210909
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1896985547; Thu, 09 Sep 2021 14:55:36 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Sep 2021 14:55:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 9 Sep 2021 14:55:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: add required config dependency
Date: Thu, 9 Sep 2021 14:55:33 +0800
Message-ID: <20210909065533.2114-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, wenst@chromium.org, geert@linux-m68k.org,
 linux-arm-kernel@lists.infradead.org
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

Because SND_SOC_MT8195 depends on COMPILE_TEST, it's possible to build
MT8195 driver in many different config combinations.
Add all dependent config for SND_SOC_MT8195 in case some errors happen
when COMPILE_TEST is enabled.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
---
 sound/soc/mediatek/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a2f4667d50b..81ad2dcee9eb 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SND_SOC_MEDIATEK
 	tristate
+	select REGMAP_MMIO
 
 config SND_SOC_MT2701
 	tristate "ASoC support for Mediatek MT2701 chip"
@@ -188,7 +189,9 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 config SND_SOC_MT8195
 	tristate "ASoC support for Mediatek MT8195 chip"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on COMMON_CLK
 	select SND_SOC_MEDIATEK
+	select MFD_SYSCON if SND_SOC_MT6359
 	help
 	  This adds ASoC platform driver support for Mediatek MT8195 chip
 	  that can be used with other codecs.
-- 
2.18.0

