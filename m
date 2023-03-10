Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD6C6B5337
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:46:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC1417ED;
	Fri, 10 Mar 2023 22:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC1417ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484789;
	bh=OxhbhmdpoEdfpd/qom1HjnSVal1lw51i59xv5QcDOVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=G5oE0VcdXa5D6gKxIKIWsapLkCS+E/84af6xWtJYWATlPS/gDKVIvp4daKX+plfdD
	 qlWF4RPtIl08RXib6g+rhDpFeBZg8gWCXn3KKIAhkswAirAMDPlUywNqNj8snv+qvF
	 gIqH62WxyeqQxPeNUPZf0B0qwLqgUle6wwhTLAKA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23016F8055C;
	Fri, 10 Mar 2023 22:44:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93B63F80527; Fri, 10 Mar 2023 22:43:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 59590F8042F
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59590F8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CCPhzuWm
Received: by mail-ed1-x52e.google.com with SMTP id ay14so25988528edb.11
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHJnD+TmpIWsb3dNvXDWriziAnT09R0JSbZSoSxYB3I=;
        b=CCPhzuWmaV2C8C7W8SIAp77g9fF1tNRToI2X4v5sruLui5QAT3eplPYntV1A5g5snH
         Ab+hIss+rE1Eib9wUxIspkPWeUgftjiqbcxXcQ9v+tT8liWdlpu00X7AXKAfgu1X84cT
         3Kd3ZM+oC3Jyi84nGCCG+8BKzGFAgavCqjo25PCfWAMiIp/4wFDPaqyfxBx4tv8QPooK
         Sm6J+U3OF0h1ela/q1CIoL+sOXB4lm5zaDO4oChwR5m6bMXq/vnRg2X+BwjEF2VbW8Xk
         QG+s3T06qdk54u8bw/YX3am49jq1HDDkuKa8R4n6+LCJUScGQzKIRXg6SwWJhEKwrhoa
         cAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHJnD+TmpIWsb3dNvXDWriziAnT09R0JSbZSoSxYB3I=;
        b=8OlcrO3j6PIWpa5iQbxbYPV1uVWpUl2ko00iA4XSrltiP5p1GeKn9+KkZS8QT7LKSd
         JHTCpE//GXTHK3ZUAqYPQtZCqy+vZ2Zu/D/dGL7XGQjESUFwyUBYN9cfWwl1QwETFzLL
         NLNDLfzx0FN9Lz/D9cZeDrHLhif/zVVXBiSnFgC7IRSUBz68kmQoR4MtA2e37C5xdr14
         6yBQXEShXOsOhq7AmNamMuDhy1QHW9T+Ux1oxbZMQ2gk8o1tkOhv4KSxWCUnZ6jaNXQP
         wYyNMUht6YS1CyLy4cC7hD79G8tcgXRmBQjCyj5Cjet5l6g2OD0tjL5qbdaE9RyJAiDK
         6wGg==
X-Gm-Message-State: AO0yUKUb+sDJ0C88p80gwaERoVztDDfU7ZEkbAgk6sGvLgWr9vxPMSz3
	0+5mznyAV2w/RcT/22QrbSuoaw==
X-Google-Smtp-Source: 
 AK7set8CrVSqb0nImE54sT1v/yDICbplJWTA1hCEEjQ0wOFQkMFxqNNonQJZvgygm+HU//tgaKmXGg==
X-Received: by 2002:a17:907:1909:b0:8b1:304b:8e2c with SMTP id
 ll9-20020a170907190900b008b1304b8e2cmr27647387ejc.0.1678484630055;
        Fri, 10 Mar 2023 13:43:50 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:49 -0800 (PST)
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
Subject: [PATCH 8/9] ASoC: codecs: src4xxx-i2c: Mark OF related data as maybe
 unused
Date: Fri, 10 Mar 2023 22:43:32 +0100
Message-Id: <20230310214333.274903-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BZ55RD4KQI3CWY7MMBNMEK6C5U2VLVPX
X-Message-ID-Hash: BZ55RD4KQI3CWY7MMBNMEK6C5U2VLVPX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZ55RD4KQI3CWY7MMBNMEK6C5U2VLVPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/codecs/src4xxx-i2c.c:27:34: error: ‘src4xxx_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/src4xxx-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/src4xxx-i2c.c b/sound/soc/codecs/src4xxx-i2c.c
index 27026030704a..a40fd20df984 100644
--- a/sound/soc/codecs/src4xxx-i2c.c
+++ b/sound/soc/codecs/src4xxx-i2c.c
@@ -24,7 +24,7 @@ static const struct i2c_device_id src4xxx_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, src4xxx_i2c_ids);
 
-static const struct of_device_id src4xxx_of_match[] = {
+static const struct of_device_id src4xxx_of_match[] __maybe_unused = {
 	{ .compatible = "ti,src4392", },
 	{ }
 };
-- 
2.34.1

