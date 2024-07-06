Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC5D929190
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2024 09:46:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852FBE8E;
	Sat,  6 Jul 2024 09:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852FBE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720251994;
	bh=NhEvh93pOnGX8YoFcZsj2dBpsd7HUF850HSyvQgJWGs=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SbhHGWk1csZkgCfVaV22+YxFVT6RnXXVrkvNfbma4O0MTlxtVk79VbsNj1+oCP7MA
	 Q8qptB7jihxM9gBKcwwgDz+08qP27hAjUBo4Jbp+JscCDoOQj5cCSWQPYL+fRTzia8
	 Rc3688AyIVWwRi32WbHFzrh5gkYaVmM4jbrPekBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE3B3F805D6; Sat,  6 Jul 2024 09:45:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA272F805D4;
	Sat,  6 Jul 2024 09:45:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5041F804FC; Sat,  6 Jul 2024 09:42:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0D15F8025E
	for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2024 09:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0D15F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kjFFFpCN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bqhnj/YJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=kjFFFpCN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bqhnj/YJ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 53B621F809;
	Sat,  6 Jul 2024 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yPitnYP7MSxMArmODuHFAOIrr8B1SqGskEuui3xj6ZU=;
	b=kjFFFpCNCbIg9C1pwjXqq8TQrndYT7Sfs/MdogbbPHqrnVRZheMJwSutYYfJwoAwN+zk6s
	zB/QH48bXv2yADYfAb9vtwSq2o7DJOccwMpggU1kzuNEPhhvs3EV0c2EjTefARYL3GgwfP
	Z+IZNs7MBvcnyi+0m/D6gHoT9OLZXqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yPitnYP7MSxMArmODuHFAOIrr8B1SqGskEuui3xj6ZU=;
	b=bqhnj/YJ984DNg+EvHRMC5T3TftQ+PRIV6qUAVLJR2lmhlkLnCrY8tmP0E7v1WVjZUFgZ3
	C8ur/OdqOKIVwQCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kjFFFpCN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="bqhnj/YJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yPitnYP7MSxMArmODuHFAOIrr8B1SqGskEuui3xj6ZU=;
	b=kjFFFpCNCbIg9C1pwjXqq8TQrndYT7Sfs/MdogbbPHqrnVRZheMJwSutYYfJwoAwN+zk6s
	zB/QH48bXv2yADYfAb9vtwSq2o7DJOccwMpggU1kzuNEPhhvs3EV0c2EjTefARYL3GgwfP
	Z+IZNs7MBvcnyi+0m/D6gHoT9OLZXqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=yPitnYP7MSxMArmODuHFAOIrr8B1SqGskEuui3xj6ZU=;
	b=bqhnj/YJ984DNg+EvHRMC5T3TftQ+PRIV6qUAVLJR2lmhlkLnCrY8tmP0E7v1WVjZUFgZ3
	C8ur/OdqOKIVwQCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 336EA12FF6;
	Sat,  6 Jul 2024 07:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4V4KC031iGZRDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jul 2024 07:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 1/5] aplaymidi2: Add initial version
Date: Sat,  6 Jul 2024 09:42:27 +0200
Message-ID: <20240706074232.6364-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 53B621F809
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
Message-ID-Hash: HT7OSXXKTJNRUUTWQMH4DJFV34SHYN7B
X-Message-ID-Hash: HT7OSXXKTJNRUUTWQMH4DJFV34SHYN7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HT7OSXXKTJNRUUTWQMH4DJFV34SHYN7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

aplaymidi2 is a program similar like aplaymidi, but intended for
playing back a MIDI Clip file that was introduced for handling UMP.
MIDI Clip file contains UMP packets, and its structure is much simpler
than SMF.

The options are mostly same as aplaymidi, but I omitted -l option for
simplifying the code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 configure.ac                |   2 +-
 seq/Makefile.am             |   2 +-
 seq/aplaymidi2/Makefile.am  |   5 +
 seq/aplaymidi2/aplaymidi2.1 |  71 ++++++
 seq/aplaymidi2/aplaymidi2.c | 447 ++++++++++++++++++++++++++++++++++++
 5 files changed, 525 insertions(+), 2 deletions(-)
 create mode 100644 seq/aplaymidi2/Makefile.am
 create mode 100644 seq/aplaymidi2/aplaymidi2.1
 create mode 100644 seq/aplaymidi2/aplaymidi2.c

diff --git a/configure.ac b/configure.ac
index 173b9ed1644c..708380cf31dc 100644
--- a/configure.ac
+++ b/configure.ac
@@ -486,7 +486,7 @@ AC_OUTPUT(Makefile alsactl/Makefile alsactl/init/Makefile \
 	  bat/Makefile bat/tests/Makefile bat/tests/asound_state/Makefile \
 	  aplay/Makefile include/Makefile iecset/Makefile utils/Makefile \
 	  utils/alsa-utils.spec seq/Makefile seq/aconnect/Makefile \
-	  seq/aplaymidi/Makefile seq/aseqdump/Makefile seq/aseqnet/Makefile \
+	  seq/aplaymidi/Makefile seq/aplaymidi2/Makefile seq/aseqdump/Makefile seq/aseqnet/Makefile \
 	  seq/aseqsend/Makefile speaker-test/Makefile speaker-test/samples/Makefile \
 	  alsaloop/Makefile alsa-info/Makefile \
 	  axfer/Makefile axfer/test/Makefile \
diff --git a/seq/Makefile.am b/seq/Makefile.am
index b0f628aac4da..a6171268186b 100644
--- a/seq/Makefile.am
+++ b/seq/Makefile.am
@@ -1 +1 @@
-SUBDIRS=aconnect aplaymidi aseqdump aseqnet aseqsend
+SUBDIRS=aconnect aplaymidi aplaymidi2 aseqdump aseqnet aseqsend
diff --git a/seq/aplaymidi2/Makefile.am b/seq/aplaymidi2/Makefile.am
new file mode 100644
index 000000000000..0c5c743f7eb8
--- /dev/null
+++ b/seq/aplaymidi2/Makefile.am
@@ -0,0 +1,5 @@
+AM_CPPFLAGS = -I$(top_srcdir)/include
+EXTRA_DIST = aplaymidi2.1
+
+bin_PROGRAMS = aplaymidi2
+man_MANS = aplaymidi2.1
diff --git a/seq/aplaymidi2/aplaymidi2.1 b/seq/aplaymidi2/aplaymidi2.1
new file mode 100644
index 000000000000..99be608f107d
--- /dev/null
+++ b/seq/aplaymidi2/aplaymidi2.1
@@ -0,0 +1,71 @@
+.TH APLAYMIDI2 1 "4 July 2024"
+
+.SH NAME
+aplaymidi2 \- play MIDI Clip Files
+
+.SH SYNOPSIS
+.B aplaymidi2
+\-p client:port[,...] midi2file ...
+
+.SH DESCRIPTION
+.B aplaymidi2
+is a command-line utility that plays the specified MIDI Clip file(s) to one
+or more ALSA sequencer ports.
+
+.SH OPTIONS
+
+.TP
+.I \-h, \-\-help
+Prints a list of options.
+
+.TP
+.I \-V, \-\-version
+Prints the current version.
+
+.TP
+.I \-p, \-\-port=client:port,...
+Sets the sequencer port(s) to which the events in the MIDI Clip file(s) are
+sent.
+
+A client can be specified by its number, its name, or a prefix of its
+name. A port is specified by its number; for port 0 of a client, the
+":0" part of the port specification can be omitted.
+
+Multiple ports can be specified to allow playback of MIDI Clip file(s) that
+contain events for multiple devices (ports) corresponding to the
+multiple UMP Groups.
+
+For compatibility with
+.B pmidi(1),
+the port specification is taken from the
+.I ALSA_OUTPUT_PORTS
+environment variable if none is given on the command line.
+
+.B aplaymidi2
+supports only basic UMP events: in addition to the standard MIDI1 and
+MIDI2 CVMs and 7bit SysEx, only the following are supported:
+DCTPQ, DC, Set Tempo, Start Clip and End Clip.
+Lyrics and other meta data in Flex Data are skipped, so far.
+
+The multiple output ports are useful when the given MIDI Clip file
+contains the UMP packets for multiple Groups.
+When the destination port is a UMP MIDI 2.0 port, the single
+connection should suffice, though, since a MIDI 2.0 port can process
+the inputs for multiple Groups.  For other cases (e.g. connecting to a
+legacy MIDI port), you would need to specify the destination port per
+Group.  If undefined, it's sent to the first destination port as
+default.
+
+.TP
+.I \-d, \-\-delay=seconds
+Specifies how long to wait after the end of each MIDI Clip file,
+to allow the last notes to die away.
+Default is 2 seconds.
+
+.SH SEE ALSO
+pmidi(1)
+.br
+aplaymidi(1)
+
+.SH AUTHOR
+Takashi Iwai <tiwai@suse.de>
diff --git a/seq/aplaymidi2/aplaymidi2.c b/seq/aplaymidi2/aplaymidi2.c
new file mode 100644
index 000000000000..435b7de1aa95
--- /dev/null
+++ b/seq/aplaymidi2/aplaymidi2.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * aplaymidi2.c - simple player of a MIDI Clip File over ALSA sequencer
+ */
+
+#include "aconfig.h"
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <getopt.h>
+#include <unistd.h>
+#include <alsa/asoundlib.h>
+#include <alsa/ump_msg.h>
+#include "version.h"
+
+static snd_seq_t *seq;
+static int client;
+static int port_count;
+static snd_seq_addr_t ports[16];
+static int queue;
+static int end_delay = 2;
+
+static unsigned int _current_tempo  = 50000000; /* default 120 bpm */
+static unsigned int tempo_base = 10;
+static unsigned int current_tick;
+
+/* prints an error message to stderr */
+static void errormsg(const char *msg, ...)
+{
+	va_list ap;
+
+	va_start(ap, msg);
+	vfprintf(stderr, msg, ap);
+	va_end(ap);
+	fputc('\n', stderr);
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
+/* open and initialize the sequencer client */
+static void init_seq(void)
+{
+	int err;
+
+	err = snd_seq_open(&seq, "default", SND_SEQ_OPEN_DUPLEX, 0);
+	check_snd("open sequencer", err);
+
+	err = snd_seq_set_client_name(seq, "aplaymidi2");
+	check_snd("set client name", err);
+
+	client = snd_seq_client_id(seq);
+	check_snd("get client id", client);
+
+	err = snd_seq_set_client_midi_version(seq, SND_SEQ_CLIENT_UMP_MIDI_2_0);
+	check_snd("set midi version", err);
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
+		 * spaces because those are valid in client names. */
+		s = strchr(port_name, ',');
+		if (s)
+			*s = '\0';
+
+		++port_count;
+		if (port_count > 16)
+			fatal("Too many ports specified");
+
+		err = snd_seq_parse_address(seq, &ports[port_count - 1], port_name);
+		if (err < 0)
+			fatal("Invalid port %s - %s", port_name, snd_strerror(err));
+	}
+
+	free(buf);
+}
+
+/* create a source port to send from */
+static void create_source_port(void)
+{
+	snd_seq_port_info_t *pinfo;
+	int err;
+
+	snd_seq_port_info_alloca(&pinfo);
+
+	/* the first created port is 0 anyway, but let's make sure ... */
+	snd_seq_port_info_set_port(pinfo, 0);
+	snd_seq_port_info_set_port_specified(pinfo, 1);
+
+	snd_seq_port_info_set_name(pinfo, "aplaymidi2");
+
+	snd_seq_port_info_set_capability(pinfo, 0); /* sic */
+	snd_seq_port_info_set_type(pinfo,
+				   SND_SEQ_PORT_TYPE_MIDI_GENERIC |
+				   SND_SEQ_PORT_TYPE_APPLICATION);
+
+	err = snd_seq_create_port(seq, pinfo);
+	check_snd("create port", err);
+}
+
+/* create a queue */
+static void create_queue(void)
+{
+	if (!snd_seq_has_queue_tempo_base(seq))
+		tempo_base = 1000;
+
+	queue = snd_seq_alloc_named_queue(seq, "aplaymidi2");
+	check_snd("create queue", queue);
+}
+
+/* connect to destination ports */
+static void connect_ports(void)
+{
+	int i, err;
+
+	for (i = 0; i < port_count; ++i) {
+		err = snd_seq_connect_to(seq, 0, ports[i].client, ports[i].port);
+		if (err < 0)
+			fatal("Cannot connect to port %d:%d - %s",
+			      ports[i].client, ports[i].port, snd_strerror(err));
+	}
+}
+
+/* read 32bit word and convert to native endian:
+ * return 0 on success, -1 on error
+ */
+static int read_word(FILE *file, uint32_t *dest)
+{
+	uint32_t v;
+
+	if (fread(&v, 4, 1, file) != 1)
+		return -1;
+	*dest = be32toh(v);
+	return 0;
+}
+
+/* read a UMP packet: return the number of packets, -1 on error */
+static int read_ump_packet(FILE *file, uint32_t *buf)
+{
+	snd_ump_msg_hdr_t *h = (snd_ump_msg_hdr_t *)buf;
+
+	int i, num;
+
+	if (read_word(file, buf) < 0)
+		return -1;
+	num = snd_ump_packet_length(h->type);
+	for (i = 1; i < num; i++) {
+		if (read_word(file, buf + i) < 0)
+			return -1;
+	}
+	return num;
+}
+
+/* read the file header and verify it's MIDI Clip File: return 0 on success */
+static int verify_file_header(FILE *file)
+{
+	unsigned char buf[8];
+
+	if (fread(buf, 1, 8, file) != 8)
+		return -1;
+	if (memcmp(buf, "SMF2CLIP", 8))
+		return -1;
+	return 0;
+}
+
+/* return the current tempo, corrected to be sent to host */
+static int current_tempo(void)
+{
+	if (tempo_base != 10)
+		return _current_tempo / 100; /* down to us */
+	return _current_tempo;
+}
+
+/* send a timer event */
+static void send_timer_event(unsigned int type, unsigned int val)
+{
+	snd_seq_ump_event_t ev = {
+		.type = type,
+		.flags = SND_SEQ_TIME_STAMP_TICK | SND_SEQ_EVENT_LENGTH_FIXED,
+	};
+
+	ev.queue = queue;
+	ev.source.port = 0;
+	ev.time.tick = current_tick;
+
+	ev.dest.client = SND_SEQ_CLIENT_SYSTEM;
+	ev.dest.port = SND_SEQ_PORT_SYSTEM_TIMER;
+	ev.data.queue.queue = queue;
+	ev.data.queue.param.value = val;
+
+	snd_seq_ump_event_output(seq, &ev);
+}
+
+/* set DCTPQ */
+static void set_dctpq(unsigned int ppq)
+{
+	snd_seq_queue_tempo_t *queue_tempo;
+
+	snd_seq_queue_tempo_alloca(&queue_tempo);
+	snd_seq_queue_tempo_set_tempo(queue_tempo, current_tempo());
+	snd_seq_queue_tempo_set_ppq(queue_tempo, ppq);
+	snd_seq_queue_tempo_set_tempo_base(queue_tempo, tempo_base);
+
+	if (snd_seq_set_queue_tempo(seq, queue, queue_tempo) < 0)
+		errormsg("Cannot set queue tempo (%d)", queue);
+}
+
+/* set DC */
+static void set_dc(unsigned int ticks)
+{
+	current_tick += ticks;
+}
+
+/* set tempo event */
+static void set_tempo(unsigned int tempo)
+{
+	_current_tempo = tempo;
+	send_timer_event(SND_SEQ_EVENT_TEMPO, current_tempo());
+}
+
+/* start clip */
+static void start_clip(void)
+{
+	if (snd_seq_start_queue(seq, queue, NULL) < 0)
+		errormsg("Cannot start queue (%d)", queue);
+}
+
+/* end clip */
+static void end_clip(void)
+{
+	send_timer_event(SND_SEQ_EVENT_STOP, 0);
+}
+
+/* send a UMP packet */
+static void send_ump(const uint32_t *ump, int len)
+{
+	snd_seq_ump_event_t ev = {
+		.flags = SND_SEQ_TIME_STAMP_TICK | SND_SEQ_EVENT_LENGTH_FIXED |
+		SND_SEQ_EVENT_UMP,
+	};
+	int group;
+
+	memcpy(ev.ump, ump, len * 4);
+
+	ev.queue = queue;
+	ev.source.port = 0;
+	ev.time.tick = current_tick;
+	group = snd_ump_msg_group(ump);
+	if (group >= port_count)
+		ev.dest = ports[0];
+	else
+		ev.dest = ports[group];
+
+	snd_seq_ump_event_output(seq, &ev);
+}
+
+/* play the given MIDI Clip File content */
+static void play_midi(FILE *file)
+{
+	uint32_t ump[4];
+	int len;
+
+	current_tick = 0;
+
+	while ((len = read_ump_packet(file, ump)) > 0) {
+		const snd_ump_msg_hdr_t *h = (snd_ump_msg_hdr_t *)ump;
+
+		if (h->type == SND_UMP_MSG_TYPE_UTILITY) {
+			const snd_ump_msg_utility_t *uh =
+				(const snd_ump_msg_utility_t *)ump;
+			switch (h->status) {
+			case SND_UMP_UTILITY_MSG_STATUS_DCTPQ:
+				set_dctpq(uh->dctpq.ticks);
+				continue;
+			case SND_UMP_UTILITY_MSG_STATUS_DC:
+				set_dc(uh->dctpq.ticks);
+				continue;
+			}
+		} else if (h->type == SND_UMP_MSG_TYPE_FLEX_DATA) {
+			const snd_ump_msg_flex_data_t *fh =
+				(const snd_ump_msg_flex_data_t *)ump;
+			if (fh->meta.status_bank == SND_UMP_FLEX_DATA_MSG_BANK_SETUP &&
+			    fh->meta.status == SND_UMP_FLEX_DATA_MSG_STATUS_SET_TEMPO) {
+				set_tempo(fh->set_tempo.tempo);
+				continue;
+			}
+		} else if (h->type == SND_UMP_MSG_TYPE_STREAM) {
+			const snd_ump_msg_stream_t *sh =
+				(const snd_ump_msg_stream_t *)ump;
+			switch (sh->gen.status) {
+			case SND_UMP_STREAM_MSG_STATUS_START_CLIP:
+				start_clip();
+				continue;
+			case SND_UMP_STREAM_MSG_STATUS_END_CLIP:
+				end_clip();
+				continue;
+			}
+		} else if (h->type == SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE ||
+			   h->type == SND_UMP_MSG_TYPE_DATA ||
+			   h->type == SND_UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE) {
+			send_ump(ump, len);
+		}
+	}
+
+	snd_seq_drain_output(seq);
+	snd_seq_sync_output_queue(seq);
+
+	/* give the last notes time to die away */
+	if (end_delay > 0)
+		sleep(end_delay);
+}
+
+static void play_file(const char *file_name)
+{
+	FILE *file;
+
+	if (!strcmp(file_name, "-"))
+		file = stdin;
+	else
+		file = fopen(file_name, "rb");
+	if (!file) {
+		errormsg("Cannot open %s - %s", file_name, strerror(errno));
+		return;
+	}
+
+	if (verify_file_header(file) < 0) {
+		errormsg("%s is not a MIDI Clip File", file_name);
+		goto error;
+	}
+
+	play_midi(file);
+
+ error:
+	if (file != stdin)
+		fclose(file);
+}
+
+static void usage(const char *argv0)
+{
+	printf(
+		"Usage: %s -p client:port[,...] [-d delay] midifile ...\n"
+		"-h, --help                  this help\n"
+		"-V, --version               print current version\n"
+		"-p, --port=client:port,...  set port(s) to play to\n"
+		"-d, --delay=seconds         delay after song ends\n",
+		argv0);
+}
+
+static void version(void)
+{
+	puts("aplaymidi2 version " SND_UTIL_VERSION_STR);
+}
+
+int main(int argc, char *argv[])
+{
+	static const struct option long_options[] = {
+		{"help", 0, NULL, 'h'},
+		{"version", 0, NULL, 'V'},
+		{"port", 1, NULL, 'p'},
+		{"delay", 1, NULL, 'd'},
+		{0}
+	};
+	int c;
+
+	init_seq();
+
+	while ((c = getopt_long(argc, argv, "hVp:d:",
+				long_options, NULL)) != -1) {
+		switch (c) {
+		case 'h':
+			usage(argv[0]);
+			return 0;
+		case 'V':
+			version();
+			return 0;
+		case 'p':
+			parse_ports(optarg);
+			break;
+		case 'd':
+			end_delay = atoi(optarg);
+			break;
+		default:
+			usage(argv[0]);
+			return 1;
+		}
+	}
+
+
+	if (port_count < 1) {
+		/* use env var for compatibility with pmidi */
+		const char *ports_str = getenv("ALSA_OUTPUT_PORTS");
+		if (ports_str)
+			parse_ports(ports_str);
+		if (port_count < 1) {
+			errormsg("Please specify at least one port with --port.");
+			return 1;
+		}
+	}
+	if (optind >= argc) {
+		errormsg("Please specify a file to play.");
+		return 1;
+	}
+
+	create_source_port();
+	create_queue();
+	connect_ports();
+
+	for (; optind < argc; optind++)
+		play_file(argv[optind]);
+
+	snd_seq_close(seq);
+	return 0;
+}
-- 
2.43.0

