Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832E906A75
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 12:51:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9070B86E;
	Thu, 13 Jun 2024 12:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9070B86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718275878;
	bh=PgNLZik2/9wkjqoeRVNR87TCWAib9EUc20HbSUideJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EFNYhU17SySeCZgNLk6rvcYHAYH8MQdnlUcdStGct8VOHBl88Q+kam5IKlQIFlFhN
	 4H7eXCJ0Ovbrd8f3ogbR+tBcKXsQyJF3/m/Kchp+vwx/phVCTWyKcDhh/C3XedhBHf
	 dWH27L5/K1jusyUlu7cDJ4EolEXUeDCKpC5l84JM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E1DDF80635; Thu, 13 Jun 2024 12:50:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4017F8061F;
	Thu, 13 Jun 2024 12:49:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD12FF8060F; Thu, 13 Jun 2024 12:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7B73F80448
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 12:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7B73F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PovLakyI
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57c6011d75dso850254a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718275782; x=1718880582;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcFNYVwCT4edf08hn0wtemVgpKp4KmFtiLch+NSN3FY=;
        b=PovLakyIxcqtTk+nHHGArl2F/s0WSFDGeS8cvK89OtwvjUgIrEX1utEb0HEvOQdkAW
         YqXBufy9ddCIlooT6nNjRQn0LFzHTy+gR28B8/I80UAD/Mg6Fyymlur6Puq0DIhNwzun
         09SfPSV6jqHMJOuc01KXlEVQ/TFFnpxBkUlFXV/wxeIGuRldgFsT0FmOHZYPHYt10gvB
         fdE9/W9qw585kqnf9BsnVN/Eh2C2Tex2tIZgwTEpxkSdG3KR1k28aWqr0VrVJ6KVIALc
         QHgPnHcRPkCDPnxFuWa/mfttYfBI3YREH32aQinTgLxotdOz+b+Ajc3ZBhNHbCq2jsr+
         XLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718275782; x=1718880582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcFNYVwCT4edf08hn0wtemVgpKp4KmFtiLch+NSN3FY=;
        b=XyglLNQBRYwsc7wvROSaBcQSdIrvLeqyJC+4ksDk1JdW8VZ8w9eiAW1/POIATJ6+CR
         LLXF2QrFsKcIwsL4e6ktLpNQNOERKymAe2w2NjIr/R0lhOm48MVYsbf6v6XRUdNGSv5f
         QsMRmoQSpvaSaXdtD5aDvOo1BWxmS3EyOX8U40o5+pz/w6oxbSUtefCM4VFWKfeR3+jU
         TaMraq9ZHULOXLNZ5VNDJpyeXDfgjXO6DWrL9Ps++N2qevu3JHBzJsUzth75DGHyMso9
         Yir8iNtVT5NQPwlHCA0wTi69aDsrbclb87g07g798qYLVR6sTD885iOmrOy6clBGuSMr
         D5+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcfksoezR/gJZAWiK+ZjzBVgTX3usnskU74gzE8j205Gm8tKaSSfiJK4b3qV4HxFpiHGVZEROMQWt3XCLgATaN4NbCKodgcuvprPs=
X-Gm-Message-State: AOJu0YzRwMKeMPaOYZn4Frswnffbg9UOyCq+gpHx5ixIpPoMW4FD1TbL
	t8UhWIgZl8rHFkX3c99XBhVQmCcBTM07pTcdxU/NdFkSWSvnjln29PKmb7OE8jE=
X-Google-Smtp-Source: 
 AGHT+IFKzLuPEWkbGqQk+dBt+3yOu7WlU49DD9ThzsaA4PBLn2bNwKRKNuVL0SoB/eyVF60AqsTcfQ==
X-Received: by 2002:a50:d654:0:b0:57c:6bd6:d8e5 with SMTP id
 4fb4d7f45d1cf-57ca9756c4dmr2854608a12.8.1718275782417;
        Thu, 13 Jun 2024 03:49:42 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72cdf2bsm762618a12.17.2024.06.13.03.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:49:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 13 Jun 2024 11:49:31 +0100
Subject: [PATCH v4 1/3] ASoC: codecs: lpass-macro: add helpers to get codec
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-lpass-codec-v25-v4-1-f63d3676dbc4@linaro.org>
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
In-Reply-To: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5630;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=PgNLZik2/9wkjqoeRVNR87TCWAib9EUc20HbSUideJ4=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmas7D4WJzYEkvV+HMxnKTCmx8TblRv5xGiPIoZ
 YO0D4L3e6GJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmrOwwAKCRB6of1ZxzRV
 N9zlB/4iB3ZfIpHfzMJunK24LsZ8s3Re5S2AC420Eg2nxEq3QaQqZZE57U+1lWNdlwb/L0S68D5
 xBFDRXs+vElK8W2/JZ5nmzmakRJwXeePLrTdfKF1oqKgrjPns8y7BDEUNwQx6vQqsFCFwQY9RoH
 NbmPcuh9DsGGT2RKulakz0QVNBsIYv7zKmkjXSSt3z9IZswYlSfNAfegtN0fmlZP7F2CTNo5RZ4
 hVaCGoaK1gg4Upyp3dYVmwEywMWIQVijiLp36C4TLS56SZlVzxBxBS4mooM3fPy8w5spJD7emHD
 7Q+myNvXRUSrJFngsykug8UPTI5h2YEEIQILHKZmaaTEeuCb
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: ZV5VIIXEDQ25C7EU6HZQATAW6YPYMQVY
X-Message-ID-Hash: ZV5VIIXEDQ25C7EU6HZQATAW6YPYMQVY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZV5VIIXEDQ25C7EU6HZQATAW6YPYMQVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
---
 sound/soc/codecs/lpass-macro-common.c | 23 +++++++++++++++++++++++
 sound/soc/codecs/lpass-macro-common.h | 35 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/lpass-va-macro.c     | 28 ++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index da1b422250b8..8b038a99a8f9 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -11,6 +11,9 @@
 
 #include "lpass-macro-common.h"
 
+static DEFINE_MUTEX(lpass_codec_mutex);
+static int lpass_codec_version;
+
 struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 {
 	struct lpass_macro *l_pds;
@@ -66,5 +69,25 @@ void lpass_macro_pds_exit(struct lpass_macro *pds)
 }
 EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
+void lpass_macro_set_codec_version(int version)
+{
+	mutex_lock(&lpass_codec_mutex);
+	lpass_codec_version = version;
+	mutex_unlock(&lpass_codec_mutex);
+}
+EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
+
+int lpass_macro_get_codec_version(void)
+{
+	int ver;
+
+	mutex_lock(&lpass_codec_mutex);
+	ver = lpass_codec_version;
+	mutex_unlock(&lpass_codec_mutex);
+
+	return ver;
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
index 6eceeff10bf6..a555e1e078eb 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1461,6 +1461,32 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
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
+	dev_dbg(va->dev, "LPASS Codec Version %s\n", lpass_macro_get_codec_version_string(version));
+}
+
 static int va_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1554,6 +1580,8 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_npl;
 	}
 
+	va_macro_set_lpass_codec_version(va);
+
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
 		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,

-- 
2.25.1

