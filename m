Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C51E3CB60D
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 12:25:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F4F1677;
	Fri, 16 Jul 2021 12:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F4F1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626431137;
	bh=jFYjOkx/i7sWLMhI9VYqYgK0iSETaXPo7ZQNnOt5kig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mIWjqQR0z4yauMBDdjB4h1v46g9itGptb8HCyff+4/chNbdIuM0I4Rf9kCHpST7DX
	 VliPdYB2QvvGCsnq7PCkZr7ouVAXszeeZzoVXozdlLQtQwgX3u9UxK4sn3qOHt+EQz
	 rau11C2UrHT53uEG++ThG6CPJx/FEnt59Mcx8br8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 416B1F804E5;
	Fri, 16 Jul 2021 12:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8533CF804E6; Fri, 16 Jul 2021 12:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADB8CF8026D
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 12:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADB8CF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RtMIQpqg"
Received: by mail-wr1-x42b.google.com with SMTP id u1so11527272wrs.1
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=phsqVDKt7cS5gPFlQtF9euIsqh6Lyd2uhcBMlgfbuug=;
 b=RtMIQpqgVXDnA7mNNctHnw56XAzb+jtElYAMhxhCoKj31wcOD2of9eOV5AF5H2iw0t
 5PnhV/EhLW5DTYV9G8tA46UxrsZpjxQ7MZvbzbR3U5fi+VhV3FDD3D9qLDuzkDzKnyig
 4TJwJp2TVuO7zP/kEEd2ZSYh1rDmw+MK6ji2Onh96ti5KlcyVCNkHVH282Vd9393OIt+
 ROyoCwrwwx5pwJjHKJzAHgLsQtldUdSDOZ8qDUJ/qXUy22iNNjbuyMrt1q/sOwwumgj6
 cIrObp9ZMrjQJs4OJTLiAfmvR9TF8B2++M4n6VvldrpIKKZR5QuX1Dj3gkJbQvJQHu/y
 AlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=phsqVDKt7cS5gPFlQtF9euIsqh6Lyd2uhcBMlgfbuug=;
 b=mSbpZfrEUfWJvFGzkM/4NRIfAPxpMyr4vQwgn0Y6ztODP6SQpgStLZj+rIAcPj7/fA
 hgTHx8b5dGbtZKG6ylmMbGVzYM4Gxj9+XC3ot4UyV1pOaJFnP1yMn+bVz6/uZwjovJoL
 YcMkPmUzb8KUO248KZfs8UM1pzFxYcLyxwmV6DenhFOXAB6f79i8/Rai1rHqQ6+KzQEa
 UEZBUiAMoUDuyVrmA0bs8EpjfQjlR70XO4n+lF4b6CyVxBPY3QBiGBHRf/CB25SnAkr4
 uvJp+id1x090JJlso1Z3XBgaHfggN3uxYMHMAy9p0Fx6cnTrGlEXcjLZiDnWHsWTRSuM
 1GUw==
X-Gm-Message-State: AOAM530VUWkxS3MnM15P1CIWYoAukAXuC/Ab9XCqUiE85dqlYMml4hVr
 PQ8dPMhVFwpCLS/mNOQvM7YZqg==
X-Google-Smtp-Source: ABdhPJxjZzopWWGCvCIFeBejgXYqA5vngsb3D5YCPozsZs+/7/AGqcMT6p2CiHWlc5BZ8MP4jg8kVw==
X-Received: by 2002:adf:fc85:: with SMTP id g5mr11523289wrr.296.1626430959130; 
 Fri, 16 Jul 2021 03:22:39 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g15sm7421796wmh.44.2021.07.16.03.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:22:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: srini@kernel.org
Subject: [PATCH 4/4] slimbus: ngd: reset dma setup during runtime pm
Date: Fri, 16 Jul 2021 11:21:23 +0100
Message-Id: <20210716102123.26861-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210716102123.26861-1-srinivas.kandagatla@linaro.org>
References: <20210716102123.26861-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

During suspend/resume NGD remote instance is power cycled along
with remotely controlled bam dma engine.
So Reset the dma configuration during this suspend resume path
so that we are not dealing with any stale dma setup.

Without this transactions timeout after first suspend resume path.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index f3ee8e036372..7040293c2ee8 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1080,7 +1080,8 @@ static void qcom_slim_ngd_setup(struct qcom_slim_ngd_ctrl *ctrl)
 {
 	u32 cfg = readl_relaxed(ctrl->ngd->base);
 
-	if (ctrl->state == QCOM_SLIM_NGD_CTRL_DOWN)
+	if (ctrl->state == QCOM_SLIM_NGD_CTRL_DOWN ||
+		ctrl->state == QCOM_SLIM_NGD_CTRL_ASLEEP)
 		qcom_slim_ngd_init_dma(ctrl);
 
 	/* By default enable message queues */
@@ -1131,6 +1132,7 @@ static int qcom_slim_ngd_power_up(struct qcom_slim_ngd_ctrl *ctrl)
 			dev_info(ctrl->dev, "Subsys restart: ADSP active framer\n");
 			return 0;
 		}
+		qcom_slim_ngd_setup(ctrl);
 		return 0;
 	}
 
@@ -1618,6 +1620,7 @@ static int __maybe_unused qcom_slim_ngd_runtime_suspend(struct device *dev)
 	struct qcom_slim_ngd_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret = 0;
 
+	qcom_slim_ngd_exit_dma(ctrl);
 	if (!ctrl->qmi.handle)
 		return 0;
 
-- 
2.21.0

