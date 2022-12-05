Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF18642635
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 10:57:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F5EA17A0;
	Mon,  5 Dec 2022 10:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F5EA17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670234265;
	bh=O13cbi2con+h/dgq0HkOXhsYLLpPi2IPFfK5HtKx3a0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zhccnf9d0RDl6NrcvVcNLylHXkQw6DHK7SjMxG50o8qspZnxYJnv8oj7KSwS0TOg1
	 V7YnImT8e+jgIUCRDYIkQh9XIu018SuROxPhAeB+OnPYB06ux/FJtoU6NiGfI1L3vi
	 Dte0GbJUgBtiAlxeYxtSyVoIhSs9JlEjZ4/lQFYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67FB0F8047C;
	Mon,  5 Dec 2022 10:56:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90677F80236; Mon,  5 Dec 2022 10:56:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48B28F80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 10:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48B28F80155
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NQf7V1kFRz15N5V;
 Mon,  5 Dec 2022 17:55:50 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Dec 2022 17:56:36 +0800
From: Wang Yufen <wangyufen@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8183: fix refcount leak in
 mt8183_mt6358_ts3a227_max98357_dev_probe()
Date: Mon, 5 Dec 2022 17:56:28 +0800
Message-ID: <1670234188-23596-1-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
Cc: Wang Yufen <wangyufen@huawei.com>, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, shunli.wang@mediatek.com,
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

The node returned by of_parse_phandle() with refcount incremented,
of_node_put() needs be called when finish using it. So add it in the
error path in mt8183_mt6358_ts3a227_max98357_dev_probe().

Fixes: 11c0269017b2 ("ASoC: Mediatek: MT8183: Add machine driver with TS3A227")
Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index a860852..48c14be 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -677,8 +677,10 @@ static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card)
+	if (!card) {
+		of_node_put(platform_node);
 		return -EINVAL;
+	}
 	card->dev = &pdev->dev;
 
 	ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
@@ -767,8 +769,10 @@ static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	if (!priv) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	snd_soc_card_set_drvdata(card, priv);
 
@@ -776,7 +780,8 @@ static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
 	if (IS_ERR(priv->pinctrl)) {
 		dev_err(&pdev->dev, "%s devm_pinctrl_get failed\n",
 			__func__);
-		return PTR_ERR(priv->pinctrl);
+		ret = PTR_ERR(priv->pinctrl);
+		goto out;
 	}
 
 	for (i = 0; i < PIN_STATE_MAX; i++) {
@@ -809,6 +814,7 @@ static int mt8183_i2s2_init(struct snd_soc_pcm_runtime *rtd)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
+out:
 	of_node_put(platform_node);
 	of_node_put(ec_codec);
 	of_node_put(hdmi_codec);
-- 
1.8.3.1

