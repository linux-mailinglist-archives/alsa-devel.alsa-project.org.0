Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D671C37A2FB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 11:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F5BD85D;
	Tue, 11 May 2021 11:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F5BD85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620724007;
	bh=i4Z0o1jm009bvbeYbYTg9cZHaX81sBtD1SbawsWTQLA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BkpSUG1l4VI2krTsM7cEKdfVLueZ8eZWY10x2XjSgecas0hCPyPGCCDIUm6p8lry5
	 1TBOMD8vskll3ClPz7EuIvQQn98YCP/CaiziOc1CJUdBKqQ3WrPR6AiI1nOVxw+2IR
	 fGjHGpustMlhdi484V1hhQvN/XfDCzD5nJpZoaGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA48BF8016B;
	Tue, 11 May 2021 11:05:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9258EF80163; Tue, 11 May 2021 11:05:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DF13F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 11:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF13F800E9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6297EB14B
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 09:05:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix potential out-of-bounce access in MIDI
 EP parser
Date: Tue, 11 May 2021 11:05:00 +0200
Message-Id: <20210511090500.2637-1-tiwai@suse.de>
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

The recently introduced MIDI endpoint parser code has an access to the
field without the size validation, hence it might lead to
out-of-bounce access.  Add the sanity checks for the descriptor
sizes.

Fixes: eb596e0fd13c ("ALSA: usb-audio: generate midi streaming substream names from jack names")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 649eb8d1ab7d..2c01649c70f6 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1750,7 +1750,7 @@ static struct usb_midi_in_jack_descriptor *find_usb_in_jack_descriptor(
 		struct usb_midi_in_jack_descriptor *injd =
 				(struct usb_midi_in_jack_descriptor *)extra;
 
-		if (injd->bLength > 4 &&
+		if (injd->bLength >= sizeof(*injd) &&
 		    injd->bDescriptorType == USB_DT_CS_INTERFACE &&
 		    injd->bDescriptorSubtype == UAC_MIDI_IN_JACK &&
 				injd->bJackID == jack_id)
@@ -1773,7 +1773,7 @@ static struct usb_midi_out_jack_descriptor *find_usb_out_jack_descriptor(
 		struct usb_midi_out_jack_descriptor *outjd =
 				(struct usb_midi_out_jack_descriptor *)extra;
 
-		if (outjd->bLength > 4 &&
+		if (outjd->bLength >= sizeof(*outjd) &&
 		    outjd->bDescriptorType == USB_DT_CS_INTERFACE &&
 		    outjd->bDescriptorSubtype == UAC_MIDI_OUT_JACK &&
 				outjd->bJackID == jack_id)
@@ -1820,7 +1820,8 @@ static void snd_usbmidi_init_substream(struct snd_usb_midi *umidi,
 			outjd = find_usb_out_jack_descriptor(hostif, jack_id);
 			if (outjd) {
 				sz = USB_DT_MIDI_OUT_SIZE(outjd->bNrInputPins);
-				iJack = *(((uint8_t *) outjd) + sz - sizeof(uint8_t));
+				if (outjd->bLength >= sz)
+					iJack = *(((uint8_t *) outjd) + sz - sizeof(uint8_t));
 			}
 		} else {
 			/* and out jacks connect to ins */
-- 
2.26.2

