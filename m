Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951F78B38F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 16:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61B681FE;
	Mon, 28 Aug 2023 16:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61B681FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693234125;
	bh=bqcHcypCPFk9dhprWxY8zUjtvDWiSBb5lDwmR9pT8+s=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hZnblwx/Loz/5CMBH4TAJm6kLgTWZhqGyOj6+x45Z4FvRbGA64lcMnizGcSInSkgf
	 120N4yInYSyLI3OvGZKu6CgY9jDFiN2QejxTOepspJL+wLpl3ORC8GnX+8YyFGzr4i
	 oAFMTiOQUspQ4FgMpwqJqJDRyPGLSSDS6QpWz9eY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED105F8023B; Mon, 28 Aug 2023 16:47:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59F1AF80155;
	Mon, 28 Aug 2023 16:47:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33B71F80158; Mon, 28 Aug 2023 16:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 976BDF80094
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 16:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 976BDF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cjUIsIoP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2+7UR4Vg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 778CD21AA5;
	Mon, 28 Aug 2023 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693234066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=jCvxfo3ZEPOppOKgwriFcpiAY0erEPUJBOhnPP3UXAk=;
	b=cjUIsIoP99JWOQsbG0IDTbB50wfzt0aNDkfxi5iz7kA5+q3G23ALpcBT0Up0e83uWAgHDU
	o8AUn7F1hPM/ClfKpJQHJBsi8AfcBaJkXLTTbneEsDiStoL0e2s2q7RlkQQQ9n1zsyAaj0
	vAYPGBPrRvSHIZ/yn+fTJiLL5bBIMks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693234066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=jCvxfo3ZEPOppOKgwriFcpiAY0erEPUJBOhnPP3UXAk=;
	b=2+7UR4VgCz9BYnhvET2CFPG6i4cq+Q8RlZePIagcpWBaRqUHNmR6wOk+ucQRO4iN/WAVY9
	DEbkW6VbOQ4wKTAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D0CD139CC;
	Mon, 28 Aug 2023 14:47:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id g+nlFZKz7GT8ZwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 28 Aug 2023 14:47:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils] aseqdump: Align outputs of UMP MIDI 1.0 with
 legacy MIDI 1.0
Date: Mon, 28 Aug 2023 16:47:44 +0200
Message-Id: <20230828144744.9286-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FVMPDHLJ7OGI7ZP3DMNNOZJP6JHHHPTR
X-Message-ID-Hash: FVMPDHLJ7OGI7ZP3DMNNOZJP6JHHHPTR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVMPDHLJ7OGI7ZP3DMNNOZJP6JHHHPTR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The outputs from UMP MIDI 1.0 are slightly differently shown as the
legacy MIDI 1.0 (the velocities and values are in hex), which is
rather confusing.  Let's make them look more similar.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This is another fix I forgot to submit before the two patches for
aseqdump: "Correct wrong channel number" and "Add options to switch view mode"

 seq/aseqdump/aseqdump.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index 1fee0430f9b3..f3eebc73a9f4 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -306,6 +306,12 @@ static void dump_event(const snd_seq_event_t *ev)
 }
 
 #ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+static int pitchbend_value(u8 msb, u8 lsb)
+{
+	int pb = (msb << 7) | lsb;
+	return pb - 8192;
+}
+
 static void dump_ump_midi1_event(const unsigned int *ump)
 {
 	const snd_ump_msg_midi1_t *m = (const snd_ump_msg_midi1_t *)ump;
@@ -316,31 +322,32 @@ static void dump_ump_midi1_event(const unsigned int *ump)
 	printf("Group %2d, ", group);
 	switch (status) {
 	case SND_UMP_MSG_NOTE_OFF:
-		printf("Note off               %2d, note %d, velocity 0x%x",
+		printf("Note off               %2d, note %d, velocity %d",
 		       channel, m->note_off.note, m->note_off.velocity);
 		break;
 	case SND_UMP_MSG_NOTE_ON:
-		printf("Note on                %2d, note %d, velocity 0x%x",
+		printf("Note on                %2d, note %d, velocity %d",
 		       channel, m->note_off.note, m->note_off.velocity);
 		break;
 	case SND_UMP_MSG_POLY_PRESSURE:
-		printf("Poly pressure          %2d, note %d, value 0x%x",
+		printf("Poly pressure          %2d, note %d, value %d",
 		       channel, m->poly_pressure.note, m->poly_pressure.data);
 		break;
 	case SND_UMP_MSG_CONTROL_CHANGE:
-		printf("Control change         %2d, controller %d, value 0x%x",
+		printf("Control change         %2d, controller %d, value %d",
 		       channel, m->control_change.index, m->control_change.data);
 		break;
 	case SND_UMP_MSG_PROGRAM_CHANGE:
 		printf("Program change         %2d, program %d",
 		       channel, m->program_change.program);
 	case SND_UMP_MSG_CHANNEL_PRESSURE:
-		printf("Channel pressure       %2d, value 0x%x",
+		printf("Channel pressure       %2d, value %d",
 		       channel, m->channel_pressure.data);
 		break;
 	case SND_UMP_MSG_PITCHBEND:
-		printf("Pitchbend              %2d, value 0x%x",
-		       channel, (m->pitchbend.data_msb << 7) | m->pitchbend.data_lsb);
+		printf("Pitchbend              %2d, value %d",
+		       channel, pitchbend_value(m->pitchbend.data_msb,
+						m->pitchbend.data_lsb));
 		break;
 	default:
 		printf("UMP MIDI1 event: status = %d, channel = %d, 0x%08x",
-- 
2.35.3

