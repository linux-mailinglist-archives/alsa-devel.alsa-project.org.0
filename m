Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDC507F59
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 05:05:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A0051930;
	Wed, 20 Apr 2022 05:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A0051930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650423946;
	bh=6Bcr1wmI1Q6CB2IP2rXYflmBrJGJ+UNINaLK+Rf2dqc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hM+HFN9/A4OoLS4tldUTc5Y6mrVKubq557LTrkS7PT8o527AiyxQqTT4iuZ5XFKqa
	 fw3jcOri0k8Q1S0CF3hrvV2NpVkUAUKxgMxZxclfjCU7nI23GlvfQkSIzkH/ABRGGk
	 6AenmBA5k9BxdJbDoq6MRipKqnwEPR8XWTzw8cQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0697F80254;
	Wed, 20 Apr 2022 05:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC09AF80246; Wed, 20 Apr 2022 05:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9E58F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 05:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E58F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mcy+8bJ8"
Received: by mail-qv1-xf31.google.com with SMTP id b17so442921qvf.12
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 20:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lB8BBizelOBxUY2qv4ST0PrKLXMyNa9DnyNjkNLjmec=;
 b=mcy+8bJ87Z1l9XR9HkNwLxGZ2d01t/zLaFzmkL9u+V4+NTMaTgs/UOqd+4QMo7ic5L
 EYJdaw5EuIMuj/mlno8UafIv6PpPUdLJy8Tv9mFhboZDBbZf82gaYQyNoDLHj6nVLZRz
 uqL87jpEvsJpeJ0UIBkLowFYgEjBTYVt+h/CaOsshOxFb7j/f6ea/hdw+FzQHjnpkVu+
 J1+3TqNXrZbJm1JtY/N2FmcsiGCopI+Tu0+1poJPQDlymb8SQa2F690vpaR7i161LFD2
 PnAvlWnyhvUbEUXNLN3ehGRuHfr6pAuUM9ceJhXHQvPOJJ8cUCgcV8yYgXnFvTrn2h19
 0YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lB8BBizelOBxUY2qv4ST0PrKLXMyNa9DnyNjkNLjmec=;
 b=a4f4fsq32qVpEovzvktgiJYRzpJy2YIPEkAyNT+kDoMSXd6wS+/7mBix+qfFXrTM0g
 NI5QZqxH+eEw4BMyMGEOQG+IeHxrL0a19BptPNXOahh+qkYlbaz0mLO9MsBjrEqgc8Yo
 KSb3vHj7YEx5pIaduKsx+tYkX/gMgWR1jl1BB61peuom1m832wkOlyaAHg+v9irDIEjO
 Za5ay954YxrpzEP35gXviqtL52NUHhx5EMkddcyqPa9/2t7+6dEey91JhjnUVIlYq2MZ
 vd9TjulJ7zW9APvV+kz8mTHhFwI/dCS0SGwPmtUPtdolcev0ez4DAMAktEgFosMcisry
 9DwQ==
X-Gm-Message-State: AOAM5307qazgtoycrirRC4rIFCBbBEdycPFwURe4/Oy0dOukT5vNSGIM
 VOYg5hR5f1gTdnotDRE+Ceg=
X-Google-Smtp-Source: ABdhPJyJwovdSHHmviYSU+xbTbk8rPDBT8hoeRFAFiOmmlTco6MShhHIWqg6Rr+19MxApe+oSfiDIQ==
X-Received: by 2002:ad4:5c45:0:b0:446:5af6:7706 with SMTP id
 a5-20020ad45c45000000b004465af67706mr9583174qva.112.1650423885729; 
 Tue, 19 Apr 2022 20:04:45 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05620a12cd00b0069e908ab48dsm898490qkl.106.2022.04.19.20.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 20:04:45 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: img-spdif-out: using pm_runtime_resume_and_get to
 simplify the code
Date: Wed, 20 Apr 2022 03:04:39 +0000
Message-Id: <20220420030439.2575817-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
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
 sound/soc/img/img-spdif-out.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index c3189d9ff72f..f7062eba2611 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -362,11 +362,9 @@ static int img_spdif_out_probe(struct platform_device *pdev)
 		if (ret)
 			goto err_pm_disable;
 	}
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
 		goto err_suspend;
-	}
 
 	img_spdif_out_writel(spdif, IMG_SPDIF_OUT_CTL_FS_MASK,
 			     IMG_SPDIF_OUT_CTL);
-- 
2.25.1


