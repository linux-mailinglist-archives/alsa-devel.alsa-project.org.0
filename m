Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC2939364
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 19:58:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37949E7F;
	Mon, 22 Jul 2024 19:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37949E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721671103;
	bh=ea1tY4rPSr1ot2NjkYjIBRpcXo1PPYA86DyyleDXpoE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WGmv1iGrfw2TBiURrccPN+d763xuaI5O4ELvWkSBxhcHU0Tf4IuuzYWlR0fpRV8cO
	 S587eMDFUXu7RNABbL+YUWR5Pqu71s9YCDFmBDrwbmqEufBce1O9cK59c6Xyeluv8u
	 pIpSaIB4ECWjkfADgqycO/in8SILUea1ahVKzmi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A321F8061A; Mon, 22 Jul 2024 19:57:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1DECF8061C;
	Mon, 22 Jul 2024 19:57:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1E64F80579; Mon, 22 Jul 2024 19:52:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AFF4F8057A
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 19:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AFF4F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0JCOqXbW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q0FU7OKu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0JCOqXbW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q0FU7OKu
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71F3421B8C;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzZBoJJV3+a8Fx24p/q7BxF7y0t+V+uFrxnYwEIh5sQ=;
	b=0JCOqXbWyDyzcpbZWhJ2omhjfAtuquoql6HWOdyGKXj9NPXu/KnK/FtNVMe/XIi2x3fau0
	XkNtcZNszuloTuO1AkQD0c1oVV2/mFP0a6XD23+j/KuKR2ArMKs8yN9dVOMfzOQCVusoVv
	6xuvpCCkq0afQ23vNZLWsROHN4W/+Wg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzZBoJJV3+a8Fx24p/q7BxF7y0t+V+uFrxnYwEIh5sQ=;
	b=Q0FU7OKuvZcjEnHMYU3zg+fUOCioG69H5IPUmHPWI+All89rV6eg2kaa3eiKvjr/43phaG
	C1un+Wyx258sd8AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzZBoJJV3+a8Fx24p/q7BxF7y0t+V+uFrxnYwEIh5sQ=;
	b=0JCOqXbWyDyzcpbZWhJ2omhjfAtuquoql6HWOdyGKXj9NPXu/KnK/FtNVMe/XIi2x3fau0
	XkNtcZNszuloTuO1AkQD0c1oVV2/mFP0a6XD23+j/KuKR2ArMKs8yN9dVOMfzOQCVusoVv
	6xuvpCCkq0afQ23vNZLWsROHN4W/+Wg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzZBoJJV3+a8Fx24p/q7BxF7y0t+V+uFrxnYwEIh5sQ=;
	b=Q0FU7OKuvZcjEnHMYU3zg+fUOCioG69H5IPUmHPWI+All89rV6eg2kaa3eiKvjr/43phaG
	C1un+Wyx258sd8AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58EF0138A7;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sANMFDGcnmbyBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 17:51:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 05/10] aseqdump: Drop ifdef for UMP support
Date: Mon, 22 Jul 2024 19:52:09 +0200
Message-ID: <20240722175215.8223-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722175215.8223-1-tiwai@suse.de>
References: <20240722175215.8223-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.40 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: E5CVEHH3NFQRHRASA6DM3DECFHGL4LLB
X-Message-ID-Hash: E5CVEHH3NFQRHRASA6DM3DECFHGL4LLB
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5CVEHH3NFQRHRASA6DM3DECFHGL4LLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that the latest alsa-lib 1.2.12 is mandatory, drop the ugly
ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aseqdump/aseqdump.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index 6ac897c0710a..1c968b1cfc05 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -29,9 +29,7 @@
 #include <poll.h>
 #include <alsa/asoundlib.h>
 #include "version.h"
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 #include <alsa/ump_msg.h>
-#endif
 
 enum {
 	VIEW_RAW, VIEW_NORMALIZED, VIEW_PERCENT
@@ -41,11 +39,7 @@ static snd_seq_t *seq;
 static int port_count;
 static snd_seq_addr_t *ports;
 static volatile sig_atomic_t stop = 0;
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 static int ump_version;
-#else
-#define ump_version	0
-#endif
 static int view_mode = VIEW_RAW;
 
 /* prints an error message to stderr, and dies */
@@ -368,7 +362,6 @@ static void dump_event(const snd_seq_event_t *ev)
 	}
 }
 
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 static int group_number(unsigned char c)
 {
 	if (view_mode != VIEW_RAW)
@@ -986,7 +979,6 @@ static void dump_ump_event(const snd_seq_ump_event_t *ev)
 		break;
 	}
 }
-#endif /* HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION */
 
 static void list_ports(void)
 {
@@ -1029,10 +1021,8 @@ static void help(const char *argv0)
 		"  -N,--normalized-view       show normalized values\n"
 		"  -P,--percent-view          show percent values\n"
 		"  -R,--raw-view              show raw values (default)\n"
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		"  -u,--ump=version           set client MIDI version (0=legacy, 1= UMP MIDI 1.0, 2=UMP MIDI2.0)\n"
 		"  -r,--raw                   do not convert UMP and legacy events\n"
-#endif
 		"  -p,--port=client:port,...  source port(s)\n",
 		argv0);
 }
@@ -1049,11 +1039,7 @@ static void sighandler(int sig ATTRIBUTE_UNUSED)
 
 int main(int argc, char *argv[])
 {
-	static const char short_options[] = "hVlp:NPR"
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
-		"u:r"
-#endif
-		;
+	static const char short_options[] = "hVlp:NPRu:r";
 	static const struct option long_options[] = {
 		{"help", 0, NULL, 'h'},
 		{"version", 0, NULL, 'V'},
@@ -1062,10 +1048,8 @@ int main(int argc, char *argv[])
 		{"normalized-view", 0, NULL, 'N'},
 		{"percent-view", 0, NULL, 'P'},
 		{"raw-view", 0, NULL, 'R'},
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		{"ump", 1, NULL, 'u'},
 		{"raw", 0, NULL, 'r'},
-#endif
 		{0}
 	};
 
@@ -1100,7 +1084,6 @@ int main(int argc, char *argv[])
 		case 'N':
 			view_mode = VIEW_NORMALIZED;
 			break;
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		case 'u':
 			ump_version = atoi(optarg);
 			snd_seq_set_client_midi_version(seq, ump_version);
@@ -1108,7 +1091,6 @@ int main(int argc, char *argv[])
 		case 'r':
 			snd_seq_set_client_ump_conversion(seq, 0);
 			break;
-#endif
 		default:
 			help(argv[0]);
 			return 1;
@@ -1150,7 +1132,6 @@ int main(int argc, char *argv[])
 			break;
 		for (;;) {
 			snd_seq_event_t *event;
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 			snd_seq_ump_event_t *ump_ev;
 			if (ump_version > 0) {
 				err = snd_seq_ump_event_input(seq, &ump_ev);
@@ -1160,7 +1141,6 @@ int main(int argc, char *argv[])
 					dump_ump_event(ump_ev);
 				continue;
 			}
-#endif
 
 			err = snd_seq_event_input(seq, &event);
 			if (err < 0)
-- 
2.43.0

