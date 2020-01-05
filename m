Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F731306C7
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 09:20:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EACBC1757;
	Sun,  5 Jan 2020 09:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EACBC1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578212452;
	bh=Vj/I0Qj97eVe44zKDEHQ+WcG1+BENtjFc8VtjKZJnm8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SPhwlDsO1odzZ9jIxF1r1AiFAplCeaAxwnKhhmco3XDB5S44p9IpcC1eC13e83fgi
	 tOBvrLsgRunkgmD5c9NnmytO5aGWZGVqkFxxow7hMxyU9g/5AFaYxq0DcW0FGMW3M+
	 fL7T70tsZlfphp7Xmn3pdz36a5zRggvJjDLpnra4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0126CF80116;
	Sun,  5 Jan 2020 09:19:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DFE1F8014A; Sun,  5 Jan 2020 09:19:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A33B4F8013F
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 09:19:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A33B4F8013F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 16D2BB26A
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 08:19:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 09:19:00 +0100
Message-Id: <20200105081900.21870-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Use lower hex numbers for IDs
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

For consistency reason, make all hex numbers with lower alphabets for
USB ID entries.  It improves grep-ability and reduces careless
mistakes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/format.c |  8 ++++----
 sound/usb/midi.c   |  4 ++--
 sound/usb/quirks.c | 14 +++++++-------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index d79db71305f6..5e7c4c7beff2 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -292,10 +292,10 @@ static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
 						struct audioformat *fp)
 {
 	switch (chip->usb_id) {
-	case USB_ID(0x0E41, 0x4241): /* Line6 Helix */
-	case USB_ID(0x0E41, 0x4242): /* Line6 Helix Rack */
-	case USB_ID(0x0E41, 0x4244): /* Line6 Helix LT */
-	case USB_ID(0x0E41, 0x4246): /* Line6 HX-Stomp */
+	case USB_ID(0x0e41, 0x4241): /* Line6 Helix */
+	case USB_ID(0x0e41, 0x4242): /* Line6 Helix Rack */
+	case USB_ID(0x0e41, 0x4244): /* Line6 Helix LT */
+	case USB_ID(0x0e41, 0x4246): /* Line6 HX-Stomp */
 		/* supported rates: 48Khz */
 		kfree(fp->rate_table);
 		fp->rate_table = kmalloc(sizeof(int), GFP_KERNEL);
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index b737f0ec77d0..392e5fda680c 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1408,8 +1408,8 @@ static int snd_usbmidi_out_endpoint_create(struct snd_usb_midi *umidi,
 		/*
 		 * Some devices only work with 9 bytes packet size:
 		 */
-	case USB_ID(0x0644, 0x800E): /* Tascam US-122L */
-	case USB_ID(0x0644, 0x800F): /* Tascam US-144 */
+	case USB_ID(0x0644, 0x800e): /* Tascam US-122L */
+	case USB_ID(0x0644, 0x800f): /* Tascam US-144 */
 		ep->max_transfer = 9;
 		break;
 	}
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 82184036437b..11159fcfdcdf 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1393,22 +1393,22 @@ bool snd_usb_get_sample_rate_quirk(struct snd_usb_audio *chip)
 {
 	/* devices which do not support reading the sample rate. */
 	switch (chip->usb_id) {
-	case USB_ID(0x041E, 0x4080): /* Creative Live Cam VF0610 */
-	case USB_ID(0x04D8, 0xFEEA): /* Benchmark DAC1 Pre */
+	case USB_ID(0x041e, 0x4080): /* Creative Live Cam VF0610 */
+	case USB_ID(0x04d8, 0xfeea): /* Benchmark DAC1 Pre */
 	case USB_ID(0x0556, 0x0014): /* Phoenix Audio TMX320VC */
-	case USB_ID(0x05A3, 0x9420): /* ELP HD USB Camera */
+	case USB_ID(0x05a3, 0x9420): /* ELP HD USB Camera */
 	case USB_ID(0x05a7, 0x1020): /* Bose Companion 5 */
-	case USB_ID(0x074D, 0x3553): /* Outlaw RR2150 (Micronas UAC3553B) */
+	case USB_ID(0x074d, 0x3553): /* Outlaw RR2150 (Micronas UAC3553B) */
 	case USB_ID(0x1395, 0x740a): /* Sennheiser DECT */
 	case USB_ID(0x1901, 0x0191): /* GE B850V3 CP2114 audio interface */
-	case USB_ID(0x21B4, 0x0081): /* AudioQuest DragonFly */
+	case USB_ID(0x21b4, 0x0081): /* AudioQuest DragonFly */
 		return true;
 	}
 
 	/* devices of these vendors don't support reading rate, either */
 	switch (USB_ID_VENDOR(chip->usb_id)) {
-	case 0x045E: /* MS Lifecam */
-	case 0x047F: /* Plantronics */
+	case 0x045e: /* MS Lifecam */
+	case 0x047f: /* Plantronics */
 	case 0x1de7: /* Phoenix Audio */
 		return true;
 	}
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
