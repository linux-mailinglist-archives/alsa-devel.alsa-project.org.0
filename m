Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1772B9F1
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D49A6C1;
	Mon, 12 Jun 2023 10:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D49A6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686557598;
	bh=bZttS4xGHzGdJeKGU7LGASlooaBma4CFhCyhD7Z8CS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DgQX0R9wj8XeeG020QrdQRYtztJnOs16sh4BylGOY0S76j0yhIdUK2PjZzaIm7joQ
	 7oVDJBBJGEpKo7mxzGVnl8l3r7sjrz8oXmrBwAhFQ1VR7nVHEmxTtfMaFr/Bjiwude
	 IOOjDg165qMujrLYYUkpRZLp5U6njR5BO0QKays4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 765B8F805A1; Mon, 12 Jun 2023 10:11:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5691DF80588;
	Mon, 12 Jun 2023 10:11:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C5ABF80549; Mon, 12 Jun 2023 10:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13697F80132
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13697F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SBngEuTh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=F0EhOFGf
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F358220462;
	Mon, 12 Jun 2023 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686557466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktslXOGHyFCpJaOge/SCZucIVv26BL4ePNduyWjWEpU=;
	b=SBngEuThF7/XQlHcakHWm1T4V/vnx1h3XBmI/ibg95qQehd7/u3JNR3hWtBKD8yFhhQVh7
	JpHGg7one3KfwqhedpBKNuNXGewt0i03ZDZZFFtpnNS1HNuXubmMorztrheTsA8PUwsfMi
	GXhP8WGU8yNcOWvBrsuTaj/L6qOiBHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686557466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktslXOGHyFCpJaOge/SCZucIVv26BL4ePNduyWjWEpU=;
	b=F0EhOFGfmczK3gz0S5FbGU6IVSTQ+nCsju1pezl21BgGx60YcqcaJgKs92t4TvvmzLmYZW
	vQakzbZrS+3r43Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D15CA138EC;
	Mon, 12 Jun 2023 08:11:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GH9KMhnThmSLcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:11:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] ALSA: ump: Add more attributes to UMP EP and FB info
Date: Mon, 12 Jun 2023 10:10:45 +0200
Message-Id: <20230612081054.17200-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081054.17200-1-tiwai@suse.de>
References: <20230612081054.17200-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HJRS2GBZYCESN4EDM4NNNKMITINEPUSZ
X-Message-ID-Hash: HJRS2GBZYCESN4EDM4NNNKMITINEPUSZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJRS2GBZYCESN4EDM4NNNKMITINEPUSZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a few more fields to snd_ump_endpoint_info and snd_ump_block_info
that are added in the new v1.1 spec.  Those are filled by the UMP Stream
messages.

The rawmidi protocol version is bumped to 2.0.4 to indicate those
updates.

Also, update the proc outputs to show the newly introduced fields.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asound.h | 18 +++++++++++++++---
 sound/core/ump.c            | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 5c5f41dd4001..79ee48b2ed6d 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -708,7 +708,7 @@ enum {
  *  Raw MIDI section - /dev/snd/midi??
  */
 
-#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 3)
+#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 4)
 
 enum {
 	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
@@ -797,7 +797,11 @@ struct snd_ump_endpoint_info {
 	unsigned int protocol;		/* current protocol */
 	unsigned int num_blocks;	/* # of function blocks */
 	unsigned short version;		/* UMP major/minor version */
-	unsigned short padding[7];
+	unsigned short family_id;	/* MIDI device family ID */
+	unsigned short model_id;	/* MIDI family model ID */
+	unsigned int manufacturer_id;	/* MIDI manufacturer ID */
+	unsigned char sw_revision[4];	/* software revision */
+	unsigned short padding;
 	unsigned char name[128];	/* endpoint name string */
 	unsigned char product_id[128];	/* unique product id string */
 	unsigned char reserved[32];
@@ -812,6 +816,12 @@ struct snd_ump_endpoint_info {
 #define SNDRV_UMP_BLOCK_IS_MIDI1	(1U << 0) /* MIDI 1.0 port w/o restrict */
 #define SNDRV_UMP_BLOCK_IS_LOWSPEED	(1U << 1) /* 31.25Kbps B/W MIDI1 port */
 
+/* UMP block user-interface hint */
+#define SNDRV_UMP_BLOCK_UI_HINT_UNKNOWN		0x00
+#define SNDRV_UMP_BLOCK_UI_HINT_RECEIVER	0x01
+#define SNDRV_UMP_BLOCK_UI_HINT_SENDER		0x02
+#define SNDRV_UMP_BLOCK_UI_HINT_BOTH		0x03
+
 /* UMP groups and blocks */
 #define SNDRV_UMP_MAX_GROUPS		16
 #define SNDRV_UMP_MAX_BLOCKS		32
@@ -825,7 +835,9 @@ struct snd_ump_block_info {
 	unsigned char active;		/* Activeness */
 	unsigned char first_group;	/* first group ID */
 	unsigned char num_groups;	/* number of groups */
-	unsigned char padding[3];
+	unsigned char midi_ci_version;	/* MIDI-CI support version */
+	unsigned char sysex8_streams;	/* max number of sysex8 streams */
+	unsigned char ui_hint;		/* user interface hint */
 	unsigned int flags;		/* various info flags */
 	unsigned char name[128];	/* block name string */
 	unsigned char reserved[32];
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 69993cad6772..839873fb0f33 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -448,6 +448,20 @@ static const char *ump_direction_string(int dir)
 	}
 }
 
+static const char *ump_ui_hint_string(int dir)
+{
+	switch (dir) {
+	case  SNDRV_UMP_BLOCK_UI_HINT_RECEIVER:
+		return "receiver";
+	case SNDRV_UMP_BLOCK_UI_HINT_SENDER:
+		return "sender";
+	case SNDRV_UMP_BLOCK_UI_HINT_BOTH:
+		return "both";
+	default:
+		return "unknown";
+	}
+}
+
 /* Additional proc file output */
 static void snd_ump_proc_read(struct snd_info_entry *entry,
 			      struct snd_info_buffer *buffer)
@@ -461,6 +475,17 @@ static void snd_ump_proc_read(struct snd_info_entry *entry,
 	snd_iprintf(buffer, "UMP Version: 0x%04x\n", ump->info.version);
 	snd_iprintf(buffer, "Protocol Caps: 0x%08x\n", ump->info.protocol_caps);
 	snd_iprintf(buffer, "Protocol: 0x%08x\n", ump->info.protocol);
+	if (ump->info.version) {
+		snd_iprintf(buffer, "Manufacturer ID: 0x%08x\n",
+			    ump->info.manufacturer_id);
+		snd_iprintf(buffer, "Family ID: 0x%04x\n", ump->info.family_id);
+		snd_iprintf(buffer, "Model ID: 0x%04x\n", ump->info.model_id);
+		snd_iprintf(buffer, "SW Revision: 0x%02x%02x%02x%02x\n",
+			    ump->info.sw_revision[0],
+			    ump->info.sw_revision[1],
+			    ump->info.sw_revision[2],
+			    ump->info.sw_revision[3]);
+	}
 	snd_iprintf(buffer, "Num Blocks: %d\n\n", ump->info.num_blocks);
 
 	list_for_each_entry(fb, &ump->block_list, list) {
@@ -476,6 +501,14 @@ static void snd_ump_proc_read(struct snd_info_entry *entry,
 		snd_iprintf(buffer, "  Is MIDI1: %s%s\n",
 			    (fb->info.flags & SNDRV_UMP_BLOCK_IS_MIDI1) ? "Yes" : "No",
 			    (fb->info.flags & SNDRV_UMP_BLOCK_IS_LOWSPEED) ? " (Low Speed)" : "");
+		if (ump->info.version) {
+			snd_iprintf(buffer, "  MIDI-CI Version: %d\n",
+				    fb->info.midi_ci_version);
+			snd_iprintf(buffer, "  Sysex8 Streams: %d\n",
+				    fb->info.sysex8_streams);
+			snd_iprintf(buffer, "  UI Hint: %s\n",
+				    ump_ui_hint_string(fb->info.ui_hint));
+		}
 		snd_iprintf(buffer, "\n");
 	}
 }
-- 
2.35.3

