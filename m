Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630459D217
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 09:28:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC1AF1654;
	Tue, 23 Aug 2022 09:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC1AF1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661239738;
	bh=+S1F+W8LpGSGfb/dGv+qNixD5KDYZaekjmHNYR4HEac=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YGKj9XI0xewkVHH4IzVEtk99/750iS8rzliAT0al5Ei39aHeVf8+hMUSaa2ZJQxyw
	 OnP1FPlrZ5nYRRhRbxeBY+FuLMqbmkitTEOUaptn3pYdMPLxFSXUy1DDz2q9cjE9+n
	 xGVTMKGihEVLrn6+fmnv/w+ObZlsRB5oTqv2RgQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D06F804E7;
	Tue, 23 Aug 2022 09:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3181EF8020D; Tue, 23 Aug 2022 09:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26430F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26430F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="e/F2nVTc"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="k4R5sjUE"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 555AF20EAE;
 Tue, 23 Aug 2022 07:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661239639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=u+Vc+16iGhYLLsyieitjMYPGvpybqeJY2ZKKhBjouVw=;
 b=e/F2nVTcJQIAgxSBCPkoe+KleufrgC50Qd8LfQZ/bl9ROCr0pbIHHx+22GEk8eWI52G12z
 oAaXMOD+OImtCbspeP1+lDazS66E3t5fBR9QqMsJYafBQqHdFdD8XHHKS5mJIefwOJtfsb
 1rebfiog8XhgIe5N8wQBQ0nzGNEmsN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661239639;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=u+Vc+16iGhYLLsyieitjMYPGvpybqeJY2ZKKhBjouVw=;
 b=k4R5sjUEYdkeM3E4STCris9Xr3D0k/0qcMXoNw7FqEmYhLtqgGpUHHkq9xa2GBBjPUPQY3
 JKZEAWIa2eQqnuCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29CBA13AB7;
 Tue, 23 Aug 2022 07:27:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fO80CVeBBGOUPAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 07:27:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: seq: oss: Fix data-race for max_midi_devs access
Date: Tue, 23 Aug 2022 09:27:16 +0200
Message-Id: <20220823072717.1706-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Abhishek Shah <abhishek.shah@columbia.edu>,
 Gabriel Ryan <gabe@cs.columbia.edu>
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

ALSA OSS sequencer refers to a global variable max_midi_devs at
creating a new port, storing it to its own field.  Meanwhile this
variable may be changed by other sequencer events at
snd_seq_oss_midi_check_exit_port() in parallel, which may cause a data
race.

OTOH, this data race itself is almost harmless, as the access to the
MIDI device is done via get_mdev() and it's protected with a refcount,
hence its presence is guaranteed.

Though, it's sill better to address the data-race from the code sanity
POV, and this patch adds the proper spinlock for the protection.

Reported-by: Abhishek Shah <abhishek.shah@columbia.edu>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/CAEHB2493pZRXs863w58QWnUTtv3HHfg85aYhLn5HJHCwxqtHQg@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index 1e3bf086f867..07efb38f58ac 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -270,7 +270,9 @@ snd_seq_oss_midi_clear_all(void)
 void
 snd_seq_oss_midi_setup(struct seq_oss_devinfo *dp)
 {
+	spin_lock_irq(&register_lock);
 	dp->max_mididev = max_midi_devs;
+	spin_unlock_irq(&register_lock);
 }
 
 /*
-- 
2.35.3

