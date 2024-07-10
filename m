Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 542EF92D37A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 15:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D20C84A;
	Wed, 10 Jul 2024 15:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D20C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720619665;
	bh=WB7TReeuz9p2xJwiha6GQMNAWLN4DRCFhtae1ITPqrU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qdEDpI3cbviuxLYS6M15I2qQb5BE8lgwnV7+Mum5CvBKUReAyto3nQ5Dk+cVM7yzJ
	 6ZwNsIE2w4g3Dhkgumm4GGlbTm4qzu5NOHth1F5s1v/a1fTgvS4fJliUzWaFsir+du
	 tUp9uRdzp74ZR0WGzozT+OUVtqIdsOwR285PQvrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BD91F8065C; Wed, 10 Jul 2024 15:53:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0231DF8063E;
	Wed, 10 Jul 2024 15:53:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 692FDF800FA; Wed, 10 Jul 2024 15:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89BC9F8020D
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 15:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89BC9F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jbBKPNim
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso796250066b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jul 2024 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619566; x=1721224366;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OC8QeR0kGY9dWOXLH/zkl7I9eWhOVZEAFq6fczOPCU=;
        b=jbBKPNim2+MbIg06Ej4Wi2+WNzpIfjcS8Nteu7xyKgxToFLTtZL0bymA4qsAx8F6ug
         YXsclgYaCWyG8uLECghYy/il7GGcRBZpIwu17n0BsuVsui39+TITt8DAhkuxy1umskX1
         YMicRv5s0pbJKhQSWBcasJkbQsc5WG1B/ynMyv7V7cP6QBkHPrGsFQUlzHTtvMS0vQbq
         3Of5XZLnd/fCyA3ES4Z2KZvNVJZQ2zlYPHFB0lgdsHSrPuO4Z4gllyzd4fL+OHF/t1Ek
         KLbUMDA/i5so8Ac0XEQhJZO4OJHLaOLa3s4guISX9M7EAEwbXuQj0ew5qSrFhPXHRquf
         t81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619566; x=1721224366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OC8QeR0kGY9dWOXLH/zkl7I9eWhOVZEAFq6fczOPCU=;
        b=Rd0Qm2gK0dUKIfIyzk7jjOcoTt76db95jRGxQd5to5hzGT0kBzf7zQa3uX0uRbyyXE
         Z7sGBNo7pUr07bYHQNiJ6WzV+OdfLZ/zAxh56UUoK6WaBk7S91FBM69Ufe0IvKqJ2keC
         yMqpSUA2j22lslEIGzCffUNL1OY+mmxJ/SMQYaF4QG7nIxrDUpaW07fjJtlchYgFPtsQ
         XhIZOvcEqaFPxM4qqjZRS/rz/BoJTS12vQ1DSZxZzlIryqOTr1K2MC62jNk/xGYXTJLi
         ishSp37LWa9GdwKT3dg3s4AhcAgC2gEu9+e6tE1HUxprejHByHGqi1a7+uof0HI8hzJa
         FS0Q==
X-Gm-Message-State: AOJu0Yzs5/4596l6XjacJ9ZD4ad9O/3FzIycklOA0NUfcQ+J5Oft4x5n
	NJdnzEYuCqDl4DMGYbP7iAzQl2SPqZ4pC6sBctqVQ1SZzAn+OTb3auq7Q7A7/HM=
X-Google-Smtp-Source: 
 AGHT+IHgtY+jl1RRnFIQyLNJ97fWPscsE9ZarFQHgaMGp518nrfXgsChqvgkK2KRYnMJVo21PLAlww==
X-Received: by 2002:a17:906:40e:b0:a77:c824:b4c5 with SMTP id
 a640c23a62f3a-a780b6b18ccmr394586466b.18.1720619566685;
        Wed, 10 Jul 2024 06:52:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Jul 2024 15:52:33 +0200
Subject: [PATCH 4/4] ASoC: codecs: wsa884x: Simplify handling variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-asoc-wsa88xx-version-v1-4-f1c54966ccde@linaro.org>
References: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
In-Reply-To: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WB7TReeuz9p2xJwiha6GQMNAWLN4DRCFhtae1ITPqrU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIm7n6j5rSUbIfZVj7o449ncopexzUhu5/AH
 QhMa+YOvCOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SJgAKCRDBN2bmhouD
 14ApEACN2oL1zIaMFQ6Ucxm9eW4neIeeG+DeSn0dTmGO/kaA7yYrMtBe2eKxURAmT+3Ijv1mPxY
 +P3cezRBgIYmjOZB9h1HC5sVa03qi8uxDTWEt/bS4Cv6MgiLCcO6PPDQ6x1soaa84/UnJTqhhQt
 O72gTTfh43MgNod0IdVxZwzKGSnszys0xnz8cFfV63ufqG15yAxEIxE7ZAY36AMD9X+9FiLZI/S
 uWJaUEikPGXGqgx+Wprq3XuRsfY2GiC0IrrUQ5WywC5tLMtT/mBusRx5qCGw6WFB1gzYq1n5RDP
 1Kgz+3i8DrXB82SmohXpH7+qct5J1JZr4hgdwQj4EwrCBLTP92RSUTtFdiYgIRvrxzTTr8xm72U
 mC++PSeRb3/5oW36Z0CODwjstoWljyXx2J0avKPzA4Ks+KSRX5CtrUPGmDABiK9lkphYDP8rKDd
 q1rOAebtS1VNdlqBMRpFxDm9xPpt7/scouggv/f5IJotxnzBK7nhm+WvcHUTfy323HcaGQLYhOJ
 sEcQ4B6nRfoHs89zpeu5NorK8TpaGtSxDr+1rClWFFSacX6/DlTqoU+vDvUi6XT4h24KTmrCcBm
 yvb8RG3sWBUu8KXRGmEPF4od0ljjHUy8mb/lHM4UONia/GzRWn6w7MT3t/OyIgDVCFrYcX5HeAd
 Ywz3QTiBnCWhrVg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: IIXDTHNTU57VY7O5GHBB56CLNFYUR4GE
X-Message-ID-Hash: IIXDTHNTU57VY7O5GHBB56CLNFYUR4GE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IIXDTHNTU57VY7O5GHBB56CLNFYUR4GE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not use detected variant variable past the init function, so
do not store it in the state container structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a6034547b4f3..7b19df9c1728 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -703,7 +703,6 @@ struct wsa884x_priv {
 	struct reset_control *sd_reset;
 	bool port_prepared[WSA884X_MAX_SWR_PORTS];
 	bool port_enable[WSA884X_MAX_SWR_PORTS];
-	unsigned int variant;
 	int active_ports;
 	int dev_mode;
 	bool hw_init;
@@ -1465,7 +1464,7 @@ static void wsa884x_init(struct wsa884x_priv *wsa884x)
 	unsigned int variant = 0;
 
 	if (!regmap_read(wsa884x->regmap, WSA884X_OTP_REG_0, &variant))
-		wsa884x->variant = variant & WSA884X_OTP_REG_0_ID_MASK;
+		variant = variant & WSA884X_OTP_REG_0_ID_MASK;
 
 	regmap_multi_reg_write(wsa884x->regmap, wsa884x_reg_init,
 			       ARRAY_SIZE(wsa884x_reg_init));
@@ -1474,7 +1473,7 @@ static void wsa884x_init(struct wsa884x_priv *wsa884x)
 	wo_ctl_0 |= FIELD_PREP(WSA884X_ANA_WO_CTL_0_DAC_CM_CLAMP_EN_MASK,
 			       WSA884X_ANA_WO_CTL_0_DAC_CM_CLAMP_EN_MODE_SPEAKER);
 	/* Assume that compander is enabled by default unless it is haptics sku */
-	if (wsa884x->variant == WSA884X_OTP_ID_WSA8845H)
+	if (variant == WSA884X_OTP_ID_WSA8845H)
 		wo_ctl_0 |= FIELD_PREP(WSA884X_ANA_WO_CTL_0_PA_AUX_GAIN_MASK,
 				       WSA884X_ANA_WO_CTL_0_PA_AUX_18_DB);
 	else

-- 
2.43.0

