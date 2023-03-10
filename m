Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE06B5331
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:46:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB49518A9;
	Fri, 10 Mar 2023 22:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB49518A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484774;
	bh=IhFF22SBevgj9RgvzSd9KOm56OTibuuaEKRipRtsdR0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=to23v3wpd1sz2Wb4/OB643n3wgwKa7MmSpKHC2AKde+n2MXv6AUl1JI4uUW33EG/t
	 9IURrsVyMF9EzW3fn+BkaujuiVr5kNbokc+Cp7wL1S1Z10Uu0F92DFo7xg7vJyw7l9
	 gQBVlF/QOcQAb3UN1f1D/4BKa4KJQ/i/E+n/AcIQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEE53F80549;
	Fri, 10 Mar 2023 22:44:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E639F804B1; Fri, 10 Mar 2023 22:43:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34DDEF80431
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34DDEF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pAFb423p
Received: by mail-ed1-x534.google.com with SMTP id j11so26086681edq.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1KmqQZradWQGSeXUs/uKrqZTIEt/A0yqDxE+DkkN5A=;
        b=pAFb423pNZ8Bqtr7gmFx7JY0iqO1BBmFb27jY3CTsWbaAzqpwbWJboaCifJ6G1VmeW
         xC0I0G7nDy/zs2irsrlPVFl3BTQOqaTNgZesVwZ8+AWUBiMiW4rDDGem4g0qyp55M4w8
         ieX7R4tXpOiRyfsVGxZWFz8O4kg+lE8SH03OT8b77Xhfc0W7nLsbo/xzUddeQmi865Ax
         eYY/RpmifwZXRcRacB0c29hkDEYByUFvmCg5jLsvpbT8BeUQM+Ki2nZiCDUkzuf+0bAz
         Bd0HgxkURtuthewHLtEnDnYU2fSSsB/gYoN00LhX5S4Z9sIVwdVk4VLKHFQo3wO656VC
         9KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1KmqQZradWQGSeXUs/uKrqZTIEt/A0yqDxE+DkkN5A=;
        b=ASstuNO0TWfXmY7QMwghEtJJVYYRv/PJnUP6Fto/WpN03128qbDa00PDkeWepSg8Rd
         etrxmQIxSfKUukbXrsKJWIwVX2NJe3U2vOjGc+J6t7M02M3DCQZChqrcm/ecJeO7+1uA
         2pBJS0QXacsQey9mySZrpszUnMIBC8/o27ktQl7nRWP22l3kiUvY2VJFt+8bxppnX2Kk
         3UP04c2p++LdyxqORjCEnC1CR8OsUbzDtl6di54Mf4rVEUYvx80Qwyv6gy+NIy6b6SLQ
         jLUsz/Gu0dcudfeyUgCzSEOExb7FE0/9WyqCcrL85wcjlea+V/XzyVHJnbEx61wdfGnY
         sUPg==
X-Gm-Message-State: AO0yUKUXHRonRdKX+YdTk42cck0xvfM8JOxLehqUNcCZftSPwpIXRmg4
	dc+mTRPUtucYi5FhxIYVayqQcQ==
X-Google-Smtp-Source: 
 AK7set+gaHp3hBL7F1oXupuPhXZSIMZ1OAV+9R0OWspcJbUAN3By/iv+tFcINwicQVOcsjzCgSGcMA==
X-Received: by 2002:a17:906:b1c5:b0:878:4a5e:3a56 with SMTP id
 bv5-20020a170906b1c500b008784a5e3a56mr26605983ejb.15.1678484624747;
        Fri, 10 Mar 2023 13:43:44 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:44 -0800 (PST)
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
Subject: [PATCH 5/9] ASoC: codecs: adau1977-spi: Mark OF related data as maybe
 unused
Date: Fri, 10 Mar 2023 22:43:29 +0100
Message-Id: <20230310214333.274903-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6H4MOBZYXL7YRQWP6TF6446OPCEEATHB
X-Message-ID-Hash: 6H4MOBZYXL7YRQWP6TF6446OPCEEATHB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6H4MOBZYXL7YRQWP6TF6446OPCEEATHB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/codecs/adau1977-spi.c:58:34: error: ‘adau1977_spi_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/adau1977-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1977-spi.c b/sound/soc/codecs/adau1977-spi.c
index 8370bec27a9c..207c5c95f35a 100644
--- a/sound/soc/codecs/adau1977-spi.c
+++ b/sound/soc/codecs/adau1977-spi.c
@@ -55,7 +55,7 @@ static const struct spi_device_id adau1977_spi_ids[] = {
 };
 MODULE_DEVICE_TABLE(spi, adau1977_spi_ids);
 
-static const struct of_device_id adau1977_spi_of_match[] = {
+static const struct of_device_id adau1977_spi_of_match[] __maybe_unused = {
         { .compatible = "adi,adau1977" },
         { .compatible = "adi,adau1978" },
         { .compatible = "adi,adau1979" },
-- 
2.34.1

