Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0472B9FF
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3304C846;
	Mon, 12 Jun 2023 10:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3304C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686557701;
	bh=S7YGSr0GuwWLrvjrcfC7YcHoVekK04SyZN7cbRSkbJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LFHfVf3dOODaM3yt/880Q7GFCbDrY8uC4Hx9kZnMRSxVLU+qkbW//etXFND0SB+cI
	 plkpOZX55arnosVFPVNhMEEHD6izcNJgrNvFRKvtLUNwWxr4Zd3t9pS6U/MsU2bgcO
	 waMEyRhqD0ZFHLZYlZHzplDs5IllwwVFeFfReMp4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3B69F80563; Mon, 12 Jun 2023 10:13:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D642F8055B;
	Mon, 12 Jun 2023 10:13:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ECBCF80149; Mon, 12 Jun 2023 10:13:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A372FF80149
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A372FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cM3iWBxe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9K5/BoBU
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF83A2285B;
	Mon, 12 Jun 2023 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686557466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ID6mwdj4lew1ZkjZ5qvw01SNKA8sKTmbLWkpEA6i+H8=;
	b=cM3iWBxen5E6MQIwfbGTPhZAkAnNlPn4zCiQkyiYcoZVWyWMcnFntEvJzwqAFXzLzclF4k
	wuvmKmz7X5uMLGsA9DDSX8Z8/45IZ6qNIUGotKckGiuv9CF4OmNvMC3RXb+rEWY6ADhQCX
	ON3lybuUR18X3dXGsYlblNBdH98hw4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686557466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ID6mwdj4lew1ZkjZ5qvw01SNKA8sKTmbLWkpEA6i+H8=;
	b=9K5/BoBUlG9FZ44bYPS1sB4Rkx3sKT1wY+AcTGeg/7K7TnvyHhgvfqBHsxBfqJDi7gNVHA
	ypfq62wjxLzKMaAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF067138EC;
	Mon, 12 Jun 2023 08:11:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cFKMKRrThmSLcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:11:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] ALSA: seq: ump: Handle FB info update
Date: Mon, 12 Jun 2023 10:10:50 +0200
Message-Id: <20230612081054.17200-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081054.17200-1-tiwai@suse.de>
References: <20230612081054.17200-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DHNMCAKS56XOUBKKS46LH4RPF5FMGL7G
X-Message-ID-Hash: DHNMCAKS56XOUBKKS46LH4RPF5FMGL7G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHNMCAKS56XOUBKKS46LH4RPF5FMGL7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch implements the handling of the dynamic update of FB info.

When the FB info update is received after the initial parsing, it
means the dynamic FB info update.  We compare the result, and if the
actual update is detected, it's notified via a new ops,
notify_fb_change, to the sequencer client, and the corresponding
sequencer ports are updated accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump.h             |  2 ++
 sound/core/seq/seq_ump_client.c | 61 +++++++++++++++++++++++++++++++++
 sound/core/ump.c                | 49 ++++++++++++++++++++++----
 3 files changed, 106 insertions(+), 6 deletions(-)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 5b50a2fc0d79..0e9c048346fa 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -70,6 +70,8 @@ struct snd_ump_ops {
 struct snd_seq_ump_ops {
 	void (*input_receive)(struct snd_ump_endpoint *ump,
 			      const u32 *data, int words);
+	int (*notify_fb_change)(struct snd_ump_endpoint *ump,
+				struct snd_ump_block *fb);
 };
 
 struct snd_ump_block {
diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 7739fb3ebf34..2f93d76b05ce 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -48,6 +48,7 @@ struct seq_ump_client {
 	struct seq_ump_input_buffer input; /* input parser context */
 	struct seq_ump_group groups[SNDRV_UMP_MAX_GROUPS]; /* table of groups */
 	void *ump_info[SNDRV_UMP_MAX_BLOCKS + 1]; /* shadow of seq client ump_info */
+	struct work_struct group_notify_work; /* FB change notification */
 };
 
 /* number of 32bit words for each UMP message type */
@@ -244,6 +245,40 @@ static int seq_ump_group_init(struct seq_ump_client *client, int group_index)
 	return err;
 }
 
+/* update the sequencer ports; called from notify_fb_change callback */
+static void update_port_infos(struct seq_ump_client *client)
+{
+	struct snd_seq_port_info *old, *new;
+	int i, err;
+
+	old = kzalloc(sizeof(*old), GFP_KERNEL);
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!old || !new)
+		goto error;
+
+	for (i = 0; i < SNDRV_UMP_MAX_GROUPS; i++) {
+		old->addr.client = client->seq_client;
+		old->addr.port = i;
+		err = snd_seq_kernel_client_ctl(client->seq_client,
+						SNDRV_SEQ_IOCTL_GET_PORT_INFO,
+						old);
+		if (err < 0)
+			goto error;
+		fill_port_info(new, client, &client->groups[i]);
+		if (old->capability == new->capability &&
+		    !strcmp(old->name, new->name))
+			continue;
+		err = snd_seq_kernel_client_ctl(client->seq_client,
+						SNDRV_SEQ_IOCTL_SET_PORT_INFO,
+						new);
+		if (err < 0)
+			goto error;
+	}
+ error:
+	kfree(new);
+	kfree(old);
+}
+
 /* update dir_bits and active flag for all groups in the client */
 static void update_group_attrs(struct seq_ump_client *client)
 {
@@ -353,6 +388,8 @@ static int create_ump_endpoint_port(struct seq_ump_client *client)
 /* release the client resources */
 static void seq_ump_client_free(struct seq_ump_client *client)
 {
+	cancel_work_sync(&client->group_notify_work);
+
 	if (client->seq_client >= 0)
 		snd_seq_delete_kernel_client(client->seq_client);
 
@@ -377,8 +414,31 @@ static void setup_client_midi_version(struct seq_ump_client *client)
 	snd_seq_kernel_client_put(cptr);
 }
 
+/* UMP group change notification */
+static void handle_group_notify(struct work_struct *work)
+{
+	struct seq_ump_client *client =
+		container_of(work, struct seq_ump_client, group_notify_work);
+
+	update_group_attrs(client);
+	update_port_infos(client);
+}
+
+/* UMP FB change notification */
+static int seq_ump_notify_fb_change(struct snd_ump_endpoint *ump,
+				    struct snd_ump_block *fb)
+{
+	struct seq_ump_client *client = ump->seq_client;
+
+	if (!client)
+		return -ENODEV;
+	schedule_work(&client->group_notify_work);
+	return 0;
+}
+
 static const struct snd_seq_ump_ops seq_ump_ops = {
 	.input_receive = seq_ump_input_receive,
+	.notify_fb_change = seq_ump_notify_fb_change,
 };
 
 /* create a sequencer client and ports for the given UMP endpoint */
@@ -396,6 +456,7 @@ static int snd_seq_ump_probe(struct device *_dev)
 	if (!client)
 		return -ENOMEM;
 
+	INIT_WORK(&client->group_notify_work, handle_group_notify);
 	client->ump = ump;
 
 	client->seq_client =
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 7df50f0affe9..c0cda12bce10 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -688,6 +688,28 @@ static void fill_fb_info(struct snd_ump_endpoint *ump,
 		info->sysex8_streams, info->flags);
 }
 
+/* check whether the FB info gets updated by the current message */
+static bool is_fb_info_updated(struct snd_ump_endpoint *ump,
+			       struct snd_ump_block *fb,
+			       const union snd_ump_stream_msg *buf)
+{
+	char tmpbuf[offsetof(struct snd_ump_block_info, name)];
+
+	memcpy(tmpbuf, &fb->info, sizeof(tmpbuf));
+	fill_fb_info(ump, (struct snd_ump_block_info *)tmpbuf, buf);
+	return memcmp(&fb->info, tmpbuf, sizeof(tmpbuf)) != 0;
+}
+
+/* notify the FB info/name change to sequencer */
+static void seq_notify_fb_change(struct snd_ump_endpoint *ump,
+				 struct snd_ump_block *fb)
+{
+#if IS_ENABLED(CONFIG_SND_SEQUENCER)
+	if (ump->seq_ops && ump->seq_ops->notify_fb_change)
+		ump->seq_ops->notify_fb_change(ump, fb);
+#endif
+}
+
 /* handle FB info message; update FB info if the block is present */
 static int ump_handle_fb_info_msg(struct snd_ump_endpoint *ump,
 				  const union snd_ump_stream_msg *buf)
@@ -697,14 +719,24 @@ static int ump_handle_fb_info_msg(struct snd_ump_endpoint *ump,
 
 	blk = buf->fb_info.function_block_id;
 	fb = snd_ump_get_block(ump, blk);
-	if (fb) {
-		fill_fb_info(ump, &fb->info, buf);
-	} else if (ump->parsed) {
-		/* complain only if updated after parsing */
+
+	/* complain only if updated after parsing */
+	if (!fb && ump->parsed) {
 		ump_info(ump, "Function Block Info Update for non-existing block %d\n",
 			 blk);
 		return -ENODEV;
 	}
+
+	/* When updated after the initial parse, check the FB info update */
+	if (ump->parsed && !is_fb_info_updated(ump, fb, buf))
+		return 1; /* no content change */
+
+	if (fb) {
+		fill_fb_info(ump, &fb->info, buf);
+		if (ump->parsed)
+			seq_notify_fb_change(ump, fb);
+	}
+
 	return 1; /* finished */
 }
 
@@ -714,14 +746,19 @@ static int ump_handle_fb_name_msg(struct snd_ump_endpoint *ump,
 {
 	unsigned char blk;
 	struct snd_ump_block *fb;
+	int ret;
 
 	blk = buf->fb_name.function_block_id;
 	fb = snd_ump_get_block(ump, blk);
 	if (!fb)
 		return -ENODEV;
 
-	return ump_append_string(ump, fb->info.name, sizeof(fb->info.name),
-				 buf->raw, 3);
+	ret = ump_append_string(ump, fb->info.name, sizeof(fb->info.name),
+				buf->raw, 3);
+	/* notify the FB name update to sequencer, too */
+	if (ret > 0 && ump->parsed)
+		seq_notify_fb_change(ump, fb);
+	return ret;
 }
 
 static int create_block_from_fb_info(struct snd_ump_endpoint *ump, int blk)
-- 
2.35.3

