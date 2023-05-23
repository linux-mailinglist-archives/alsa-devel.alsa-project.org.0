Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A94F70DC8E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 14:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADEC1846;
	Tue, 23 May 2023 14:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADEC1846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684844790;
	bh=oiud/ZlM4kK33vHhsj3MIL7CUDa5QSEYT0FLhtFE9DU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=o6HsgLHKD9nFY9baj4PXp/8CUSc+8JIMUE4KPY4NPrxfNao18Xc0kxkSLnI5/wZMb
	 Y0zdRG2iO95kQX8bm9za6DLpFWZJcaRNH8nnmzy2rXc+JQRncMcHCjK6JHS+V/7QB6
	 +VFgehxFeaE0HPY16s8VmNTS+4m5OraWJu25upMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C46CF80563; Tue, 23 May 2023 14:24:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B272F8053D;
	Tue, 23 May 2023 14:24:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1658AF80552; Tue, 23 May 2023 14:24:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A2B8F8053D
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 14:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A2B8F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pZaE0sDw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6dCskRCD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A5D322A2F;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684844574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SA5jaqw22IxWLCnvDr3XuBPFUCHep+nAHdIHTF48KU=;
	b=pZaE0sDwUrkyFWH1FONYTzP/pRW+xDmRhWS1eIXt6GuFnhWK6YxU0uNCnMTDyuwRhUKCh5
	Thm6l0XVLPPHoZ2sq8aV5woB30tEoI+4FkgJZ4/4UtZuoi5sR/vAtnevx0VzqeEvdCbCyz
	09b6Js5apLlpQBDUs3g2p/YcgegN79o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684844574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1SA5jaqw22IxWLCnvDr3XuBPFUCHep+nAHdIHTF48KU=;
	b=6dCskRCDbTN6bvyldOWjFLlAgV2p3wub7wBEfXRs/FC7InxyIPxY7BZz5rKhzlzUSzyzKe
	eLl7GW5P/2Oy5mAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E333713A1A;
	Tue, 23 May 2023 12:22:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KMO/Nh2wbGQNKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 12:22:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 01/10] uapi: Update rawmidi API to 2.0.3
Date: Tue, 23 May 2023 14:22:38 +0200
Message-Id: <20230523122247.11744-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523122247.11744-1-tiwai@suse.de>
References: <20230523122247.11744-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L6QNK6WOZHBVVY3KCR22APHAW4CMHE7W
X-Message-ID-Hash: L6QNK6WOZHBVVY3KCR22APHAW4CMHE7W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6QNK6WOZHBVVY3KCR22APHAW4CMHE7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Copied from the kernel uapi header for rawmidi API.
A few new structs and constants for UMP are defined in addition to a
few new ioctls.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/uapi/asound.h | 57 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/include/sound/uapi/asound.h b/include/sound/uapi/asound.h
index 62a0364fc3cd..cf11a6b73e2d 100644
--- a/include/sound/uapi/asound.h
+++ b/include/sound/uapi/asound.h
@@ -706,7 +706,7 @@ enum {
  *  Raw MIDI section - /dev/snd/midi??
  */
 
-#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 2)
+#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 3)
 
 enum {
 	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
@@ -717,6 +717,7 @@ enum {
 #define SNDRV_RAWMIDI_INFO_OUTPUT		0x00000001
 #define SNDRV_RAWMIDI_INFO_INPUT		0x00000002
 #define SNDRV_RAWMIDI_INFO_DUPLEX		0x00000004
+#define SNDRV_RAWMIDI_INFO_UMP			0x00000008
 
 struct snd_rawmidi_info {
 	unsigned int device;		/* RO/WR (control): device number */
@@ -775,6 +776,57 @@ struct snd_rawmidi_status {
 	unsigned char reserved[16];	/* reserved for future use */
 };
 
+/* UMP EP Protocol / JRTS capability bits */
+#define SNDRV_UMP_EP_INFO_PROTO_MIDI_MASK	0x0300
+#define SNDRV_UMP_EP_INFO_PROTO_MIDI1		0x0100 /* MIDI 1.0 */
+#define SNDRV_UMP_EP_INFO_PROTO_MIDI2		0x0200 /* MIDI 2.0 */
+#define SNDRV_UMP_EP_INFO_PROTO_JRTS_MASK	0x0003
+#define SNDRV_UMP_EP_INFO_PROTO_JRTS_TX		0x0001 /* JRTS Transmit */
+#define SNDRV_UMP_EP_INFO_PROTO_JRTS_RX		0x0002 /* JRTS Receive */
+
+/* UMP Endpoint information */
+struct snd_ump_endpoint_info {
+	int card;			/* card number */
+	int device;			/* device number */
+	unsigned int flags;		/* additional info */
+	unsigned int protocol_caps;	/* protocol capabilities */
+	unsigned int protocol;		/* current protocol */
+	unsigned int num_blocks;	/* # of function blocks */
+	unsigned short version;		/* UMP major/minor version */
+	unsigned short padding[7];
+	unsigned char name[128];	/* endpoint name string */
+	unsigned char product_id[128];	/* unique product id string */
+	unsigned char reserved[32];
+} __packed;
+
+/* UMP direction */
+#define SNDRV_UMP_DIR_INPUT		0x01
+#define SNDRV_UMP_DIR_OUTPUT		0x02
+#define SNDRV_UMP_DIR_BIDIRECTION	0x03
+
+/* UMP block info flags */
+#define SNDRV_UMP_BLOCK_IS_MIDI1	(1U << 0) /* MIDI 1.0 port w/o restrict */
+#define SNDRV_UMP_BLOCK_IS_LOWSPEED	(1U << 1) /* 31.25Kbps B/W MIDI1 port */
+
+/* UMP groups and blocks */
+#define SNDRV_UMP_MAX_GROUPS		16
+#define SNDRV_UMP_MAX_BLOCKS		32
+
+/* UMP Block information */
+struct snd_ump_block_info {
+	int card;			/* card number */
+	int device;			/* device number */
+	unsigned char block_id;		/* block ID (R/W) */
+	unsigned char direction;	/* UMP direction */
+	unsigned char active;		/* Activeness */
+	unsigned char first_group;	/* first group ID */
+	unsigned char num_groups;	/* number of groups */
+	unsigned char padding[3];
+	unsigned int flags;		/* various info flags */
+	unsigned char name[128];	/* block name string */
+	unsigned char reserved[32];
+} __packed;
+
 #define SNDRV_RAWMIDI_IOCTL_PVERSION	_IOR('W', 0x00, int)
 #define SNDRV_RAWMIDI_IOCTL_INFO	_IOR('W', 0x01, struct snd_rawmidi_info)
 #define SNDRV_RAWMIDI_IOCTL_USER_PVERSION _IOW('W', 0x02, int)
@@ -782,6 +834,9 @@ struct snd_rawmidi_status {
 #define SNDRV_RAWMIDI_IOCTL_STATUS	_IOWR('W', 0x20, struct snd_rawmidi_status)
 #define SNDRV_RAWMIDI_IOCTL_DROP	_IOW('W', 0x30, int)
 #define SNDRV_RAWMIDI_IOCTL_DRAIN	_IOW('W', 0x31, int)
+/* Additional ioctls for UMP rawmidi devices */
+#define SNDRV_UMP_IOCTL_ENDPOINT_INFO	_IOR('W', 0x40, struct snd_ump_endpoint_info)
+#define SNDRV_UMP_IOCTL_BLOCK_INFO	_IOR('W', 0x41, struct snd_ump_block_info)
 
 /*
  *  Timer section - /dev/snd/timer
-- 
2.35.3

