Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0595507F4B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 05:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9BC41920;
	Wed, 20 Apr 2022 05:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9BC41920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650423910;
	bh=xBwY2emgHPHqPRW5k2gyZxqHqacKh99+5/PL5S8tDB4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XJhP5GE4u2eE4n4svm3IxH2uLrKM64YUqHsu99nX5hH3TAeQBNkvg7O3er6ZRtRHb
	 QkEsfcl3RiPw16puWUMGjwFkgswzrqN7/1sLMQxWw4TK0PVIEKX5Pcg3J+guPkCkTs
	 eXlx0OdfF3xmTQEfKsImpn1cZAHENiqhV7hSw/qM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30DF0F800C1;
	Wed, 20 Apr 2022 05:04:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2836DF800C1; Wed, 20 Apr 2022 05:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D40AEF800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 05:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D40AEF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ts5wpZle"
Received: by mail-qk1-x72d.google.com with SMTP id 204so364515qkg.5
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 20:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqneS1sFpDsOyrIE2+1UdTS/4fNFnUPRBLnd3RmNOTc=;
 b=Ts5wpZlehNTldV56YalrJSp5dhybuu6s+42AgTPpMsMwjFt1Lis7Rt+xmK9FiGrio2
 HqLSB4P+IzJOw+6Bkz6PTrg+YcegYXzJGd4zlkOm30JZB+yWwqKV7qq9mHJMgm9uucUv
 /ylGtHPl592ncy1Ko3mPGdSmR3RmOr7Ar//h7ITZwPp/wsPT6/qocvoCupoZwIFDzDSf
 fYcOGN48iPY8aBPztkQacG0OHWYO35uCtj4BqSNdu25D3pTWUH0OjeCD8FbVBoa8L1Aj
 sDsFDbYDyfEySElrOHYUPcqUKXIq5uonPN1JW7eM9e1SOfRmSiKxCj5zvxMMKj7c6X/3
 FsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqneS1sFpDsOyrIE2+1UdTS/4fNFnUPRBLnd3RmNOTc=;
 b=5jzvbL3sOnERBsJfY+kEURQc2q1+8tubYhwGaA9vjHy8Pfq3FTsCl3HYevntG6ZpaG
 1g07a8gt+jR1V14WYqfEpZMkz80/zgntbf6Yy4j7QmT7Ngt99ewoKLt0TED6jdIV/dMu
 7XY35fst5MtJNOC211pYuQw7aDVr4DS0L8FSIHu5i+UyyRWL7uOTwJCx/+tOY0vqCtxt
 GyQpuKAeYoblYXUdWrQVZk8TNxmh6CiFlOJ9Dwx0nuTzR6U58o60kwlkJqVN0n4Vi2yL
 1+LecJqeeEXrPS7UMpoRSlmas3PeioxmuJXMPHqU2Ryk27BmBFclf6/1g+gi1jqh3b/z
 i7dg==
X-Gm-Message-State: AOAM532JLU7Meawru2Akm+XQ0S4/cRyc4dRn5WtoB0O7ntqzzjWAaGk8
 7aXHGWo5Z/B32sD4kjom1uc=
X-Google-Smtp-Source: ABdhPJx/s+b4syYfQni7rUQWx2AyU+UcLFCRd7P0jGC6d1QDovYVBI1ayiBLkCungiG7Xd4kM0xQww==
X-Received: by 2002:a05:620a:16b3:b0:69e:bf77:778b with SMTP id
 s19-20020a05620a16b300b0069ebf77778bmr4284035qkj.642.1650423849002; 
 Tue, 19 Apr 2022 20:04:09 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 v23-20020ae9e317000000b0069ea555b54dsm901109qkf.128.2022.04.19.20.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 20:04:08 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: fsl_asrc: using pm_runtime_resume_and_get to simplify
 the code
Date: Wed, 20 Apr 2022 03:04:02 +0000
Message-Id: <20220420030402.2575755-1-chi.minghao@zte.com.cn>
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
 sound/soc/fsl/fsl_asrc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index d7d1536a4f37..31a7f9aac6e3 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1211,11 +1211,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			goto err_pm_disable;
 	}
 
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
 		goto err_pm_get_sync;
-	}
 
 	ret = fsl_asrc_init(asrc);
 	if (ret) {
-- 
2.25.1


