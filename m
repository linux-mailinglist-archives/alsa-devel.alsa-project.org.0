Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3B7868F1
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27796832;
	Thu, 24 Aug 2023 09:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27796832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692863595;
	bh=ZAWIkr5TYxGRVR6vRnTOUs+SvhjEpqHE0crZ51A83QE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=V9BQr6TqT1F7Pc9/Iw6eQwK3rs1oFa0zwV0wfZHC0am48kBY1UaEQUtTw774EGTyZ
	 jXG2mISR0bPSjtLXJVthY/9dpvqVUBA5YCsCqYQrmrlBYUJR3rYC7SCl3Oxq5iP0Zy
	 RjR7EX976WCz00x6easybbGqTeZEDcj1VejCxBsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60DDCF8059F; Thu, 24 Aug 2023 09:51:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7CD0F8057E;
	Thu, 24 Aug 2023 09:51:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75690F800F5; Thu, 24 Aug 2023 09:51:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0F7EF800F5
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 09:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0F7EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RDl1FaoK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tdCoe47/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2D66D22CBF;
	Thu, 24 Aug 2023 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692863471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D77LdkVN0dXWEZdMEw+sqqGy+aY6hyYIfiN2pqNpo64=;
	b=RDl1FaoKEKPRk2+9hbR5dqxwoJxELBSJJHzjgaozSyzfFBSqphAVZ1OgzdOs8gcv6Q8P3I
	Kj1ZlK28VxLk0xyGkOpWg+lmhXDApm/IIe1uMx9OX3IrXjTt2xHhe5vLsE/3TJoKqN/Wx8
	/C+mTM57J/fpQ40gq57qotvFeDB1mBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692863471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D77LdkVN0dXWEZdMEw+sqqGy+aY6hyYIfiN2pqNpo64=;
	b=tdCoe47/TQAlihs6r/UZVwiHJXZvIRljZghwP+UVKOmeU6yJMkn++s0/ZqTCe9c3xQwPzD
	nzU26+mMTJU4qnAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11FAE139FF;
	Thu, 24 Aug 2023 07:51:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0FKdA+8L52TtLAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 24 Aug 2023 07:51:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: ump: Don't create unused substreams for static
 blocks
Date: Thu, 24 Aug 2023 09:51:07 +0200
Message-Id: <20230824075108.29958-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230824075108.29958-1-tiwai@suse.de>
References: <20230824075108.29958-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JBK453B4ZCDNJSVOO6HJRZMV527A74V4
X-Message-ID-Hash: JBK453B4ZCDNJSVOO6HJRZMV527A74V4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBK453B4ZCDNJSVOO6HJRZMV527A74V4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When the UMP Endpoint is declared as "static", that is, no dynamic
reassignment of UMP Groups, it makes little sense to expose always all
16 groups with 16 substreams.  Many of those substreams are disabled
groups, hence they are useless, but applications don't know it and try
to open / access all those substreams unnecessarily.

This patch limits the number of UMP legacy rawmidi substreams only to
the active groups.  The behavior is changed only for the static
endpoint (i.e. devices without UMP v1.1 feature implemented or with
the static block flag is set).

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump.h |  1 +
 sound/core/ump.c    | 43 +++++++++++++++++++++++++++++++++++++------
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 44d2c2fd021d..91238dabe307 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -45,6 +45,7 @@ struct snd_ump_endpoint {
 	spinlock_t legacy_locks[2];
 	struct snd_rawmidi *legacy_rmidi;
 	struct snd_rawmidi_substream *legacy_substreams[2][SNDRV_UMP_MAX_GROUPS];
+	unsigned char legacy_mapping[SNDRV_UMP_MAX_GROUPS];
 
 	/* for legacy output; need to open the actual substream unlike input */
 	int legacy_out_opens;
diff --git a/sound/core/ump.c b/sound/core/ump.c
index beb439f25b09..9d6e3e748f7e 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -984,7 +984,7 @@ static int snd_ump_legacy_open(struct snd_rawmidi_substream *substream)
 {
 	struct snd_ump_endpoint *ump = substream->rmidi->private_data;
 	int dir = substream->stream;
-	int group = substream->number;
+	int group = ump->legacy_mapping[substream->number];
 	int err;
 
 	mutex_lock(&ump->open_mutex);
@@ -1016,7 +1016,7 @@ static int snd_ump_legacy_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_ump_endpoint *ump = substream->rmidi->private_data;
 	int dir = substream->stream;
-	int group = substream->number;
+	int group = ump->legacy_mapping[substream->number];
 
 	mutex_lock(&ump->open_mutex);
 	spin_lock_irq(&ump->legacy_locks[dir]);
@@ -1123,6 +1123,34 @@ static void process_legacy_input(struct snd_ump_endpoint *ump, const u32 *src,
 	spin_unlock_irqrestore(&ump->legacy_locks[dir], flags);
 }
 
+/* Fill ump->legacy_mapping[] for groups to be used for legacy rawmidi */
+static int fill_legacy_mapping(struct snd_ump_endpoint *ump)
+{
+	struct snd_ump_block *fb;
+	unsigned int group_maps = 0;
+	int i, num;
+
+	if (ump->info.flags & SNDRV_UMP_EP_INFO_STATIC_BLOCKS) {
+		list_for_each_entry(fb, &ump->block_list, list) {
+			for (i = 0; i < fb->info.num_groups; i++)
+				group_maps |= 1U << (fb->info.first_group + i);
+		}
+		if (!group_maps)
+			ump_info(ump, "No UMP Group is found in FB\n");
+	}
+
+	/* use all groups for non-static case */
+	if (!group_maps)
+		group_maps = (1U << SNDRV_UMP_MAX_GROUPS) - 1;
+
+	num = 0;
+	for (i = 0; i < SNDRV_UMP_MAX_GROUPS; i++)
+		if (group_maps & (1U << i))
+			ump->legacy_mapping[num++] = i;
+
+	return num;
+}
+
 static void fill_substream_names(struct snd_ump_endpoint *ump,
 				 struct snd_rawmidi *rmidi, int dir)
 {
@@ -1130,7 +1158,7 @@ static void fill_substream_names(struct snd_ump_endpoint *ump,
 
 	list_for_each_entry(s, &rmidi->streams[dir].substreams, list)
 		snprintf(s->name, sizeof(s->name), "Group %d (%s)",
-			 s->number + 1, ump->info.name);
+			 ump->legacy_mapping[s->number] + 1, ump->info.name);
 }
 
 int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
@@ -1138,16 +1166,19 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 {
 	struct snd_rawmidi *rmidi;
 	bool input, output;
-	int err;
+	int err, num;
 
-	ump->out_cvts = kcalloc(16, sizeof(*ump->out_cvts), GFP_KERNEL);
+	ump->out_cvts = kcalloc(SNDRV_UMP_MAX_GROUPS,
+				sizeof(*ump->out_cvts), GFP_KERNEL);
 	if (!ump->out_cvts)
 		return -ENOMEM;
 
+	num = fill_legacy_mapping(ump);
+
 	input = ump->core.info_flags & SNDRV_RAWMIDI_INFO_INPUT;
 	output = ump->core.info_flags & SNDRV_RAWMIDI_INFO_OUTPUT;
 	err = snd_rawmidi_new(ump->core.card, id, device,
-			      output ? 16 : 0, input ? 16 : 0,
+			      output ? num : 0, input ? num : 0,
 			      &rmidi);
 	if (err < 0) {
 		kfree(ump->out_cvts);
-- 
2.35.3

