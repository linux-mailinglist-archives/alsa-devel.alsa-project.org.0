Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B653A63193E
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 05:37:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CAF71ED;
	Mon, 21 Nov 2022 05:36:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CAF71ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669005453;
	bh=Sqk7jYs8/U2E0E9P4GtwHoBMGORi4kNHTogIGEGQtl8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bsua+z0UNvO+5Zu3WfsD0bhGDOr7Lk09Vp6BBaOklhKCMWij9EDXtreXt/koo8f8y
	 RjrVjd55rLJm1CXpSobJnlOKQy3mq6OdyRd8T15385xHpXTm/oaTw/qWXZvLj8mqRH
	 3Ja2X1I7uv4O8X9XIf1ICMoihoovgibbXsZWFL2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DC27F804AB;
	Mon, 21 Nov 2022 05:36:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4F65F80115; Mon, 21 Nov 2022 05:36:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96E35F80115
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 05:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96E35F80115
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NFvhv1CvbzRpQf;
 Mon, 21 Nov 2022 12:35:59 +0800 (CST)
Received: from huawei.com (10.175.104.82) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 21 Nov
 2022 12:36:25 +0800
From: Baisong Zhong <zhongbaisong@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ALSA: seq: fix undefined behavior in bit shift for
 SNDRV_SEQ_FILTER_USE_EVENT
Date: Mon, 21 Nov 2022 12:36:25 +0800
Message-ID: <20221121043625.2910001-1-zhongbaisong@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
Cc: zhongbaisong@huawei.com, tiwai@suse.com
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

Shifting signed 32-bit value by 31 bits is undefined, so changing
significant bit to unsigned. The UBSAN warning calltrace like below:

UBSAN: shift-out-of-bounds in sound/core/seq/seq_clientmgr.c:509:22
left shift of 1 by 31 places cannot be represented in type 'int'
...
Call Trace:
 <TASK>
 dump_stack_lvl+0x8d/0xcf
 ubsan_epilogue+0xa/0x44
 __ubsan_handle_shift_out_of_bounds+0x1e7/0x208
 snd_seq_deliver_single_event.constprop.21+0x191/0x2f0
 snd_seq_deliver_event+0x1a2/0x350
 snd_seq_kernel_client_dispatch+0x8b/0xb0
 snd_seq_client_notify_subscription+0x72/0xa0
 snd_seq_ioctl_subscribe_port+0x128/0x160
 snd_seq_kernel_client_ctl+0xce/0xf0
 snd_seq_oss_create_client+0x109/0x15b
 alsa_seq_oss_init+0x11c/0x1aa
 do_one_initcall+0x80/0x440
 kernel_init_freeable+0x370/0x3c3
 kernel_init+0x1b/0x190
 ret_from_fork+0x1f/0x30
 </TASK>

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Baisong Zhong <zhongbaisong@huawei.com>
---
 include/uapi/sound/asequencer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index 6d4a2c60808d..4c5c4dd15d02 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -331,7 +331,7 @@ typedef int __bitwise snd_seq_client_type_t;
 #define SNDRV_SEQ_FILTER_BROADCAST	(1<<0)	/* accept broadcast messages */
 #define SNDRV_SEQ_FILTER_MULTICAST	(1<<1)	/* accept multicast messages */
 #define SNDRV_SEQ_FILTER_BOUNCE		(1<<2)	/* accept bounce event in error */
-#define SNDRV_SEQ_FILTER_USE_EVENT	(1<<31)	/* use event filter */
+#define SNDRV_SEQ_FILTER_USE_EVENT	(1U<<31)	/* use event filter */
 
 struct snd_seq_client_info {
 	int client;			/* client number to inquire */
-- 
2.17.1

