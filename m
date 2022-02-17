Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD14BA192
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 14:44:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8484918C5;
	Thu, 17 Feb 2022 14:43:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8484918C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645105449;
	bh=d72hM1ufHPMphvQ2ooMYyfoPvdiVEOAIq3meaPbv8yE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q0FKue60eDaqRkMtnB1GdyxGx65QPelLQ/+eXvvxys83+TjcaprrpBzJyfn9cyHk6
	 AtOPx+Qqpp3975dsXbf2RNQvYjKXlTzyuUQqw7AWoHsbpGTAJUzwJItyIs/H+U1tLw
	 yIrnDNjEg2ddOKRrZey+1qoiIxcoZlHKF0onJCTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96096F80515;
	Thu, 17 Feb 2022 14:42:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E21BF80516; Thu, 17 Feb 2022 14:42:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44AA2F8023B
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 14:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44AA2F8023B
X-UUID: f25b260dd2754d3a8edefe3ca2f71812-20220217
X-UUID: f25b260dd2754d3a8edefe3ca2f71812-20220217
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1966730756; Thu, 17 Feb 2022 21:42:12 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 21:42:11 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 21:42:10 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Subject: [v2 01/17] ASoC: mediatek: mt6366: add codec driver
Date: Thu, 17 Feb 2022 21:41:49 +0800
Message-ID: <20220217134205.15400-2-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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

Mt6366 is a new version of mt6358, and they are same about audio part.
So we can reuse the driver of mt6358.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/codecs/Kconfig  | 8 ++++++++
 sound/soc/codecs/Makefile | 1 +
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8fa24783ce01..6631094678f5 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -132,6 +132,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_MT6351
 	imply SND_SOC_MT6358
 	imply SND_SOC_MT6359
+	imply SND_SOC_MT6366
 	imply SND_SOC_MT6660
 	imply SND_SOC_NAU8315
 	imply SND_SOC_NAU8540
@@ -1888,6 +1889,13 @@ config SND_SOC_MT6359_ACCDET
 	  for ASoC codec soc-jack detection mechanism.
 	  Select N if you don't have jack on board.
 
+config SND_SOC_MT6366
+	tristate "MediaTek MT6366 Codec"
+	depends on MTK_PMIC_WRAP
+	help
+	  Enable support for the platform which uses MT6366 as
+	  external codec device.
+
 config SND_SOC_MT6660
 	tristate "Mediatek MT6660 Speaker Amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 42d00aa4ee46..1279684feaf0 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -465,6 +465,7 @@ obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
 obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
 obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
 obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
+obj-$(CONFIG_SND_SOC_MT6366)	+= snd-soc-mt6358.o
 obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
 obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
 obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
-- 
2.18.0

