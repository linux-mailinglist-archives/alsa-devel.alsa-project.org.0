Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED1B7093DB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53FE9850;
	Fri, 19 May 2023 11:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53FE9850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489264;
	bh=8Ovlw/zmw1487Upal37ZnkK8uHVSrxYD93xS8XyZepg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oIcu92URAW12sxSu5D4pWqO8R4A9sI19cZVeFMAdh4vmSKAmhKRAkieBPAPgvEFR/
	 Dj8W53UmX04HmI3uu3NY/Nmx47ylWL5/ADtdliYUaahTyLVXwo67lxupFQcpq1yQ6i
	 H8ttghCLGn8F+wmpG40ERuDdcCTxbYQ4i43Yo5K8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88C2EF806E2; Fri, 19 May 2023 11:33:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D914EF806DB;
	Fri, 19 May 2023 11:33:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F225F8055B; Fri, 19 May 2023 11:32:35 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 48ACDF805AF
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48ACDF805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vebHVlZF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yYsKtuG/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1F901FE55;
	Fri, 19 May 2023 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488707;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LcWrJIWY+/p8LoxWXI8z182Rbib3A1gSwftREo4N5Mk=;
	b=vebHVlZFlC74SCyeyoy5hwzLUXIEjKjwSTN7NskAek7ww1BrHyNxePPknLZjiKqNCVXc/9
	4MsOa64PLipYnCZH9xLP3dTBj5WWPIMqccI6qV9f1UDhw+n7a7hhSuq1T6NEuHzX1hvhBR
	jBjoMYosThgeKMdui2txo9+RfZRRhG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LcWrJIWY+/p8LoxWXI8z182Rbib3A1gSwftREo4N5Mk=;
	b=yYsKtuG/vVdxF0SJ5y+EubC4QF+BSmaTQX68JRhIMEp8UpHnmC3lSLiFJF1ErUwuvnGCGX
	xmJnvGtA2T7AU/CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C49D713A12;
	Fri, 19 May 2023 09:31:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wGL0LgNCZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 30/36] ALSA: seq: Allow suppressing UMP conversions
Date: Fri, 19 May 2023 11:31:08 +0200
Message-Id: <20230519093114.28813-31-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GGZQH4LJ6W57EEVGTQTTTQ2CPECL5KMY
X-Message-ID-Hash: GGZQH4LJ6W57EEVGTQTTTQ2CPECL5KMY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGZQH4LJ6W57EEVGTQTTTQ2CPECL5KMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A sequencer client like seq_dummy rather doesn't want to convert UMP
events but receives / sends as is.  Add a new event filter flag to
suppress the automatic UMP conversion and applies accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asequencer.h |  1 +
 sound/core/seq/seq_clientmgr.c  | 18 ++++++++++--------
 sound/core/seq/seq_dummy.c      |  8 ++++++++
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index 2470eaa5edc5..c4632bd9d3a0 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -347,6 +347,7 @@ typedef int __bitwise snd_seq_client_type_t;
 #define SNDRV_SEQ_FILTER_BROADCAST	(1U<<0)	/* accept broadcast messages */
 #define SNDRV_SEQ_FILTER_MULTICAST	(1U<<1)	/* accept multicast messages */
 #define SNDRV_SEQ_FILTER_BOUNCE		(1U<<2)	/* accept bounce event in error */
+#define SNDRV_SEQ_FILTER_NO_CONVERT	(1U<<30) /* don't convert UMP events */
 #define SNDRV_SEQ_FILTER_USE_EVENT	(1U<<31)	/* use event filter */
 
 struct snd_seq_client_info {
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 07b090f76b5f..3b1adcb1ccdd 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -671,14 +671,16 @@ static int snd_seq_deliver_single_event(struct snd_seq_client *client,
 					  dest_port->time_real);
 
 #if IS_ENABLED(CONFIG_SND_SEQ_UMP)
-	if (snd_seq_ev_is_ump(event)) {
-		result = snd_seq_deliver_from_ump(client, dest, dest_port,
-						  event, atomic, hop);
-		goto __skip;
-	} else if (snd_seq_client_is_ump(dest)) {
-		result = snd_seq_deliver_to_ump(client, dest, dest_port,
-						event, atomic, hop);
-		goto __skip;
+	if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT)) {
+		if (snd_seq_ev_is_ump(event)) {
+			result = snd_seq_deliver_from_ump(client, dest, dest_port,
+							  event, atomic, hop);
+			goto __skip;
+		} else if (snd_seq_client_is_ump(dest)) {
+			result = snd_seq_deliver_to_ump(client, dest, dest_port,
+							event, atomic, hop);
+			goto __skip;
+		}
 	}
 #endif /* CONFIG_SND_SEQ_UMP */
 
diff --git a/sound/core/seq/seq_dummy.c b/sound/core/seq/seq_dummy.c
index 2e8844ee32ed..9308194b2d9a 100644
--- a/sound/core/seq/seq_dummy.c
+++ b/sound/core/seq/seq_dummy.c
@@ -152,6 +152,7 @@ static int __init
 register_client(void)
 {
 	struct snd_seq_dummy_port *rec1, *rec2;
+	struct snd_seq_client *client;
 	int i;
 
 	if (ports < 1) {
@@ -165,6 +166,13 @@ register_client(void)
 	if (my_client < 0)
 		return my_client;
 
+	/* don't convert events but just pass-through */
+	client = snd_seq_kernel_client_get(my_client);
+	if (!client)
+		return -EINVAL;
+	client->filter = SNDRV_SEQ_FILTER_NO_CONVERT;
+	snd_seq_kernel_client_put(client);
+
 	/* create ports */
 	for (i = 0; i < ports; i++) {
 		rec1 = create_port(i, 0);
-- 
2.35.3

