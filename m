Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A879CAA3
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 10:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB4DAEA;
	Tue, 12 Sep 2023 10:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB4DAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694508799;
	bh=ZZ/7wwp4gZYi9KKfVsD5bjYEFWhKTnIkH45CF/h84Ic=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uxPCXkNh/QF4KCD0kmHw8DQikxHg/n00plFcvPUmaEI+Sg0JY0eZM9s2UbQ7ItXjD
	 V1QbWzv4bJW19gG4Gq9CXSH8bMqEbPrUPccq06CJV+ag5qcVf+gBkd3f0fcGLb8k/w
	 TKvxSLq9HGsJfku2j+8Pxrb2E3tqerSTDiokLPqU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77C97F80571; Tue, 12 Sep 2023 10:51:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0910F8055A;
	Tue, 12 Sep 2023 10:51:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EECAEF80212; Tue, 12 Sep 2023 10:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6DC7F800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 10:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DC7F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FW33aYcQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6+Hg7gHU
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C8BD2212AE;
	Tue, 12 Sep 2023 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694508707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=LcHOQyzFANyuYXQ2XNNLEgBKPJtoB1mN26LXW86bq3s=;
	b=FW33aYcQwUlAnIqTUf22rnObcCoMS064DrncWwxrg7FX7GnU23hHJYoaavwgFIF77GaAPV
	XP9uWfcGdDWmmCsfuChxyz9C6vhw7vZb6gWAWPQ19E0cOzX5AWw8DnN2i6m+RPnwn2c5RZ
	q1zJS+59OLeN93T0w3XKHWbAei1stcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694508707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=LcHOQyzFANyuYXQ2XNNLEgBKPJtoB1mN26LXW86bq3s=;
	b=6+Hg7gHUm7faEvLUxEc07O8padLOW0HkokQd8vv9fmDuV9YdLg2UNZLxeeW2z8G7MPcY72
	16QQinDZ8es80rAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B02B5139DB;
	Tue, 12 Sep 2023 08:51:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id BEc2KqMmAGVSJwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 12 Sep 2023 08:51:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: seq: Avoid delivery of events for disabled UMP groups
Date: Tue, 12 Sep 2023 10:51:44 +0200
Message-Id: <20230912085144.32534-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 75LN2OWAXFE4HJYJ5LPJ7OHZEYONBJBH
X-Message-ID-Hash: 75LN2OWAXFE4HJYJ5LPJ7OHZEYONBJBH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75LN2OWAXFE4HJYJ5LPJ7OHZEYONBJBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA sequencer core still delivers events to the disabled UMP Group,
leaving this handling to the device.  But it's rather risky and it's
easy to imagine that such an unexpected event may screw up the device
firmware.

This patch avoids the superfluous event deliveries by setting the
group_filter of the UMP client as default, and evaluate the
group_filter properly at delivery from non-UMP clients.

The grouop_filter is updated upon the dynamic UMP Function Block
updates, so that it follows the change of the disabled UMP Groups,
too.

Fixes: d2b706077792 ("ALSA: seq: Add UMP group filter")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_client.c  | 22 ++++++++++++++++++++++
 sound/core/seq/seq_ump_convert.c |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index f26a1812dfa7..a60e3f069a80 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -416,6 +416,25 @@ static void setup_client_midi_version(struct seq_ump_client *client)
 	snd_seq_kernel_client_put(cptr);
 }
 
+/* set up client's group_filter bitmap */
+static void setup_client_group_filter(struct seq_ump_client *client)
+{
+	struct snd_seq_client *cptr;
+	unsigned int filter;
+	int p;
+
+	cptr = snd_seq_kernel_client_get(client->seq_client);
+	if (!cptr)
+		return;
+	filter = ~(1U << 0); /* always allow groupless messages */
+	for (p = 0; p < SNDRV_UMP_MAX_GROUPS; p++) {
+		if (client->groups[p].active)
+			filter &= ~(1U << (p + 1));
+	}
+	cptr->group_filter = filter;
+	snd_seq_kernel_client_put(cptr);
+}
+
 /* UMP group change notification */
 static void handle_group_notify(struct work_struct *work)
 {
@@ -424,6 +443,7 @@ static void handle_group_notify(struct work_struct *work)
 
 	update_group_attrs(client);
 	update_port_infos(client);
+	setup_client_group_filter(client);
 }
 
 /* UMP FB change notification */
@@ -492,6 +512,8 @@ static int snd_seq_ump_probe(struct device *_dev)
 			goto error;
 	}
 
+	setup_client_group_filter(client);
+
 	err = create_ump_endpoint_port(client);
 	if (err < 0)
 		goto error;
diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index 7cc84e137999..b141024830ec 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -1197,6 +1197,8 @@ int snd_seq_deliver_to_ump(struct snd_seq_client *source,
 			   struct snd_seq_event *event,
 			   int atomic, int hop)
 {
+	if (dest->group_filter & (1U << dest_port->ump_group))
+		return 0; /* group filtered - skip the event */
 	if (event->type == SNDRV_SEQ_EVENT_SYSEX)
 		return cvt_sysex_to_ump(dest, dest_port, event, atomic, hop);
 	else if (snd_seq_client_is_midi2(dest))
-- 
2.35.3

