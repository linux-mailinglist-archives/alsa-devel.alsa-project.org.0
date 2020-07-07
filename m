Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D16221A20A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 16:24:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C226D1612;
	Thu,  9 Jul 2020 16:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C226D1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594304648;
	bh=t/22JcxJNUFMFODqJBSezaZ6qN9Phxzm7crjUgSjxiw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P0T2YvSi+QQxMWjPrDfh4GYM7Pq7w6W100go0h6KuXFXc9ZRXsjPCBc0km2c8Kfoq
	 IcnFIgVNhKu+9g/dQSHg2dV6pLWhlKvNs3NXB8dkzyJKw4DlyQKjkHK0C5g60LsBJN
	 NMudz/TGgIDVEmDms/ACtnqjBUHGvMj7fZT/AyoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C04FEF801F9;
	Thu,  9 Jul 2020 16:22:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D289AF80216; Tue,  7 Jul 2020 13:45:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23CDEF800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 13:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23CDEF800DF
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 15C503D8B48ABFE1F3AD;
 Tue,  7 Jul 2020 19:44:59 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notes_smtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id 067Bimif058681;
 Tue, 7 Jul 2020 19:44:48 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020070719450240-4209657 ;
 Tue, 7 Jul 2020 19:45:02 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: timur@kernel.org
Subject: [PATCH] ASoC: fsl: mpc8610_hpcd: Add missing of_node_put()
Date: Tue, 7 Jul 2020 19:47:47 +0800
Message-Id: <1594122467-11615-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-07-07 19:45:02,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-07-07 19:44:51, Serialize complete at 2020-07-07 19:44:51
X-MAIL: mse-fl1.zte.com.cn 067Bimif058681
X-Mailman-Approved-At: Thu, 09 Jul 2020 16:22:25 +0200
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org, wang.liang82@zte.com.cn,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 Liao Pingfang <liao.pingfang@zte.com.cn>, xue.zhihong@zte.com.cn,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

From: Liao Pingfang <liao.pingfang@zte.com.cn>

After finishing using device node got from of_find_compatible_node(),
of_node_put() needs to be called.

Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
---
 sound/soc/fsl/mpc8610_hpcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/mpc8610_hpcd.c b/sound/soc/fsl/mpc8610_hpcd.c
index f7bd900..b3090fe 100644
--- a/sound/soc/fsl/mpc8610_hpcd.c
+++ b/sound/soc/fsl/mpc8610_hpcd.c
@@ -426,9 +426,11 @@ static int __init mpc8610_hpcd_init(void)
 	guts_np = of_find_compatible_node(NULL, NULL, "fsl,mpc8610-guts");
 	if (of_address_to_resource(guts_np, 0, &res)) {
 		pr_err("mpc8610-hpcd: missing/invalid global utilities node\n");
+		of_node_put(guts_np);
 		return -EINVAL;
 	}
 	guts_phys = res.start;
+	of_node_put(guts_np);
 
 	return platform_driver_register(&mpc8610_hpcd_driver);
 }
-- 
2.9.5

