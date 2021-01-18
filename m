Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E82FA014
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 13:42:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01F3317F6;
	Mon, 18 Jan 2021 13:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01F3317F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610973740;
	bh=ULQ7jcqZC2eaNGucxdFbtpqw2lw6reMMFN5QCYuXsRY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T4+rCKZeymYqRHtQuQ7Vx69bEFbDc3SBNjIViJU9E0mOo5t3qFo24g14xyGfip+pB
	 kH+lmkQo07FR1gxfmDIedq9A3t1/cc/iCoZ3p9mL1ZBCXz1vRvI/yYnsUFsR1Or70q
	 tlod1t4A/nlBXkVDNYAnrNenqFBXpeDcgZcTqNQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29073F80227;
	Mon, 18 Jan 2021 13:40:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 957BEF80218; Mon, 18 Jan 2021 13:40:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B47E6F800E7
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 13:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B47E6F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tNYAQe4U"
Received: by mail-qt1-x830.google.com with SMTP id h19so11063051qtq.13
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 04:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UX/cKx68h768c+qYb1NW5l7xmxav6pdEySWoiWZNisY=;
 b=tNYAQe4UWY729TposfJ29q/T2iy6005f+jDtRIQa4hGPrNpDsoYcfAcw/UnfQ/z4Vz
 SK7tcETcZwyt2CAQuC9Ib+xT8dHHkDRYf194QKG3gOElhSwz0KKL3efiB7/HDxhPQmiO
 gdyqePqAGyhexMFHc+NU9na9HK7+6frzQpQZ5UYU3LK5o1w+Dau/X/fu57ycqCrFAVyl
 0nOS2u5P1ucWXjeru9XliKwFHSujBqWeUYcSB89tBp7t0W4xmnSthIs0AvixkIXaX2rK
 PL9mkKloGZRrVrKEAy6I2//OFta73tV/+yxoktaGTRtTZavXIjHMkxUaXkuPAUxhjn7v
 XIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UX/cKx68h768c+qYb1NW5l7xmxav6pdEySWoiWZNisY=;
 b=tQPC0k9p5yX+T/Zt0+Xi9NCEt4bxa1TMR+O6LSFIVQJplDmhZ9vLoUFxbE50aqQLt3
 aft5sPrx1QCuvGa878oYEd4D7WO6dzsC3N0thWWVFowPm/j48stb5hMZ4V9TweBXpeFR
 Cs0T3FKD+qFVXi+dtEEretrRdM0NHfXwu7wbfypf5pHxggLacpb1e62euPELxvKCYE22
 ORSgViS1iuc7HlnyJLLOBQKLDNfySjvTuw9zmqLjgjfkaafjRfZvVFpnL7Xid5OEyg+L
 0hgnMqUzZE6lLrc8y7GvdLHz2Fk6jec0Gjy1aAMI9iK58hlgBJvwIversgQqJB+n6eNC
 foAQ==
X-Gm-Message-State: AOAM531mFKD1O5RFjo88tR7Ie+1iFxrTWIANMQrWbgh8b5mrn2dfTlDa
 VOxdGxXJdlTAZsyF+dxF5Ko=
X-Google-Smtp-Source: ABdhPJxcAIsTTro4Q1uMN/5/6mi0fAG9IVBoZyKHUYGepestaZT5ILrijELhmJPNoDmS3jH0KuHI8g==
X-Received: by 2002:ac8:1c92:: with SMTP id f18mr22669850qtl.234.1610973628083; 
 Mon, 18 Jan 2021 04:40:28 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
 by smtp.gmail.com with ESMTPSA id q92sm10022654qtd.48.2021.01.18.04.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:40:27 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 2/6] ASoC: fsl_micfil: Use of_device_get_match_data()
Date: Mon, 18 Jan 2021 09:38:11 -0300
Message-Id: <20210118123815.1630882-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118123815.1630882-1-festevam@gmail.com>
References: <20210118123815.1630882-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, shengjiu.wang@nxp.com, timur@kernel.org
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

The retrieval of driver data via of_device_get_match_data() can make
the code simpler.

Use of_device_get_match_data() to simplify the code.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_micfil.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index efc5daf53bba..8aedf6590b28 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -637,7 +637,6 @@ static irqreturn_t micfil_err_isr(int irq, void *devid)
 static int fsl_micfil_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *of_id;
 	struct fsl_micfil *micfil;
 	struct resource *res;
 	void __iomem *regs;
@@ -651,11 +650,7 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	micfil->pdev = pdev;
 	strncpy(micfil->name, np->name, sizeof(micfil->name) - 1);
 
-	of_id = of_match_device(fsl_micfil_dt_ids, &pdev->dev);
-	if (!of_id || !of_id->data)
-		return -EINVAL;
-
-	micfil->soc = of_id->data;
+	micfil->soc = of_device_get_match_data(&pdev->dev);
 
 	/* ipg_clk is used to control the registers
 	 * ipg_clk_app is used to operate the filter
-- 
2.17.1

