Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB975C6D9
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 14:25:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA341FA;
	Fri, 21 Jul 2023 14:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA341FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689942306;
	bh=JD3DA7FWnk4rDwR+K2o083cTF4lv08vGj1BSNFLUw04=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YClqjaQoP+Idb3DBwr217GM1nX0CQ0cfrxB7YYfppbJj8qcbJUckmCvsfn4U2D+pG
	 dUl688helMWSRscCZi+3ZktcfIqn8z2ZTDheI+mZg2+n1i96Lr32nr+YKKSxr9v5Dz
	 VMIOa4VSMvZvJIU3hKBSRvjhICEqQpky6tCnXdH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 364A7F80527; Fri, 21 Jul 2023 14:23:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76243F8032D;
	Fri, 21 Jul 2023 14:23:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66624F8047D; Fri, 21 Jul 2023 12:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C18C0F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 12:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C18C0F8027B
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R6lQP6nvYzrRsG;
	Fri, 21 Jul 2023 17:59:25 +0800 (CST)
Received: from octopus.huawei.com (10.67.174.191) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 18:00:12 +0800
From: Wang Weiyang <wangweiyang2@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<wangweiyang2@huawei.com>
Subject: [PATCH -next] ALSA: seq: remove redundant unsigned comparison to zero
Date: Fri, 21 Jul 2023 18:31:24 +0800
Message-ID: <20230721103124.18522-1-wangweiyang2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.191]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-MailFrom: wangweiyang2@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 37VCITAXI5Z74MQH5A64KPUAXDLXCB65
X-Message-ID-Hash: 37VCITAXI5Z74MQH5A64KPUAXDLXCB65
X-Mailman-Approved-At: Fri, 21 Jul 2023 12:23:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37VCITAXI5Z74MQH5A64KPUAXDLXCB65/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since struct snd_ump_block_info::first_group is unsigned char, comparison
to zero is redundant

Signed-off-by: Wang Weiyang <wangweiyang2@huawei.com>
---
 sound/core/seq/seq_ump_client.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index fe21c801af74..f26a1812dfa7 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -298,8 +298,7 @@ static void update_group_attrs(struct seq_ump_client *client)
 	}
 
 	list_for_each_entry(fb, &client->ump->block_list, list) {
-		if (fb->info.first_group < 0 ||
-		    fb->info.first_group + fb->info.num_groups > SNDRV_UMP_MAX_GROUPS)
+		if (fb->info.first_group + fb->info.num_groups > SNDRV_UMP_MAX_GROUPS)
 			break;
 		group = &client->groups[fb->info.first_group];
 		for (i = 0; i < fb->info.num_groups; i++, group++) {
-- 
2.25.1

