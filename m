Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD51A7525
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97BA816A0;
	Tue, 14 Apr 2020 09:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97BA816A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850472;
	bh=AQHkwo45dTPfHWJM8MgDM+4Xx7e7h6BRvXLTKGpxuF4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uZhJzt4qhtzCJCAhtsNV+XFmGLQwcvfwtnaYL0WMf31Fl+LaUzIN/gspX5QcHPTOe
	 BVmVlwrXk/meddtvLpUKo2dMiMmYPnz6TUZm4MljqRpRnh433TMq0S/vRBXoLF8TJ+
	 4HCy9l26nRBM8QdQ/m4yZTDqsKvf/+cZNUQE8v/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0584AF802C4;
	Tue, 14 Apr 2020 09:42:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4ACEF800F5; Tue, 14 Apr 2020 08:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5BC4F800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 08:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5BC4F800F5
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 059DA3805557DFEE02FF;
 Tue, 14 Apr 2020 14:14:50 +0800 (CST)
Received: from fedora-aep.huawei.cmm (10.175.113.49) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 14 Apr 2020 14:14:41 +0800
From: yangerkun <yangerkun@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [RFC] ALSA: control: fix a mishandled exits in snd_ctl_elem_add
Date: Tue, 14 Apr 2020 14:44:46 +0800
Message-ID: <20200414064446.5240-1-yangerkun@huawei.com>
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

