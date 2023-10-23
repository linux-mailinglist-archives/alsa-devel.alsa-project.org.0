Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A47D2F51
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:59:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 695F4E87;
	Mon, 23 Oct 2023 11:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 695F4E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055168;
	bh=wPPgGf55US6HMuw9y5MjdIDf9psk/BCW+uO9J+Iu4cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u51J0QZJyXSa01KybreLVthmR7OXdtKZ1vxi3EYUmClUrpj9En+SA1x8qTE5oSG3x
	 f44yVFHCANNQhk0qRfNp31UwMnW/cqI+ejCkLL8oW74eespdCYRT1wPbGhr1TvCLOo
	 GS63UVePk6Pmae7wV5iFMigYX37wFZY0XEya9dak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0397DF80612; Mon, 23 Oct 2023 11:55:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78EE7F80604;
	Mon, 23 Oct 2023 11:55:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9083F805D5; Mon, 23 Oct 2023 11:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98DB7F80587
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98DB7F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NHXaqV41
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c4fe37f166so43316861fa.1
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054902; x=1698659702;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sijvR+hKjJi+AfXfyjsruHtUHe1YLoATqzDljEq9PNo=;
        b=NHXaqV41r1lotZG3WbxOMbAat4emihC/8f2T2RJlEsiicQf4Cb1HYeUQfofr+0zx1V
         JEem5/RvmiEOfbHcnMcFsYKreWxP1JeB8RPumSd4SB1cJexz8+iVYUzKxTOqjKQggoaZ
         78Ys65Fkzwj+/E/YlfQSdObOw/1rUsaw6dwp4/QxE+VILt4y2ju6AUJ5K+jy+gDwxoG6
         Tbm9kEik296HY4TXdhdaWqB7V+3f7olTJTJbtBiYck9yr+gy0A2EbVuOA6FyqUixOfb3
         zu0FxI1jSKtVBjy/vtvtWoifpinF8+gV1l8UfWQVn1RfJj4D6zP2Xxub274qPzYQnBmY
         0dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054902; x=1698659702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sijvR+hKjJi+AfXfyjsruHtUHe1YLoATqzDljEq9PNo=;
        b=qgq4r2y8BYCal4BVBlNj1tM1jHG99hPoIV6pc6iQXFq96N03uIMBRPQe6SGwBPwcYO
         vD3sxsIrO0zsgdhN6AD1ZPkwKCwWpTGl1WkMW8WDyVHmnxYCodnd+pj++JtO6OB143CD
         f9/jpN5l3NUFkGXTNQOr8uqdEAxAzMz8isbA/ap179qLIHzbK7HrDL0VXkW6iiSSj5xv
         ay5N5MqpXw8TQhnyjzfCtCJLVINH2qPRMl06FSee9MCgq6ZKCxbZKw3zApkBR/oO2wcX
         IV2Bh7gIZw7a39FcltixHHpXa5uaL0Vrwwv92sufty0kgoTVVcvwo8jbnN9fkdB+TStq
         0apA==
X-Gm-Message-State: AOJu0YxdmADzyDUdtxRdAlNrWqI/uf9hT7bZVy78y+ZBMPpVCusMiBaL
	a4Byn2CPOz1APZnym/k+ZvcSAQ==
X-Google-Smtp-Source: 
 AGHT+IF54Qe6n/zvNqpT0Lxz4KVrjRL1LPUYGQ1mvRY5NOKen/Ok/2JBtT1ZFsNaf/o7AVD7jqRWnw==
X-Received: by 2002:a2e:a792:0:b0:2bf:e9e8:de23 with SMTP id
 c18-20020a2ea792000000b002bfe9e8de23mr7862726ljf.16.1698054902708;
        Mon, 23 Oct 2023 02:55:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 13/17] ASoC: mediatek: mt8186: Handle component name
 prefix
Date: Mon, 23 Oct 2023 11:54:24 +0200
Message-Id: <20231023095428.166563-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7TR5EP6E7EXSJAKXEL6L3EBGSJH7YEPH
X-Message-ID-Hash: 7TR5EP6E7EXSJAKXEL6L3EBGSJH7YEPH
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TR5EP6E7EXSJAKXEL6L3EBGSJH7YEPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
to include also the component's name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c    | 2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c     | 4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-src.c     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index 247ab8df941f..85ae3f76d951 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -321,7 +321,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 					   MTKAIF_RXIF_CLKINV_ADC_MASK_SFT,
 					   BIT(MTKAIF_RXIF_CLKINV_ADC_SFT));
 
-			if (strcmp(w->name, "ADDA_MTKAIF_CFG") == 0) {
+			if (snd_soc_dapm_widget_name_cmp(w, "ADDA_MTKAIF_CFG") == 0) {
 				if (afe_priv->mtkaif_chosen_phase[0] < 0 &&
 				    afe_priv->mtkaif_chosen_phase[1] < 0) {
 					dev_err(afe->dev,
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
index 33edd6cbde12..75cb30790b1b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
@@ -47,7 +47,7 @@ static int mtk_hw_gain_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, HW_GAIN_1_EN_W_NAME) == 0) {
+		if (snd_soc_dapm_widget_name_cmp(w, HW_GAIN_1_EN_W_NAME) == 0) {
 			gain_cur = AFE_GAIN1_CUR;
 			gain_con1 = AFE_GAIN1_CON1;
 		} else {
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
index f07181be4370..7c4021221950 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
@@ -393,13 +393,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8186_apll1_enable(afe);
 		else
 			mt8186_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8186_apll1_disable(afe);
 		else
 			mt8186_apll2_disable(afe);
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-src.c b/sound/soc/mediatek/mt8186/mt8186-dai-src.c
index 67989ffd67ca..e475f4591aef 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-src.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-src.c
@@ -322,7 +322,7 @@ static int mtk_hw_src_event(struct snd_soc_dapm_widget *w,
 	struct mtk_afe_src_priv *src_priv;
 	unsigned int reg;
 
-	if (strcmp(w->name, HW_SRC_1_EN_W_NAME) == 0)
+	if (snd_soc_dapm_widget_name_cmp(w, HW_SRC_1_EN_W_NAME) == 0)
 		id = MT8186_DAI_SRC_1;
 	else
 		id = MT8186_DAI_SRC_2;
@@ -487,7 +487,7 @@ static int mtk_afe_src_en_connect(struct snd_soc_dapm_widget *source,
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_afe_src_priv *src_priv;
 
-	if (strcmp(w->name, HW_SRC_1_EN_W_NAME) == 0)
+	if (snd_soc_dapm_widget_name_cmp(w, HW_SRC_1_EN_W_NAME) == 0)
 		src_priv = afe_priv->dai_priv[MT8186_DAI_SRC_1];
 	else
 		src_priv = afe_priv->dai_priv[MT8186_DAI_SRC_2];
-- 
2.34.1

