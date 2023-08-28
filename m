Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC1878B36D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 16:45:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19737A4C;
	Mon, 28 Aug 2023 16:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19737A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693233922;
	bh=SLTXO7wKiVK3KWUuZy6UERN/kKp+iQzBAeLNsBhjFKY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QIxUIWuKBvWHTg5j51wXvsE5ce1LMJ8bJ72HthuecG4e+q/u8hCmGpvalYg9JlnUa
	 CN6mleEGyijNeYu/neVZPdFuLQND+lZVkDl/BLpbFsEWl3hrGfZ1RvDHL9tzXrUfh1
	 Uubufpad4KfbgyXpZzUnfYkRjCTtZ1WrBUxbmb88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33747F80249; Mon, 28 Aug 2023 16:44:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C64C3F80158;
	Mon, 28 Aug 2023 16:44:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE21FF80236; Mon, 28 Aug 2023 16:44:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBE33F800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 16:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBE33F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Mnjnl0Aw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Hs0isSvr
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA63F1F383;
	Mon, 28 Aug 2023 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693233857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=VyIo7iPDZZf3cG0ACY/bFLfF9TkXiZat30ybuomoerk=;
	b=Mnjnl0Awnle4xBG75ROqWQmK7OxljmzBkBqPoX7gwRw/3U2au+ejAEKqHFfhpDx2dlLP7g
	nkrifwhUQCiIALa+dJIXkittwohUJ0drsWGXy0L1egw3gGXTzdnqX6ICBlaT6xnr3IMsPA
	WpWZDRLjPpFggpCQuNoJK7fC2P+2/as=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693233857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=VyIo7iPDZZf3cG0ACY/bFLfF9TkXiZat30ybuomoerk=;
	b=Hs0isSvrBf67tIGJvxT/qfXUm7dpbf/CA4N1vUNSikJxSEjA42vGnjdmgWc8EST7rGLS2Y
	+OFsPKiOAgsn+zBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8282E139CC;
	Mon, 28 Aug 2023 14:44:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uejfHsGy7GQMZgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 28 Aug 2023 14:44:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 1/2] aseqdump: Correct wrong channel number
Date: Mon, 28 Aug 2023 16:44:13 +0200
Message-Id: <20230828144414.8905-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UMDXZOMYCSHIOWW5KBBOQMCY2RD46BV2
X-Message-ID-Hash: UMDXZOMYCSHIOWW5KBBOQMCY2RD46BV2
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMDXZOMYCSHIOWW5KBBOQMCY2RD46BV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Correct the wrong value shown in MIDI2 default output (status instead
of channel).  Also adjust the printf formats to use %2d consistently
for the channel numbers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aseqdump/aseqdump.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index f3eebc73a9f4..a15e0752f0f1 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -368,29 +368,29 @@ static void dump_ump_midi2_event(const unsigned int *ump)
 	printf("Group %2d, ", group);
 	switch (status) {
 	case SND_UMP_MSG_PER_NOTE_RCC:
-		printf("Per-note RCC           %2u, note %u, index %u, value 0x%x",
+		printf("Per-note RCC           %2d, note %u, index %u, value 0x%x",
 		       channel, m->per_note_rcc.note,
 		       m->per_note_rcc.index, m->per_note_rcc.data);
 		break;
 	case SND_UMP_MSG_PER_NOTE_ACC:
-		printf("Per-note ACC           %2u, note %u, index %u, value 0x%x",
+		printf("Per-note ACC           %2d, note %u, index %u, value 0x%x",
 		       channel, m->per_note_acc.note,
 		       m->per_note_acc.index, m->per_note_acc.data);
 		break;
 	case SND_UMP_MSG_RPN:
-		printf("RPN                    %2u, bank %u:%u, value 0x%x",
+		printf("RPN                    %2d, bank %u:%u, value 0x%x",
 		       channel, m->rpn.bank, m->rpn.index, m->rpn.data);
 		break;
 	case SND_UMP_MSG_NRPN:
-		printf("NRPN                   %2u, bank %u:%u, value 0x%x",
+		printf("NRPN                   %2d, bank %u:%u, value 0x%x",
 		       channel, m->rpn.bank, m->rpn.index, m->rpn.data);
 		break;
 	case SND_UMP_MSG_RELATIVE_RPN:
-		printf("relative RPN           %2u, bank %u:%u, value 0x%x",
+		printf("relative RPN           %2d, bank %u:%u, value 0x%x",
 		       channel, m->rpn.bank, m->rpn.index, m->rpn.data);
 		break;
 	case SND_UMP_MSG_RELATIVE_NRPN:
-		printf("relative NRP           %2u, bank %u:%u, value 0x%x",
+		printf("relative NRP           %2d, bank %u:%u, value 0x%x",
 		       channel, m->rpn.bank, m->rpn.index, m->rpn.data);
 		break;
 	case SND_UMP_MSG_PER_NOTE_PITCHBEND:
@@ -437,8 +437,8 @@ static void dump_ump_midi2_event(const unsigned int *ump)
 		       channel, m->per_note_mgmt.flags);
 		break;
 	default:
-		printf("UMP MIDI2 event: status = %d, channel = %x, 0x%08x",
-		       status, status, *ump);
+		printf("UMP MIDI2 event: status = %d, channel = %d, 0x%08x",
+		       status, channel, *ump);
 		break;
 	}
 	printf("\n");
-- 
2.35.3

