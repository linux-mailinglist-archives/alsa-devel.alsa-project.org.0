Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC31D87B8
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 20:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3246E1781;
	Mon, 18 May 2020 20:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3246E1781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589828299;
	bh=md3VPrvK85HM5jK5awA0uE8ow+MthBQduGtpyMr5rFI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h2Ixh5aWZcCYANFEqVr/ezBmCSzbZ2IWQfYTMQHVEo3aZPPAIFknBmKwogKgGiEOS
	 zxeVQ34H5iPMQqSndjQ89rDfkPo0+vnk1iaSH2xF+9Hi3l8mBgCCRZ7Gt9CZHJv8RZ
	 OwFQvFoxnYS4FDvTIl53ItTTmtRkvrk4BVwURaLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF20F801F9;
	Mon, 18 May 2020 20:56:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AA49F801F9; Mon, 18 May 2020 20:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E850BF800C9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 20:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E850BF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C0KuoYtF"
Received: by mail-qt1-x842.google.com with SMTP id n22so6570373qtv.12
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 11:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PU9+FcYTmwz4OTF9GQsuEoV2hcNPVWJLTGkAqfHLxMk=;
 b=C0KuoYtFVZisDnqQE05n+kfcuQXzEF7n8pDJccnhcUsBSuZxSV8ywKLPIuTVZUIuWF
 6Ef/IrJdr2TCV3rpfV+C3pL//E/Eh6v7LXI/NIMpBUhwrdHrOyDGTp3ZsTfeSShO7I9z
 ivX5TFEM7rYT6sTvrdnpklTFUMeWh8JEmdFTGiMKBlEWmEnd/352KlLKXcZjUQv1f1PK
 /Wwz3BJego7R/2lRHnKR7gtA2do5Z/HcC7qjwQeAaekfYcszHjGZq4HOzXVu72vQ8kSv
 iJtsbuqUWnCNSzHtGUq5leR3Nk3apN93/xuDoilW+1v80catFe/SjmPf0SQYIJdRB+ta
 IXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PU9+FcYTmwz4OTF9GQsuEoV2hcNPVWJLTGkAqfHLxMk=;
 b=SsXjk6chudOvSFzBm5pj0achVfiUaEUjBSwbyZrR1IrpxgJ1pB73YdajtZoQr0sPxf
 C6XlnZGbTzlBrXxyrv5FoSJRtcx/Z4ghmqvAMXOA4aZiImGf/Uw9BtfyAIePxHl6FIr7
 ql+21WfompWuU8XbcTNPrHjzImgnwJxqstyv5n14cr5euCgsbZS4dn3pcGRW0aosHnqP
 eCo91qldNfFkKYsM8Yrkeo87wavMjN/+1ZLQHP7sYniRCox2W5TTM8Z2WTtJD8n1x46D
 JEcAsqPeb/ZYhkIPiXTyaoi/e8/m60ksEQs4CosbM5u0pPaZogOe2eJcnVA3X52NsiXs
 BwqA==
X-Gm-Message-State: AOAM530CG1Qrc4wjqIV8FqLx+wvVfKAUg9NG0ZVXeosgnsCfc8xC3oU4
 7+qsbekvXLQ7ZTSiby+IC7U=
X-Google-Smtp-Source: ABdhPJyZtx8fMKUs/SXXvW7jKM9WwWcKcful398CGMWm5Ep+MXlfGNs+sCUew/EPCXyV+NmSPB/3pA==
X-Received: by 2002:aed:3889:: with SMTP id k9mr18460028qte.347.1589828183745; 
 Mon, 18 May 2020 11:56:23 -0700 (PDT)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id u39sm6040770qtc.8.2020.05.18.11.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 11:56:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: fsl_micfil: Remove unneeded ifdef's
Date: Mon, 18 May 2020 15:54:47 -0300
Message-Id: <20200518185448.6116-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: cosmin.samoila@nxp.com, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is no need to use ifdef's around the power managament
related functions, as they are already using the __maybe_unused
notation.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_micfil.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index e73bd6570a08..1c51bd720e6b 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -753,7 +753,6 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_PM
 static int __maybe_unused fsl_micfil_runtime_suspend(struct device *dev)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
@@ -780,9 +779,7 @@ static int __maybe_unused fsl_micfil_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM*/
 
-#ifdef CONFIG_PM_SLEEP
 static int __maybe_unused fsl_micfil_suspend(struct device *dev)
 {
 	pm_runtime_force_suspend(dev);
@@ -796,7 +793,6 @@ static int __maybe_unused fsl_micfil_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops fsl_micfil_pm_ops = {
 	SET_RUNTIME_PM_OPS(fsl_micfil_runtime_suspend,
-- 
2.17.1

