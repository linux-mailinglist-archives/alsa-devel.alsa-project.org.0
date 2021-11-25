Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4365645D3E9
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 05:26:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF16D1820;
	Thu, 25 Nov 2021 05:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF16D1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637814367;
	bh=t1FNq51kWWCBBZRKzZ/wUP6ncNAgFScdtYMw8zU1QRE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vYB78b9Vg18LchC5017+zPi+ju+qM6a7igg4H7+T+W+7DjkT2hfg5EfdD5f6+tO/7
	 9VHYX48scR1TIBZk/W2Y/OCADEh/2V9WXP/m+PIjjAG9eRUCaDWiUx+42G0TsR7xun
	 N3DZrWbEiKo8KyRyBvnxrEWsxy/sNSGxbJRi+Wdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 461AEF8007E;
	Thu, 25 Nov 2021 05:24:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 353E8F8049E; Thu, 25 Nov 2021 05:24:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E799F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 05:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E799F80302
X-UUID: d7268dbebc954e7fb2a094e9e93a9b8d-20211125
X-UUID: d7268dbebc954e7fb2a094e9e93a9b8d-20211125
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1768316012; Thu, 25 Nov 2021 12:24:28 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 25 Nov 2021 12:24:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 25 Nov 2021 12:24:26 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <tzungbi@google.com>,
 <garlic.tseng@mediatek.com>, <kaichieh.chuang@mediatek.com>
Subject: [PATCH] ASoC: mediatek: remove unnecessary CONFIG_PM
Date: Thu, 25 Nov 2021 12:24:22 +0800
Message-ID: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, Jiaxin
 Yu <jiaxin.yu@mediatek.com>, linux-mediatek@lists.infradead.org,
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

The unnecessary conditional inclusion caused the following warning.

Such as:
>> sound/soc/mediatek/mt8192/mt8192-afe-pcm.c:2368:32: warning: unused
>> variable 'mt8192_afe_pm_ops' [-Wunused-const-variable]
   static const struct dev_pm_ops mt8192_afe_pm_ops = {

Because runtime_pm already handles the case without CONFIG_PM, we
can remove CONFIG_PM condition.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c       | 2 --
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c       | 2 --
 sound/soc/mediatek/mt8173/mt8173-max98090.c      | 2 --
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c | 2 --
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 2 --
 sound/soc/mediatek/mt8173/mt8173-rt5650.c        | 2 --
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c       | 2 --
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c       | 2 --
 8 files changed, 16 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index bc3d0466472b..0f178de92a0f 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1474,9 +1474,7 @@ static struct platform_driver mt2701_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt2701-audio",
 		   .of_match_table = mt2701_afe_pcm_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &mt2701_afe_pm_ops,
-#endif
 	},
 	.probe = mt2701_afe_pcm_dev_probe,
 	.remove = mt2701_afe_pcm_dev_remove,
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 3d68e4726ea2..fb4abec9aa5f 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -901,9 +901,7 @@ static struct platform_driver mt6797_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt6797-audio",
 		   .of_match_table = mt6797_afe_pcm_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &mt6797_afe_pm_ops,
-#endif
 	},
 	.probe = mt6797_afe_pcm_dev_probe,
 	.remove = mt6797_afe_pcm_dev_remove,
diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index fc94314bfc02..2408c9d3d9b3 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -193,9 +193,7 @@ static struct platform_driver mt8173_max98090_driver = {
 	.driver = {
 		   .name = "mt8173-max98090",
 		   .of_match_table = mt8173_max98090_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = mt8173_max98090_dev_probe,
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index 0f28dc2217c0..e6e824f3d24a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -231,9 +231,7 @@ static struct platform_driver mt8173_rt5650_rt5514_driver = {
 	.driver = {
 		   .name = "mtk-rt5650-rt5514",
 		   .of_match_table = mt8173_rt5650_rt5514_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = mt8173_rt5650_rt5514_dev_probe,
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 077c6ee06780..ba6fe3d90bfc 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -298,9 +298,7 @@ static struct platform_driver mt8173_rt5650_rt5676_driver = {
 	.driver = {
 		   .name = "mtk-rt5650-rt5676",
 		   .of_match_table = mt8173_rt5650_rt5676_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = mt8173_rt5650_rt5676_dev_probe,
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 2cbf679f5c74..9b933cce0b20 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -336,9 +336,7 @@ static struct platform_driver mt8173_rt5650_driver = {
 	.driver = {
 		   .name = "mtk-rt5650",
 		   .of_match_table = mt8173_rt5650_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = mt8173_rt5650_dev_probe,
 };
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 14e77df06b01..86c8a523fe9e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1279,9 +1279,7 @@ static struct platform_driver mt8183_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8183-audio",
 		   .of_match_table = mt8183_afe_pcm_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &mt8183_afe_pm_ops,
-#endif
 	},
 	.probe = mt8183_afe_pcm_dev_probe,
 	.remove = mt8183_afe_pcm_dev_remove,
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 31c280339c50..e1e4ca931551 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2381,9 +2381,7 @@ static struct platform_driver mt8192_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8192-audio",
 		   .of_match_table = mt8192_afe_pcm_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &mt8192_afe_pm_ops,
-#endif
 	},
 	.probe = mt8192_afe_pcm_dev_probe,
 	.remove = mt8192_afe_pcm_dev_remove,
-- 
2.25.1

