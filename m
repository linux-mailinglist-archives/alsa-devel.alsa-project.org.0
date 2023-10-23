Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D55B7D2F29
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA10FDE5;
	Mon, 23 Oct 2023 11:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA10FDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055011;
	bh=SSV8gcCUb1WE4/Y0BdYKXDFpSRu1X2oATTuwtNlI+8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dj9a+ffZdO4lRgU6KKcoiUPubRYTUYzasC+O8vqIeAJzwOjaJsQ2cgEldfNH4jzY4
	 q5PF3Rpt0MT8eyZLuWYiQjFFX0WTqK+CLyOd4RiRI5+9z4mahqCMPZRR9wC6oouXJt
	 cInr7IaG3dJ+ZqO1NHshAkTNBhvScnl2HC9aTrTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D1C6F805A1; Mon, 23 Oct 2023 11:54:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0273F8057D;
	Mon, 23 Oct 2023 11:54:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D18C4F80527; Mon, 23 Oct 2023 11:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7ACFBF80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ACFBF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DbnSY5nr
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so2227088f8f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054879; x=1698659679;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P05PzWbQ4hBl2fNZN6KJaeVrZFnQ7VS3APzpcXPmWmM=;
        b=DbnSY5nr0Drv+Sz8q2oG/sGSd9CFn/nNXGhidGIBBz0Sk2rBWRMGRtBf/2n3WOqie3
         6R2cU+josXn278sgpcajl4ZkVtEU1fQgZb5QDs0JRypXt5O0LMxRjvXFxt2Q7u1fDJZ/
         DvlJ6qpkQN5u+PX8J4dJm6Jh52XchWAx+nGv6rk/3RlYrfW9ZLtN4kR9krmtV6Ri5OUO
         7Ap8BM1pLxMMPJ+8jtfuQmMYS4+y0EGehR7pewTXVuS9O4MvJTAA7dcw2DJCX8NOtSTY
         yJ9CySmKcligbkerugWlNS67l/lzO4g760DWNxxkXl6nT3q6wpean9WPZ6nCOdxlgcdF
         iPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054879; x=1698659679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P05PzWbQ4hBl2fNZN6KJaeVrZFnQ7VS3APzpcXPmWmM=;
        b=MMUlBk1ajR60aHoHdEqndX6yCDoDI4xTK8bcNmm3OTqWvZW4/ggqBYCCM/p4zg3yBS
         v/VnLdwN4bShts9dEj4BViZC7+4sCrIuOufjkZMb7SKWpgQL2wYoHDHyxz70NYiJZ0B/
         RXWgoluyNUxDEPjVbYYZQ818ZsMVJqTpLHxefLmk6TrAJbpAD9gCUksxrNvyUTfWPita
         Nl6i5IM7bMBEG3zUW/KhmXAdcC/an9/NvVQFqA8dgK60k/iKFmdIKD82sANPzq7bPzqY
         zjtwdTbQNGB6DBXSe3iv0AjT1CPOMd2OU/BKSgVFAqSDIkCNo2eAE0IXIyDc3L1ai7Sy
         lmDg==
X-Gm-Message-State: AOJu0YwGMjjsr7l6kdP+i7EhcJnTprZdeTqwLRFNPAKVSXPBATaFjWp0
	/5cQNuW2Ehg/T/490FvobzwyAQ==
X-Google-Smtp-Source: 
 AGHT+IE7M5wXmUXIEeObjapurzse0V6MkE8fsf1gV1jhgG074/79sH+mXQ9giKjm7AVwWA1w8KdepA==
X-Received: by 2002:a5d:67c5:0:b0:32d:b7d4:b90 with SMTP id
 n5-20020a5d67c5000000b0032db7d40b90mr4943276wrw.39.1698054879636;
        Mon, 23 Oct 2023 02:54:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:39 -0700 (PDT)
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
Subject: [RFT PATCH 03/17] ASoC: codecs: adav80x: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:14 +0200
Message-Id: <20231023095428.166563-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P6LOAGG2KGW3ZHN6ZIWPPFSGFDMH3R5M
X-Message-ID-Hash: P6LOAGG2KGW3ZHN6ZIWPPFSGFDMH3R5M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6LOAGG2KGW3ZHN6ZIWPPFSGFDMH3R5M/>
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
 sound/soc/codecs/adav80x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index bb08969c5917..c8c0fc928211 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -229,7 +229,7 @@ static int adav80x_dapm_sysclk_check(struct snd_soc_dapm_widget *source,
 		return 0;
 	}
 
-	return strcmp(source->name, clk) == 0;
+	return snd_soc_dapm_widget_name_cmp(source, clk) == 0;
 }
 
 static int adav80x_dapm_pll_check(struct snd_soc_dapm_widget *source,
-- 
2.34.1

