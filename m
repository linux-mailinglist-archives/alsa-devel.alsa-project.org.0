Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE5390F231
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 17:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C8CAE68;
	Wed, 19 Jun 2024 17:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C8CAE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718811074;
	bh=Ya3Ce8+YkorcelSti2aWsGohvCJfuXjG4YPfnW3+YHk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gT4/ATX5BTTQo/koMcLZtrp9Iu7Qs6A6FBYLrvNbIihfmnqCKkzniOi2hp3jnIopj
	 cAZMyg+HX24sAnu4elWIK6WcYyuaDylkeKyU3Ho74HdKOHLDqDOKptvncy/mPZoepH
	 ZKPDz53u1KdshC4fm0m1Vu8MuYYCPUy5DQZDRb8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02C87F805D9; Wed, 19 Jun 2024 17:30:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ED2BF804F2;
	Wed, 19 Jun 2024 17:30:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88BF4F80266; Wed, 19 Jun 2024 17:30:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DD7EF80236
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 17:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DD7EF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xvwm04BY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7WfT0YPK;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=xvwm04BY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7WfT0YPK
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4EF451F7F0;
	Wed, 19 Jun 2024 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+GUSIlLRE1/tVNbffFNr03o7fNfrIuNuRVPfNmkMgJs=;
	b=xvwm04BYaWMNALVUUTWzBo23u/BRVI0bt13JWlbJnJH1yq9ynbP0il2hpjRryHpAnYE9lH
	8m+dTbEDEPHEZUQN0IOd1AhUEKq/XeSypKRUJFGNren2hnLKVGDguDfj7pUG8zrd2EXRDV
	TE4tJBUd6eURQD7ijIf6gZPWr6NUMyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+GUSIlLRE1/tVNbffFNr03o7fNfrIuNuRVPfNmkMgJs=;
	b=7WfT0YPKcYVyOwNaTt18wpsuiM8kSVBNpEbpY1uSSvv23vBWAi6wiFA9177GkqD2D5ilxP
	mEPF0+bhUzBCKLAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xvwm04BY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7WfT0YPK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+GUSIlLRE1/tVNbffFNr03o7fNfrIuNuRVPfNmkMgJs=;
	b=xvwm04BYaWMNALVUUTWzBo23u/BRVI0bt13JWlbJnJH1yq9ynbP0il2hpjRryHpAnYE9lH
	8m+dTbEDEPHEZUQN0IOd1AhUEKq/XeSypKRUJFGNren2hnLKVGDguDfj7pUG8zrd2EXRDV
	TE4tJBUd6eURQD7ijIf6gZPWr6NUMyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+GUSIlLRE1/tVNbffFNr03o7fNfrIuNuRVPfNmkMgJs=;
	b=7WfT0YPKcYVyOwNaTt18wpsuiM8kSVBNpEbpY1uSSvv23vBWAi6wiFA9177GkqD2D5ilxP
	mEPF0+bhUzBCKLAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33B8413AC3;
	Wed, 19 Jun 2024 15:28:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OFvQCh/5cmYRJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Jun 2024 15:28:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 3/4] test: Add an example program to create a virtual
 UMP Endpoint
Date: Wed, 19 Jun 2024 17:28:52 +0200
Message-ID: <20240619152855.6809-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619152855.6809-1-tiwai@suse.de>
References: <20240619152855.6809-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_ONE(0.00)[1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4EF451F7F0
Message-ID-Hash: 6JSFJCMKAF2NNPHMUMNS5HVL7L6RJFTC
X-Message-ID-Hash: 6JSFJCMKAF2NNPHMUMNS5HVL7L6RJFTC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JSFJCMKAF2NNPHMUMNS5HVL7L6RJFTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Provide an example program to demonstrate how to create a UMP Endpoint
and Blocks, i.e. a virtual UMP device.

It's a simple filtering application that just haves the incoming note
on/off velocity and sends out to the output.  The UMP Endpoint and
Block attributes can be adjusted via command-line options.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 test/Makefile.am       |   3 +-
 test/seq-ump-example.c | 187 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 test/seq-ump-example.c

diff --git a/test/Makefile.am b/test/Makefile.am
index 99c2c4ff9f06..635fa39bb7e3 100644
--- a/test/Makefile.am
+++ b/test/Makefile.am
@@ -1,6 +1,6 @@
 SUBDIRS=. lsb
 
-check_PROGRAMS=control pcm pcm_min latency seq \
+check_PROGRAMS=control pcm pcm_min latency seq seq-ump-example \
 	       playmidi1 timer rawmidi midiloop \
 	       oldapi queue_timer namehint client_event_filter \
 	       chmap audio_time user-ctl-element-set pcm-multi-thread
@@ -12,6 +12,7 @@ pcm_min_LDADD=../src/libasound.la
 latency_LDADD=../src/libasound.la
 latency_LDFLAGS= -lm
 seq_LDADD=../src/libasound.la
+seq_ump_example_LDADD=../src/libasound.la
 playmidi1_LDADD=../src/libasound.la
 timer_LDADD=../src/libasound.la
 rawmidi_LDADD=../src/libasound.la
diff --git a/test/seq-ump-example.c b/test/seq-ump-example.c
new file mode 100644
index 000000000000..7f6286827f36
--- /dev/null
+++ b/test/seq-ump-example.c
@@ -0,0 +1,187 @@
+// An example program to create a virtual UMP Endpoint
+//
+// A client simply reads each UMP packet and sends to subscribers
+// while the note on/off velocity is halved
+
+#include <stdio.h>
+#include <getopt.h>
+#include <alsa/asoundlib.h>
+#include <alsa/ump_msg.h>
+
+/* make the note on/off velocity half for MIDI1 CVM */
+static void midi1_half_note_velocity(snd_seq_ump_event_t *ev)
+{
+	snd_ump_msg_midi1_t *midi1 = (snd_ump_msg_midi1_t *)ev->ump;
+
+	switch (snd_ump_msg_status(ev->ump)) {
+	case SND_UMP_MSG_NOTE_OFF:
+	case SND_UMP_MSG_NOTE_ON:
+		midi1->note_on.velocity >>= 1;
+		break;
+	}
+}
+
+/* make the note on/off velocity half for MIDI2 CVM */
+static void midi2_half_note_velocity(snd_seq_ump_event_t *ev)
+{
+	snd_ump_msg_midi2_t *midi2 = (snd_ump_msg_midi2_t *)ev->ump;
+
+	switch (snd_ump_msg_status(ev->ump)) {
+	case SND_UMP_MSG_NOTE_OFF:
+	case SND_UMP_MSG_NOTE_ON:
+		midi2->note_on.velocity >>= 1;
+		break;
+	}
+}
+
+static void help(void)
+{
+	printf("seq-ump-example: Create a virtual UMP Endpoint and Blocks\n"
+	       "\n"
+	       "Usage: seq-ump-example [OPTIONS]\n"
+	       "\n"
+	       "-n,--num-blocks blocks		Number of blocks (groups) to create\n"
+	       "-m,--midi-version version	MIDI protocol version (1 or 2)\n"
+	       "-N--name			UMP Endpoint name string\n"
+	       "-P,--product name		UMP Product ID string\n"
+	       "-M,--manufacturer id		UMP Manufacturer ID value (24bit)\n"
+	       "-F,--family id			UMP Family ID value (16bit)\n"
+	       "-O,--model id			UMP Model ID value (16bit)\n"
+	       "-R,--sw-revision id		UMP Software Revision ID (32bit)\n");
+}
+
+int main(int argc, char **argv)
+{
+	int midi_version = 2;
+	int num_blocks = 1;
+	const char *name = "ACMESynth";
+	const char *product = "Halfmoon";
+	unsigned int manufacturer = 0x123456;
+	unsigned int family = 0x1234;
+	unsigned int model = 0xabcd;
+	unsigned int sw_revision = 0x12345678;
+	snd_seq_t *seq;
+	snd_ump_endpoint_info_t *ep;
+	snd_ump_block_info_t *blk;
+	snd_seq_ump_event_t *ev;
+	int i, c, err;
+	unsigned char tmp[4];
+
+	static const struct option long_option[] = {
+		{"num-blocks", required_argument, 0, 'n'},
+		{"midi-version", required_argument, 0, 'm'},
+		{"name", required_argument, 0, 'N'},
+		{"product", required_argument, 0, 'P'},
+		{"manufacturer", required_argument, 0, 'M'},
+		{"family", required_argument, 0, 'F'},
+		{"model", required_argument, 0, 'O'},
+		{"sw-revision", required_argument, 0, 'R'},
+		{0, 0, 0, 0}
+	};
+
+	while ((c = getopt_long(argc, argv, "n:m:N:P:M:F:O:R:",
+				long_option, NULL)) >= 0) {
+		switch (c) {
+		case 'n':
+			num_blocks = atoi(optarg);
+			break;
+		case 'm':
+			midi_version = atoi(optarg);
+			break;
+		case 'N':
+			name = optarg;
+			break;
+		case 'P':
+			product = optarg;
+			break;
+		case 'M':
+			manufacturer = strtol(optarg, NULL, 0);
+			break;
+		case 'F':
+			family = strtol(optarg, NULL, 0);
+			break;
+		case 'O':
+			model = strtol(optarg, NULL, 0);
+			break;
+		case 'R':
+			sw_revision = strtol(optarg, NULL, 0);
+			break;
+		default:
+			help();
+			return 1;
+		}
+	}
+
+	err = snd_seq_open(&seq, "default", SND_SEQ_OPEN_DUPLEX, 0);
+	if (err < 0) {
+		fprintf(stderr, "failed to open sequencer: %d\n", err);
+		return 1;
+	}
+
+	snd_ump_endpoint_info_alloca(&ep);
+	snd_ump_endpoint_info_set_name(ep, name);
+	snd_ump_endpoint_info_set_product_id(ep, product);
+	if (midi_version == 1) {
+		snd_ump_endpoint_info_set_protocol_caps(ep, SND_UMP_EP_INFO_PROTO_MIDI1);
+		snd_ump_endpoint_info_set_protocol(ep, SND_UMP_EP_INFO_PROTO_MIDI1);
+	} else {
+		snd_ump_endpoint_info_set_protocol_caps(ep, SND_UMP_EP_INFO_PROTO_MIDI2);
+		snd_ump_endpoint_info_set_protocol(ep, SND_UMP_EP_INFO_PROTO_MIDI2);
+	}
+	snd_ump_endpoint_info_set_num_blocks(ep, num_blocks);
+	snd_ump_endpoint_info_set_manufacturer_id(ep, manufacturer);
+	snd_ump_endpoint_info_set_family_id(ep, family);
+	snd_ump_endpoint_info_set_model_id(ep, model);
+	for (i = 0; i < 4; i++)
+		tmp[i] = (sw_revision >> ((3 - i) * 8)) & 0xff;
+	snd_ump_endpoint_info_set_sw_revision(ep, tmp);
+
+	err = snd_seq_create_ump_endpoint(seq, ep, num_blocks);
+	if (err < 0) {
+		fprintf(stderr, "failed to set UMP EP info: %d\n", err);
+		return 1;
+	}
+
+	snd_ump_block_info_alloca(&blk);
+
+	for (i = 0; i < num_blocks; i++) {
+		char blkname[32];
+
+		sprintf(blkname, "Filter %d", i + 1);
+		snd_ump_block_info_set_name(blk, blkname);
+		snd_ump_block_info_set_direction(blk, SND_UMP_DIR_BIDIRECTION);
+		snd_ump_block_info_set_first_group(blk, i);
+		snd_ump_block_info_set_num_groups(blk, 1);
+		snd_ump_block_info_set_ui_hint(blk, SND_UMP_BLOCK_UI_HINT_BOTH);
+
+		err = snd_seq_create_ump_block(seq, i, blk);
+		if (err < 0) {
+			fprintf(stderr, "failed to set UMP block info %d: %d\n",
+				i, err);
+			return 1;
+		}
+	}
+
+	/* halve the incoming note-on / off velocity and pass through
+	 * to subscribers
+	 */
+	while (snd_seq_ump_event_input(seq, &ev) >= 0) {
+		if (!snd_seq_ev_is_ump(ev))
+			continue;
+		switch (snd_ump_msg_type(ev->ump)) {
+		case SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE:
+			midi1_half_note_velocity(ev);
+			break;
+		case SND_UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE:
+			midi2_half_note_velocity(ev);
+			break;
+		}
+
+		snd_seq_ev_set_subs(ev);
+		snd_seq_ev_set_direct(ev);
+		snd_seq_ump_event_output(seq, ev);
+		snd_seq_drain_output(seq);
+	}
+
+	return 0;
+}
-- 
2.43.0

