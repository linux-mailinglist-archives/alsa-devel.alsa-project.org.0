Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD78BEAB8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 19:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C68825;
	Tue,  7 May 2024 19:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C68825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715103896;
	bh=zjGSH+EcpOfb/UAdWWJ47Gqrwy8RbEezn3WyNtlI72s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kgwjIB11vJA6m2EiIg2BK6lZ+v1U6dBe4viqNfSmgu7fqWjAo//OabelBm0dPFSqt
	 tFV4IHs5I9uKP7Bwnhp9PdS/lOzCT5oQ5Yeli46cL2E81BHvnnt8kH1n9vZ7kgaxQA
	 6xqtzaYmvt1GoxE9bDMzYSUDRpSqO8ZAxmYPL8Fk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EA85F805D8; Tue,  7 May 2024 19:44:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F6FAF805C8;
	Tue,  7 May 2024 19:44:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F057F804E7; Tue,  7 May 2024 19:38:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD6EAF8049C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 19:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD6EAF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=coucd9ir
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5cdbc42f5efso113258a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 10:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715103479; x=1715708279;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FY7R4n6Kr6UZBpvxXkdAK0SRBI4lJ/NUXcFNrRCnHj8=;
        b=coucd9irkDT55bRcW1mpOuXNEo+l8FFvwhGj78ar46LsnPDjmq2zcghG2LB18Qcs1s
         U+7a7z7/9ZNb54K38RNVhFkMG6JkT2xMLHMN3blgQxaK0kco4wlIB2Djy5kNGJFehewW
         u9DXPKwqfdhpue2A5TObQV+EWl0QXXQ5P6KxxZIGqG2lUkgty7WuKjOlqUWeS7Nq0heE
         si7x+Bs+EFdN7Jxl1rqsJidwr+64Wq8r9ak4C/kwU3ocpOyWX653Po7yNyVOEJ71jPm7
         V8AOW/m8VJtMOxK15acjekpwog9/Zk5mlHslHOyDDvi9sJt73OYgvjFrJ4g/jAK2oGV0
         bnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715103479; x=1715708279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FY7R4n6Kr6UZBpvxXkdAK0SRBI4lJ/NUXcFNrRCnHj8=;
        b=JEnGV15moYYNg1DrRpLvE38q0syYa5NLX5yFjBSyg7Ub6i9S13I1384yE20JAKqPgB
         5vD7EReOemlbso60/ipzznyDLNLuZa0ecL5gch37kexVEDHMRPQ8TeNuwWrJ/HdslhgI
         ndsKyABXScEeQnxNqjhsJJNcS0wu2ana3NdBGBjTUpUsZl4++aSWJqDFMmPegD8Mny4l
         nnl2ojBsKtyBsHIDrCalI2sQE/Ll0sK6ACx1q0fW2+tMWNkqTyPbuAi3JCHf1PPiTP0d
         F8T7QPU+jJh2zuyLqEIDHptHueKHsU9J3T0T+vE6v/XRLS/9ypSsi9vgh/SUgfjjbKT0
         YJwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNED3CbagXJs2bKhtFhAAkl+oMM4bcaliaQKGKrOZzV64MjO5oiO8YYQZRuxAsor4vDLBCHMRgcSywpbMVITuWuZCMuZ8EIsDIVLg=
X-Gm-Message-State: AOJu0YwAHF8Fsk6knlqJ0HlH8vrVSN0duwJZ+I6kpXoiKs2sIlDnTHBh
	iHHojBI+KvmFcSbkJps+qPn8BFsO0uuCQPFYFayYxn/Y0jlk9oUbKGkBqQ==
X-Google-Smtp-Source: 
 AGHT+IGI1JQO9cCOl/1bPf0gLXu+7lXHPbKxQofk9L7lq0V+J9URWGPHBNyszaeW4jWYUMvuROx5hw==
X-Received: by 2002:a05:6a00:62c4:b0:6ea:6f18:887a with SMTP id
 d2e1a72fcca58-6f49c1fd780mr364685b3a.1.1715103479252;
        Tue, 07 May 2024 10:37:59 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:1054:2c2f:fb76:3191])
        by smtp.gmail.com with ESMTPSA id
 bm6-20020a056a00320600b006ed0c9751d0sm9997970pfb.98.2024.05.07.10.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 10:37:58 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3] ASoC: fsl: fsl_xcvr: Switch to RUNTIME_PM_OPS()
Date: Tue,  7 May 2024 14:37:35 -0300
Message-Id: <20240507173735.3456334-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507173735.3456334-1-festevam@gmail.com>
References: <20240507173735.3456334-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4Z2SAAZLWRXLEVNHQAGCQSYI5ZSVABBJ
X-Message-ID-Hash: 4Z2SAAZLWRXLEVNHQAGCQSYI5ZSVABBJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4Z2SAAZLWRXLEVNHQAGCQSYI5ZSVABBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions are used
at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/fsl/fsl_xcvr.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index c46f64557a7f..5472ace23d82 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1364,7 +1364,7 @@ static void fsl_xcvr_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
+static int fsl_xcvr_runtime_suspend(struct device *dev)
 {
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
 	int ret;
@@ -1398,7 +1398,7 @@ static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
+static int fsl_xcvr_runtime_resume(struct device *dev)
 {
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
 	int ret;
@@ -1483,9 +1483,7 @@ static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fsl_xcvr_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_xcvr_runtime_suspend,
-			   fsl_xcvr_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(fsl_xcvr_runtime_suspend, fsl_xcvr_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
@@ -1494,7 +1492,7 @@ static struct platform_driver fsl_xcvr_driver = {
 	.probe = fsl_xcvr_probe,
 	.driver = {
 		.name = "fsl,imx8mp-audio-xcvr",
-		.pm = &fsl_xcvr_pm_ops,
+		.pm = pm_ptr(&fsl_xcvr_pm_ops),
 		.of_match_table = fsl_xcvr_dt_ids,
 	},
 	.remove_new = fsl_xcvr_remove,
-- 
2.34.1

