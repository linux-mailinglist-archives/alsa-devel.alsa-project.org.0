Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B676D2F761C
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 10:59:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A671791;
	Fri, 15 Jan 2021 10:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A671791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610704789;
	bh=A4JGvYLcE7XSaqIBzMe6GVrFCc5QBfz2+9h6yUyFwuU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AD0PH17ymahaAqwCS81+Qw5CksEKH7wOBCs8dLd8mtq6oH89qxZKy1pcCq3MU7YUy
	 oiWBt0tDprvmgpAYy8yXBxrsV+YvcPyRI1u/zAGdFd/vTYvQqKDFiEtEYdVVYjJFT5
	 VPJ9SfHesWFvVtcWzREiVQoNgrIHWiXXCt0ioWg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE246F80113;
	Fri, 15 Jan 2021 10:58:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 496C5F801ED; Fri, 15 Jan 2021 10:58:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0456CF80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 10:57:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0456CF80134
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 076FFB7C6
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 09:57:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Convert remaining strlcpy() to strscpy()
Date: Fri, 15 Jan 2021 10:57:58 +0100
Message-Id: <20210115095758.19707-1-tiwai@suse.de>
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

USB-audio driver still contains two calls of strlcpy() because the
return size is evaluated.  Basically it just checks whether the string
is copied or not, but since strcpy() may return a negative error code,
we should check the negative value and treat as filled.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 85fed017710e..c7da38348035 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -115,11 +115,14 @@ find_map(const struct usbmix_name_map *p, int unitid, int control)
 static int
 check_mapped_name(const struct usbmix_name_map *p, char *buf, int buflen)
 {
+	int len;
+
 	if (!p || !p->name)
 		return 0;
 
 	buflen--;
-	return strlcpy(buf, p->name, buflen);
+	len = strscpy(buf, p->name, buflen);
+	return len < 0 ? buflen : len;
 }
 
 /* ignore the error value if ignore_ctl_error flag is set */
@@ -151,12 +154,15 @@ static int check_mapped_selector_name(struct mixer_build *state, int unitid,
 				      int index, char *buf, int buflen)
 {
 	const struct usbmix_selector_map *p;
+	int len;
 
 	if (!state->selector_map)
 		return 0;
 	for (p = state->selector_map; p->id; p++) {
-		if (p->id == unitid && index < p->count)
-			return strlcpy(buf, p->names[index], buflen);
+		if (p->id == unitid && index < p->count) {
+			len = strscpy(buf, p->names[index], buflen);
+			return len < 0 ? buflen : len;
+		}
 	}
 	return 0;
 }
-- 
2.26.2

