Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA26B0C18
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 11:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8862A1717;
	Thu, 12 Sep 2019 11:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8862A1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568282319;
	bh=PF0tgVqXRw5MbQjc2iueLo21KoxmaBzAzWzSBOUdcZg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vsp+/mz+uGjPQzANr7xL2dfSAdpw7GwdvdV0e5rvfEBTX6ANYqdMLrqoMgw9z3L6D
	 pfqRaUs77FNW4e7WRexV/rGbZcdJY7eD811V84uJSA0FvaawhlARCEXyF9WvQ11awm
	 0YLF1QDK92peDGMVn0lcDdRpJI6BNpLVSajRYRXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02F78F805F9;
	Thu, 12 Sep 2019 11:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2447AF80444; Thu, 12 Sep 2019 11:55:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id AB137F80368
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 11:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB137F80368
X-UUID: 6653e603bf49491a8d405c8204bee09d-20190912
X-UUID: 6653e603bf49491a8d405c8204bee09d-20190912
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1463196714; Thu, 12 Sep 2019 17:55:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Sep 2019 17:55:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Sep 2019 17:55:03 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
Date: Thu, 12 Sep 2019 17:54:56 +0800
Message-ID: <1568282096-13821-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1568282096-13821-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1568282096-13821-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: mt8183: fix audio playback slowly
	after playback during bootup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Before regmap_reinit_cache we must reset audio reg as default value.
So we use reset controller unit(toprgu) to reset audio hw.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/common/mtk-base-afe.h   |  1 +
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 21 +++++++++++++++++++++
 sound/soc/mediatek/mt8183/mt8183-reg.h     |  6 ++++++
 3 files changed, 28 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index 60cb609a9790..bccc079ee660 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -60,6 +60,7 @@ struct mtk_base_afe {
 	void __iomem *base_addr;
 	struct device *dev;
 	struct regmap *regmap;
+	struct regmap *toprgu_regmap;
 	struct mutex irq_alloc_lock; /* dynamic alloc irq lock */
 
 	unsigned int const *reg_back_up_list;
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 4a31106d3471..0e5634b3a8e3 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1089,6 +1089,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct mtk_base_afe *afe;
 	struct mt8183_afe_private *afe_priv;
 	struct device *dev;
+	unsigned int reg_value;
 	int i, irq_id, ret;
 
 	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
@@ -1126,6 +1127,26 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* toprgu_regmap init */
+	afe->toprgu_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+							     "mediatek,toprgu");
+	if (IS_ERR(afe->toprgu_regmap)) {
+		dev_err(dev, "could not get toprgu_regmap from dev\n");
+		return PTR_ERR(afe->toprgu_regmap);
+	}
+
+	/* read TOPRGUWDT_SWSYSRST, the high 8bits must be zero */
+	regmap_read(afe->toprgu_regmap, TOPRGUWDT_SWSYSRST, &reg_value);
+
+	/* write TOPRGUWDT_SWSYSRST, we need set high 8bits as 0x88 first */
+	reg_value |= 0x88000000;
+
+	/* reset audio domain registers */
+	reg_value |= 1 << AUDIO_RST_SFT;
+	regmap_write(afe->toprgu_regmap, TOPRGUWDT_SWSYSRST, reg_value);
+	reg_value &= ~(1 << AUDIO_RST_SFT);
+	regmap_write(afe->toprgu_regmap, TOPRGUWDT_SWSYSRST, reg_value);
+
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
 	pm_runtime_get_sync(&pdev->dev);
diff --git a/sound/soc/mediatek/mt8183/mt8183-reg.h b/sound/soc/mediatek/mt8183/mt8183-reg.h
index e544a09e1913..8579ac4052ff 100644
--- a/sound/soc/mediatek/mt8183/mt8183-reg.h
+++ b/sound/soc/mediatek/mt8183/mt8183-reg.h
@@ -413,6 +413,12 @@
 #define AFE_MAX_REGISTER AFE_GENERAL2_ASRC_2CH_CON13
 #define AFE_IRQ_STATUS_BITS 0x1fff
 
+/* TOPRGUWDT_SWSYSRST */
+#define TOPRGUWDT_SWSYSRST 0x18
+#define AUDIO_RST_SFT                                17
+#define AUDIO_RST_MASK                               0x1
+#define AUDIO_RST_MASK_SFT                           (0x1 << 17)
+
 /* AUDIO_TOP_CON3 */
 #define BCK_INVERSE_SFT                              3
 #define BCK_INVERSE_MASK                             0x1
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
