Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E367093DF
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79B01DF8;
	Fri, 19 May 2023 11:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79B01DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489287;
	bh=j+OBZm4FQpOvvI9BDiGeB4WoUx1UkY+gTdAJW7LfvSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UvNEUpGdg/XpTF9dEMHR++VlRPUkyaJ8G57YyDnHm7qrBVixkpz6m2HCTClCHrhvW
	 iEl8G8M/WijiifmPS4x2MWpFzdkLofcRffQtg8MFSbamW60hNlNoPMmt+UAyQ6Swzp
	 RJwyb7RK6abAQx2aLXZPv0kwXSHREWNEo1PpW2x8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D463BF806F7; Fri, 19 May 2023 11:33:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27CD9F8058C;
	Fri, 19 May 2023 11:33:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56CCBF80638; Fri, 19 May 2023 11:32:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83711F805C2
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83711F805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IYwIW0F7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BQyqlF6d
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 495BC222AD;
	Fri, 19 May 2023 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcWIeXWrYBHUEIxqRpzZGAcu6j9C5y95HK021lDlBG0=;
	b=IYwIW0F7nOSpvIa4GEhqGQgB1Dnwi8elbLFjWOBZyV5rwifXv3iiSMDzlzYum2EOXRSPVk
	L37yDq7AAiayeOQtwHrLUddnD8CTddSmTIqwIMjcM3FT5qvbVvMfDt0sZfSReNSbLkWIpR
	I9bjcCs4bgcYBTgL/jyP+PW+QKWCVc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcWIeXWrYBHUEIxqRpzZGAcu6j9C5y95HK021lDlBG0=;
	b=BQyqlF6d/CWma7X25oT/D/xKQo4Sf3KNbM4ZCunRmN2o159vewkh7R0JOFJ7SzHNths6nn
	ty74E3nQqL8HgeDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2203013A12;
	Fri, 19 May 2023 09:31:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uIJUBwdCZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 35/36] ALSA: seq: Add UMP group filter
Date: Fri, 19 May 2023 11:31:13 +0200
Message-Id: <20230519093114.28813-36-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NOUJP7XXBXRHQE65YWSAZGMM2JOAAZXZ
X-Message-ID-Hash: NOUJP7XXBXRHQE65YWSAZGMM2JOAAZXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NOUJP7XXBXRHQE65YWSAZGMM2JOAAZXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a new filter bitmap for UMP groups for reducing the unnecessary
read/write when the client is connected to UMP EP seq port.

The new group_filter field contains the bitmap for the groups, i.e.
when the bit is set, the corresponding group is filtered out and
the messages to that group won't be delivered.

The filter bitmap consists of each bit of 1-based UMP Group number.
The bit 0 is reserved for the future use.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asequencer.h  |  3 ++-
 sound/core/seq/seq_clientmgr.c   |  2 ++
 sound/core/seq/seq_clientmgr.h   |  1 +
 sound/core/seq/seq_ump_convert.c | 13 +++++++++++++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index c75f594f21e3..5e91243665d8 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -362,7 +362,8 @@ struct snd_seq_client_info {
 	int card;			/* RO: card number[kernel] */
 	int pid;			/* RO: pid[user] */
 	unsigned int midi_version;	/* MIDI version */
-	char reserved[52];		/* for future use */
+	unsigned int group_filter;	/* UMP group filter bitmap (for 1-based Group indices) */
+	char reserved[48];		/* for future use */
 };
 
 /* MIDI version numbers in client info */
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 8f416f5d0b4d..f6ee0fb62561 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1229,6 +1229,7 @@ static void get_client_info(struct snd_seq_client *cptr,
 	info->filter = cptr->filter;
 	info->event_lost = cptr->event_lost;
 	memcpy(info->event_filter, cptr->event_filter, 32);
+	info->group_filter = cptr->group_filter;
 	info->num_ports = cptr->num_ports;
 
 	if (cptr->type == USER_CLIENT)
@@ -1290,6 +1291,7 @@ static int snd_seq_ioctl_set_client_info(struct snd_seq_client *client,
 	if (client->user_pversion >= SNDRV_PROTOCOL_VERSION(1, 0, 3))
 		client->midi_version = client_info->midi_version;
 	memcpy(client->event_filter, client_info->event_filter, 32);
+	client->group_filter = client_info->group_filter;
 	return 0;
 }
 
diff --git a/sound/core/seq/seq_clientmgr.h b/sound/core/seq/seq_clientmgr.h
index be3fe555f233..915b1017286e 100644
--- a/sound/core/seq/seq_clientmgr.h
+++ b/sound/core/seq/seq_clientmgr.h
@@ -40,6 +40,7 @@ struct snd_seq_client {
 	int number;		/* client number */
 	unsigned int filter;	/* filter flags */
 	DECLARE_BITMAP(event_filter, 256);
+	unsigned short group_filter;
 	snd_use_lock_t use_lock;
 	int event_lost;
 	/* ports */
diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index 433fe842947e..14ba6fed9dd1 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -527,6 +527,17 @@ static int deliver_with_group_convert(struct snd_seq_client *dest,
 					      atomic, hop);
 }
 
+/* apply the UMP event filter; return true to skip the event */
+static bool ump_event_filtered(struct snd_seq_client *dest,
+			       const struct snd_seq_ump_event *ev)
+{
+	unsigned char group;
+
+	group = ump_message_group(ev->ump[0]);
+	/* check the bitmap for 1-based group number */
+	return dest->group_filter & (1U << (group + 1));
+}
+
 /* Convert from UMP packet and deliver */
 int snd_seq_deliver_from_ump(struct snd_seq_client *source,
 			     struct snd_seq_client *dest,
@@ -539,6 +550,8 @@ int snd_seq_deliver_from_ump(struct snd_seq_client *source,
 
 	if (snd_seq_ev_is_variable(event))
 		return 0; // skip, no variable event for UMP, so far
+	if (ump_event_filtered(dest, ump_ev))
+		return 0; // skip if group filter is set and matching
 	type = ump_message_type(ump_ev->ump[0]);
 
 	if (snd_seq_client_is_ump(dest)) {
-- 
2.35.3

