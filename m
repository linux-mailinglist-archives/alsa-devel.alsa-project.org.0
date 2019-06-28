Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA5597FE
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 11:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CBEB1685;
	Fri, 28 Jun 2019 11:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CBEB1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561715807;
	bh=F1aaGL+pi+KGwYf3UmyIyOa9qsyYx5+RNAexqu8XKXI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GZ2tCsUCNng1NJTBrcfatHCAby6XILmXfrJyZ3NAkAHAVjOE4VcsymQXPZ1NDyIFz
	 ZCHTks2p6svYGP80IIunCUXzo1YCJp4PSeBSA26UYsZRKove2n8jmVPygRyd29wx2r
	 ptNTsIl43mDT0uBps+UaUllYRSkgcl5+/vs3VmYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E42CCF896CB;
	Fri, 28 Jun 2019 11:55:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A605F896B9; Fri, 28 Jun 2019 11:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0423AF80C0B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 11:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0423AF80C0B
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgnaP-00008U-QV; Fri, 28 Jun 2019 09:54:29 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Date: Fri, 28 Jun 2019 10:54:29 +0100
Message-Id: <20190628095429.13369-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: seq: fix incorrect order of
	dest_client/dest_ports arguments
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

From: Colin Ian King <colin.king@canonical.com>

There are two occurrances of a call to snd_seq_oss_fill_addr where
the dest_client and dest_port arguments are in the wrong order. Fix
this by swapping them around.

Addresses-Coverity: ("Arguments in wrong order")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/core/seq/oss/seq_oss_ioctl.c | 2 +-
 sound/core/seq/oss/seq_oss_rw.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_ioctl.c b/sound/core/seq/oss/seq_oss_ioctl.c
index 96ad01fb668c..ccf682689ec9 100644
--- a/sound/core/seq/oss/seq_oss_ioctl.c
+++ b/sound/core/seq/oss/seq_oss_ioctl.c
@@ -49,7 +49,7 @@ static int snd_seq_oss_oob_user(struct seq_oss_devinfo *dp, void __user *arg)
 	if (copy_from_user(ev, arg, 8))
 		return -EFAULT;
 	memset(&tmpev, 0, sizeof(tmpev));
-	snd_seq_oss_fill_addr(dp, &tmpev, dp->addr.port, dp->addr.client);
+	snd_seq_oss_fill_addr(dp, &tmpev, dp->addr.client, dp->addr.port);
 	tmpev.time.tick = 0;
 	if (! snd_seq_oss_process_event(dp, (union evrec *)ev, &tmpev)) {
 		snd_seq_oss_dispatch(dp, &tmpev, 0, 0);
diff --git a/sound/core/seq/oss/seq_oss_rw.c b/sound/core/seq/oss/seq_oss_rw.c
index 79ef430e56e1..537d5f423e20 100644
--- a/sound/core/seq/oss/seq_oss_rw.c
+++ b/sound/core/seq/oss/seq_oss_rw.c
@@ -161,7 +161,7 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec *rec, struct file *opt)
 	memset(&event, 0, sizeof(event));
 	/* set dummy -- to be sure */
 	event.type = SNDRV_SEQ_EVENT_NOTEOFF;
-	snd_seq_oss_fill_addr(dp, &event, dp->addr.port, dp->addr.client);
+	snd_seq_oss_fill_addr(dp, &event, dp->addr.client, dp->addr.port);
 
 	if (snd_seq_oss_process_event(dp, rec, &event))
 		return 0; /* invalid event - no need to insert queue */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
