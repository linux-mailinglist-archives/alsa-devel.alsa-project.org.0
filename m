Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF816B83FF
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 22:31:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 991261437;
	Mon, 13 Mar 2023 22:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 991261437
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678743081;
	bh=7NoExwfF8/KMRyMvGbGD92L2fTDioMe9RQIm2Ki56pQ=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=R7k4HQjrDg+eSmrKpAHBisme9piANDAH9yttCY0N6QUSAsnlXvmzEcq9VcRFl9cHu
	 TfOpULiUTfhfiWo7ThoofTc9HAD0kMdk8nxofVC3IjF8FyFvUMQ+P1i4PSW00LJfzo
	 sHp8dWzfZONUgqQWY/RyWQBAGGJ5zGtgvXUN+kzY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBF3AF804B1;
	Mon, 13 Mar 2023 22:29:42 +0100 (CET)
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: mt8192: Remove function name log messages
Date: Mon, 13 Mar 2023 17:29:06 -0400
In-Reply-To: <20230313212908.2282961-1-nfraprado@collabora.com>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEO6QDBO2LK2HD3H7DXM4PWY6UDDRNEI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167874298172.26.17917791030607314817@mailman-core.alsa-project.org>
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45410F80272; Mon, 13 Mar 2023 22:29:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB14DF8032D
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 22:29:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB14DF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=eCwra3Sz
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ACC116603093;
	Mon, 13 Mar 2023 21:29:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678742968;
	bh=dUxa3OCQgUXblMw21199yTPLdr60La5FQyGmHy5l/KA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCwra3Szp3JYaASFVbgHL9W502iflnuU4Oalhlg2HIkPFSG+b8dkfjvKFTKh+o6Ck
	 6V4jpS0GVDz7O75CKS5tp3AKsgebirZpXRXs+kkZ7mUdlfkzFtGBSHOq1lpdsdKg/A
	 +DuIGKMSbOqsRrmnj0b0MqpyuteDt8gHdRJhzFuPESXnpW8S4t7ris7n2F/QgHhXI/
	 eKrdGMWlC2aTCNtfx+OSnV6HyluBkEZEhEWY1OG9MLyaCdh3yuhuhAbK8xTI7NRWZY
	 jH7IU5S3qaIXROCy8HudJskfw0hku2E7701cR+lrG3pRd0AcNfnQaH8ejL6WS6EHqD
	 qgopxwB+gckwA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: mt8192: Remove function name log messages
Date: Mon, 13 Mar 2023 17:29:06 -0400
Message-Id: <20230313212908.2282961-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313212908.2282961-1-nfraprado@collabora.com>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PEO6QDBO2LK2HD3H7DXM4PWY6UDDRNEI
X-Message-ID-Hash: PEO6QDBO2LK2HD3H7DXM4PWY6UDDRNEI
X-MailFrom: nfraprado@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEO6QDBO2LK2HD3H7DXM4PWY6UDDRNEI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are some log messages in the mt8192 sound code that print the
function name, presumably to aid in tracing. However this can also be
achieved by ftrace and without spamming the console, so remove these
messages.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 sound/soc/mediatek/mt8192/mt8192-afe-clk.c              | 4 ----
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c              | 4 ----
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c              | 2 --
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 2 --
 4 files changed, 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index bba5f3056e8f..416aff726253 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -206,8 +206,6 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int ret;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
@@ -276,8 +274,6 @@ void mt8192_afe_disable_clock(struct mtk_base_afe *afe)
 {
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 	mt8192_set_audio_int_bus_parent(afe, CLK_CLK26M);
 	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index e1e4ca931551..a420b78dde89 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2055,8 +2055,6 @@ static int mt8192_afe_runtime_suspend(struct device *dev)
 	unsigned int value;
 	int ret;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
 		goto skip_regmap;
 
@@ -2097,8 +2095,6 @@ static int mt8192_afe_runtime_resume(struct device *dev)
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int ret;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	ret = mt8192_afe_enable_clock(afe);
 	if (ret)
 		return ret;
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index f3bebed2428a..bcd2150c2816 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -754,8 +754,6 @@ int mt8192_dai_tdm_register(struct mtk_base_afe *afe)
 	struct mtk_afe_tdm_priv *tdm_priv;
 	struct mtk_base_afe_dai *dai;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
 	if (!dai)
 		return -ENOMEM;
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 16660eda577e..87737d054682 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -161,8 +161,6 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	int counter;
 	int mtkaif_calib_ok;
 
-	dev_info(afe->dev, "%s(), start\n", __func__);
-
 	pm_runtime_get_sync(afe->dev);
 	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
 	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
-- 
2.39.2

