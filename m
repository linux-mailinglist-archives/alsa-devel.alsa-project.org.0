Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C12290584F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2715A4B;
	Wed, 12 Jun 2024 18:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2715A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209005;
	bh=lGtoXBpE7BDm5Q/i2Wcu8KAtimyFq3GJwH5lkJgYlCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tiNDU8x8mAZ22hA4oVWYp0YuXQTxw8+4UxobL29PYEUssTUR4abXwKOTfDt9w3ols
	 /stFNw/dPPm9rvwktlFDd7PuE2wcPLEzWDYbh+/1LvoHYxrWxRs87PCtMTxaeYwlP+
	 Yew6Qqa09vFzt/YD1MetzvWG/Xk85b3oG9bb4sWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17D21F805EE; Wed, 12 Jun 2024 18:15:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CCC5F805E8;
	Wed, 12 Jun 2024 18:15:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C90FDF80589; Wed, 12 Jun 2024 18:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E53CF80579
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E53CF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Vt21Ejub
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6265d48ec3so11667166b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208943; x=1718813743;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9YTFDAJLldVwDTE+9nejuBs9to0bqe8LPxJleVEXTI=;
        b=Vt21EjubynbmfE95CM215Nc0ld2VMIvUBJwHgcVF/kzCths7r/ttXjHEYfp2d/vqV9
         K8M5pr/jyNzIS+ovSb6wHKrXZl3Thd90LfrvVhMsbP2uiQrMfuN3ezrDpmZsI0MiNes1
         2N6bu2FixCN3ZV4k7TWWTkBZrojWIVMILjDCugbVBPyi/WtWGuO7dgEuai9frQkeQBql
         HasYBEXlddpRNhqY0jIdkbGPJBwSF/bXTXmqXyZHsgbUDDfu0dM7lI37cbLsZ1SL+tTc
         xb+SFixY4r1lO9ToorAkDL7ybioYSWwhcpq8jpejO+2iP4ZIe3qyPqfP/fko4rvwGiTz
         6zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208943; x=1718813743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9YTFDAJLldVwDTE+9nejuBs9to0bqe8LPxJleVEXTI=;
        b=VUznC/bNE5yW9dFmhnpAiDZgP0Y3utPDwIYN1ZdkoeH/xlw5fzA4+3HJe1M7/jRpKn
         MUr65xn6kNwSRJY5TctoarvaDDbgYGhp+GHRgvTGrEe8E7OV3/s/qy2ZR8d+0tp2r8Ek
         vceBA+NGJAKBxBERJDipZwWdW7sIA5fCLxdUKus17m9ziLZnQN1XJYK/9RO1xF8d248q
         bBhByLlHVeu9dVml9UVuAPDjIgTOOIzM95LrssCKDY73Gp4LYtk3KWfERdD3IuNMwwOK
         s86QP9bY9/dFMHLDICNqgAsje0dfm3CBruBfOAFTMu/kaJiNW4Doa+RGIR/nn2wbnM1n
         Xgxg==
X-Gm-Message-State: AOJu0YwYTbdNsOATdBJIh/cGBx9WpHr8WNQCO/qVGAAPGfkkeUmbI0Yb
	HfsbTQ69aVemykkt29udsGJWrb846Q4mUf6JEE5uvCmVKphB3zpBJrE3xekWhtY=
X-Google-Smtp-Source: 
 AGHT+IHyqUxUeWkSg1n1U8oNvkVbbey8z/8Bqdaq6epsNoTgDYD0JfIM/ekgt7b5n0xo20G2rwmO0Q==
X-Received: by 2002:a17:906:55cf:b0:a6f:1f67:9815 with SMTP id
 a640c23a62f3a-a6f47cbf200mr132578466b.33.1718208943604;
        Wed, 12 Jun 2024 09:15:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:14 +0200
Subject: [PATCH 01/23] ASoC: codecs: wcd-mbhc: Constify passed MBHC reg
 fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-1-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2446;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lGtoXBpE7BDm5Q/i2Wcu8KAtimyFq3GJwH5lkJgYlCk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmXbkCdl7gUWmJ4PrYh5YY44RWpc/Hr1isIl
 6mOhW2URX+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJlwAKCRDBN2bmhouD
 1/0oD/wK37LUGMcsFyd0V3lhgpczQVaknnrVNkiMiWdEt+e6xIeZe0DXhnbdD3WQcNCxP4iPBtS
 luPHSRAve/nIvjamz/2Uvpj/AYXmdkuZnUDyy/uPlLCBwDgUoX/bJbgyqxFsb416+mjQEVrd9Fc
 LjeyEv3KG+T2JB7strwvK8jmmKcNUW0ia7cHWHV68EfSNuvALNeHZqeaE93j6jGqq1vpZiRqkXL
 9ayNhupSwpG/f00+Ivuwfr28cgxgGlf0dYV2zDz2GH+7dMn+egsbMl1lzhc7/syObHRHyqj4eoK
 VWevQEnDQFdQ7YUeIJAsfMXcc87flB+HqFsl+it1C262Oe9QI9ljEzPiaEagD20VtuNvfQOh5Mg
 0wL3LJ1wf5MfORQW8I87h3lIvLR8/rnSmNzaZ43TVK/r11Pa9VomoJ8WTsCQGunN5taUrQcu6vC
 I90MzIUGiOC8K0OZ97mu0l8GXIAzLGbYZ11XSnxvsCSEvoJFamQPiD3r9aP/Kn65aEdZvJ8BDTO
 B+GUksYmNyQgMkzUod7U+h+UIDeF6/jCjD6Up4R8ZyU6kczLsvysNjs3S7ytDp4RqFLKFq/6v7s
 +0DB6AyHkM8xhrKZOV55+Yb+kVD9NG6Pkx8cnRfxTMQd4OZkF4G8nTNno/ckGclPOSufkUPyCnk
 JohcYRKSVGUSygg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: BCQKHKVADGDXEIVYTX2RFUY5VK5ZWFT7
X-Message-ID-Hash: BCQKHKVADGDXEIVYTX2RFUY5VK5ZWFT7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BCQKHKVADGDXEIVYTX2RFUY5VK5ZWFT7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wcd-mbhc-v2 helper code/module does not modify passed array of
registry fields, thus it can be made const for code safety.  It will
also allow individual drivers to allocate the array in rodata.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 4 ++--
 sound/soc/codecs/wcd-mbhc-v2.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 0e6218ed0e5e..d589a212b768 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -50,7 +50,7 @@ struct wcd_mbhc {
 	struct wcd_mbhc_config *cfg;
 	const struct wcd_mbhc_cb *mbhc_cb;
 	const struct wcd_mbhc_intr *intr_ids;
-	struct wcd_mbhc_field *fields;
+	const struct wcd_mbhc_field *fields;
 	/* Delayed work to report long button press */
 	struct delayed_work mbhc_btn_dwork;
 	/* Work to handle plug report */
@@ -1505,7 +1505,7 @@ EXPORT_SYMBOL(wcd_dt_parse_mbhc_data);
 struct wcd_mbhc *wcd_mbhc_init(struct snd_soc_component *component,
 			       const struct wcd_mbhc_cb *mbhc_cb,
 			       const struct wcd_mbhc_intr *intr_ids,
-			       struct wcd_mbhc_field *fields,
+			       const struct wcd_mbhc_field *fields,
 			       bool impedance_det_en)
 {
 	struct device *dev = component->dev;
diff --git a/sound/soc/codecs/wcd-mbhc-v2.h b/sound/soc/codecs/wcd-mbhc-v2.h
index df68e99c81a3..b977e8f87d7c 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.h
+++ b/sound/soc/codecs/wcd-mbhc-v2.h
@@ -279,7 +279,7 @@ int wcd_mbhc_typec_report_unplug(struct wcd_mbhc *mbhc);
 struct wcd_mbhc *wcd_mbhc_init(struct snd_soc_component *component,
 		      const struct wcd_mbhc_cb *mbhc_cb,
 		      const struct wcd_mbhc_intr *mbhc_cdc_intr_ids,
-		      struct wcd_mbhc_field *fields,
+		      const struct wcd_mbhc_field *fields,
 		      bool impedance_det_en);
 int wcd_mbhc_get_impedance(struct wcd_mbhc *mbhc, uint32_t *zl,
 			   uint32_t *zr);
@@ -300,7 +300,7 @@ static inline void wcd_mbhc_stop(struct wcd_mbhc *mbhc)
 static inline struct wcd_mbhc *wcd_mbhc_init(struct snd_soc_component *component,
 		      const struct wcd_mbhc_cb *mbhc_cb,
 		      const struct wcd_mbhc_intr *mbhc_cdc_intr_ids,
-		      struct wcd_mbhc_field *fields,
+		      const struct wcd_mbhc_field *fields,
 		      bool impedance_det_en)
 {
 	return ERR_PTR(-ENOTSUPP);

-- 
2.43.0

