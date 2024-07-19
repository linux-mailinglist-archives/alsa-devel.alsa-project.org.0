Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A6B9377CD
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 14:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2777B60;
	Fri, 19 Jul 2024 14:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2777B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721392530;
	bh=IehLuIfy4zr1pxs+9AknvHXkRnX3KcjZoB4CShHV2p4=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vOi0tW2SfY8A1lI0955TiGiHOvHjrUT/yG6deRNry7mb2OKR7lf7czsOqmrWPqZqz
	 4Z7tJbepqKynEdWq7wyZAbHi7kLLAObG2V4Mmop7bNs5CyyCeQ3++CgCBmouMBBEuD
	 xaq5f0+CBxQLA/isbaSsX/zXBKMwrYC2o/tnusVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9433BF805B5; Fri, 19 Jul 2024 14:34:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEEECF805C6;
	Fri, 19 Jul 2024 14:34:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4DBBF804FC; Fri, 19 Jul 2024 14:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CE81F800FA
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 14:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CE81F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MzEcnDsT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=I+rC5m5D;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Dk5uhEV6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=d5HpWpxC
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 270031F7A1;
	Fri, 19 Jul 2024 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721392465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=gYlEwc4BpdfajAB0SR3KyM/HKTY8sBqX32QyzCUMfrI=;
	b=MzEcnDsT99/B8212j5nW0l9SWqg1Be3EZ7s1XP3eqctGADActwG4P4li2LNS3fHMg47osE
	6I/4+v/FlksH4KQcRSL3uocoKwM6ojI/dShS2peY/x+ZQ1sK8UOkfPncc3JGIuHKcuIBbi
	E1UoWF99Bnjeu/ONy1oUHN8wjdqBGnY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721392465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=gYlEwc4BpdfajAB0SR3KyM/HKTY8sBqX32QyzCUMfrI=;
	b=I+rC5m5D4tsYja1QguVgEgEij3zXk8+hvxVnBLN/AhcvQMI/uuimfTBbRWpNZw5ui6K8Lx
	sLJhh6zX0QJ0cACg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721392464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=gYlEwc4BpdfajAB0SR3KyM/HKTY8sBqX32QyzCUMfrI=;
	b=Dk5uhEV6YnqmklleNaJWY9sw4pOp/58LgSSXMqRix/s0mjFIOCc5ehFwPOc/p896AtHg3Q
	8rVWwclyLAXxkBEi+k8HWneYTXgzlThcNg4EA2/PMJQgN9EwQF/O6xooclAxiz5CjDe3KK
	ChSFsy+ahUulB4xD4GWzhgByY+n50PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721392464;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=gYlEwc4BpdfajAB0SR3KyM/HKTY8sBqX32QyzCUMfrI=;
	b=d5HpWpxCSt3N+Mic7sgc+Q06aRDkY7HJGQayreFX2rS2RSPuCwMAf3Wj312nsv+if9iX2p
	7l8byO1z4txu55Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D41F132CB;
	Fri, 19 Jul 2024 12:34:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mmLxAVBdmmbkfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jul 2024 12:34:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 1/2] aplaymidi2: Add -a option to pass all UMP
 packets
Date: Fri, 19 Jul 2024 14:34:51 +0200
Message-ID: <20240719123454.24493-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
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
Message-ID-Hash: WVIJSJQKOAZYTLFPWSUMNVACDATOS7U7
X-Message-ID-Hash: WVIJSJQKOAZYTLFPWSUMNVACDATOS7U7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVIJSJQKOAZYTLFPWSUMNVACDATOS7U7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

So far, aplaymidi2 passes the MIDI1/MIDI2 channel voice UMP messages
to the target while processing other UMP messages internally.  But
sometimes we'd like to pass all UMP messages as is and let the
receiver processes.

This patch adds a new option -a (or --passall) to pass the all UMP
packets included in the given MIDI Clip file to the target as-is.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aplaymidi2/aplaymidi2.1 |  8 ++++++++
 seq/aplaymidi2/aplaymidi2.c | 20 +++++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/seq/aplaymidi2/aplaymidi2.1 b/seq/aplaymidi2/aplaymidi2.1
index fc85943c0d38..681796222914 100644
--- a/seq/aplaymidi2/aplaymidi2.1
+++ b/seq/aplaymidi2/aplaymidi2.1
@@ -67,6 +67,14 @@ Default is 2 seconds.
 .I \-s, \-\-silent
 Don't show message texts.
 
+.TP
+.I \-a, \-\-passall
+Pass all UMP packets as is.
+
+As default, \fBaplaymidi2\fP passes only MIDI1 and MIDI2 channel voice
+messages and process other UMP packets internally.
+With this option, it passes all UMP packets to the target.
+
 .SH SEE ALSO
 pmidi(1)
 .br
diff --git a/seq/aplaymidi2/aplaymidi2.c b/seq/aplaymidi2/aplaymidi2.c
index 6a1f21e92444..f5dfdbd91f30 100644
--- a/seq/aplaymidi2/aplaymidi2.c
+++ b/seq/aplaymidi2/aplaymidi2.c
@@ -21,6 +21,7 @@ static snd_seq_addr_t ports[16];
 static int queue;
 static int end_delay = 2;
 static int silent;
+static int passall;
 
 static unsigned int _current_tempo  = 50000000; /* default 120 bpm */
 static unsigned int tempo_base = 10;
@@ -411,6 +412,9 @@ static void play_midi(FILE *file)
 	while ((len = read_ump_packet(file, ump)) > 0) {
 		const snd_ump_msg_hdr_t *h = (snd_ump_msg_hdr_t *)ump;
 
+		if (passall)
+			send_ump(ump, len);
+
 		if (h->type == SND_UMP_MSG_TYPE_UTILITY) {
 			const snd_ump_msg_utility_t *uh =
 				(const snd_ump_msg_utility_t *)ump;
@@ -448,9 +452,10 @@ static void play_midi(FILE *file)
 				end_clip();
 				continue;
 			}
-		} else if (h->type == SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE ||
-			   h->type == SND_UMP_MSG_TYPE_DATA ||
-			   h->type == SND_UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE) {
+		} else if (!passall &&
+			   (h->type == SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE ||
+			    h->type == SND_UMP_MSG_TYPE_DATA ||
+			    h->type == SND_UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE)) {
 			send_ump(ump, len);
 		}
 	}
@@ -496,7 +501,8 @@ static void usage(const char *argv0)
 		"-V, --version               print current version\n"
 		"-p, --port=client:port,...  set port(s) to play to\n"
 		"-d, --delay=seconds         delay after song ends\n"
-		"-s, --silent                don't show texts\n",
+		"-s, --silent                don't show texts\n"
+		"-a, --passall               pass all UMP packets as-is\n",
 		argv0);
 }
 
@@ -513,13 +519,14 @@ int main(int argc, char *argv[])
 		{"port", 1, NULL, 'p'},
 		{"delay", 1, NULL, 'd'},
 		{"silent", 0, NULL, 's'},
+		{"passall", 0, NULL, 'a'},
 		{0}
 	};
 	int c;
 
 	init_seq();
 
-	while ((c = getopt_long(argc, argv, "hVp:d:s",
+	while ((c = getopt_long(argc, argv, "hVp:d:sa",
 				long_options, NULL)) != -1) {
 		switch (c) {
 		case 'h':
@@ -537,6 +544,9 @@ int main(int argc, char *argv[])
 		case 's':
 			silent = 1;
 			break;
+		case 'a':
+			passall = 1;
+			break;
 		default:
 			usage(argv[0]);
 			return 1;
-- 
2.43.0

