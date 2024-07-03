Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21280925FFC
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:16:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A81E514E1;
	Wed,  3 Jul 2024 14:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A81E514E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720009011;
	bh=kohttqfCWrqbGc8ure/Vt69RKlLKq333AiDxnpMSqxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iE0owFFi5afsHTX0GIQimVQNG2RqnHa3dwWSSnSrVkYJH+Bpuk7Vm7cbOiWZb5C+C
	 IxkJnjT8MGMGaCVVghov4chUXUcIWotSarswqhTqHN5PmnbVhtrL9CLsOuMcgk51Rz
	 aY50uNralCwkvwli4R4xNngFqGG8ENBATNImU3p0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5437EF806ED; Wed,  3 Jul 2024 14:14:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2EB0F80710;
	Wed,  3 Jul 2024 14:14:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA205F8014C; Wed,  3 Jul 2024 14:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECFB6F80272
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECFB6F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=x+6A4/vQ
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42567ddf099so37061395e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008675; x=1720613475;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdbATdFaTptmFaDd3LBcoz91pHQr1cKSbt3yHXPYoFA=;
        b=x+6A4/vQNGg/KKQj7Io+EtNexfxm+35MNZ70+f4nPuqgRlRN/qi94LbyT4ue7V+yBY
         lT1fiIJZLAqYM/IjSwh8VNODJ9rpVKsFqG41aqyRYrSTfaXIXELpn+m8ljAzac4FT39J
         wLN6A4+IAmBSj3bvtpwWXwng63jOoCj01ijQXE7er4Ha2kdVEa/fS8PcaVpVuBwiNjP0
         Hm98wett7h9Oz83/RKz1uJRLysL8HJnZCs5VBAqC3tB0GK1xtVgcnZxNq8d7163pzr4d
         WVloVvFsew2h2521zPxQVjMWGVTyviMdR225s5w78q/QeolXMGOIojejIHkD3pexM4e6
         KnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008675; x=1720613475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdbATdFaTptmFaDd3LBcoz91pHQr1cKSbt3yHXPYoFA=;
        b=vRgeJpIwjbkO27wLpQmc5zWyBMPqwakmCVIZiCtxTY4Qi6hTMNudu/4ZaldJpK0TNx
         9sj/DbfG/s9u70y1h+THBomFb8zhFO6P12xosiurEEcJzpdgsKEfbydV+dD0MCd8SIt/
         1tsFeQqXahj5JrR8/swkzswxcL0t3eHcyX+cujtsDFNH5Af1Q9fo4IqZL6rsHG5fWs9C
         kd7SGkFETtVGfNVUG7Vm2gPd8okaMh9hzmAttkNwjymc3FUY0XgwwSy7yZ8y6Cglr6ig
         jisxcE/CH1pbNH9dBHwbjj2xHhHFtRq5EPsZKQTSp0vjVMYCquKLzkgHBFY9zgLmD9xw
         B69g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3vo+h8Hh6eKDuuBrJkjwx6ZZaE1TZ3sNZfzADslay4iGjL9xw1gwWrZl9S8Cl2Ky3IXove9rQaOvUo2H+jBX03cEIXwvh4d1DBZQ=
X-Gm-Message-State: AOJu0YwRZfQulEHkXIpncf4bbDi8q8tfyP2z2JRCFC5cKrxwZl4T8oqF
	lmMU7+Dt+YNSEVyJJli7RMgHTY7+Xuiv9iujKhiwuCbuuTRVmPUq6xzt+2bw1PE=
X-Google-Smtp-Source: 
 AGHT+IGrLsHp3VA6L8jTQ5ej6pjKRa1e82AI7Hd2/DqZYivIJ2FyYoGUJpc1Ou30fG1o2MruG9SS7g==
X-Received: by 2002:a05:600c:4c14:b0:424:abd7:2321 with SMTP id
 5b1f17b1804b1-4257a00dc53mr75429565e9.12.1720008674781;
        Wed, 03 Jul 2024 05:11:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:10:58 +0200
Subject: [PATCH 04/11] ASoC: codecs: wcd934x: Simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-4-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kohttqfCWrqbGc8ure/Vt69RKlLKq333AiDxnpMSqxs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/Up3Lhqw1lG8hf6t79kWGG+4wCsdFcumtsc
 T9S3yaOibyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/1AAKCRDBN2bmhouD
 18TVD/sFzG/Chwmi1OFCni8P6wToAEF0mWU3fsKO4cdcBdThHB5JG0otzPtaSKk/NngKHF8qFYx
 7bXfnXw65p0AIzyIi+K/KT/HS2JqWziHSf8ztIiu/eMt3jxbSaC71V5k1gfSZxJEvLNMIcBUOhU
 s8IQoNsMSSatumy4nLovUfHNChCas82BtISCmoEpHftZIr4FJZ1G5mGgJWWdX2wbxBia3stm11X
 VYBQxG18BC7NsyLY0Y0KVdOOMNYbB4zOJYCA96xlTzOwiWz0etfgvArlb7y5nl1pq7HdGoJ7NTm
 hrX4nR5SaQudQg1PWP7HlVuOtyYH4DmGw4PNaV/7CImP+hPBSh5bHjp3PpDMOcHLcyVmX/xu5Mk
 nJ0kAi4Yyqo33sFw5jKjCDtMmy3C065QqrP4gpssMYt+yVluRTme+gD6VXEufkCLn1HXiWkET3Y
 2tYePWhNHAWy2r1kLkVLmEJUnICPHQh3KV8gRdsE58tTNb2CUIKALHqTzKVMn5PvY/DD6rW5ze2
 1ypvy76pvgSdXSz8O1ZlRw4m/LfpkUWp3PhaD7GyzsHE3gDnXakzA/PySna6wcTQl2a8jJKBIQr
 f6fwRFI8zzDPmUpI8d/ixZSZNGdMOtURZgzK5GYpzsyfgq0m6s2IP6rI7FXctnclehMYDltwEAR
 8r+c07k6ETwUrSQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: LLOOJI5GGRASWR3NIQSU755BGFD3FI3Z
X-Message-ID-Hash: LLOOJI5GGRASWR3NIQSU755BGFD3FI3Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLOOJI5GGRASWR3NIQSU755BGFD3FI3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 6c65b46e2dc9..291d0c80a6fc 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2019, Linaro Limited
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/interrupt.h>
@@ -4973,25 +4974,23 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	unsigned int decimator;
 	char *dec_adc_mux_name = NULL;
-	char *widget_name = NULL;
-	char *wname;
+	char *widget_name;
 	int ret = 0, amic_n;
 	u16 tx_vol_ctl_reg, pwr_level_reg = 0, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
 	char *dec;
 	u8 hpf_coff_freq;
 
-	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
-	if (!widget_name)
+	char *wname __free(kfree) = kstrndup(w->name, 15, GFP_KERNEL);
+	if (!wname)
 		return -ENOMEM;
 
-	wname = widget_name;
+	widget_name = wname;
 	dec_adc_mux_name = strsep(&widget_name, " ");
 	if (!dec_adc_mux_name) {
 		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
 			__func__, w->name);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 	dec_adc_mux_name = widget_name;
 
@@ -4999,16 +4998,14 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	if (!dec) {
 		dev_err(comp->dev, "%s: decimator index not found\n",
 			__func__);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	ret = kstrtouint(dec, 10, &decimator);
 	if (ret < 0) {
 		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
 			__func__, wname);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	tx_vol_ctl_reg = WCD934X_CDC_TX0_TX_PATH_CTL + 16 * decimator;
@@ -5101,8 +5098,7 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 					      WCD934X_DEC_PWR_LVL_DF);
 		break;
 	}
-out:
-	kfree(wname);
+
 	return ret;
 }
 

-- 
2.43.0

