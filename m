Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B195B2347
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 18:14:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0AB9172B;
	Thu,  8 Sep 2022 18:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0AB9172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662653674;
	bh=8YlofjXhrN57o2uDk2nHW9qNEA9RaDpEWPGfo6KOGqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ClV1/LiTxn2NWWJ4yJXWLC5Q05PIc+e9G+vvm+6pg6VZhBYNBiGduR9pLRbSjJ8w6
	 Jo+lCxB8Oqq9eIgueM0vXy5CQSeB7cZYvmJ2HTUZ67STB8xUSuSCq+ymNORnA4sqF9
	 o0A4P6bS4Y/vZAghv5qBUo++yMhgjt1xwjlic2+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C44B4F8053B;
	Thu,  8 Sep 2022 18:12:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8BABF80557; Thu,  8 Sep 2022 18:12:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84F33F80528
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 18:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F33F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Nl/he3U6"
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 410766601FAC;
 Thu,  8 Sep 2022 17:12:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662653528;
 bh=8YlofjXhrN57o2uDk2nHW9qNEA9RaDpEWPGfo6KOGqc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nl/he3U60A7/mmgUgn1oAI3NYZ0K4NjWYcPAeotjqMG63AIKvdYbW22sn8i4sGwfL
 oBXqKBhTyC2/NAmixhnv90LYSA0vsqOiPSEr+iLwG8Qjkw1lnLlrpyKSSW5nPHupOD
 FF4cSGmxgnKf1nXBjbO/4XEGxJm5nSyJTqi9g6AeKyAclUV9myPkDGFd5q1iHVIJQd
 Lz8kvaCZ/fdDdwdC07q0eicmTSJbPjx6ZhMBnUkzBFbGnuUkhZLZQXCgQvMDNT8FvV
 vWZ9cVL+fkGohQjZRzkURs8TeQvprWWYhve2oFVE8Nfz82XC1/2DSOw9P9fvv4BIgc
 EhyL3GJLLrtBQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 05/10] ASoC: mediatek: mt8183: Configure shared clocks
Date: Thu,  8 Sep 2022 12:11:49 -0400
Message-Id: <20220908161154.648557-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Miaoqian Lin <linmq006@gmail.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

i2s0 and i2s5 are paired input/output connected to the same codec and
should share the same clock. Likewise for i2s2 and i2s3. Set the clock
sharing for each pair during the DAI initialization.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 33 +++++++++++++++++++
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 33 +++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index b33cc9a73ed1..9f22d3939818 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -17,6 +17,7 @@
 #include "../../codecs/da7219-aad.h"
 #include "../../codecs/da7219.h"
 #include "../../codecs/rt1015.h"
+#include "../common/mtk-afe-platform-driver.h"
 #include "mt8183-afe-common.h"
 
 #define DA7219_CODEC_DAI "da7219-hifi"
@@ -372,6 +373,36 @@ static int mt8183_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 					  &priv->hdmi_jack, NULL);
 }
 
+static int mt8183_bt_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	int ret;
+
+	ret = mt8183_dai_i2s_set_share(afe, "I2S5", "I2S0");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int mt8183_da7219_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	int ret;
+
+	ret = mt8183_dai_i2s_set_share(afe, "I2S2", "I2S3");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+	return 0;
+}
+
 static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	/* FE */
 	{
@@ -500,6 +531,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_da7219_i2s_ops,
+		.init = &mt8183_da7219_init,
 		SND_SOC_DAILINK_REG(i2s2),
 	},
 	{
@@ -515,6 +547,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
+		.init = &mt8183_bt_init,
 		SND_SOC_DAILINK_REG(i2s5),
 	},
 	{
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index ab157db78335..a86085223677 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -15,6 +15,7 @@
 
 #include "../../codecs/rt1015.h"
 #include "../../codecs/ts3a227e.h"
+#include "../common/mtk-afe-platform-driver.h"
 #include "mt8183-afe-common.h"
 
 #define RT1015_CODEC_DAI "rt1015-aif"
@@ -391,6 +392,36 @@ mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 					  &priv->hdmi_jack, NULL);
 }
 
+static int mt8183_bt_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	int ret;
+
+	ret = mt8183_dai_i2s_set_share(afe, "I2S5", "I2S0");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	int ret;
+
+	ret = mt8183_dai_i2s_set_share(afe, "I2S2", "I2S3");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+	return 0;
+}
+
 static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	/* FE */
 	{
@@ -527,6 +558,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
+		.init = &mt8183_i2s2_init,
 		SND_SOC_DAILINK_REG(i2s2),
 	},
 	{
@@ -541,6 +573,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.ops = &mt8183_mt6358_i2s_ops,
+		.init = &mt8183_bt_init,
 		SND_SOC_DAILINK_REG(i2s5),
 	},
 	{
-- 
2.37.3

