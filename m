Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873E1A7526
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11F0816A8;
	Tue, 14 Apr 2020 09:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11F0816A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850495;
	bh=A11Wv9VssJuVLpNEHJy5X67K8GiJPaig3G5xzTwhDz4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TeLlFusTPIrm/+DDhpGqH4NpHtcCRqDfIQkxwzah4qE2RNqU2lY06Z/Xo1K5iueXe
	 L5LlblHGX4KAWyh/cwfX33BFtz1bj0yEJqscX0ROuKyHvPddqy7XjS5lMmRvNVqbzk
	 yD6KRlKa0rDzAmlR8SEHXPbO7ZIATbThiDJfPUIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 535C1F802DD;
	Tue, 14 Apr 2020 09:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE79CF8013D; Tue, 14 Apr 2020 08:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77627F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 08:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77627F800B9
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2E0436A96C7C1ED8F159;
 Tue, 14 Apr 2020 14:21:12 +0800 (CST)
Received: from fedora-aep.huawei.cmm (10.175.113.49) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 14 Apr 2020 14:21:03 +0800
From: yangerkun <yangerkun@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [RFC v2] ALSA: control: fix a error handling exist in snd_ctl_elem_add
Date: Tue, 14 Apr 2020 14:51:09 +0800
Message-ID: <20200414065109.6923-1-yangerkun@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.49]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 14 Apr 2020 09:41:46 +0200
Cc: alsa-devel@alsa-project.org, yangerkun@huawei.com
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

CVE-2020-11725 report that 'count = info->owner' may result a
SIZE_OVERFLOW. 'info->owner' represent a pid, and actually, we should
use info->count.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v1->v2: reword the patch head

diff --git a/sound/core/control.c b/sound/core/control.c
index aa0c0cf182af..c77ca7f39637 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1431,7 +1431,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 		return -ENOMEM;
 
 	/* Check the number of elements for this userspace control. */
-	count = info->owner;
+	count = info->count;
 	if (count == 0)
 		count = 1;
 
-- 
2.21.1

