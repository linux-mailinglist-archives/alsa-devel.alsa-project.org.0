Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4090770668A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F209D8;
	Wed, 17 May 2023 13:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F209D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322429;
	bh=5A+u31d9cvQOefS+rAXPmsmb/kUKAXdw4oQfS5rt5+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mH3AOMI7J2P/InB8A7EHe0tiYbcXzBi1tCvDgpzSU5WKbM24StmBfB4WTzbCB5SG1
	 whOxPlmEF7jF8lBJ7v4q29LRWuA/M4p6MFBwW+0MyPqIHrwWSJmV49+HxFVzJtidO7
	 QcD9Obir6hhmyVC07NZJaRhsPppmlCK0W5C9papY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D4F7F8058C; Wed, 17 May 2023 13:17:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2230F8057A;
	Wed, 17 May 2023 13:17:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF814F80272; Wed, 17 May 2023 13:17:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AAC7F8025A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AAC7F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AzaZ4guz
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-510b56724caso8456530a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322082; x=1686914082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEOOEjR671HfmOXPgQqMUHzrdAM2unOi/T1lUcVo2j0=;
        b=AzaZ4guzFC7mjzLyKRvNGAUkMMT+3Wa2whIOYVnJeD+QyZ8EBww+DnbNc8pW9F8KvM
         RoEO4BMABU8T3j9OJeY7RXkgrFJO88Qc3bpF9ewu6lRPm01+JjTV7QXpBSOJo38+G8bp
         apympiZR1cjbuuKJFlidTumihU9/KGAQLnnSaSrQSiGNyPYssn1XKliSaqWAnHV21pwQ
         atF8ps54PE8dNWH2cPVxYzif9k97D77l9URcXuo+ehsuiyRzh0F5C97ifI6JIyvQj6w5
         SyOurd9nCf0A2D4c4Zw5WLOYPJ79xD5KufmjXXKv+Vzwwnbe+w/A0c4Ay9Jig7OrVISB
         VBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322082; x=1686914082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEOOEjR671HfmOXPgQqMUHzrdAM2unOi/T1lUcVo2j0=;
        b=MuZnpa1HlzXEKZfktd4WVPLr1bz0DHAUS77om3VytiNZ88p5R3w6LgZgUwRhDZ+ouF
         ghLBzC1gUdyqAPBakq472TP8/YL+QvgOW6Ns4EsG6IN80jSb9hP8EGd14OIBSPXqQ4dS
         LQS1tGZFt4/HGJrmb1tIylMYthBAH5kvNbMJz8K9cb7RWsDnQf2VuCFrIu3XPwlBRvOw
         oCiMSRQd0JuKUovIZW8sgSD3hYy2D94LlYNEkH1TgzxEFT8Zc5k8kGCytsrkYZKVZG2s
         lYB3WxL0+Yhp/uY+ff7T5puEHytsZ1CPl3K36sC+n0tFtoHnROsoGUHiT92GeuPNJ1TU
         wnMg==
X-Gm-Message-State: AC+VfDyZl+p+xDQXw0aY9bFLBTS4fRX2A81k6u41ff7SKhbJrCOEVYPm
	tXNLjjHiiZWF4Sa8msOXF6iU+w==
X-Google-Smtp-Source: 
 ACHHUZ59bqvno6jHhPiAuS2Tvt4ztbcI9pGqM5YYNJMWeveZwz+QiRkdhrj2byFPUKW1FIM+Mx3+Tw==
X-Received: by 2002:a17:907:3e21:b0:94f:2020:b5dd with SMTP id
 hp33-20020a1709073e2100b0094f2020b5ddmr1773127ejc.24.1684322082024;
        Wed, 17 May 2023 04:14:42 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/12] ASoC: codecs: rt5682: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:08 +0200
Message-Id: <20230517111416.424420-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U2EAF2IVTVLF4UM24LGOS2HJFHM5Z3PC
X-Message-ID-Hash: U2EAF2IVTVLF4UM24LGOS2HJFHM5Z3PC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2EAF2IVTVLF4UM24LGOS2HJFHM5Z3PC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver in its update status callback stores Soundwire device status in
state container but it never uses it later.  Simplify the code a bit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt5682-sdw.c | 5 +----
 sound/soc/codecs/rt5682.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 6e3b5c5eced1..67404f45389f 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -500,9 +500,6 @@ static int rt5682_update_status(struct sdw_slave *slave,
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt5682->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt5682->hw_init = false;
 
@@ -510,7 +507,7 @@ static int rt5682_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt5682->hw_init || rt5682->status != SDW_SLAVE_ATTACHED)
+	if (rt5682->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index d568c6993c33..301d1817f8f1 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1440,7 +1440,6 @@ struct rt5682_priv {
 	bool disable_irq;
 	struct mutex calibrate_mutex;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

