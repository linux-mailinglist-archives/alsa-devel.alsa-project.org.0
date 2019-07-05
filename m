Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C7601F4
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 10:12:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46237169A;
	Fri,  5 Jul 2019 10:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46237169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562314335;
	bh=Lt7eM22karqoLbGvwV/CEHWRMxSilaW0izt80n4YD/k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jePrOSOC1uqlfhGS7sZHwaUqldJenjmA5kLcqwNvOjNEzJfL4IvJEKwww9Ff1yCgC
	 aEfO27TLj2toQ8yQxkd240zerWQcS5DlqATr1IaBUyO6l0Tns1dk/G8N7LHREikI7V
	 9P0KQ61XVGGAhcSsTt6sOzEEEAEFso45/EFSbrGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99477F80133;
	Fri,  5 Jul 2019 10:10:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C8F0F8011F; Fri,  5 Jul 2019 10:10:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F126F800E1
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 10:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F126F800E1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C8AD79C6AC02954968C4;
 Fri,  5 Jul 2019 16:10:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 5 Jul 2019 16:10:11 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>, Pan Xiuli
 <xiuli.pan@linux.intel.com>
Date: Fri, 5 Jul 2019 08:16:37 +0000
Message-ID: <20190705081637.157169-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: SOF: debug: fix possible memory
	leak in sof_dfsentry_write()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

'string' is malloced in sof_dfsentry_write() and should be freed
before leaving from the error handling cases, otherwise it will cause
memory leak.

Fixes: 091c12e1f50c ("ASoC: SOF: debug: add new debugfs entries for IPC flood test")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/sof/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 54bb53bfc81b..2388477a965e 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -162,7 +162,7 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 	else
 		ret = kstrtoul(string, 0, &ipc_count);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	/* limit max duration/ipc count for flood test */
 	if (flood_duration_test) {
@@ -191,7 +191,7 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 				    "error: debugfs write failed to resume %d\n",
 				    ret);
 		pm_runtime_put_noidle(sdev->dev);
-		return ret;
+		goto out;
 	}
 
 	/* flood test */



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
