Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91137921C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 17:08:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4434B1771;
	Mon, 10 May 2021 17:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4434B1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620659315;
	bh=i/gTgCQsgSGYpH4xjkMKx1D9iRq/shWZ+RqhKtf5XvM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F17yoVni3lvbmPEkvtWm8nkehGEofyDDIk5L6ZYmZ7fApsWRxSvQuFc4L4YkR2EFK
	 OcYJe9UgwLMcuGmR8xC6FIotHln8H5P8dn3ECHqos1+/dKEw72ER3+Y+zjrybokMXt
	 0XesNUXBkI35G7GAUkv2131nxprW+vCZ1jxlDnIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88062F8026B;
	Mon, 10 May 2021 17:07:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77AFEF80240; Mon, 10 May 2021 17:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A464F800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 17:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A464F800E9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D8713B148
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:07:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Validate MS endpoint descriptors
Date: Mon, 10 May 2021 17:06:59 +0200
Message-Id: <20210510150659.17710-1-tiwai@suse.de>
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

snd_usbmidi_get_ms_info() may access beyond the border when a
malformed descriptor is passed.  This patch adds the sanity checks of
the given MS endpoint descriptors, and skips invalid ones.

Reported-by: syzbot+6bb23a5d5548b93c94aa@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index a10ac75969a8..649eb8d1ab7d 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1956,8 +1956,12 @@ static int snd_usbmidi_get_ms_info(struct snd_usb_midi *umidi,
 		ms_ep = find_usb_ms_endpoint_descriptor(hostep);
 		if (!ms_ep)
 			continue;
+		if (ms_ep->bLength <= sizeof(*ms_ep))
+			continue;
 		if (ms_ep->bNumEmbMIDIJack > 0x10)
 			continue;
+		if (ms_ep->bLength < sizeof(*ms_ep) + ms_ep->bNumEmbMIDIJack)
+			continue;
 		if (usb_endpoint_dir_out(ep)) {
 			if (endpoints[epidx].out_ep) {
 				if (++epidx >= MIDI_MAX_ENDPOINTS) {
-- 
2.26.2

