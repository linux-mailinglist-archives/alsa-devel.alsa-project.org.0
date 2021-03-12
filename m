Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD533838F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 03:28:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E0B816EA;
	Fri, 12 Mar 2021 03:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E0B816EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615516117;
	bh=N4JrrhiwF3cSklCJGNHf293DtIuJXxBbsDskYn0Cwr4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ha81R9tIIi3Yc7VFnjbSGXDexpp220Z2mRGIyCSlco2eJK4P2SofD/xgdy57AZ2y6
	 +CneCwEm6nr9xTqqPmDqp/E5IMNZ1DQa21DTPWtCpRzWgUYp6cRqQeDOCTUTHJoZo5
	 BuCM7gwOjN7vxdZqbgLkAKUyj7yODVDdE9FMhW6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2F56F8016C;
	Fri, 12 Mar 2021 03:27:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF104F801D8; Fri, 12 Mar 2021 03:27:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id B1678F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 03:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1678F8012A
X-UUID: 3b2e1080fb164915960c585295b6b8a1-20210312
X-UUID: 3b2e1080fb164915960c585295b6b8a1-20210312
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 921633192; Fri, 12 Mar 2021 10:26:49 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 10:26:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 10:26:47 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <tzungbi@google.com>, <broonie@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: mediatek: mt8192: fix tdm out data is valid on rising
 edge
Date: Fri, 12 Mar 2021 10:26:45 +0800
Message-ID: <1615516005-781-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
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

This patch correct tdm out bck inverse register to AUDIO_TOP_CON3[3].

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 4 +++-
 sound/soc/mediatek/mt8192/mt8192-reg.h     | 8 +++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index f5de1d769679..f3bebed2428a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -555,7 +555,9 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 
 	/* set tdm */
 	if (tdm_priv->bck_invert)
-		tdm_con |= 1 << BCK_INVERSE_SFT;
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON3,
+				   BCK_INVERSE_MASK_SFT,
+				   0x1 << BCK_INVERSE_SFT);
 
 	if (tdm_priv->lck_invert)
 		tdm_con |= 1 << LRCK_INVERSE_SFT;
diff --git a/sound/soc/mediatek/mt8192/mt8192-reg.h b/sound/soc/mediatek/mt8192/mt8192-reg.h
index 562f25c79c34..b9fb80d4afec 100644
--- a/sound/soc/mediatek/mt8192/mt8192-reg.h
+++ b/sound/soc/mediatek/mt8192/mt8192-reg.h
@@ -21,6 +21,11 @@ enum {
 /*****************************************************************************
  *                  R E G I S T E R       D E F I N I T I O N
  *****************************************************************************/
+/* AUDIO_TOP_CON3 */
+#define BCK_INVERSE_SFT                              3
+#define BCK_INVERSE_MASK                             0x1
+#define BCK_INVERSE_MASK_SFT                         (0x1 << 3)
+
 /* AFE_DAC_CON0 */
 #define VUL12_ON_SFT                                   31
 #define VUL12_ON_MASK                                  0x1
@@ -2079,9 +2084,6 @@ enum {
 #define TDM_EN_SFT                                     0
 #define TDM_EN_MASK                                    0x1
 #define TDM_EN_MASK_SFT                                (0x1 << 0)
-#define BCK_INVERSE_SFT                                1
-#define BCK_INVERSE_MASK                               0x1
-#define BCK_INVERSE_MASK_SFT                           (0x1 << 1)
 #define LRCK_INVERSE_SFT                               2
 #define LRCK_INVERSE_MASK                              0x1
 #define LRCK_INVERSE_MASK_SFT                          (0x1 << 2)
-- 
2.18.0

