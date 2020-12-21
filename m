Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EED2DF9B5
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Dec 2020 09:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99554173A;
	Mon, 21 Dec 2020 09:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99554173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608537830;
	bh=D+mB6g9mEHWZkNp68ct078z4Kw2DAIZeC3+0HH1+lOk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gT6R0tWoLswBN8Fz7cGBzo1d3dFKhv4paHmyiBh130JuiHZ7ohAp2qpdRHPVlSFYG
	 9glQUs8B6SBgZlA4Lvo4+jpKjmYmfyY+cZiGIovItDyyHcSGFXHEjbH3/dJRXMuajR
	 fzEadRY25V3I/rMG9k+BQPU/u6uY9GQ/aPxIPoJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF55F80168;
	Mon, 21 Dec 2020 09:02:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F389F801D5; Mon, 21 Dec 2020 09:02:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD05AF800E4
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 09:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD05AF800E4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D041DACF5
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 08:02:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add alias entry for ASUS PRIME TRX40 PRO-S
Date: Mon, 21 Dec 2020 09:01:59 +0100
Message-Id: <20201221080159.24468-1-tiwai@suse.de>
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

ASUS PRIME TRX40 PRO-S mobo with 0b05:1918 needs the same quirk alias
for another ASUS mobo (0b05:1917) for the proper mixer mapping, etc.
Add the corresponding entry.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210783
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index cb0b6582dfee..d731ca62d599 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -383,6 +383,9 @@ static const struct usb_audio_device_name usb_audio_names[] = {
 	/* ASUS ROG Strix */
 	PROFILE_NAME(0x0b05, 0x1917,
 		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
+	/* ASUS PRIME TRX40 PRO-S */
+	PROFILE_NAME(0x0b05, 0x1918,
+		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
 
 	/* Dell WD15 Dock */
 	PROFILE_NAME(0x0bda, 0x4014, "Dell", "WD15 Dock", "Dell-WD15-Dock"),
-- 
2.26.2

