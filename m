Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFDD939367
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 19:59:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CCE4B60;
	Mon, 22 Jul 2024 19:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CCE4B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721671146;
	bh=56t8ipHb2mfcvnrsWTNKYT6LbSMTf3V6qbfYgIHpwH4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hZ3VG6+/qOs43mPSKQKZ4KdXeKV0kY1garjwbqffsPrL6AlN8PLOgJhdDFdoD1c/r
	 M9shJxgPjNoxfk3Zu+opvU29jeYLQ+isAwefo4M1uL6fdrvx3CP9U8jRjlZYkLjyZk
	 1jif5w/5GXYbEh/ElSibGIopLPJo4WjHVKINk9t4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0909F8069A; Mon, 22 Jul 2024 19:57:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68309F8069E;
	Mon, 22 Jul 2024 19:57:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4078FF80482; Mon, 22 Jul 2024 19:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7B7FF801F5
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 19:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7B7FF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gRVWrF4H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QD/7H6FU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=gRVWrF4H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QD/7H6FU
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 072131FB89;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zju2fQFIY4UatI8TrGriXrsh22Awz15vWQE7Xe4XeqE=;
	b=gRVWrF4H9bLiafr90o5+ZUWYwM5opUUlCOibfVmp7/ZqNrSXY6jB/pMhLjKTJmCbkjb+Y9
	rUxACfA+xPCO8bZstqwzeYFC0Sp49Y4KBC0SXbiqFldEGWSwtUbUbuZyEfXXgKWD/d9HGS
	sz0OfGmUFmcEk62WWnCQg3SPHRJGPhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zju2fQFIY4UatI8TrGriXrsh22Awz15vWQE7Xe4XeqE=;
	b=QD/7H6FU5YmiEt3ODccZQ+YM3xGwgEyhFdZRLrMxLLYwerCts3HPDpZV1UObcC7/42V3Zb
	+FgLm1lYjoAeIsBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zju2fQFIY4UatI8TrGriXrsh22Awz15vWQE7Xe4XeqE=;
	b=gRVWrF4H9bLiafr90o5+ZUWYwM5opUUlCOibfVmp7/ZqNrSXY6jB/pMhLjKTJmCbkjb+Y9
	rUxACfA+xPCO8bZstqwzeYFC0Sp49Y4KBC0SXbiqFldEGWSwtUbUbuZyEfXXgKWD/d9HGS
	sz0OfGmUFmcEk62WWnCQg3SPHRJGPhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zju2fQFIY4UatI8TrGriXrsh22Awz15vWQE7Xe4XeqE=;
	b=QD/7H6FU5YmiEt3ODccZQ+YM3xGwgEyhFdZRLrMxLLYwerCts3HPDpZV1UObcC7/42V3Zb
	+FgLm1lYjoAeIsBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E101613996;
	Mon, 22 Jul 2024 17:51:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gPesNTCcnmbyBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 17:51:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 02/10] aplaymidi: Drop ifdef for UMP support
Date: Mon, 22 Jul 2024 19:52:06 +0200
Message-ID: <20240722175215.8223-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722175215.8223-1-tiwai@suse.de>
References: <20240722175215.8223-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: 3YPU7J2CSOYJ6KGHHAIGNDOI2NJCSPVN
X-Message-ID-Hash: 3YPU7J2CSOYJ6KGHHAIGNDOI2NJCSPVN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3YPU7J2CSOYJ6KGHHAIGNDOI2NJCSPVN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that the latest alsa-lib 1.2.12 became mandatory, all ugly ifdefs
can be dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aplaymidi/aplaymidi.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/seq/aplaymidi/aplaymidi.c b/seq/aplaymidi/aplaymidi.c
index 66038e278d4a..dd8d07997985 100644
--- a/seq/aplaymidi/aplaymidi.c
+++ b/seq/aplaymidi/aplaymidi.c
@@ -30,9 +30,7 @@
 #include <unistd.h>
 #include <alsa/asoundlib.h>
 #include "version.h"
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 #include <alsa/ump_msg.h>
-#endif
 
 /*
  * 31.25 kbaud, one start bit, eight data bits, two stop bits.
@@ -78,9 +76,7 @@ static int file_offset;		/* current offset in input file */
 static int num_tracks;
 static struct track *tracks;
 static int smpte_timing;
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 static int ump_mode;
-#endif
 
 /* prints an error message to stderr */
 static void errormsg(const char *msg, ...)
@@ -685,7 +681,6 @@ static int fill_legacy_event(struct event* event, snd_seq_event_t *ev)
 	return 0;
 }
 
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 static unsigned char to_ump_status(unsigned char ev_type)
 {
 	switch (ev_type) {
@@ -762,13 +757,10 @@ static int fill_ump_event(struct event* event, snd_seq_ump_event_t *ump_ev,
 	snd_seq_ev_set_ump_data(ump_ev, &ump, sizeof(ump));
 	return 0;
 }
-#endif /* HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION */
 
 static void play_midi(void)
 {
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 	snd_seq_ump_event_t ump_ev;
-#endif
 	snd_seq_event_t ev;
 	int i, max_tick, err;
 
@@ -830,7 +822,7 @@ static void play_midi(void)
 			if (err < 0)
 				continue;
 		}
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+
 		if (ump_mode) {
 			err = fill_ump_event(event, &ump_ev, &ev);
 			if (err < 0)
@@ -839,7 +831,6 @@ static void play_midi(void)
 			check_snd("output event", err);
 			continue;
 		}
-#endif
 
 		/* this blocks when the output pool has been filled */
 		err = snd_seq_event_output(seq, &ev);
@@ -957,9 +948,7 @@ static void usage(const char *argv0)
 		"-V, --version               print current version\n"
 		"-l, --list                  list all possible output ports\n"
 		"-p, --port=client:port,...  set port(s) to play to\n"
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		"-u, --ump=version           UMP output (only version=1 is supported)\n"
-#endif
 		"-d, --delay=seconds         delay after song ends\n",
 		argv0);
 }
@@ -969,12 +958,7 @@ static void version(void)
 	puts("aplaymidi version " SND_UTIL_VERSION_STR);
 }
 
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 #define OPTIONS	"hVlp:d:u:"
-#else
-#define OPTIONS	"hVlp:d:"
-#endif
-
 
 int main(int argc, char *argv[])
 {
@@ -984,9 +968,7 @@ int main(int argc, char *argv[])
 		{"version", 0, NULL, 'V'},
 		{"list", 0, NULL, 'l'},
 		{"port", 1, NULL, 'p'},
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		{"ump", 1, NULL, 'u'},
-#endif
 		{"delay", 1, NULL, 'd'},
 		{0}
 	};
@@ -1013,7 +995,6 @@ int main(int argc, char *argv[])
 		case 'd':
 			end_delay = atoi(optarg);
 			break;
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		case 'u':
 			if (strcmp(optarg, "1")) {
 				errormsg("Only MIDI 1.0 is supported");
@@ -1021,7 +1002,6 @@ int main(int argc, char *argv[])
 			}
 			ump_mode = 1;
 			break;
-#endif
 		default:
 			usage(argv[0]);
 			return 1;
@@ -1029,13 +1009,11 @@ int main(int argc, char *argv[])
 	}
 
 
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 	if (ump_mode) {
 		int err;
 		err = snd_seq_set_client_midi_version(seq, SND_SEQ_CLIENT_UMP_MIDI_1_0);
 		check_snd("set midi version", err);
 	}
-#endif
 
 	if (do_list) {
 		list_ports();
-- 
2.43.0

