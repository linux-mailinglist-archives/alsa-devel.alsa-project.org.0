Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC0D70A612
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 09:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68AB851;
	Sat, 20 May 2023 09:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68AB851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684566596;
	bh=NxSiUWCClPE6FOHgmhvLq9UswJT93RsbEk2w6BlWz6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=B+EYl21iC30+HATb4dNvP2Id5F4I+Muol3/dMmZMH6xbp/fbJvLPDevFG8gq67Ubu
	 bglfOwHYaJ4YkZSxl7sfLnfiiesIZqmX7A0JbN+NXa/Ye9K0iHtWRggbLzzDcayuby
	 ByhZLRnIfWFwYCDzkDi+3Ae37+c0i0jy3Wl2aPrM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2B75F80588; Sat, 20 May 2023 09:08:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49431F80579;
	Sat, 20 May 2023 09:08:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA939F80567; Sat, 20 May 2023 09:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03784F8016A
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 09:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03784F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qTV66kA7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=N1ZNCbT4
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CA7411FE3F;
	Sat, 20 May 2023 07:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684566463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTRWhH+7Eaa22PZpsKS0R+NBeYTa6L4FPvhAgcjfX6E=;
	b=qTV66kA7NE3Ze2sIcaW0XKmyxA6S407o0qw3n0z4v2M2V8Nzqz/IQUhbMt+gfA4wxfNHzk
	1Hip/vEJU+jyCMlacrMGsC6W1s80Vhm/DntubhurJFPcl/Yd8+wNsiT/zIDsyq8P2R44sk
	dp6QC6HjDJRHSyRohhrI7OTQqFEyVRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684566463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTRWhH+7Eaa22PZpsKS0R+NBeYTa6L4FPvhAgcjfX6E=;
	b=N1ZNCbT4hCZkASk9aY0d6CT5FZiGDhToIguLWK0FEwRoiS59XrsWmvRZbYXtNiEyz2J7qQ
	uKOQztToLBNNyvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC420134F5;
	Sat, 20 May 2023 07:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cCIXKb9xaGRrHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 07:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 2/3] aconnect: Add UMP support
Date: Sat, 20 May 2023 09:07:37 +0200
Message-Id: <20230520070738.8382-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230520070738.8382-1-tiwai@suse.de>
References: <20230520070738.8382-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PNBWMBTXNHKP3SLZB7BB6J4K66Q2N2WD
X-Message-ID-Hash: PNBWMBTXNHKP3SLZB7BB6J4K66Q2N2WD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNBWMBTXNHKP3SLZB7BB6J4K66Q2N2WD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch extends the aconnect program for supporting UMP.
Now the verbose output can show the UMP client version.

Also, a new option -a is added to control the behavior whether to show
the all ports including the inactive ports or not.  As default, only
the active ports are shown, but UMP clients allow to hide some ports
as inactive.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aconnect/aconnect.1 |  3 ++
 seq/aconnect/aconnect.c | 91 +++++++++++++++++++++++++++++++++--------
 2 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/seq/aconnect/aconnect.1 b/seq/aconnect/aconnect.1
index 2050187a3362..5c015196f19c 100644
--- a/seq/aconnect/aconnect.1
+++ b/seq/aconnect/aconnect.1
@@ -120,6 +120,9 @@ List existing output (writable) ports.
 This option is exclusive to
 .B \-i.
 .TP
+.B \-a, \-\-all
+List inactive ports, too.
+.TP
 .B \-l, \-\-list
 List the current connection status.  The connected and connecting ports
 from/to each port are listed together.
diff --git a/seq/aconnect/aconnect.c b/seq/aconnect/aconnect.c
index 85a7770156aa..582b454c2c22 100644
--- a/seq/aconnect/aconnect.c
+++ b/seq/aconnect/aconnect.c
@@ -29,6 +29,13 @@
 #include "aconfig.h"
 #include "gettext.h"
 
+#ifdef SND_SEQ_PORT_CAP_INACTIVE
+#define HANDLE_SHOW_ALL
+static int show_all;
+#else
+#define show_all 0
+#endif
+
 static void error_handler(const char *file, int line, const char *function, int err, const char *fmt, ...)
 {
 	va_list arg;
@@ -60,6 +67,9 @@ static void usage(void)
 	printf(_("   aconnect -i|-o [-options]\n"));
 	printf(_("     -i,--input          list input (readable) ports\n"));
 	printf(_("     -o,--output         list output (writable) ports\n"));
+#ifdef HANDLE_SHOW_ALL
+	printf(_("     -a,--all            show inactive ports, too\n"));
+#endif
 	printf(_("     -l,--list           list current connections of each port\n"));
 	printf(_(" * Remove all exported connections\n"));
 	printf(_("     -x, --removeall\n"));
@@ -72,25 +82,38 @@ static void usage(void)
 #define LIST_INPUT	1
 #define LIST_OUTPUT	2
 
-#define perm_ok(pinfo,bits) ((snd_seq_port_info_get_capability(pinfo) & (bits)) == (bits))
+#define perm_ok(cap,bits) (((cap) & (bits)) == (bits))
+
+#ifdef SND_SEQ_PORT_DIR_INPUT
+static int check_direction(snd_seq_port_info_t *pinfo, int bit)
+{
+	int dir = snd_seq_port_info_get_direction(pinfo);
+	return !dir || (dir & bit);
+}
+#else
+#define check_direction(x, y)	1
+#endif
 
 static int check_permission(snd_seq_port_info_t *pinfo, int perm)
 {
-	if (perm) {
-		if (perm & LIST_INPUT) {
-			if (perm_ok(pinfo, SND_SEQ_PORT_CAP_READ|SND_SEQ_PORT_CAP_SUBS_READ))
-				goto __ok;
-		}
-		if (perm & LIST_OUTPUT) {
-			if (perm_ok(pinfo, SND_SEQ_PORT_CAP_WRITE|SND_SEQ_PORT_CAP_SUBS_WRITE))
-				goto __ok;
-		}
+	int cap = snd_seq_port_info_get_capability(pinfo);
+
+	if (cap & SND_SEQ_PORT_CAP_NO_EXPORT)
 		return 0;
+
+	if (!perm)
+		return 1;
+	if (perm & LIST_INPUT) {
+		if (perm_ok(cap, SND_SEQ_PORT_CAP_READ|SND_SEQ_PORT_CAP_SUBS_READ) &&
+		    check_direction(pinfo, SND_SEQ_PORT_DIR_INPUT))
+			return 1;
 	}
- __ok:
-	if (snd_seq_port_info_get_capability(pinfo) & SND_SEQ_PORT_CAP_NO_EXPORT)
-		return 0;
-	return 1;
+	if (perm & LIST_OUTPUT) {
+		if (perm_ok(cap, SND_SEQ_PORT_CAP_WRITE|SND_SEQ_PORT_CAP_SUBS_WRITE) &&
+		    check_direction(pinfo, SND_SEQ_PORT_DIR_OUTPUT))
+			return 1;
+	}
+	return 0;
 }
 
 /*
@@ -151,12 +174,20 @@ static void do_search_port(snd_seq_t *seq, int perm, action_func_t do_action)
 		/* reset query info */
 		snd_seq_port_info_set_client(pinfo, snd_seq_client_info_get_client(cinfo));
 		snd_seq_port_info_set_port(pinfo, -1);
+#ifdef HANDLE_SHOW_ALL
+		if (show_all)
+			snd_seq_port_info_set_capability(pinfo, SND_SEQ_PORT_CAP_INACTIVE);
+#endif
 		count = 0;
 		while (snd_seq_query_next_port(seq, pinfo) >= 0) {
 			if (check_permission(pinfo, perm)) {
 				do_action(seq, cinfo, pinfo, count);
 				count++;
 			}
+#ifdef HANDLE_SHOW_ALL
+			if (show_all)
+				snd_seq_port_info_set_capability(pinfo, SND_SEQ_PORT_CAP_INACTIVE);
+#endif
 		}
 	}
 }
@@ -173,7 +204,20 @@ static void print_port(snd_seq_t *seq, snd_seq_client_info_t *cinfo,
 		       snd_seq_client_info_get_name(cinfo),
 		       (snd_seq_client_info_get_type(cinfo) == SND_SEQ_USER_CLIENT ?
 			_("user") : _("kernel")));
-
+#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
+		switch (snd_seq_client_info_get_midi_version(cinfo)) {
+		case SND_SEQ_CLIENT_UMP_MIDI_1_0:
+			printf(",UMP-MIDI1");
+			break;
+		case SND_SEQ_CLIENT_UMP_MIDI_2_0:
+			printf(",UMP-MIDI2");
+			break;
+		}
+#endif
+#ifdef HANDLE_SHOW_ALL
+		if (snd_seq_port_info_get_capability(pinfo) & SND_SEQ_PORT_CAP_INACTIVE)
+			printf(",INACTIVE");
+#endif
 #ifdef HAVE_SEQ_CLIENT_INFO_GET_CARD
 		card = snd_seq_client_info_get_card(cinfo);
 #endif
@@ -251,6 +295,12 @@ enum {
 	SUBSCRIBE, UNSUBSCRIBE, LIST, REMOVE_ALL
 };
 
+#ifdef HANDLE_SHOW_ALL
+#define ACONNECT_OPTS "dior:t:elxa"
+#else
+#define ACONNECT_OPTS "dior:t:elx"
+#endif
+
 static const struct option long_option[] = {
 	{"disconnect", 0, NULL, 'd'},
 	{"input", 0, NULL, 'i'},
@@ -260,6 +310,9 @@ static const struct option long_option[] = {
 	{"exclusive", 0, NULL, 'e'},
 	{"list", 0, NULL, 'l'},
 	{"removeall", 0, NULL, 'x'},
+#ifdef HANDLE_SHOW_ALL
+	{"all", 0, NULL, 'a'},
+#endif
 	{NULL, 0, NULL, 0},
 };
 
@@ -280,7 +333,7 @@ int main(int argc, char **argv)
 	textdomain(PACKAGE);
 #endif
 
-	while ((c = getopt_long(argc, argv, "dior:t:elx", long_option, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, ACONNECT_OPTS, long_option, NULL)) != -1) {
 		switch (c) {
 		case 'd':
 			command = UNSUBSCRIBE;
@@ -313,6 +366,12 @@ int main(int argc, char **argv)
 		case 'x':
 			command = REMOVE_ALL;
 			break;
+#ifdef HANDLE_SHOW_ALL
+		case 'a':
+			command = LIST;
+			show_all = 1;
+			break;
+#endif
 		default:
 			usage();
 			exit(1);
-- 
2.35.3

