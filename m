Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7028FEB84
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 16:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E05885D;
	Thu,  6 Jun 2024 16:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E05885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717683947;
	bh=HxuTLkBQopINQRN4REuwcUtobjjBsG1xC011iW2JoWE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fa0vo6sTA17FDmYsmgbhFizMWWrTaz9NP91f/2R4z0AIOK5GpJ7mErI6mvISfOu3P
	 M7UQmLYkfShkCqpW3akOoxRLJxqa6NqG7KLbuM3XnUeB4ofxQE1PVBqRZNK/yo6ocH
	 N3exGjdx32+TYtm8cs7GW24fZjaa+xV8UqGa3emc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F32BF805CB; Thu,  6 Jun 2024 16:25:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FCB7F80171;
	Thu,  6 Jun 2024 16:25:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C220BF804FD; Thu,  6 Jun 2024 16:25:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADA9EF80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 16:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADA9EF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=v/q1sZXm
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a68ca4d6545so190191366b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717683900; x=1718288700;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ULCmZTLH9n5CknDHZXV8N8Yow6DCNDPV4w3gxTOWljs=;
        b=v/q1sZXmInzyEZjykhd1dTLzI3qex1C/LGib3tCOWE2sBIJpE4n5Q3LbiJK56RVMIj
         WbiYyaOK2L2pmPeg8t48JBqksG7joOM4oNtvCJUSdK3SjDUvdxXGtSedYqoIxN7g6ZYb
         CMvg53Oxz7p2ENqd9xlA7iQiOgOHe8mLdA9EBjrLQnRoQoSCfEc7R+wNYW6WU9ShCTQD
         EGoMUPivJ3pzRQOkvC6Zm0wH8v1rRZG8enBoedqdmlXmVyEEUMYlQnPPFudBAup1CGt7
         bvPQtHIxBGv7f6HEkqA0HfS5zQdaurZNg+kHl76VSdBiVOFBdKNhmaeUh8q6g6elpMOy
         zikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717683900; x=1718288700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULCmZTLH9n5CknDHZXV8N8Yow6DCNDPV4w3gxTOWljs=;
        b=i1PBxr1Gir4Ru0aEbw61dnR1IVJ4jTsgYtyqjxjJfpUQtYvzyQufbMWazTcYtkbhfN
         FcT2rYA4HwRO3PByxDezliAiLIwNftWzE1nRDaXw8nTKOzlmjyEsIkdY+gHKWgG4RJ1y
         gBBPWsQREObYtPIj7aSZBT5Azt0mebI6CIMD1PYoPG+qTXlZaNHNAQ7iy+Z2MN4csVaH
         b4rhIF9zCTDcX/mW3x0dJR9i2ecuHFlXLbC5g2awaqr8co/hYPoeTpcdWXav0Y3aL5pY
         Y0bsK7VXPhnjrhwR9YzSiljo39zafs5Ts2Quyj0zLj4qEEV9pUghtFwtWjpfhiYg+5Dk
         0zgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV501Qej/ny9TBMX5FyQjz1PKmRakme8ltiTULQmvv4ZLpVry+o7f+nI8Cj3EYnXQdhsYhYmx9P+P/Gc2ZWBkjIB+Y/FJmmZUzUbd8=
X-Gm-Message-State: AOJu0YxozynyMCQt7/HSASwH2QXDpLzOkfrorNQVPVbpJY2sqa2cAL0b
	leq07Y61u/car/Z87BNwUHCMEfdxSUaRIIGulTz1qGR2qL2q1fGTgXqGZx9bTL6BFQ/nT6XTtwE
	KnNOMvw==
X-Google-Smtp-Source: 
 AGHT+IFy5SbbOufUy/PtgBUt0Mn2h32RxYk6OQCJyJWhipcb0m0KlPl6vMlWDiXkxRkGrv3OlXeODQ==
X-Received: by 2002:a17:906:4154:b0:a68:e268:fa30 with SMTP id
 a640c23a62f3a-a6c7651ad4emr200470666b.38.1717683899900;
        Thu, 06 Jun 2024 07:24:59 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c80582110sm104953466b.32.2024.06.06.07.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:24:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] mfd: arizona: Simplify with spi_get_device_match_data()
Date: Thu,  6 Jun 2024 16:24:56 +0200
Message-ID: <20240606142457.130553-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y2BU6OUF6UW5S4MBKKRJPQOZZW7IUAK2
X-Message-ID-Hash: Y2BU6OUF6UW5S4MBKKRJPQOZZW7IUAK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2BU6OUF6UW5S4MBKKRJPQOZZW7IUAK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use spi_get_device_match_data() helper to simplify a bit the driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/arizona-spi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index de5d894ac04a..eaa2b2bc5dd0 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -190,19 +190,12 @@ static int arizona_spi_acpi_probe(struct arizona *arizona)
 
 static int arizona_spi_probe(struct spi_device *spi)
 {
-	const struct spi_device_id *id = spi_get_device_id(spi);
-	const void *match_data;
 	struct arizona *arizona;
 	const struct regmap_config *regmap_config = NULL;
 	unsigned long type = 0;
 	int ret;
 
-	match_data = device_get_match_data(&spi->dev);
-	if (match_data)
-		type = (unsigned long)match_data;
-	else if (id)
-		type = id->driver_data;
-
+	type = (unsigned long)spi_get_device_match_data(spi);
 	switch (type) {
 	case WM5102:
 		if (IS_ENABLED(CONFIG_MFD_WM5102))
-- 
2.43.0

