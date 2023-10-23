Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0ED7D2F38
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B659882A;
	Mon, 23 Oct 2023 11:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B659882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055045;
	bh=MBHGFWiNafo43RFtlVV7A4bk450A/qSKcGPyTpE59aE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LoybG8tijzKfjVqzAX4MFWbZBs1xj2Tq0XSEuxcNZhbvBWQKMR0fwQ48ywH7r1q8x
	 q2W/vHinzW8BYs7asg1xu/trZdMPsEqg+gr5XfykWeAYjcziyI2WDtRccYil1gcQpH
	 AOoOA6ODittBXqLZi419XNM1c/G8ja3Fdron7FWk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60F2AF805C2; Mon, 23 Oct 2023 11:55:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95EEBF805BA;
	Mon, 23 Oct 2023 11:55:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E908F8055B; Mon, 23 Oct 2023 11:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAAC8F8032D
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAAC8F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Q3cDzMju
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32da9ef390fso2147592f8f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054884; x=1698659684;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TezS6fAbmZRfIE/9gAJPYUtZvuonet12GZ8K7ihJ9/I=;
        b=Q3cDzMjueBvgExxHC7y4ECCgSu+t+HT43oZcqmFPJqZM3L7jfMxAuwdNXXYhoq9cVg
         FZizqQbVZhpOc5IZr7C2UVT1/0q+Ck0gREdKylnQBur6lLDdX6+3Tyj2igsoBgrScqjO
         wc3Er8hZGDcvIGXScjr6RP7O9Qr7crIx/AyJqHgyqZn/OPMqsURVTG3+esJLrbUkbxFr
         HT7pJUtAS6HBDQRCOKL7gJwigHUZ/vOqRjtU8UoAjRukAHoqzTBCY+CjutC4T2bwp43r
         xX69ew+pBpI7vN4UDP5N2kBYS+YJhA5A7JVvgcQPqpoNVMwG1L4X5UjzrZ/Owqa8GtoK
         MnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054884; x=1698659684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TezS6fAbmZRfIE/9gAJPYUtZvuonet12GZ8K7ihJ9/I=;
        b=Ty99Ppyj81BbFgghkkJBQmFiRhKqQqIm1FbmEzfA9CWuBdHKLdBHEFgJKe4dTJLr2Y
         8431UEiM6s9/FYWaa3Su2+2YMbvWIGcK7VqNus9N3V2w5RXTa3bQjRYWXGFXW3y6fLzY
         b2AbisB3UAZBW3wY0LvCrMAqYOsKEG4hvOXYxU3KBbGNvhTnVTv6lxAaLqjTrVCI0avr
         NSz0m4aFRijxyRiZnhHB0rTOk0HqHph5Gh6x0TwHMepa5cNmMrc+HPnSgS8T4PQPygh/
         ueb7/O+Od2/mNrEcxP19A3WzmMgMtzGsE+j9/4WujAkiQAT7Bj/Suxgfusc9h2lt9X+O
         hy9Q==
X-Gm-Message-State: AOJu0YwxF7cwMP6ISpQj8/YJtePFjlm/g7DZSPl2ngTiyXmbRnbtXvGD
	Dq1RkDCKIL3ixLxASyEq7v1m7Q==
X-Google-Smtp-Source: 
 AGHT+IHsx/9dXkgIRE0i/tyQBHSemsOVRBosIhYnxE5jqsYSPyBJogKhqbIAWQxRyZ17AF8k0sON7w==
X-Received: by 2002:adf:f603:0:b0:31a:d450:c513 with SMTP id
 t3-20020adff603000000b0031ad450c513mr6210328wrp.26.1698054884307;
        Mon, 23 Oct 2023 02:54:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 05/17] ASoC: codecs: max9867: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:16 +0200
Message-Id: <20231023095428.166563-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J6SMJ7PC4V5A343P4IIGA5XR4OARDIS3
X-Message-ID-Hash: J6SMJ7PC4V5A343P4IIGA5XR4OARDIS3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J6SMJ7PC4V5A343P4IIGA5XR4OARDIS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
to include also the component's name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/max9867.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index b616ad39858c..3b9dd158c34b 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -56,13 +56,13 @@ static int max9867_adc_dac_event(struct snd_soc_dapm_widget *w,
 	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
 	enum max9867_adc_dac adc_dac;
 
-	if (!strcmp(w->name, "ADCL"))
+	if (!snd_soc_dapm_widget_name_cmp(w, "ADCL"))
 		adc_dac = MAX9867_ADC_LEFT;
-	else if (!strcmp(w->name, "ADCR"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "ADCR"))
 		adc_dac = MAX9867_ADC_RIGHT;
-	else if (!strcmp(w->name, "DACL"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "DACL"))
 		adc_dac = MAX9867_DAC_LEFT;
-	else if (!strcmp(w->name, "DACR"))
+	else if (!snd_soc_dapm_widget_name_cmp(w, "DACR"))
 		adc_dac = MAX9867_DAC_RIGHT;
 	else
 		return 0;
-- 
2.34.1

