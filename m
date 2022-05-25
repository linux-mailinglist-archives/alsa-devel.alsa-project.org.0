Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C96CF533D6C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 15:13:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B401680;
	Wed, 25 May 2022 15:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B401680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653484392;
	bh=gLKK4YYYbrMvlvQfse5pxVlplbrBmT9u2AAcIunxPIE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l2ExFd1boEop+N2meDxebTW4gbINajXzKh2oRsvyTdnXBxML6q/i49q2DM0CbLgfP
	 xzd2QuFi8ABusQMo9BC62MCE075Hiki0R34EFWvFid9dwiV6xTyW4k2mAs+x+gJQFM
	 3uqp5g2LlN+FQ94FVuj4Itwr5PfCuiDxXVbCWAJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FDB3F801EC;
	Wed, 25 May 2022 15:12:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21B70F8016D; Wed, 25 May 2022 15:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D7B9F800D0
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 15:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D7B9F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="i25oXxFx"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="HsqMGU4D"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 41F481F918;
 Wed, 25 May 2022 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653484325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GlAsVjUz7tvek1CF+qpKw60D6+ZC4W6oi32PGTmb77g=;
 b=i25oXxFx7ufi9DXpeJ106aoCvtPl89QMPOrahruOayl0uym1thf9rH26YYdtmzUtfP1uqF
 p6Yiup5AsBXmQmiqvqi6t3pzOJlvQrfPsnzEe6cyhvumS+JTB9Ph8zeAVWcBHrki45oiGr
 dNuwVib2j8krnUnFEuBKUAKc2d9MYGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653484325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GlAsVjUz7tvek1CF+qpKw60D6+ZC4W6oi32PGTmb77g=;
 b=HsqMGU4DigyH1NXbyLVtrenq1Di+ZXebIUJDyntwuNKNy3gOKTk/4EAyRZIvI0trxFRjaV
 9kE7AJD/71YfoKAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 292BF13ADF;
 Wed, 25 May 2022 13:12:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vjtjCSUrjmL5RgAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 25 May 2022 13:12:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Cancel pending work at closing a MIDI
 substream
Date: Wed, 25 May 2022 15:12:03 +0200
Message-Id: <20220525131203.11299-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

At closing a USB MIDI output substream, there might be still a pending
work, which would eventually access the rawmidi runtime object that is
being released.  For fixing the race, make sure to cancel the pending
work at closing.

Reported-by: syzbot+6912c9592caca7ca0e7d@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/000000000000e7e75005dfd07cf6@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 7c6ca2b433a5..344fbeadf161 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1145,6 +1145,9 @@ static int snd_usbmidi_output_open(struct snd_rawmidi_substream *substream)
 
 static int snd_usbmidi_output_close(struct snd_rawmidi_substream *substream)
 {
+	struct usbmidi_out_port *port = substream->runtime->private_data;
+
+	cancel_work_sync(&port->ep->work);
 	return substream_open(substream, 0, 0);
 }
 
-- 
2.35.3

