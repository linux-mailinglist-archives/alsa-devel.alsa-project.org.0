Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B54ED939369
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 19:59:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 842E07F4;
	Mon, 22 Jul 2024 19:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 842E07F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721671184;
	bh=Rdz8teq8YEm7WMPCEsxKWl1xx2hRJjoBIcw9Mu4S9PQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Tth9vPXDX29cAx9BU6Bdqff+ynIPIcoZrIOamzNa9qrXVSgZT+4s6q+OBqaTCbWR+
	 qPkvrnjQIMVNRDHdxoi8BXa/9FHZfsZbDx+Ja6H0r5Xu4y2P6KHamsWP3JWrKNnEh3
	 sYKUE2L4hkqAAc0X+1WCmAv+YQXV/j2GJxGYALog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA5AF806DE; Mon, 22 Jul 2024 19:57:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC2D6F806CD;
	Mon, 22 Jul 2024 19:57:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E57A0F801F5; Mon, 22 Jul 2024 19:54:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2CC5F8026D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 19:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2CC5F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vcMdxSa1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4vu1PPN6;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=vcMdxSa1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4vu1PPN6
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 521A91FB80;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KO79lRVs4iXZLsVOYYvWqFglcOqdiTSO0gdAEA/POic=;
	b=vcMdxSa14w50Ou0FEbTEwoyjNnNWVVr/EsZQDyv/3Ob15QyAtk8XZd9tPN68E8eEq4NXZt
	dd5qrjT9P8+v8nXqSsC9DM//19SPa40kiJr+il7mjINcUpCnt3G8Twg7XQK+NizxfWONJh
	YYdH7tovSoaa1H36sh4vmpyYF4X+tcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KO79lRVs4iXZLsVOYYvWqFglcOqdiTSO0gdAEA/POic=;
	b=4vu1PPN6sPrXIPrX4xhKr+vJn4PTGnBSbROUAvSUZRNPBD4shGTEwLb+cC3odENQze0BM5
	IAokKwS++xuRMVDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KO79lRVs4iXZLsVOYYvWqFglcOqdiTSO0gdAEA/POic=;
	b=vcMdxSa14w50Ou0FEbTEwoyjNnNWVVr/EsZQDyv/3Ob15QyAtk8XZd9tPN68E8eEq4NXZt
	dd5qrjT9P8+v8nXqSsC9DM//19SPa40kiJr+il7mjINcUpCnt3G8Twg7XQK+NizxfWONJh
	YYdH7tovSoaa1H36sh4vmpyYF4X+tcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KO79lRVs4iXZLsVOYYvWqFglcOqdiTSO0gdAEA/POic=;
	b=4vu1PPN6sPrXIPrX4xhKr+vJn4PTGnBSbROUAvSUZRNPBD4shGTEwLb+cC3odENQze0BM5
	IAokKwS++xuRMVDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37EDD1398E;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YDxSDDGcnmbyBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 17:51:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 04/10] aconnect: Drop superfluous ifdefs
Date: Mon, 22 Jul 2024 19:52:08 +0200
Message-ID: <20240722175215.8223-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722175215.8223-1-tiwai@suse.de>
References: <20240722175215.8223-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: BOORIXL6QZ4VHDDVNMCD75YQLXPP2TVI
X-Message-ID-Hash: BOORIXL6QZ4VHDDVNMCD75YQLXPP2TVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOORIXL6QZ4VHDDVNMCD75YQLXPP2TVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that the latest alsa-lib 1.2.12 became mandatory, all ugly ifdefs
can be dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aconnect/aconnect.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/seq/aconnect/aconnect.c b/seq/aconnect/aconnect.c
index 371165d65323..edd028f0391d 100644
--- a/seq/aconnect/aconnect.c
+++ b/seq/aconnect/aconnect.c
@@ -29,12 +29,7 @@
 #include <alsa/asoundlib.h>
 #include "gettext.h"
 
-#ifdef SND_SEQ_PORT_CAP_INACTIVE
-#define HANDLE_SHOW_ALL
 static int show_all;
-#else
-#define show_all 0
-#endif
 
 static void error_handler(const char *file, int line, const char *function, int err, const char *fmt, ...)
 {
@@ -67,9 +62,7 @@ static void usage(void)
 	printf(_("   aconnect -i|-o [-options]\n"));
 	printf(_("     -i,--input          list input (readable) ports\n"));
 	printf(_("     -o,--output         list output (writable) ports\n"));
-#ifdef HANDLE_SHOW_ALL
 	printf(_("     -a,--all            show inactive ports, too\n"));
-#endif
 	printf(_("     -l,--list           list current connections of each port\n"));
 	printf(_(" * Remove all exported connections\n"));
 	printf(_("     -x, --removeall\n"));
@@ -84,15 +77,11 @@ static void usage(void)
 
 #define perm_ok(cap,bits) (((cap) & (bits)) == (bits))
 
-#ifdef SND_SEQ_PORT_DIR_INPUT
 static int check_direction(snd_seq_port_info_t *pinfo, int bit)
 {
 	int dir = snd_seq_port_info_get_direction(pinfo);
 	return !dir || (dir & bit);
 }
-#else
-#define check_direction(x, y)	1
-#endif
 
 static int check_permission(snd_seq_port_info_t *pinfo, int perm)
 {
@@ -174,20 +163,16 @@ static void do_search_port(snd_seq_t *seq, int perm, action_func_t do_action)
 		/* reset query info */
 		snd_seq_port_info_set_client(pinfo, snd_seq_client_info_get_client(cinfo));
 		snd_seq_port_info_set_port(pinfo, -1);
-#ifdef HANDLE_SHOW_ALL
 		if (show_all)
 			snd_seq_port_info_set_capability(pinfo, SND_SEQ_PORT_CAP_INACTIVE);
-#endif
 		count = 0;
 		while (snd_seq_query_next_port(seq, pinfo) >= 0) {
 			if (check_permission(pinfo, perm)) {
 				do_action(seq, cinfo, pinfo, count);
 				count++;
 			}
-#ifdef HANDLE_SHOW_ALL
 			if (show_all)
 				snd_seq_port_info_set_capability(pinfo, SND_SEQ_PORT_CAP_INACTIVE);
-#endif
 		}
 	}
 }
@@ -205,7 +190,6 @@ static void print_port(snd_seq_t *seq ATTRIBUTE_UNUSED,
 		       snd_seq_client_info_get_name(cinfo),
 		       (snd_seq_client_info_get_type(cinfo) == SND_SEQ_USER_CLIENT ?
 			_("user") : _("kernel")));
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION
 		switch (snd_seq_client_info_get_midi_version(cinfo)) {
 		case SND_SEQ_CLIENT_UMP_MIDI_1_0:
 			printf(",UMP-MIDI1");
@@ -214,16 +198,11 @@ static void print_port(snd_seq_t *seq ATTRIBUTE_UNUSED,
 			printf(",UMP-MIDI2");
 			break;
 		}
-#endif
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_CARD
 		card = snd_seq_client_info_get_card(cinfo);
-#endif
 		if (card != -1)
 			printf(",card=%d", card);
 
-#ifdef HAVE_SEQ_CLIENT_INFO_GET_PID
 		pid = snd_seq_client_info_get_pid(cinfo);
-#endif
 		if (pid != -1)
 			printf(",pid=%d", pid);
 		printf("]\n");
@@ -231,10 +210,8 @@ static void print_port(snd_seq_t *seq ATTRIBUTE_UNUSED,
 	printf("  %3d '%-16s'",
 	       snd_seq_port_info_get_port(pinfo),
 	       snd_seq_port_info_get_name(pinfo));
-#ifdef HANDLE_SHOW_ALL
 	if (snd_seq_port_info_get_capability(pinfo) & SND_SEQ_PORT_CAP_INACTIVE)
 		printf(" [INACTIVE]");
-#endif
 	printf("\n");
 }
 
@@ -299,11 +276,7 @@ enum {
 	SUBSCRIBE, UNSUBSCRIBE, LIST, REMOVE_ALL
 };
 
-#ifdef HANDLE_SHOW_ALL
 #define ACONNECT_OPTS "dior:t:elxa"
-#else
-#define ACONNECT_OPTS "dior:t:elx"
-#endif
 
 static const struct option long_option[] = {
 	{"disconnect", 0, NULL, 'd'},
@@ -314,9 +287,7 @@ static const struct option long_option[] = {
 	{"exclusive", 0, NULL, 'e'},
 	{"list", 0, NULL, 'l'},
 	{"removeall", 0, NULL, 'x'},
-#ifdef HANDLE_SHOW_ALL
 	{"all", 0, NULL, 'a'},
-#endif
 	{NULL, 0, NULL, 0},
 };
 
@@ -370,12 +341,10 @@ int main(int argc, char **argv)
 		case 'x':
 			command = REMOVE_ALL;
 			break;
-#ifdef HANDLE_SHOW_ALL
 		case 'a':
 			command = LIST;
 			show_all = 1;
 			break;
-#endif
 		default:
 			usage();
 			exit(1);
-- 
2.43.0

