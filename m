Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 486862E2031
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:50:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF73C17F8;
	Wed, 23 Dec 2020 18:49:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF73C17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608745848;
	bh=NvOOTQxORRsxyOV9RvOcdN5UdD224QdkY3bga4tCqAE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cLaA9BOL9sMlST4wZqovpVVSFZKvS1gG2W77fS3ROXWLPJm0K+Zr9swcQmL7IaXh2
	 6nZo489neRibpvytO1weYXpZ8ja+hZDb1WhauA07+FrX7dbH/nqA/YXt0NSJ3+C5tn
	 W3J63cwBO+gwp3lEOXdZqiFEictSCxJO+fZg4CMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7F25F8051E;
	Wed, 23 Dec 2020 18:46:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7724F8051D; Wed, 23 Dec 2020 18:46:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29390F80212
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29390F80212
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 451AAACC6
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 17:45:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix UBSAN warnings for MIDI jacks
Date: Wed, 23 Dec 2020 18:45:57 +0100
Message-Id: <20201223174557.10249-1-tiwai@suse.de>
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

The calculation of in_cables and out_cables bitmaps are done with the
bit shift by the value from the descriptor, which is an arbitrary
value, and can lead to UBSAN shift-out-of-bounds warnings.

Fix it by filtering the bad descriptor values with the check of the
upper bound 0x10 (the cable bitmaps are 16 bits).

Reported-by: syzbot+92e45ae45543f89e8c88@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index c8213652470c..0c23fa6d8525 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1889,6 +1889,8 @@ static int snd_usbmidi_get_ms_info(struct snd_usb_midi *umidi,
 		ms_ep = find_usb_ms_endpoint_descriptor(hostep);
 		if (!ms_ep)
 			continue;
+		if (ms_ep->bNumEmbMIDIJack > 0x10)
+			continue;
 		if (usb_endpoint_dir_out(ep)) {
 			if (endpoints[epidx].out_ep) {
 				if (++epidx >= MIDI_MAX_ENDPOINTS) {
@@ -2141,6 +2143,8 @@ static int snd_usbmidi_detect_roland(struct snd_usb_midi *umidi,
 		    cs_desc[1] == USB_DT_CS_INTERFACE &&
 		    cs_desc[2] == 0xf1 &&
 		    cs_desc[3] == 0x02) {
+			if (cs_desc[4] > 0x10 || cs_desc[5] > 0x10)
+				continue;
 			endpoint->in_cables  = (1 << cs_desc[4]) - 1;
 			endpoint->out_cables = (1 << cs_desc[5]) - 1;
 			return snd_usbmidi_detect_endpoints(umidi, endpoint, 1);
-- 
2.26.2

