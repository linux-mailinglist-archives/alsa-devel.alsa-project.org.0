Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D72B54C83D7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 07:15:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DE251ADE;
	Tue,  1 Mar 2022 07:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DE251ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646115350;
	bh=PTWklHzjVD1PL41onLiHUBm2vDx+YiaUqd0W0U5t+/I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lF7JmvfYloREtvl+MzzR6CKYmKyeZXa5i/rCSy6yaAAQCWgW0TDyWoF3Uc4H+LWio
	 ld+uci+EDuED/Mr2Gr65D5F9DQEvshhfO+kcekAN6DZfecwtmONZc2/06IdjRox+H1
	 UC3z0XMJ1owzPDBb/DAYC6LwGdoVx0+HbcxePyeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58EE3F80054;
	Tue,  1 Mar 2022 07:14:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BF73F80227; Tue,  1 Mar 2022 07:14:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C1BFF80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 07:14:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C1BFF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ji/Kr0+X"
Received: by mail-pj1-x102d.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so1320319pjb.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 22:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PH1beb/z1ahch6wzT25gnsAtYDGOM8+pvUYjPY/TxPU=;
 b=Ji/Kr0+XMyq6YybkY8r0kkCbklCqbzx1HBoKKROO/QrZrd7ON1mXhg6qDBAQsQdJVG
 q6lHVxQbolqcqib660su51YX7c+aWaoeAoTVAZ/5O4TtX77BthmawBqf5aii29Vqz4aP
 p0zGYw/mom4KUjW+mf/EURQtLSTX90Lv5WYHhScL8Bg7LfM2KTfexOA8AGDa78WB9A9U
 RYixcx3Li+fFJyvHKSuKhTyixNi2uLVfgPP97qblBlm+VaT0+DTnEK25ySp10MFPN5Ji
 66sv0Nkyxwu+c2z3BaGBNSh6ijats42Zw244fUhe60kRag0SyBBFN1Xr83hcGJWVXuQg
 H+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PH1beb/z1ahch6wzT25gnsAtYDGOM8+pvUYjPY/TxPU=;
 b=Snfs+GksRNjSbxO0xOLtNZJ0rlYh4MNZaoYoAGvKrB/eR52URzEvzIZRcLDPa9fAph
 dgwYujCPIlCzFKYttqvHCgKPThRVLIN86U/ZEile/OyN6oc0VRQWXWx0Qhpr5Ei9kGGV
 C3XwGDYpcL/fNwWRhY6iOMdPROzZh4DsY2rag2gc9UjhI79flpGqHcyvXhD9u+qzl7OC
 P1WhLXVSpFaCeVUtfFaqgIde8sRn8BDn8dOlShGbrpQzClhwktvat1UdfWnwyxVFHtLk
 DuEowgthumSpbJLvF1ZaepR+OIZxzOYUc9mETFIIiTbH7KJRsuLy+DQyve6qYIxFazan
 cDpA==
X-Gm-Message-State: AOAM533fckwO7tHl5rjeT7eRzXTbCl/vTRUuD3Vjh3y3Hr1NE7o0bMGb
 Om0msRUzxJwsvhBzSSAKeb8=
X-Google-Smtp-Source: ABdhPJwe2XwQj1/qqfwMVxlcczTF/DleUEyrIFi+5vVHSL0lyezr9cUT5DUPoXDMwseKl3j1rudLKw==
X-Received: by 2002:a17:903:2285:b0:151:4b38:298e with SMTP id
 b5-20020a170903228500b001514b38298emr14222632plh.36.1646115273033; 
 Mon, 28 Feb 2022 22:14:33 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 bo10-20020a17090b090a00b001bc8405bd55sm1024741pjb.30.2022.02.28.22.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 22:14:32 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sagar Dharia <sdharia@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] slimbus: qcom:  Fix IRQ check in qcom_slim_probe
Date: Tue,  1 Mar 2022 06:14:21 +0000
Message-Id: <20220301061421.14366-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <239c3b32-6754-02ba-6bfd-7f05fa2adfed@linux.intel.com>
References: <239c3b32-6754-02ba-6bfd-7f05fa2adfed@linux.intel.com>
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

platform_get_irq() returns non-zero IRQ number on success,
negative error number on failure.
And the doc of platform_get_irq() provides a usage example:

    int irq = platform_get_irq(pdev, 0);
    if (irq < 0)
        return irq;

Fix the check of return value to catch errors correctly.

Fixes: ad7fcbc308b0 ("slimbus: qcom: Add Qualcomm Slimbus controller driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- use more precise expression in commit message.
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

