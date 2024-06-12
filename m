Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A438905946
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:58:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B72F53;
	Wed, 12 Jun 2024 18:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B72F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718211511;
	bh=QS7ScGSvChG6xp5GTpKBp7tDBC6NTj2IN1ffDCw9zis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lCOizW/Qrjp8A1OxHDDG+sezriFHphRxhI7vZP4hXJogkaRABN6tg6fouCMih9uZp
	 MlW4Q0sKVkSBUrn1UPpLjAQhGd7M2wfudDwoCHEMYQJWHKjaL1iFJmW1ZpwwnvX6ji
	 FGz3EQlda8YggffM4a+TA9NhsQvooD84Ao8wf8C0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53CDDF805E2; Wed, 12 Jun 2024 18:57:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B4CFF805C3;
	Wed, 12 Jun 2024 18:57:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20D33F8057A; Wed, 12 Jun 2024 18:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1909CF80496
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1909CF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FJka2orR
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so3184654a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718211461; x=1718816261;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2VscKvagWv42zk0rH8fHiJS5R2BnPnKyuPT4PU71oU=;
        b=FJka2orR8e7LCqC2LGee0cHtNiC6TPd0twTgFn06jm9S0p++0ICXrrurFC2SxQgv5Y
         AI3FCtD5Pw6trktS5xrbBdQFAx+N7yVM5j/Fz6R41deE/2xWxEsGpKt5OVo3Lxm6Kwqc
         1QPhGKJI8E5cMyP6BYtxUwqlBPcZFwNYRm8fIxGXiVpsXWImGEU+8gwxqN+REuvCivqR
         Z9s+0IxEm5zgkO/eGS51osJu4AIeRcNG6F4fF4yiMkzQz9kUNlaek4UMzwvemaKLsIn1
         Hd7h8dZ79LdUmV6ve7Z7j4Ix9hDVjneES5ISUP7qnxbgbmmF6HenCO+6gmqsjAtZq1/7
         gbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211461; x=1718816261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2VscKvagWv42zk0rH8fHiJS5R2BnPnKyuPT4PU71oU=;
        b=hsW1CDcMzwdiifGXlrE61BaqjJngxEwujRxEjbD/qRl+43U79FRhHOvJufsAFcbwEs
         QqEoRRlJ+qreT+N82/so435L4zxG6R7Siql843kYyEu5BWD2VnbVV5q5VXhBLbGd1ulJ
         dYvNv2yECQ5xSFMea4uQZs2gn9/BSC1eme57qB6mBof9h1+KjueddF68JFdyzNkxMDR5
         NS509mggk3pMMrQxtt7x+7JwoQnEXlOjcptSH7oaA8BacLD1YjBl6FuTWB0dRvQ96+ES
         q/5IeNGlSvyGNpG07fgUBvl5Wvoysi12Q7cqgLC3HHi1RjQi+k3lAhdZz7uezcOrgXoN
         vCig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw/PSj7rckTzdzaxA3yQFhOLCMahxii/vRZ7ZXZZsB2Iw+8yGILHCLezo43onL0g8GgC7y6Ldoznfa3mKmpqtLcVDv9pJ5+8Fquns=
X-Gm-Message-State: AOJu0YzSltzEtOgBJtLUfRkw0Fb7HsW9G82uBB8QsSmLmf7hDsrHiKuA
	xd650USUDhohiu9kt/op4RCM2miWVlR2kYxGtHuJxk2O+CLYB3qX71/17gyu8gM=
X-Google-Smtp-Source: 
 AGHT+IGM4yc/dCEC8LphBApl+osZjzqVFWThQMW4KCh/iLJQ2LnUNw777Wua/PKH1brzgkwN6ZTctQ==
X-Received: by 2002:a50:9308:0:b0:57c:947c:f9cf with SMTP id
 4fb4d7f45d1cf-57ca975348cmr1464177a12.11.1718211460623;
        Wed, 12 Jun 2024 09:57:40 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57ca8caed84sm1564048a12.43.2024.06.12.09.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:57:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 12 Jun 2024 17:57:21 +0100
Subject: [PATCH v3 1/3] ASoC: codecs: lpass-macro: add helpers to get codec
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-lpass-codec-v25-v1-1-9f40611a1370@linaro.org>
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
In-Reply-To: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5501;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=QS7ScGSvChG6xp5GTpKBp7tDBC6NTj2IN1ffDCw9zis=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmadOCpFW8pCZXDP3+balgrD4sCE41Hm01FCb6R
 YVwEt0s1/eJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmnTggAKCRB6of1ZxzRV
 N6i9CACT/QlUOPB5omYnZ6qstzzmu6b25APVOmiYf+JCWDUIxwQ1FQlxpvwCljpgqCEyDZNZ9KY
 cd65GUmNVF6q/5hnX8IDu6J+OIXEEwIOQ1QQPS7hGPPd+mrEQeKrm9GD0EajMrkpyfRz3DeE+0s
 tgTdnOejrCM7VbgN3RqvnHnMVBlS/4kvZw/Id+z0X2rB86Jzg0JjRDNM1SGhsR+1GkRh17bUAlQ
 vuZUh8tn+pKbLWKWKJpV5V5y6QHgb+MtDkstVcpgvPyA2gnuKzFhie1sBgmxQrMkTEm85uw3Ecu
 VEVFPhyMAxkiPgLAXlhY/eGVIyDHeyCiuNpBhSvkIKPqvWYL
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: KYIPSUHBZTVKSU34AFIAHHLJO7OQLDEF
X-Message-ID-Hash: KYIPSUHBZTVKSU34AFIAHHLJO7OQLDEF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYIPSUHBZTVKSU34AFIAHHLJO7OQLDEF/>
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
---
 sound/soc/codecs/lpass-macro-common.c | 23 +++++++++++++++++++++++
 sound/soc/codecs/lpass-macro-common.h | 35 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/lpass-va-macro.c     | 29 +++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

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
2.25.1

