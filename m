Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFB465762C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 12:59:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AC3139D1;
	Wed, 28 Dec 2022 12:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AC3139D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672228758;
	bh=4YwquSFBaiILoUOO0kPSeqQO1VicLUHvqEwV9dnwOWk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BwAtUc0S+4svT8SFPr6fF/js4nKg3kZm6KQB7Mip2DauEWzOcnSSeNNmrGX93lun3
	 1wM4P9iWI7GGq9UUxwje+V1tggrH9H9DKerGrY8+UxIU/iLexJNqfW6KvrYciHlFfz
	 o9FLF8g5ZEth5IlvBunVtyr2iW4+9lbLWDeIP7nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45885F80310;
	Wed, 28 Dec 2022 12:58:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA73F8042F; Wed, 28 Dec 2022 12:58:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,RDNS_NONE,SPF_HELO_PASS,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 105EEF80310
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 12:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 105EEF80310
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=NCZt4ihu
X-UUID: 084aed19b8264decb81260d38f24f147-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uLwMw4epyrb3bzZyb5+8pjUhv+yHD++6G25hkeYYrj0=; 
 b=NCZt4ihup3c3Jw9yWV8K8KB4/xVGG+H2g1bFZukiyLX68sUD6qq/jqOgzhhltrVVq2oRniLgsQ6w3bIGY23qT5ClDeYSBL3Ri8AEo/jf6WbTPYIyd1ZVsy7bR5Sce4VCaw9vs0V1K+nCdD6oUSzicvhvmZPbnYtxg+297L9hn90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:41a09822-6b0b-4d31-aad4-ab0b9c6c8e6f, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:90
X-CID-INFO: VERSION:1.1.14, REQID:41a09822-6b0b-4d31-aad4-ab0b9c6c8e6f, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:90
X-CID-META: VersionHash:dcaaed0, CLOUDID:d6cca38a-8530-4eff-9f77-222cf6e2895b,
 B
 ulkID:2212281958050O1CFDRD,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 084aed19b8264decb81260d38f24f147-20221228
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 405851096; Wed, 28 Dec 2022 19:58:02 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 19:58:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 19:58:01 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH] ASoC: mediatek: mt8186: Add machine support for max98357a
Date: Wed, 28 Dec 2022 19:57:56 +0800
Message-ID: <20221228115756.28014-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for mt8186 with mt6366 and max98357a.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 sound/soc/mediatek/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 363fa4d47680..7bdb0ded831c 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -182,9 +182,10 @@ config SND_SOC_MT8186_MT6366_DA7219_MAX98357
 	  If unsure select "N".
 
 config SND_SOC_MT8186_MT6366_RT1019_RT5682S
-	tristate "ASoC Audio driver for MT8186 with RT1019 RT5682S codec"
+	tristate "ASoC Audio driver for MT8186 with RT1019 RT5682S MAX98357A/MAX98360 codec"
 	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
+	select SND_SOC_MAX98357A
 	select SND_SOC_MT6358
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682S
-- 
2.18.0

