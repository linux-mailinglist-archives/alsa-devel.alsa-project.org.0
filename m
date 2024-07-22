Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F46B939365
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 19:58:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF123E7D;
	Mon, 22 Jul 2024 19:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF123E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721671117;
	bh=yjZ+lJ5QVBjJl/8+KeEEVd/F2jv25KiBP8twk7cW2cE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=K/F7Yo3q3Qm44HxKIMmiMmhIoLh9aA4NsX8vnvJolEYBpzJvohgLP5QdimmOVDToc
	 bVdLhjOKL56qsJyycECmmuyRtGf9OnyPgsKEIsJEmbaE8GLMC1hn2tPF73ncQmvxyX
	 fICljlWcVtHfPTFxKwZfrrFfdyD93nbteEW2HKEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92652F8061E; Mon, 22 Jul 2024 19:57:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 758B5F8064F;
	Mon, 22 Jul 2024 19:57:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F682F80579; Mon, 22 Jul 2024 19:52:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EC4ECF80589
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 19:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC4ECF80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0si+XVOu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5QBBCp/D;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0si+XVOu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5QBBCp/D
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3D87921BA1;
	Mon, 22 Jul 2024 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nzjUSkS9MgOQuyIJeucD5i2WFOWwSvlyPam56XsqtY=;
	b=0si+XVOu5E12CvE3E6+iMRVvPEFt51ImN4Zr12YNBKIH5/IIsfxD5Of6oaB0cXMUMOU++B
	mTGA6hAj0KgcAzf4hcK8Oz8b96WGzgdBQ717/f+2Po8kfU32FN8132LGsC3LeAbvhqjq/B
	rBmenwaW/cNz9ap4A+Q3Swk5RRGcti4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nzjUSkS9MgOQuyIJeucD5i2WFOWwSvlyPam56XsqtY=;
	b=5QBBCp/D6cZFisABBLxpoJUnQOlRSBt4SkBsmtK8N2KDAWRl1nClrs3mxCxWPa3CvblWMf
	rf/MRD64YbCtaGCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0si+XVOu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="5QBBCp/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nzjUSkS9MgOQuyIJeucD5i2WFOWwSvlyPam56XsqtY=;
	b=0si+XVOu5E12CvE3E6+iMRVvPEFt51ImN4Zr12YNBKIH5/IIsfxD5Of6oaB0cXMUMOU++B
	mTGA6hAj0KgcAzf4hcK8Oz8b96WGzgdBQ717/f+2Po8kfU32FN8132LGsC3LeAbvhqjq/B
	rBmenwaW/cNz9ap4A+Q3Swk5RRGcti4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nzjUSkS9MgOQuyIJeucD5i2WFOWwSvlyPam56XsqtY=;
	b=5QBBCp/D6cZFisABBLxpoJUnQOlRSBt4SkBsmtK8N2KDAWRl1nClrs3mxCxWPa3CvblWMf
	rf/MRD64YbCtaGCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 225961398E;
	Mon, 22 Jul 2024 17:51:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aKktBzKcnmbyBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 17:51:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 10/10] aseqsend: Support long options
Date: Mon, 22 Jul 2024 19:52:14 +0200
Message-ID: <20240722175215.8223-11-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722175215.8223-1-tiwai@suse.de>
References: <20240722175215.8223-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3D87921BA1
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_ONE(0.00)[1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: ODVZCTAK6WFN2J2JQ4L4LGEJY3T645H3
X-Message-ID-Hash: ODVZCTAK6WFN2J2JQ4L4LGEJY3T645H3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODVZCTAK6WFN2J2JQ4L4LGEJY3T645H3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the support for long-style options such as --verbose.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aseqsend/aseqsend.1 | 16 ++++++++--------
 seq/aseqsend/aseqsend.c | 13 ++++++++++++-
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/seq/aseqsend/aseqsend.1 b/seq/aseqsend/aseqsend.1
index febbf55dfb16..626f9ea1fb19 100644
--- a/seq/aseqsend/aseqsend.1
+++ b/seq/aseqsend/aseqsend.1
@@ -21,35 +21,35 @@ name.  A port is specified by its number; for port 0 of a client, the
 .SH OPTIONS
 
 .TP
-\-h
+\-h, \-\-help
 Prints a list of options.
 
 .TP
-\-V
+\-V, \-\-version
 Prints the current version.
 
 .TP
-\-l
+\-l, \-\-list
 Prints a list of possible output ports.
 
 .TP
-\-v
+\-v, \-\-verbose
 Prints number of bytes actually sent
 
 .TP
-\-p
+\-p, -\-port=client:port
 Target port by number or name
 
 .TP
-\-s
+\-s, \-\-file=filename
 Send raw binary data from given file name
 
 .TP
-\-i
+\-i, \-\-interval=msec
 Interval between SysEx messages in miliseconds
 
 .TP
-\-u
+\-u, \-\-ump=version
 Specify the MIDI version. 0 for the legacy MIDI 1.0 (default),
 1 for UMP MIDI 1.0 protocol and 2 for UMP MIDI 2.0 protocol.
 
diff --git a/seq/aseqsend/aseqsend.c b/seq/aseqsend/aseqsend.c
index bd1a221d4149..d98423c45c7c 100644
--- a/seq/aseqsend/aseqsend.c
+++ b/seq/aseqsend/aseqsend.c
@@ -362,6 +362,17 @@ static int msg_byte_in_range(mbyte_t *data, mbyte_t len)
 
 int main(int argc, char *argv[])
 {
+	static const struct option long_options[] = {
+		{"help", 0, NULL, 'h'},
+		{"version", 0, NULL, 'V'},
+		{"verbose", 0, NULL, 'v'},
+		{"list", 0, NULL, 'l'},
+		{"port", 1, NULL, 'p'},
+		{"file", 1, NULL, 's'},
+		{"interval", 1, NULL, 'i'},
+		{"ump", 1, NULL, 'u'},
+		{0}
+	};
 	char c = 0;
 	char do_send_file = 0;
 	char do_port_list = 0;
@@ -370,7 +381,7 @@ int main(int argc, char *argv[])
 	int sent_data_c;
 	int k;
 
-	while ((c = getopt(argc, argv, "hi:Vvlp:s:u:")) != -1) {
+	while ((c = getopt_long(argc, argv, "hi:Vvlp:s:u:", long_options, NULL)) != -1) {
 		switch (c) {
 		case 'h':
 			usage();
-- 
2.43.0

