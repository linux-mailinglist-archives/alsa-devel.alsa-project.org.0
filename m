Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC390587F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:20:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D9C4F51;
	Wed, 12 Jun 2024 18:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D9C4F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209244;
	bh=t1W8fZJc08OWTn9drn5Isz85PBMXQQtI8H3pG9X8loI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sfqVYL5P7GVwDR5ti4yarNSsrMa5I8P3pat48oBeigjfb1v8QGXqkMHNp8ykqEJfT
	 Kb3kotoIW3RN/6izifEfrXtT+qvuKOrXd8vBz4yRdnXDt4fe932/GxIztE/j6V/Tie
	 BfdDLthxpria3B5D7PondBqRLf0KAzG0AAu8YS1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51832F80CC3; Wed, 12 Jun 2024 18:16:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA663F80CC0;
	Wed, 12 Jun 2024 18:16:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94D07F805B4; Wed, 12 Jun 2024 18:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88C87F80649
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88C87F80649
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sqaGUBFj
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52c82101407so102503e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208961; x=1718813761;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOyBASUhg7ig8GH/FzL2HhKWigPyyxASUZk5LUtWyQI=;
        b=sqaGUBFjirU1ydK1PWMVS7JkLlG7lqCGWin2TEF5rUN6ctb4Ih0tnZq/pUnlkuVqOU
         0ynUNyXbVt5MCycmORoUsIIbUU+qnbQG3CzxoMbkFxtgObBlcaVPO6rcHmSiPpYDNWnD
         HgBzLPw2SE1dKZb/nwxZNDgrrQ4zNa+u59meCZOsm2+JrQ21KOoQAbYXjWx95ErUC14L
         QeB7ObJq5XkL2kkFiw9Pv+7WBNg7Y6u7y4d0nlify5Plc1G0cDg6MRGcxyl2bShp5ApR
         /nmqDWqAiAyD6NRQ2HpYczMOpD27LSeUT1WHmIAdDfPnSfrIOnyH9Ep9EDV6YZLU8Jsq
         54Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208961; x=1718813761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOyBASUhg7ig8GH/FzL2HhKWigPyyxASUZk5LUtWyQI=;
        b=cRs2CMnCnGqjF3lm/bKlySVv6Urux4FtQywh8hEAvE8i78tBDR6a+8OGL2X5L5R21R
         l903nR48rDSTLITUCa4W1Fp0u1YpY4J8RDQSPyv+sK7Zq6rud2B91ZXlBs2poe1JcqmI
         1htkG6h4P051yaYFhEdpMG/0j6i+SVgp2xWcaEVeDbiPQ8X1Hm2n6t5nTIWlA/424T2n
         aQxHaGRLi0GIFsvIwPxevp2zdexLSU8z3stZshK2R8SjVecJpW7Wv9cyewSo5bORVzBO
         V81BZJw5biRZCRd8JBg7M3HpMxISyqbaPEgmXh3pC1PaYwsjHUPt6N5YjeFI+uIukuhs
         h4Yg==
X-Gm-Message-State: AOJu0YzhaRiyR7ppUgZqlOJ39DTJY2xmtVJZaXkD8oQBWJGy5GOj5WgJ
	dIWBB99vYXbni8PNVkVi7wb9ChcEG16Iad2IIIiTLr2haeP2Q2jY4Hsib0E+LAY=
X-Google-Smtp-Source: 
 AGHT+IEWRBqWsxwgvrJQWye7VveA5xb94vJGDj2onicCiggy/FGFATNeH2oWusyHU6RLe7TqvK/r5w==
X-Received: by 2002:a05:6512:31c7:b0:52c:8342:6699 with SMTP id
 2adb3069b0e04-52c9a403655mr2243960e87.55.1718208961478;
        Wed, 12 Jun 2024 09:16:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:27 +0200
Subject: [PATCH 14/23] ASoC: codecs: wcd937x: Drop unused state container
 fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-14-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t1W8fZJc08OWTn9drn5Isz85PBMXQQtI8H3pG9X8loI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmjKk/cSa0vLmOH1Wr4+Ic2SQUQHPw5w7m0r
 rW1nPqA7zaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJowAKCRDBN2bmhouD
 1+miD/9dW1UyFrklWvHwePml6lmZcpdQMxwTt9JA1H2+9BAq61olORcBTuj/boisiFPdwUwZ/Fj
 YnEhI4V9gRT0Jt5z1JInpiLwN0bx6Z1UVjgGLop5LRhQDwYXOUA8wnoz6iStmtWodULd7ntp2so
 bfQ/tvkf+LafQV98UPAasekyJY+dd9DJXVitrZCkwPAA2NKjye9TE6SosjPkPDI7sw2/KW/T6cm
 I0yHZRHQYpmQr+hfUlKqYevkd57hx5cQeTQJeZ3m48pK/7b8FQBv1cb8A9AHt+EZhLM8euSIrPa
 vWoFQoLqMJBLhC5YZbilAt7A3TAIF96h+kfJH0fWh/Pm2Isb/kgq5TfD2FRVf2ggJLcsHYtqVuM
 SYVPuzdpLeuI6wu2AZRQy6lVeUWaESOLllSncQ3eyRkI5FDiKFiHJmv5Ki5Rudzlm4aigLPrUY1
 MYIYjarXaerHU3eK+PC3n+0eTylWBdvUn7PC9DGftUIAXk2UM0lPnIvEWJigAzS9r/24Y84dHOT
 GPetz02oLUJrSIZpPlVliXi0wHvP0gEECtNEM5Vqxr1YlXbAT46J0cjV6zfWdYAWI7Ez0vVpOUP
 klB9PMMCteeGk8o7ylVAv2IPsxzstcwPFWfNWpkfK1ryiSkNtJZsBokx/q4KE0erop1p8v7wH4H
 3uwiRTC0df1ARYQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: S4C4CCZNUUWKL5HPDM2RPT7I76YEONG3
X-Message-ID-Hash: S4C4CCZNUUWKL5HPDM2RPT7I76YEONG3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4C4CCZNUUWKL5HPDM2RPT7I76YEONG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver does not use few 'struct wcd937x_priv' and 'struct
wcd937x_sdw_priv' members, so just drop them for smaller code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 4 ----
 sound/soc/codecs/wcd937x.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 8b000ba9a469..96e2989f9722 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -103,7 +103,6 @@ struct wcd937x_priv {
 	u32 micb1_mv;
 	u32 micb2_mv;
 	u32 micb3_mv;
-	u32 micb4_mv; /* 9375 only */
 	int hphr_pdm_wd_int;
 	int hphl_pdm_wd_int;
 	int aux_pdm_wd_int;
@@ -113,9 +112,6 @@ struct wcd937x_priv {
 	struct gpio_desc *us_euro_gpio;
 	struct gpio_desc *reset_gpio;
 
-	int dmic_0_1_clk_cnt;
-	int dmic_2_3_clk_cnt;
-	int dmic_4_5_clk_cnt;
 	atomic_t rx_clk_cnt;
 	atomic_t ana_clk_count;
 };
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 834a3e7713a3..f267c66ca959 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -508,7 +508,6 @@ struct wcd937x_sdw_priv {
 	const struct wcd937x_sdw_ch_info *ch_info;
 	bool port_enable[WCD937X_MAX_SWR_CH_IDS];
 	int active_ports;
-	int num_ports;
 	bool is_tx;
 	struct wcd937x_priv *wcd937x;
 	struct irq_domain *slave_irq;

-- 
2.43.0

