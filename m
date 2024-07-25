Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C9D93C0C5
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 13:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95DC7EDB;
	Thu, 25 Jul 2024 13:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95DC7EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721906855;
	bh=IezU2W8rytHN1+OJjzdCLOScjz5OOSUaMHzxu2FqxSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vKKCwd+HYhRLR7Jgab1GFfPLLdgnBN6Mh+g7GOi4tCf2qkYbok5tvIgmY04UEmIa/
	 KFO3wHEMApj24kNSaP91mdDn1foI18XDmCi7kT7JFAQ91JKotkNVHcxT+hRVlRA7uG
	 xcWW0lCt2iPWDUXZN9glrHpW9BOW0KeB8CBoTIE8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7421DF805D4; Thu, 25 Jul 2024 13:26:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 137EEF805CB;
	Thu, 25 Jul 2024 13:26:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7441F8057A; Thu, 25 Jul 2024 13:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01CBDF800C9
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 13:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01CBDF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hXITvWJr
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-367ab76d5e1so329745f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906644; x=1722511444;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuc1obU/KvJR69EdA4JL3jyV+SdcVptiD/ClFtmUvzY=;
        b=hXITvWJr7H0yL4ft36mxE40KMVox3a0t9z5rLysHFHvqGmJoHhcp5aEGXkQN4ibi8P
         hH03Gb2XrhPigqVtOLAzGCEbDJAEk45+bnZpQ2UYaA5MH5QpGeoUCvnPoZD+yUpqon6W
         0mJ/ysgHGT4MG9IgQnqQegzYE0zr4GlKPPIlR0z1ALSTV5i0MRyjfLZ6V/GrOJdZ7i8d
         OYDIFc7MPR/k9Q5Jq8EMqGmT66wVjZO34Odg5sBFK8DGy4AcXApI1fxiLfMa9IXDP6QS
         qigNzpDc1+dDU4CtiBXhTYEkht/RBVIIc+YIALNEQmgExNxaujZSCeDRSGpsDBZrrtjh
         D2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906644; x=1722511444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuc1obU/KvJR69EdA4JL3jyV+SdcVptiD/ClFtmUvzY=;
        b=W5KfKtLdYoNMMy5Vfu4GLBOLVEQlBgYsLMLeNCn5662lJpb9Y+y03htYqaY0bGWct9
         zGbmAlFYlU+8ERHrg1pHT0rFjYTLjTIoKlXRQyRHrDm+2Celp6Mqa6O/d7nhPmfQo1fF
         kp9fLIa9i/3E4nKgt2wq82WXR584I7+QJwqiYVb1vmLoxEK0Dsevj5sZF6YIDWxgbmWW
         BUoY42GFiZ0ZfR8n6G2Ats1U+M6gD3YIgO+fkSCqlzo+Wr2yeyX/p7u2UEowXQ5uxCGK
         OCpaB2SMgRTLYlZvXSskePAQDCMTvYlikKt2l/Mt2nahskUVwqdE/ZvcZwITqFlpTKwC
         9uLQ==
X-Gm-Message-State: AOJu0YwJn7hHC5x0nIJ0xTAahHbKLM0+Ei+XFrBhHLrHkVrgb51QN07J
	UndWnuyCujE0b447+szErYozeZpPBR4Xc7fP+JbE3d47gKqm8RS89NkkQf9PWbA=
X-Google-Smtp-Source: 
 AGHT+IEpQs3fxfrt410fx954ueUVYLvEFG6tI5ahSFyUrB+n2S+LTUldQrepCDb1PHiuZbAbge4L7Q==
X-Received: by 2002:adf:f64f:0:b0:367:9828:f42d with SMTP id
 ffacd0b85a97d-36b31a4acd9mr1754985f8f.53.1721906643810;
        Thu, 25 Jul 2024 04:24:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:24:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:49 +0200
Subject: [PATCH 7/7] ASoC: codecs: wcd939x: Move max port number defines to
 enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-7-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IezU2W8rytHN1+OJjzdCLOScjz5OOSUaMHzxu2FqxSk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXIk1Qbl0Iz5KBaJYKuj2Qh1UtAtZ0R+L4Iu
 QPHwZbXeJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1yAAKCRDBN2bmhouD
 1zGvD/9lV+y+SrlBfQ7yOLDLv7oPdnM38VM/viNyVIT0BCtBO1cQIqak1MpJ+VzgJFg7wxm45xJ
 rzbYHIQXM4rVzd6z3x4i7KjJqs/tW7gB4UyuLT173BKU0ScNuU01SaoIQvzkGJT7Xs8v4M2ht40
 jQR1xGzufBOfFmJwMgiArP58KcGok2mjx2PHdu3WScEqxlbPCPPovxjQwIyutXPNUMx0PaTsDOK
 33605E8o9Gt4i+E2tTBYCTzJcH5LQjdIFFSySsx8MY6s5vyKbytntCyxaahQZV9Qf8J7dBFX6ug
 RzPLtwP2/LfnGFvngYU64mDvC38Dv4rpl+T7Ufrae4K7Lq4kFkiCa8rRdY3/ActDCYaIVHuG+Hn
 oUS5UvvtETkK0B2oiu1nxWO0U6yR4PWthV+F1KGLANunnSvQio25Pus7sp5PVTHRzbTkC4ngEeG
 tQ6NPBnqrmeOEoQK/v0I0q/FaRAWB3+hGMvUPreQQwKJ0ajNnLDCrQzRXqihzFW0CQf+P6Tpu6D
 RjGbwC/retdTGBnZV03iQKXOAjBuqaGCT6v27jWvCA2d/RT1ven4liULuTqlkWL/lgTFKoTVf7Y
 9ZTfJ3LezBmVls/gHDRczKT3Djr23nUwoIVomyLCZg6OpBtBUD3FLswFdKVX3V5QNXIV8r2Eukw
 g2PsqiVBMnqYuTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: M6MU3OB57QPX6EZUAK6DYM2SIZMYGPNG
X-Message-ID-Hash: M6MU3OB57QPX6EZUAK6DYM2SIZMYGPNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6MU3OB57QPX6EZUAK6DYM2SIZMYGPNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of having separate define to indicate number of TX and RX
Soundwire ports, move it to the enums defining actual port
indices/values.  This makes it more obvious why such value was chosen as
number of TX/RX ports.
Note: the enums start from 1, thus number of ports equals to the last
vaue in the enum.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 1571c2120cfc..3204fb10b58d 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -842,9 +842,6 @@
 #define WCD939X_DSD_HPHR_CFG5				   (0x35a6)
 #define WCD939X_MAX_REGISTER				   (WCD939X_DSD_HPHR_CFG5)
 
-#define WCD939X_MAX_SWR_PORTS		(6)
-#define WCD939X_MAX_RX_SWR_PORTS	(6)
-#define WCD939X_MAX_TX_SWR_PORTS	(4)
 #define WCD939X_MAX_SWR_CH_IDS		(15)
 
 struct wcd939x_sdw_ch_info {
@@ -863,6 +860,7 @@ enum wcd939x_tx_sdw_ports {
 	WCD939X_ADC_DMIC_1_2_PORT,
 	WCD939X_DMIC_0_3_MBHC_PORT,
 	WCD939X_DMIC_3_7_PORT,
+	WCD939X_MAX_TX_SWR_PORTS = WCD939X_DMIC_3_7_PORT,
 };
 
 enum wcd939x_tx_sdw_channels {
@@ -888,6 +886,8 @@ enum wcd939x_rx_sdw_ports {
 	WCD939X_LO_PORT,
 	WCD939X_DSD_PORT,
 	WCD939X_HIFI_PCM_PORT,
+	WCD939X_MAX_RX_SWR_PORTS = WCD939X_HIFI_PCM_PORT,
+	WCD939X_MAX_SWR_PORTS = WCD939X_MAX_RX_SWR_PORTS,
 };
 
 enum wcd939x_rx_sdw_channels {

-- 
2.43.0

