Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9A1324C38
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 09:47:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 994071657;
	Thu, 25 Feb 2021 09:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 994071657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614242860;
	bh=W1Xv1UZLjwhFEpGr0is8Zg7ZZ8yaEbuLsscFNt2IFIc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QrhqJpyMsC5ee87p/rG5gMp0EBuJKALzd4FQSuopCfNgYHCSivxVjhFueYgsSl7DK
	 B5y8d21B4StnCH0rVFp11O2yQuKmGJIi99lxSIOiYE04WLJH9+EovDPxn+I6lkVXFW
	 tFBvqN8qfJbYbdKMjqG5EHMqfKijCowDW1ex6g9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B8C5F8016D;
	Thu, 25 Feb 2021 09:46:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D83A1F8016A; Thu, 25 Feb 2021 09:46:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B111F800D2
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 09:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B111F800D2
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 11P8jp9A3018399,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 11P8jp9A3018399
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 25 Feb 2021 16:45:51 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Feb 2021 16:45:51 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1015p: add acpi device id for rt1015p
Date: Thu, 25 Feb 2021 16:45:45 +0800
Message-ID: <20210225084545.13359-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

From: Jack Yu <jack.yu@realtek.com>

Add acpi device id for rt1015p.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1015p.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
index 671f2a2130fe..4a00e7a4ef6f 100644
--- a/sound/soc/codecs/rt1015p.c
+++ b/sound/soc/codecs/rt1015p.c
@@ -4,6 +4,7 @@
 //
 // Copyright 2020 The Linux Foundation. All rights reserved.
 
+#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -130,10 +131,21 @@ static const struct of_device_id rt1015p_device_id[] = {
 MODULE_DEVICE_TABLE(of, rt1015p_device_id);
 #endif
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id rt1015p_acpi_match[] = {
+	{ "RT1015", 0},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, rt1015p_acpi_match);
+#endif
+
 static struct platform_driver rt1015p_platform_driver = {
 	.driver = {
 		.name = "rt1015p",
 		.of_match_table = of_match_ptr(rt1015p_device_id),
+#ifdef CONFIG_ACPI
+		.acpi_match_table = ACPI_PTR(rt1015p_acpi_match),
+#endif
 	},
 	.probe = rt1015p_platform_probe,
 };
-- 
2.29.0

