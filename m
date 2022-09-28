Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0955EED99
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 08:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F3C15C3;
	Thu, 29 Sep 2022 08:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F3C15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664431778;
	bh=cS2VmoFpVao/CJIFBy26BNirG1eRxl6XQBc/2GUEpl0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pFc0VaWgJe2evL2i0jPSFLEELZwfFIkYP/+R/wJ9QoFCpDGdyIsjIXqNfTJzg9zAw
	 TUJbWl408XbARq5Or8Hm/xyLbhegCpCsu3kIM2tb9ZC35qSRNWguZeJiExMLzW3+YL
	 f+wl90ypnA+u5RH8oXqjF6TWGQ4X+xj2MtYuvVds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1689EF80566;
	Thu, 29 Sep 2022 08:06:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0D17F80310; Wed, 28 Sep 2022 10:50:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D8F9F8011C
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 10:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D8F9F8011C
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McqpD5CxlzlXHK;
 Wed, 28 Sep 2022 16:45:56 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 28 Sep
 2022 16:50:12 +0800
From: Yuan Can <yuancan@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: asihpi - Remove unused struct hpi_subsys_response
Date: Wed, 28 Sep 2022 08:48:33 +0000
Message-ID: <20220928084833.61131-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 29 Sep 2022 08:06:37 +0200
Cc: yuancan@huawei.com
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

After commit 3285ea10e9b0("ALSA: asihpi - Interrelated HPI tidy up."),
struct hpi_subsys_response is not used any more and can be removed as well.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 sound/pci/asihpi/hpimsgx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/pci/asihpi/hpimsgx.c b/sound/pci/asihpi/hpimsgx.c
index f7427f8eb630..d0caef299481 100644
--- a/sound/pci/asihpi/hpimsgx.c
+++ b/sound/pci/asihpi/hpimsgx.c
@@ -93,11 +93,6 @@ static void HPIMSGX__cleanup(u16 adapter_index, void *h_owner);
 #pragma pack(push, 1)
 #endif
 
-struct hpi_subsys_response {
-	struct hpi_response_header h;
-	struct hpi_subsys_res s;
-};
-
 struct hpi_adapter_response {
 	struct hpi_response_header h;
 	struct hpi_adapter_res a;
-- 
2.17.1

