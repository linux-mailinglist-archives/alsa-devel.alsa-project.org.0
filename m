Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104495362A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 16:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB9F52BDC;
	Thu, 15 Aug 2024 16:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB9F52BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723733396;
	bh=MjLzNL39qMHOQ/txf+y1dOqK2HFaRygIkfUMfXedPRg=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qzBo/D2wEYdY2hhU71sDczr1X1Vq23J2VBFqh97JK/qdQY+VCW0C//Jx5XeS6WBGo
	 69c/uBXI0ztRRnYv/xmBtTydhukmsvvUuD8iq2TRg0ERDWEUjwaV/im8LN+lgDe72O
	 o3e121z6VSj7MJrZnCiR40eeQznrcgHnt6k2FaOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC33EF80601; Thu, 15 Aug 2024 16:48:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D21F805FE;
	Thu, 15 Aug 2024 16:48:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B56EF8047C; Thu, 15 Aug 2024 16:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB8A7F80301
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 16:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB8A7F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nz1JFttd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jGFyUWWB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nz1JFttd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jGFyUWWB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C61A1221F4;
	Thu, 15 Aug 2024 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723732906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=iXEDFKKne/zYUQqvEoXlvLXkmKIfcZlS2dVWKJ0C9As=;
	b=nz1JFttdL39u9k6F9TRRt9Nj/ZKX5MFJ7WM3FDypiSHBSt1Y5B52n44h1f+g9VYJspx6Cs
	b79gLnQBd4UljWmOxfcTPhVhrmKVVypfCGLbIxMkm+/98rNar5KVTwiQR0/v28nsVERjUo
	lTelXokb0iqWjb3Ch+cnCqK6BGtXusI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723732906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=iXEDFKKne/zYUQqvEoXlvLXkmKIfcZlS2dVWKJ0C9As=;
	b=jGFyUWWBcXQ30TBtJwZ1PvzuToXGD7sW5ZB1XF/gLWS/pvPf0+Hmf1DjMEjPnHFcwb3JFQ
	Lbwi2eYUqjq7wwAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723732906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=iXEDFKKne/zYUQqvEoXlvLXkmKIfcZlS2dVWKJ0C9As=;
	b=nz1JFttdL39u9k6F9TRRt9Nj/ZKX5MFJ7WM3FDypiSHBSt1Y5B52n44h1f+g9VYJspx6Cs
	b79gLnQBd4UljWmOxfcTPhVhrmKVVypfCGLbIxMkm+/98rNar5KVTwiQR0/v28nsVERjUo
	lTelXokb0iqWjb3Ch+cnCqK6BGtXusI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723732906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=iXEDFKKne/zYUQqvEoXlvLXkmKIfcZlS2dVWKJ0C9As=;
	b=jGFyUWWBcXQ30TBtJwZ1PvzuToXGD7sW5ZB1XF/gLWS/pvPf0+Hmf1DjMEjPnHFcwb3JFQ
	Lbwi2eYUqjq7wwAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADE1A13983;
	Thu, 15 Aug 2024 14:41:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YAUqKaoTvmYefwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Aug 2024 14:41:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] test: Add an example program to inquire UMP Endpoint
 and Block info
Date: Thu, 15 Aug 2024 16:42:25 +0200
Message-ID: <20240815144226.13301-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
Message-ID-Hash: WX5E6CWQKRK2M5X2WVDIWJB63Y5EBKZD
X-Message-ID-Hash: WX5E6CWQKRK2M5X2WVDIWJB63Y5EBKZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WX5E6CWQKRK2M5X2WVDIWJB63Y5EBKZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Provide an example program to inquire UMP Endpoint and Block info in
various APIs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 test/Makefile.am |   3 +-
 test/umpinfo.c   | 147 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 test/umpinfo.c

diff --git a/test/Makefile.am b/test/Makefile.am
index 635fa39bb7e3..707063cc9fc0 100644
--- a/test/Makefile.am
+++ b/test/Makefile.am
@@ -1,7 +1,7 @@
 SUBDIRS=. lsb
 
 check_PROGRAMS=control pcm pcm_min latency seq seq-ump-example \
-	       playmidi1 timer rawmidi midiloop \
+	       playmidi1 timer rawmidi midiloop umpinfo \
 	       oldapi queue_timer namehint client_event_filter \
 	       chmap audio_time user-ctl-element-set pcm-multi-thread
 
@@ -17,6 +17,7 @@ playmidi1_LDADD=../src/libasound.la
 timer_LDADD=../src/libasound.la
 rawmidi_LDADD=../src/libasound.la
 midiloop_LDADD=../src/libasound.la
+umpinfo_LDADD=../src/libasound.la
 oldapi_LDADD=../src/libasound.la
 queue_timer_LDADD=../src/libasound.la
 namehint_LDADD=../src/libasound.la
diff --git a/test/umpinfo.c b/test/umpinfo.c
new file mode 100644
index 000000000000..92a209361861
--- /dev/null
+++ b/test/umpinfo.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Inquire UMP Endpoint and Block info in various APIs
+
+#include <stdio.h>
+#include <alsa/asoundlib.h>
+
+enum { UNKNOWN, SEQ, RAWMIDI, CTL };
+static int mode = UNKNOWN;
+
+static snd_seq_t *seq;
+static int client;
+static snd_ump_t *ump;
+static snd_ctl_t *ctl;
+
+static int get_ump_endpoint_info(snd_ump_endpoint_info_t *ep)
+{
+	switch (mode) {
+	case SEQ:
+		return snd_seq_get_ump_endpoint_info(seq, client, ep);
+	case RAWMIDI:
+		return snd_ump_endpoint_info(ump, ep);
+	case CTL:
+		return snd_ctl_ump_endpoint_info(ctl, ep);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int get_ump_block_info(int blk, snd_ump_block_info_t *bp)
+{
+	switch (mode) {
+	case SEQ:
+		return snd_seq_get_ump_block_info(seq, client, blk, bp);
+	case RAWMIDI:
+		snd_ump_block_info_set_block_id(bp, blk);
+		return snd_ump_block_info(ump, bp);
+	case CTL:
+		snd_ump_block_info_set_block_id(bp, blk);
+		return snd_ctl_ump_block_info(ctl, bp);
+	default:
+		return -EINVAL;
+	}
+}
+
+static void help(void)
+{
+	printf("umpinfo: inquire UMP Endpoint and Block info\n"
+	       "  umpinfo -c target	inquiry via control API\n"
+	       "  umpinfo -m target	inquiry via UMP rawmidi API\n"
+	       "  umpinfo -s client	inquiry via sequencer API\n"
+	       "    target = hw:0, etc\n"
+	       "    client = sequencer client number\n");
+	exit(1);
+}
+
+int main(int argc, char **argv)
+{
+	const char *target = "hw:0";
+	snd_ump_endpoint_info_t *ep;
+	snd_ump_block_info_t *blk;
+	const unsigned char *s;
+	int c, i, num_blks;
+
+	while ((c = getopt(argc, argv, "s:m:c:h")) >= 0) {
+		switch (c) {
+		case 's':
+			mode = SEQ;
+			client = atoi(target);
+			break;
+		case 'm':
+			mode = RAWMIDI;
+			target = optarg;
+			break;
+		case 'c':
+			mode = CTL;
+			target = optarg;
+			break;
+		default:
+			help();
+			break;
+		}
+	}
+
+	switch (mode) {
+	case SEQ:
+		if (snd_seq_open(&seq, "default", SND_SEQ_OPEN_DUPLEX, 0)) {
+			fprintf(stderr, "failed to open sequencer\n");
+			return 1;
+		}
+		break;
+	case RAWMIDI:
+		if (snd_ump_open(&ump, NULL, target, 0)) {
+			fprintf(stderr, "failed to open UMP rawmidi\n");
+			return 1;
+		}
+		break;
+	case CTL:
+		if (snd_ctl_open(&ctl, target, 0)) {
+			fprintf(stderr, "failed to open control\n");
+			return 1;
+		}
+		break;
+	default:
+		help();
+		break;
+	}
+
+	snd_ump_endpoint_info_alloca(&ep);
+	snd_ump_block_info_alloca(&blk);
+
+	if (get_ump_endpoint_info(ep)) {
+		fprintf(stderr, "failed to get UMP EP info\n");
+		return 1;
+	}
+
+	printf("Name: %s\n", snd_ump_endpoint_info_get_name(ep));
+	printf("Product ID: %s\n", snd_ump_endpoint_info_get_product_id(ep));
+	printf("Flags: 0x%x\n", snd_ump_endpoint_info_get_flags(ep));
+	printf("Protocol Caps: 0x%x\n", snd_ump_endpoint_info_get_protocol_caps(ep));
+	printf("Protocol: 0x%x\n", snd_ump_endpoint_info_get_protocol(ep));
+	printf("Num Blocks: %d\n", snd_ump_endpoint_info_get_num_blocks(ep));
+	printf("Version: 0x%x\n", snd_ump_endpoint_info_get_version(ep));
+	printf("Manufacturer ID: 0x%x\n", snd_ump_endpoint_info_get_manufacturer_id(ep));
+	printf("Family ID: 0x%x\n", snd_ump_endpoint_info_get_family_id(ep));
+	printf("Model ID: 0x%x\n", snd_ump_endpoint_info_get_model_id(ep));
+	s = snd_ump_endpoint_info_get_sw_revision(ep);
+	printf("SW Revision: %02x:%02x:%02x:%02x\n", s[0], s[1], s[2], s[3]);
+	num_blks = snd_ump_endpoint_info_get_num_blocks(ep);
+	for (i = 0; i < num_blks; i++) {
+		if (get_ump_block_info(i, blk)) {
+			fprintf(stderr, "failed to get UMP Block info for %d\n", i);
+			continue;
+		}
+		printf("\n");
+		printf("Block ID: %d\n", snd_ump_block_info_get_block_id(blk));
+		printf("Name: %s\n", snd_ump_block_info_get_name(blk));
+		printf("Active: %d\n", snd_ump_block_info_get_active(blk));
+		printf("Flags: 0x%x\n", snd_ump_block_info_get_flags(blk));
+		printf("Direction: %d\n", snd_ump_block_info_get_direction(blk));
+		printf("First Group: %d\n", snd_ump_block_info_get_first_group(blk));
+		printf("Num Groups: %d\n", snd_ump_block_info_get_num_groups(blk));
+		printf("MIDI-CI Version: %d\n", snd_ump_block_info_get_midi_ci_version(blk));
+		printf("Sysex8 Streams: %d\n", snd_ump_block_info_get_sysex8_streams(blk));
+	}
+
+	return 0;
+}
-- 
2.43.0

