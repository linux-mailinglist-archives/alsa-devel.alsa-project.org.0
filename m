Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DE1B0389
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 09:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E17CF1658;
	Mon, 20 Apr 2020 09:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E17CF1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587369442;
	bh=Dih48ZxusvcYTURpzTEEzWUrSaMZW63DPGj5mOsPkRo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jGCBEI88bQxmvRIycjofx2EqU0h1rtm+o4xnFRqs6nWzR85KP36SKubseeyniYT16
	 M3pDqiuWa3LHQkHp7Ze5EamLHS+0FBleIt8QJY/fF0DVmRl6hpl8WmJ9yHMBoFiQ+T
	 mz36IBBWws9iExuRbfRxA/dAGZcJlRXKAIIeVOfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D42F8020C;
	Mon, 20 Apr 2020 09:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36BBBF801D9; Mon, 20 Apr 2020 09:55:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F135F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 09:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F135F8012F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C84D2AF30;
 Mon, 20 Apr 2020 07:55:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usx2y: Fix potential NULL dereference
Date: Mon, 20 Apr 2020 09:55:29 +0200
Message-Id: <20200420075529.27203-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Lin Yi <teroincn@gmail.com>
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

The error handling code in usX2Y_rate_set() may hit a potential NULL
dereference when an error occurs before allocating all us->urb[].
Add a proper NULL check for fixing the corner case.

Reported-by: Lin Yi <teroincn@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/usbusx2yaudio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index 37d290fe9d43..ecaf41265dcd 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -681,6 +681,8 @@ static int usX2Y_rate_set(struct usX2Ydev *usX2Y, int rate)
 			us->submitted =	2*NOOF_SETRATE_URBS;
 			for (i = 0; i < NOOF_SETRATE_URBS; ++i) {
 				struct urb *urb = us->urb[i];
+				if (!urb)
+					continue;
 				if (urb->status) {
 					if (!err)
 						err = -ENODEV;
-- 
2.16.4

