Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AC56B534E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:47:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6058818AD;
	Fri, 10 Mar 2023 22:46:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6058818AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484837;
	bh=UG3AML3wN81g7jN7sBE6G6x2s9GGDjom6SNjDa8jdXQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=K19ZPx8ltg4izk7t1yw7I+QgW2e+5HQp8B+KzgWVaSLyvpFHvpjorVYJe9uS8ZaMw
	 UbTNXX6/cGgAZKozyQ5YlVdO4UPEvKt5fI+mS3hK4WCTiCzvdZNsZpBG4HDhU47auG
	 1VfIu6vzLy5neiYQksTy9HliAp2a/OVd9ZFrFnes=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6975F80579;
	Fri, 10 Mar 2023 22:44:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BED08F80578; Fri, 10 Mar 2023 22:44:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65089F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65089F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h8Q4NOjP
Received: by mail-ed1-x52a.google.com with SMTP id da10so26157770edb.3
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnYq1zeLkuGP06fgrJTup4yOJApLpMSwWcWTUqrcgj4=;
        b=h8Q4NOjPl5R/WiIaAMHaK8PQKHkgJFxVXq8er9dUXTEb8Qxr+L09aiP7GPhzregD6W
         AQOdeFCk9UrCUrhNz6fg10wdRXMjIaYNWbdEmveho99cZ6dcDq8HlC/Dh0hjyei/JSqI
         8MpC93/Qz/cK4xwvixdyiajxszYgj68Hr6MPxaZU58xzx+0C+R2MFi+qOaIJXTLj5iVC
         DHeGQHu5TMMDHr3N6XPjlxWg1ws2o5VzYPGrAqVip5ixR5jlb+9ubDA4K7ZM4xRrBDZx
         PeFp0amXoCAgDfrywhfu+B/7m/1xYzMgQwfpYHtd5018ENWEr8AyBwSotrVt95xzcvZs
         GljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnYq1zeLkuGP06fgrJTup4yOJApLpMSwWcWTUqrcgj4=;
        b=2SSRBKR43IPH+z7MY+S6Ag4iLyWzR9HtiegElzySNvvlI9Y/pac7aVdPhyhlVnRYdP
         sFm6DwED+yOkH77VdLRtQ8FXyH+q1zV0qwLE2wvnZVDhEE50EOlanLb1/NnL4EAkKVgF
         UKFkx/MpEvUNpdCxusVMKRhfN+/Xup3jn6OVwoKrf8A/JC8Ti/ApvYgkbQegl2OkXDLu
         hOeuONdMnO8oZpn5ENqI1ZzRBatnk52wfFMEf71p1Ewj1HcFndYaMU+XCYLUM8MtrDEg
         KqgmqMLlooHuxKh7aZxDB3IQu2zpMjS8/EKw61nqVNxTawsHyEInqXwHdOfjdSzdmEZC
         MKgQ==
X-Gm-Message-State: AO0yUKVMG41A/uw7dTyupYLG8p2GxiXy99aXjxBw2hQuVqrcRQjSeYGs
	tC+jsixzsZHFJwVb0EInNODQyA==
X-Google-Smtp-Source: 
 AK7set8Q/apGzf5fRe9BKFf2BS/DHloQQwv+CX45f7pu7bcAkpBEYK89UNKobe0bpL8f4xQIHE7HQA==
X-Received: by 2002:a17:907:c20a:b0:8b1:781d:f9a2 with SMTP id
 ti10-20020a170907c20a00b008b1781df9a2mr26168137ejc.32.1678484626567;
        Fri, 10 Mar 2023 13:43:46 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:46 -0800 (PST)
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
Subject: [PATCH 6/9] ASoC: codecs: pcm179x-spi: Mark OF related data as maybe
 unused
Date: Fri, 10 Mar 2023 22:43:30 +0100
Message-Id: <20230310214333.274903-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FCCE5O5643NRWYX56H6NMHY6APLITHKS
X-Message-ID-Hash: FCCE5O5643NRWYX56H6NMHY6APLITHKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCCE5O5643NRWYX56H6NMHY6APLITHKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/codecs/pcm179x-spi.c:32:34: error: ‘pcm179x_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/pcm179x-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index ebf63ea90a1c..192fee90c971 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -29,7 +29,7 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 	return pcm179x_common_init(&spi->dev, regmap);
 }
 
-static const struct of_device_id pcm179x_of_match[] = {
+static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
 	{ }
 };
-- 
2.34.1

