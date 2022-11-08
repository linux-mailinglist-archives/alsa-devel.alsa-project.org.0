Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D93620F0C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 12:28:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FE12823;
	Tue,  8 Nov 2022 12:27:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FE12823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667906899;
	bh=K+mMq3HJ2rHBHdjoaHWAiG4KqshUJ65CFi+b5BeOhU0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MeEMQMQWbI6thooiAcz6ZGPWToXb52xsdXCw4py+GuNSjK7SWhwKajTT/g53qCPiQ
	 CkEPT/R36jd1GtnWzzSHR/kq5WRqtbs/fAXQc3efCuGj5n/qRM/KGIRzhElpjXStFy
	 ZAqzpYAasI0DNYXJshnvtzUGD6dsWB8auKMFrwQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDABBF8020D;
	Tue,  8 Nov 2022 12:27:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 707F9F801D8; Tue,  8 Nov 2022 12:27:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BF91F800EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 12:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BF91F800EC
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N65R76RhNz15MLj;
 Tue,  8 Nov 2022 19:26:59 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 19:27:10 +0800
From: Wei Li <liwei391@huawei.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: Correct the header guard of wm8904.h
Date: Tue, 8 Nov 2022 19:25:47 +0800
Message-ID: <20221108112547.3913293-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, huawei.libin@huawei.com
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

Rename the header guard of wm8904.h from __MFD_WM8994_PDATA_H__ to
__WM8904_PDATA_H__ what corresponding with the file name.

Fixes: a91eb199e4dc ("ASoC: Initial WM8904 CODEC driver")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 include/sound/wm8904.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/wm8904.h b/include/sound/wm8904.h
index 88ac1870510e..f74293a83a17 100644
--- a/include/sound/wm8904.h
+++ b/include/sound/wm8904.h
@@ -7,8 +7,8 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
-#ifndef __MFD_WM8994_PDATA_H__
-#define __MFD_WM8994_PDATA_H__
+#ifndef __WM8904_PDATA_H__
+#define __WM8904_PDATA_H__
 
 /* Used to enable configuration of a GPIO to all zeros */
 #define WM8904_GPIO_NO_CONFIG 0x8000
-- 
2.25.1

