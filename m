Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACA32CEC6
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 09:51:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F9F01ABD;
	Thu,  4 Mar 2021 09:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F9F01ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614847911;
	bh=NnNe0o1RVyCr+YfV6EXgmaMLs4+VvI+gI0aw0syz2so=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SlahKdqSr6cnPaQfbja2HweWosdcN1eYgQ46ojkLg7nKLhH+j4ElS52zC9BtEZoS0
	 ejoBum1y00uIE3LPVRh7znhFljK/gWODdl11kLWjRBmSnNGcI2zSExU6Cb8Mt2rpoo
	 3s3SOA+Jd7fOL5o4liggrgtCmHj1HQHxwnuTgz20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7B42F8007E;
	Thu,  4 Mar 2021 09:50:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A236F80269; Thu,  4 Mar 2021 09:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DC5AF800ED
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 09:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DC5AF800ED
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49370AD87
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 08:50:11 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Apply the control quirk to Plantronics
 headsets
Date: Thu,  4 Mar 2021 09:50:09 +0100
Message-Id: <20210304085009.4770-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Other Plantronics headset models seem requiring the same workaround as
C320-M to add the 20ms delay for the control messages, too.  Apply the
workaround generically for devices with the vendor ID 0x047f.

Note that the problem didn't surface before 5.11 just with luck.
Since 5.11 got a big code rewrite about the stream handling, the
parameter setup procedure has changed, and this seemed triggering the
problem more often.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1182552
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0864692d8a7b..84e5dd66a56b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1671,10 +1671,10 @@ void snd_usb_ctl_msg_quirk(struct usb_device *dev, unsigned int pipe,
 		msleep(20);
 
 	/*
-	 * Plantronics C320-M needs a delay to avoid random
-	 * microhpone failures.
+	 * Plantronics headsets (C320, C320-M, etc) need a delay to avoid
+	 * random microhpone failures.
 	 */
-	if (chip->usb_id == USB_ID(0x047f, 0xc025)  &&
+	if (USB_ID_VENDOR(chip->usb_id) == 0x047f &&
 	    (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
 		msleep(20);
 
-- 
2.26.2

