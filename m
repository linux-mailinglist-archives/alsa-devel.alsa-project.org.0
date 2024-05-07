Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E67D8BEAB7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 19:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E92EE85D;
	Tue,  7 May 2024 19:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E92EE85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715103886;
	bh=jqJugf1QsieZWieybWIQUFBlhWNpq6ZRLj4ld7NcAmk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EtGJ5W+nCqwaajZCO+xEdiL5JA0MsKMQ2n8RYIBC2/Yvk/13OiEhTJUY97Waz3yYw
	 qYrluLr5JeCOYfZV1VX0PmCE94eUE354gVQp4wzR+nys/bUNBPelSX0UnlYrmSeKFn
	 kjMBGp7mPYA1mZ9pMkmvFMpMfEqBJ8I6o6kKuefA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C26EDF80588; Tue,  7 May 2024 19:44:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 103F5F8059F;
	Tue,  7 May 2024 19:44:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0C0BF804F2; Tue,  7 May 2024 19:38:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39C93F80152
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 19:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C93F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G5VBF140
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ed72194f0aso1550035ad.1
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715103475; x=1715708275;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=25lgoJ/O2oeQ/Qg9WTJfZXYcxMBwYTkCOOxVainY88U=;
        b=G5VBF140iQ4nHJ2fa7YUiHIoSu5D0HJpv+tGJAtpRDo8pKXoBnih/yQx7rEPXA8HaA
         it+lx4XFKVcV4zRnDXh2f5dafUbxIpWdkmYXYXVjjAVyoPwfYDulvxmKZg70oLlPVjiG
         dkUGEF4YjiFVpU9bsSwVGB6rlVeXtItvJ7yG8OumKlPWs6Jmu7zKcEaDz+CIJPZFV/bV
         jF1lsLiHUi9s051KQ+Zr0O62uMy0q/vkwsVVRaOc1n453RdfJupk2DRy/XH4Q/kok+an
         orPKfoY0oXBYVR7TgVNKvpkV48AInANU1vwRe98s/h3kNOEGMGApNYN2w69T3SMAgrnS
         cXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715103475; x=1715708275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25lgoJ/O2oeQ/Qg9WTJfZXYcxMBwYTkCOOxVainY88U=;
        b=iWH3Oyvu9wsdTtnlPNJXiAi3KbBwcFm4H1a+Zy9xpBvdrth4dC+7aUXPUeYeXXUCk/
         DeSn5Yp9ileLlru6pWwHwXbeeRoPLbP6HEp/nFlmXzMrRvHrXoPwDvQRoPMRbgEvYb6d
         q+0QURYxF5VgzWeaj1is1tjihX/ZDKzYm4ZLMj72CFY+StQl56PpAOgdWAlJW0qRY7Yt
         ld/yZWp7PzUqTPKH/4ZfQYgKLGAIlYbrbTvO0ASFZWqZFTTqSny70BOewA90+lIfb/O+
         Chvm8Vju5cKcOMqRAqnF26JiBeP/NKwzx61NBjAsIeDVEi8FzCNJaY2UN7coq58creON
         weMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJE782fV6fi25gGpysnRD5JGM+ZPebbbQpn3IeChjGqI6WSIWopn1M/d61prGeWfgDarzZLcztBKiH28lrkNTtFzCpldFrmHtyzDY=
X-Gm-Message-State: AOJu0YzG31sYTXPlNyDEV50QQu9SijXqsPljGPq8DfJhhancg8OZhx9k
	o4nlJAlYCGYozLdgvJV8RhVnKBs8FfUycAMFeo6lraDeKT3waPmr
X-Google-Smtp-Source: 
 AGHT+IGVOSEuKKgQeqszyPBH9mYH14DpW3ziSHEItln7XJrLIIc2BJ6cwkd8HPP1K4ZrAhjO9K8Igg==
X-Received: by 2002:a05:6a00:929a:b0:6ec:f5d2:f641 with SMTP id
 d2e1a72fcca58-6f49c1efa12mr385059b3a.1.1715103474701;
        Tue, 07 May 2024 10:37:54 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:1054:2c2f:fb76:3191])
        by smtp.gmail.com with ESMTPSA id
 bm6-20020a056a00320600b006ed0c9751d0sm9997970pfb.98.2024.05.07.10.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 10:37:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] ASoC: fsl: fsl_aud2htx: Switch to RUNTIME_PM_OPS()
Date: Tue,  7 May 2024 14:37:33 -0300
Message-Id: <20240507173735.3456334-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DX5WZ23EEOXAIACGRBSYQF2TJCMQYAIB
X-Message-ID-Hash: DX5WZ23EEOXAIACGRBSYQF2TJCMQYAIB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DX5WZ23EEOXAIACGRBSYQF2TJCMQYAIB/>
List-Archive: <>
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
 sound/soc/fsl/fsl_aud2htx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index ee2f6ad1f800..a6cbaa6364c7 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -261,7 +261,7 @@ static void fsl_aud2htx_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused fsl_aud2htx_runtime_suspend(struct device *dev)
+static int fsl_aud2htx_runtime_suspend(struct device *dev)
 {
 	struct fsl_aud2htx *aud2htx = dev_get_drvdata(dev);
 
@@ -271,7 +271,7 @@ static int __maybe_unused fsl_aud2htx_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused fsl_aud2htx_runtime_resume(struct device *dev)
+static int fsl_aud2htx_runtime_resume(struct device *dev)
 {
 	struct fsl_aud2htx *aud2htx = dev_get_drvdata(dev);
 	int ret;
@@ -288,9 +288,8 @@ static int __maybe_unused fsl_aud2htx_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fsl_aud2htx_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_aud2htx_runtime_suspend,
-			   fsl_aud2htx_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(fsl_aud2htx_runtime_suspend, fsl_aud2htx_runtime_resume,
+		       NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
@@ -300,7 +299,7 @@ static struct platform_driver fsl_aud2htx_driver = {
 	.remove_new = fsl_aud2htx_remove,
 	.driver = {
 		.name = "fsl-aud2htx",
-		.pm = &fsl_aud2htx_pm_ops,
+		.pm = pm_ptr(&fsl_aud2htx_pm_ops),
 		.of_match_table = fsl_aud2htx_dt_ids,
 	},
 };
-- 
2.34.1

