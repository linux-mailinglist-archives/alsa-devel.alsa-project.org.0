Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF99A251DD5
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 19:10:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71DC01690;
	Tue, 25 Aug 2020 19:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71DC01690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598375405;
	bh=UOuSNAWDju0dLmDrA2vvgztVzbwg7NHnbNtsukXxtWc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O9FHgq65/x4o+doRAL5BDFC0L05mMQ+BBBEwK2Q6UoHjjKUzW15dmyYNx7m40i69q
	 aALZ3m5c/UYvaR9wabRmeQvHlf1vc3s1xrrAea+8iMPRoYkoV7x+SbU9AVgaQWvcAo
	 BNCgHThBLNISqTbZOvMJX1pfY8iZemULHuuFlo24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E852F80260;
	Tue, 25 Aug 2020 19:08:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6785BF8025A; Tue, 25 Aug 2020 19:08:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B18A1F800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 19:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B18A1F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net
 header.b="aZPNzqp+"
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id D0B7B160060
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 19:08:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1598375291; bh=UOuSNAWDju0dLmDrA2vvgztVzbwg7NHnbNtsukXxtWc=;
 h=From:To:Cc:Subject:Date:From;
 b=aZPNzqp+si1w8gOKDAI+en/NGd5juYAPoFzggG7UFaz1PgeeCrt3rk8wZyCzWITzu
 pP2y3EJrOb2avcDAWy0HgV0+V4DEs7Tkv7gWjkQy7jam2KdCOJ/pg7XGmIWgUPpsdn
 4BXvrkt59W2d6A4l6skIhnWMJKn9twnfEXLOIR3MG2ImbFv/MfnS6EWYp/yVlHHVnq
 F7hLoJvop8UaqrZKYLmXHNA6MSH3cUtBclXxldv8lEMsrFB439XThfLkQ1IvjjqlgO
 WVjUsuIYeaemoGNVW4gI1SJjbbWOC70GC9hepq5yyFJ3B9tE7FafG7LYcaAXGvEZtH
 ZeWayzz4mlsWg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Bbb6L5r73z9rxN;
 Tue, 25 Aug 2020 19:08:10 +0200 (CEST)
From: Joshua Sivec <sivec@posteo.net>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for UR22C
Date: Tue, 25 Aug 2020 18:55:18 +0200
Message-Id: <20200825165515.8239-1-sivec@posteo.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Joshua Sivec <sivec@posteo.net>, tiwai@suse.com
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

This uses the same quirk as the Motu and SSL2 devices.
Tested on the UR22C.

Fixes bug 208851.

Signed-off-by: Joshua Sivec <sivec@posteo.net>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208851
---
 sound/usb/pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 5600751803cf..10d342270dd9 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -369,6 +369,7 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
 	case USB_ID(0x31e9, 0x0001): /* Solid State Logic SSL2 */
 	case USB_ID(0x31e9, 0x0002): /* Solid State Logic SSL2+ */
+	case USB_ID(0x0499, 0x172f): /* Steinberg UR22C */
 	case USB_ID(0x0d9a, 0x00df): /* RTX6001 */
 		ep = 0x81;
 		ifnum = 2;
-- 
2.26.2

