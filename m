Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E02D4697
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 17:20:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612F716AC;
	Wed,  9 Dec 2020 17:19:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612F716AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607530820;
	bh=0BmnoaGAY0PuBn5d+HBN2+hPUcbvMiVDrX/7GWjpJtg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lo5eS0KQlT0qAxCUYKo44ndycQx2of+R7d6ZEu8+9WQkm+Yv9LDzUzmDQH5hZa88g
	 pshzjr+DioUMbmlOudGGw/mpmOJGdgvrH+O6Yc11lZa787HAud5UQw7szoXssHb99V
	 GEIonij11v3B9JD6E/+dR3qB1Cle9yzqdoVn6CtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B2AAF80217;
	Wed,  9 Dec 2020 17:18:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38A48F8020D; Wed,  9 Dec 2020 17:18:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ABD7F800EF
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 17:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ABD7F800EF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2DE1AD89;
 Wed,  9 Dec 2020 16:18:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add implicit fb support for Steinberg UR22
Date: Wed,  9 Dec 2020 17:18:35 +0100
Message-Id: <20201209161835.13625-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: meschi@posteo.de
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

Steinberg UR22 (with USB ID 0499:1509) requires the implicit feedback
for the proper playback, otherwise it causes occasional cracks.
This patch adds the corresponding the quirk table entry with the
recently added generic implicit fb support.

Reported-and-tested-by: Kilian <meschi@posteo.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 386198b36b87..4e911d200562 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -42,6 +42,7 @@ struct snd_usb_implicit_fb_match {
 /* Implicit feedback quirk table for playback */
 static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 	/* Generic matching */
+	IMPLICIT_FB_GENERIC_DEV(0x0499, 0x1509), /* Steinberg UR22 */
 	IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2080), /* M-Audio FastTrack Ultra */
 	IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2081), /* M-Audio FastTrack Ultra */
 	IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2030), /* M-Audio Fast Track C400 */
-- 
2.26.2

