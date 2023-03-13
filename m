Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F26B8400
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 22:31:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E7161452;
	Mon, 13 Mar 2023 22:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E7161452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678743088;
	bh=bqW8uSeUpeue7ElvKJOb+HX1v4HvOoeQ69lRbF0GBKk=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=bqcW/J/dz/9kfTSQnQUPyKuaLL7H6TAb8vVV22tjpyn5cLd3mO3JJAHgVS1AydYWG
	 fbnuTT9hDOU4QHIAk8FAWOxjTsZXZcu4RmL8bdLUcwOOagXJZD3e9m9qaA+p4w/AvZ
	 GlLWbbtuK0U3emo2cx807ZH24FAU/jrU9Iq7m3II=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DEBDF80527;
	Mon, 13 Mar 2023 22:29:44 +0100 (CET)
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: mt8192: Move spammy messages to debug level
Date: Mon, 13 Mar 2023 17:29:07 -0400
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FI4NNI6KF4NBXWQUTNGNMY5AD3WPYBPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167874298327.26.13265646101828617943@mailman-core.alsa-project.org>
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
	id BBA38F8032D; Mon, 13 Mar 2023 22:29:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15D42F80423
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 22:29:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15D42F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=mmOtB8Dm
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A86B4660308F;
	Mon, 13 Mar 2023 21:29:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678742971;
	bh=mWFcFs6EaqxA+zO4mnrYdfWBJNLnPvbamIJ4mjHcCOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mmOtB8Dm37lrB6dpX7uwY8hJ4Rd3Lj3BLfyDMa85FoEWZf9r/NVcsUQeY641Sb7bD
	 FSe8vOQuzj1u6pfhd07PpCKZBNuzD4BvaGW2Jko1gEZfKjhu47A73xmFyFUFkoZnaK
	 3aP5jrM0DYtJiDNYpgVG+qxXS1d+bFLxV+LywpXCnWs1/FD3gGO7+WNHSpb2KqExkD
	 Zw7WI/pyNAF8965JoMRyRdNv1sGb2BT/A1ADCmINjSy3Nfs8Xn2DMrBoKKs7q1RD3f
	 av9HyBfR6hm2JRW4dz7EL0U8geAaCczuwwTnnWj97faX2ZkNFxsqO5GmCJAiyHuOnx
	 S0WmmPwELnggw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: mt8192: Move spammy messages to debug level
Date: Mon, 13 Mar 2023 17:29:07 -0400
Message-Id: <20230313212908.2282961-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313212908.2282961-1-nfraprado@collabora.com>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FI4NNI6KF4NBXWQUTNGNMY5AD3WPYBPH
X-Message-ID-Hash: FI4NNI6KF4NBXWQUTNGNMY5AD3WPYBPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FI4NNI6KF4NBXWQUTNGNMY5AD3WPYBPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are many log messages throughout the mt8192 sound drivers that
print to the info level and are triggered very frequently. Move these
messages to the debug level to avoid spamming the console.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    | 26 +++++++++----------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 10 +++----
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index a420b78dde89..333e0ee98c5a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -369,7 +369,7 @@ static int ul_tinyconn_event(struct snd_soc_dapm_widget *w,
 	unsigned int reg_shift;
 	unsigned int reg_mask_shift;
 
-	dev_info(afe->dev, "%s(), event 0x%x\n", __func__, event);
+	dev_dbg(afe->dev, "%s(), event 0x%x\n", __func__, event);
 
 	if (strstr(w->name, "UL1")) {
 		reg_shift = VUL1_USE_TINY_SFT;
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index bcd2150c2816..9ce06821c7d0 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -256,8 +256,8 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 		return -EINVAL;
 	}
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
-		 __func__, w->name, event);
+	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -288,8 +288,8 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 		return -EINVAL;
 	}
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x, dai_id %d\n",
-		 __func__, w->name, event, dai_id);
+	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x, dai_id %d\n",
+		__func__, w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -320,8 +320,8 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 		return -EINVAL;
 	}
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x, dai_id %d\n",
-		 __func__, w->name, event, dai_id);
+	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x, dai_id %d\n",
+		__func__, w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -545,13 +545,13 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 	if (tdm_priv->mclk_rate % tdm_priv->bck_rate != 0)
 		dev_warn(afe->dev, "%s(), bck cannot generate", __func__);
 
-	dev_info(afe->dev, "%s(), id %d, rate %d, channels %d, format %d, mclk_rate %d, bck_rate %d\n",
-		 __func__,
-		 tdm_id, rate, channels, format,
-		 tdm_priv->mclk_rate, tdm_priv->bck_rate);
+	dev_dbg(afe->dev, "%s(), id %d, rate %d, channels %d, format %d, mclk_rate %d, bck_rate %d\n",
+		__func__,
+		tdm_id, rate, channels, format,
+		tdm_priv->mclk_rate, tdm_priv->bck_rate);
 
-	dev_info(afe->dev, "%s(), out_channels_per_sdata = %d\n",
-		 __func__, out_channels_per_sdata);
+	dev_dbg(afe->dev, "%s(), out_channels_per_sdata = %d\n",
+		__func__, out_channels_per_sdata);
 
 	/* set tdm */
 	if (tdm_priv->bck_invert)
@@ -644,7 +644,7 @@ static int mtk_dai_tdm_set_sysclk(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	dev_info(afe->dev, "%s(), freq %d\n", __func__, freq);
+	dev_dbg(afe->dev, "%s(), freq %d\n", __func__, freq);
 
 	return mtk_dai_tdm_cal_mclk(afe, tdm_priv, freq);
 }
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 87737d054682..5e163e23a207 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -292,11 +292,11 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 0);
 	pm_runtime_put(afe->dev);
 
-	dev_info(afe->dev, "%s(), mtkaif_chosen_phase[0/1/2]:%d/%d/%d\n",
-		 __func__,
-		 afe_priv->mtkaif_chosen_phase[0],
-		 afe_priv->mtkaif_chosen_phase[1],
-		 afe_priv->mtkaif_chosen_phase[2]);
+	dev_dbg(afe->dev, "%s(), mtkaif_chosen_phase[0/1/2]:%d/%d/%d\n",
+		__func__,
+		afe_priv->mtkaif_chosen_phase[0],
+		afe_priv->mtkaif_chosen_phase[1],
+		afe_priv->mtkaif_chosen_phase[2]);
 
 	return 0;
 }
-- 
2.39.2

