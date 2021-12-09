Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9046E33F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 08:34:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D395A22F9;
	Thu,  9 Dec 2021 08:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D395A22F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639035245;
	bh=dWZc0MIfRNwVjljX5Paq8GQZctDRgFpdh7TD70mF8Nk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NVCBEa/u6oB5QRJPeWfrtivx/Vp4MgMlGtuH9hR8hC+5AanTPF3eP9P9Zx/tF3nnH
	 3Gkbg1hRNy4yJIgrufGNeAUgwbk5S7qdvMQJDfnhhRoy58Cc5TOoWzMVVV4ejQ1tPg
	 +ZyRzyBDfhcPR4C1JegSTAfhDQQQyRXx6iXm4FeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B79DF800FC;
	Thu,  9 Dec 2021 08:32:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 868D4F800AB; Thu,  9 Dec 2021 08:32:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D109F800AB
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 08:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D109F800AB
X-UUID: b641029928e94b418ac0d281571828e2-20211209
X-UUID: b641029928e94b418ac0d281571828e2-20211209
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1055023594; Thu, 09 Dec 2021 15:32:29 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 9 Dec 2021 15:32:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 9 Dec 2021 15:32:27 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: mediatek: assign correct type to argument
Date: Thu, 9 Dec 2021 15:32:24 +0800
Message-ID: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: tzungbi@google.com, kernel test robot <lkp@intel.com>,
 trevor.wu@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 yc.hung@mediatek.com
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

Fix the following sparse warning: (new ones prefixed by >>)
>> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33:
     sparse: sparse: incorrect type in argument 3 (different base types)
   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
     expected unsigned int to
   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
     got restricted snd_pcm_format_t [usertype]

Correct discription of format, use S32_LE and S24_LE to distinguish the
different 32bit.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c   |  8 ++++----
 .../mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 12 ++++++------
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    |  4 ++--
 .../mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c    |  4 ++--
 .../mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c    |  4 ++--
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index a4d26a6fc849..f8a72a5102ad 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -155,9 +155,9 @@ static const struct snd_soc_ops mt8183_da7219_rt1015_i2s_ops = {
 static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S32_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
 
@@ -167,9 +167,9 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					     struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index aeb1af86047e..d5fc86132b49 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -94,11 +94,11 @@ static const struct snd_soc_ops mt8183_mt6358_rt1015_i2s_ops = {
 static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
-	dev_dbg(rtd->dev, "%s(), fix format to 32bit\n", __func__);
+	dev_dbg(rtd->dev, "%s(), fix format to S32_LE\n", __func__);
 
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S32_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
 	return 0;
@@ -107,11 +107,11 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					     struct snd_pcm_hw_params *params)
 {
-	dev_dbg(rtd->dev, "%s(), fix format to 32bit\n", __func__);
+	dev_dbg(rtd->dev, "%s(), fix format to S24_LE\n", __func__);
 
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 	return 0;
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index a606133951b7..1d16939f80e3 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -350,9 +350,9 @@ static int mt8192_mt6359_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8192_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, SNDRV_PCM_FORMAT_LAST);
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index cca1c739e690..5cdbfaafd479 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -359,7 +359,7 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
@@ -464,7 +464,7 @@ static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 11a185da0d96..fa50a31e9718 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -355,7 +355,7 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
@@ -463,7 +463,7 @@ static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 
 {
-	/* fix BE i2s format to 32bit, clean param mask first */
+	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
 
-- 
2.25.1

