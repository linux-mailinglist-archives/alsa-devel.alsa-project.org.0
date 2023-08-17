Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD98277F411
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 12:11:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 739D5828;
	Thu, 17 Aug 2023 12:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 739D5828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692267071;
	bh=0bPgNhh0iyuJTN9tgU1TLviTl03Jz3/Yy5vk71ilY5M=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iN61Nb0jeLxAS3GK2joTV8OTDy0xMtEyROOINsQSeV0g2Azf+KDltRYrbKz4wUyJZ
	 +pJfTwHE9i/rlWoZcO3k6MGiqmwviDdTCXk3LJS+apYY+2eCb4vIOS/9tSqqsPF4Xk
	 KOGcnuE46HF2MVVjWj6dG/ZVeaaQJSFBc3iPy60s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D389DF801EB; Thu, 17 Aug 2023 12:10:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3334FF8016A;
	Thu, 17 Aug 2023 12:10:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61B01F8016D; Thu, 17 Aug 2023 08:39:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4DCDF800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 08:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4DCDF800D1
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RRFfB1Gz8zFqnZ;
	Thu, 17 Aug 2023 14:36:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 14:39:48 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <alsa-devel@alsa-project.org>, Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] ALSA: pcmtest: Drop unnecessary error check for
 debugfs_create_dir
Date: Thu, 17 Aug 2023 14:39:22 +0800
Message-ID: <20230817063922.282746-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-MailFrom: ruanjinjie@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GINJU54YDJGBKZNZKNHHIGALML2ZSIB4
X-Message-ID-Hash: GINJU54YDJGBKZNZKNHHIGALML2ZSIB4
X-Mailman-Approved-At: Thu, 17 Aug 2023 10:10:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GINJU54YDJGBKZNZKNHHIGALML2ZSIB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch removes the error checking for debugfs_create_dir in
pcmtest.c. This is because the DebugFS kernel API is developed
in a way that the caller can safely ignore the errors that
occur during the creation of DebugFS nodes. The debugfs APIs have
a IS_ERR() judge in start_creating() which can handle it
gracefully. So these checks are unnecessary.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 sound/drivers/pcmtest.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 7f170429eb8f..9360b3bb771e 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -669,8 +669,6 @@ static int init_debug_files(int buf_count)
 	char len_file_name[32];
 
 	driver_debug_dir = debugfs_create_dir("pcmtest", NULL);
-	if (IS_ERR(driver_debug_dir))
-		return PTR_ERR(driver_debug_dir);
 	debugfs_create_u8("pc_test", 0444, driver_debug_dir, &playback_capture_test);
 	debugfs_create_u8("ioctl_test", 0444, driver_debug_dir, &ioctl_reset_test);
 
-- 
2.34.1

