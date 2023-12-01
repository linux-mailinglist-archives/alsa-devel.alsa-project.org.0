Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE0800CA0
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:54:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED42DEC;
	Fri,  1 Dec 2023 14:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED42DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701438861;
	bh=9S9uW1BWygzIc6yZMYOE2M5Cqga0J78zXl+ahFk36fs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hHCE0qRwEkVibHn8px1a+iYsbhv33d95ybhoB9+o0gTv+fa5Xc3TBLnGqYr/uMXlk
	 AEOYfgSpJJ7CfbBRjiJXIr/hdnxJZ5+j5MV0BjRKxOMBof7iNqaXkMiOxMHPYrPyga
	 7SivYtibe1s0c8FkmRgJbZA75XPRn074dSWGAJis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 513A3F802BE; Fri,  1 Dec 2023 14:53:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE09AF80564;
	Fri,  1 Dec 2023 14:53:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BB64F801D5; Fri,  1 Dec 2023 14:53:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3BECF80114
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3BECF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EkqBwMvV
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50bbfad8758so2936630e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701438815; x=1702043615;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7K5IV7jdfgIwO6ukGuP2RwaX7x4/Mv+9On20bS7YMg=;
        b=EkqBwMvVuOtSiYibbpqbpjn4pQiqjaEODFLa6V976xFf1qxlYal8ecneaRZx7k6HYr
         m2W/xW9GZCc3bQ/kimOyv/lxDYJ/WRliKelusw1ZFWt+Fu9Ij2VYTb3Tx7ZzUmcGva9+
         pW4gJsPNF0G2HGMVbVfd94nM78VsTj4oHJkJlFGmGqo2SWKwvY/1oRyCOF9mNjIVIGdF
         eaV5gGyj0C721MG4D+PWQYBIvU3fa9nduMoRcmS1pGRtUC2c1LN8OCRsDlBcEpdxp7A2
         T8ADdAoC2YQ31/gw5RDKJjhg/f6UfcVYSaLRgxSr4msPnYTZM1zT3y3DRx/aVamSqwDn
         V50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438815; x=1702043615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7K5IV7jdfgIwO6ukGuP2RwaX7x4/Mv+9On20bS7YMg=;
        b=bZYcCzO4m0IxDCTM6PgAJuTng2gq9vYhRU0A0vWC1y5qyNoft3O1s6xg92JVd3puCi
         leIj1G9isOSjSZO5bLXoHyy5fEffM1Ih1p4jRwK6eJPx8K/yYSJJAW5y8at+3St9jlv0
         y/tY2XAmXicDCflOuiPAZl7scqE6w62IqgnK3eUvAnxSjSMUDCQerhSoBCtw00IWtTSU
         MtdK/ZfV2s1GDc/KgKLPG+7DZNvHLssp+jCfBQ35SIjPtBOXfhylw9SWAcqZOGy1D4Cq
         XrSkCM0AbbiAXXmDkqm4ncEVgTQRKkp1/c8E6zF8u8uQQJyEehGp4G/hMKI0/dcmVKNx
         RdVA==
X-Gm-Message-State: AOJu0Yy580i1ZLywxjCllYEcdDxMsMrlXc2pY4wG6OW2K9GwImCaBqmW
	ru1xeC8PAkmzZd8vWbSK4UhtnQ==
X-Google-Smtp-Source: 
 AGHT+IEacAtD9giIRCaITOlBrlQe56T1GJ0qBYxW6GO25Dtmjc8UIVW3w/USQrHdEQXdcy/BGYheAQ==
X-Received: by 2002:a05:6512:48ce:b0:50b:d944:c049 with SMTP id
 er14-20020a05651248ce00b0050bd944c049mr357349lfb.267.1701438815464;
        Fri, 01 Dec 2023 05:53:35 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 d20-20020a056402001400b0054b531907f8sm1643159edu.73.2023.12.01.05.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:53:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: qcom: sc8280xp: set card driver name from match
 data
Date: Fri,  1 Dec 2023 14:53:31 +0100
Message-Id: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QEMCDYK7TP26EOLPIZ6FXFML72IZR7OB
X-Message-ID-Hash: QEMCDYK7TP26EOLPIZ6FXFML72IZR7OB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEMCDYK7TP26EOLPIZ6FXFML72IZR7OB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sound machine drivers for all newer Qualcomm SoC platforms are the
exactly same, therefore it makes sense to use same machine driver for
newer platforms as well.  Choice of sound topology and user-space Alsa
UCM files depends however on card driver name, which must be customized
per each board.  Allow such customization by using driver match data as
sound card driver name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index d93b18f07be5..7df28ecefd65 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -14,8 +14,6 @@
 #include "common.h"
 #include "sdw.h"
 
-#define DRIVER_NAME		"sc8280xp"
-
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
@@ -133,13 +131,13 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = DRIVER_NAME;
+	card->driver_name = of_device_get_match_data(dev);
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
-	{.compatible = "qcom,sc8280xp-sndcard",},
+	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
 	{}
 };
 
-- 
2.34.1

