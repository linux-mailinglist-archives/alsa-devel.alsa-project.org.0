Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E0D6C42C1
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 07:14:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6103829;
	Wed, 22 Mar 2023 07:13:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6103829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679465686;
	bh=7CKP3MTmwg8+XPHCb9bIeITq7goPlQdz+VUQ9n5A6kk=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bltA/16biUR54NPGftblLFMztEqVj/oyo5PyOnyqO2Gt6LpRZUFugRL7Q0JQUVC4t
	 deIvMu1zWRarIyvqR9JoWcGgGkyLOPnjpSCxlvZ35SfueY8h1Roi2vnNu7rg9ylG6s
	 /0unvzgJlcbqQk0fBr+G8Hlst5t5OEbEB4d/8jC8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFC73F80105;
	Wed, 22 Mar 2023 07:13:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6729DF8027B; Wed, 22 Mar 2023 07:10:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8E31F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 07:10:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E31F80093
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PhJ3j1Qz3z6FK2W;
	Wed, 22 Mar 2023 14:10:09 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 32M6A1GY024834;
	Wed, 22 Mar 2023 14:10:01 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 22 Mar 2023 14:10:03 +0800 (CST)
Date: Wed, 22 Mar 2023 14:10:03 +0800 (CST)
X-Zmail-TransId: 2afa641a9bbbffffffffc6a-24ab1
X-Mailer: Zmail v1.0
Message-ID: <202303221410035741246@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <broonie@kernel.org>
Subject: 
 =?UTF-8?B?W1BBVENIXSBBU29DOiB0aTogb21hcC1kbWljOiB1c2XCoGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 32M6A1GY024834
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 641A9BC1.000/4PhJ3j1Qz3z6FK2W
Message-ID-Hash: SPCOMQVKP42V4IBS7QML2YV7WWYDQDWK
X-Message-ID-Hash: SPCOMQVKP42V4IBS7QML2YV7WWYDQDWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPCOMQVKP42V4IBS7QML2YV7WWYDQDWK/>
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
 sound/soc/ti/omap-dmic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index 825c70a443da..85de57198c43 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -488,8 +488,7 @@ static int asoc_dmic_probe(struct platform_device *pdev)

 	dmic->dma_data.filter_data = "up_link";

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpu");
-	dmic->io_base = devm_ioremap_resource(&pdev->dev, res);
+	dmic->io_base = devm_platform_ioremap_resource_byname(pdev, "mpu");
 	if (IS_ERR(dmic->io_base))
 		return PTR_ERR(dmic->io_base);

-- 
2.25.1
