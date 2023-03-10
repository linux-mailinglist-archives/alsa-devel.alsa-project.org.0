Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A4D6B5321
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:45:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ED9D162F;
	Fri, 10 Mar 2023 22:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ED9D162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484733;
	bh=ynzigxjx52v0iPglNzJ/ugcqkjbMglUIbAnZyqxsGOA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cIq4x5gcqNKJwe/MhxiHWL95kWtmAJ7xliRqVMNXql6Gspg9a7zCZY3xEhlModiI4
	 vn4Ml6T+2vhlTHrdNShA4b6b3uoIhD92no2bGq0YwFxfXTABhqonRFaGlmXSvUMP4P
	 1V+K2zZxVWGJ5m88o+1KwlGJ4zIjUPoP5hM046LY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BCE4F80520;
	Fri, 10 Mar 2023 22:43:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12FFDF804FE; Fri, 10 Mar 2023 22:43:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 281D1F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 281D1F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SUNi2TaX
Received: by mail-ed1-x532.google.com with SMTP id o12so26066505edb.9
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIfiMP3YESLd/oa/N7VLY54fnA1n1mTobvMyaeAJG5I=;
        b=SUNi2TaXheAbWPG/KVUefcPFHvQs9X6TNeLNLxse1maLOXEGTl4/TyuaVqStDczSnd
         EXs4WAYhkL8UPIiQcgLk+EfoS5XdVMurMYigvZ7oXcwdz/+XJL5xAF2ZzCqv/grclfFN
         RTRK4GXBvCHkvg6cvw8Yl7A94AoQfHauKem9e6r5R16eKeWor5pGclrxLxrAFIpu9QCF
         UiMfeAcMguDx4E6r4e1owv2+G/n4mxUqwoQ+YgGVJUWc9EPIhP2fdRu6QzXKiZmMU5Ud
         fxlvZMnRkhKd2qyFmWHHaxT88WgodGOk76u1I3ZLhOHFUb42R6f7EEuxRIajZqkBHwlH
         gbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIfiMP3YESLd/oa/N7VLY54fnA1n1mTobvMyaeAJG5I=;
        b=7CWlRljlEqymnQmYowrTydzNF+hVB+pE6xlaxEFkFZpOgGmx1tSL/FTkf4K7w7oHe+
         3X/w9R8H8JeynrndyVv7sN4oNhboebn7xPpwdP6ZaJUrCfcKcdpTLVPu10ElwA+ININA
         RqCnjBiKUV6pOtDrlaQyOfuyY6pE2zishIwsU84cTo500KWEzl8f+zo1+sEBe4AI0+cp
         JhynNOg4aH9WZpqkgtxF6W8efv9E8WWtUz2PGMBmqKTrftch5wAz6QXpKX+MY58M8tZL
         d/DBOULvPUaciv7JxsSLj75klGnWCh88NwD2WN3EIrYr1YXciF8HcOa9S5h3FqTz3qcI
         MOOA==
X-Gm-Message-State: AO0yUKU0ofop8hc9J1QM0A41GoYBtdGxDRPgA0j2nKY+iS3JoNmvotML
	gDzUu47nB0izeSkZ5xE1DqgQDQ==
X-Google-Smtp-Source: 
 AK7set+6+KrtBdSfaV0uxoCP+fEPUyNxImT6xVJWnAKpCnDbvKIKZNH0aQlabNfXa7pbDKxh5ul0BA==
X-Received: by 2002:a17:906:fe41:b0:8f1:949f:37b5 with SMTP id
 wz1-20020a170906fe4100b008f1949f37b5mr32934345ejb.32.1678484618989;
        Fri, 10 Mar 2023 13:43:38 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:38 -0800 (PST)
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
Subject: [PATCH] power: reset: qcom-pon: drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 22:43:25 +0100
Message-Id: <20230310214333.274903-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JLHSQF26JDVPASF3QIQMXPH3N4XHCPMX
X-Message-ID-Hash: JLHSQF26JDVPASF3QIQMXPH3N4XHCPMX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLHSQF26JDVPASF3QIQMXPH3N4XHCPMX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Qualcomm SoC power-on driver is specific to ARCH_QCOM which depends
on OF thus the driver is OF-only.  It's of_device_id table is built
unconditionally, thus of_match_ptr() for ID table does not make sense.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/power/reset/qcom-pon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 16bc01738be9..ebdcfb28c4a0 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -91,7 +91,7 @@ static struct platform_driver pm8916_pon_driver = {
 	.probe = pm8916_pon_probe,
 	.driver = {
 		.name = "pm8916-pon",
-		.of_match_table = of_match_ptr(pm8916_pon_id_table),
+		.of_match_table = pm8916_pon_id_table,
 	},
 };
 module_platform_driver(pm8916_pon_driver);
-- 
2.34.1

