Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B95DC94C4E7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F0CB839;
	Thu,  8 Aug 2024 20:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F0CB839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723143162;
	bh=emYBtpRPqSizaSaPPZzaFaP1U6nTwkKV9NMyTaOPuoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f5Sw/3E5n0o3uabndC9nSlG9cNY/TB+WnsTsdZQMxNLx+m2xzw8cIc8jtqG6Cdyme
	 +X6ciOxaQO7JTyvzw6vPSU/n4IVF/OJrhe9Q0MRicfKSYsYaMzNXliiVLDb7HAxjGE
	 3zAFjpC/vm+dkNArvnTd0sKUKPSsuo5eU5L6Wwxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E022AF805D9; Thu,  8 Aug 2024 20:51:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9301FF805D9;
	Thu,  8 Aug 2024 20:51:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5068FF800B0; Thu,  8 Aug 2024 20:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7284F800B0
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 20:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7284F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YUpdU+Ae
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2cdae2bc04dso234915a91.0
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Aug 2024 11:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723143029; x=1723747829;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMVFN+cFz1HfM9dI+IPA2YENRLXpyhEGw4y8eCO6VUc=;
        b=YUpdU+Aeq/IU85Xp6ihXWSeCYE9rqd7tlwcO1FG3vRczEhASb8BsNPSNhLViaolWSW
         EHEzzjZWDyr8MgIctgUVYlEg0bKaiCZX332DTS4PLJfmW9wapvvcWNZhXIAydMY32My6
         Ngv/YqwadrRaikvrkfOm9zwXN7z3luwUDyHBMyU1nbbY/JvXiV3WQ23Xz2N+zb/TnDRE
         ImeiKgXD+vZkLuZSSO6bciX3xrjwGKOW5feTtfk6yuykA/uXITPWiFvSxIUQLJ7VcmEo
         jZTkf+PeLR2z6eIHnuCOnxbu00YzVVs+Om9hAasx5np9j8vaQwJj2BJ3S1hazdr/Edf0
         9hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143029; x=1723747829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMVFN+cFz1HfM9dI+IPA2YENRLXpyhEGw4y8eCO6VUc=;
        b=oOSmUQCj74AmkZsraJuqMTdSsiC0NjwwBYJA18tas7TGLtovCF2RyRZyDknerNLzmS
         L1IBwIgGzS7ztiAkN5MmgTTH+0yHz38TfbaSiJ2w29wnyrVxxs9zpo9oYNe1npdWM3JW
         /dNAqe3fc8Ep3vMAQ6GjYdwLXtgJAH9X6J2PrU7cRj8hdraGoga1xJedjxPAu8hue564
         7SGhm3l8SaujWlctLnRpAlzwsa1e4Q+poaSet7TakmBQ+8rGxEmPnlLvHCdJ2dDW2/ek
         TwhpUzeGqXsspcfmQPUrq8L6Z6KSDRLkpS4jCulX1nNvBO7umqEOIX8PPM/9EWgvjWVU
         /ltQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEQ+jau/zvPKRzBjZTRPnJTrqkOgye8K0vOWjipBKodY6vQr9DIqaMztMOG2/s/aVHnR6Mb9SlbbHy24DHpRF6wmkRIfsHWlTDWAY=
X-Gm-Message-State: AOJu0Ywb1rUlIvdZ6O/IYblW2HinvmA6/XfJN9M63XWQp/kxEIjm0FNI
	Js/zfbA6754/YADgNyMZMcsJWMyLAkPwLIfXy6MTSMDDPLemIWzz
X-Google-Smtp-Source: 
 AGHT+IECDrkhoSOjiwwNBZ3Axb5J+dVEog2bAzd5IqC6ESK0B4LrwPe/Rq1izyRDGBam/uVkoWZvHA==
X-Received: by 2002:a05:6a21:99a0:b0:1c4:92fc:7c79 with SMTP id
 adf61e73a8af0-1c6fcf8565amr2124835637.5.1723143029150;
        Thu, 08 Aug 2024 11:50:29 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e4acesm1466354b3a.141.2024.08.08.11.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:50:28 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/7] ASoC: fsl_mqs: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Thu,  8 Aug 2024 15:49:39 -0300
Message-Id: <20240808184944.267686-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808184944.267686-1-festevam@gmail.com>
References: <20240808184944.267686-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7VYXZJBBWNIHCBT5WSHE4XIOIMUVGXRD
X-Message-ID-Hash: 7VYXZJBBWNIHCBT5WSHE4XIOIMUVGXRD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VYXZJBBWNIHCBT5WSHE4XIOIMUVGXRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS()/SET SYSTEM_SLEEP_PM_OPS() with their modern
RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() alternatives.

The combined usage of pm_ptr() and RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the CONFIG_PM ifdefery from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/fsl/fsl_mqs.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index c95b84a54dc4..df160834c81b 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -265,7 +265,6 @@ static void fsl_mqs_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM
 static int fsl_mqs_runtime_resume(struct device *dev)
 {
 	struct fsl_mqs *mqs_priv = dev_get_drvdata(dev);
@@ -299,14 +298,10 @@ static int fsl_mqs_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops fsl_mqs_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_mqs_runtime_suspend,
-			   fsl_mqs_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(fsl_mqs_runtime_suspend, fsl_mqs_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx8qm_data = {
@@ -390,7 +385,7 @@ static struct platform_driver fsl_mqs_driver = {
 	.driver		= {
 		.name	= "fsl-mqs",
 		.of_match_table = fsl_mqs_dt_ids,
-		.pm = &fsl_mqs_pm_ops,
+		.pm = pm_ptr(&fsl_mqs_pm_ops),
 	},
 };
 
-- 
2.34.1

