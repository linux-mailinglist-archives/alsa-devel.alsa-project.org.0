Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7752E667350
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 14:37:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0922D8E28;
	Thu, 12 Jan 2023 14:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0922D8E28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673530671;
	bh=C5+FWrng63sIPJa8OZgcxEExYnM/Z7qsx3WnIsX6ACU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=n0EY1x5spTM1TyR0mt/m+j3n89gwumzjav9F0amgQ9syHRD/aCpEK7ZMomV+tBTnm
	 H4LdLRsWBdH7BkWMlAboUNB1Zu5R3jPpy0p+OFtlOi/lEptEjqrGJVGTor3Fpltl+n
	 J4N5QDvu6QRCbSQLwr2/lB+um4lxTscrbpYcyWBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34BCCF8013D;
	Thu, 12 Jan 2023 14:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CBF6F8016E; Thu, 12 Jan 2023 14:36:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C5A6F8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 14:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C5A6F8016E
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Nt5813lyMzJqJV;
 Thu, 12 Jan 2023 21:32:33 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm100007.china.huawei.com
 (7.185.36.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 12 Jan
 2023 21:36:41 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ASoC: ti: davinci-evm: simplify the code with
 module_platform_driver
Date: Thu, 12 Jan 2023 21:54:57 +0800
Message-ID: <20230112135457.1490360-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 yangyingliang@huawei.com, peter.ujfalusi@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The init/exit() of driver only calls platform_driver_register/unregister,
it can be simpilfied with module_platform_driver.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/ti/davinci-evm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index 983d69b951b0..544cb3da50eb 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -257,18 +257,7 @@ static struct platform_driver davinci_evm_driver = {
 	},
 };
 
-static int __init evm_init(void)
-{
-	return platform_driver_register(&davinci_evm_driver);
-}
-
-static void __exit evm_exit(void)
-{
-	platform_driver_unregister(&davinci_evm_driver);
-}
-
-module_init(evm_init);
-module_exit(evm_exit);
+module_platform_driver(davinci_evm_driver);
 
 MODULE_AUTHOR("Vladimir Barinov");
 MODULE_DESCRIPTION("TI DAVINCI EVM ASoC driver");
-- 
2.25.1

