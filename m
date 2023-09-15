Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C6C7A1A83
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 11:27:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE78C846;
	Fri, 15 Sep 2023 11:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE78C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694770058;
	bh=Mbdo2cTvdaJ6xGvWgvPEo1XZtZy4diDnCu/ssFEvrWI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=j9OgXZLw08tp9J/c7Qepa+B3dL81hm/oRqeXB7Z3pGnCEiyaIPAO8Lf2nFmvxHfhw
	 thAnGWVcduZSJaMxwwcsdI2HfVaXlteSHxS/DjTnVN8iOwQOvcgyBK5/3ZacdMsl52
	 uFh8TDL6vDv0aVq20k0bomueysn3BMXu5t5bb23E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 459B3F80246; Fri, 15 Sep 2023 11:26:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1E61F80246;
	Fri, 15 Sep 2023 11:26:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26DF5F80425; Fri, 15 Sep 2023 11:26:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB33EF80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 11:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB33EF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kBqAteQJ
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31c7912416bso1729866f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Sep 2023 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694770001; x=1695374801;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6AkTjApExULwisbP0f8MYFXveFddh4jpBpFZba8uP0=;
        b=kBqAteQJwmcc1gvmZlwo47vQ5cJT1jlDYq3jz2Rhl6R7K811XunOGO0+Gm5pIjBdN5
         dQCBh60ymnlCVcMhX2T6QQy8707klkq46jvqVzCuydUW7qEdhU5YSR1aVbOqdTipP9F0
         /KdtfZpJRoSmdmFjpPa7tMZJ/DbkidZ2E+HVWcbL3MOBWd2+I9542JLOLdvhv2+kXDTc
         GAncfJe75o6iEi7HYUu4gyinjLevWIFcYpQW4qdLXlys4mEfuKOm4h/xA8x8xoIq/OnR
         ng7aYoUJElN65Hd6dgQk0vPWCu5NsSNblbjhQT1mV0rhvwLITB0E42qgddP5QMEgiUlK
         32CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694770001; x=1695374801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6AkTjApExULwisbP0f8MYFXveFddh4jpBpFZba8uP0=;
        b=AdTZ0vH+TPHxZh+u1C7EBBi6DOnReWuCy21fo7+yrsMyUu3Y15oLrm4UbzTeKUQD4M
         j8cLtWkZrNQNuE5+4oparGOOAnGNnpfuvZQ9j6b1gRWcr4rGyt+Rw4HlwW91284TQ2Gr
         rWQ+aZbnFxPkXpAeyrrIExfzto1779kl9WcOk5bgwPajZI31bGSL6Om8arNv9WQs4png
         1aPKNclkKJANewRRe7NnbZFE2mFEMl060SCmFhPGkqNCrgRvLvheeQuNRcci8+ix2Ymt
         gFQTE1Nb3F52zXdHyMAEsyeFuO3M3QmqwJZFR0KfkDJwEmo6wgisDOn+jaY3J1QWeKLN
         DBXg==
X-Gm-Message-State: AOJu0Yx7iF6jP7rq6bGLCwjCHTSaIY3nD4EZc606ajOSUGRhgQFKN/Fu
	paRVNSD35MjW80vhIXvmNsA=
X-Google-Smtp-Source: 
 AGHT+IGO7dNEsmwqe62k1eEbBiRKgNNo1d4fDvsoEEl8b2q/cCALAmnkXq8JIS+ehHW+Ftj+DVntWg==
X-Received: by 2002:adf:ecc7:0:b0:31f:a717:f1cf with SMTP id
 s7-20020adfecc7000000b0031fa717f1cfmr893102wro.56.1694770000481;
        Fri, 15 Sep 2023 02:26:40 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 p20-20020a7bcc94000000b003feea62440bsm4109371wma.43.2023.09.15.02.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 02:26:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: cs42l43: make const array controls static
Date: Fri, 15 Sep 2023 10:26:39 +0100
Message-Id: <20230915092639.31074-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UXHF6P6F3VETB6WTVAAVV47SGX7TB64X
X-Message-ID-Hash: UXHF6P6F3VETB6WTVAAVV47SGX7TB64X
X-MailFrom: colin.i.king@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXHF6P6F3VETB6WTVAAVV47SGX7TB64X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Don't populate the const array controls on the stack, instead make it
static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 1a95c370fc4c..4e3bc15f1b25 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -162,7 +162,7 @@ CS42L43_IRQ_COMPLETE(load_detect)
 static irqreturn_t cs42l43_mic_shutter(int irq, void *data)
 {
 	struct cs42l43_codec *priv = data;
-	const char * const controls[] = {
+	static const char * const controls[] = {
 		"Decimator 1 Switch",
 		"Decimator 2 Switch",
 		"Decimator 3 Switch",
-- 
2.39.2

