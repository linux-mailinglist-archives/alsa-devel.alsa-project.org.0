Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD71C6B5354
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:47:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBCEC18B7;
	Fri, 10 Mar 2023 22:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBCEC18B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484850;
	bh=je/tHEmpanmMBd75QLQG4hykINU9D15hIJ/yNeOJcqc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=h7wEkMLtb2tN/7zPrGDCHqVrKbiQNXA1c1hsvaarYoDqwfjdyALacpFj3+qIBnPPU
	 cGFbFhkxDybtYm4TyUGkn2mGIZwF6ZRW/YLF56zR31fi/2ww/WVEkLaApmow2ZMJ/O
	 ACKuYX/rjqdl5j2Tx7nfoPKD0X7OV6dS8JaBqdcg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AF2F8057D;
	Fri, 10 Mar 2023 22:44:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19EB1F8056F; Fri, 10 Mar 2023 22:44:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3BBAF800DF
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3BBAF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ncSa4Ipm
Received: by mail-ed1-x52e.google.com with SMTP id ay14so25987626edb.11
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVncxQNg4gxFDgYIBaUsd3uzVPfps5DyaJrzAl5UBAA=;
        b=ncSa4IpmBLB7CP0IXgXqZdSd89q1KMW/Iz2YrLgk/ZIZugabSyh0SCeAoelIf4BCcy
         wew8y/0j0iY8rX6KcIqjUEOtfT2G8IgKy1lPbcPl7EZJAwFKTAay9d6DM5bftdwNV+4G
         QEBCCNRaRpaNDv09XC3gX/t96zJWIgA08Lk1G1D8Mh9YiBmMqzj5azToCXnaH66iyzXQ
         3jyXhBuy5zX+6jBzwsE4GwPJFtH/mygoLD50q0kb/UiqPILDi6Bxa5zwGMXiWKPaZQur
         e7KCkwAl7i62olZVrX4qNRf/a0tLcMrXwbH7wnf/GLHVlMdNvcrLqCrCAYsN1x3mr3dZ
         zp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVncxQNg4gxFDgYIBaUsd3uzVPfps5DyaJrzAl5UBAA=;
        b=Jo7tGp/CMsz5jK6DgMluDzCsCHljq0PIjKpS20wzPcymXXtVm3XDTRlhuY7Gz4//Ox
         LyeCAapEpjh3wOdY+t7i6WAB9JLvkl7v19MhKF6KTmCT1DC7tGJ8I2ChRgBGe6HejdLL
         0TZ/GKdrRwIw+S9n/GM3JkoZIau9tDH3/+b1WJQEgvdhSuG6x3sdhSxueNp637tMD2MW
         fvz2mzbKWm+oFutmDJIpb1SCSpnXOCsHsZO5vtHgqk0QW9sz34bVY6WK1wA2eDnrM6f4
         /838F8iB650g6BujMM50JH/HJ98UOW7WNCpTvoxu+kz5qM+ka65Ml5Apwp1D/emyzIwP
         9MEw==
X-Gm-Message-State: AO0yUKXreK8a/7Rj/q7s8kc0ZzVLRauT/H9Cy63ixIHPo+M3NvFAb+uT
	bZbx7V2FKEUF3XfWulKUsiB06g==
X-Google-Smtp-Source: 
 AK7set8ZbxJEF5tC478I3Zm/JdDZm7PcmKmY5C2UnCmad6B3N81KaINb+wIFMS2BIhkbDLbGBPiirw==
X-Received: by 2002:a05:6402:31fa:b0:4ac:b308:d732 with SMTP id
 dy26-20020a05640231fa00b004acb308d732mr24684308edb.18.1678484623164;
        Fri, 10 Mar 2023 13:43:43 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:42 -0800 (PST)
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
Subject: [PATCH 4/9] ASoC: samsung: rt5514-spi: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 22:43:28 +0100
Message-Id: <20230310214333.274903-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KSW5OO7KOAMANAF5VGUWEEHMI3NIXTDM
X-Message-ID-Hash: KSW5OO7KOAMANAF5VGUWEEHMI3NIXTDM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSW5OO7KOAMANAF5VGUWEEHMI3NIXTDM/>
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

  sound/soc/codecs/rt5514-spi.c:497:34: error: ‘rt5514_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt5514-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 362663abcb89..22c0afa01459 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -504,7 +504,7 @@ static struct spi_driver rt5514_spi_driver = {
 	.driver = {
 		.name = "rt5514",
 		.pm = &rt5514_pm_ops,
-		.of_match_table = of_match_ptr(rt5514_of_match),
+		.of_match_table = rt5514_of_match,
 	},
 	.probe = rt5514_spi_probe,
 };
-- 
2.34.1

