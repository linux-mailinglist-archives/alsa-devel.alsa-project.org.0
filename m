Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF18FE791
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2182A950;
	Thu,  6 Jun 2024 15:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2182A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717680058;
	bh=nFhoqr2wMY0whfkoabem9irTKvdC4/rV+7S2nXCIz4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W+upf4dP6vNn5aPhRB0LW0Z+5F0g9HMNW5sbxFrsr+mRqXOFA9XCEpjjWzqTTCyi7
	 2zPWfY6dbcgj+IfLjwx27v4RLw3+37ILpdn0QhgSg1vTBhVbZqKa1ScIaQ2AZvVOQb
	 fiMnFi+BaylzOf8t66qvO6I5GwwO7ptgkb3rroL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29DA5F805AD; Thu,  6 Jun 2024 15:20:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FADBF80587;
	Thu,  6 Jun 2024 15:20:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DB7AF8025A; Thu,  6 Jun 2024 15:20:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DDE4F8025A
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DDE4F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gsZWiFMm
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52b938587a4so1096434e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717680026; x=1718284826;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1VkxcrZpp4kvTeXW7bP9jyRSyfs9NM9XyTq3inohO0=;
        b=gsZWiFMmP450DcdlWP+1mVt+xl2rcv+QcG+u6+uPBq0ssZ9SePNgVTTzaYDA/mYp3g
         /zsyangG703bd2BgWYDlutDL/0TZHabbt5Fm/Q3XcIs36KIbS8CGo96+VVfXt0okwNwq
         S0Pn79uAHTr0FlL5Gnh3mAdv90fI3ICQgqe9wDCkeeWS5vUtM978Un5sg/yTIu7Y2fSj
         PaCpqkzHxYQa7HnxFdZKFdB+Aqslfvi9yECbuvbcOots37BfDHzbcK+IbTQ5/xtFZsP2
         jqp1wE/7/fVggObYBp2XyH+F8k0BCPjmk4VOHnc7Kn+yuGFnowvO81LjIDHEZ9yv6vHm
         ufKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717680026; x=1718284826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1VkxcrZpp4kvTeXW7bP9jyRSyfs9NM9XyTq3inohO0=;
        b=KS6t4NDXRp2e/HvkcYuWbNHrlezdJu/awDdTeKwUWN/uNfKXjsM0BjEzd860betH71
         SLfW7Ye2LkQQ9ZHTeRa2my3IXs0EmeBSjFcKwPqwvCvlRtetk7VxEmQPYd5VdoiU+oe2
         gUdEQJqG5n+/WxoxEdLqoYFxehHIocUEsbwnlLmoSN0o5quYIrAxSKDBrejIpn1T8+/P
         2SYmeP13kDpTIO5jLMk4LvgH1e4aUxKM+MPgD+f/oNX+N93uSuXgrk5TR1wx1bo4ESST
         8XAZ8+0icyI82DxS/ohZ7oMO1sC4GTOQBdSH0W2y+iN3vd4ZjtF/sdAVnfI4shKCOVus
         IF3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT4Q2YAwHCI+Yt8gK2eG9LriUeRoeY0lno19xf5ZA7ec3to0RrdlYx3LPCh/Z5AAaIwoCL9pwlL7HlyMnLJ1wmpPPJyLe7Ag2VQts=
X-Gm-Message-State: AOJu0YzTGtUGTwVxG52C5ZKtHwPmoIkVR2MmQMI/+vbNzKkAF1RL8x4T
	d07fYrO8Lgr3LIX6f1gjhqIj5SNOHm7lHgoZux+MI0KI3JHZ+6h3alaro3mcBJCJPJwGhPhPi2S
	2
X-Google-Smtp-Source: 
 AGHT+IFYvdUuHBNDMes2MT9Yl3Cwenx25oAenPp97LW2+dMe2ZDRFwQqBUtrPymBHEUXEvXS2p/PGA==
X-Received: by 2002:a05:600c:1da1:b0:421:1d5:c0a3 with SMTP id
 5b1f17b1804b1-42156351b48mr45599345e9.28.1717676779622;
        Thu, 06 Jun 2024 05:26:19 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4216412972fsm275325e9.47.2024.06.06.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 05:26:18 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	neil.armstrong@linaro.org,
	krzysztof.kozlowski@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/2] ASoC: codecs: lpass-macro: add helpers to get codec
 version
Date: Thu,  6 Jun 2024 13:25:58 +0100
Message-Id: <20240606122559.116698-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5254;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=SVW44utVjXNuFZ+AypBWA7rXwY5vRIX97O/MMF4uf9s=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYarX1Kwrp4yWxHLOe/EW1JkSYs+Bk1zuaPMAn
 INHrpzyxzCJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGq1wAKCRB6of1ZxzRV
 N7vcCACz6rY+yaz6h4BXF37jugKcZemEzbE09Ij7IgQiw+yIeGl+ZPUevNTssCSVsa+xxhT0ydX
 NDWD0BfkaTMVVoYhkK0jDGGK9SRkKEHKBhjqYGi3r8EO6u+/KVNxYnEIZj7Hy6gS+hBm2fRFBxp
 Mcr1b+DIcTm8ix2tY6QYC3IuSDEf3XnHmM6rke2wccewGoaaIsOWyU/h1gTYkPjxj6X5/oUqdff
 WU7t+PrMBaTZdrwkYCSNSghhFLYQo3vu7/pMbgSo7b6gnT/AHIpA2UQbVealQSTPnc1GtsHUGp3
 xHNI8OymXQNiU6O17CcFVMjQo5edypZtlnt+TZsbIUeGBoD1
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KJEUCCWN2XZD3WWRONFGY6NBHGKY3M4U
X-Message-ID-Hash: KJEUCCWN2XZD3WWRONFGY6NBHGKY3M4U
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJEUCCWN2XZD3WWRONFGY6NBHGKY3M4U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

LPASS Digital codec have changes in register layout across multiple
versions. Add a proper way read the codec version allowint all the lpass
macro drivers (tx, rx, wsa, va) to configure the registers correctly.

LPASS VA macro has the required registers to read the codec version.
Read the the version and make it available to other lpass codec macros
using the common helper functions.

Existing method of using LPASS IP version is not accurate as the same
the codec versioning is totally independent of LPASS IP block versions.

These helper functions should be able to provide a convient way to get
the codec version, and will help scale the drivers in right direction.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-macro-common.c | 14 +++++++++++
 sound/soc/codecs/lpass-macro-common.h | 35 +++++++++++++++++++++++++++
 sound/soc/codecs/lpass-va-macro.c     | 29 ++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index da1b422250b8..a640bf88a6cd 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -11,6 +11,8 @@
 
 #include "lpass-macro-common.h"
 
+static int lpass_codec_version;
+
 struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 {
 	struct lpass_macro *l_pds;
@@ -66,5 +68,17 @@ void lpass_macro_pds_exit(struct lpass_macro *pds)
 }
 EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
+void lpass_macro_set_codec_version(int version)
+{
+	lpass_codec_version = version;
+}
+EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
+
+int lpass_macro_get_codec_version(void)
+{
+	return lpass_codec_version;
+}
+EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
+
 MODULE_DESCRIPTION("Common macro driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index d98718b3dc4b..f6f1bfe8eb77 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -18,6 +18,18 @@ enum lpass_version {
 	LPASS_VER_11_0_0,
 };
 
+enum lpass_codec_version {
+	LPASS_CODEC_VERSION_1_0 = 1,
+	LPASS_CODEC_VERSION_1_1,
+	LPASS_CODEC_VERSION_1_2,
+	LPASS_CODEC_VERSION_2_0,
+	LPASS_CODEC_VERSION_2_1,
+	LPASS_CODEC_VERSION_2_5,
+	LPASS_CODEC_VERSION_2_6,
+	LPASS_CODEC_VERSION_2_7,
+	LPASS_CODEC_VERSION_2_8,
+};
+
 struct lpass_macro {
 	struct device *macro_pd;
 	struct device *dcodec_pd;
@@ -25,5 +37,28 @@ struct lpass_macro {
 
 struct lpass_macro *lpass_macro_pds_init(struct device *dev);
 void lpass_macro_pds_exit(struct lpass_macro *pds);
+void lpass_macro_set_codec_version(int version);
+int lpass_macro_get_codec_version(void);
+
+static inline const char *lpass_macro_get_codec_version_string(int version)
+{
+	switch (version) {
+	case LPASS_CODEC_VERSION_2_0:
+		return "v2.0";
+	case LPASS_CODEC_VERSION_2_1:
+		return "v2.1";
+	case LPASS_CODEC_VERSION_2_5:
+		return "v2.5";
+	case LPASS_CODEC_VERSION_2_6:
+		return "v2.6";
+	case LPASS_CODEC_VERSION_2_7:
+		return "v2.7";
+	case LPASS_CODEC_VERSION_2_8:
+		return "v2.8";
+	default:
+		break;
+	}
+	return "NA";
+}
 
 #endif /* __LPASS_MACRO_COMMON_H__ */
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 6eceeff10bf6..0ae9e6377e3a 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1461,6 +1461,33 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
 	return dmic_sample_rate;
 }
 
+static void va_macro_set_lpass_codec_version(struct va_macro *va)
+{
+	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;
+
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
+
+	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
+		version = LPASS_CODEC_VERSION_2_0;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
+		version = LPASS_CODEC_VERSION_2_1;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
+		version = LPASS_CODEC_VERSION_2_5;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
+		version = LPASS_CODEC_VERSION_2_6;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
+		version = LPASS_CODEC_VERSION_2_7;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
+		version = LPASS_CODEC_VERSION_2_8;
+
+	lpass_macro_set_codec_version(version);
+
+	dev_info(va->dev, "LPASS Codec Version %s\n",
+			lpass_macro_get_codec_version_string(version));
+}
+
 static int va_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1554,6 +1581,8 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_npl;
 	}
 
+	va_macro_set_lpass_codec_version(va);
+
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
 		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
-- 
2.21.0

