Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4617266E6
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 19:14:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64057826;
	Wed,  7 Jun 2023 19:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64057826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686158068;
	bh=jGWKTAlTpuzFalBNEckfO1fpwR2ImWr9RpKLJFLXFEY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CeTOHBO93WgNGjY2SGJ2Ee/fk9shcg0LUVch5K2+4crgGVSi6fXVQ1Lz4GQd9KKsp
	 +K4SeuKFZhzQ6NoINy/YtwdXOKk/9anl6X2chdifI/AB3KxaswsaOVps4UHjLxUIOd
	 3YHVdPrONB0k5nYYi9+J34wUG6KNQuoq9NGBoCg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 310E4F80199; Wed,  7 Jun 2023 19:13:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEEDFF80199;
	Wed,  7 Jun 2023 19:13:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A205F80254; Wed,  7 Jun 2023 19:13:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEF82F80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 19:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF82F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mesdMvC4
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-977cf86aae5so658121166b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686158010; x=1688750010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDf6g1xuCxpSvIAHAS6C9lv2xYoCaofaCj9iSWocDbE=;
        b=mesdMvC4th0od7bqihmQfQzjPowmtJzZB4XhjAl3kQV8k4C8mxHSZ6hfvHRX1uyLUo
         IKHdCJS+j7AtHL2PUGrVtNyKJ23ZGhrNllKyGSboVFCMUaHemjqm3O+CkLRvbmRJBIrS
         jX7iPRWMHZO4HYOpBF46kyL9nBWzA6oKcdZ+iCOss/270kQkrsZd9oCy1nNk385vydkg
         owA3lHuLhe8wt4qOUxHJbTLQV8aSPXvjY/Cdf7J2UF9QAyYJt2gBdds6eE0iPvaZYoBj
         16qEP9Yd2M6uriH9Pq8XBMtPk9xkAyVjwAmCjZfIA8mgE9caQbAyvkc2RZp2tsZD88h+
         lkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686158010; x=1688750010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDf6g1xuCxpSvIAHAS6C9lv2xYoCaofaCj9iSWocDbE=;
        b=dOymFtHDU0o2rlworiOuGesbArfy4fJI07mBc/1nVbRHgdaBwsnvBKqBdA6mpNYRBw
         +NL3RVXRHv47ZkLbSelDKiD1RY/KID65lpgGVATEitqKLvJ2Q8Dmtq74NMgDAci4jke0
         Sn/CRLOcutYmz8//7fA4raXx26uU7+D/KNhiuozYkGir5NWMu6SbjMsGE5nIUp8sEZRC
         +jcyPyHhjbcmZFpsQEOL41TBhPhR5LVpU+RBL1SsvlRcsyI5YIfTkat+AbSXB9n6kuib
         bcihzlso1RrRopVCCw3uUjGFMFah2VSfwflxKEYY3sp6D8L9Lu2d73bmmIVa97dr+esK
         1vbw==
X-Gm-Message-State: AC+VfDy+9HmW2G/p5CpojOX6Xsn+79v2BqjEqZmkwXXpXBss1QTcJm6/
	16QNRLkak5o0qHeDn3baUpgfGP7Za/2rGePL+n8=
X-Google-Smtp-Source: 
 ACHHUZ4eRbnbnRgq6PTEJhKylTurSxl9ZJzOQ30XkHFDVitSR12i1HSqPBn+BHiuZbDtPx66/cdl2g==
X-Received: by 2002:a17:907:7282:b0:973:ca9c:3e2b with SMTP id
 dt2-20020a170907728200b00973ca9c3e2bmr7177793ejc.25.1686158009810;
        Wed, 07 Jun 2023 10:13:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 k9-20020a170906578900b00978868cb24csm838861ejq.144.2023.06.07.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 10:13:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: wsa883x: use existing define instead of raw
 value
Date: Wed,  7 Jun 2023 19:13:26 +0200
Message-Id: <20230607171326.179527-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SVQRUGIVRCKWUTZ7CQHBZ3EN2ZDFUM6U
X-Message-ID-Hash: SVQRUGIVRCKWUTZ7CQHBZ3EN2ZDFUM6U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVQRUGIVRCKWUTZ7CQHBZ3EN2ZDFUM6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use existing define for WSA883X_GLOBAL_PA_ENABLE instead of hard-coded
value, just like in other places in this driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index c609cb63dae6..5c1cfceb2956 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1334,7 +1334,8 @@ static int wsa883x_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 					      WSA883X_DRE_GAIN_EN_MASK,
 					      WSA883X_DRE_GAIN_FROM_CSR);
 		snd_soc_component_write_field(component, WSA883X_PA_FSM_CTL,
-					      WSA883X_GLOBAL_PA_EN_MASK, 1);
+					      WSA883X_GLOBAL_PA_EN_MASK,
+					      WSA883X_GLOBAL_PA_ENABLE);
 
 	}
 
-- 
2.34.1

