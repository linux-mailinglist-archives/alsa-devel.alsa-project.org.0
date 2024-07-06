Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DA6929191
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2024 09:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE36A14F7;
	Sat,  6 Jul 2024 09:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE36A14F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720252011;
	bh=NhxqSolfEx3PxzgeuRE+cmdVyDaWHgQEDjzpe+aF4Eo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=D2pOZ1t8A0IF/lByfCGKVD9iCefSzEDA/gVt2tC3OVbKUgRuspes9Hq43QaLU7Z1U
	 sqV0SBIrlQogG477EYe/gAUpzs87C7upO+6L73fo/gkc1v9XM+qDudBMzLxkE7tKob
	 LH4lStjnIRx+/7zs8DU1m7TFtTF4pQ1K0N8kqtiw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E409BF805FF; Sat,  6 Jul 2024 09:45:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E8C2F805FD;
	Sat,  6 Jul 2024 09:45:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3F3FF80272; Sat,  6 Jul 2024 09:42:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 79D6AF800F8
	for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2024 09:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D6AF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XmDI8I1M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dxi0jqnR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=XmDI8I1M;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dxi0jqnR
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 738AA2115D;
	Sat,  6 Jul 2024 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDDLF9T0yXhO03nMxbF1t+nbgVY/qneMMu309/pau8A=;
	b=XmDI8I1M+khDOcZOQJ895ABL84KxE/pksxFp+mhqBCFO/QPOWWjchPsYuL3K6ZZYMXMpxT
	R3fXk80F8tR+bI8kuqX+OgMc63+KyrRU9iQJ7OY4bOLqnO1o4/sN7tmlq1s+UIwrS6MuUv
	zIIsV/Z9vxPoHcZ935QZa6Cr86WoCU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDDLF9T0yXhO03nMxbF1t+nbgVY/qneMMu309/pau8A=;
	b=dxi0jqnRSAFAnraWje/U80Gt2V0RpsrfJ8QQh9oD1n6WDdrEDGLqmXDxTTrVSuEnWd/bE0
	z6hsfLKxMgxEjGDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDDLF9T0yXhO03nMxbF1t+nbgVY/qneMMu309/pau8A=;
	b=XmDI8I1M+khDOcZOQJ895ABL84KxE/pksxFp+mhqBCFO/QPOWWjchPsYuL3K6ZZYMXMpxT
	R3fXk80F8tR+bI8kuqX+OgMc63+KyrRU9iQJ7OY4bOLqnO1o4/sN7tmlq1s+UIwrS6MuUv
	zIIsV/Z9vxPoHcZ935QZa6Cr86WoCU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDDLF9T0yXhO03nMxbF1t+nbgVY/qneMMu309/pau8A=;
	b=dxi0jqnRSAFAnraWje/U80Gt2V0RpsrfJ8QQh9oD1n6WDdrEDGLqmXDxTTrVSuEnWd/bE0
	z6hsfLKxMgxEjGDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 570A913A7B;
	Sat,  6 Jul 2024 07:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4ELYE031iGZRDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jul 2024 07:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 2/5] arecordmidi2: Add initial version
Date: Sat,  6 Jul 2024 09:42:28 +0200
Message-ID: <20240706074232.6364-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706074232.6364-1-tiwai@suse.de>
References: <20240706074232.6364-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: PSUV7M27PDQQWKI6OLAVUXZ4T5QL2BK2
X-Message-ID-Hash: PSUV7M27PDQQWKI6OLAVUXZ4T5QL2BK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSUV7M27PDQQWKI6OLAVUXZ4T5QL2BK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

arecordmidi2 is a similar program like arecordmidi for recording the
incoming MIDI events, but storing in a MIDI Clip file for MIDI 2.0.

Most options are kept from arecordmidi, but some are dropped: namely,
the -l, -m and -f options are dropped for code simplicity.
Also -s option is dropped as well, as there is no need for split for
MIDI Clip file unlike SMF.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aplaymidi2/Makefile.am    |   6 +-
 seq/aplaymidi2/arecordmidi2.1 |  73 +++++
 seq/aplaymidi2/arecordmidi2.c | 512 ++++++++++++++++++++++++++++++++++
 3 files changed, 588 insertions(+), 3 deletions(-)
 create mode 100644 seq/aplaymidi2/arecordmidi2.1
 create mode 100644 seq/aplaymidi2/arecordmidi2.c

diff --git a/seq/aplaymidi2/Makefile.am b/seq/aplaymidi2/Makefile.am
index 0c5c743f7eb8..8985382efe82 100644
--- a/seq/aplaymidi2/Makefile.am
+++ b/seq/aplaymidi2/Makefile.am
@@ -1,5 +1,5 @@
 AM_CPPFLAGS = -I$(top_srcdir)/include
-EXTRA_DIST = aplaymidi2.1
+EXTRA_DIST = aplaymidi2.1 arecordmidi2.1
 
-bin_PROGRAMS = aplaymidi2
-man_MANS = aplaymidi2.1
+bin_PROGRAMS = aplaymidi2 arecordmidi2
+man_MANS = aplaymidi2.1 arecordmidi2.1
diff --git a/seq/aplaymidi2/arecordmidi2.1 b/seq/aplaymidi2/arecordmidi2.1
new file mode 100644
index 000000000000..0e41a300b553
--- /dev/null
+++ b/seq/aplaymidi2/arecordmidi2.1
@@ -0,0 +1,73 @@
+.TH ARECORDMIDI2 1 "4 July 2024"
+
+.SH NAME
+arecordmidi2 \- record a MIDI Clip file
+
+.SH SYNOPSIS
+.B arecordmidi2
+\-p client:port[,...] [options] midi2file
+
+.SH DESCRIPTION
+.B arecordmidi2
+is a command-line utility that records a MIDI Clip file from one or
+more ALSA sequencer ports.
+
+To stop recording, press Ctrl+C.
+
+.SH OPTIONS
+
+.TP
+.I \-h,\-\-help
+Prints a list of options.
+
+.TP
+.I \-V,\-\-version
+Prints the current version.
+
+.TP
+.I \-p,\-\-port=client:port,...
+Sets the sequencer port(s) from which events are recorded.
+
+A client can be specified by its number, its name, or a prefix of its
+name. A port is specified by its number; for port 0 of a client, the
+":0" part of the port specification can be omitted.
+
+.TP
+.I \-b,\-\-bpm=beats
+Sets the musical tempo of the MIDI file, in beats per minute.
+The default value is 120 BPM.
+
+.TP
+.I \-t,\-\-ticks=ticks
+Sets the resolution of timestamps (ticks) in the MIDI file,
+in ticks per beat.
+The default value is 384 ticks/beat.
+
+.TP
+.I \-i,\-\-timesig=numerator:denominator
+Sets the time signature for the MIDI file.
+
+The time signature is specified as usual with two numbers, representing
+the numerator and denominator of the time signature as it would be
+notated. The denominator must be a power of two. Both numbers should be
+separated by a colon. The time signature is 4:4 by default.
+
+.TP
+.I \-n,\-\-num-events=events
+Stops the recording after receiving the given number of events.
+
+.TP
+.I \-u,\-\-ump=version
+Sets the UMP MIDI protocol version. Either 1 or 2 has to be given for
+MIDI 1.0 and MIDI 2.0 protocol, respectively.
+Default is 1.
+
+.SH SEE ALSO
+arecordmidi(1)
+.br
+aplaymidi2(1)
+
+.SH AUTHOR
+Takashi Iwai <tiwai@suse.de>
+
+
diff --git a/seq/aplaymidi2/arecordmidi2.c b/seq/aplaymidi2/arecordmidi2.c
new file mode 100644
index 000000000000..32693854b7a8
--- /dev/null
+++ b/seq/aplaymidi2/arecordmidi2.c
@@ -0,0 +1,512 @@
+/*
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <signal.h>
+#include <getopt.h>
+#include <poll.h>
+#include <alsa/asoundlib.h>
+#include <alsa/ump_msg.h>
+#include "aconfig.h"
+#include "version.h"
+
+static snd_seq_t *seq;
+static int client;
+static int port_count;
+static snd_seq_addr_t *ports;
+static int queue;
+static int midi_version = 1;
+static int beats = 120;
+static int ticks = 384;
+static int tempo_base = 10;
+static volatile sig_atomic_t stop;
+static int ts_num = 4; /* time signature: numerator */
+static int ts_div = 4; /* time signature: denominator */
+static int last_tick;
+
+/* Parse a decimal number from a command line argument. */
+static long arg_parse_decimal_num(const char *str, int *err)
+{
+	long val;
+	char *endptr;
+
+	errno = 0;
+	val = strtol(str, &endptr, 0);
+	if (errno > 0) {
+		*err = -errno;
+		return 0;
+	}
+	if (*endptr != '\0') {
+		*err = -EINVAL;
+		return 0;
+	}
+
+	return val;
+}
+
+/* prints an error message to stderr, and dies */
+static void fatal(const char *msg, ...)
+{
+	va_list ap;
+
+	va_start(ap, msg);
+	vfprintf(stderr, msg, ap);
+	va_end(ap);
+	fputc('\n', stderr);
+	exit(EXIT_FAILURE);
+}
+
+/* memory allocation error handling */
+static void check_mem(void *p)
+{
+	if (!p)
+		fatal("Out of memory");
+}
+
+/* error handling for ALSA functions */
+static void check_snd(const char *operation, int err)
+{
+	if (err < 0)
+		fatal("Cannot %s - %s", operation, snd_strerror(err));
+}
+
+/* open a sequencer client */
+static void init_seq(void)
+{
+	int err;
+
+	/* open sequencer */
+	err = snd_seq_open(&seq, "default", SND_SEQ_OPEN_DUPLEX, 0);
+	check_snd("open sequencer", err);
+
+	/* find out our client's id */
+	client = snd_seq_client_id(seq);
+	check_snd("get client id", client);
+}
+
+/* set up UMP virtual client/port */
+static void create_ump_client(void)
+{
+	snd_ump_endpoint_info_t *ep;
+	snd_ump_block_info_t *blk;
+	snd_seq_port_info_t *pinfo;
+	int i, err;
+
+	/* create a UMP Endpoint */
+	snd_ump_endpoint_info_alloca(&ep);
+	snd_ump_endpoint_info_set_name(ep, "arecordmidi2");
+	if (midi_version == 1) {
+		snd_ump_endpoint_info_set_protocol_caps(ep, SND_UMP_EP_INFO_PROTO_MIDI1);
+		snd_ump_endpoint_info_set_protocol(ep, SND_UMP_EP_INFO_PROTO_MIDI1);
+	} else {
+		snd_ump_endpoint_info_set_protocol_caps(ep, SND_UMP_EP_INFO_PROTO_MIDI2);
+		snd_ump_endpoint_info_set_protocol(ep, SND_UMP_EP_INFO_PROTO_MIDI2);
+	}
+	snd_ump_endpoint_info_set_num_blocks(ep, port_count);
+
+	err = snd_seq_create_ump_endpoint(seq, ep, port_count);
+	check_snd("create UMP endpoint", err);
+
+	/* create UMP Function Blocks */
+	snd_ump_block_info_alloca(&blk);
+	for (i = 0; i < port_count; i++) {
+		char blkname[32];
+
+		sprintf(blkname, "Group %d", i + 1);
+		snd_ump_block_info_set_name(blk, blkname);
+		snd_ump_block_info_set_direction(blk, SND_UMP_DIR_INPUT);
+		snd_ump_block_info_set_first_group(blk, i);
+		snd_ump_block_info_set_num_groups(blk, 1);
+		snd_ump_block_info_set_ui_hint(blk, SND_UMP_BLOCK_UI_HINT_RECEIVER);
+
+		err = snd_seq_create_ump_block(seq, i, blk);
+		check_snd("create UMP block", err);
+	}
+
+	/* toggle timestamping for all input ports */
+	snd_seq_port_info_alloca(&pinfo);
+	for (i = 0; i <= port_count; i++) {
+		err = snd_seq_get_port_info(seq, i, pinfo);
+		check_snd("get port info", err);
+		snd_seq_port_info_set_timestamping(pinfo, 1);
+		snd_seq_port_info_set_timestamp_queue(pinfo, queue);
+		snd_seq_set_port_info(seq, i, pinfo);
+		check_snd("set port info", err);
+	}
+}
+
+/* parses one or more port addresses from the string */
+static void parse_ports(const char *arg)
+{
+	char *buf, *s, *port_name;
+	int err;
+
+	/* make a copy of the string because we're going to modify it */
+	buf = strdup(arg);
+	check_mem(buf);
+
+	for (port_name = s = buf; s; port_name = s + 1) {
+		/* Assume that ports are separated by commas.  We don't use
+		 * spaces because those are valid in client names.
+		 */
+		s = strchr(port_name, ',');
+		if (s)
+			*s = '\0';
+
+		++port_count;
+		ports = realloc(ports, port_count * sizeof(snd_seq_addr_t));
+		check_mem(ports);
+
+		err = snd_seq_parse_address(seq, &ports[port_count - 1], port_name);
+		if (err < 0)
+			fatal("Invalid port %s - %s", port_name, snd_strerror(err));
+	}
+
+	free(buf);
+}
+
+/* parses time signature specification */
+static void time_signature(const char *arg)
+{
+	long x = 0;
+	char *sep;
+
+	x = strtol(arg, &sep, 10);
+	if (x < 1 || x > 64 || *sep != ':')
+		fatal("Invalid time signature (%s)", arg);
+	ts_num = x;
+	x = strtol(++sep, NULL, 10);
+	if (x < 1 || x > 64)
+		fatal("Invalid time signature (%s)", arg);
+	ts_div = x;
+}
+
+/* create a queue, set up the default tempo */
+static void create_queue(void)
+{
+	snd_seq_queue_tempo_t *tempo;
+
+	if (!snd_seq_has_queue_tempo_base(seq))
+		tempo_base = 1000;
+
+	queue = snd_seq_alloc_named_queue(seq, "arecordmidi2");
+	check_snd("create queue", queue);
+
+	snd_seq_queue_tempo_alloca(&tempo);
+	if (tempo_base == 1000)
+		snd_seq_queue_tempo_set_tempo(tempo, 60000000 / beats);
+	else
+		snd_seq_queue_tempo_set_tempo(tempo, (unsigned int)(6000000000ULL / beats));
+	snd_seq_queue_tempo_set_ppq(tempo, ticks);
+	snd_seq_queue_tempo_set_tempo_base(tempo, tempo_base);
+	if (snd_seq_set_queue_tempo(seq, queue, tempo) < 0)
+		fatal("Cannot set queue tempo (%d)", queue);
+}
+
+/* connect to the input ports */
+static void connect_ports(void)
+{
+	int i, err;
+
+	for (i = 0; i < port_count; ++i) {
+		err = snd_seq_connect_from(seq, i + 1,
+					   ports[i].client, ports[i].port);
+		check_snd("port connection", err);
+	}
+}
+
+/* write the given UMP packet */
+static void write_ump(FILE *file, const void *src)
+{
+	const snd_ump_msg_hdr_t *h = src;
+	const uint32_t *p = src;
+	uint32_t v;
+	int len;
+
+	len = snd_ump_packet_length(h->type);
+	while (len-- > 0) {
+		v = htobe32(*p++);
+		fwrite(&v, 4, 1, file);
+	}
+}
+
+/* write a DC message */
+static void write_dcs(FILE *file, unsigned int t)
+{
+	snd_ump_msg_dc_t d = {};
+
+	d.type = SND_UMP_MSG_TYPE_UTILITY;
+	d.status = SND_UMP_UTILITY_MSG_STATUS_DC;
+	d.ticks = t;
+	write_ump(file, &d);
+}
+
+/* write a DCTPQ message */
+static void write_dctpq(FILE *file)
+{
+	snd_ump_msg_dctpq_t d = {};
+
+	d.type = SND_UMP_MSG_TYPE_UTILITY;
+	d.status = SND_UMP_UTILITY_MSG_STATUS_DCTPQ;
+	d.ticks = ticks;
+	write_ump(file, &d);
+}
+
+/* write a Start Clip message */
+static void write_start_clip(FILE *file)
+{
+	snd_ump_msg_stream_gen_t d = {};
+
+	d.type = SND_UMP_MSG_TYPE_STREAM;
+	d.status = SND_UMP_STREAM_MSG_STATUS_START_CLIP;
+	write_ump(file, &d);
+}
+
+/* write an End Clip message */
+static void write_end_clip(FILE *file)
+{
+	snd_ump_msg_stream_gen_t d = {};
+
+	d.type = SND_UMP_MSG_TYPE_STREAM;
+	d.status = SND_UMP_STREAM_MSG_STATUS_END_CLIP;
+	write_ump(file, &d);
+}
+
+/* write a Set Tempo message */
+static void write_tempo(FILE *file)
+{
+	snd_ump_msg_set_tempo_t d = {};
+
+	d.type = SND_UMP_MSG_TYPE_FLEX_DATA;
+	d.group = 0;
+	d.format = SND_UMP_FLEX_DATA_MSG_FORMAT_SINGLE;
+	d.addrs = SND_UMP_FLEX_DATA_MSG_ADDR_GROUP;
+	d.status_bank = SND_UMP_FLEX_DATA_MSG_BANK_SETUP;
+	d.status = SND_UMP_FLEX_DATA_MSG_STATUS_SET_TEMPO;
+	d.tempo = (unsigned int)(6000000000ULL / beats);
+	write_ump(file, &d);
+}
+
+/* write a Set Time Signature message */
+static void write_time_sig(FILE *file)
+{
+	snd_ump_msg_set_time_sig_t d = {};
+
+	d.type = SND_UMP_MSG_TYPE_FLEX_DATA;
+	d.group = 0;
+	d.format = SND_UMP_FLEX_DATA_MSG_FORMAT_SINGLE;
+	d.addrs = SND_UMP_FLEX_DATA_MSG_ADDR_GROUP;
+	d.status_bank = SND_UMP_FLEX_DATA_MSG_BANK_SETUP;
+	d.status = SND_UMP_FLEX_DATA_MSG_STATUS_SET_TIME_SIGNATURE;
+	d.numerator = ts_num;
+	d.denominator = ts_div;
+	d.num_notes = 8;
+	write_ump(file, &d);
+}
+
+/* record the delta time from the last event */
+static void delta_time(FILE *file, const snd_seq_ump_event_t *ev)
+{
+	int diff = ev->time.tick - last_tick;
+
+	if (diff <= 0)
+		return;
+	if (tempo_base == 1000)
+		diff *= 100;
+	write_dcs(file, diff);
+	last_tick = ev->time.tick;
+}
+
+static void record_event(FILE *file, const snd_seq_ump_event_t *ev)
+{
+	/* ignore events without proper timestamps */
+	if (ev->queue != queue || !snd_seq_ev_is_tick(ev) ||
+	    !snd_seq_ev_is_ump(ev))
+		return;
+
+	delta_time(file, ev);
+	write_ump(file, ev->ump);
+}
+
+/* write MIDI Clip file header and the configuration packets */
+static void write_file_header(FILE *file)
+{
+	/* header id */
+	fwrite("SMF2CLIP", 1, 8, file);
+
+	/* clip configuration header */
+	/* FIXME: add profiles */
+
+	/* first DCS */
+	write_dcs(file, 0);
+	write_dctpq(file);
+
+	/* start bar */
+	write_start_clip(file);
+	write_tempo(file);
+	write_time_sig(file);
+}
+
+static void help(const char *argv0)
+{
+	fprintf(stderr, "Usage: %s [options] outputfile\n"
+		"\nAvailable options:\n"
+		"  -h,--help                  this help\n"
+		"  -V,--version               show version\n"
+		"  -p,--port=client:port,...  source port(s)\n"
+		"  -b,--bpm=beats             tempo in beats per minute\n"
+		"  -t,--ticks=ticks           resolution in ticks per beat or frame\n"
+		"  -i,--timesig=nn:dd         time signature\n"
+		"  -n,--num-events=events     fixed number of events to record, then exit\n"
+		"  -u,--ump=version           UMP MIDI version (1 or 2)\n",
+		argv0);
+}
+
+static void version(void)
+{
+	fputs("arecordmidi version " SND_UTIL_VERSION_STR "\n", stderr);
+}
+
+static void sighandler(int sig ATTRIBUTE_UNUSED)
+{
+	stop = 1;
+}
+
+int main(int argc, char *argv[])
+{
+	static const char short_options[] = "hVp:b:t:n:u:";
+	static const struct option long_options[] = {
+		{"help", 0, NULL, 'h'},
+		{"version", 0, NULL, 'V'},
+		{"port", 1, NULL, 'p'},
+		{"bpm", 1, NULL, 'b'},
+		{"ticks", 1, NULL, 't'},
+		{"timesig", 1, NULL, 'i'},
+		{"num-events", 1, NULL, 'n'},
+		{"ump", 1, NULL, 'u'},
+		{0}
+	};
+
+	char *filename;
+	FILE *file;
+	struct pollfd *pfds;
+	int npfds;
+	int c, err;
+	/* If |num_events| isn't specified, leave it at 0. */
+	long num_events = 0;
+	long events_received = 0;
+
+	init_seq();
+
+	while ((c = getopt_long(argc, argv, short_options,
+				long_options, NULL)) != -1) {
+		switch (c) {
+		case 'h':
+			help(argv[0]);
+			return 0;
+		case 'V':
+			version();
+			return 0;
+		case 'p':
+			parse_ports(optarg);
+			break;
+		case 'b':
+			beats = atoi(optarg);
+			if (beats < 4 || beats > 6000)
+				fatal("Invalid tempo");
+			break;
+		case 't':
+			ticks = atoi(optarg);
+			if (ticks < 1 || ticks > 0x7fff)
+				fatal("Invalid number of ticks");
+			break;
+		case 'i':
+			time_signature(optarg);
+			break;
+		case 'n':
+			err = 0;
+			num_events = arg_parse_decimal_num(optarg, &err);
+			if (err != 0) {
+				fatal("Couldn't parse num_events argument: %s\n",
+					strerror(-err));
+			}
+			if (num_events <= 0)
+				fatal("num_events must be greater than 0");
+			break;
+		case 'u':
+			midi_version = atoi(optarg);
+			if (midi_version != 1 && midi_version != 2)
+				fatal("Invalid MIDI version %d\n", midi_version);
+			break;
+		default:
+			help(argv[0]);
+			return 1;
+		}
+	}
+
+	if (port_count < 1) {
+		fputs("Pleast specify a source port with --port.\n", stderr);
+		return 1;
+	}
+
+	if (optind >= argc) {
+		fputs("Please specify a file to record to.\n", stderr);
+		return 1;
+	}
+
+	create_queue();
+	create_ump_client();
+	connect_ports();
+
+	filename = argv[optind];
+
+	file = fopen(filename, "wb");
+	if (!file)
+		fatal("Cannot open %s - %s", filename, strerror(errno));
+
+	write_file_header(file);
+
+	err = snd_seq_start_queue(seq, queue, NULL);
+	check_snd("start queue", err);
+	snd_seq_drain_output(seq);
+
+	err = snd_seq_nonblock(seq, 1);
+	check_snd("set nonblock mode", err);
+
+	signal(SIGINT, sighandler);
+	signal(SIGTERM, sighandler);
+
+	npfds = snd_seq_poll_descriptors_count(seq, POLLIN);
+	pfds = alloca(sizeof(*pfds) * npfds);
+	for (;;) {
+		snd_seq_poll_descriptors(seq, pfds, npfds, POLLIN);
+		if (poll(pfds, npfds, -1) < 0)
+			break;
+		do {
+			snd_seq_ump_event_t *event;
+
+			err = snd_seq_ump_event_input(seq, &event);
+			if (err < 0)
+				break;
+			if (event) {
+				record_event(file, event);
+				events_received++;
+			}
+		} while (err > 0);
+		if (stop)
+			break;
+		if (num_events && (events_received >= num_events))
+			break;
+	}
+
+	if (num_events && events_received < num_events)
+		fputs("Warning: Received signal before num_events\n", stdout);
+
+	write_end_clip(file);
+	fclose(file);
+	snd_seq_close(seq);
+	return 0;
+}
-- 
2.43.0

