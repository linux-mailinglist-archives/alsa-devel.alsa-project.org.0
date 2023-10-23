Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 743CB7D2F3F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:58:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D192AE72;
	Mon, 23 Oct 2023 11:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D192AE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055090;
	bh=F1/g2zPpNZPH/hTMMtA7BXzCMu15Sn78bbz92qZ4pJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mlXTjtWLq+9M7YSaAy86gkZJD5Ed/y1bjAuuecq9x+TTBZX7M+SsUjhGnEKQ8PjWw
	 oSxP3bAntSGh2PuZcpgDAT+DgEu78VO325QC+SGugNc68XkyRUsNho2MlYARzo7gyL
	 vQ8pvHx1CWCeBCIk4ryPSmeYQNTv9SnS1wzWKV30=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE884F805E0; Mon, 23 Oct 2023 11:55:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1963BF805C8;
	Mon, 23 Oct 2023 11:55:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1B2DF805B0; Mon, 23 Oct 2023 11:54:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67076F8057B
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67076F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jXdMEa8n
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32da7ac5c4fso2148933f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054891; x=1698659691;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PvbddIvQlG0l/ZDn5njSVhrq4RgzTBlbX25/MYIgFc=;
        b=jXdMEa8nJNrnuUIJAzr9IIRpBVhi9kZp3qM5hv3vwICssr2X0unQ2WdoNpqrACWorE
         C7U4nRUaMH4EpHSwqNVkJWUkVWs21hcEFy8OETjV6luYH7KgIK+05CHtCZDxBai/aLIH
         rSSTkjO/RItjdTtXlK8G0mv4dU0pQFJcQKCrQdLtELXpxLEDxW2syqAghm8BRGLjbYPr
         rwiNGN/FrbKv1X9RblBBIOGEoX7ZWB5GfQA75NWkUFrfwoAyIfq7KoebbSpZ9duBiSOz
         PSKEQyVvo4oZ8s6mlTshnz8CiD/JOBvsjqgBA1UOJ3KIGzPminAZwBaqXHZhAQEgqW8o
         ++xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054891; x=1698659691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PvbddIvQlG0l/ZDn5njSVhrq4RgzTBlbX25/MYIgFc=;
        b=EyRBr/ipdAsSyJ6J4HVX2wJyybN0v7Gx/LimSMrjz+bA3YtnzpcKQ3YKbM+TXWsYuD
         wfwheYG78XhH/B/dlpQsIB7CSCTTDUbAGvK7m/toGZR6pRV/EMLojAfRCzLxyMeAENib
         Lp+yle4DcGPz33ci4GaVuwVNGJW1MUqV/RPKoG1uyWfuHp4LGIEp0C1WGv0dqXrXLWBK
         6EIye+W0oo7uzmvadNZq6gDX0pX9vpqhHGaNVTsgyegaWPgftezA98xqzOQLwemDQpJN
         gB33HLQ1hVcy/zrH+uGRYKYswRXxvKK2cwU1qduashyF9J04UgZqUca/n42ErBjZkwVP
         kV1g==
X-Gm-Message-State: AOJu0Yw6NJiOuiXxJQnQsAaS8OLcsXu18lGUWdeNob5mWNZaxheIgjuD
	tgRaFkovZwj9wFTJs0L2cd9zDw==
X-Google-Smtp-Source: 
 AGHT+IEmmCcXMvV2AiWhQpKHX0IqP6/STlrOm+onc5uiN24/C1EAIXqoQxx+Ad9L+iK6N0Yq3GEInA==
X-Received: by 2002:a5d:5709:0:b0:32d:9fd1:91f9 with SMTP id
 a9-20020a5d5709000000b0032d9fd191f9mr5739165wrv.60.1698054890848;
        Mon, 23 Oct 2023 02:54:50 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:50 -0700 (PDT)
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
Subject: [RFT PATCH 08/17] ASoC: codecs: wcd9335: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:19 +0200
Message-Id: <20231023095428.166563-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PBSJNL2NMFERHNGMBCVZAKCWWHOTBEOR
X-Message-ID-Hash: PBSJNL2NMFERHNGMBCVZAKCWWHOTBEOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBSJNL2NMFERHNGMBCVZAKCWWHOTBEOR/>
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
 sound/soc/codecs/wcd9335.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a05b553e6472..43c648efd0d9 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -3296,31 +3296,31 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
 	int val;
 	int offset_val = 0;
 
-	if (!(strcmp(w->name, "RX INT0 INTERP"))) {
+	if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT0 INTERP"))) {
 		reg = WCD9335_CDC_RX0_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX0_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT1 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT1 INTERP"))) {
 		reg = WCD9335_CDC_RX1_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX1_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT2 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT2 INTERP"))) {
 		reg = WCD9335_CDC_RX2_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX2_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT3 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT3 INTERP"))) {
 		reg = WCD9335_CDC_RX3_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX3_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT4 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT4 INTERP"))) {
 		reg = WCD9335_CDC_RX4_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX4_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT5 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT5 INTERP"))) {
 		reg = WCD9335_CDC_RX5_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX5_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT6 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT6 INTERP"))) {
 		reg = WCD9335_CDC_RX6_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX6_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT7 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT7 INTERP"))) {
 		reg = WCD9335_CDC_RX7_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX7_RX_VOL_CTL;
-	} else if (!(strcmp(w->name, "RX INT8 INTERP"))) {
+	} else if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT8 INTERP"))) {
 		reg = WCD9335_CDC_RX8_RX_PATH_CTL;
 		gain_reg = WCD9335_CDC_RX8_RX_VOL_CTL;
 	} else {
-- 
2.34.1

