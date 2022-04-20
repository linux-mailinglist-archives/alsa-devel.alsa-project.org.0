Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D261A507F48
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 05:04:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D50718FA;
	Wed, 20 Apr 2022 05:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D50718FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650423845;
	bh=3DXyNJ1byi1f4osx0olkC4NL+junC/MXUEnFugeJ+FI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kq+HgHfAfTTDIzxiBYWFW9YYPM3zXh1Uv+P1nbKchXHgxvJQkF948FcOGmDPvfUN3
	 pU0iIHPtMElg64uDbVezeT4N1vNwQ40KwKcACe2lLK6i7nRpQqNnPedS/xdatSgluq
	 esS/dUESYUZZf68/eyQtYPBkLpkpJZPX8jbftgOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3196F80128;
	Wed, 20 Apr 2022 05:03:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FA26F80125; Wed, 20 Apr 2022 05:03:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E076F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 05:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E076F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lN1gvCms"
Received: by mail-qk1-x72f.google.com with SMTP id c1so338540qkf.13
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 20:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q0fji8Nu54ZhqBHvvYgDr+3hwosEUpxW6x/vEKV84Pk=;
 b=lN1gvCms+NB3UyWtqtN2kTKNax/+AmWYxHLcez/Y3M1D0LFnSF8jnFnk/VGvEnD17l
 BpGDV0SHpABDq4i/bcfGPyMA+dwKy8AYC9VGF+fQQcksG417qs+B+fykyZn8NIxHqg+X
 FphCqPUQ6jlwNahtEdBHW7YRn8JDo5OUxaQSeFmkQ+a1T6xrF9plg3z3VXR9Rlrh/tBJ
 VvVGdeWrNiZ2xyH/EIgwZ8LrU0w6LNmhX0QESIx/CqFLr+ime3DIlBTkvQnh1P0Lbtbf
 5cA1ZEopnZrB5llABp047hRQ8I0YyF8tA1Spa/bhhs8VgSzrVgRgeQde/7f5G5RlwJ2t
 19YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q0fji8Nu54ZhqBHvvYgDr+3hwosEUpxW6x/vEKV84Pk=;
 b=E2w5MMqq0CQdxPfFXULooIOQDOvAI4aGCnefI1VQ10LY9HZrfIKSOj22EeeXlXNvIU
 Wn4zm3/qfIzxt42DGIRasY1l2Otoyc1uDPQlrAWy/NaMlaSL4IUV+t6rz+yGLR1whIue
 kU8DmYMZnZxpAIQVZyHi1v1VOFIG0eLgQAtmdL9EqnA1ZDPozFO7ZBjLlx95y4H5/0r8
 M9/hw9fVGsYwvdEW/ERHS+HM8h7pI+10Abyfv46rhm7aa4zAHH01GbiwliP5k1ZLDLZB
 2lM3JUHNtogYtqAKHgOF6YijKGjCqWhqO26exB80Ucv7FVJUI0ys5FIMrumVpzDw7Iya
 vsTA==
X-Gm-Message-State: AOAM531JGgYdjTNuSIFK45/W0doMyuWTAY+rAgXDr+C0pJv0u5nYY0PV
 QEYfvsL2uljv60HlsRK0IaU=
X-Google-Smtp-Source: ABdhPJzsqmUYOtxkgpjJqXtaXnMb2+DfExa54Oup5JnqEb+chOJlTlEwzijLijF4Kkj18hqinJpF3g==
X-Received: by 2002:a05:620a:40c6:b0:69c:269b:65cd with SMTP id
 g6-20020a05620a40c600b0069c269b65cdmr11267725qko.429.1650423772237; 
 Tue, 19 Apr 2022 20:02:52 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 n8-20020ac85a08000000b002f1fc230725sm1094460qta.31.2022.04.19.20.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 20:02:51 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: img-parallel-out: using pm_runtime_resume_and_get
Date: Wed, 20 Apr 2022 03:02:46 +0000
Message-Id: <20220420030246.2575629-1-chi.minghao@zte.com.cn>
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
 sound/soc/img/img-parallel-out.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index 800f247283cd..cd6a6a825741 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -162,11 +162,9 @@ static int img_prl_out_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	ret = pm_runtime_get_sync(prl->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(prl->dev);
+	ret = pm_runtime_resume_and_get(prl->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	reg = img_prl_out_readl(prl, IMG_PRL_OUT_CTL);
 	reg = (reg & ~IMG_PRL_OUT_CTL_EDGE_MASK) | control_set;
-- 
2.25.1


