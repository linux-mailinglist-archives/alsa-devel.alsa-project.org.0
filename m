Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683021A760
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2019 12:07:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B19181862;
	Sat, 11 May 2019 12:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B19181862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557569229;
	bh=XZCAH34N/o/eFHygh2Ex0b/VOu/rzxV7rs5RbSo2Nck=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N9kWaok/VgVhuEoCHvPkwwbfxlVWCbJSRL9cdInOq7SaUhSpkiR6wWbzBHaSbBnrJ
	 6ugf5g0SHNkOiZO2V7AuyxvrdcVQb5C7djVkLVsPNCgSZECTXN8Hb0vm9CsU86ZXTB
	 NymzsCqIqzhlYzVYBzhaq8Ll8zZGZIuw64y5dAuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32569F89673;
	Sat, 11 May 2019 12:05:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED2F6F89682; Sat, 11 May 2019 12:05:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32715F89673
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 12:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32715F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="klfVSy6E"
Received: by mail-lf1-x141.google.com with SMTP id y19so5816884lfy.5
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=S1pzAmLNYPAdy00NLo0+swPi8ZueHy7n/ZkntsATcVI=;
 b=klfVSy6EuBXbSF6HXaXcZqpKz9ArrgWbJLcJ/kiA+mUkTEmlnelyUiy+Ebc8lRDVF4
 oJFOI2e031uG3NFEcMEKQqN7RykJoZr2Llk7h7G65PZNEGmsh50YH7h+bzjhfEYbSESC
 L+zVmygnc8g3W/7S2XAwH5H3NBVSp5uYLPqvSMeBGMLSky47UaopILOd5R36IHeFeZpq
 nYoUOj9cC8O3UbSbyjDMpe7ul4TuR40bYud8BzpaAuD+3LBBYEHVWpGE4Ae+6jFRvtA4
 oIQzEYlOSNZngzIbq0rGpZIisbJeWT0Y+EKhxc5r94Q13Xb8OoilJeC1ngbfLKyom8Le
 wUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=S1pzAmLNYPAdy00NLo0+swPi8ZueHy7n/ZkntsATcVI=;
 b=HSySLgbS3y7aEZbr+qCdH7rD2yyVgEzKyqEWS7/0NKTKE4WnlpaMb2C+DP/W7EEhmr
 A7WGsItlFYhLZObxigXld7HXIQPijQhbAF5yMRrDS9FgT5Txf6AxR7tZeKT3Yw9GF5hN
 I9WM9lCn08gDLimxRpdRGhIMj6HhFB4xJcOgkyl7TGo+ODFH2xB8HaBtjUawx7cwAc2u
 e/VrFJKKtvFbcR+I7iAlo7xa2rWhmjgudbPGKv6A6QyYrK/q2KdFO9VmzK0vafLIHGW1
 o+0Fqj41NTI8+ppn7a4dN6TKase1cj3AD+WNEACdyUbKm7wOZZCYJjwDVUpTLzuHy/6U
 RBHg==
X-Gm-Message-State: APjAAAXgA0yAb0BUXT98BzQmr2ysJP/JzBIcbsIz8pw5GCDGhmW/YxxK
 U2to4a5WLhldP2IQ8EOPke8=
X-Google-Smtp-Source: APXvYqxBlf058XLRLFZsCI5tRDwGeplpimfiuQZEYKJ3VIiqwLjYZ8sn94EHcuKStD9r7wG7384ngw==
X-Received: by 2002:a19:e002:: with SMTP id x2mr9047896lfg.16.1557569118133;
 Sat, 11 May 2019 03:05:18 -0700 (PDT)
Received: from localhost.localdomain (80-167-223-88-cable.dk.customer.tdc.net.
 [80.167.223.88])
 by smtp.gmail.com with ESMTPSA id v1sm2196313lfa.93.2019.05.11.03.05.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 11 May 2019 03:05:17 -0700 (PDT)
From: Daniel Gomez <dagmcr@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 alsa-devel@alsa-project.org (moderated list:CIRRUS LOGIC MADERA CODEC DRIVERS),
 patches@opensource.cirrus.com (open list:CIRRUS LOGIC MADERA CODEC DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Date: Sat, 11 May 2019 12:03:58 +0200
Message-Id: <1557569038-20340-1-git-send-email-dagmcr@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: "open list:CIRRUS LOGIC MADERA CODEC DRIVERS"
 <patches@opensource.cirrus.com>, javier@dowhile0.org, dagmcr@gmail.com,
 "moderated list:CIRRUS LOGIC MADERA CODEC DRIVERS"
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH v2] mfd: madera: Add missing of table
	registration
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

MODULE_DEVICE_TABLE(of, <of_match_table> should be called to complete DT
OF mathing mechanism and register it.

Before this patch:
modinfo ./drivers/mfd/madera.ko | grep alias

After this patch:
modinfo ./drivers/mfd/madera.ko | grep alias
alias:          of:N*T*Ccirrus,wm1840C*
alias:          of:N*T*Ccirrus,wm1840
alias:          of:N*T*Ccirrus,cs47l91C*
alias:          of:N*T*Ccirrus,cs47l91
alias:          of:N*T*Ccirrus,cs47l90C*
alias:          of:N*T*Ccirrus,cs47l90
alias:          of:N*T*Ccirrus,cs47l85C*
alias:          of:N*T*Ccirrus,cs47l85
alias:          of:N*T*Ccirrus,cs47l35C*
alias:          of:N*T*Ccirrus,cs47l35

Reported-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
---
 drivers/mfd/madera-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/madera-core.c b/drivers/mfd/madera-core.c
index 2a77988..826b971 100644
--- a/drivers/mfd/madera-core.c
+++ b/drivers/mfd/madera-core.c
@@ -286,6 +286,7 @@ const struct of_device_id madera_of_match[] = {
 	{ .compatible = "cirrus,wm1840", .data = (void *)WM1840 },
 	{}
 };
+MODULE_DEVICE_TABLE(of, madera_of_match);
 EXPORT_SYMBOL_GPL(madera_of_match);
 
 static int madera_get_reset_gpio(struct madera *madera)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
