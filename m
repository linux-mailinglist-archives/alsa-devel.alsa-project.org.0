Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7470A605
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 09:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E02BC74C;
	Sat, 20 May 2023 09:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E02BC74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684566243;
	bh=yvQbYHMdYYD58E7u6Rw+COilYfr6yB5XntHX5xoAz+E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OiHbSndBrL1a09v3Lj9T41m4Zk7Z3LxGq0DYdvLc5rhd4dpduT4Rsq4H7/TLQ6c3R
	 i9qjMcZoulzHVDLURLopg8cFYL0BWwKkALmiTlynt4Ii+I59Jp61h2WMK30Bsfate8
	 od1+/JSOereaSEj5Cmg88F4VzGh9G75pYcW9yvyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8D46F80557; Sat, 20 May 2023 09:02:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2908F8025A;
	Sat, 20 May 2023 09:02:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 798E2F80551; Sat, 20 May 2023 09:00:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 24C9AF80087
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 09:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24C9AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ODfRP6Nq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GAHtawJY
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 85CB122039;
	Sat, 20 May 2023 07:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684566025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lv8lzvPi2AwYV+W+LyidROa3ulPVQZs2GlpTau91ivU=;
	b=ODfRP6NqB13bO7i+g8T6PdN2nymQyVgsnKgNihFYg5CqeQtulIJWTUZ1JYFOjmEe519Te5
	Y3qXrToxXwIts7tv2LopMdyaR9wk/TgXJafechvk/YTuUnUIseeC2AWDsrBkmPRChWt+pG
	OEUHhtrjQyDr2IiRD1yCbQNekBTD+3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684566025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lv8lzvPi2AwYV+W+LyidROa3ulPVQZs2GlpTau91ivU=;
	b=GAHtawJY2kcUAwKHgCKwgvW21Y7ZeJxlXg84LMIHGTWE5G3cVIDfhS/4qP3NF/dQgBtT+O
	073OpJoLrJDskSDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BD97139F5;
	Sat, 20 May 2023 07:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cMiFGQlwaGTwGwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 07:00:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/8] uapi: Update rawmidi API to 2.0.3
Date: Sat, 20 May 2023 09:00:14 +0200
Message-Id: <20230520070021.1301-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230520070021.1301-1-tiwai@suse.de>
References: <20230520070021.1301-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DBXD57IBXU76TT7PE264ZYN5YQMM7OQR
X-Message-ID-Hash: DBXD57IBXU76TT7PE264ZYN5YQMM7OQR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBXD57IBXU76TT7PE264ZYN5YQMM7OQR/>
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
 include/sound/uapi/asound.h | 58 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/include/sound/uapi/asound.h b/include/sound/uapi/asound.h
index 62a0364fc3cd..a09089814c7b 100644
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
@@ -1114,6 +1169,7 @@ struct snd_ctl_tlv {
 #define SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE _IOWR('U', 0x40, int)
 #define SNDRV_CTL_IOCTL_RAWMIDI_INFO	_IOWR('U', 0x41, struct snd_rawmidi_info)
 #define SNDRV_CTL_IOCTL_RAWMIDI_PREFER_SUBDEVICE _IOW('U', 0x42, int)
+#define SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE	_IOWR('U', 0x43, int)
 #define SNDRV_CTL_IOCTL_POWER		_IOWR('U', 0xd0, int)
 #define SNDRV_CTL_IOCTL_POWER_STATE	_IOR('U', 0xd1, int)
 
-- 
2.35.3

