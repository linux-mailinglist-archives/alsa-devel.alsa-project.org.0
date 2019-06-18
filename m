Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BB9498AE
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 07:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 706121708;
	Tue, 18 Jun 2019 07:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 706121708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560835719;
	bh=CxMAQ1DGKm6yFsKxJuuuJpPps/MkskQQx/xEhVZY4Zk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WRfKK0Ge0eS2VlfSXmAz6nB5soeDc9dy9VJbDt+vwTuhiF3D7hHeGv3OTblXGVWfz
	 42NAawQgGwZaNTYwaULkAIyWzYOoyuJUKHMj77sAWxmkyOQdIlwkp1EHzsJd2gY3sh
	 adaGMBtTPUv6e33P6wVqaVLSVqT1FGwpwcXW18e8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E8CFF896F4;
	Tue, 18 Jun 2019 07:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AFF6F896F4; Tue, 18 Jun 2019 07:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9109AF89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 07:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9109AF89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zvOFBSUP"
Received: by mail-pf1-x443.google.com with SMTP id d126so6952490pfd.2
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 22:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=whbkciZuL++lKNDvtvhbwAO5DyTyA866K2yDYDBjqZI=;
 b=zvOFBSUPmPI/GdgLLOxkDVawbMy7YCCvIZ8vYJvsFNaKl3Jn28Tawlq3CoP9wlm2bE
 V4c0+HIBf0vxfU8RK9E0YMWwL/1SEfbVk+bIhbxMbeHjmHa4r3E7ku3XoTzVZW3qOoM2
 rQHKBhbL5xJxRqeKHguWsj2O7CU3pdlv0/4v1XWIWvU9POj9MhnixLjcWryeMZrIN+xy
 yoMyl44dxeDQ3V5/i8Jd3JeR6ideyS4FL7V4IsSFGH2eQG+yqZeDEE+6AEE/OMzCtaVa
 ztwa5dduFHcj7lZAq1QGJXD/osZ3fKcSXmfHemnaCDYt9yDGdEZNt+BatVmigcYdS1VY
 5xvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=whbkciZuL++lKNDvtvhbwAO5DyTyA866K2yDYDBjqZI=;
 b=cqCvOqy8FfRe+4d9x3bowolIBizRuUqa7U9koo4mmcFl+6kDL7EEFyqHAlPiapXI/0
 bWz+sWyu00QjAZQVrZdm2Z5ihL18K9+/OyC+aET4GjN2q4RT+9ulv9KmRoSC3e9s0MWB
 mpidjPzLlDYbzUzMvOlbfL8qtNfB8k10biK1k6mM6b5k1x4M11ZPtK2qiElKzC8ZzWsg
 T2amhjO7jm22u+9kVbivhVeb2XfW4hO0jQ9PB586H2OytJvoUL11JrlWrRz+Q77MjBtQ
 AJsc59tVNEqMDUkHAbaHkzbx0NvyYoH+5VZ3+RRQi0nOuTgXaY518HRT+t6SM0b2k+vU
 RNUw==
X-Gm-Message-State: APjAAAXTAHWXOD8kRtkIDL+6lgs9yaDPdp+MFtnE2pzchSsQg6Gh6auN
 h3Gg8XSlMG7ZqcQQ1Pu+cNAi9w==
X-Google-Smtp-Source: APXvYqwig0dnCKGj82lWud21PmluM29Y5AErwTeEnPoTw6eHbzOeKqZ0jJB54Z+SW0QC+OnctrVhjg==
X-Received: by 2002:a62:68c4:: with SMTP id
 d187mr121107689pfc.245.1560835607326; 
 Mon, 17 Jun 2019 22:26:47 -0700 (PDT)
Received: from localhost.localdomain
 (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id v185sm3051958pfb.14.2019.06.17.22.26.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 22:26:46 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Mon, 17 Jun 2019 22:26:44 -0700
Message-Id: <20190618052644.32446-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] slimbus: core: generate uevent for non-dt only
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Rely on MODULE_ALIAS() for automatic kernel module loading, rather than
basing it on the OF compatible. This ensures that drivers without
of_device_id table, such as wcd9335, will be automatically loaded.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
[bjorn: Added commit message]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/slimbus/core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index b2f07d2043eb..526e3215d8fe 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -98,11 +98,6 @@ static int slim_device_remove(struct device *dev)
 static int slim_device_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	struct slim_device *sbdev = to_slim_device(dev);
-	int ret;
-
-	ret = of_device_uevent_modalias(dev, env);
-	if (ret != -ENODEV)
-		return ret;
 
 	return add_uevent_var(env, "MODALIAS=slim:%s", dev_name(&sbdev->dev));
 }
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
