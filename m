Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B946B532D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:45:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0676518B6;
	Fri, 10 Mar 2023 22:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0676518B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484754;
	bh=vXDBO75B7IEiXDnwYHeWsA7VQDzfjkTwdsXdMFdNNwo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jaI0IVCgqkbu0GOdHSfxaU+HIUXqbaLFFivoCe0RCxIJYpvN6BM+6cNW+XzZHCw0H
	 WNYP296xBat4e8raBhnS0ruj3p3Sxz2F8f4gx1nivAwSrrBQVtVGbvA3xhimf2g9Ui
	 fBnB7WrtEnuKWMUZksDSW7n2SdCZazI77vahuUbg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A19A9F80236;
	Fri, 10 Mar 2023 22:43:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AFDFF804FE; Fri, 10 Mar 2023 22:43:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68E6FF8042F
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E6FF8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TZru0gIO
Received: by mail-ed1-x52b.google.com with SMTP id a25so26277377edb.0
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euRWHr0UtuqpwGJTkiRQ6fkvgau3vkX9qbw5gY31Oi0=;
        b=TZru0gIOrHG64rX4eEReJHZgP+b/OcPOjctwQKLS8foHVDxU75d0W+Fb9UdQ7e6xis
         NmBTqb+GEcVb9DwSygBWk7KtgdWIf9NLUYhb94lNNioydXarMDs4XBECaTh/4+ACvXwt
         bFeZIniNdYlKHiRIIvDe7Fh3rF4GPJO2/JArqyVqrVpjg2VoNI37TL0CsGwUA4qmfNm+
         xIFdCdMemXq9Lf/H+d6lu9COQ35rHXqDlGxQVVONsOab4tJKwI9M+5RcWOSci66BbPTB
         SUKWp/qpQ0DtHVxRA+DLMD3UyFaSXyw1Ws+a1nlgN7iFK9K80Z+QN/fbKxBuRIOVG9pi
         ubkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euRWHr0UtuqpwGJTkiRQ6fkvgau3vkX9qbw5gY31Oi0=;
        b=ipF5mMigx5utCNjNmRgkLxu5ZiAgoJtMonGD/ca4H+5BW6LQbQ6CBYgBKkfPNJmGQ3
         1dlerWjh3N1jKfcBhCqx6HGjoSiXEjZo4rlb9G/Y8TfjQjU0Cdx8VN51TQwt9N1JiqCn
         /5SPhOLMvpxEUm2nA3OsbKSOTI9vgww9DaBGKRIVal32VSAhHt9qsYF8+9qxT3bWklOQ
         Uix7XKgIh0/cAzCtPmildira7/ijDiEgPLAFADAvuqtD8mQFJecQXt+orZPxCOvHgls2
         XKfJF/OzpydEXNBCE1BLQR+j9wTy5hLfNFZkIqNFBMtRXIYQE1jYSdB5ma00LOVMwQTJ
         joXg==
X-Gm-Message-State: AO0yUKXG5od1NZTBtZ8IShYWsrlfhfVVRezeYKCMe+8cAhwuOAGZPwEa
	7KMpxcouTlzmiAOIAp9I3NVP9Q==
X-Google-Smtp-Source: 
 AK7set+P7KiAdjrVwDphE8ZYgCZ0yPuvhmWOIJk792eAii2Tlil8k2tyFBuqwof/wHJ4HIRrO2KUNQ==
X-Received: by 2002:a17:907:d306:b0:91e:7d56:f051 with SMTP id
 vg6-20020a170907d30600b0091e7d56f051mr1369413ejc.51.1678484621672;
        Fri, 10 Mar 2023 13:43:41 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/9] ASoC: samsung: aries_wm8994: Drop of_match_ptr for ID
 table
Date: Fri, 10 Mar 2023 22:43:27 +0100
Message-Id: <20230310214333.274903-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EFAP52B2BGUFGTBAG5QYOWILGWXK3SRN
X-Message-ID-Hash: EFAP52B2BGUFGTBAG5QYOWILGWXK3SRN
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFAP52B2BGUFGTBAG5QYOWILGWXK3SRN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  sound/soc/samsung/aries_wm8994.c:523:34: error: ‘samsung_wm8994_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/aries_wm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 0fbbf3b02c09..9122482a0e5c 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -684,7 +684,7 @@ static int aries_audio_probe(struct platform_device *pdev)
 static struct platform_driver aries_audio_driver = {
 	.driver		= {
 		.name	= "aries-audio-wm8994",
-		.of_match_table = of_match_ptr(samsung_wm8994_of_match),
+		.of_match_table = samsung_wm8994_of_match,
 		.pm	= &snd_soc_pm_ops,
 	},
 	.probe		= aries_audio_probe,
-- 
2.34.1

