Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC3AFAF6E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 12:14:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 687091666;
	Wed, 13 Nov 2019 12:14:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 687091666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573643697;
	bh=mQETvawYAjcOtyCyfc3EbzStETggbt0m5v7I5pOFpzA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=byE7APi1qZJlEdLKWwsGt8I1Kaxb42o1v41GUyw7gJbFbF7H+pIuky8NamrOZkd6b
	 w2Cjk1ijbyuTcG5kCzzh5sfKzKjNjPnr5S3ktCcUfv/GRXzB3JKpUCWl56cazVXXGe
	 UpBX0S0eOE+9aBw62zIMAEVzsnzESz3QLflD+xiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A26D9F8007E;
	Wed, 13 Nov 2019 12:13:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7084F8007C; Wed, 13 Nov 2019 12:13:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B8C6F80036
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 12:13:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B8C6F80036
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 31ABBB358;
 Wed, 13 Nov 2019 11:13:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed, 13 Nov 2019 12:12:59 +0100
Message-Id: <20191113111259.24123-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Fix incorrect NULL check in
	create_yamaha_midi_quirk()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The commit 60849562a5db ("ALSA: usb-audio: Fix possible NULL
dereference at create_yamaha_midi_quirk()") added NULL checks in
create_yamaha_midi_quirk(), but there was an overlook.  The code
allows one of either injd or outjd is NULL, but the second if check
made returning -ENODEV if any of them is NULL.  Fix it in a proper
form.

Fixes: 60849562a5db ("ALSA: usb-audio: Fix possible NULL dereference at create_yamaha_midi_quirk()")
Reported-by: Pavel Machek <pavel@denx.de>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0bbe1201a6ac..349e1e52996d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -248,8 +248,8 @@ static int create_yamaha_midi_quirk(struct snd_usb_audio *chip,
 					NULL, USB_MS_MIDI_OUT_JACK);
 	if (!injd && !outjd)
 		return -ENODEV;
-	if (!(injd && snd_usb_validate_midi_desc(injd)) ||
-	    !(outjd && snd_usb_validate_midi_desc(outjd)))
+	if ((injd && !snd_usb_validate_midi_desc(injd)) ||
+	    (outjd && !snd_usb_validate_midi_desc(outjd)))
 		return -ENODEV;
 	if (injd && (injd->bLength < 5 ||
 		     (injd->bJackType != USB_MS_EMBEDDED &&
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
