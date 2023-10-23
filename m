Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF8E7D2F56
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8B6AE8F;
	Mon, 23 Oct 2023 11:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8B6AE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055199;
	bh=iXjF3RPCmBoWQ+GKpaYH8Hub2UMRDp2Tg63QY6VTcuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gUItwWvHTitPTg4mwr2Ip8OTqq5WmnSiUhpXAbfdL1NUXm3EXT3gIkH+8BDMrC9ej
	 4sfxN/IrF4j6dMPWi/gutxgY6vwOY7nZCq0Uh9TFfStJUh8xmXoCwjwS9whoByUpsq
	 pWH0XQ1nmeTBIkBr8ihmqG6GZJdVDxvt/9fAL/t8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 445DEF80621; Mon, 23 Oct 2023 11:55:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD85F80616;
	Mon, 23 Oct 2023 11:55:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4DADF805E3; Mon, 23 Oct 2023 11:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DFECF805E0
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DFECF805E0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MSjwI1ZC
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so24037335e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054907; x=1698659707;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7AsNVigM8lbJ2TEkTHkh3DJVAWVStJtaNwYVukOeww=;
        b=MSjwI1ZCARsYBY1ln/pa1SxI9nctI/h6KpzHJf+ZzJGp0pCo/Z+WmpdCabmmI/zVOz
         +8NzQlpwDxNBagS/J44/sROxQn+omBuuxNBE0QfGk3h5dFWGuzjTXC0rQgnn27wcQO0i
         abhe9/UG3oSF32W+lIjuzKkwfMFYY8Bff/3VVBH/VHHZbz8dlwSiEKwQ9FrPdH7AgLX+
         G7r4few8sD0biLK/Nipg3PW8N0YbfLSEG9J6ZFHYU0d4nfEKg0nclFWyNumHXP+W/Mty
         HmjFnzomkQY2ZodIpWxeOcSbkuJSWfdRPeqzQbsQ1ZYksu2pFGcQjUEiVOhaJRlwbMIS
         AFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054907; x=1698659707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7AsNVigM8lbJ2TEkTHkh3DJVAWVStJtaNwYVukOeww=;
        b=jluCdLw0JtHc1G9Sf6Vb1FTUZ3GgBvy6DA/1f+MO0S14ZJeTzPZyItfhzfvOW1C9tE
         /DC9OTXQoVBOVQI55Wv9A0ZYJdjgjuODf3VqpuElBXrN5gZzm5VfY7CDEmq7cdvheUjQ
         t300BMBRRSWxKSyKQ7luyBJEWLDkkeYUXi4kDOVw0JpHIiKAoQJtaoOldGy3mpxxvrSS
         DBksrpIuqt+6/n1l7IgI5Ra60pjPaubb9sVk1Zl+sMl1ii7+tLT1NNmQglMhjh/WECNm
         Q7f3jEl86IW99B5BFNQVYf5zNObCRzYbPTE+LZo9Z1EyaMFgHDg2FOF2ooIG/I3olLwu
         fNyQ==
X-Gm-Message-State: AOJu0YxMAcFJgcLQo+XiqSRnjX0vmJ7uajF0Ot7VctyFuwFubh/cV7FW
	nyTxY4Ww5cVABEtXocKi8bHwqg==
X-Google-Smtp-Source: 
 AGHT+IG0DaJTatBkYQl759RhB3DEXbNMmxDZLlPU/SGS2hOJRk1TRuMc/RVGopj7Uuqttkf+UNyBLw==
X-Received: by 2002:adf:cf11:0:b0:32d:967d:1baf with SMTP id
 o17-20020adfcf11000000b0032d967d1bafmr5476727wrj.1.1698054907228;
        Mon, 23 Oct 2023 02:55:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:06 -0700 (PDT)
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
Subject: [RFT PATCH 15/17] ASoC: mediatek: mt8192: Handle component name
 prefix
Date: Mon, 23 Oct 2023 11:54:26 +0200
Message-Id: <20231023095428.166563-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4XYT27FC5UYBMZG6XIXN6K6YMEPRUZPD
X-Message-ID-Hash: 4XYT27FC5UYBMZG6XIXN6K6YMEPRUZPD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XYT27FC5UYBMZG6XIXN6K6YMEPRUZPD/>
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
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index 4919535e2759..36d33032a37a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -435,7 +435,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 			regmap_write(afe->regmap, AFE_ADDA6_MTKAIF_CFG0,
 				     0x00010000);
 
-			if (strcmp(w->name, "ADDA_MTKAIF_CFG") == 0 &&
+			if (snd_soc_dapm_widget_name_cmp(w, "ADDA_MTKAIF_CFG") == 0 &&
 			    (afe_priv->mtkaif_chosen_phase[0] < 0 ||
 			     afe_priv->mtkaif_chosen_phase[1] < 0)) {
 				dev_warn(afe->dev,
@@ -444,7 +444,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 					 afe_priv->mtkaif_chosen_phase[0],
 					 afe_priv->mtkaif_chosen_phase[1]);
 				break;
-			} else if (strcmp(w->name, "ADDA6_MTKAIF_CFG") == 0 &&
+			} else if (snd_soc_dapm_widget_name_cmp(w, "ADDA6_MTKAIF_CFG") == 0 &&
 				   afe_priv->mtkaif_chosen_phase[2] < 0) {
 				dev_warn(afe->dev,
 					 "%s(), mtkaif_chosen_phase[2]:%d\n",
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index ea516d63d94d..47dc7ec4cae7 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -623,13 +623,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8192_apll1_enable(afe);
 		else
 			mt8192_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8192_apll1_disable(afe);
 		else
 			mt8192_apll2_disable(afe);
-- 
2.34.1

