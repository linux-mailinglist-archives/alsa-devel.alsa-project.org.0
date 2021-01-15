Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB622F7634
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 11:06:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DFAC1796;
	Fri, 15 Jan 2021 11:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DFAC1796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610705184;
	bh=7eihApRRbFgZXVcGSaJ7DiiBTvVOd5M5/cE8j2wmXzA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=au39bP9HeuomzhQtKVxSXVVkox1QsQk1FBLBVRuDcPxTngU9FZHtq4x/Lpku53nIr
	 /hHVDf6ifxOFwh+i6IR4MZpyJ6JAAut/hFYEkMzzhnveEcKmk3fSNx1pnbyvOVHjK5
	 MAw74qBIoZ/haGOsz9z1Bdqe+EQKplIbshflB+I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2378F8016D;
	Fri, 15 Jan 2021 11:04:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DC9BF801ED; Fri, 15 Jan 2021 11:04:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AA34F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 11:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA34F80113
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 368CBB7D1
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 10:04:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Convert the last strlcpy() usage
Date: Fri, 15 Jan 2021 11:04:37 +0100
Message-Id: <20210115100437.20906-1-tiwai@suse.de>
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

The last remaining usage of strlcpy() in USB-audio driver is the setup
of the card longname string.  Basically we need to know whether any
non-empty string is set or not, and no real length is needed.
Refactor the code and use strscpy() instead.  After this change,
strlcpy() is gone from all sound/* code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I forgot to submit this as well in the previous patch, but they are
applied independently.

 sound/usb/card.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 85e79b9ecb08..45407cb81b66 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -514,18 +514,17 @@ static void usb_audio_make_longname(struct usb_device *dev,
 		s = preset->vendor_name;
 	else if (quirk && quirk->vendor_name)
 		s = quirk->vendor_name;
+	*card->longname = 0;
 	if (s && *s) {
-		len = strlcpy(card->longname, s, sizeof(card->longname));
+		strscpy(card->longname, s, sizeof(card->longname));
 	} else {
 		/* retrieve the vendor and device strings as longname */
 		if (dev->descriptor.iManufacturer)
-			len = usb_string(dev, dev->descriptor.iManufacturer,
-					 card->longname, sizeof(card->longname));
-		else
-			len = 0;
+			usb_string(dev, dev->descriptor.iManufacturer,
+				   card->longname, sizeof(card->longname));
 		/* we don't really care if there isn't any vendor string */
 	}
-	if (len > 0) {
+	if (*card->longname) {
 		strim(card->longname);
 		if (*card->longname)
 			strlcat(card->longname, " ", sizeof(card->longname));
-- 
2.26.2

