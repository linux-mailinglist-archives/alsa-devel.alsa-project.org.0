Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5F4A4E8D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jan 2022 19:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B543C1620;
	Mon, 31 Jan 2022 19:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B543C1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643654240;
	bh=DnXhFAGWRC1c19WVXbcduyTvpHjO7t6osxp9bE7zzBM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZYdTEC0p6OPxyeOSXUQIgUDaTKmCl6YmmY/94FnY2uRcd9+5IKZY/oJL0cvzOGT1C
	 07P2JCDltFwSd01E9+JgVpDxMAEDFZYpnJd3Wql0lhHFpUhGP5JNWdJfY0VTCwDzeh
	 iXVTWXvEal/ZeH0IUYhXTDQK6cG/klLueO3ZXzH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D314FF80302;
	Mon, 31 Jan 2022 19:36:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C8F3F8028B; Mon, 31 Jan 2022 19:36:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.hahnjo.de (backus.hahnjo.de [193.30.122.186])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AE30F800CE
 for <alsa-devel@alsa-project.org>; Mon, 31 Jan 2022 19:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AE30F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hahnjo.de header.i=@hahnjo.de
 header.b="pAchqnRz"
Received: from Jonas-Dell.home (unknown
 [IPv6:2a01:cb15:40c:c100:cf0a:528a:fee7:c993])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hahnjo.de (Postfix) with ESMTPSA id E391D5870138;
 Mon, 31 Jan 2022 19:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hahnjo.de; s=default;
 t=1643654164; bh=DnXhFAGWRC1c19WVXbcduyTvpHjO7t6osxp9bE7zzBM=;
 h=From:To:Cc:Subject:Date;
 b=pAchqnRzQbyD6A+ShzZNlceg6D8ZM/iB8q64fAIK31HXUD/l40ut7gDmY7lfgxAj3
 oY4fw3oJa6pz98QgdyrxvUAaB2PBjtlaAZp4iIttE3Lv4QMGUa2/0GtDV65679hVef
 iSGyoUFjlO385DSynUwrUhXJ/3ioDKPL662iH4CQSsLDgCBJ1YhY1GUOhmkzGs57M7
 GLXUGWxFu+dX9FXBFydVuygrSIXq991ZhpS2XWUjaj+zWXpCV4y+ffWF8YdLCDsPcx
 /UvLQxdLDyxnAUFJc9iV007eL++4NBBdHuBjb1k04I49XopB+f/ovXHE32cY0sMZT7
 cjUA/jMnUwYyA==
From: Jonas Hahnfeld <hahnjo@hahnjo.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: Correct quirk for VF0770
Date: Mon, 31 Jan 2022 19:35:16 +0100
Message-Id: <20220131183516.61191-1-hahnjo@hahnjo.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jukka Heikintalo <heikintalo.jukka@gmail.com>,
 =?UTF-8?q?Pawe=C5=82=20Susicki?= <pawel.susicki@gmail.com>,
 Jonas Hahnfeld <hahnjo@hahnjo.de>
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

This device provides both audio and video. The original quirk added in
commit 48827e1d6af5 ("ALSA: usb-audio: Add quirk for VF0770") used
USB_DEVICE to match the vendor and product ID. Depending on module order,
if snd-usb-audio was asked first, it would match the entire device and
uvcvideo wouldn't get to see it. Change the matching to USB_AUDIO_DEVICE
to restore uvcvideo matching in all cases.

Fixes: 48827e1d6af5 ("ALSA: usb-audio: Add quirk for VF0770")
Reported-by: Jukka Heikintalo <heikintalo.jukka@gmail.com>
Tested-by: Jukka Heikintalo <heikintalo.jukka@gmail.com>
Reported-by: Paweł Susicki <pawel.susicki@gmail.com>
Tested-by: Paweł Susicki <pawel.susicki@gmail.com>
Cc: <stable@vger.kernel.org> # 5.4, 5.10, 5.14, 5.15
Signed-off-by: Jonas Hahnfeld <hahnjo@hahnjo.de>
---
 sound/usb/quirks-table.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index b1522e43173e..0ea39565e623 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -84,7 +84,7 @@
  * combination.
  */
 {
-	USB_DEVICE(0x041e, 0x4095),
+	USB_AUDIO_DEVICE(0x041e, 0x4095),
 	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
 		.ifnum = QUIRK_ANY_INTERFACE,
 		.type = QUIRK_COMPOSITE,
-- 
2.35.1

