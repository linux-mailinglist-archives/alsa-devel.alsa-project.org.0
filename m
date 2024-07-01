Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A891E677
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 19:20:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 514B1E9A;
	Mon,  1 Jul 2024 19:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 514B1E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719854406;
	bh=dqfvYGwmOKhaiFHa1zCpcfeOXkzk+rPswzjvChsg7so=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FE+h4La8TyPkfDSIcjcC/dj7mykB+/D+/k27CG1Kw/KfbNcYzIs7PAZwlgtsvbDLK
	 3m3r3okW6ARlYoA/85OetrV9LAGKPtsE0prPg0RWHfVZljCRxOg14ASvkGhREBoQ+P
	 asCcnRn9XC1BtUjN1G3laDO1FX7hoSBr6jSRz0pQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97D9BF8045D; Mon,  1 Jul 2024 19:19:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83153F805A0;
	Mon,  1 Jul 2024 19:19:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51295F8028B; Mon,  1 Jul 2024 19:19:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69F1EF8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 19:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69F1EF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PZQODAPw
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-364ff42999eso1193144f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719854361; x=1720459161;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mFg/9L3rp+k4GtkOLXisVJYUePHQn+Z+ti8m2E06xN0=;
        b=PZQODAPwXqUwDT3NW0ey3LeRhQtDxZlY1nF2M3i7i7HoOrEYVYUvsCSX06Hub0TVdu
         5DjMPLfv92UHenrnVNwkeptbWck4O+e4l9u9f8XYQItOuoOw+7LM3CGw4e45zBo2PZHx
         rPduVNqV3+Mpab4K9pMHEYnKpZYu96YiTGL09F4gbsK/yBn1ZrbMNx7C3XNJPEZsoicD
         tPt3UyAvVdh529SAg/IKwFzu+9bk4cI/TaMTd4W8PptGHmNzMVWl6wu/QWryeuemTgaR
         5eDdDzfdA6NpTzmrPgVLXwpL5H8vN6charr3/qdeJ1BaTaEQ1W3tJC/+8ouz4gr3me9Z
         R8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719854361; x=1720459161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFg/9L3rp+k4GtkOLXisVJYUePHQn+Z+ti8m2E06xN0=;
        b=VM0ler5X9BWMyzXwcdCgF1XRcJrk+xqp5Vb3FgIJbkJP8Q9Xn1sEBqhjjJAHpz0lwM
         I097d41XJH9uJJVlHkIjdXRayBUsxY3QAhYFxv2gvHlKGPUYQ3YHGRQ7YP7lB+HAfVcJ
         KZrF2HCBne23wHvrhYL2t6MG0vZM5ZyCp2LBRScE1iIQlhFgVNF2Bh8Dy0yCltUUh+3C
         V9KFGUvzyKcs7Y13LOHANmR3nvkeyhY9b5ieVhI31H9qhwmMBvPe9FPlc2onFXLI2ZPU
         L4Psbttu8JophYZn3NtbBsSMntTsUhyCNg9rkVJyszg4LRMGn8HUIS7kJZhQBLIIXS5Z
         UzuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTePJE2tXtroMtptDcbyIA6yKBF73XCRLFI3ZyvlfUkyWQU2qpBbSzJQlDGb0CpLYG2lquXEgvo1d5OBbb3KtOY7DHSgATiz/nIWU=
X-Gm-Message-State: AOJu0YyXQ20w6os0WPLjq8QN2V5ybCnBxg4lhO8Pboo3JgPG+ZX9Gar2
	iNlnL3AgbntI5KrRETmaDAvJyXy5eic2HjM0J5Cq1hp3m/Ig/jf4xTmMwYWj/Nk=
X-Google-Smtp-Source: 
 AGHT+IHNR1ABH6PKyzk7JMg6Jn5J0bcvxQEYovEtPBYvIHQfTDJs3e3xsSp6WhWeIyvAPFDDKwmFyw==
X-Received: by 2002:a5d:5f56:0:b0:367:437f:1785 with SMTP id
 ffacd0b85a97d-3677569950bmr5309302f8f.13.1719854360985;
        Mon, 01 Jul 2024 10:19:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a112e19sm10581137f8f.116.2024.07.01.10.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:19:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: codecs: aw88395: Simplify with cleanup.h
Date: Mon,  1 Jul 2024 19:19:16 +0200
Message-ID: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DZDYO2X4WTMBMWDJEYWPNXRKUADNQRE7
X-Message-ID-Hash: DZDYO2X4WTMBMWDJEYWPNXRKUADNQRE7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZDYO2X4WTMBMWDJEYWPNXRKUADNQRE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate memory, which is being freed at end of the scope, with
scoped/cleanup.h to reduce number of error paths and make code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/aw88395/aw88395_lib.c | 51 +++++++++-----------------
 1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
index f25f6e0d4428..769ca32a5c8e 100644
--- a/sound/soc/codecs/aw88395/aw88395_lib.c
+++ b/sound/soc/codecs/aw88395/aw88395_lib.c
@@ -7,6 +7,7 @@
 // Author: Bruce zhao <zhaolei@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc8.h>
 #include <linux/i2c.h>
 #include "aw88395_lib.h"
@@ -361,11 +362,11 @@ static int aw_dev_parse_raw_dsp_fw(unsigned char *data,	unsigned int data_len,
 static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *data,
 				unsigned int data_len, struct aw_prof_desc *prof_desc)
 {
-	struct aw_bin *aw_bin;
 	int ret;
 	int i;
 
-	aw_bin = devm_kzalloc(aw_dev->dev, data_len + sizeof(struct aw_bin), GFP_KERNEL);
+	struct aw_bin *aw_bin __free(kfree) = kzalloc(data_len + sizeof(struct aw_bin),
+						     GFP_KERNEL);
 	if (!aw_bin)
 		return -ENOMEM;
 
@@ -375,7 +376,7 @@ static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *
 	ret = aw_parsing_bin_file(aw_dev, aw_bin);
 	if (ret < 0) {
 		dev_err(aw_dev->dev, "parse bin failed");
-		goto parse_bin_failed;
+		return ret;
 	}
 
 	for (i = 0; i < aw_bin->all_bin_parse_num; i++) {
@@ -387,10 +388,8 @@ static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *
 					data + aw_bin->header_info[i].valid_data_addr;
 			break;
 		case DATA_TYPE_DSP_REG:
-			if (aw_bin->header_info[i].valid_data_len & 0x01) {
-				ret = -EINVAL;
-				goto parse_bin_failed;
-			}
+			if (aw_bin->header_info[i].valid_data_len & 0x01)
+				return -EINVAL;
 
 			swab16_array((u16 *)(data + aw_bin->header_info[i].valid_data_addr),
 					aw_bin->header_info[i].valid_data_len >> 1);
@@ -402,10 +401,8 @@ static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *
 			break;
 		case DATA_TYPE_DSP_FW:
 		case DATA_TYPE_SOC_APP:
-			if (aw_bin->header_info[i].valid_data_len & 0x01) {
-				ret = -EINVAL;
-				goto parse_bin_failed;
-			}
+			if (aw_bin->header_info[i].valid_data_len & 0x01)
+				return -EINVAL;
 
 			swab16_array((u16 *)(data + aw_bin->header_info[i].valid_data_addr),
 					aw_bin->header_info[i].valid_data_len >> 1);
@@ -422,20 +419,17 @@ static int aw_dev_prof_parse_multi_bin(struct aw_device *aw_dev, unsigned char *
 		}
 	}
 	prof_desc->prof_st = AW88395_PROFILE_OK;
-	ret =  0;
 
-parse_bin_failed:
-	devm_kfree(aw_dev->dev, aw_bin);
-	return ret;
+	return 0;
 }
 
 static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 			uint8_t *data, uint32_t data_len, struct aw_prof_desc *prof_desc)
 {
-	struct aw_bin *aw_bin;
 	int ret;
 
-	aw_bin = devm_kzalloc(aw_dev->dev, data_len + sizeof(*aw_bin), GFP_KERNEL);
+	struct aw_bin *aw_bin __free(kfree) = kzalloc(data_len + sizeof(*aw_bin),
+						      GFP_KERNEL);
 	if (!aw_bin)
 		return -ENOMEM;
 
@@ -445,14 +439,13 @@ static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 	ret = aw_parsing_bin_file(aw_dev, aw_bin);
 	if (ret < 0) {
 		dev_err(aw_dev->dev, "parse bin failed");
-		goto parse_bin_failed;
+		return ret;
 	}
 
 	if ((aw_bin->all_bin_parse_num != 1) ||
 		(aw_bin->header_info[0].bin_data_type != DATA_TYPE_REGISTER)) {
 		dev_err(aw_dev->dev, "bin num or type error");
-		ret = -EINVAL;
-		goto parse_bin_failed;
+		return -EINVAL;
 	}
 
 	prof_desc->sec_desc[AW88395_DATA_TYPE_REG].data =
@@ -461,15 +454,7 @@ static int aw_dev_parse_reg_bin_with_hdr(struct aw_device *aw_dev,
 				aw_bin->header_info[0].valid_data_len;
 	prof_desc->prof_st = AW88395_PROFILE_OK;
 
-	devm_kfree(aw_dev->dev, aw_bin);
-	aw_bin = NULL;
-
 	return 0;
-
-parse_bin_failed:
-	devm_kfree(aw_dev->dev, aw_bin);
-	aw_bin = NULL;
-	return ret;
 }
 
 static int aw_dev_parse_data_by_sec_type(struct aw_device *aw_dev, struct aw_cfg_hdr *cfg_hdr,
@@ -678,21 +663,21 @@ static int aw_dev_cfg_get_multiple_valid_prof(struct aw_device *aw_dev,
 static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 		struct aw_cfg_hdr *prof_hdr)
 {
-	struct aw_all_prof_info *all_prof_info;
 	int ret;
 
-	all_prof_info = devm_kzalloc(aw_dev->dev, sizeof(struct aw_all_prof_info), GFP_KERNEL);
+	struct aw_all_prof_info *all_prof_info __free(kfree) = kzalloc(sizeof(*all_prof_info),
+								       GFP_KERNEL);
 	if (!all_prof_info)
 		return -ENOMEM;
 
 	ret = aw_dev_parse_dev_type(aw_dev, prof_hdr, all_prof_info);
 	if (ret < 0) {
-		goto exit;
+		return ret;
 	} else if (ret == AW88395_DEV_TYPE_NONE) {
 		dev_dbg(aw_dev->dev, "get dev type num is 0, parse default dev");
 		ret = aw_dev_parse_dev_default_type(aw_dev, prof_hdr, all_prof_info);
 		if (ret < 0)
-			goto exit;
+			return ret;
 	}
 
 	switch (aw_dev->prof_data_type) {
@@ -710,8 +695,6 @@ static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
 	if (!ret)
 		aw_dev->prof_info.prof_name_list = profile_name;
 
-exit:
-	devm_kfree(aw_dev->dev, all_prof_info);
 	return ret;
 }
 
-- 
2.43.0

