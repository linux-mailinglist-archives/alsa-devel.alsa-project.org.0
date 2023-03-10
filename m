Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F826B5344
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:46:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12F8C162F;
	Fri, 10 Mar 2023 22:45:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12F8C162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484805;
	bh=Ej2Fjyby2KgHyzdIEjLUfz5Kjj7PyqrigafxyNYYVYA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OTvJXDWuZuaLADzlRvvNgxWCoeV2tXwgd2/OwAJMnvkxNM1PnBIrBFCNSmC6l7Y2N
	 imOv66uBX0jaf2BooN9KgYiEAhtqJ/BBID41ZgzTn3CQtsupNpwKBJs9zD+uXEu3LI
	 mBxnmH7OTv6KS9jhQuUHIL2g/W6RkwdxWKbtyTsA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7559F80567;
	Fri, 10 Mar 2023 22:44:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46AC6F80542; Fri, 10 Mar 2023 22:43:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44071F80236
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44071F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aKwq/Onk
Received: by mail-ed1-x52e.google.com with SMTP id g3so26155763eda.1
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtTDNGd4OKXSBNgUghpGOqMcCM6UWM1avWy8539QlKU=;
        b=aKwq/Onkzm1G69ixhhVQ9wEUply4dRoc6+jOvfU94SP6WWFKCmp4Nw3F+G+XgIS00R
         HYJselriPM1R3rR6D5ZlcKqsA8uEsQ1waZfG1G17qWj43d6MCZeuyWAVAhhQ5h10z1PD
         MhnVNyDszoR6wYbGeCI6G4T6dmjKTqZgXC+y4Xmwy9gKRrNaKmtgukc97tHxUkf51MDO
         X+hnrQLt3ACFfXnf+eS8ipaMMdZ9hjaH69oO8+hOD0uyzQy6zCHiHeLXyMjeA5CH/kpI
         KbOxukVTdBuqOCOZ4CdGK2yvHbgSZMXaCAoaKpUtTlaPl7RoRKDhqWCG65R+HjHGJZ8Q
         7v3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtTDNGd4OKXSBNgUghpGOqMcCM6UWM1avWy8539QlKU=;
        b=FLIsqwqHx3Gt8GvI/exe/3qSOeRTZF9s/8fX4344VZ4Q7HTyXjQpJm+OZZ+epPCCeL
         ULrIVRgJcZwX1BIaMb+ArijzgQVqiyximEtleGMvLXE/P0XmnhdrXv6Dl8FP9snEXV66
         V7fekQXIGNG3TXAHwYmqyN1Pj3XWOHrG3a03Jr5RGj8UffadDfpqIRIZNTZv7RpW3cc3
         kja290+kmQMEVUhziPae8e4jg3b0r8UkoCcgcJVd7Sk000Buf4cF+RQDjFZcx6kdhoHm
         aj2dr/ln/HLLY0kNv5zvzlHQT14G8WZTrpMX0TI28YENLzn+dbEsj2FZPEYPm4qE1wms
         4pWw==
X-Gm-Message-State: AO0yUKXOCcMzbefuq4YQROJCZ3a5aLNlUKzxVGbXvSDcqmRmROPgco/1
	SpntlZObaON9DNAk2LT+T6wVPg==
X-Google-Smtp-Source: 
 AK7set8PHUQ6DL7eFsVXVoAnmstVTGwi3LR28x814KZUIny/qh75j7xE8KDu/r3osk5u+e4VTkuMlw==
X-Received: by 2002:aa7:ca41:0:b0:4ad:a70c:e010 with SMTP id
 j1-20020aa7ca41000000b004ada70ce010mr23647133edt.41.1678484631647;
        Fri, 10 Mar 2023 13:43:51 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:51 -0800 (PST)
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
Subject: [PATCH 9/9] ASoC: codecs: zl38060: Mark OF related data as maybe
 unused
Date: Fri, 10 Mar 2023 22:43:33 +0100
Message-Id: <20230310214333.274903-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5COYOCI5Y63RRGJLJ5ZIGZQH4EZS3MA7
X-Message-ID-Hash: 5COYOCI5Y63RRGJLJ5ZIGZQH4EZS3MA7
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/codecs/zl38060.c:611:34: error: ‘zl38_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/zl38060.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index c3d0a2a7c36f..28c92d90299e 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -608,7 +608,7 @@ static int zl38_spi_probe(struct spi_device *spi)
 					       &zl38_dai, 1);
 }
 
-static const struct of_device_id zl38_dt_ids[] = {
+static const struct of_device_id zl38_dt_ids[] __maybe_unused = {
 	{ .compatible = "mscc,zl38060", },
 	{ /* sentinel */ }
 };
-- 
2.34.1

