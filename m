Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4FE48E42D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 07:20:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9846A1F69;
	Fri, 14 Jan 2022 07:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9846A1F69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642141205;
	bh=CzWyo1Dh47S+V09J3E4+UIzjXpEmUCI5OKBoMB1p8vI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q31rCwkNA7bP/fOL/kauI0UEmoTQrfVIwKfXnAEKJKRiMpDWbgTtHy31xoXPGWnnb
	 7PXgXmS7bHRWFx4uNgn4ElmVlEaDyW0t9rZIWfe3hw5i5+GN17Zcvw0UvnxJ9xPGw5
	 yGL0BjGb/qf2N0uY9Yc7cvVb2MW5OjR34ej5d41w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6025F800CE;
	Fri, 14 Jan 2022 07:18:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 325ECF8030F; Fri, 14 Jan 2022 07:18:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 550A4F80141
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 07:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 550A4F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qe9as3lG"
Received: by mail-pf1-x433.google.com with SMTP id s15so1913790pfw.1
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 22:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=P7I6VaE87nRYEstDp+uq11bjIAOgfEzIQh4DoOK5I2k=;
 b=qe9as3lG4cg4d11XtFLXqvRFNvZMNnNnIdE+gPaK3SFr4zp6zwuxYyFC5i0tv5TtTz
 zjAIcTezNFAI1yJWMHmkN1gY+NfhHuwweyxUCtK5fno4YDIU3Kuz1cHXFkym6XCxBAWI
 iqlPFhlAEN4dSWh61WkITrZRSp0TDfjnNOTc6shj9xNYue1dTBZXx6HSFx4V++8sU+55
 2xRcARCv7ky1ZRin/ot+OaQb6GEOsnk3Ym0u0GWKxLHsmFeCIKe+mfwEHpZtNfVQoLO0
 rqTYQk/DGCw1e3mQENDa3EFAvRjo+ZzBNdtdTSHyz6x6GHWL7ArD4fXIVa7svdTCm2Re
 yCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P7I6VaE87nRYEstDp+uq11bjIAOgfEzIQh4DoOK5I2k=;
 b=g6fcopHQ6Mwd47LB7GishuFcqV1mk7J141Hk8ndBy8pIHTUXkE0NfopV9rBh/U2kMx
 fIBw8J5avxnNgi00Ih6GwQ8MPgOx1G6A2cNTbp9O7DfmayIpVZqL4BgaYymBQxEeQumC
 ZHYknPUlWshfE5cwGXX9D3j/62eDbgFlM3UIySl6HE9e8nJDS6p7D4RZ8IxsBVZPdkc5
 WPTpwghJDmO/ILYa+k7wautvvb3eI1DfGvDhDxUq5D9KdDcB/v6miP8TOnicwgH0sQkg
 aOz6X3Yh8IYx3QzTvXLXOZWNpDnFXCQo4n7h4hrExMRE0t1oo/J2sF/bN/A0yEqT3E1U
 Ejbw==
X-Gm-Message-State: AOAM533lOuTZFVmQIEigqC1uOezYf5H4NYx7fxHH5bebyrwDksjwDVK3
 4fv+JJfwHsDeWiWm9DnU/1A=
X-Google-Smtp-Source: ABdhPJxDVsI0xYs0EXSiOjEYrv7EF3fAnGjGjUzRXG0ePAETn2CzuaiK1U+JTS0VUpNjF5BAA5/L5Q==
X-Received: by 2002:a63:6bc3:: with SMTP id g186mr6897880pgc.192.1642141122952; 
 Thu, 13 Jan 2022 22:18:42 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id pi7sm1871131pjb.23.2022.01.13.22.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 22:18:42 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sagar Dharia <sdharia@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] slimbus: qcom:  Fix IRQ check in qcom_slim_probe
Date: Fri, 14 Jan 2022 06:18:29 +0000
Message-Id: <20220114061830.13456-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linmq006@gmail.com
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

platform_get_irq() returns negative error number instead 0 on failure.
And the doc of platform_get_irq() provides a usage example:

    int irq = platform_get_irq(pdev, 0);
    if (irq < 0)
        return irq;

Fix the check of return value to catch errors correctly.

Fixes: ad7fcbc308b0 ("slimbus: qcom: Add Qualcomm Slimbus controller driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/slimbus/qcom-ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index f04b961b96cd..ec58091fc948 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -510,9 +510,9 @@ static int qcom_slim_probe(struct platform_device *pdev)
 	}
 
 	ctrl->irq = platform_get_irq(pdev, 0);
-	if (!ctrl->irq) {
+	if (ctrl->irq < 0) {
 		dev_err(&pdev->dev, "no slimbus IRQ\n");
-		return -ENODEV;
+		return ctrl->irq;
 	}
 
 	sctrl = &ctrl->ctrl;
-- 
2.17.1

