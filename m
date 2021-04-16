Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F23361CE7
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 12:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A8B01680;
	Fri, 16 Apr 2021 12:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A8B01680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618567308;
	bh=azGRFUOF+qcS4dJ78I4OvaeA8dxt682k9yDqMdOk44A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ax/JJko7ms8Ctn/r+OyhoMFLdJB0o6r980VdzEFX1/M59IZ/+HGZ7qzOEfz3osUfc
	 TV9CgHp5WP3joRIDPCTTeYM8PaB67EqjQdaoB0eLsdEQhaymVQsoxOgBgrCpzAlyiQ
	 RcgML4jqyQklPrT7sATtrX/Fguv2CS++Upvo+JKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2939AF80277;
	Fri, 16 Apr 2021 12:00:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF390F80277; Fri, 16 Apr 2021 12:00:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D34EF8025B
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 12:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D34EF8025B
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0UVk96.i_1618567246; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UVk96.i_1618567246) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 16 Apr 2021 18:00:47 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: seq: oss: Fix inconsistent indenting
Date: Fri, 16 Apr 2021 18:00:44 +0800
Message-Id: <1618567244-5704-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: alsa-devel@alsa-project.org, Yang Li <yang.lee@linux.alibaba.com>,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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

Kernel test robot throws below warning ->

smatch warnings:
sound/core/seq/oss/seq_oss_event.c:297 note_on_event() warn:
inconsistent indenting

Fixed the inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 sound/core/seq/oss/seq_oss_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/oss/seq_oss_event.c b/sound/core/seq/oss/seq_oss_event.c
index 7b7c925..9a42713 100644
--- a/sound/core/seq/oss/seq_oss_event.c
+++ b/sound/core/seq/oss/seq_oss_event.c
@@ -294,7 +294,7 @@
 				/* set volume to zero -- note off */
 			//	type = SNDRV_SEQ_EVENT_NOTEOFF;
 			//else
-				if (info->ch[ch].vel)
+			if (info->ch[ch].vel)
 				/* sample already started -- volume change */
 				type = SNDRV_SEQ_EVENT_KEYPRESS;
 			else
-- 
1.8.3.1

