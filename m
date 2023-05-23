Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DDA70D691
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1436AE99;
	Tue, 23 May 2023 10:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1436AE99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828996;
	bh=bPRhjAk5GH+D2toyh6ZBzOssO9HUZjgQtZnxnzbjG+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fVw1Y9dyS0uMM6FQzHBsW46wxdCe12I/o/+iCEK6l9mEETgbe30YOb0l2sf4ApR5K
	 lJa7G4EsDjbau5D8Uj03D4VPleEnDY9FvW1HBIV2CbvUDAcoRZeYaedtPy/TK4r9/k
	 AmHxjTPASfwfqQu5OfDkmqF/5XWq09A3T4CyPW3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7D27F806D9; Tue, 23 May 2023 09:56:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00DA1F805BF;
	Tue, 23 May 2023 09:56:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FD83F806C2; Tue, 23 May 2023 09:55:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BDDBF8057F
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BDDBF8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pGb4yt/1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HyphhFOp
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 59C2E2041A;
	Tue, 23 May 2023 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828452;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOTcZ9DIk5No118bn2nnkWGzCS2/GY1r2cgjHjJmqlU=;
	b=pGb4yt/1Unx5AMGYBOE6YXbBkoRHdWIXYyGy5gTMsXXt6p+0pt3f7LcGD1tUzhFV2lwTKJ
	Ir4tsTFsrNKR5TEHpbGBlf6YGnV7X7wVWzo5QP3wOTZfljys5H3wpRd3LGKRfslm46yqBg
	lTFiyfasqQE21Hr/uwkTHh6EoOJ+PTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828452;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOTcZ9DIk5No118bn2nnkWGzCS2/GY1r2cgjHjJmqlU=;
	b=HyphhFOpNX++GJhHbWTtU77kQFyGUMgeYvmXoMBxx/rfGH255jbRnJPtdc9jki/G0z3//Y
	+gIWqgtcW7QvS7CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A12813588;
	Tue, 23 May 2023 07:54:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gHgCBSRxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 33/37] ALSA: seq: ump: Create UMP Endpoint port for
 broadcast
Date: Tue, 23 May 2023 09:53:54 +0200
Message-Id: <20230523075358.9672-34-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JX2CLJZS2VJJHVH5QKAZIJ22R6SZRFQI
X-Message-ID-Hash: JX2CLJZS2VJJHVH5QKAZIJ22R6SZRFQI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JX2CLJZS2VJJHVH5QKAZIJ22R6SZRFQI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Create a sequencer port for broadcasting the all group inputs at the
port number 0.  This corresponds to a UMP Endpoint connection;
application can read all UMP events from this port no matter which
group the UMP packet belongs to.

Unlike seq ports for other UMP groups, a UMP Endpoint port has no
SND_SEQ_PORT_TYPE_MIDI_GENERIC bit, so that it won't be treated as a
normal MIDI 1.0 device from legacy applications.

The port is named as "MIDI 2.0" to align with representations on other
operation systems.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_client.c | 60 +++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 8d360655ff5d..600b061ac8c3 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -290,6 +290,62 @@ static void update_group_attrs(struct seq_ump_client *client)
 	}
 }
 
+/* create a UMP Endpoint port */
+static int create_ump_endpoint_port(struct seq_ump_client *client)
+{
+	struct snd_seq_port_info *port;
+	struct snd_seq_port_callback pcallbacks;
+	unsigned int rawmidi_info = client->ump->core.info_flags;
+	int err;
+
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	port->addr.client = client->seq_client;
+	port->addr.port = 0; /* fixed */
+	port->flags = SNDRV_SEQ_PORT_FLG_GIVEN_PORT;
+	port->capability = SNDRV_SEQ_PORT_CAP_UMP_ENDPOINT;
+	if (rawmidi_info & SNDRV_RAWMIDI_INFO_INPUT) {
+		port->capability |= SNDRV_SEQ_PORT_CAP_READ |
+			SNDRV_SEQ_PORT_CAP_SYNC_READ |
+			SNDRV_SEQ_PORT_CAP_SUBS_READ;
+		port->direction |= SNDRV_SEQ_PORT_DIR_INPUT;
+	}
+	if (rawmidi_info & SNDRV_RAWMIDI_INFO_OUTPUT) {
+		port->capability |= SNDRV_SEQ_PORT_CAP_WRITE |
+			SNDRV_SEQ_PORT_CAP_SYNC_WRITE |
+			SNDRV_SEQ_PORT_CAP_SUBS_WRITE;
+		port->direction |= SNDRV_SEQ_PORT_DIR_OUTPUT;
+	}
+	if (rawmidi_info & SNDRV_RAWMIDI_INFO_DUPLEX)
+		port->capability |= SNDRV_SEQ_PORT_CAP_DUPLEX;
+	port->ump_group = 0; /* no associated group, no conversion */
+	port->type = SNDRV_SEQ_PORT_TYPE_MIDI_UMP |
+		SNDRV_SEQ_PORT_TYPE_HARDWARE |
+		SNDRV_SEQ_PORT_TYPE_PORT;
+	port->midi_channels = 16;
+	strcpy(port->name, "MIDI 2.0");
+	memset(&pcallbacks, 0, sizeof(pcallbacks));
+	pcallbacks.owner = THIS_MODULE;
+	pcallbacks.private_data = client;
+	if (rawmidi_info & SNDRV_RAWMIDI_INFO_INPUT) {
+		pcallbacks.subscribe = seq_ump_subscribe;
+		pcallbacks.unsubscribe = seq_ump_unsubscribe;
+	}
+	if (rawmidi_info & SNDRV_RAWMIDI_INFO_OUTPUT) {
+		pcallbacks.use = seq_ump_use;
+		pcallbacks.unuse = seq_ump_unuse;
+		pcallbacks.event_input = seq_ump_process_event;
+	}
+	port->kernel = &pcallbacks;
+	err = snd_seq_kernel_client_ctl(client->seq_client,
+					SNDRV_SEQ_IOCTL_CREATE_PORT,
+					port);
+	kfree(port);
+	return err;
+}
+
 /* release the client resources */
 static void seq_ump_client_free(struct seq_ump_client *client)
 {
@@ -353,6 +409,10 @@ static int snd_seq_ump_probe(struct device *_dev)
 			goto error;
 	}
 
+	err = create_ump_endpoint_port(client);
+	if (err < 0)
+		goto error;
+
 	ump->seq_client = client;
 	ump->seq_ops = &seq_ump_ops;
 	return 0;
-- 
2.35.3

