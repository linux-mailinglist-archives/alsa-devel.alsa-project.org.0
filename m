Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 759906B534B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 22:46:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2FB817B4;
	Fri, 10 Mar 2023 22:46:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2FB817B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678484814;
	bh=ZSeMLLNPngyTlVkoTV+JqX7YhcDe5W0Zp/rCncNXDC8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ep6FiFLc7ApdrkKjtzWot7MbCZftdmAiFlSxwbf2FPvExKOoBu44fFcuGvF0t1X9u
	 bEOJcsbxkOZZzxJw8TKnbbujD/dIguOumMrTiX1k8biiCUOVYxxIIt9jgk01JnyVNb
	 mRfGETXncoRocyu8UfSZC3ntXOoOO/sN8CM6ZPoU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD97AF80482;
	Fri, 10 Mar 2023 22:44:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E56AF80579; Fri, 10 Mar 2023 22:44:29 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BE482F80482
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 22:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE482F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Xx3Srnmg
Received: by mail-ed1-x534.google.com with SMTP id j11so26087142edq.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 13:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeP716t4cBIYV/Qo8houZ6GjE5tTEcSLUUsmtmHrwME=;
        b=Xx3SrnmgKxS5czxvERbapZo0uZsV01LxxYnZdeXVvqWMaJbIqc6s7RwE0R1PdiZQbQ
         5VvqmpWZBxmGyzQQmiflyogrwY/TNDk5BSD48fwB9vkiEReyJZQLKCSWQyW3GgMcaFvJ
         GX9wIjCjB0UbY2BXuCkpTOkwcynB2cvUqjM8zQknB1+Nyrmgcc8UK/BpY39FN/n32OAj
         lRJdt+Uj/pTnNn7dqxBx/km2qBCwBBtsKSatpPh8iDKCLwgNPmaNSXOLGzWfogNUMry6
         aiKCN+Jk9unAevVTpYExN6ukJmrgIuhQ0/nio8/z1in77IIffGTubp9hE/ZgIiDkKu7G
         QPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeP716t4cBIYV/Qo8houZ6GjE5tTEcSLUUsmtmHrwME=;
        b=DiHfw24XHAiVdeMTqlxc1o3FHRI8WmCLubIbEE8TTrKDOlMDg76UvZK9qT1c7ZCY3J
         Q463xoBp+eBhq+lLOfZsPHkLoGF972QUOxUKWoPNTjewGcG0DULhtgL+DL696CjcU7Kp
         pAKJ/66A/4HOs75DxE/W1/nNrVXKd3u4MvUy+yMjoAChd963w5lPuqSNXRkeLSitmxuA
         hTp0qhomMYWvgj9010Co+phPn2QlEfnQTTsVIXWLughm6oBYJ4gSFNE8ughj6V0mahW+
         b3bbzOC2Q9ZHUDYkpyZzVY0293+jU6IPc7ZntF6uk6M4odmhY7l9veDUA/r1TKqmvfvn
         NM7Q==
X-Gm-Message-State: AO0yUKXP2+gJfdkfSVrANJ5xFXPeymcZl3iA2l0pAFwG+N7ZBZgyxZQy
	3zQG5mZwgo6KMT++2Hl+0XkZlQ==
X-Google-Smtp-Source: 
 AK7set+FJFc4dSGpVtgH0w1GTDHbF5wg5x4nW3Gcxvq33tKawN+X7rAHAi4mTn8Xl6rlAxUk/Z87aw==
X-Received: by 2002:a05:6402:391:b0:4fa:4b1c:5ea4 with SMTP id
 o17-20020a056402039100b004fa4b1c5ea4mr244220edv.29.1678484628394;
        Fri, 10 Mar 2023 13:43:48 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:47 -0800 (PST)
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
Subject: [PATCH 7/9] ASoC: codecs: rt1019: Mark OF related data as maybe
 unused
Date: Fri, 10 Mar 2023 22:43:31 +0100
Message-Id: <20230310214333.274903-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PMHB6WPP623AOKCTUJSUC3NFSOQOPNTL
X-Message-ID-Hash: PMHB6WPP623AOKCTUJSUC3NFSOQOPNTL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMHB6WPP623AOKCTUJSUC3NFSOQOPNTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/codecs/rt1019.c:549:34: error: ‘rt1019_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt1019.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index 49f527c61a7a..dff2596c81eb 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -546,7 +546,7 @@ static const struct i2c_device_id rt1019_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rt1019_i2c_id);
 
-static const struct of_device_id rt1019_of_match[] = {
+static const struct of_device_id rt1019_of_match[] __maybe_unused = {
 	{ .compatible = "realtek,rt1019", },
 	{},
 };
-- 
2.34.1

