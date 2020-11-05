Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1442A7E6E
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 13:18:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 758701685;
	Thu,  5 Nov 2020 13:17:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 758701685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604578689;
	bh=/SXFwHoP2wg9cWH42z5kGfRXNyJzRjBAVJocsv0eSIo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b/fL4YYSNe5Sh6YnBmoEIvMMPrtGCUds0T7O59jn6bAXbqwcRZqM9uYOkm11Chnmb
	 yS9EgfgWKyUtXfR8l51UvWUcgFJdUCN68txG/+BpbZa2iZ5yPT5uEEs/8BuAlrRNBM
	 2G3d4m0ps3FJRffwC4U6Msbf8deY79ycWKIBcLOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E560F80245;
	Thu,  5 Nov 2020 13:16:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4A47F80150; Thu,  5 Nov 2020 13:16:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6657BF80150
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 13:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6657BF80150
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CRjDL542NzkfFR;
 Thu,  5 Nov 2020 20:16:18 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 5 Nov 2020 20:16:13 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH -next v2] ASoC: mediatek: mt8192: Make some symbols static
Date: Thu, 5 Nov 2020 20:28:07 +0800
Message-ID: <1604579287-25251-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 Zou Wei <zou_wei@huawei.com>, linux-arm-kernel@lists.infradead.org
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

Fix the following sparse warnings:

./mt8192-dai-i2s.c:2040:5: warning: symbol 'mt8192_dai_i2s_get_share' was not declared. Should it be static?
./mt8192-dai-i2s.c:2060:5: warning: symbol 'mt8192_dai_i2s_set_priv' was not declared. Should it be static?
./mt8192-afe-gpio.c:15:16: warning: symbol 'aud_pinctrl' was not declared. Should it be static?
./mt8192-afe-pcm.c:70:5: warning: symbol 'mt8192_get_memif_pbuf_size' was not declared. Should it be static?
./mt8192-afe-pcm.c:2137:39: warning: symbol 'mt8192_afe_component' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 2 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c  | 4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index ea00088..4208820 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -12,7 +12,7 @@
 #include "mt8192-afe-common.h"
 #include "mt8192-afe-gpio.h"
 
-struct pinctrl *aud_pinctrl;
+static struct pinctrl *aud_pinctrl;
 
 enum mt8192_afe_gpio {
 	MT8192_AFE_GPIO_DAT_MISO_OFF,
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 4a4729f..e7fec2d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -67,7 +67,7 @@ static int mt8192_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 	return mt8192_general_rate_transform(afe->dev, rate);
 }
 
-int mt8192_get_memif_pbuf_size(struct snd_pcm_substream *substream)
+static int mt8192_get_memif_pbuf_size(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -2134,7 +2134,7 @@ static int mt8192_afe_component_probe(struct snd_soc_component *component)
 	return mtk_afe_add_sub_dai_control(component);
 }
 
-const struct snd_soc_component_driver mt8192_afe_component = {
+static const struct snd_soc_component_driver mt8192_afe_component = {
 	.name = AFE_PCM_NAME,
 	.probe = mt8192_afe_component_probe,
 	.pointer = mtk_afe_pcm_pointer,
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 53c560e..5b29340 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -2037,7 +2037,7 @@ static const struct mtk_afe_i2s_priv mt8192_i2s_priv[DAI_I2S_NUM] = {
 	},
 };
 
-int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
+static int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
 {
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	const struct device_node *of_node = afe->dev->of_node;
@@ -2057,7 +2057,7 @@ int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
 	return 0;
 }
 
-int mt8192_dai_i2s_set_priv(struct mtk_base_afe *afe)
+static int mt8192_dai_i2s_set_priv(struct mtk_base_afe *afe)
 {
 	int i;
 	int ret;
-- 
2.6.2

