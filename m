Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB963B2B49
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 11:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1C51658;
	Thu, 24 Jun 2021 11:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1C51658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624526614;
	bh=GJqzYTtJzMlvm9r9tpqjowmD4OlOf8DpTk/qijTvmqA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eCOQYdkM0d+uZdVu5H29LJY6c3/GMw6tV0qv1vOBf4qXeIcDSmjWvVmCJg2P5iE6f
	 Be+bQKhEzzA35b67ye6J71irKFbHmoZG4tDlfhHcjFuanR3NbLCzi8C7KGk1RAotMw
	 DTtvg3YGRP5hmcEQ4U7kc1BsooD4jbAwrLo8BrvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CF5AF80147;
	Thu, 24 Jun 2021 11:22:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9CFCF8025F; Thu, 24 Jun 2021 11:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81B8FF800E1
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 11:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81B8FF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uhjdive/"
Received: by mail-wr1-x429.google.com with SMTP id a13so5816152wrf.10
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eil13llqRA8gYhUtxKkI3REM+ezUGVLrIHE4Cv2dVF8=;
 b=uhjdive/O7I2WAuxOtK/E1s2j/zgeRvQzfihlEW8X/mI6MelZSIx1sNhvw83vrwVS3
 8Nd+BLc0014wUTXeUJ4A7kgZHjUUuqF6+lO7crQJs+StROQx///ECIVDXxq75RLqkqQv
 /0NUlGqw5GahfYINcQAmor72L2Jwodfhcg0Fx5szchgiP8SjcpMehH/ME8mGH9kOTb78
 OiM5Nt6fe90IR9LKc4lOSnE6kYMAjlIBqLh4eGFqb+Rt2ZPGJ5CS1T/7Njt7KYKOCf8t
 ne5KgG8W6X8pjnoIysVJUC9abq8vmjkvWwA8SBS28kT5giu0J55ePt3PQlrmDFAuj+fe
 12DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eil13llqRA8gYhUtxKkI3REM+ezUGVLrIHE4Cv2dVF8=;
 b=N4H8fbVZ207rVOAmEDsf0bosiTkBSebUCWTju360ygTobGqRvirJtzFxZPepvRERHc
 98YSH2zr1VdvNyyhbhzMzJPCYSj4BAhCKx0jcpqSdIAWBOciSa/MaYe3607YFadtQuxZ
 VL54v5Y9Kz5hQ1LakI3KRunGGbkN9N9h+ZPSFBCbCjjRxJMyjZFcUfZ7S0Ai575O7Ms2
 MwVmhMt+zAzdMFOJ46jjF1n9dnEJXipkpJq6SxSQfEgWOy2UMAfg3mgmn4upPiGfqOcc
 SUyaz8y5RtQr1Kr/SyVBPujM+mVWCGGHs85I1G6+FybgYEn/J7ojyfW51IuudHA6nIMr
 fCrQ==
X-Gm-Message-State: AOAM533Sdhq1CAF3Oh8ZItOTTLaHqwztq9B6jVt4gZRBc0rPAKm10gac
 uIBWgyRTKvPD9GUqrdZKhjL65A==
X-Google-Smtp-Source: ABdhPJztlTt5zmiHbLHkei3r2qRcSGTuDwQiJ31CFKymrlQ3Ku1mjf4fKdAVOaYllWr2BwpDAXBP0A==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr3260555wru.86.1624526518958; 
 Thu, 24 Jun 2021 02:21:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u18sm2235066wmj.15.2021.06.24.02.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 02:21:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: lpass-cpu: mark IRQ_CLEAR register as volatile
 and readable
Date: Thu, 24 Jun 2021 10:21:53 +0100
Message-Id: <20210624092153.5771-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

Currently IRQ_CLEAR register is marked as write-only, however using
regmap_update_bits on this register will have some side effects.
so mark IRQ_CLEAR register appropriately as readable and volatile.

Fixes: da0363f7bfd3 ("ASoC: qcom: Fix for DMA interrupt clear reg overwriting")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 0b9cbf2ce505..8998697cd1e1 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -525,6 +525,8 @@ static bool lpass_cpu_regmap_readable(struct device *dev, unsigned int reg)
 			return true;
 
 	for (i = 0; i < v->irq_ports; ++i) {
+		if (reg == LPAIF_IRQCLEAR_REG(v, i))
+			return true;
 		if (reg == LPAIF_IRQEN_REG(v, i))
 			return true;
 		if (reg == LPAIF_IRQSTAT_REG(v, i))
@@ -566,9 +568,12 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
 	struct lpass_variant *v = drvdata->variant;
 	int i;
 
-	for (i = 0; i < v->irq_ports; ++i)
+	for (i = 0; i < v->irq_ports; ++i) {
+		if (reg == LPAIF_IRQCLEAR_REG(v, i))
+			return true;
 		if (reg == LPAIF_IRQSTAT_REG(v, i))
 			return true;
+	}
 
 	for (i = 0; i < v->rdma_channels; ++i)
 		if (reg == LPAIF_RDMACURR_REG(v, i))
-- 
2.21.0

