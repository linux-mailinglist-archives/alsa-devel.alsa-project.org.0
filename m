Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A879E929194
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2024 09:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6D521E6;
	Sat,  6 Jul 2024 09:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6D521E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720252030;
	bh=e+BwI6fyR/Z1Gzf02y/1MLRK9tnD1x01n2dR3l8a+RM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EndXaStu20PnFJ56Fq80e1/q7Ju1IEio71atDUvTJZETeQDIfSmO3OjuXi2HCEzL2
	 q9nx4FdzJo9hp/mzD9O+ruWFfieHiS2gCbFe/2Nwc1GQYD9ifj0uLuTpnP9BHdB65b
	 6rExIKYCRGVWPBXezXS8u1VzX5MLaAhrsxxOJ2oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30064F80619; Sat,  6 Jul 2024 09:45:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C384F80603;
	Sat,  6 Jul 2024 09:45:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF71FF8025E; Sat,  6 Jul 2024 09:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3ABD3F800FE
	for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2024 09:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ABD3F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KXorJ6wM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6jCkh5pu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=KXorJ6wM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6jCkh5pu
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 03EF31F810;
	Sat,  6 Jul 2024 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fKggnObg8PtyhU8ULSvdeZ8B1JPeYI2t4LteJrZ/sE=;
	b=KXorJ6wMS5MXfHLK5rArI6ygfqMLHYIvPFCLcEZtBqJtnoUulD8SNZFq+/tstnFUGvU5nL
	yEHlphZwi80osEjGA6MDnzVLBzXsPbmmVM5W9uiUTmF5LRSyuyiaView12Da3dVTW6Xjpo
	wkxdZ5yg6qzufCa6OtfSammjBzmOIlA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fKggnObg8PtyhU8ULSvdeZ8B1JPeYI2t4LteJrZ/sE=;
	b=6jCkh5pucxzxZa8id9hOiE8p5GIPsCVIK8kSHz4/43wX5n++tRTKfsqaYwksIeYluaIblh
	6Cz5QW36pgaleyDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KXorJ6wM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6jCkh5pu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fKggnObg8PtyhU8ULSvdeZ8B1JPeYI2t4LteJrZ/sE=;
	b=KXorJ6wMS5MXfHLK5rArI6ygfqMLHYIvPFCLcEZtBqJtnoUulD8SNZFq+/tstnFUGvU5nL
	yEHlphZwi80osEjGA6MDnzVLBzXsPbmmVM5W9uiUTmF5LRSyuyiaView12Da3dVTW6Xjpo
	wkxdZ5yg6qzufCa6OtfSammjBzmOIlA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fKggnObg8PtyhU8ULSvdeZ8B1JPeYI2t4LteJrZ/sE=;
	b=6jCkh5pucxzxZa8id9hOiE8p5GIPsCVIK8kSHz4/43wX5n++tRTKfsqaYwksIeYluaIblh
	6Cz5QW36pgaleyDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D363C13A7B;
	Sat,  6 Jul 2024 07:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EOw/Mk31iGZRDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jul 2024 07:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 5/5] arecordmidi2: Add passive mode and interactive
 mode
Date: Sat,  6 Jul 2024 09:42:31 +0200
Message-ID: <20240706074232.6364-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706074232.6364-1-tiwai@suse.de>
References: <20240706074232.6364-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 03EF31F810
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 47TXE4GXKADOQA6JR46KOR7CLSXVNAJH
X-Message-ID-Hash: 47TXE4GXKADOQA6JR46KOR7CLSXVNAJH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47TXE4GXKADOQA6JR46KOR7CLSXVNAJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow arecordmidi2 running without specifying the source ports via -p
option.  This will create a UMP Endpoint with the full 16 FBs, and
simply reads from the input ports via subscribers.  User needs to
connect to the ports manually, though.

Also, add -r option to run in the interactive mode.  In the
interactive mode, arecordmidi2 waits for the RETURN key entered from
the terminal to start the recording, and the recording ends after
another RETURN key.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aplaymidi2/arecordmidi2.1 | 20 +++++++++-
 seq/aplaymidi2/arecordmidi2.c | 75 +++++++++++++++++++++++++++--------
 2 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/seq/aplaymidi2/arecordmidi2.1 b/seq/aplaymidi2/arecordmidi2.1
index 0e41a300b553..a9cfb00d0318 100644
--- a/seq/aplaymidi2/arecordmidi2.1
+++ b/seq/aplaymidi2/arecordmidi2.1
@@ -5,7 +5,7 @@ arecordmidi2 \- record a MIDI Clip file
 
 .SH SYNOPSIS
 .B arecordmidi2
-\-p client:port[,...] [options] midi2file
+[options] midi2file
 
 .SH DESCRIPTION
 .B arecordmidi2
@@ -32,6 +32,16 @@ A client can be specified by its number, its name, or a prefix of its
 name. A port is specified by its number; for port 0 of a client, the
 ":0" part of the port specification can be omitted.
 
+\fBarecordmidi2\fP creates a UMP Endpoint containing the same number
+of Function Blocks as specified by this option, each of which is
+connected to the specified port as a source.
+
+When no source ports are specified with \fI\-p\fP option,
+\fBarecordmidi2\fP creates a UMP Endpoint with full 16 Function Blocks
+and records from those inputs.  User can connect the sequencer ports
+freely via \fBaconnect\fP, for example.  This mode can be used
+together with the interactive mode via \fI\-r\fP option.
+
 .TP
 .I \-b,\-\-bpm=beats
 Sets the musical tempo of the MIDI file, in beats per minute.
@@ -62,6 +72,14 @@ Sets the UMP MIDI protocol version. Either 1 or 2 has to be given for
 MIDI 1.0 and MIDI 2.0 protocol, respectively.
 Default is 1.
 
+.TP
+.I \-r,\-\-interactive
+Run in the interactive mode.  \fBarecordmidi2\fP waits for a RETURN
+key input from the terminal to start the recording.  After starting,
+the recording ends when another RETURN key is input from the
+terminal.  The received events before the start of recording are
+discarded.
+
 .SH SEE ALSO
 arecordmidi(1)
 .br
diff --git a/seq/aplaymidi2/arecordmidi2.c b/seq/aplaymidi2/arecordmidi2.c
index 32693854b7a8..cad5851c48ea 100644
--- a/seq/aplaymidi2/arecordmidi2.c
+++ b/seq/aplaymidi2/arecordmidi2.c
@@ -93,8 +93,15 @@ static void create_ump_client(void)
 	snd_ump_endpoint_info_t *ep;
 	snd_ump_block_info_t *blk;
 	snd_seq_port_info_t *pinfo;
+	int num_groups;
 	int i, err;
 
+	/* in passive mode, create full 16 groups */
+	if (port_count)
+		num_groups = port_count;
+	else
+		num_groups = 16;
+
 	/* create a UMP Endpoint */
 	snd_ump_endpoint_info_alloca(&ep);
 	snd_ump_endpoint_info_set_name(ep, "arecordmidi2");
@@ -105,14 +112,14 @@ static void create_ump_client(void)
 		snd_ump_endpoint_info_set_protocol_caps(ep, SND_UMP_EP_INFO_PROTO_MIDI2);
 		snd_ump_endpoint_info_set_protocol(ep, SND_UMP_EP_INFO_PROTO_MIDI2);
 	}
-	snd_ump_endpoint_info_set_num_blocks(ep, port_count);
+	snd_ump_endpoint_info_set_num_blocks(ep, num_groups);
 
-	err = snd_seq_create_ump_endpoint(seq, ep, port_count);
+	err = snd_seq_create_ump_endpoint(seq, ep, num_groups);
 	check_snd("create UMP endpoint", err);
 
 	/* create UMP Function Blocks */
 	snd_ump_block_info_alloca(&blk);
-	for (i = 0; i < port_count; i++) {
+	for (i = 0; i < num_groups; i++) {
 		char blkname[32];
 
 		sprintf(blkname, "Group %d", i + 1);
@@ -128,7 +135,7 @@ static void create_ump_client(void)
 
 	/* toggle timestamping for all input ports */
 	snd_seq_port_info_alloca(&pinfo);
-	for (i = 0; i <= port_count; i++) {
+	for (i = 0; i <= num_groups; i++) {
 		err = snd_seq_get_port_info(seq, i, pinfo);
 		check_snd("get port info", err);
 		snd_seq_port_info_set_timestamping(pinfo, 1);
@@ -343,8 +350,11 @@ static void write_file_header(FILE *file)
 	/* first DCS */
 	write_dcs(file, 0);
 	write_dctpq(file);
+}
 
-	/* start bar */
+/* write start bar */
+static void start_bar(FILE *file)
+{
 	write_start_clip(file);
 	write_tempo(file);
 	write_time_sig(file);
@@ -361,7 +371,8 @@ static void help(const char *argv0)
 		"  -t,--ticks=ticks           resolution in ticks per beat or frame\n"
 		"  -i,--timesig=nn:dd         time signature\n"
 		"  -n,--num-events=events     fixed number of events to record, then exit\n"
-		"  -u,--ump=version           UMP MIDI version (1 or 2)\n",
+		"  -u,--ump=version           UMP MIDI version (1 or 2)\n"
+		"  -r,--interactive           Interactive mode\n",
 		argv0);
 }
 
@@ -377,7 +388,7 @@ static void sighandler(int sig ATTRIBUTE_UNUSED)
 
 int main(int argc, char *argv[])
 {
-	static const char short_options[] = "hVp:b:t:n:u:";
+	static const char short_options[] = "hVp:b:t:n:u:r";
 	static const struct option long_options[] = {
 		{"help", 0, NULL, 'h'},
 		{"version", 0, NULL, 'V'},
@@ -387,6 +398,7 @@ int main(int argc, char *argv[])
 		{"timesig", 1, NULL, 'i'},
 		{"num-events", 1, NULL, 'n'},
 		{"ump", 1, NULL, 'u'},
+		{"interactive", 0, NULL, 'r'},
 		{0}
 	};
 
@@ -398,6 +410,8 @@ int main(int argc, char *argv[])
 	/* If |num_events| isn't specified, leave it at 0. */
 	long num_events = 0;
 	long events_received = 0;
+	int start = 0;
+	int interactive = 0;
 
 	init_seq();
 
@@ -441,17 +455,15 @@ int main(int argc, char *argv[])
 			if (midi_version != 1 && midi_version != 2)
 				fatal("Invalid MIDI version %d\n", midi_version);
 			break;
+		case 'r':
+			interactive = 1;
+			break;
 		default:
 			help(argv[0]);
 			return 1;
 		}
 	}
 
-	if (port_count < 1) {
-		fputs("Pleast specify a source port with --port.\n", stderr);
-		return 1;
-	}
-
 	if (optind >= argc) {
 		fputs("Please specify a file to record to.\n", stderr);
 		return 1;
@@ -459,7 +471,8 @@ int main(int argc, char *argv[])
 
 	create_queue();
 	create_ump_client();
-	connect_ports();
+	if (port_count)
+		connect_ports();
 
 	filename = argv[optind];
 
@@ -468,6 +481,13 @@ int main(int argc, char *argv[])
 		fatal("Cannot open %s - %s", filename, strerror(errno));
 
 	write_file_header(file);
+	if (interactive) {
+		printf("Press RETURN to start recording:");
+		fflush(stdout);
+	} else {
+		start_bar(file);
+		start = 1;
+	}
 
 	err = snd_seq_start_queue(seq, queue, NULL);
 	check_snd("start queue", err);
@@ -480,18 +500,39 @@ int main(int argc, char *argv[])
 	signal(SIGTERM, sighandler);
 
 	npfds = snd_seq_poll_descriptors_count(seq, POLLIN);
-	pfds = alloca(sizeof(*pfds) * npfds);
+	pfds = alloca(sizeof(*pfds) * (npfds + 1));
 	for (;;) {
 		snd_seq_poll_descriptors(seq, pfds, npfds, POLLIN);
-		if (poll(pfds, npfds, -1) < 0)
-			break;
+		if (interactive) {
+			pfds[npfds].fd = STDIN_FILENO;
+			pfds[npfds].events = POLLIN | POLLERR | POLLNVAL;
+			if (poll(pfds, npfds + 1, -1) < 0)
+				break;
+			if (pfds[npfds].revents & POLLIN) {
+				while (!feof(stdin) && getchar() != '\n')
+					;
+				if (!start) {
+					start_bar(file);
+					start = 1;
+					printf("Press RETURN to stop recording:");
+					fflush(stdout);
+					continue;
+				} else {
+					stop = 1;
+				}
+			}
+		} else {
+			if (poll(pfds, npfds, -1) < 0)
+				break;
+		}
+
 		do {
 			snd_seq_ump_event_t *event;
 
 			err = snd_seq_ump_event_input(seq, &event);
 			if (err < 0)
 				break;
-			if (event) {
+			if (start && event) {
 				record_event(file, event);
 				events_received++;
 			}
-- 
2.43.0

