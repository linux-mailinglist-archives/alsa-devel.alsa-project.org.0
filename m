Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B468F2C8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 17:05:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C9F827;
	Wed,  8 Feb 2023 17:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C9F827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675872317;
	bh=vHTNVK5x9mlkG7LFG3BebgDQ8s8RdWzGXFK8f5T9o4U=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6O7TnKkeORDQEosXe+ewcBghuUzlWwXLCOIZI4dYc6z4xvRnw3/R9jGtp6CYNbf4
	 S1vFHlBMj/G9kgK0GrqavLGSX5AWU57qVniy4RedknT0bSL27JGKtQmPFloVwGHks7
	 Ubh+3NNJce76VM6pTqzeqFaV6Ba5qPR7oDMb6sZM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60003F8012B;
	Wed,  8 Feb 2023 17:04:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C4CDF80165; Wed,  8 Feb 2023 17:04:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99C16F8010B
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 17:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99C16F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ejg/jsd4
Received: by mail-wm1-x32e.google.com with SMTP id o36so13673378wms.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 08:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+m3F3iCUC+jLles+DVcgXooXwK7NZCMV3ti5i6vKFM=;
        b=ejg/jsd4afdTbrNvBe+FF55hHfpxJn0Y/8BT6NTXpa/o4Tk6z8yZyt/vz39+oG+2+d
         PxCaODODZoI4mKRsEmQovjsVgfCdoel8z3aH25CRr79ZnKKzV+ocWnG4fmSpgqSvgN1V
         kyLmiiXRfkDvyu0FgrxULi5nAFcKHE5Ucv9EE0jPwGGhLlkDSCuHJi/T0o4wvE/FDFO8
         TbOwMdSbGSkTHCEhnw3oBjACwBimx0cXyI2SJXcrKJpTeNvmf5MVDYMRCY/VSfWSqgns
         gkcvhd1um6HaImYSyg13JStrCNKEIsLtC3qj2uY8ZUiRuou2hbkFTRDAcpRjZMYrVTDn
         +KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+m3F3iCUC+jLles+DVcgXooXwK7NZCMV3ti5i6vKFM=;
        b=I6T+4t3QDkpLiz/YaIH11RbQx9nfQ968VJX5z0ldCzwlmHXp55v58OsgNO+E5oK9kl
         NiBn00yZwKm7uV+NtghTKfwhNR0z48ulMN9Mif7RLYqdJuojZLDu/lyBSsl9L3Tj4IR7
         a0wZpfqW1mBebG773FQTslhKLQQq9J5qIfRLDBDfPxewPeLDqgXRioc8q0DIOiGPgqil
         w/W3eYI6/yJefeJ8FzdCWncSeMbqu6TpHOmHeUj0t7yHbHOuvf5ryLXer6rBP1dWRk0j
         gSZgLqhVw/x+80c++sx6ONmX0HsCIluPueAeWVfI8HDeroavm7/3gN67gMc+RjhiM1jl
         mCdg==
X-Gm-Message-State: AO0yUKWs3r2ns4d6h1aat0w+WNXyH2a+hKXusIRLhUMeZkBhCvgNKPC3
	sDMIsliDsjuN3B0xpeCr1vsYUg==
X-Google-Smtp-Source: 
 AK7set8omr9IactH1otM+Cqkk1aEQpSRxG3aPP3qUBcBsscAJnAoRkNQlMhTD7TwqkYrWkA0yvIJgw==
X-Received: by 2002:a05:600c:998:b0:3dc:59ee:7978 with SMTP id
 w24-20020a05600c099800b003dc59ee7978mr6967187wmp.38.1675872254623;
        Wed, 08 Feb 2023 08:04:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c2e1200b003dd1b00bd9asm2169890wmf.32.2023.02.08.08.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 08:04:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: max98090: simplify snd_soc_dai_driver
Date: Wed,  8 Feb 2023 17:04:10 +0100
Message-Id: <20230208160410.371609-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208160410.371609-1-krzysztof.kozlowski@linaro.org>
References: <20230208160410.371609-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ANYSDR6CTMHKTMTFZ2QBBDM436Z2YY4V
X-Message-ID-Hash: ANYSDR6CTMHKTMTFZ2QBBDM436Z2YY4V
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ANYSDR6CTMHKTMTFZ2QBBDM436Z2YY4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The max98090 has only one DAI, so snd_soc_dai_driver does not have to be
an array.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/max98090.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 06ed2a938108..b419c49e1e08 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2356,8 +2356,7 @@ static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.no_capture_mute = 1,
 };
 
-static struct snd_soc_dai_driver max98090_dai[] = {
-{
+static struct snd_soc_dai_driver max98090_dai = {
 	.name = "HiFi",
 	.playback = {
 		.stream_name = "HiFi Playback",
@@ -2374,7 +2373,6 @@ static struct snd_soc_dai_driver max98090_dai[] = {
 		.formats = MAX98090_FORMATS,
 	},
 	 .ops = &max98090_dai_ops,
-}
 };
 
 static int max98090_probe(struct snd_soc_component *component)
@@ -2594,8 +2592,8 @@ static int max98090_i2c_probe(struct i2c_client *i2c)
 	}
 
 	ret = devm_snd_soc_register_component(&i2c->dev,
-			&soc_component_dev_max98090, max98090_dai,
-			ARRAY_SIZE(max98090_dai));
+					      &soc_component_dev_max98090,
+					      &max98090_dai, 1);
 err_enable:
 	return ret;
 }
-- 
2.34.1

