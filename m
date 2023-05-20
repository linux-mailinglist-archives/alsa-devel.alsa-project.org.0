Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7049C70A60F
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 09:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC15209;
	Sat, 20 May 2023 09:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC15209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684566524;
	bh=PdIT3ICYqNGge9juKk0xy9KBjouHa4s+LE42qIw2DPE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bDFQSeSVxlfdJLlUAvJoLEsM62QsoAzAo78QKkNb9/P2LiWVAkKHuZ+CZs0NjAadV
	 +CqlMEeKsxlDCzsswcEAt0fCxG/LITC6s7nLEIq9ejMJXgVoU8RTjcS2b03RAJIsNB
	 OpHiQSKU4DdWxJWvJtMqR3fqShurRTZo58w8z/eY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F6C3F80087; Sat, 20 May 2023 09:07:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52078F80087;
	Sat, 20 May 2023 09:07:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9FE5F8053D; Sat, 20 May 2023 09:07:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 173FEF8025A
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 09:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 173FEF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VjlWXb4G;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RfkEE+50
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A867E220DA;
	Sat, 20 May 2023 07:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684566463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnS5D+lKrd9D8rcuWQ0Jp7SYxA3HGPJ480QzqEcnpQA=;
	b=VjlWXb4GSIWndpH1SHzp067IofacReWUEGFUlOfjRGWT2mBLn9ifQFFHyUkZSLMAN4TV+d
	r20j7ASpUKHhecPlv6msBLPalX4Y9eESp92v5j05VSQpgbSZNPjYeH0z6YRgl/HYFUxX0P
	/CSz9uRbtM0qjEc9khj0CgnTHQpDHow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684566463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnS5D+lKrd9D8rcuWQ0Jp7SYxA3HGPJ480QzqEcnpQA=;
	b=RfkEE+50WI78NnQI7G3mP34h/MDY1u1k3DNSt4/3mretUWfF68mde6IRia2lxcCDOjDjys
	N6TgpLMTbppBakBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88595139F5;
	Sat, 20 May 2023 07:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AFCAIL9xaGRrHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 07:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 1/3] aseqdump: Add UMP support
Date: Sat, 20 May 2023 09:07:36 +0200
Message-Id: <20230520070738.8382-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230520070738.8382-1-tiwai@suse.de>
References: <20230520070738.8382-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4HCMEDA7L5XZSSM3ETQLIUDXCNCS7LJP
X-Message-ID-Hash: 4HCMEDA7L5XZSSM3ETQLIUDXCNCS7LJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HCMEDA7L5XZSSM3ETQLIUDXCNCS7LJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the support for showing the UMP events to aseqdump.
With the new option -u, the program can start as a UMP sequencer
client and receive UMP events instead of the legacy MIDI events.

Also, the automatic event conversion among legacy and UMP clients can
be suppressed by the new -r option, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 configure.ac            |   4 +
 seq/aseqdump/aseqdump.1 |   9 ++
 seq/aseqdump/aseqdump.c | 211 +++++++++++++++++++++++++++++++++++++++-
 3 files changed, 219 insertions(+), 5 deletions(-)

diff --git a/configure.ac b/configure.ac
index e079e241aa29..2ce8a62c585c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -54,6 +54,10 @@ AC_CHECK_LIB([asound], [snd_seq_client_info_get_pid], [HAVE_SEQ_CLIENT_INFO_GET_
 if test "$HAVE_SEQ_CLIENT_INFO_GET_PID" = "yes" ; then
     AC_DEFINE([HAVE_SEQ_CLIENT_INFO_GET_PID], 1, [alsa-lib supports snd_seq_client_info_get_pid])
 fi
+AC_CHECK_LIB([asound], [snd_seq_client_info_get_midi_version], [HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION="yes"])
+if test "$HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION" = "yes" ; then
+    AC_DEFINE([HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION], 1, [alsa-lib supports snd_seq_client_info_get_midi_version])
+fi
 AC_CHECK_LIB([atopology], [snd_tplg_save], [have_topology="yes"], [have_topology="no"])
 
 #
diff --git a/seq/aseqdump/aseqdump.1 b/seq/aseqdump/aseqdump.1
index f6f2aa9cb12b..6f7904159b90 100644
--- a/seq/aseqdump/aseqdump.1
+++ b/seq/aseqdump/aseqdump.1
@@ -27,6 +27,15 @@ Prints the current version.
 .I \-l,\-\-list
 Prints a list of possible input ports.
 
+.TP
+.I \-u,\-\-ump=version
+Sets the client MIDI version.
+0 is for legacy mode, 1 is UMP MIDI 1.0 mode, and 2 is UMP MIDI 2.0 mode.
+
+.TP
+.I \-r,\-\-raw
+Suppress the automatic conversion of events among UMP and legacy clients.
+
 .TP
 .I \-p,\-\-port=client:port,...
 Sets the sequencer port(s) from which events are received.
diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index 44ae3bbc5654..1fee0430f9b3 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -29,12 +29,19 @@
 #include <alsa/asoundlib.h>
 #include "aconfig.h"
 #include "version.h"
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+#include <alsa/ump_msg.h>
+#endif
 
 static snd_seq_t *seq;
 static int port_count;
 static snd_seq_addr_t *ports;
 static volatile sig_atomic_t stop = 0;
-
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+static int ump_version;
+#else
+#define ump_version	0
+#endif
 
 /* prints an error message to stderr, and dies */
 static void fatal(const char *msg, ...)
@@ -131,6 +138,7 @@ static void connect_ports(void)
 static void dump_event(const snd_seq_event_t *ev)
 {
 	printf("%3d:%-3d ", ev->source.client, ev->source.port);
+
 	switch (ev->type) {
 	case SND_SEQ_EVENT_NOTEON:
 		if (ev->data.note.velocity)
@@ -297,6 +305,165 @@ static void dump_event(const snd_seq_event_t *ev)
 	}
 }
 
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+static void dump_ump_midi1_event(const unsigned int *ump)
+{
+	const snd_ump_msg_midi1_t *m = (const snd_ump_msg_midi1_t *)ump;
+	unsigned char group = m->hdr.group;
+	unsigned char status = m->hdr.status;
+	unsigned char channel = m->hdr.channel;
+
+	printf("Group %2d, ", group);
+	switch (status) {
+	case SND_UMP_MSG_NOTE_OFF:
+		printf("Note off               %2d, note %d, velocity 0x%x",
+		       channel, m->note_off.note, m->note_off.velocity);
+		break;
+	case SND_UMP_MSG_NOTE_ON:
+		printf("Note on                %2d, note %d, velocity 0x%x",
+		       channel, m->note_off.note, m->note_off.velocity);
+		break;
+	case SND_UMP_MSG_POLY_PRESSURE:
+		printf("Poly pressure          %2d, note %d, value 0x%x",
+		       channel, m->poly_pressure.note, m->poly_pressure.data);
+		break;
+	case SND_UMP_MSG_CONTROL_CHANGE:
+		printf("Control change         %2d, controller %d, value 0x%x",
+		       channel, m->control_change.index, m->control_change.data);
+		break;
+	case SND_UMP_MSG_PROGRAM_CHANGE:
+		printf("Program change         %2d, program %d",
+		       channel, m->program_change.program);
+	case SND_UMP_MSG_CHANNEL_PRESSURE:
+		printf("Channel pressure       %2d, value 0x%x",
+		       channel, m->channel_pressure.data);
+		break;
+	case SND_UMP_MSG_PITCHBEND:
+		printf("Pitchbend              %2d, value 0x%x",
+		       channel, (m->pitchbend.data_msb << 7) | m->pitchbend.data_lsb);
+		break;
+	default:
+		printf("UMP MIDI1 event: status = %d, channel = %d, 0x%08x",
+		       status, channel, *ump);
+		break;
+	}
+	printf("\n");
+}
+
+static void dump_ump_midi2_event(const unsigned int *ump)
+{
+	const snd_ump_msg_midi2_t *m = (const snd_ump_msg_midi2_t *)ump;
+	unsigned char group = m->hdr.group;
+	unsigned char status = m->hdr.status;
+	unsigned char channel = m->hdr.channel;
+	unsigned int bank;
+
+	printf("Group %2d, ", group);
+	switch (status) {
+	case SND_UMP_MSG_PER_NOTE_RCC:
+		printf("Per-note RCC           %2u, note %u, index %u, value 0x%x",
+		       channel, m->per_note_rcc.note,
+		       m->per_note_rcc.index, m->per_note_rcc.data);
+		break;
+	case SND_UMP_MSG_PER_NOTE_ACC:
+		printf("Per-note ACC           %2u, note %u, index %u, value 0x%x",
+		       channel, m->per_note_acc.note,
+		       m->per_note_acc.index, m->per_note_acc.data);
+		break;
+	case SND_UMP_MSG_RPN:
+		printf("RPN                    %2u, bank %u:%u, value 0x%x",
+		       channel, m->rpn.bank, m->rpn.index, m->rpn.data);
+		break;
+	case SND_UMP_MSG_NRPN:
+		printf("NRPN                   %2u, bank %u:%u, value 0x%x",
+		       channel, m->rpn.bank, m->rpn.index, m->rpn.data);
+		break;
+	case SND_UMP_MSG_RELATIVE_RPN:
+		printf("relative RPN           %2u, bank %u:%u, value 0x%x",
+		       channel, m->rpn.bank, m->rpn.index, m->rpn.data);
+		break;
+	case SND_UMP_MSG_RELATIVE_NRPN:
+		printf("relative NRP           %2u, bank %u:%u, value 0x%x",
+		       channel, m->rpn.bank, m->rpn.index, m->rpn.data);
+		break;
+	case SND_UMP_MSG_PER_NOTE_PITCHBEND:
+		printf("Per-note pitchbend     %2d, note %d, value 0x%x",
+		       channel, m->per_note_pitchbend.note,
+		       m->per_note_pitchbend.data);
+		break;
+	case SND_UMP_MSG_NOTE_OFF:
+		printf("Note off               %2d, note %d, velocity 0x%x, attr type = %d, data = 0x%x",
+		       channel, m->note_off.note, m->note_off.velocity,
+		       m->note_off.attr_type, m->note_off.attr_data);
+		break;
+	case SND_UMP_MSG_NOTE_ON:
+		printf("Note on                %2d, note %d, velocity 0x%x, attr type = %d, data = 0x%x",
+		       channel, m->note_off.note, m->note_off.velocity,
+		       m->note_off.attr_type, m->note_off.attr_data);
+		break;
+	case SND_UMP_MSG_POLY_PRESSURE:
+		printf("Poly pressure          %2d, note %d, value 0x%x",
+		       channel, m->poly_pressure.note, m->poly_pressure.data);
+		break;
+	case SND_UMP_MSG_CONTROL_CHANGE:
+		printf("Control change         %2d, controller %d, value 0x%x",
+		       channel, m->control_change.index, m->control_change.data);
+		break;
+	case SND_UMP_MSG_PROGRAM_CHANGE:
+		printf("Program change         %2d, program %d",
+		       channel, m->program_change.program);
+		if (m->program_change.bank_valid)
+			printf(", Bank select %d:%d",
+			       m->program_change.bank_msb,
+			       m->program_change.bank_lsb);
+		break;
+	case SND_UMP_MSG_CHANNEL_PRESSURE:
+		printf("Channel pressure       %2d, value 0x%x",
+		       channel, m->channel_pressure.data);
+		break;
+	case SND_UMP_MSG_PITCHBEND:
+		printf("Channel pressure       %2d, value 0x%x",
+		       channel, m->channel_pressure.data);
+		break;
+	case SND_UMP_MSG_PER_NOTE_MGMT:
+		printf("Per-note management    %2d, value 0x%x",
+		       channel, m->per_note_mgmt.flags);
+		break;
+	default:
+		printf("UMP MIDI2 event: status = %d, channel = %x, 0x%08x",
+		       status, status, *ump);
+		break;
+	}
+	printf("\n");
+}
+
+static void dump_ump_event(const snd_seq_ump_event_t *ev)
+{
+	if (!snd_seq_ev_is_ump(ev)) {
+		dump_event((const snd_seq_event_t *)ev);
+		return;
+	}
+
+	printf("%3d:%-3d ", ev->source.client, ev->source.port);
+
+	switch (snd_ump_msg_type(ev->ump)) {
+	case SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE:
+		dump_ump_midi1_event(ev->ump);
+		break;
+	case SND_UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE:
+		dump_ump_midi2_event(ev->ump);
+		break;
+	default:
+		printf("UMP event: type = %d, group = %d, status = %d, 0x%08x\n",
+		       snd_ump_msg_type(ev->ump),
+		       snd_ump_msg_group(ev->ump),
+		       snd_ump_msg_status(ev->ump),
+		       *ev->ump);
+		break;
+	}
+}
+#endif /* HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION */
+
 static void list_ports(void)
 {
 	snd_seq_client_info_t *cinfo;
@@ -335,6 +502,10 @@ static void help(const char *argv0)
 		"  -h,--help                  this help\n"
 		"  -V,--version               show version\n"
 		"  -l,--list                  list input ports\n"
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+		"  -u,--ump=version           set client MIDI version (0=legacy, 1= UMP MIDI 1.0, 2=UMP MIDI2.0)\n"
+		"  -r,--raw                   do not convert UMP and legacy events\n"
+#endif
 		"  -p,--port=client:port,...  source port(s)\n",
 		argv0);
 }
@@ -351,12 +522,20 @@ static void sighandler(int sig)
 
 int main(int argc, char *argv[])
 {
-	static const char short_options[] = "hVlp:";
+	static const char short_options[] = "hVlp:"
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+		"u:r"
+#endif
+		;
 	static const struct option long_options[] = {
 		{"help", 0, NULL, 'h'},
 		{"version", 0, NULL, 'V'},
 		{"list", 0, NULL, 'l'},
 		{"port", 1, NULL, 'p'},
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+		{"ump", 1, NULL, 'u'},
+		{"raw", 0, NULL, 'r'},
+#endif
 		{0}
 	};
 
@@ -382,6 +561,15 @@ int main(int argc, char *argv[])
 		case 'p':
 			parse_ports(optarg);
 			break;
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+		case 'u':
+			ump_version = atoi(optarg);
+			snd_seq_set_client_midi_version(seq, ump_version);
+			break;
+		case 'r':
+			snd_seq_set_client_ump_conversion(seq, 0);
+			break;
+#endif
 		default:
 			help(argv[0]);
 			return 1;
@@ -409,7 +597,8 @@ int main(int argc, char *argv[])
 		printf("Waiting for data at port %d:0.",
 		       snd_seq_client_id(seq));
 	printf(" Press Ctrl+C to end.\n");
-	printf("Source  Event                  Ch  Data\n");
+	printf("Source  %sEvent                  Ch  Data\n",
+	       ump_version ? "Group    " : "");
 	
 	signal(SIGINT, sighandler);
 	signal(SIGTERM, sighandler);
@@ -420,14 +609,26 @@ int main(int argc, char *argv[])
 		snd_seq_poll_descriptors(seq, pfds, npfds, POLLIN);
 		if (poll(pfds, npfds, -1) < 0)
 			break;
-		do {
+		for (;;) {
 			snd_seq_event_t *event;
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+			snd_seq_ump_event_t *ump_ev;
+			if (ump_version > 0) {
+				err = snd_seq_ump_event_input(seq, &ump_ev);
+				if (err < 0)
+					break;
+				if (ump_ev)
+					dump_ump_event(ump_ev);
+				continue;
+			}
+#endif
+
 			err = snd_seq_event_input(seq, &event);
 			if (err < 0)
 				break;
 			if (event)
 				dump_event(event);
-		} while (err > 0);
+		}
 		fflush(stdout);
 		if (stop)
 			break;
-- 
2.35.3

