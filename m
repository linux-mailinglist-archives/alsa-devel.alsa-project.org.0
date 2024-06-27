Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406C291AB24
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 17:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848EE211A;
	Thu, 27 Jun 2024 17:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848EE211A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719501882;
	bh=E5oOz7sdP4TDRC9ZCb7arqSJ0fJXExTXVIN5dMViRhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CL2Ccr6Srouu1LUlFd9K/OFKn+xf1RzGRlQ3iFkF6Snr7HTmX4TTxinDpF454rMsg
	 u7kG7XblUhN4gGO/xqS5J+D9Wdrtd6T3nE7FWOZ1lRl0ug47wUcm4xAWkzOT04gIYU
	 MrJ44e8C11hkl+zFdbC6gLbCEW4c9sv+0zkQib3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC323F805CB; Thu, 27 Jun 2024 17:24:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB91F805DA;
	Thu, 27 Jun 2024 17:24:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F9FEF8013D; Thu, 27 Jun 2024 17:23:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08821F8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08821F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hzkHOVWR
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42562a984d3so11060495e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501831; x=1720106631;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13oJHL7pizeIHoUG8WVLWL5BIb0MIcpOEu5bQiczopw=;
        b=hzkHOVWR8ekpu2DKK2qZWzz19AISbqO+yXANbULKQtPo+QKyEZwf+FoCf+UhRTb2Wz
         FvNLxZGU7gWLc0w4fCzHm/dtX9mTsEqC3G49xCg3j8CiSzOqkhTL3upcXn80otlH1YFF
         ON+mLV3EVOSiDCrKa/skpk964lJsMqH7gL30hVt1lxH059YY7TwPUXL5JW3YVg1yCpAT
         KQVD+lx/slJmDtpIMI0/eSOEHmt4QQJCGnH1LujUhKHF58f06ug8ofDPu/bGgBiQ3VJ6
         qTKkVeeUdnWWulPCQZ+Hegim1rEMBx5w/fnTtIEpOgUGTIXxEUT5eM131pBrWHvFjHKN
         1M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501831; x=1720106631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13oJHL7pizeIHoUG8WVLWL5BIb0MIcpOEu5bQiczopw=;
        b=MXOmPIwzoWhyfA+VyslKamQHVCj5KnBh2xBagFOdq/JO6QRQ3XZegCpTFoEcm5KK/c
         kivSkazmgh8MlJdafkyCoszo2HAURJe0GK8cXw8xds4wBJgHKObwXYsJF1cLkbmrXXDv
         IpR9sTALkZzCYlxu26kqSqi9GML8GRFAuQASu0j+ogEoh+3Ed7gXZE288pIoSYSX/A7i
         iFo21b5JwwsMbCdm8LxKePvygD1v70v4JRxtND5dV/HFGJV88LOKxROEgyX+hGyg6cvF
         HDY4lq+oUH1jWtZMXDocTQfNJxSt8dx8Wq7BqqRJBG8vYzv/5XH2MBEb6EyMB/GG+Rb0
         Xc7A==
X-Gm-Message-State: AOJu0YyYMTjX+djZcWjR5OCWfDBtjf36BxsZC4FWt6yGC6vKBgET6WRm
	/7zeyfmmjHPfG98Jx2RV4+oI+jUreOQ8XwR2cuq7rAd1NjrXSJtVeeg/1Ryksf0=
X-Google-Smtp-Source: 
 AGHT+IG00Cg6oV6ZliCSxQJsuMusb0Dl5UMtna//eXTdeaQJXGsBIZ2HCW+7f3aUgVQQTxJYIV/R2g==
X-Received: by 2002:a05:600c:6a1a:b0:424:ac5e:eedf with SMTP id
 5b1f17b1804b1-424ac5eef8emr40354185e9.16.1719501830661;
        Thu, 27 Jun 2024 08:23:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 17:23:43 +0200
Subject: [PATCH 1/4] ASoC: codecs: lpass-rx-macro: Simplify with devm
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-1-ede31891d238@linaro.org>
References: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
In-Reply-To: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2547;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=E5oOz7sdP4TDRC9ZCb7arqSJ0fJXExTXVIN5dMViRhE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYQAe0I1btoC63u16bijpn+fzlW1AXZpq9Cd/
 Rzui/72X/yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2EAAAKCRDBN2bmhouD
 19nMEACUIwhiWwj9WBEryPz80KjgFMFzDmMHT39ES+0mBv0cmrlKejxjeXPqNK+f/g/sUl9nyd0
 YcPwTb6xIA5s8+HOuO2riq5OQ/zfLOZKuPGitH+otvSFYWSVsivXsbr3iQpSuJiyrQuXf2SlSI5
 Gb1WqCbt87VGYjDY3+z0H40G+QY1e1pfXp8isc+rttY/ZGQTIwECLFeHusI8PxfV+uwPvtKHCGN
 QmBvEr5o9Y4ObFNTa4sEFxSDotDgJASIIJkwvNIje2LwPkwMUNJsJvvNNswrHUSeZiLzstB0SJA
 6pbhxTpK42pXxcFg9WpMLAf30NQ4U2I3OzDkhM/LvlCswgkAI3lGRC2gbg3eTfRXpBoxY+hQt3g
 srcPw6Ftwic71FiQUsWxlBB/IKWCrV1CJdiD5p0SpcsgyGq/dulH4M3gjv+LNkw9ZRjg29iVCD8
 SWN8P77D21K/Pf+OeF6PRA9vIKtf3YqEjqBMgCeHKJ/QJwoWxg4gHnFHbSm4H0Siegz0W26SKqx
 smaNQyORq8sx7jHRsmbpL9gd88NkcKVcJES0jBa1UMjytcMZ9AA2p2fQ4R6nLqXS3KXTtmUpq1e
 TJ7XkLyVboR7mH9h4y+FlT0QOxBFxGTrkEvBwOHCLRdxCcDiyFLjbBt/QF/lk491zDrvSpdsaQx
 bbabGG7xO10D6Ww==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: G6EM7JKDZSJBWSUYLOQQ5DOBKIKAIFQB
X-Message-ID-Hash: G6EM7JKDZSJBWSUYLOQQ5DOBKIKAIFQB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6EM7JKDZSJBWSUYLOQQ5DOBKIKAIFQB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the default register values array with devm interface to reduce
number of error paths.  The array is not used after initializing regmap,
so move the freeing to place right after devm_regmap_init_mmio() to make
it obvious.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 9c4f0763675d..59fe76b13cdb 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3817,7 +3817,9 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_1:
 		rx->rxn_reg_stride = 0x80;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
-		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		reg_defaults = devm_kmalloc_array(dev, def_count,
+						  sizeof(struct reg_default),
+						  GFP_KERNEL);
 		if (!reg_defaults) {
 			ret = -ENOMEM;
 			goto err;
@@ -3832,7 +3834,9 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_8:
 		rx->rxn_reg_stride = 0xc0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
-		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		reg_defaults = devm_kmalloc_array(dev, def_count,
+						  sizeof(struct reg_default),
+						  GFP_KERNEL);
 		if (!reg_defaults) {
 			ret = -ENOMEM;
 			goto err;
@@ -3853,8 +3857,9 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
 	if (IS_ERR(rx->regmap)) {
 		ret = PTR_ERR(rx->regmap);
-		goto err_ver;
+		goto err;
 	}
+	devm_kfree(dev, reg_defaults);
 
 	dev_set_drvdata(dev, rx);
 
@@ -3866,7 +3871,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(rx->macro);
 	if (ret)
-		goto err_ver;
+		goto err;
 
 	ret = clk_prepare_enable(rx->dcodec);
 	if (ret)
@@ -3912,7 +3917,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
-	kfree(reg_defaults);
 	return 0;
 
 err_clkout:
@@ -3925,8 +3929,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_disable_unprepare(rx->dcodec);
 err_dcodec:
 	clk_disable_unprepare(rx->macro);
-err_ver:
-	kfree(reg_defaults);
 err:
 	lpass_macro_pds_exit(rx->pds);
 

-- 
2.43.0

