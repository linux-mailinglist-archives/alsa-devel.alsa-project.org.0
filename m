Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA290589E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:22:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF1C14E3;
	Wed, 12 Jun 2024 18:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF1C14E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209359;
	bh=AqGJEeLHu58vzcaPVEiybipjhiSIkfgmXeCqrJqGrnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RvfVlaSA9MchsJSTP1LzXX9QWrVqGIQACUSGmbL6Gu5NCnj5dty5em49ootdVKJnQ
	 9VjFsyCqbM8RwycUueGknLko6IYVklwVEQJir+RHoeqT1H257TZ6UHAG/IPIdbiZ62
	 vUVPhzVRxxaQOSz2nWvjiFxl9kj9oZnJCP4twI2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7EE9F89763; Wed, 12 Jun 2024 18:16:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A65F8971D;
	Wed, 12 Jun 2024 18:16:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98DDFF805D4; Wed, 12 Jun 2024 18:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48485F805BB
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48485F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jSbv9QkB
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f13dddf7eso9872966b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208975; x=1718813775;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPjxtHHdxxnis6XGqFgLr48z/PZZvjJ4q9YoUmBEYG0=;
        b=jSbv9QkBOB+gruLeHw02p4b4AdPA5NhTlrQju08golAZmMCjYUaGW7ywQ1rCmOkhrT
         wtHRf4noVkxtVzeiSuSirLmQEkOYS1rvqLkrCmYYc9H51r8aQptBB19nMF5FOVFyvJji
         +4sr6q2fBry8glYrs+q1HjRK9fQdKXIsvnbrt5ADjDbi+wCaPqrMo+mO5G1/15+QhnFd
         7MSdYEdKepzRFNPtdb2juP5RndBAxx8YHcxncBTE3M0LqMizuW+rqpaIWJ5jYN1RZ0gF
         +SRn3dMh41nCtRyl80Gre5PBEdRUaOzV3w21fSldlV4tTpHfHDggGAX6lftSJS7hBmS4
         HsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208975; x=1718813775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPjxtHHdxxnis6XGqFgLr48z/PZZvjJ4q9YoUmBEYG0=;
        b=luyDFzeb21AxNoJjCWb5eF1QjU/tOIPUIKaIgWi5Lz16fYJmQIBkxCkH5+UdysvSyi
         v88l168+b71cLgVJAJ5eprj9egjAvg3CSt9cG6DT1E0R9Bq8jpMIgAElmYfHVPhy+/+Q
         h76bwVvBtDdsTShVizzOCeLNMvChIqTh90BzHHKzEKpgdqPeQac/ETjpiuZn0dUh9Uh5
         y5bREWb73YCsc/1TpsXcJEFDiINskOl9/5SQZ0MsZE17HUpix460yabeWJz6nW0L8QcV
         b9XxNIyN5BCavoivY9c1c0yTfgQPjrZMDGgiSdEF4BFaooCbTQqLs3Of2H4xbhDDhTkv
         Xh7g==
X-Gm-Message-State: AOJu0YxEcEn13+Rplje5S6cRI5v+CzYTvJnvIPes6dj4kCW3ZGP1AYU/
	3eb3z5u9ITI1AhHPUSkq3yUc7mFnCQQeUI3kUcr7nqUN1AWYd3intNegP48s93U=
X-Google-Smtp-Source: 
 AGHT+IE9yWBR/V1EKyUJEqTgvztyKXOF8S1AWCeYdztPcdcZitZUuETPOkxcpZ9R31ob9kdpEriv5w==
X-Received: by 2002:a17:906:48c7:b0:a6f:4b5b:4ba7 with SMTP id
 a640c23a62f3a-a6f4b5b4c43mr123244466b.67.1718208975296;
        Wed, 12 Jun 2024 09:16:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:34 +0200
Subject: [PATCH 21/23] ASoC: codecs: wcd939x: Constify wcd939x_sdw_ch_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-21-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AqGJEeLHu58vzcaPVEiybipjhiSIkfgmXeCqrJqGrnA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmpxeuRkJc7UskyAuH3KS6z1/56YQ47Nrud3
 89R9FiDZdiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJqQAKCRDBN2bmhouD
 1x9cD/43TrxRdQE1DLNeZsA2ZfnfnJ1pH9+KHD03KLq4jRMaNGc0vOD6gAW8YiXcfQpY5mnxwij
 gPatOixM/87wwVVpUFEl1mR6zyYy9gLekbU3XcgEcEFBzWfvZaG54dMfhIs1RZQD9CJaU1OeefJ
 MKzFWzjeeRToXCmy8z4uBl7VwPZnXc/HmdwUIQ7hizF/nconAkhnEsDRE5KQkv1EHnJ/J5ycXCm
 fkyVv4tTZt3GSxG9HzSSMjUPVtHFiVN7R9O3nN5SRe7VLlJfnn9qT3C7s1a2RAfWFWPpD8Im0vy
 slzrMvYV9fmZtjsKBTAvU+SkWOQaqL6mQ5kBZA7+ZalF/K+XWaNtNO0VQJrGPDDjr+qM5NW4aRh
 XFlYpJC89EFLVdpg+cquAYm/NF9tf/nfopHSgLxye0KILe0Su3ocAVO7t50OQWKhCcaPZB5vZ2Z
 ujcsM136t3E5JG1QbBwDr7f6hwfOe0mBLgHhwxFM2Jm8M7dyqPVwkI9Or52zkfWE7o/6lxmdfaY
 VA/v/HjLqDWm/GdJpRXGJyWbEpee6+qEytMnCzxEKZEPwplo8cFED3M77+uT2uQgi0lJf8Ww3tC
 f+7V03XArBf47xBwzv4g00GjANSYmhUFPpjNYbyjvTMnNzdJBR3fmqBKmDjLKnr2yiI9ur5ZRXx
 hNciNnxUGFGKUdQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: UKNXUMACI6RBFOYAZ5Q2PQRO2M6BOLBS
X-Message-ID-Hash: UKNXUMACI6RBFOYAZ5Q2PQRO2M6BOLBS
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UKNXUMACI6RBFOYAZ5Q2PQRO2M6BOLBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not modify static wcd939x_sdw_ch_info array, so it can be
made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x-sdw.c | 4 ++--
 sound/soc/codecs/wcd939x.c     | 2 +-
 sound/soc/codecs/wcd939x.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 8acb5651c5bc..94b1e99a3ca0 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -23,7 +23,7 @@
 
 #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
 
-static struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
+static const struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HPH_L, WCD939X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_HPH_R, WCD939X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD939X_CLSH, WCD939X_CLSH_PORT, BIT(0)),
@@ -36,7 +36,7 @@ static struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HIFI_PCM_R, WCD939X_HIFI_PCM_PORT, BIT(1)),
 };
 
-static struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
+static const struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
 	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 1f94f49f9829..66af035bd0e5 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -414,7 +414,7 @@ static int wcd939x_io_init(struct snd_soc_component *component)
 	return 0;
 }
 
-static int wcd939x_sdw_connect_port(struct wcd939x_sdw_ch_info *ch_info,
+static int wcd939x_sdw_connect_port(const struct wcd939x_sdw_ch_info *ch_info,
 				    struct sdw_port_config *port_config,
 				    u8 enable)
 {
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 756f497a337c..a6c9c6cee056 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -914,7 +914,7 @@ struct wcd939x_sdw_priv {
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD939X_MAX_SWR_PORTS];
-	struct wcd939x_sdw_ch_info *ch_info;
+	const struct wcd939x_sdw_ch_info *ch_info;
 	bool port_enable[WCD939X_MAX_SWR_CH_IDS];
 	int active_ports;
 	int num_ports;

-- 
2.43.0

