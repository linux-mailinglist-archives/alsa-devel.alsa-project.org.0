Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4185070D6B3
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:09:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF063828;
	Tue, 23 May 2023 10:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF063828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684829342;
	bh=dAvj3mFssctctNHqX/ReLQlmm5AVZvNM55TRW4UGLXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k5y8mHsMVM+yGFuqrfl0n3MCWOCXJ1Fzb+TFkYWz5vkI/OSy4SodPlcJ7u7IQ2bkd
	 xvjATvYVfg/d7mqZ79+inZNPek2dwecOVKE44o/w6i6aYXhdr8cRybEP7eM3TgonEB
	 8R6ETlNm4Vcs+L7JvRkQjSTJKS8tQG0xEChsaZpw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36CB2F80086; Tue, 23 May 2023 10:08:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE8AEF80249;
	Tue, 23 May 2023 10:08:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93D7BF80674; Tue, 23 May 2023 09:55:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 349E2F80570
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 349E2F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0LmK8Q4U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gz4Z+ioD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EFCE220417;
	Tue, 23 May 2023 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828450;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uA/KjUgcKuQxtHZTF3e6fCvm4X7bDeBEar63HAq3Wsc=;
	b=0LmK8Q4Uc/4K5xXvH6ARxg+LNLB4oQ4miCSzVS0JSIfRHLDFmZbBpoWwRi7emDf7UW0Vyh
	Bl4+un7AFnRLsR6b+3BbKcu5F0vOe1MXqDs/CNow80CBjQwI5c66OQpT3kADM8QIEsBlte
	/R4iOl2qDQn4V4l6Fs8rtdJjT5wVAzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uA/KjUgcKuQxtHZTF3e6fCvm4X7bDeBEar63HAq3Wsc=;
	b=gz4Z+ioDjfb4E3UfAvko5dFPqCEljOGRJTrRlsDsdiwJdKnIoJK/NHdb9LQ+ZX7RZrnHxE
	Lduv12PS0ZBCgQBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7595F13A1A;
	Tue, 23 May 2023 07:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uBmpGyJxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 28/37] ALSA: seq: Add port direction to snd_seq_port_info
Date: Tue, 23 May 2023 09:53:49 +0200
Message-Id: <20230523075358.9672-29-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Hits: administrivia
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: 5GPED6UBB7OLN6PL7BX5TCR6QY7BLZOS
X-Message-ID-Hash: 5GPED6UBB7OLN6PL7BX5TCR6QY7BLZOS
X-Mailman-Approved-At: Tue, 23 May 2023 08:08:05 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GPED6UBB7OLN6PL7BX5TCR6QY7BLZOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a new field "direction" to snd_seq_port_info for allowing a client
to tell the expected direction of the port access.  A port might still
allow subscriptions for read/write (e.g. for MIDI-CI) even if the
primary usage of the port is a single direction (either input or
output only).  This new "direction" field can help to indicate such
cases.

When the direction is unspecified at creating a port and the port has
either read or write capability, the corresponding direction bits are
set automatically as default.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asequencer.h |  9 ++++++++-
 sound/core/seq/seq_clientmgr.c  | 16 ++++++++++++++--
 sound/core/seq/seq_dummy.c      |  1 +
 sound/core/seq/seq_midi.c       |  4 ++++
 sound/core/seq/seq_ports.c      | 13 +++++++++++++
 sound/core/seq/seq_ports.h      |  2 ++
 sound/core/seq/seq_virmidi.c    |  1 +
 7 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index 67532c46b115..eae1e0b0bf37 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -455,6 +455,12 @@ struct snd_seq_remove_events {
 #define SNDRV_SEQ_PORT_FLG_TIMESTAMP	(1<<1)
 #define SNDRV_SEQ_PORT_FLG_TIME_REAL	(1<<2)
 
+/* port direction */
+#define SNDRV_SEQ_PORT_DIR_UNKNOWN	0
+#define SNDRV_SEQ_PORT_DIR_INPUT	1
+#define SNDRV_SEQ_PORT_DIR_OUTPUT	2
+#define SNDRV_SEQ_PORT_DIR_BIDIRECTION	3
+
 struct snd_seq_port_info {
 	struct snd_seq_addr addr;	/* client/port numbers */
 	char name[64];			/* port name */
@@ -471,7 +477,8 @@ struct snd_seq_port_info {
 	void *kernel;			/* reserved for kernel use (must be NULL) */
 	unsigned int flags;		/* misc. conditioning */
 	unsigned char time_queue;	/* queue # for timestamping */
-	char reserved[59];		/* for future use */
+	unsigned char direction;	/* port usage direction (r/w/bidir) */
+	char reserved[58];		/* for future use */
 };
 
 
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 061b3e2bece1..33aa6c5c5c9e 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2440,6 +2440,17 @@ static void snd_seq_info_dump_subscribers(struct snd_info_buffer *buffer,
 
 #define FLAG_PERM_DUPLEX(perm) ((perm) & SNDRV_SEQ_PORT_CAP_DUPLEX ? 'X' : '-')
 
+static const char *port_direction_name(unsigned char dir)
+{
+	static const char *names[4] = {
+		"-", "In", "Out", "In/Out"
+	};
+
+	if (dir > SNDRV_SEQ_PORT_DIR_BIDIRECTION)
+		return "Invalid";
+	return names[dir];
+}
+
 static void snd_seq_info_dump_ports(struct snd_info_buffer *buffer,
 				    struct snd_seq_client *client)
 {
@@ -2449,12 +2460,13 @@ static void snd_seq_info_dump_ports(struct snd_info_buffer *buffer,
 	list_for_each_entry(p, &client->ports_list_head, list) {
 		if (p->capability & SNDRV_SEQ_PORT_CAP_INACTIVE)
 			continue;
-		snd_iprintf(buffer, "  Port %3d : \"%s\" (%c%c%c%c)\n",
+		snd_iprintf(buffer, "  Port %3d : \"%s\" (%c%c%c%c) [%s]\n",
 			    p->addr.port, p->name,
 			    FLAG_PERM_RD(p->capability),
 			    FLAG_PERM_WR(p->capability),
 			    FLAG_PERM_EX(p->capability),
-			    FLAG_PERM_DUPLEX(p->capability));
+			    FLAG_PERM_DUPLEX(p->capability),
+			    port_direction_name(p->direction));
 		snd_seq_info_dump_subscribers(buffer, &p->c_src, 1, "    Connecting To: ");
 		snd_seq_info_dump_subscribers(buffer, &p->c_dest, 0, "    Connected From: ");
 	}
diff --git a/sound/core/seq/seq_dummy.c b/sound/core/seq/seq_dummy.c
index 8c18d8c4177e..2e8844ee32ed 100644
--- a/sound/core/seq/seq_dummy.c
+++ b/sound/core/seq/seq_dummy.c
@@ -127,6 +127,7 @@ create_port(int idx, int type)
 	pinfo.capability |= SNDRV_SEQ_PORT_CAP_WRITE | SNDRV_SEQ_PORT_CAP_SUBS_WRITE;
 	if (duplex)
 		pinfo.capability |= SNDRV_SEQ_PORT_CAP_DUPLEX;
+	pinfo.direction = SNDRV_SEQ_PORT_DIR_BIDIRECTION;
 	pinfo.type = SNDRV_SEQ_PORT_TYPE_MIDI_GENERIC
 		| SNDRV_SEQ_PORT_TYPE_SOFTWARE
 		| SNDRV_SEQ_PORT_TYPE_PORT;
diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index 2b5fff80de58..44302d98950e 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -367,6 +367,10 @@ snd_seq_midisynth_probe(struct device *_dev)
 		if ((port->capability & (SNDRV_SEQ_PORT_CAP_WRITE|SNDRV_SEQ_PORT_CAP_READ)) == (SNDRV_SEQ_PORT_CAP_WRITE|SNDRV_SEQ_PORT_CAP_READ) &&
 		    info->flags & SNDRV_RAWMIDI_INFO_DUPLEX)
 			port->capability |= SNDRV_SEQ_PORT_CAP_DUPLEX;
+		if (port->capability & SNDRV_SEQ_PORT_CAP_READ)
+			port->direction |= SNDRV_SEQ_PORT_DIR_INPUT;
+		if (port->capability & SNDRV_SEQ_PORT_CAP_WRITE)
+			port->direction |= SNDRV_SEQ_PORT_DIR_OUTPUT;
 		port->type = SNDRV_SEQ_PORT_TYPE_MIDI_GENERIC
 			| SNDRV_SEQ_PORT_TYPE_HARDWARE
 			| SNDRV_SEQ_PORT_TYPE_PORT;
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 42f4172d4766..5574341f49eb 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -356,6 +356,16 @@ int snd_seq_set_port_info(struct snd_seq_client_port * port,
 	port->time_real = (info->flags & SNDRV_SEQ_PORT_FLG_TIME_REAL) ? 1 : 0;
 	port->time_queue = info->time_queue;
 
+	/* direction */
+	port->direction = info->direction;
+	/* fill default port direction */
+	if (!port->direction) {
+		if (info->capability & SNDRV_SEQ_PORT_CAP_READ)
+			port->direction |= SNDRV_SEQ_PORT_DIR_INPUT;
+		if (info->capability & SNDRV_SEQ_PORT_CAP_WRITE)
+			port->direction |= SNDRV_SEQ_PORT_DIR_OUTPUT;
+	}
+
 	return 0;
 }
 
@@ -393,6 +403,9 @@ int snd_seq_get_port_info(struct snd_seq_client_port * port,
 		info->time_queue = port->time_queue;
 	}
 
+	/* direction */
+	info->direction = port->direction;
+
 	return 0;
 }
 
diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index 44f0e9e96bbf..dce733ab2398 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -72,6 +72,8 @@ struct snd_seq_client_port {
 	int midi_voices;
 	int synth_voices;
 		
+	/* direction */
+	unsigned char direction;
 };
 
 struct snd_seq_client;
diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index f5cae49500c8..1b9260108e48 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -385,6 +385,7 @@ static int snd_virmidi_dev_attach_seq(struct snd_virmidi_dev *rdev)
 	pinfo->capability |= SNDRV_SEQ_PORT_CAP_WRITE | SNDRV_SEQ_PORT_CAP_SYNC_WRITE | SNDRV_SEQ_PORT_CAP_SUBS_WRITE;
 	pinfo->capability |= SNDRV_SEQ_PORT_CAP_READ | SNDRV_SEQ_PORT_CAP_SYNC_READ | SNDRV_SEQ_PORT_CAP_SUBS_READ;
 	pinfo->capability |= SNDRV_SEQ_PORT_CAP_DUPLEX;
+	pinfo->direction = SNDRV_SEQ_PORT_DIR_BIDIRECTION;
 	pinfo->type = SNDRV_SEQ_PORT_TYPE_MIDI_GENERIC
 		| SNDRV_SEQ_PORT_TYPE_SOFTWARE
 		| SNDRV_SEQ_PORT_TYPE_PORT;
-- 
2.35.3

