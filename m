Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF72236DC
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 10:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03D91687;
	Fri, 17 Jul 2020 10:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03D91687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594973979;
	bh=+op2cGwW9qYLwQskSYGwnPYTsnRTVlrMeig5OyUoryw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KoDmoRssNgcHQnJpFLNFlhXnPbiRFQnDVoe0Cz9Nhu90WEUxXqUErW4f07qC1Hdvn
	 P0FmB72tn64wQlMCxv5pgUuNBxTU/Guf1Ew6gd/ZPRVML93dNp8oGI4nt4I/l5qFCr
	 O2tmOlK9Ghv9/JMQtuQHFIWQMO75HhaQQ5EEUPV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03D72F80110;
	Fri, 17 Jul 2020 10:17:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7656F80217; Fri, 17 Jul 2020 10:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04841F80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 10:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04841F80110
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 811CDCCE162726C141B8;
 Fri, 17 Jul 2020 16:17:39 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Jul 2020
 16:17:28 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <anarsoul@gmail.com>
Subject: [PATCH -next] ALSA: line6: Use kmemdup in podhd_set_monitor_level()
Date: Fri, 17 Jul 2020 16:17:10 +0800
Message-ID: <20200717081710.39180-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
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

Use kmemdup rather than duplicating its implementation.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/usb/line6/podhd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index 1557483ec657..eef45f7fef0d 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -293,12 +293,10 @@ static void podhd_set_monitor_level(struct usb_line6_podhd *podhd, int value)
 	};
 	unsigned char *buf;
 
-	buf = kmalloc(sizeof(msg), GFP_KERNEL);
+	buf = kmemdup(msg, sizeof(msg), GFP_KERNEL);
 	if (!buf)
 		return;
 
-	memcpy(buf, msg, sizeof(msg));
-
 	if (value < 0)
 		value = 0;
 
-- 
2.17.1


