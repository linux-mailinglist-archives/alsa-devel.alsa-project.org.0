Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E84FD32E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 11:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F3216AF;
	Tue, 12 Apr 2022 11:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F3216AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649754257;
	bh=Lg2X4rpwji8T7oV8twlvAoilEpG+zyhmaGoGpk3E1LA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bBZDokN2pCbV5BnArzXOoIGL4zi9Em9uqOkJxD4NtZqHK05qGF6t/AvQFCp7NVo1W
	 9m4MNqfEkmOjU71/TtPuKAKQCH/X3PyRahfA1lgHVnq1nbVKb7tKEj8KFvrulHvS+4
	 1jgH6B6EXzScDHzwBtWw95pCMRvunscmL0UqYeWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C667F8011C;
	Tue, 12 Apr 2022 11:03:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CBECF80095; Tue, 12 Apr 2022 11:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB4A5F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 11:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4A5F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PDCh3y1Y"
Received: by mail-pg1-x52f.google.com with SMTP id k29so84914pgm.12
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 02:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qeL9OUUuVYyPAwmLxhfNrEy3AwKesyiaX46zNs16JBw=;
 b=PDCh3y1YtisU9UUHOnDvKa5w6dKulSdUSg3Sj9TdSOkJpLKfiIFdUzcix8WEdWnOrG
 t9Ul/Wsp1nJ2qt6RCbSnxTCAwd/KwVJPdrZ4dyRKbl+Jauh1XpQ3alf/NkwmD6XTM+Ms
 BBEHaSyP4cDW8FFWBV4E3BAQxv9Vk+KyRqP8Yf2vY0xHXEoVOIsbpy/ta11eLZe3WBqH
 flCy4GlDBO367JzYAayNLqTLGvVB8RQcSeeRJ/wCKi69Jw2ie7nrBS0EJUEj++ofXO9T
 mbdwEWqOAklYtCAb7dPu+CEw/IcY5MeMJb1ySIlut+Ix+13Q1T3PDWSxFHMixAj4Kc9s
 6u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qeL9OUUuVYyPAwmLxhfNrEy3AwKesyiaX46zNs16JBw=;
 b=yxUA0Iey8/xI6e3YDyne67O1TRMGUZZ+AC1z+a9f2L9lynjq8Bc7nM8iQrmYwKPAm1
 UZwJ5DivNDi7hZXHyavZnkZynJ7zRoXtkqWIF+FXVu1QbB0Jy1fTNQpdwyspNx98R6bo
 XEqsQOXkAjm7xWPGMrG2B0LLFw3ZyLO8jvQJPsaSZcwSFP1Xqme1fhKD7m5Thuxifn39
 69c403Wz8sD0A21xVPY0JtwyGDvYz5CNTCJSG3Z0gpbu+9XJNt8oMuw145qj8uzBWUAl
 ygCiqO60d0SJxyqXOWG5DTe0gqCNVUyEjulUQg055LlicLmVOmrIHY9W/Ay5u1RaHy2P
 raGg==
X-Gm-Message-State: AOAM533XI887dgBN7AXX7Oe5c5IV+JK2j9HUIFXJQLP9eGwo3dfbDheu
 XhxUlFW+YZXwbwQ1xld+gbY=
X-Google-Smtp-Source: ABdhPJy7OVOB4oSM//e1PiinQTfpq0sbwC5nxLoAJdtrcRvnN5OvTFVdRKhIFveJM1YiiZTQXJHNwQ==
X-Received: by 2002:a63:dc4e:0:b0:39c:c5b2:94d6 with SMTP id
 f14-20020a63dc4e000000b0039cc5b294d6mr22046984pgj.365.1649754184245; 
 Tue, 12 Apr 2022 02:03:04 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a17090a0ac800b001c9e35d3a3asm2110537pje.24.2022.04.12.02.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 02:03:03 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: agross@kernel.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH] slimbus: qcom: fix error check return value of
 platform_get_irq()
Date: Tue, 12 Apr 2022 09:02:59 +0000
Message-Id: <20220412090259.2533316-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 sdharia@codeaurora.org
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

From: Lv Ruyi <lv.ruyi@zte.com.cn>

platform_get_irq() return negative value on failure, so null check of
ctrl->irq is incorrect. Fix it by comparing whether it is less than zero.

Fixes: ad7fcbc308b0 ("slimbus: qcom: Add Qualcomm Slimbus controller driver")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/slimbus/qcom-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index f04b961b96cd..b2f01e155d77 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -510,7 +510,7 @@ static int qcom_slim_probe(struct platform_device *pdev)
 	}
 
 	ctrl->irq = platform_get_irq(pdev, 0);
-	if (!ctrl->irq) {
+	if (ctrl->irq < 0) {
 		dev_err(&pdev->dev, "no slimbus IRQ\n");
 		return -ENODEV;
 	}
-- 
2.25.1

