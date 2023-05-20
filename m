Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF8B70A611
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 09:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A61A683E;
	Sat, 20 May 2023 09:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A61A683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684566578;
	bh=9cbzx5jjRyhcs8SdY4WG5UaeSTFSmwuawEcXx4uqBXI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PdsSsllpiEV8z+F4xV5XpRAKULgvifQjqB6r0YfhdN1lbbNz9vBHQEVNjnIp+Rgl7
	 88eKDlUaGzAQVBvheEwc2gfhQdfc66w4JytyXf6E6l/8Y/UCLAP1xqkE3h3iDxjbHX
	 yNyytKnQeqKgvxQUgmmH1b6/f5DLfIj+Tup7w+YA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B2B6F80571; Sat, 20 May 2023 09:07:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FA78F80564;
	Sat, 20 May 2023 09:07:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 573C8F80272; Sat, 20 May 2023 09:07:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71617F80272
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 09:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71617F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eEI18KTd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3L5RAQqm
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F0A161FE41;
	Sat, 20 May 2023 07:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684566463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttLvM6U4JAocI3YT1PumrSnqT9uSUna1NmRHRI11Wbc=;
	b=eEI18KTdOgWxP/TI9cYPOMghChTg9eDc80ZzAyy3+cgG2YkXD6uFDbHSaeoGlWWbCIzBpm
	gU/F676VDR5RzMIjD24vTOHLrPK7nf4fTRvfxkBSYhlNn2r5RpR/95RIc20g9aXHpvB17z
	roNC2VlyqLXumpEXA825dc1TtHUfkfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684566463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttLvM6U4JAocI3YT1PumrSnqT9uSUna1NmRHRI11Wbc=;
	b=3L5RAQqmsKUh7zJTjT0TgiTm+VcXEBMiaiFKTmvu6AZMA7E+2x1lqvHCkOP+/tY5fkyjma
	PaFWObf+S1qKp6BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE195139F5;
	Sat, 20 May 2023 07:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6ElvMb9xaGRrHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 07:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 3/3] aplaymidi: Add UMP support
Date: Sat, 20 May 2023 09:07:38 +0200
Message-Id: <20230520070738.8382-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230520070738.8382-1-tiwai@suse.de>
References: <20230520070738.8382-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TK47PYBF5K3NCUUXTPJXF6VFMDZRIXKL
X-Message-ID-Hash: TK47PYBF5K3NCUUXTPJXF6VFMDZRIXKL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TK47PYBF5K3NCUUXTPJXF6VFMDZRIXKL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

By switching via the new option -u, aplaymidi can behave as a UMP
client and output UMP packets instead of legacy sequencer events.
As of now, the only supported version is 1.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aplaymidi/aplaymidi.1 |   6 ++
 seq/aplaymidi/aplaymidi.c | 216 ++++++++++++++++++++++++++++++--------
 2 files changed, 181 insertions(+), 41 deletions(-)

diff --git a/seq/aplaymidi/aplaymidi.1 b/seq/aplaymidi/aplaymidi.1
index 02fef9d9d668..0c8238d586fe 100644
--- a/seq/aplaymidi/aplaymidi.1
+++ b/seq/aplaymidi/aplaymidi.1
@@ -31,6 +31,12 @@ Prints a list of possible output ports.
 Sets the sequencer port(s) to which the events in the MIDI file(s) are
 sent.
 
+.TP
+.I \-u, \-\-ump=version
+Changes the sequencer client to the given MIDI version and outputs via
+the UMP packets instead of legacy sequencer events.
+As of now, the only supported version is 1.
+
 A client can be specified by its number, its name, or a prefix of its
 name. A port is specified by its number; for port 0 of a client, the
 ":0" part of the port specification can be omitted.
diff --git a/seq/aplaymidi/aplaymidi.c b/seq/aplaymidi/aplaymidi.c
index e8491e13148d..e96364f0de09 100644
--- a/seq/aplaymidi/aplaymidi.c
+++ b/seq/aplaymidi/aplaymidi.c
@@ -30,6 +30,9 @@
 #include <alsa/asoundlib.h>
 #include "aconfig.h"
 #include "version.h"
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+#include <alsa/ump_msg.h>
+#endif
 
 /*
  * 31.25 kbaud, one start bit, eight data bits, two stop bits.
@@ -75,6 +78,9 @@ static int file_offset;		/* current offset in input file */
 static int num_tracks;
 static struct track *tracks;
 static int smpte_timing;
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+static int ump_mode;
+#endif
 
 /* prints an error message to stderr */
 static void errormsg(const char *msg, ...)
@@ -639,8 +645,130 @@ static void handle_big_sysex(snd_seq_event_t *ev)
 	ev->data.ext.len = length;
 }
 
+static int fill_legacy_event(struct event* event, snd_seq_event_t *ev)
+{
+	ev->type = event->type;
+	switch (ev->type) {
+	case SND_SEQ_EVENT_NOTEON:
+	case SND_SEQ_EVENT_NOTEOFF:
+	case SND_SEQ_EVENT_KEYPRESS:
+		snd_seq_ev_set_fixed(ev);
+		ev->data.note.channel = event->data.d[0];
+		ev->data.note.note = event->data.d[1];
+		ev->data.note.velocity = event->data.d[2];
+		break;
+	case SND_SEQ_EVENT_CONTROLLER:
+		snd_seq_ev_set_fixed(ev);
+		ev->data.control.channel = event->data.d[0];
+		ev->data.control.param = event->data.d[1];
+		ev->data.control.value = event->data.d[2];
+		break;
+	case SND_SEQ_EVENT_PGMCHANGE:
+	case SND_SEQ_EVENT_CHANPRESS:
+		snd_seq_ev_set_fixed(ev);
+		ev->data.control.channel = event->data.d[0];
+		ev->data.control.value = event->data.d[1];
+		break;
+	case SND_SEQ_EVENT_PITCHBEND:
+		snd_seq_ev_set_fixed(ev);
+		ev->data.control.channel = event->data.d[0];
+		ev->data.control.value = ((event->data.d[1]) |
+					  ((event->data.d[2]) << 7)) - 0x2000;
+		break;
+	case SND_SEQ_EVENT_SYSEX:
+		snd_seq_ev_set_variable(ev, event->data.length, event->sysex);
+		handle_big_sysex(ev);
+		break;
+	default:
+		fatal("Invalid event type %d!", ev->type);
+	}
+	return 0;
+}
+
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+static unsigned char to_ump_status(unsigned char ev_type)
+{
+	switch (ev_type) {
+	case SND_SEQ_EVENT_NOTEON:
+		return SND_UMP_MSG_NOTE_ON;
+	case SND_SEQ_EVENT_NOTEOFF:
+		return SND_UMP_MSG_NOTE_OFF;
+	case SND_SEQ_EVENT_KEYPRESS:
+		return SND_UMP_MSG_POLY_PRESSURE;
+	case SND_SEQ_EVENT_CONTROLLER:
+		return SND_UMP_MSG_CONTROL_CHANGE;
+	case SND_SEQ_EVENT_PGMCHANGE:
+		return SND_UMP_MSG_PROGRAM_CHANGE;
+	case SND_SEQ_EVENT_CHANPRESS:
+		return SND_UMP_MSG_CHANNEL_PRESSURE;
+	case SND_SEQ_EVENT_PITCHBEND:
+		return SND_UMP_MSG_PITCHBEND;
+	default:
+		return 0;
+	}
+}
+
+static int fill_ump_event(struct event* event, snd_seq_ump_event_t *ump_ev,
+			  const snd_seq_event_t *ev)
+{
+	snd_ump_msg_midi1_t ump = {};
+	unsigned char status = to_ump_status(event->type);
+
+	memcpy(ump_ev, ev, sizeof(*ev));
+	if (!status)
+		return 0; /* handle as is */
+
+	ump.note_on.type = SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE;
+	switch (event->type) {
+	case SND_SEQ_EVENT_NOTEON:
+		/* correct the note-on with velocity 0 to note-off;
+		 * UMP may handle velocity 0 differently
+		 */
+		if (!ev->data.note.velocity)
+			status = SND_UMP_MSG_NOTE_OFF;
+		/* fallthrough */
+	case SND_SEQ_EVENT_NOTEOFF:
+	case SND_SEQ_EVENT_KEYPRESS:
+		ump.note_on.status = status;
+		ump.note_on.channel = event->data.d[0];
+		ump.note_on.note = event->data.d[1];
+		ump.note_on.velocity = event->data.d[2];
+		break;
+	case SND_SEQ_EVENT_CONTROLLER:
+		ump.control_change.status = status;
+		ump.control_change.channel = event->data.d[0];
+		ump.control_change.index = event->data.d[1];
+		ump.control_change.data = event->data.d[2];
+		break;
+	case SND_SEQ_EVENT_PGMCHANGE:
+		ump.program_change.status = status;
+		ump.program_change.channel = event->data.d[0];
+		ump.program_change.program = event->data.d[1];
+		break;
+	case SND_SEQ_EVENT_CHANPRESS:
+		ump.channel_pressure.status = status;
+		ump.channel_pressure.channel = event->data.d[0];
+		ump.channel_pressure.data = event->data.d[1];
+		break;
+	case SND_SEQ_EVENT_PITCHBEND:
+		ump.pitchbend.status = status;
+		ump.pitchbend.channel = event->data.d[0];
+		ump.pitchbend.data_msb = event->data.d[2];
+		ump.pitchbend.data_lsb = event->data.d[1];
+		break;
+	default:
+		return 0; /* handle as is */
+	}
+	snd_seq_ev_set_ump_data(ump_ev, &ump, sizeof(ump));
+	return 0;
+}
+#endif /* HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION */
+
 static void play_midi(void)
 {
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+	snd_seq_ump_event_t ump_ev;
+#endif
 	snd_seq_event_t ev;
 	int i, max_tick, err;
 
@@ -688,52 +816,28 @@ static void play_midi(void)
 		event_track->current_event = event->next;
 
 		/* output the event */
-		ev.type = event->type;
 		ev.time.tick = event->tick;
 		ev.dest = ports[event->port];
-		switch (ev.type) {
-		case SND_SEQ_EVENT_NOTEON:
-		case SND_SEQ_EVENT_NOTEOFF:
-		case SND_SEQ_EVENT_KEYPRESS:
-			snd_seq_ev_set_fixed(&ev);
-			ev.data.note.channel = event->data.d[0];
-			ev.data.note.note = event->data.d[1];
-			ev.data.note.velocity = event->data.d[2];
-			break;
-		case SND_SEQ_EVENT_CONTROLLER:
-			snd_seq_ev_set_fixed(&ev);
-			ev.data.control.channel = event->data.d[0];
-			ev.data.control.param = event->data.d[1];
-			ev.data.control.value = event->data.d[2];
-			break;
-		case SND_SEQ_EVENT_PGMCHANGE:
-		case SND_SEQ_EVENT_CHANPRESS:
-			snd_seq_ev_set_fixed(&ev);
-			ev.data.control.channel = event->data.d[0];
-			ev.data.control.value = event->data.d[1];
-			break;
-		case SND_SEQ_EVENT_PITCHBEND:
-			snd_seq_ev_set_fixed(&ev);
-			ev.data.control.channel = event->data.d[0];
-			ev.data.control.value =
-				((event->data.d[1]) |
-				 ((event->data.d[2]) << 7)) - 0x2000;
-			break;
-		case SND_SEQ_EVENT_SYSEX:
-			snd_seq_ev_set_variable(&ev, event->data.length,
-						event->sysex);
-			handle_big_sysex(&ev);
-			break;
-		case SND_SEQ_EVENT_TEMPO:
-			snd_seq_ev_set_fixed(&ev);
+		if (event->type == SND_SEQ_EVENT_TEMPO) {
 			ev.dest.client = SND_SEQ_CLIENT_SYSTEM;
 			ev.dest.port = SND_SEQ_PORT_SYSTEM_TIMER;
 			ev.data.queue.queue = queue;
 			ev.data.queue.param.value = event->data.tempo;
-			break;
-		default:
-			fatal("Invalid event type %d!", ev.type);
+		} else {
+			err = fill_legacy_event(event, &ev);
+			if (err < 0)
+				continue;
 		}
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+		if (ump_mode) {
+			err = fill_ump_event(event, &ump_ev, &ev);
+			if (err < 0)
+				continue;
+			err = snd_seq_ump_event_output(seq, &ump_ev);
+			check_snd("output event", err);
+			continue;
+		}
+#endif
 
 		/* this blocks when the output pool has been filled */
 		err = snd_seq_event_output(seq, &ev);
@@ -851,6 +955,9 @@ static void usage(const char *argv0)
 		"-V, --version               print current version\n"
 		"-l, --list                  list all possible output ports\n"
 		"-p, --port=client:port,...  set port(s) to play to\n"
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+		"-u, --ump=version           UMP output (only version=1 is supported)\n"
+#endif
 		"-d, --delay=seconds         delay after song ends\n",
 		argv0);
 }
@@ -860,18 +967,28 @@ static void version(void)
 	puts("aplaymidi version " SND_UTIL_VERSION_STR);
 }
 
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+#define OPTIONS	"hVlp:d:u:"
+#else
+#define OPTIONS	"hVlp:d:"
+#endif
+
+
 int main(int argc, char *argv[])
 {
-	static const char short_options[] = "hVlp:d:";
+	static const char short_options[] = OPTIONS;
 	static const struct option long_options[] = {
 		{"help", 0, NULL, 'h'},
 		{"version", 0, NULL, 'V'},
 		{"list", 0, NULL, 'l'},
 		{"port", 1, NULL, 'p'},
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+		{"ump", 1, NULL, 'u'},
+#endif
 		{"delay", 1, NULL, 'd'},
 		{0}
 	};
-	int c;
+	int c, err;
 	int do_list = 0;
 
 	init_seq();
@@ -894,12 +1011,29 @@ int main(int argc, char *argv[])
 		case 'd':
 			end_delay = atoi(optarg);
 			break;
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+		case 'u':
+			if (strcmp(optarg, "1")) {
+				errormsg("Only MIDI 1.0 is supported");
+				return 1;
+			}
+			ump_mode = 1;
+			break;
+#endif
 		default:
 			usage(argv[0]);
 			return 1;
 		}
 	}
 
+
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+	if (ump_mode) {
+		err = snd_seq_set_client_midi_version(seq, SND_SEQ_CLIENT_UMP_MIDI_1_0);
+		check_snd("set midi version", err);
+	}
+#endif
+
 	if (do_list) {
 		list_ports();
 	} else {
-- 
2.35.3

