Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4199D13E496
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 18:09:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB12A17D3;
	Thu, 16 Jan 2020 18:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB12A17D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579194572;
	bh=PBp4da67guPFPtYsmrSIQz2v7aFjJeAf5wBI0MWXLPQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dc2UK+TssA5f/6i0aTCwhnpB9ywC7wExN+/BWTeuX0MFznnpQGNrfV3YsmwV14ncI
	 c2/LRPCiPwplVN0o8jGl4i/mKFBPll94pwExFEgklzCzfD/3lWs9GT9JbSJz85XqGL
	 QzSK5SG0XKtGFjhI2Vt7R0jwcRE5yeKTUm08TAkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D1EDF8027C;
	Thu, 16 Jan 2020 18:05:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BE22F80276; Thu, 16 Jan 2020 18:05:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0269F801F2
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 18:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0269F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xRqA+u4g"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05C9322464;
 Thu, 16 Jan 2020 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193758;
 bh=11vJ2iWscb0SmhSkKOQ1oeGWlh/TRBOPjsCEkWOXJB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xRqA+u4gJgbMOFpLGvJJMtrOsfbsIyejsDP8NAB7Zp+ADfpkSM2wAhZuEHFuZRO9x
 tVgqWDl+0WxBrUoPOcHxvXgHxl7+38NgWra6w8Co+PseLLH2N/ImWdDlhzSyWGyP+q
 n593+VT3XK7PQiGibph65LtmoOqhZs37jkr0KkHo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 11:44:37 -0500
Message-Id: <20200116165502.8838-46-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165502.8838-1-sashal@kernel.org>
References: <20200116165502.8838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [alsa-devel] [PATCH AUTOSEL 4.19 046/671] ASoC: wm97xx: fix
	uninitialized regmap pointer problem
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

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 576ce4075bfa0f03e0e91a89eecc539b3b828b08 ]

gcc notices that without either the ac97 bus or the pdata, we never
initialize the regmap pointer, which leads to an uninitialized variable
access:

sound/soc/codecs/wm9712.c: In function 'wm9712_soc_probe':
sound/soc/codecs/wm9712.c:666:2: error: 'regmap' may be used uninitialized in this function [-Werror=maybe-uninitialized]

Since that configuration is invalid, it's better to return an error
here. I tried to avoid adding complexity to the conditions, and turned
the #ifdef into a regular if(IS_ENABLED()) check for readability.
This in turn requires moving some header file declarations out of
an #ifdef.

The same code is used in three drivers, all of which I'm changing
the same way.

Fixes: 2ed1a8e0ce8d ("ASoC: wm9712: add ac97 new bus support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/soc.h       |  2 +-
 sound/soc/codecs/wm9705.c | 10 ++++------
 sound/soc/codecs/wm9712.c | 10 ++++------
 sound/soc/codecs/wm9713.c | 10 ++++------
 4 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 41cec42fb456..88aa48e5485f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -548,12 +548,12 @@ static inline void snd_soc_jack_free_gpios(struct snd_soc_jack *jack, int count,
 }
 #endif
 
-#ifdef CONFIG_SND_SOC_AC97_BUS
 struct snd_ac97 *snd_soc_alloc_ac97_component(struct snd_soc_component *component);
 struct snd_ac97 *snd_soc_new_ac97_component(struct snd_soc_component *component,
 	unsigned int id, unsigned int id_mask);
 void snd_soc_free_ac97_component(struct snd_ac97 *ac97);
 
+#ifdef CONFIG_SND_SOC_AC97_BUS
 int snd_soc_set_ac97_ops(struct snd_ac97_bus_ops *ops);
 int snd_soc_set_ac97_ops_of_reset(struct snd_ac97_bus_ops *ops,
 		struct platform_device *pdev);
diff --git a/sound/soc/codecs/wm9705.c b/sound/soc/codecs/wm9705.c
index ccdf088461b7..54c306707c02 100644
--- a/sound/soc/codecs/wm9705.c
+++ b/sound/soc/codecs/wm9705.c
@@ -325,8 +325,7 @@ static int wm9705_soc_probe(struct snd_soc_component *component)
 	if (wm9705->mfd_pdata) {
 		wm9705->ac97 = wm9705->mfd_pdata->ac97;
 		regmap = wm9705->mfd_pdata->regmap;
-	} else {
-#ifdef CONFIG_SND_SOC_AC97_BUS
+	} else if (IS_ENABLED(CONFIG_SND_SOC_AC97_BUS)) {
 		wm9705->ac97 = snd_soc_new_ac97_component(component, WM9705_VENDOR_ID,
 						      WM9705_VENDOR_ID_MASK);
 		if (IS_ERR(wm9705->ac97)) {
@@ -339,7 +338,8 @@ static int wm9705_soc_probe(struct snd_soc_component *component)
 			snd_soc_free_ac97_component(wm9705->ac97);
 			return PTR_ERR(regmap);
 		}
-#endif
+	} else {
+		return -ENXIO;
 	}
 
 	snd_soc_component_set_drvdata(component, wm9705->ac97);
@@ -350,14 +350,12 @@ static int wm9705_soc_probe(struct snd_soc_component *component)
 
 static void wm9705_soc_remove(struct snd_soc_component *component)
 {
-#ifdef CONFIG_SND_SOC_AC97_BUS
 	struct wm9705_priv *wm9705 = snd_soc_component_get_drvdata(component);
 
-	if (!wm9705->mfd_pdata) {
+	if (IS_ENABLED(CONFIG_SND_SOC_AC97_BUS) && !wm9705->mfd_pdata) {
 		snd_soc_component_exit_regmap(component);
 		snd_soc_free_ac97_component(wm9705->ac97);
 	}
-#endif
 }
 
 static const struct snd_soc_component_driver soc_component_dev_wm9705 = {
diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index e873baa9e778..01949eaba4fd 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -642,8 +642,7 @@ static int wm9712_soc_probe(struct snd_soc_component *component)
 	if (wm9712->mfd_pdata) {
 		wm9712->ac97 = wm9712->mfd_pdata->ac97;
 		regmap = wm9712->mfd_pdata->regmap;
-	} else {
-#ifdef CONFIG_SND_SOC_AC97_BUS
+	} else if (IS_ENABLED(CONFIG_SND_SOC_AC97_BUS)) {
 		int ret;
 
 		wm9712->ac97 = snd_soc_new_ac97_component(component, WM9712_VENDOR_ID,
@@ -660,7 +659,8 @@ static int wm9712_soc_probe(struct snd_soc_component *component)
 			snd_soc_free_ac97_component(wm9712->ac97);
 			return PTR_ERR(regmap);
 		}
-#endif
+	} else {
+		return -ENXIO;
 	}
 
 	snd_soc_component_init_regmap(component, regmap);
@@ -673,14 +673,12 @@ static int wm9712_soc_probe(struct snd_soc_component *component)
 
 static void wm9712_soc_remove(struct snd_soc_component *component)
 {
-#ifdef CONFIG_SND_SOC_AC97_BUS
 	struct wm9712_priv *wm9712 = snd_soc_component_get_drvdata(component);
 
-	if (!wm9712->mfd_pdata) {
+	if (IS_ENABLED(CONFIG_SND_SOC_AC97_BUS) && !wm9712->mfd_pdata) {
 		snd_soc_component_exit_regmap(component);
 		snd_soc_free_ac97_component(wm9712->ac97);
 	}
-#endif
 }
 
 static const struct snd_soc_component_driver soc_component_dev_wm9712 = {
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index 643863bb32e0..5a2fdf4f69bf 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -1214,8 +1214,7 @@ static int wm9713_soc_probe(struct snd_soc_component *component)
 	if (wm9713->mfd_pdata) {
 		wm9713->ac97 = wm9713->mfd_pdata->ac97;
 		regmap = wm9713->mfd_pdata->regmap;
-	} else {
-#ifdef CONFIG_SND_SOC_AC97_BUS
+	} else if (IS_ENABLED(CONFIG_SND_SOC_AC97_BUS)) {
 		wm9713->ac97 = snd_soc_new_ac97_component(component, WM9713_VENDOR_ID,
 						      WM9713_VENDOR_ID_MASK);
 		if (IS_ERR(wm9713->ac97))
@@ -1225,7 +1224,8 @@ static int wm9713_soc_probe(struct snd_soc_component *component)
 			snd_soc_free_ac97_component(wm9713->ac97);
 			return PTR_ERR(regmap);
 		}
-#endif
+	} else {
+		return -ENXIO;
 	}
 
 	snd_soc_component_init_regmap(component, regmap);
@@ -1238,14 +1238,12 @@ static int wm9713_soc_probe(struct snd_soc_component *component)
 
 static void wm9713_soc_remove(struct snd_soc_component *component)
 {
-#ifdef CONFIG_SND_SOC_AC97_BUS
 	struct wm9713_priv *wm9713 = snd_soc_component_get_drvdata(component);
 
-	if (!wm9713->mfd_pdata) {
+	if (IS_ENABLED(CONFIG_SND_SOC_AC97_BUS) && !wm9713->mfd_pdata) {
 		snd_soc_component_exit_regmap(component);
 		snd_soc_free_ac97_component(wm9713->ac97);
 	}
-#endif
 }
 
 static const struct snd_soc_component_driver soc_component_dev_wm9713 = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
