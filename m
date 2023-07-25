Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF835761803
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 14:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A8F3152E;
	Tue, 25 Jul 2023 14:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A8F3152E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690286818;
	bh=J+tBGuQ0eU9onlKlCOCPlRcHCX8QbZAC8Axq0IXaty4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oJO3QgA64shfXeL1DubUrmRokzQi8Yf0tpR7qaZOrkjkb7gJdcjTX0ECv5FKfRjCX
	 04SL9dXhjS41mm+UL5fBpgvxvvq4f4dfqgjhvRFlG7ZVaBVYWh96GdvrvvT8qGOrJQ
	 kJupKbXsP417mQXTl1gFhujr9Z3pGCwITHu234Bs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C30FCF80149; Tue, 25 Jul 2023 14:05:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77714F80163;
	Tue, 25 Jul 2023 14:05:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 380DEF8019B; Tue, 25 Jul 2023 14:05:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B71EF800C7;
	Tue, 25 Jul 2023 14:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B71EF800C7
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R9Fxq4LlczCrJq;
	Tue, 25 Jul 2023 20:01:51 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 20:05:13 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 25 Jul
 2023 20:05:13 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>
CC: <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <daniel.baluta@nxp.com>,
	<kai.vehmanen@linux.intel.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next] ASoC: SOF: ipc3-dtrace: Switch to memdup_user_nul()
 helper
Date: Tue, 25 Jul 2023 20:02:47 +0800
Message-ID: <20230725120247.509422-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Message-ID-Hash: X34NAB3B33GNN5FMO6BMIEFGIA6ZRPR2
X-Message-ID-Hash: X34NAB3B33GNN5FMO6BMIEFGIA6ZRPR2
X-MailFrom: yangyingliang@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X34NAB3B33GNN5FMO6BMIEFGIA6ZRPR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use memdup_user_nul() helper instead of open-coding to
simplify the code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/sof/ipc3-dtrace.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 35da85a45a9a..bd07f0472efd 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -196,15 +196,9 @@ static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user
 		return -EINVAL;
 	}
 
-	string = kmalloc(count + 1, GFP_KERNEL);
-	if (!string)
-		return -ENOMEM;
-
-	if (copy_from_user(string, from, count)) {
-		ret = -EFAULT;
-		goto error;
-	}
-	string[count] = '\0';
+	string = memdup_user_nul(from, count);
+	if (IS_ERR(string))
+		return PTR_ERR(string);
 
 	ret = trace_filter_parse(sdev, string, &num_elems, &elems);
 	if (ret < 0)
-- 
2.25.1

