Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB41970D688
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:02:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1576086E;
	Tue, 23 May 2023 10:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1576086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828944;
	bh=crSK8jdKGzpSJM1QPrgUffR0upGXdksheS9CrVZaMZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y8MoOZGPYsa5Y20GcP3gxaTb1KAjnduzRJkUtQB52vilXc3tMFc+OhrDMOEp2juMJ
	 ljRk+Ey6bpUJ/2dkfq0JS8uGfne/Iv3UWfvRmFV2TrLqvJymupAt/h72vOLlzNkeBJ
	 xbu1swgBadEjvIcYinjaXEYc064rkSPgedqgwPAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12837F806C1; Tue, 23 May 2023 09:55:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55880F806B2;
	Tue, 23 May 2023 09:55:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 104D2F80692; Tue, 23 May 2023 09:55:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1763BF8057A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1763BF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ARpDM/TB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VZSR6WqS
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DC19320419;
	Tue, 23 May 2023 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828451;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykdvugQv+oZ0dN/zBeueH0+m1vWwSeY55CmWxWBpKkQ=;
	b=ARpDM/TBwSXQiycNQBz8hKHuHb92rcfPQ4LmW+XtGPLMju2hHKZuerq0ArzUEu/wkH0On6
	kg0adST4gJ+1PzNanwaofF2Y2HPNlWZDT4O2hWS551F62QNIKdqqqi0xKq/r81t/XuWjeW
	xiN//PdNRobBDYCxiOKLPA69fV8KMmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykdvugQv+oZ0dN/zBeueH0+m1vWwSeY55CmWxWBpKkQ=;
	b=VZSR6WqSRhuVMani4T+Nwr2jKD1+MrUL4TfAdpfEk7EwgZvcgCg7DVFnuXh1FIhoTYh1y4
	KGBqetoVcO670CDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F85213588;
	Tue, 23 May 2023 07:54:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8LniHSNxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 31/37] ALSA: seq: Allow suppressing UMP conversions
Date: Tue, 23 May 2023 09:53:52 +0200
Message-Id: <20230523075358.9672-32-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L7U7NEUWK5KYYM2KD4VL5SV3JEXHWNBW
X-Message-ID-Hash: L7U7NEUWK5KYYM2KD4VL5SV3JEXHWNBW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7U7NEUWK5KYYM2KD4VL5SV3JEXHWNBW/>
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

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
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

