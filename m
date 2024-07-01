Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C57C91D92C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:40:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49EFF2365;
	Mon,  1 Jul 2024 09:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49EFF2365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719819648;
	bh=aNXS5oDU9Iznltvue5eW7LGccDPE1uOvOu0B8DutizM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oXQ7O0n5ePcyxRxHQ2H+/1oeomQA+4IrYdf9WH2MtvPwHIEQ7F0n0HuWRBLr1BM9h
	 /P7Y+YWaAZKjd5wQB/TfzfKMDTYGc8xP+ionOT4sOxdg43Qz8FK/H4RgI+/HVlGUDG
	 7KLOeh90/xE8AQyIqMRpdTuX9GmPB+EDGtwBnM+s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ED98F805D9; Mon,  1 Jul 2024 09:40:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B25CF805E0;
	Mon,  1 Jul 2024 09:40:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4545F80578; Mon,  1 Jul 2024 09:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D158F8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:39:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D158F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eSzcHD8y
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-425814992aeso4511275e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819587; x=1720424387;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JV+cRI0obrw7Gr1AmKeclFNXK4wRSUvRfIa7nX0CC5w=;
        b=eSzcHD8yOCE9ALvQvi1ioyDR8akcqpl/tHusV31XF2RhSjwS1elCw+HTeTHWR6znqi
         p+yODnxj6g5LYECdk9z7+XTTwUFHcWKbt2FYYvbmfsCwh5Ej6iJrEC75+7KSS+80JHsG
         2zLFgz0+tACT3Tln5eHbCcxuFrHgbzjMBmxmGcbDjnjyNKJkEukIjOxY8QSjHTfbj4jE
         UD+ODSoMm0deNnQ4vRvtF3jEjMHCbTWyyQY/6hVu4KvKTICfx499Eeg4gXBIn+ZpqXva
         YgBkQnPiE+16WVQ8Sf+LJg2dV75ze0LU5jYulio0ceE4fuTXqSYHlP1SxzWRWsIYkfrC
         5CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819587; x=1720424387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV+cRI0obrw7Gr1AmKeclFNXK4wRSUvRfIa7nX0CC5w=;
        b=i9somcuMVqLyqrSFqBM1hlBG2OljXu9FjILg/Y0KkOO/anzDKQYlX+fEi4vJ+NXjT5
         6V+CytBZNajEeKqPcW120stS6ySffphRv82iOpiB4FgwN7hRnuqCA8vp/2W3yIDf0jBs
         kjLYGDZxspO4YbyXQqT4Z7VdTZbjBpU6zgI5MkGZV9OAIP2WotnYgmx9GyRLskiZ+VSD
         4unFqVJ3uypB9z2cFPgvix1rL1uY12zLuNYmqhm0pOO5ZExFNJQLUQjwgiyBoZQmzZB4
         OC2z9dKl+yVMM2K0kkN7Y94QclI5SqyrtixRWbXDfJ8xqooDp/P+Iw9Pb14JsnNE04oN
         aPew==
X-Gm-Message-State: AOJu0Yx7sR69uvdxl3dEJcT0zk7dND9cqRhBZf5Rq6i00mZkp8VP6Ffu
	Nw5wbmxmYXnT01WOsVXqcUFDdezODFqQdGamYvqHVJHSM89a6A2Ok9SbbUqxnEA=
X-Google-Smtp-Source: 
 AGHT+IG2h/MuEwnoTZQebFv4r/85gHz9u6yettb/wJx89L0LKVLKCmHMSB/zmGvvRwXSMwxJCfcw+A==
X-Received: by 2002:a5d:5702:0:b0:35f:1c34:adfc with SMTP id
 ffacd0b85a97d-36775729a52mr2645023f8f.67.1719819587542;
        Mon, 01 Jul 2024 00:39:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:33 +0200
Subject: [PATCH v3 1/6] ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup
 with devm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-1-6d98d4dd1ef5@linaro.org>
References: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aNXS5oDU9Iznltvue5eW7LGccDPE1uOvOu0B8DutizM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl07ZZ/P0X2KbPfUiKc26QrbS8ijbeuElhemc
 0YPAc1aqKWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdOwAKCRDBN2bmhouD
 15HHD/0ZHIWDX7+vSu+VVLfTCkXyU0PPIYh+vbTkyulS/CJ/ece8SI3bkYXj+QUATQJRxQjQGMY
 uboQLbCcXh2A7dhSgLPIJ85W7YyIl5GbUw934lXELcxrcs0RZVhQfDFND4+aRi3oNwOqXUqW2UM
 HvAdb8RhF2kEn0PW4TiE2IFbGcrs0k58KTPVwcaLrTNzIFt4aHr9UAXctUUZ9lONL8+BYwl8Z/2
 /hKdpuccDFw2np7hokPiG5SOG2I7b1uXB3rsIFciah9lq0pdgbnSpsu4sKCuOt2au3ZK1ORGpXl
 U1WlcEh9YP9PJhFCxkahWCL2LqSKqtf9be7/rFxARIM5PkMd/XtifW0d/Px5bMqgsXvyt3/8nLk
 Uc8z/ZP6BjfzypcJTTLcYWR8iYBkPFrdTlPYjEHTJlvX9RHixmueA1z24C0DjexE4VPBXY79Kfn
 HZVALa21R9PaaQZXXXcZNoNZku5ge/00pd/NXU/soo7OFGXqRAOLLLJQdaxPeiy756LJcoVHedF
 xQ5MwiEanqOu7o9NUXddzma2xU+t1DXHp5ccnWotr5J2z9UaAVczlSL+P2v7PKPi8r4BYPvlEAG
 MAaj9JeH6hU7XurMb+QfLtLQ+C3Q7vPTUdnr2e6NQG2U3FRerE7cq+gf2wHVuaV7D7veizXo5Oy
 r3PXljUj/+SxO/w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: YKMG6K56WAXZPGJVOSS4UN6J6ZVP2YWJ
X-Message-ID-Hash: YKMG6K56WAXZPGJVOSS4UN6J6ZVP2YWJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKMG6K56WAXZPGJVOSS4UN6J6ZVP2YWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Eliminate PDS cleanup by using devm_add_action_or_reset() which results
in one less error path and smaller cleanup in remove().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch
---
 sound/soc/codecs/lpass-macro-common.h |  5 +++++
 sound/soc/codecs/lpass-rx-macro.c     | 30 ++++++++++++------------------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 3aa9737f2737..21cb30ab706d 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -41,6 +41,11 @@ void lpass_macro_pds_exit(struct lpass_macro *pds);
 void lpass_macro_set_codec_version(enum lpass_codec_version version);
 enum lpass_codec_version lpass_macro_get_codec_version(void);
 
+static inline void lpass_macro_pds_exit_action(void *pds)
+{
+	lpass_macro_pds_exit(pds);
+}
+
 static inline const char *lpass_macro_get_codec_version_string(int version)
 {
 	switch (version) {
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index d47c49c90de3..77e734ad1885 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3803,11 +3803,14 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(rx->pds))
 		return PTR_ERR(rx->pds);
 
+	ret = devm_add_action_or_reset(dev, lpass_macro_pds_exit_action, rx->pds);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
-		goto err;
-	}
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
 	rx->codec_version = lpass_macro_get_codec_version();
 	switch (rx->codec_version) {
 	case LPASS_CODEC_VERSION_1_0:
@@ -3818,10 +3821,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 		rx->rxn_reg_stride = 0x80;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
-		if (!reg_defaults) {
-			ret = -ENOMEM;
-			goto err;
-		}
+		if (!reg_defaults)
+			return -ENOMEM;
 		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
 		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
 				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
@@ -3833,18 +3834,15 @@ static int rx_macro_probe(struct platform_device *pdev)
 		rx->rxn_reg_stride = 0xc0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
-		if (!reg_defaults) {
-			ret = -ENOMEM;
-			goto err;
-		}
+		if (!reg_defaults)
+			return -ENOMEM;
 		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
 		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
 				rx_2_5_defaults, sizeof(rx_2_5_defaults));
 		break;
 	default:
 		dev_err(dev, "Unsupported Codec version (%d)\n", rx->codec_version);
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	rx_regmap_config.reg_defaults = reg_defaults;
@@ -3927,8 +3925,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_disable_unprepare(rx->macro);
 err_ver:
 	kfree(reg_defaults);
-err:
-	lpass_macro_pds_exit(rx->pds);
 
 	return ret;
 }
@@ -3942,8 +3938,6 @@ static void rx_macro_remove(struct platform_device *pdev)
 	clk_disable_unprepare(rx->fsgen);
 	clk_disable_unprepare(rx->macro);
 	clk_disable_unprepare(rx->dcodec);
-
-	lpass_macro_pds_exit(rx->pds);
 }
 
 static const struct of_device_id rx_macro_dt_match[] = {

-- 
2.43.0

