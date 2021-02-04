Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1730ECE6
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 08:04:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70D1C16D8;
	Thu,  4 Feb 2021 08:03:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70D1C16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612422260;
	bh=t8VJ+rd0moahp1hOUtDogHeM4z/bteP2WrPUqk5Ewiw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X1u42kYh8upDBDipdxkBNPKKeNsDAMlsfOPMwSmbI4kPbZq5Q4G47zMJxmqltPyi2
	 XQe+NgQdqDVYYem9+qoRQH5Mo+Pm5/pWVDqo4voRh/4NcUezSsnPxNkpkNkLj5Moqd
	 Wk9e2OEkw98xbxXV/U4YpNCQgR4c4TVPSWscJqjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E4FF801F7;
	Thu,  4 Feb 2021 08:02:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EFA3F80171; Thu,  4 Feb 2021 08:02:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EA6BF80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 08:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA6BF80154
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0UNpayLR_1612422156; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UNpayLR_1612422156) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 04 Feb 2021 15:02:36 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: vkoul@kernel.org
Subject: [PATCH] media: atomisp: Remove unneeded return variable
Date: Thu,  4 Feb 2021 15:02:34 +0800
Message-Id: <1612422154-53345-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

This patch removes unneeded return variables, using only
'0' instead.
It fixes the following warning detected by coccinelle:
./drivers/staging/media/atomisp/pci/sh_css_mipi.c:39:5-8: Unneeded
variable: "err". Return "0" on line 44

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index d5ae7f0..de8ee45 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -36,12 +36,10 @@
 int
 ia_css_mipi_frame_specify(const unsigned int size_mem_words,
 			  const bool contiguous) {
-	int err = 0;
-
 	my_css.size_mem_words = size_mem_words;
 	(void)contiguous;
 
-	return err;
+	return 0;
 }
 
 /*
-- 
1.8.3.1

