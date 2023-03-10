Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6206B5323
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:45:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5269D18B0;
	Fri, 10 Mar 2023 22:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5269D18B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484735;
	bh=xqzo+FI6ngi/puM7Pe3gWQhRnpEHNxCaKHdfek1i+/A=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=p3atF5ayA0eyl8PY18wHl43oCbUeD7zIjtyFZu/wJHbjVVzFS/SgT3lm6CCZar7u4
	 qU3B6Mhyz40sRxZ6gATI428kFVU2ahl8Bo1rVxKxCxoJ9s7GRt/xgFCEnRLjt5aAQO
	 zQlNCUgjLfEOiQE+1H4c8q6t0xF1DA/i9FefQS0s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1499F80533;
	Fri, 10 Mar 2023 22:43:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7445EF80236; Fri, 10 Mar 2023 22:43:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54365F80236
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54365F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=haEy2ydI
Received: by mail-ed1-x529.google.com with SMTP id ec29so26084713edb.6
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OodZcTc1W904hklpN17tVTAGqTvpntmH7F34q8bSVFI=;
        b=haEy2ydI/93VirwC68PAqDgHfgBgaRW9fuhmEo4FHbTnT+yd+hfaTXZ2DQO8024uiN
         rWA8Kvp/QQWUQxqwnmRVNVUdVkBNsBNm/R3F42PX6N9xTLFBfkFcbLFc3Em7FI4JCVzE
         IZY0NLK/6Kk4QOBWVs3bAZXdaDhlKocwUO8buNpplD1R4rZd6ad55XRrs8jj2zxs+Efh
         Ih/R245AA36qMuC8DCIH67+2qCrbLHkdtgKjvnW+33k0uPRavZhwdPjZPk0z4zc7FHVj
         PKJRfSAEVssfGirw5H7phcxVZ1zj8McSSjuzfSpJfU3lZmO1O0s8OECUceYiEISEONiN
         SF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OodZcTc1W904hklpN17tVTAGqTvpntmH7F34q8bSVFI=;
        b=IiDtj/zPKkXESoKI/cgs6Gr9CWB0eDyQi0PaSJccPv5nqV2/fZufNorrrr/ZpMOHl0
         n0COEIDgkISEFMs79MyETOcq5il/IKxgdYiBwqHbDS198ciiGtBetyp1B0DR42zEPzge
         Fz1PxcuxQMJQqmpMiSmRfDbW88LNFMH5WPWR1PN2p6OmyYVBwD5McVwWWXxRR4cR2zq8
         gTTV/nXdh+lqZFhIKni2UspFJgwwmp5eVfNhEs2YW7zYLGbPRW3xL6n9ulTi1M4RVzi1
         +Au7P7r0hgRXEEXHz97zqQ1DvhJtQ9DG1vLsDva9mbDxCR9TbGY7Rrrr5sqWlE5CR8GG
         Wuvw==
X-Gm-Message-State: AO0yUKV7cS9tBJ+zb7WvWHkxG/mFPUZc7qhu7c8nbYqcH1R/35zPhkfo
	loPLS/DAsIoz91M4a3Ie1Nr2tg==
X-Google-Smtp-Source: 
 AK7set8rdSwuJIZjVXbyv0eXXG6ZQ8Z4Y3OpjtXysYZ6r1dQ5W/2Lf4cBRGLcMFVT5dX8XLJ864avA==
X-Received: by 2002:a17:907:9b03:b0:8f0:9566:c1ff with SMTP id
 kn3-20020a1709079b0300b008f09566c1ffmr28443272ejc.69.1678484620243;
        Fri, 10 Mar 2023 13:43:40 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:39 -0800 (PST)
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
Subject: [PATCH 2/9] ASoC: atmel: sam9x5_wm8731: Drop of_match_ptr for ID
 table
Date: Fri, 10 Mar 2023 22:43:26 +0100
Message-Id: <20230310214333.274903-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T64WSZWWPGWH5BG2HBSFWQ4S4SQJCL5D
X-Message-ID-Hash: T64WSZWWPGWH5BG2HBSFWQ4S4SQJCL5D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T64WSZWWPGWH5BG2HBSFWQ4S4SQJCL5D/>
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

  sound/soc/atmel/sam9x5_wm8731.c:189:34: error: ‘sam9x5_wm8731_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/atmel/sam9x5_wm8731.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index 99310e40e7a6..2bc622e86376 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -195,7 +195,7 @@ MODULE_DEVICE_TABLE(of, sam9x5_wm8731_of_match);
 static struct platform_driver sam9x5_wm8731_driver = {
 	.driver = {
 		.name = DRV_NAME,
-		.of_match_table = of_match_ptr(sam9x5_wm8731_of_match),
+		.of_match_table = sam9x5_wm8731_of_match,
 	},
 	.probe = sam9x5_wm8731_driver_probe,
 	.remove = sam9x5_wm8731_driver_remove,
-- 
2.34.1

