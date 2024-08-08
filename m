Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0E994C4EB
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:53:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B8FB76;
	Thu,  8 Aug 2024 20:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B8FB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723143208;
	bh=MhEsQ1YhBS7ENCam3SZu+v3ER3kvrJKDxuJz+ioi4mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uq0gDhvb7gkVGUTROGXwmk5L3pIh3MBDEkwxbZlTSMSkVg7zfj9vTZ7j8xDG5O8bi
	 fGmsiq9AwpQ+SZT1m5xOfLkpAf2qq1c1+XiE007+T78Rm98acRXkzzdhtR1XPTlEX+
	 4d4B50Au9cKlVoAS5VU3fnsCkKY/Z9yg/yg1sTOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABCAEF80236; Thu,  8 Aug 2024 20:52:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71009F80638;
	Thu,  8 Aug 2024 20:52:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE73BF802DB; Thu,  8 Aug 2024 20:50:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B1DDF80448
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 20:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B1DDF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TM9S7SMV
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2cb67992a5cso233339a91.1
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Aug 2024 11:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723143036; x=1723747836;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4pHrt2xUkfCwAqwX3B5Nmo1NO5wRbMR//VAm7OLTR4=;
        b=TM9S7SMV548/pxvDfZpayeLfEB72qZRMi61w3fVUZB1j3RpLb0PXIVHJ7LvYhHh+Rk
         qSpiTEHT9/hWPkuO+r4DUN7yUHsAWvU7uGlPDxXANRHM0eSXVNhBU++Y8EiCvhWlI76c
         7NWaEJ/nGODm9gzcS/cIR/8H6OUwWq4cynUre7GlSAQb78YA9g519PJHZUqqAdaaIGKg
         AHWUxxyHZbrroN38+2xWrkdODre09AP/qonAguOcaxWyVU3E4b+8mt3+tvgJyA4p33hx
         N3ejTSnV7yRGFs9MVpi917OclErLK8s5LPxgyXnA5AGKtzaWnSJ4icWy6VD+1lvibcUm
         5+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143036; x=1723747836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4pHrt2xUkfCwAqwX3B5Nmo1NO5wRbMR//VAm7OLTR4=;
        b=NG/X5mkC/ans/6zQpSd4oefdW+EIbz5aEZ/jZEkMrlQyDl4B+LglJOVywNqjjtdFeT
         FVg5sPsGEIvSu5DcsesHXYaI9Kn1gErQIc/9XCG8Y7zlUde7N4ACwcOBqbSQhHZtD5W9
         A1z7uvBCOuZ07VmvgQgm++F4d0zPF+lliyTQlJto6UNb5OTKMytaxIGPxKEqh7nGU97y
         TYvxLWB8UbBWu1HScWvk/iDBkhCmyEBduzlhRjco189mls2VSmerRVnhCOzQYD23VE0b
         FDnOykvW3MvGF1WvJZRYdWBJ2OjOVTvfw0khQPZ1cFSSR8tQINhKl0xv/BXzidNudytd
         2kOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB3v+k20lM9cM0qfZA3BuCqV+5D6XGbZmON8m2yC2B5/BZN3SGZtJZcATk80pjzAjHDVVl2qeyN+oHTeK2Duz5YFxSIqW+4n/3gkQ=
X-Gm-Message-State: AOJu0Yxepn1IIwTZ2uDhYR//EvniujfSZNJSBJ0JDh1HXjseoiYnNK3r
	gceXhLu3C7u1ZGCSinXPCrLWgUI981cJid8KNZ5m1Retu0xt+gTg
X-Google-Smtp-Source: 
 AGHT+IHVBpJ7JLbHxySN4W4Pw59z+IlKERxq1z4tvfyZQyyHxOHfggs8RpFx3c9G+SzwYZjoyhgcEQ==
X-Received: by 2002:a05:6a20:4325:b0:1c4:ccef:cd6e with SMTP id
 adf61e73a8af0-1c6fd040521mr2000385637.8.1723143035986;
        Thu, 08 Aug 2024 11:50:35 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e4acesm1466354b3a.141.2024.08.08.11.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:50:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 5/7] ASoC: fsl_ssi: Switch to SYSTEM_SLEEP_PM_OPS
Date: Thu,  8 Aug 2024 15:49:42 -0300
Message-Id: <20240808184944.267686-5-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808184944.267686-1-festevam@gmail.com>
References: <20240808184944.267686-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V75ECC4P74CGLHMLBHLE4TANX3C7BYRP
X-Message-ID-Hash: V75ECC4P74CGLHMLBHLE4TANX3C7BYRP
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V75ECC4P74CGLHMLBHLE4TANX3C7BYRP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

Replace SET_SYSTEM_SLEEP_PM_OPS() with its modern SYSTEM_SLEEP_PM_OPS()
alternative.

The combined usage of pm_sleep_ptr() and SYSTEM_SLEEP_PM_OPS() allows
the compiler to evaluate if the suspend/resume() functions are used at
build time or are simply dead code.

This allows removing the CONFIG_PM_SLEEP ifdefery from the
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/fsl/fsl_ssi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 4ca3a16f7ac0..c4c1d9c44056 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1693,7 +1693,6 @@ static void fsl_ssi_remove(struct platform_device *pdev)
 	}
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int fsl_ssi_suspend(struct device *dev)
 {
 	struct fsl_ssi *ssi = dev_get_drvdata(dev);
@@ -1723,17 +1722,16 @@ static int fsl_ssi_resume(struct device *dev)
 
 	return regcache_sync(regs);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops fsl_ssi_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(fsl_ssi_suspend, fsl_ssi_resume)
+	SYSTEM_SLEEP_PM_OPS(fsl_ssi_suspend, fsl_ssi_resume)
 };
 
 static struct platform_driver fsl_ssi_driver = {
 	.driver = {
 		.name = "fsl-ssi-dai",
 		.of_match_table = fsl_ssi_ids,
-		.pm = &fsl_ssi_pm,
+		.pm = pm_sleep_ptr(&fsl_ssi_pm),
 	},
 	.probe = fsl_ssi_probe,
 	.remove_new = fsl_ssi_remove,
-- 
2.34.1

