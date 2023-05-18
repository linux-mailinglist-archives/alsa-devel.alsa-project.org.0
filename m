Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D05707AE3
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E60822;
	Thu, 18 May 2023 09:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E60822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395057;
	bh=ppJAT4sui0E4j+uCtyTmcrJ/oYYjLlk6LkkobvzbBAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X76BOjBG46NH8UeRhBTWqCnsKXhvXMRCT4LjheCf0ElrGSEqaP1MNQExYrdjrHTRi
	 bdacQ1QGpISJmkFO87zzJcVEieJb2sT7yvFsP8Pp2xe0pyWjyqFLRe6EOEO4Y8i2Ga
	 4y7vs74LOd2FcalOeRg1V/aVaE3OGTnrctbNDUfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D365F805BE; Thu, 18 May 2023 09:28:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4E74F805B3;
	Thu, 18 May 2023 09:28:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 541CBF802E8; Thu, 18 May 2023 09:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A1E7F80542
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A1E7F80542
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=M8Z6vWY0
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9659e9bbff5so300219466b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394882; x=1686986882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1eT2t6FyxP9v83v8PrBLX9IzlgvVZW+pMXaKU/JtJI=;
        b=M8Z6vWY0wCGKAcqY9LaP8M36odcIRn0KCyKWNrqM5ddKXkyrIU91p680g/kzWZJm2w
         09b4ex46qbjwZSYSqaACstpD+I9r8FxtvIOG1XjHF+EETJZmimB0gy8lziYy3wmWV4ql
         viZEV65VAOX4zkrD/hQnwsW0GPCcMaqQ4h32e2qTlqsHBJ3smGTN38fbiGQfqkDthQ/H
         oUcxO2J04xq+u6rPLfZfVH9wO/byS1P5SNfQOBflWeKZo/WjWtkoZnV33IdBu2iVmxZP
         BhFufBFLBwHrli6CC+Mpz0HEzlIjFupoepTi6k1k9Wr+V2llmRdxJJJm4xDlGWhe2KIY
         KiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394882; x=1686986882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1eT2t6FyxP9v83v8PrBLX9IzlgvVZW+pMXaKU/JtJI=;
        b=f3v8db4vWoyO68alg/1AfldFyw93rjY9KYB5c97Ox/cjJ5gT+faV/JG+bYCm7Oo5DO
         GGQ6VVYH/6JYCSaPMM8qtf98/XD5SIEDyxQC2DrCIhJfh9JjL///HUaubhtz/R7Z9GD7
         ePmlEhggg/jjC0pgs8DdGiQeK7rUmh4Xxvu36nYA6JAJJgnkyrVIyh+WqjiPTzGhEZ/G
         zMYgKY7GL4+XWljUJetqXJ8z/jjA6Y+HEbH1RY1cba66GXN63WcpM2YrwqNO23awCan0
         0LI+059uWBOGHxxZ5Y4GKLSo2mu4lSrUYW2tjLnf8lbRnQjM/N8aokshqe8qbS0nsz9w
         gDLg==
X-Gm-Message-State: AC+VfDwF2ME1glsLRIS+gwmDraadTZri43h/fJeAqgA4RAB28jo2O/wQ
	BF9spDTPECo75hqkGLkBKFaD75NTjv9XnwfVlZ8RhQ==
X-Google-Smtp-Source: 
 ACHHUZ5ygHn4ldIoZ76oJhZdVGGwuW1NLDvZkJWMysRNSoLrD1RTw0zMlD9CIej5G8rxwodu/f9YUQ==
X-Received: by 2002:a17:907:a424:b0:96a:246b:c65d with SMTP id
 sg36-20020a170907a42400b0096a246bc65dmr27786016ejc.12.1684394882778;
        Thu, 18 May 2023 00:28:02 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RESEND PATCH 05/12] ASoC: codecs: rt700: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:46 +0200
Message-Id: <20230518072753.7361-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T5IY236KIB6KAH5FGGRPFFN6MYSWICLK
X-Message-ID-Hash: T5IY236KIB6KAH5FGGRPFFN6MYSWICLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5IY236KIB6KAH5FGGRPFFN6MYSWICLK/>
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
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt700-sdw.c | 5 +----
 sound/soc/codecs/rt700.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 96fc5f36d0d0..ba7767bee07c 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -315,9 +315,6 @@ static int rt700_update_status(struct sdw_slave *slave,
 {
 	struct rt700_priv *rt700 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt700->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt700->hw_init = false;
 
@@ -325,7 +322,7 @@ static int rt700_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt700->hw_init || rt700->status != SDW_SLAVE_ATTACHED)
+	if (rt700->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt700.h b/sound/soc/codecs/rt700.h
index 93c44005d38c..491774d207de 100644
--- a/sound/soc/codecs/rt700.h
+++ b/sound/soc/codecs/rt700.h
@@ -15,7 +15,6 @@ struct  rt700_priv {
 	struct regmap *regmap;
 	struct regmap *sdw_regmap;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

