Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7F94C4E9
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:53:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E0B7E80;
	Thu,  8 Aug 2024 20:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E0B7E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723143175;
	bh=YT5DQ0+/e7yx74XohDZVPwTDptrdlTLnHK8ziXULtxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ju5bcdPoVAjCvVT3O+Jv2hxD8ISQOqpc1Byx+//m1IpPi2MBnuIO/YYyzaRo5xM0b
	 K4BAF0qz3Y2UMwHMrmy6CmMLqPm1a66feE/AHmazwz1zE6l5GZupMAnvxHCm/6GsZw
	 zWenW/jiIulNMxpkivxC1j9H7tvPEzeWV5mW6Lhc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A766F805FB; Thu,  8 Aug 2024 20:51:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51B4EF805EF;
	Thu,  8 Aug 2024 20:51:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FA94F8047C; Thu,  8 Aug 2024 20:50:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00C16F802DB
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 20:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00C16F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DY7Dx+Ub
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-70d2cd07869so110863b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Aug 2024 11:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723143034; x=1723747834;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAYNl1QP07O60/hQ1fZUEjMYLs8NATGmFAsys6ANyRo=;
        b=DY7Dx+UbtV3NZL708ktJXSih94thySpIGFJUxDVW5CZgx2bbKn2acoP9zxz7IvPIr9
         LsnSYPQ8g7NxRsNJYE1Umjt5Tmwh9A9ZHlCn0qCzTpYNqSrRjc+hG+PtgOG9zirPt9hc
         G26R3+YlodQJ3bAYGGu+YfcpY/JtzJrp4FTuxNFP76y7ImQLXguj8a4loNH0K2Nuen6l
         MPLjbsY7R3OoakXR+DNqRrCyK3vs4MPK+9vlWokmMg9mrHXSWHBIG9pxiJMdGWL5EEmP
         9AGW+vIS8C5G32lHO5eO+avNho111MudHsYIfR0wfSPAcfWutugUheCUjlwu6QQQhPBM
         /INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143034; x=1723747834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAYNl1QP07O60/hQ1fZUEjMYLs8NATGmFAsys6ANyRo=;
        b=w1ZDJpPNPqUlIaRSILxRefh0gG++PCP5CTBU9ytOKjDn1+RmNqby8kyzrjZsN1R5IN
         jjX94U2mdPYGQpGu9g8opZIxV4I7RgVTOhu/6Z7vQW3kX+o/bia/E1hSGMxFKHZVkJcq
         zUtZVgDN7Dkp2mzBdDtBpc2Oxn73TVO55dt60fmPzHAwIbTmA9O0e+Zva1E8S8ae54TK
         us4YRtrgBBH7M5scoZaYvVOXQnR5QIGgk1uQqdxTjbm4oyE2gNjyEdmDBkH9s3kQtB0C
         sAWzWMb4JnqlK/qdZQSslAZkA9lZGGD9B3O4UpifoefRz73eymGEtahUoErz6nwpoHJt
         4fdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrJd/C/zqhTUAtjKUk9ld1FsYtUXM/pcsIF7x6RrZgt/wrPLyxXgdy8hOp0RtT7zPvdQTKvVUfD1KU@alsa-project.org
X-Gm-Message-State: AOJu0YzkL0iQ/zlpu12PG0yVymi+IZPF5j7nmrcEjXY/xKpmcfqyhofa
	62fgEUawWiMvR2qPB0s3B9UbRBvLeygs4VScz9lpKcztHARuvh/j
X-Google-Smtp-Source: 
 AGHT+IHJIqEGKclHlOo1+rDoERCauD/j0paHC49vv/k4K6HAjTuLx6t0loSWmMiikFyjXXlwHIsUaQ==
X-Received: by 2002:a05:6a00:1151:b0:710:5d11:ec2e with SMTP id
 d2e1a72fcca58-710cab62135mr2080404b3a.0.1723143033686;
        Thu, 08 Aug 2024 11:50:33 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e4acesm1466354b3a.141.2024.08.08.11.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:50:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 4/7] ASoC: fsl_spdif: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Thu,  8 Aug 2024 15:49:41 -0300
Message-Id: <20240808184944.267686-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808184944.267686-1-festevam@gmail.com>
References: <20240808184944.267686-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: COODNZQHHRIQHZ35YF35N4XJ7ZDI4KA7
X-Message-ID-Hash: COODNZQHHRIQHZ35YF35N4XJ7ZDI4KA7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/COODNZQHHRIQHZ35YF35N4XJ7ZDI4KA7/>
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
 sound/soc/fsl/fsl_spdif.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index a63121c888e0..eace399cb064 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1667,7 +1667,6 @@ static void fsl_spdif_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM
 static int fsl_spdif_runtime_suspend(struct device *dev)
 {
 	struct fsl_spdif_priv *spdif_priv = dev_get_drvdata(dev);
@@ -1739,13 +1738,11 @@ static int fsl_spdif_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_spdif_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(fsl_spdif_runtime_suspend, fsl_spdif_runtime_resume,
-			   NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(fsl_spdif_runtime_suspend, fsl_spdif_runtime_resume,
+		       NULL)
 };
 
 static const struct of_device_id fsl_spdif_dt_ids[] = {
@@ -1763,7 +1760,7 @@ static struct platform_driver fsl_spdif_driver = {
 	.driver = {
 		.name = "fsl-spdif-dai",
 		.of_match_table = fsl_spdif_dt_ids,
-		.pm = &fsl_spdif_pm,
+		.pm = pm_ptr(&fsl_spdif_pm),
 	},
 	.probe = fsl_spdif_probe,
 	.remove_new = fsl_spdif_remove,
-- 
2.34.1

