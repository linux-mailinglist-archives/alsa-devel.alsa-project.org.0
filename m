Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E583636EA
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 19:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4252165D;
	Sun, 18 Apr 2021 19:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4252165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618765341;
	bh=bh9qjoiFPf7U3yaB/ce9/qCD/eSLnr0GyiNAi3QDW+0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lwK26sPrS8fxprDratBaHbLqTFtWA3gkno4e3kNWMDA4W2IEj32UwmVZ8uVVL2SsP
	 7L7dU7PJVKd4fFJ7byeeA82/mHEOKEetavbKtPujj0EkIu0vttwhXKv3/PlPH7yCB0
	 KMzrl0nRHQZJubCbq6ndzYUYQHx795ktudvPbOBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FBBBF8013C;
	Sun, 18 Apr 2021 19:00:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A682BF80253; Sun, 18 Apr 2021 19:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02F2EF8013C
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 19:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02F2EF8013C
Received: from hellmouth.base.nu (localhost [127.0.0.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id fdfe1fc6;
 Sun, 18 Apr 2021 17:00:42 +0000 (UTC)
Received: from localhost.localdomain ([88.97.23.37])
 by hellmouth.base.nu with ESMTPSA id vbTLE7plfGCVPgAADaPQrA
 (envelope-from <livvy@base.nu>); Sun, 18 Apr 2021 17:00:42 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: DJM-750: ensure format is set
Date: Sun, 18 Apr 2021 17:59:01 +0100
Message-Id: <20210418165901.25776-1-livvy@base.nu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Olivia Mackintosh <livvy@base.nu>
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

Add case statement to set sample-rate for the DJM-750 Pioneer
mixer. This was included as part of another patch but I think it has
been archived on Patchwork and hasn't been merged.

Signed-off-by: Olivia Mackintosh <livvy@base.nu>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 63f27ce64bcb..8b8bee3c3dd6 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1511,6 +1511,7 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x2b73, 0x0013): /* Pioneer DJM-450 */
 		pioneer_djm_set_format_quirk(subs, 0x0082);
 		break;
+	case USB_ID(0x08e4, 0x017f): /* Pioneer DJM-750 */
 	case USB_ID(0x08e4, 0x0163): /* Pioneer DJM-850 */
 		pioneer_djm_set_format_quirk(subs, 0x0086);
 		break;
-- 
2.31.1

