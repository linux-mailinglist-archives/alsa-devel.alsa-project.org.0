Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C35954B5E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 15:48:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B7092C09;
	Fri, 16 Aug 2024 15:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B7092C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723816082;
	bh=OcEeJKUD2hFL3w5+/tWjwLg+NxGvIh4I1MmWEJFMtpY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kqoyJUHnqOZSfscLUlGTHOyH2GOwXKrI+/8URF7KkhWxK0jYd/uh4FLU1vUKYd7hN
	 yctCWJo27uyEvBIz5b7dcKnxMZfG8PRGImlvK/RwQYeaqxY91E8f2Rw5SqM3DpDPtV
	 a+7LbvSc+D/H4ZwtQu0K0T6/nnSsgf0l8qWPIT14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BF73F805A9; Fri, 16 Aug 2024 15:47:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA50F805AD;
	Fri, 16 Aug 2024 15:47:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 538D5F80423; Fri, 16 Aug 2024 04:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A67C0F8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 04:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A67C0F8016E
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WlQtC1789zhXrn;
	Fri, 16 Aug 2024 10:29:23 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A66C1800FF;
	Fri, 16 Aug 2024 10:31:21 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 Aug
 2024 10:31:20 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <johannes@sipsolutions.net>, <perex@perex.cz>, <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] ALSA: aoa: Use helper function for_each_child_of_node()
Date: Fri, 16 Aug 2024 10:18:26 +0800
Message-ID: <20240816021826.65190-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-MailFrom: zhangzekun11@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SCQO43F6AT6XATZ4X5X3DN25DZKKS4F4
X-Message-ID-Hash: SCQO43F6AT6XATZ4X5X3DN25DZKKS4F4
X-Mailman-Approved-At: Fri, 16 Aug 2024 11:06:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCQO43F6AT6XATZ4X5X3DN25DZKKS4F4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

for_each_child_of_node can help to iterate through the device_node,
and we don't need to use while loop. No functional change with this
conversion.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 sound/aoa/soundbus/i2sbus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index 5431d2c49421..ce84288168e4 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -335,7 +335,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 
 static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
 {
-	struct device_node *np = NULL;
+	struct device_node *np;
 	int got = 0, err;
 	struct i2sbus_control *control = NULL;
 
@@ -347,7 +347,7 @@ static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
 		return -ENODEV;
 	}
 
-	while ((np = of_get_next_child(dev->ofdev.dev.of_node, np))) {
+	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
 		if (of_device_is_compatible(np, "i2sbus") ||
 		    of_device_is_compatible(np, "i2s-modem")) {
 			got += i2sbus_add_dev(dev, control, np);
-- 
2.17.1

