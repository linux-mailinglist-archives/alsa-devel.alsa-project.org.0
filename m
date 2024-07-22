Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FF93935F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 19:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B357E7F;
	Mon, 22 Jul 2024 19:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B357E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721671063;
	bh=+tpB5eqdy875gs58wJLc2B7iOxb/6Obx4HxfAyXXToo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=AAYLsrayK0VSI6TwYBPZuDMAOCV/+K1cBYtepOATTgpE6/o/PQxjX4fRIpWsJcePr
	 +c0xbVuud54gmNX3A4m3d1nHNGxdPizBXI77D02Ph85NhdHYo+ps3uSGPOkybdkNZ8
	 XSbDt5XLxZtAlKXq2pqmkU0KJthKII9nFk/Vx2pw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42B49F805D4; Mon, 22 Jul 2024 19:57:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47B49F805D8;
	Mon, 22 Jul 2024 19:57:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CE65F8058C; Mon, 22 Jul 2024 19:52:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B4499F80580
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 19:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4499F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qlnFt8JQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=USFQFDs1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=qlnFt8JQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=USFQFDs1
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1CEDE1FB8C;
	Mon, 22 Jul 2024 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6TqIe/3TUfmEjqrPwJrqZLMAyiQupKUf/wJsTvS1Lc=;
	b=qlnFt8JQaLqQ6CV+O61uJpC+EMWYCTPEZQz29capM8Qt2WHrgGOaJ6UdE+0t2BhVClf2ij
	hHdObJupLspi9VlI8L7CgSRCnWXcMQYSdYqNSlDwJ/EgeTn0K16RCUaslccGlKpKlUlcm5
	9uch72/VGYuxA2PVMTGAd+CoqUCDeIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6TqIe/3TUfmEjqrPwJrqZLMAyiQupKUf/wJsTvS1Lc=;
	b=USFQFDs1R4hnGLJ4vMwolfiyFixXmn6vnQS8kVy6qXHey5ftUMe80oxyUbSR1AQkFX6Sow
	SQOG1BXPCGBtTLDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qlnFt8JQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=USFQFDs1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6TqIe/3TUfmEjqrPwJrqZLMAyiQupKUf/wJsTvS1Lc=;
	b=qlnFt8JQaLqQ6CV+O61uJpC+EMWYCTPEZQz29capM8Qt2WHrgGOaJ6UdE+0t2BhVClf2ij
	hHdObJupLspi9VlI8L7CgSRCnWXcMQYSdYqNSlDwJ/EgeTn0K16RCUaslccGlKpKlUlcm5
	9uch72/VGYuxA2PVMTGAd+CoqUCDeIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6TqIe/3TUfmEjqrPwJrqZLMAyiQupKUf/wJsTvS1Lc=;
	b=USFQFDs1R4hnGLJ4vMwolfiyFixXmn6vnQS8kVy6qXHey5ftUMe80oxyUbSR1AQkFX6Sow
	SQOG1BXPCGBtTLDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F4143138A7;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qI5SOjGcnmbyBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 17:51:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 09/10] aseqsend: Support UMP mode
Date: Mon, 22 Jul 2024 19:52:13 +0200
Message-ID: <20240722175215.8223-10-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722175215.8223-1-tiwai@suse.de>
References: <20240722175215.8223-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 1CEDE1FB8C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Bar: /
Message-ID-Hash: FYHDZME7QWAEO45M7QYY6WCX3A3TFRCM
X-Message-ID-Hash: FYHDZME7QWAEO45M7QYY6WCX3A3TFRCM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYHDZME7QWAEO45M7QYY6WCX3A3TFRCM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a new option -u to specify the UMP MIDI1 or MIDI2 mode.  As
default (-u 0), the program reads the legacy MIDI 1.0 byte stream,
while in UMP mode, it reads as UMP packets and send to the target.
The UMP packet bytes are encoded in big endian.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aseqsend/aseqsend.1 | 13 ++++++++++---
 seq/aseqsend/aseqsend.c | 43 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/seq/aseqsend/aseqsend.1 b/seq/aseqsend/aseqsend.1
index 340c3292f5ed..febbf55dfb16 100644
--- a/seq/aseqsend/aseqsend.1
+++ b/seq/aseqsend/aseqsend.1
@@ -14,6 +14,10 @@ It can also send any other MIDI commands.
 Messages to be send can be given in the last argument as hex encoded byte string or can be read from raw binary file.
 When sending several SysEx messages at once there is a delay of 1ms after each message as deafult and can be set to different value with option \-i.
 
+A client can be specified by its number, its name, or a prefix of its
+name.  A port is specified by its number; for port 0 of a client, the
+":0" part of the port specification can be omitted.
+
 .SH OPTIONS
 
 .TP
@@ -44,10 +48,13 @@ Send raw binary data from given file name
 \-i
 Interval between SysEx messages in miliseconds
 
+.TP
+\-u
+Specify the MIDI version. 0 for the legacy MIDI 1.0 (default),
+1 for UMP MIDI 1.0 protocol and 2 for UMP MIDI 2.0 protocol.
 
-A client can be specified by its number, its name, or a prefix of its
-name.  A port is specified by its number; for port 0 of a client, the
-":0" part of the port specification can be omitted.
+When UMP MIDI 1.0 or MIDI 2.0 protocol is specified, \fBaseqsend\fP
+reads the input as raw UMP packets, 4 each byte in big endian.
 
 .SH EXAMPLES
 
diff --git a/seq/aseqsend/aseqsend.c b/seq/aseqsend/aseqsend.c
index 95b0024c0fd6..bd1a221d4149 100644
--- a/seq/aseqsend/aseqsend.c
+++ b/seq/aseqsend/aseqsend.c
@@ -33,6 +33,7 @@
 #include <signal.h>
 #include <unistd.h>
 #include <alsa/asoundlib.h>
+#include <alsa/ump_msg.h>
 
 typedef unsigned char mbyte_t;
 
@@ -43,6 +44,7 @@ static char *send_hex;
 static mbyte_t *send_data;
 static snd_seq_addr_t addr;
 static int send_data_length;
+static int ump_version;
 
 static void error(const char *format, ...)
 {
@@ -320,6 +322,32 @@ static void send_midi_msg(snd_seq_event_type_t type, mbyte_t *data, int len)
 	snd_seq_drain_output(seq);
 }
 
+static int send_ump(const unsigned char *data)
+{
+	static int ump_len = 0, offset = 0;
+	unsigned int ump[4];
+	snd_seq_ump_event_t ev;
+
+	ump[offset] = (data[0] << 24) | (data[1] << 16) |
+		(data[2] << 8) | data[3];
+	if (!offset)
+		ump_len = snd_ump_packet_length(snd_ump_msg_type(ump));
+
+	offset++;
+	if (offset < ump_len)
+		return 0;
+
+	snd_seq_ump_ev_clear(&ev);
+	snd_seq_ev_set_source(&ev, 0);
+	snd_seq_ev_set_dest(&ev, addr.client, addr.port);
+	snd_seq_ev_set_direct(&ev);
+	snd_seq_ev_set_ump_data(&ev, ump, ump_len * 4);
+	snd_seq_ump_event_output(seq, &ev);
+	snd_seq_drain_output(seq);
+	offset = 0;
+	return ump_len * 4;
+}
+
 static int msg_byte_in_range(mbyte_t *data, mbyte_t len)
 {
 	for (int i = 0; i < len; i++) {
@@ -342,7 +370,7 @@ int main(int argc, char *argv[])
 	int sent_data_c;
 	int k;
 
-	while ((c = getopt(argc, argv, "hi:Vvlp:s:")) != -1) {
+	while ((c = getopt(argc, argv, "hi:Vvlp:s:u:")) != -1) {
 		switch (c) {
 		case 'h':
 			usage();
@@ -366,6 +394,9 @@ int main(int argc, char *argv[])
 		case 'i':
 			sysex_interval = atoi(optarg) * 1000; //ms--->us
 			break;
+		case 'u':
+			ump_version = atoi(optarg);
+			break;
 		default:
 			error("Try 'aseqsend -h' for more information.");
 			exit(EXIT_FAILURE);
@@ -401,7 +432,11 @@ int main(int argc, char *argv[])
 	if (!send_data)
 		exit(EXIT_SUCCESS);
 
+	if (ump_version && (send_data_length % 4) != 0)
+		fatal("UMP data must be aligned to 4 bytes");
+
 	init_seq();
+	snd_seq_set_client_midi_version(seq, ump_version);
 	create_port();
 
 	if (snd_seq_parse_address(seq, &addr, port_name) < 0) {
@@ -414,6 +449,12 @@ int main(int argc, char *argv[])
 
 	while (k < send_data_length) {
 
+		if (ump_version) {
+			sent_data_c += send_ump(send_data + k);
+			k += 4;
+			continue;
+		}
+
 		if (send_data[k] == 0xF0) {
 
 			int c1 = k;
-- 
2.43.0

