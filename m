Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 621236C42C7
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 07:15:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0FFA83B;
	Wed, 22 Mar 2023 07:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0FFA83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679465735;
	bh=lm11B00VaJE5AoDHtK5VuPP/MUlkct4VAvsZnGf3gJ0=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ez/YSx+hsrjVaYbZzegB8V48O0st99WtI9AX0oeFczE7cRk6UYozsMZhYvgaKDsTb
	 Z5RRebg7+nVg9NiseXeEcgBQN55J+EgnYK3T/naZHnM1o2MPiiZZ0WyUzQ+UH21NKm
	 x8MVqnYqvRz7PXy9Uzwt7xFcMWoA7CLCpeJUTNbc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F18F2F804B1;
	Wed, 22 Mar 2023 07:13:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ADDDF8027B; Wed, 22 Mar 2023 07:11:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05019F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 07:11:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05019F80093
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PhJ5B1HQ6z8R042;
	Wed, 22 Mar 2023 14:11:26 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 32M6B9v6018112;
	Wed, 22 Mar 2023 14:11:09 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 22 Mar 2023 14:11:11 +0800 (CST)
Date: Wed, 22 Mar 2023 14:11:11 +0800 (CST)
X-Zmail-TransId: 2afa641a9bffffffffffe8b-27ccf
X-Mailer: Zmail v1.0
Message-ID: <202303221411117451283@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <broonie@kernel.org>
Subject: 
 =?UTF-8?B?W1BBVENIXSBBU29DOiB0aTogb21hcC1tY3BkbTogdXNlwqBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 32M6B9v6018112
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID
 641A9C0E.000 by FangMail milter!
X-FangMail-Envelope: 
 1679465486/4PhJ5B1HQ6z8R042/641A9C0E.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 641A9C0E.000/4PhJ5B1HQ6z8R042
Message-ID-Hash: LPOMWWYFPDO5F76NFH6MTX7K2QQNDT3T
X-Message-ID-Hash: LPOMWWYFPDO5F76NFH6MTX7K2QQNDT3T
X-MailFrom: ye.xingchen@zte.com.cn
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com, lgirdwood@gmail.com,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPOMWWYFPDO5F76NFH6MTX7K2QQNDT3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource_byname(),devm_ioremap_resource() to a single
call to devm_platform_ioremap_resource_byname(), as this is exactly what
this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 sound/soc/ti/omap-mcpdm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index 0b18a7bfd3fd..35deceb73427 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -563,8 +563,7 @@ static int asoc_mcpdm_probe(struct platform_device *pdev)
 	mcpdm->dma_data[0].filter_data = "dn_link";
 	mcpdm->dma_data[1].filter_data = "up_link";

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpu");
-	mcpdm->io_base = devm_ioremap_resource(&pdev->dev, res);
+	mcpdm->io_base = devm_platform_ioremap_resource_byname(pdev, "mpu");
 	if (IS_ERR(mcpdm->io_base))
 		return PTR_ERR(mcpdm->io_base);

-- 
2.25.1
