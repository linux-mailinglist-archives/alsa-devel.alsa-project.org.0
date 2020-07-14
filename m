Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9721F844
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC31166E;
	Tue, 14 Jul 2020 19:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC31166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594747981;
	bh=w6v9WELdzE/dfeUwpZdYj+GMZo13q9Yofr2BKmpP1FI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jYN7KgnkDZ47wDJxwet0GBdLWMkZiHviI4LkeMIGVpL1bKSrJUy/gY0QTrulb2FLs
	 RD9QDST/MEvhKQbDzSoa4B+bqcqfQSxY8cQKNPFYCQSFlIjwFAjJkwHQon0kg7jcoU
	 QN1K/I1zvzHG/TN/f4cW6aAhHHT9b1o6mqsVWVR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7481F80306;
	Tue, 14 Jul 2020 19:27:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E87A1F802F9; Tue, 14 Jul 2020 19:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54A1CF802BC
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A1CF802BC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77152AD79
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/10] ALSA: usb-audio: Replace blacklist word
Date: Tue, 14 Jul 2020 19:26:31 +0200
Message-Id: <20200714172631.25371-11-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200714172631.25371-1-tiwai@suse.de>
References: <20200714172631.25371-1-tiwai@suse.de>
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

Follow the recent inclusive terminology guidelines and replace the
word "blacklist" appropriately.

Only a comment fix, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks-table.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 4ec491011b19..336d81bb5fd1 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -127,7 +127,7 @@
 /*
  * HP Wireless Audio
  * When not ignored, causes instability issues for some users, forcing them to
- * blacklist the entire module.
+ * skip the entire module.
  */
 {
 	USB_DEVICE(0x0424, 0xb832),
-- 
2.16.4

