Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6045905855
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA73E69;
	Wed, 12 Jun 2024 18:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA73E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209040;
	bh=TdNpNaj0eDwPSxq1ZGkE2FZQIvk+R7zfpn4gMLOjX+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ulWJE2/ZVDaaJPeef0+bL2OhYoX+jFKvH4BOwJqwLhAfHOO1RxXNqW4GbD5qUiSjf
	 PvpldYT4NiBJR3USsDs6Say2LvewwBn+Y24d5GSqjus+ZsgaXwxG7Tf20rrcgQASCR
	 wEa9pIdxM6DTWgHtjxPOUlb/qgvzhi76FhOzOQ+E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95DD7F80640; Wed, 12 Jun 2024 18:16:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A16A2F8061C;
	Wed, 12 Jun 2024 18:16:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FE68F805E0; Wed, 12 Jun 2024 18:15:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D081F80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D081F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bT9uVv/h
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so138353301fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208945; x=1718813745;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaKNd5i+gdVNaPciWa/D++J8qKGcN7FLtSQUh7AiY4Y=;
        b=bT9uVv/hoRtaFmrZiEZDD2/yx19FS6vY057r5o4fEWGgvVFZWl6o/UvgtgBErRE9iz
         ZwB3HAvE5SAL6D2Z6eST/qezNiMGdU6dwt/ShgoB87Wa8Sr8wnmj7xONkUEfG9oeC2a/
         bhOpfPfqxPsZIWFa25ybqAt/7YtxKi/OV2W+6bYAAyGGm+a165Z+7X3EaqvzagHKgOnZ
         1uti2ehOrlQP+oIYT01UJfWE408C1Eg5cRKHr5ZddNsZu2TTfvdrj57gobUfCo2mebue
         mklf6/e1vIh9mdELk3cQzmKMuFrYog4sgBLWp7lXWIwsDC7RKrSgr0o9qFUtSTTdZa8Y
         brWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208945; x=1718813745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaKNd5i+gdVNaPciWa/D++J8qKGcN7FLtSQUh7AiY4Y=;
        b=gVKcJczYbMZKDnlSgqrzBGtKO0pXkrvNqyxmCW9GVrkeMANO9RSei+4kt+fcSARDfe
         JowOBVr0Q0E/YQnANYIzvcoF/pE7IcTclhnl3JaNOPmblQSVBZ5Ux81vQrlwik+Kq9GA
         lLAOeQ8E+tX56qrexmGG2MCuIB9KgiS/Li1BnQNub4zqmaSiW6fWcSmpd18jABSz7eBl
         L5zSS8bmgR22mOqZ1xecZv/hwAhtdDescnsEeG1aoq7a025UijaWvlOFMRQ84Tx3Q8MK
         1Trr8gBpZnP5CUncjEetq/x5LzLjHUJBcsGtv7yJHuZICO18L4JQvPLOWBxw5PCQ709x
         1+TA==
X-Gm-Message-State: AOJu0Yzr6XNBPkGPSIhvudrePcWIx1qlUdAP5X3u5BMZQePN753bieBB
	gOAwCEySe6Ln8RZbVXVXMGXPkqeVRduKeB40Q95I/C86MlIl2/P1nZT2DL5bjuo=
X-Google-Smtp-Source: 
 AGHT+IEzwT2wxUG76kYf4EvMc9Yl30u9Y8PGMPa0J3TjZNyfXgkujITCkQDy+SdY3WFDHmynS9zvlg==
X-Received: by 2002:ac2:4255:0:b0:52c:823f:2a10 with SMTP id
 2adb3069b0e04-52c9a3bfbacmr1594725e87.1.1718208944923;
        Wed, 12 Jun 2024 09:15:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:15 +0200
Subject: [PATCH 02/23] ASoC: codecs: wcd9335: Drop unused state container
 fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-2-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TdNpNaj0eDwPSxq1ZGkE2FZQIvk+R7zfpn4gMLOjX+A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmY8YBeHR15m8f+5MErlfvmIqZp0bmj+SsSf
 RNUS9y57USJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJmAAKCRDBN2bmhouD
 1wL1D/4m9Z8zECPMaR+QlPgGunewXkoXk4J8kftoxOJj041f12JKBnLg6dCCKMumkStuyALj26P
 GTcjwaDvh8pZ5ZDQdWRsIkz0ybb+P/SV4w+fFivPV5aCA9vSd8FhFe27SR/cR5pUHdaOZbbCCwa
 7wdTp6mQ8vU/913MBTKAmIwvyRxxUYgizmDR+DCXgCqW4DXSiStrHVgWxNpTHGrr6y6FOOs5jHE
 98kKSF0cCcmjlSBq066h1hq5n6RdiAWXqQ09R19dGMGIVh/+2tBtmhqdLsJuOpJv7U7Icuj3+wz
 Nos33lpPPUdIP7fjGEsrCfjTEHwYm9XWH5lLbFHAiL02thR/RSmCITEUjr2wHXfitMb7/BwlXbA
 r5RSwDsmqyIJTBxg2Ai90wyi2k3OxY9Z1Wv2D7/8A9pInpnBnn1/4dRebMXHO16T5TeNfESqOqo
 r0yonRkAWKWERkv+/Uwcb8FVJ/axk3ruw6xL6kG00RORnksktUrVx82ugI08z7Dt7h2x2eL6GWn
 9JoeEUUWe9aJuMELV/BWAb2UuzdbomV7pXF6on3ZH4310rP2TBQda6pWWWKRmnLdb00KkTrWmZl
 OzoEH4Ir5kYhjM29ccF3nGwj845CsJGLXUivBinWBT2uxMvuWGRQmU8IKJYCHMSElYQze7OFE4V
 dI8DwQKo7I0y9Dw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: D2QWCICEA4R4RLYDEKLLA7SHLNULEM2U
X-Message-ID-Hash: D2QWCICEA4R4RLYDEKLLA7SHLNULEM2U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2QWCICEA4R4RLYDEKLLA7SHLNULEM2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver does not use few 'struct wcd9335_codec' members, so just drop
them for smaller code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 42a99978fe5a..60e7704e48d2 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -297,7 +297,6 @@ struct wcd9335_codec {
 	struct clk *mclk;
 	struct clk *native_clk;
 	u32 mclk_rate;
-	u8 version;
 
 	struct slim_device *slim;
 	struct slim_device *slim_ifc_dev;
@@ -347,8 +346,6 @@ struct wcd9335_codec {
 	int dmic_4_5_clk_cnt;
 	int dmic_sample_rate;
 	int mad_dmic_sample_rate;
-
-	int native_clk_users;
 };
 
 struct wcd9335_irq {
@@ -5109,7 +5106,6 @@ static int wcd9335_bring_up(struct wcd9335_codec *wcd)
 
 	if (byte0 == 0x1) {
 		dev_info(wcd->dev, "WCD9335 CODEC version is v2.0\n");
-		wcd->version = WCD9335_VERSION_2_0;
 		regmap_write(rm, WCD9335_CODEC_RPM_RST_CTL, 0x01);
 		regmap_write(rm, WCD9335_SIDO_SIDO_TEST_2, 0x00);
 		regmap_write(rm, WCD9335_SIDO_SIDO_CCL_8, 0x6F);

-- 
2.43.0

