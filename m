Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1478172B934
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 09:52:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5133E3E8;
	Mon, 12 Jun 2023 09:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5133E3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686556320;
	bh=OuC25CWz8pwZs7npKpsBh9uXoUN1RR9qf2qA9r28WDc=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qM/+LoJTuc/qzUHJFokG4tu0MITEIIQz7/0Ge8Z7K7eOpH8QvZhYmmQmkkilU+6n5
	 /MR4iZeAbioBdO1HsYFdRhtidgoSw1GjRBaae+Mc4poXNyX3K42gCQC6kQ0u4sOvGb
	 n9wbdyZPus8+Wv59023Og8D+7xNGbT9rzARQ0JEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C895BF80301; Mon, 12 Jun 2023 09:51:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D1AF80132;
	Mon, 12 Jun 2023 09:51:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2DA5F80149; Mon, 12 Jun 2023 09:50:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E163F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 09:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E163F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=FX/kwKF6
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5169f920a9dso8293613a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686556192; x=1689148192;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiNwxZSyBPegCx401SzyDgA+wN3/RcP6HRT81z/+r4o=;
        b=FX/kwKF6JaEgvdnJh3mK2qRGeSmvTrYR+q8MhiLnJ6dM1xe2AczXNbbgeiYCKtoPfd
         4p7x08U9jzybVjE87rslbWTBa33lPLdYkfqauLqjBhAv3H7CdiafcPCJz6MbCf1CEpWZ
         4H8DfyXDN0RGEqiJg2/dCR4FMAIKOc/1gIkSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686556192; x=1689148192;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiNwxZSyBPegCx401SzyDgA+wN3/RcP6HRT81z/+r4o=;
        b=PrpJJHsx97PXDRBb9PhOfTekhTeL/I2hWX21bwRW7hbtQ3DC4pRktdIBymdytTFkAL
         6narEzXygPs/h+C5988Ggf9griUk5eLULNA6Z23LofIF7wo8a2MyK8kTGOYNEEY0w9H2
         OreebtWboqAygzHB8lvL7tlTffa6mdAGsIQyA8r+ysoDyFdbgHeNrzNIUVmuQdTb20gV
         5/Bd7PNwep08Q1F1dkSS4FfUtzGXls/8JEnNa1TnXYgkjveTUwhCLwHdjP1LX/UZctsL
         ehMKaeCQEZUOh7j9KfxSjEdNVM8ukRNXPoPOUD3sTM+PGUNeMlagmkQ75WFAQy55Proz
         hH4A==
X-Gm-Message-State: AC+VfDx6JLdQdYBMaMKz/V40jIgFw/jjJ3zoVl6T2AbuTfL+bC2FoFkv
	qVxqz8aGAiJTnu7BwZbFp2bKeA==
X-Google-Smtp-Source: 
 ACHHUZ7wYIxRJz1B51+uURhyLq63dbIuiP+uxJTZU5ktVT7Jne87WJS+Nk6Q2CQ9ldJQhbVIZzl5mA==
X-Received: by 2002:a05:6402:51ca:b0:514:b3b5:59b2 with SMTP id
 r10-20020a05640251ca00b00514b3b559b2mr4436183edd.20.1686556192302;
        Mon, 12 Jun 2023 00:49:52 -0700 (PDT)
Received: from alco.roam.corp.google.com
 ([2620:0:1059:10:82e9:e3cf:d6f0:4c6a])
        by smtp.gmail.com with ESMTPSA id
 d16-20020a056402001000b0051849ba515esm263862edu.13.2023.06.12.00.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:49:51 -0700 (PDT)
From: Ricardo Ribalda Delgado <ribalda@chromium.org>
Date: Mon, 12 Jun 2023 09:49:32 +0200
Subject: [PATCH] ASoC: mediatek: mt8173: Fix error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-mt8173-fixup-v1-1-81f5c90316d1@chromium.org>
X-B4-Tracking: v=1; b=H4sIAAvOhmQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDM0Mj3dwSC0NzY920zIrSAt2kZDMDo0RLs5SkxBQloJakxOJU3aSixLz
 kDJAmZLUg6YKiVCAbbFt0bG0tAMC7S3x9AAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@kernel.org,
 Ricardo Ribalda Delgado <ribalda@chromium.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=OuC25CWz8pwZs7npKpsBh9uXoUN1RR9qf2qA9r28WDc=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkhs4XSxS0KQpi+92gEy/ougw/iTjpOi7Gic741
 gQyUkRmCT+JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZIbOFwAKCRDRN9E+zzrE
 iK+iEACfzcTBC+PrEelDF+9y0ES8gjJQVRUdBZHk+bwW3eokAJmAyyTVDPC5SZ0ZOmxGoHCFSMV
 7J+IVJSmKK0qHHoVUOYCZ0+ekQQuFcm0eYOnHpdzG6FHL8IVxbH3+bSZl3/3nHdTumROHah6kIt
 D5URELYwXnhBNTkvVHRrFcMQ+rKpUGe6AAYC3PhDl69sVgb0T5LLIooG+VLm2rr/S4/xDNiRm7P
 4fTTphvV+62Hirp6cBA2axvylc2es41HesCt2/UeP944/KBX+RYaQa8ANhE+TDFnKjDH3CqWUKg
 8idziCiffEA2SCb4VMPzHSllDfaABuB5+Us81V2yog0ckVgtaI4o/l/Mc4rrHvnlHuhfJD6dJ4M
 Tkf1xYg1P/o84l3Cd/xUDxFHNVe6uQ57IzuhjL41djFBnNsGjPimegnrYWMhGSp45VMyoOynQSR
 d8RezAvyxWaw5ww9VP0MLz4qeFbHiMqzhL2f45/LqA0pTuowsMJKzAOnLKoRpC2yaEKzVUzTZPH
 fqbLYsY2yc9q34C9rVizRKGBepLvxcYaPyxx21d9NcukM7D4zVLDMANr+KZyzosZSjARG6rEdfB
 ITz3u997JgNJ/wB7XHstSWUEzEKpbEIGK1pItIitCnAsZCRxjv5N5FSPZGhpZK+8bLoEsxa4jSS
 Daxlli+iqR1XuCA==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Message-ID-Hash: 2WYL3JAVWBDZQPXJCOAXMJWKECVHHF44
X-Message-ID-Hash: 2WYL3JAVWBDZQPXJCOAXMJWKECVHHF44
X-MailFrom: ribalda@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WYL3JAVWBDZQPXJCOAXMJWKECVHHF44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After reordering the irq probe, the error path was not properly done.
Lets fix it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: stable@kernel.org
Fixes: 4cbb264d4e91 ("ASoC: mediatek: mt8173: Enable IRQ when pdata is ready")
Signed-off-by: Ricardo Ribalda Delgado <ribalda@chromium.org>
---
4cbb264d4e91 ("ASoC: mediatek: mt8173: Enable IRQ when pdata is ready")
introduced a bug on the probe error path.

Lets fix it.
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index f93c2ec8beb7..f2fdcc74069a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1070,6 +1070,10 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = &pdev->dev;
 
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id <= 0)
+		return irq_id < 0 ? irq_id : -ENXIO;
+
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
@@ -1175,14 +1179,11 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_components;
 
-	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0)
-		return irq_id < 0 ? irq_id : -ENXIO;
 	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
 	if (ret) {
 		dev_err(afe->dev, "could not request_irq\n");
-		goto err_pm_disable;
+		goto err_cleanup_components;
 	}
 
 	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");

---
base-commit: 858fd168a95c5b9669aac8db6c14a9aeab446375
change-id: 20230612-mt8173-fixup-bc602a96dbad

Best regards,
-- 
Ricardo Ribalda Delgado <ribalda@chromium.org>

