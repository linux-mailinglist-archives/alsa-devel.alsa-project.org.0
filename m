Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205B5008E8
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 10:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA71163B;
	Thu, 14 Apr 2022 10:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA71163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649926438;
	bh=d2wuqKTd5VtWQew5dHL33YANlveUvbpI9UpmI6ri9hk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R4wVOg8K/qWMW90WnjaptTMvkcmaVTrG7xJTdBlcyS9OOoXb1Zv+e81AOk4sfuBZ2
	 C0NElR3uSLLnqwGvaaEHRzN1G2JzBxrpLJ6tpr6Rxv8H4x5ELVOiujhDm2haiKkwoQ
	 xezI4csFUxFfdJhm18TVRbN1DPJqfFiLzfbrSfGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE99F801F7;
	Thu, 14 Apr 2022 10:53:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 795CEF80114; Thu, 14 Apr 2022 10:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11AF6F80114
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 10:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11AF6F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UPD8XVIW"
Received: by mail-pl1-x62c.google.com with SMTP id 12so4091870pll.12
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+75oGozFhysU8kD1Lg/rKFGSAHmgc1qYyotBmF08jM=;
 b=UPD8XVIWD4mPKPFPSRTZZw7rS5flMgBMcFYR/JI+sngKZx/Ni3zarN0PFke1o6Fu1L
 InBFy/wIn9tnObwcezs7Z/4Vje9aGXhfVgz2zcRDaz3XsN+ON/t/lKcSMaY7If6Ag1yJ
 QYHAGg3J9FoYCMs/l69Ds5moWeu6J7gBNh0slliAzvCo8dvJDuv0Nixw4CGGLOn9DH+l
 W6H/VXbHHQdH7PPkXEk30qQSp3wvuRWX2fJGLnmakDOkyH59oBSX83D/3gVuSZl+1ebS
 Mx2m8S4XPgLehczU2j9KgPQ73RGP98QmIo/+FBhv7qPg5NSG4Nl1FkSeElGaVsqS6G/s
 rPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+75oGozFhysU8kD1Lg/rKFGSAHmgc1qYyotBmF08jM=;
 b=jKk6VjmNnjTVfBP3iB2S7zPj21mEAtx1QEeXaAegKfU8gBKigq1f0iZyCvA+E5bI4z
 kwid7TBFZijtRX74QSox64wU8NuWvSIwZj9RaQBytpwKiSyYKOdBzJsVRm1yRGMTK5pM
 QEhFj7x2BoQQeLIesDwyTALZoDxFomplL2Qoyfbn2qqDIvtrRAh1tdSGdPnEiah1oGgW
 8a3pps923/Mnd+/HYrJbr/V4gjPI288gED+SLcO9enEI2IuBxlVZlkSiPOr+lunFonCw
 xLDO2bQrL62j0dGmJH+AcnwOSTq+dhfKXTqu2VdgXvCeJ6VIib4+8dywrHRHlWLwmgu4
 i6Tg==
X-Gm-Message-State: AOAM533ZI0/Cafkl+tJo0pPIrh9CauUb8B+2DjIH1NUCFckkMFnDA7c9
 h74P+lXu03WG9KDCgUWBf7E=
X-Google-Smtp-Source: ABdhPJw49/iSTrK6F3IHxwDYuRMrTRAEGaa1SDYkT/crPMXWEUcOiZlpFWkHagaj+numhN1BJmbP2Q==
X-Received: by 2002:a17:90a:510e:b0:1cb:b1de:27a0 with SMTP id
 t14-20020a17090a510e00b001cbb1de27a0mr3229470pjh.196.1649926364403; 
 Thu, 14 Apr 2022 01:52:44 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 qe15-20020a17090b4f8f00b001c6f4991cd4sm5216580pjb.45.2022.04.14.01.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 01:52:43 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: fsl_sai: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Date: Thu, 14 Apr 2022 08:52:39 +0000
Message-Id: <20220414085239.2541484-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>,
 lgirdwood@gmail.com, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 festevam@gmail.com
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. This change is just to simplify the code, no
actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/fsl/fsl_sai.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 4650a6931a94..a7930049a049 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1134,11 +1134,9 @@ static int fsl_sai_probe(struct platform_device *pdev)
 			goto err_pm_disable;
 	}
 
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
 		goto err_pm_get_sync;
-	}
 
 	/* Get sai version */
 	ret = fsl_sai_check_version(&pdev->dev);
-- 
2.25.1


