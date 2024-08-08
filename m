Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3F94C4E6
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C1AFB71;
	Thu,  8 Aug 2024 20:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C1AFB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723143143;
	bh=DaTT56HwWTXhqRQOruorS7NdSThzxpJeGMYGKESqA14=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OfpP9+TFACp7V1DY3A3xC6PZtpuzkiMPt+qsxPsSl8SC5bZ1/IV9ece2c3QmeLllI
	 SOS+oHprZhuYsp/PXVU/GXJVtbfpdW1oYDyo09p0Qx9zfVH3f8jqVpXUGggJP6BOpt
	 RShVOAF7a+FenSDIx5se0bXhggCdQ0CVdOmtFYvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88DB2F805BD; Thu,  8 Aug 2024 20:51:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA93F805AF;
	Thu,  8 Aug 2024 20:51:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FB6BF8047C; Thu,  8 Aug 2024 20:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68969F80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 20:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68969F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YRE5mkPg
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1fc53171e56so708735ad.3
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Aug 2024 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723143027; x=1723747827;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wG1tqS3eErBEKRyG5e7foes5NY/LKwy15yIXBQJIJ5I=;
        b=YRE5mkPgj5o/UOheAf3leSWRode4VA+V0qkGhV4hkXjDjYiLUOUoEouG5+YFmatV1j
         +Mvf5lrrahkun2pvjKmNyQtmhRhnV1tHYEMcjfBhjrs9K6NqxwcQmt5OXb0wi7mqVtkg
         BRgv0LpkdgHxT+s0FQFcCbyFJRwpFC3NJctY9D9WD+SVWRAMmYZM4u0tX90fLN0t8CD9
         39yzHb36wzHVUb+Wa0EmsiXx/xTkB6Y4EFoMfSxrdKz8x4qqVeBJKxC8Dxvp/T9E86JU
         4JWT9/rN8sQz4dPBI/CHJQ5HcbMQJe+H/yXF2ccWInYpDlHQppi+uHraac1nYWvqlAvw
         T+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143027; x=1723747827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wG1tqS3eErBEKRyG5e7foes5NY/LKwy15yIXBQJIJ5I=;
        b=lVgn05lkZm61O5j15Jcf00wjbML1/KehIOkTCIqp/qotYJ4S50n2YgYdlkvXXV0mhC
         lulCfPu9ZCHXT1Q7Z2kXocdqwWUqtrvFDpZ9DeQ/XZO3SiZrM3f2uPhlgpQIr5vNF78x
         XsC+GFsKqga85dHIf0a5+14bz9+9GCR92cpIMWDrgCU/oBt5zWSLM4ToqHdCR7U3rT9t
         OMk2TxmLLVkAnPqH2kSHjhTRtLSa5G9Ayre/+VHRb81J0GBFrzxbWO/MVMSyAXifdYFz
         rBvqPJrOGW0iPhVgQHN9/qL5TftQosecmg8BuGOPK7jm7F4cOfG1W8gSqqR1fQDunD8z
         mejw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8iDYBc+a8qZSyAD/Ph01NZU2tPKs1k5NOYpLbTlbQoxLVdKgF3lBWH6xWH5GLnExIp9sYY+yXYTgaEamlC+blkm1/Xj/1g88xV14=
X-Gm-Message-State: AOJu0YyilUjBehL3WVNmoruxr6wQya6tEUDlnyMOrTe7qM5SrrQd610C
	srXJ9hKQzlMBgV+HzTnzAbh3V61MiOJDSQi/lvZkOqYCR4f9kHjC
X-Google-Smtp-Source: 
 AGHT+IErgJoqGZZOyiPlyr6fP443pbB4bYS3lKSH/Ix5z3YbKi2bSdPWbx3yesrbIs+1ELgQjYkvXQ==
X-Received: by 2002:a05:6a21:6d94:b0:1c4:c007:51b7 with SMTP id
 adf61e73a8af0-1c6fcfac527mr1932361637.6.1723143026786;
        Thu, 08 Aug 2024 11:50:26 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e4acesm1466354b3a.141.2024.08.08.11.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:50:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/7] ASoC: fsl_audmix: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Thu,  8 Aug 2024 15:49:38 -0300
Message-Id: <20240808184944.267686-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YV7NJ7RWLK6RDL2IK62PUVDPS5J2XSUM
X-Message-ID-Hash: YV7NJ7RWLK6RDL2IK62PUVDPS5J2XSUM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YV7NJ7RWLK6RDL2IK62PUVDPS5J2XSUM/>
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
 sound/soc/fsl/fsl_audmix.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 1671a3037c60..f3a24758aedb 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -512,7 +512,6 @@ static void fsl_audmix_remove(struct platform_device *pdev)
 		platform_device_unregister(priv->pdev);
 }
 
-#ifdef CONFIG_PM
 static int fsl_audmix_runtime_resume(struct device *dev)
 {
 	struct fsl_audmix *priv = dev_get_drvdata(dev);
@@ -540,14 +539,11 @@ static int fsl_audmix_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_audmix_pm = {
-	SET_RUNTIME_PM_OPS(fsl_audmix_runtime_suspend,
-			   fsl_audmix_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(fsl_audmix_runtime_suspend, fsl_audmix_runtime_resume,
+		       NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver fsl_audmix_driver = {
@@ -556,7 +552,7 @@ static struct platform_driver fsl_audmix_driver = {
 	.driver = {
 		.name = "fsl-audmix",
 		.of_match_table = fsl_audmix_ids,
-		.pm = &fsl_audmix_pm,
+		.pm = pm_ptr(&fsl_audmix_pm),
 	},
 };
 module_platform_driver(fsl_audmix_driver);
-- 
2.34.1

