Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7076392D374
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 15:53:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12057847;
	Wed, 10 Jul 2024 15:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12057847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720619631;
	bh=y1tKqfTQODlGyfn1SRpCW1SmdAuFgMAc1xdfgaUEBtw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jAJTod8rc+i3jbSTLbCYM1xlL36UfrjAN4bg810P+55NI/8jbxuqaK6Axt+5G3aua
	 LfUrrhGc8/PQhrDAgK5QjHeAKc5o66bSzA6KNkXXlMdeXLHYt6RZNxV+oqG3jEkPJJ
	 z31dJUmga2yW1rMxIQuR1OTWEK7MsVtho/gvYD4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DFC6F805F9; Wed, 10 Jul 2024 15:52:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 076FDF805F6;
	Wed, 10 Jul 2024 15:52:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CA1FF8019B; Wed, 10 Jul 2024 15:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D66AF8019B
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 15:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D66AF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jBLgBf4O
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eea8ea8bb0so57138381fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jul 2024 06:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619564; x=1721224364;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLywJr+VNuRQ+9S3fLtdyBw83gsTKbfJTEcv1fSuZtY=;
        b=jBLgBf4OXC4sN2SvG8JBEYSHYU+1McN+vpZuVPX4PwFjOE9lTubz//zx0yItsQTa8v
         5eRvUcsIGm1/leQgSqHdIl3Gs1XSEBMvuzybXCtF3OCVCVCpDnVf/I/lBImRgqCKSH8G
         qa+Zn8ufwylIG9zX4qvyO6/+DPWYkiZo917SMNfm9f3nvrxkXYnO8zkUGTESiquhk5rs
         x03DQEaiy+moOayH4BkpXeEsrVIraEuVPIBBgzxhC7SiQd2RsBJOzV5PZdypmiEi/c4u
         TRkq3Z9sIzXiRdLXnVYy4+4GEfEFik+TsocahoFP/PqYT3xCL3S65qrgbiYcI5RuxcOs
         Zfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619564; x=1721224364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLywJr+VNuRQ+9S3fLtdyBw83gsTKbfJTEcv1fSuZtY=;
        b=BolgvQDQf2YIBHCSvSDQ6puhk2ytw12dwJwnjDbKfG919IXbFdXrsiy3CAZXNLSl3E
         hxtvhCTCCCgJGI5Q4q7eed1TnAbY+UIKeiWsX8Kx5Jf1dIDlhRp2jPMJwsEIYvNJxMI/
         JGZ0Lm7aVgIx6nAd+ABmupRWIHltd6gIaFUL7vcQWaARYjWtFivtkCzlhfvPtbp6RYof
         sJMwkyPGCPgveIFwZXEWs3iOddCGsos3uI+SCU9gutR6lZ1/7+44Yc3kLSDEU0o0HfDh
         i6bbGK9fJoqiZt4k1Jf3Q0A8utLtLbomorRnXWBu13d78jijjgXeVU+d3YjocISr/J17
         c/sw==
X-Gm-Message-State: AOJu0YyDnrXuDus9w3O0anR9jjHCfsQp+jlmiX/zwDJ+745SfoI1oput
	c8DmNCtChb8ygDIcXW7AZDXSWnY8+dVQLS63ku1ahWGX6YfCqyupv1AmwzrQawA=
X-Google-Smtp-Source: 
 AGHT+IFqsU+9eqU1waHlBXBgmqcGfO+uxS9Acg7qmmXJvRuEpZxNjPxpb/48w2Lrj9d7Bgw79lvchA==
X-Received: by 2002:a05:651c:23b:b0:2ec:56b9:258b with SMTP id
 38308e7fff4ca-2eeb316b00amr44160151fa.33.1720619563982;
        Wed, 10 Jul 2024 06:52:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Jul 2024 15:52:31 +0200
Subject: [PATCH 2/4] ASoC: codecs: wsa883x: Handle reading version failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-asoc-wsa88xx-version-v1-2-f1c54966ccde@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=y1tKqfTQODlGyfn1SRpCW1SmdAuFgMAc1xdfgaUEBtw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIkh3GaGP31lPefvm22QfD6kHlnJErM6N9g1
 wYvWVt/ubaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SJAAKCRDBN2bmhouD
 15bWEACAaf3dT5VsD8GZ8Rbqic9br3Rncjy5nt82JwTLjCKlaG0ZWMvXtguF9r6P9t4oFBNtwbP
 lf7vdP6ZNULbwxGP8b154ZMSIhTMCuTV6GXPdinTz1xspQbsy7YYqBPwUZT9eY8hpNbDHlIsoAa
 XXxJ7rhTj+u0fhCC7i+vhYJi0HB2MAg0PulIKW15FmingqlbFYokHmI2ubPcylDYCkk9V160icV
 1fxrRCOpVs5aYqaov5AfVsvqZjQHgQiVLqpRNdOWSUKxok/UoaRmQR2Y4ONBvx1+SeZaWw/g7K6
 l5nYzrfHx/yECm7CGdS5Zujm44tCpyWfOU6pUL1F+ryg5i5EFr7s//ehL+9xyOB4EkfXq5HHK++
 zO0H/b7+zdMW7wyryHpgr828JNlLDnhDRpz8zYCpUHKIMGUe4LKyRcC7p7LoyYT69J7H6OpZqcU
 cJXusUwEjdcjB7dYqcnAUHCnnWSIFkGTNcOe8zEsSxkxJ0QP4CcElnC51P+BmfDcB0nUDVjLp4r
 Z7ZAFhzeKCgHbYvGoaZ51gci/dsjh2b49QtT4MzP3SE3+LL+rIo2Dwd7wsxu4AXt/BX8h372/od
 sAZl0TU1JekeEyLxykRCRpG6DIB3+gZKI9An/uMIDnAkhNB29jZcPI7l96LzybL+bTDmV4mxf3p
 jJKcqTrxGtdYbPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 7PT4XPZTGSBAFN7XR2RURLBBWBO3CKRL
X-Message-ID-Hash: 7PT4XPZTGSBAFN7XR2RURLBBWBO3CKRL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PT4XPZTGSBAFN7XR2RURLBBWBO3CKRL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If reading version and variant from registers fails (which is unlikely
but possible, because it is a read over bus), the driver will proceed
and perform device configuration based on uninitialized stack variables.
Handle it a bit better - bail out without doing any init and failing the
update status Soundwire callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index f5a15f0e891e..60b78560f4b7 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -997,15 +997,19 @@ static const struct reg_sequence reg_init[] = {
 	{WSA883X_GMAMP_SUP1, 0xE2},
 };
 
-static void wsa883x_init(struct wsa883x_priv *wsa883x)
+static int wsa883x_init(struct wsa883x_priv *wsa883x)
 {
 	struct regmap *regmap = wsa883x->regmap;
-	int variant, version;
+	int variant, version, ret;
 
-	regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
+	ret = regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
+	if (ret)
+		return ret;
 	wsa883x->variant = variant & WSA883X_ID_MASK;
 
-	regmap_read(regmap, WSA883X_CHIP_ID0, &version);
+	ret = regmap_read(regmap, WSA883X_CHIP_ID0, &version);
+	if (ret)
+		return ret;
 	wsa883x->version = version;
 
 	switch (wsa883x->variant) {
@@ -1040,6 +1044,8 @@ static void wsa883x_init(struct wsa883x_priv *wsa883x)
 				   WSA883X_DRE_OFFSET_MASK,
 				   wsa883x->comp_offset);
 	}
+
+	return 0;
 }
 
 static int wsa883x_update_status(struct sdw_slave *slave,
@@ -1048,7 +1054,7 @@ static int wsa883x_update_status(struct sdw_slave *slave,
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(&slave->dev);
 
 	if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)
-		wsa883x_init(wsa883x);
+		return wsa883x_init(wsa883x);
 
 	return 0;
 }

-- 
2.43.0

