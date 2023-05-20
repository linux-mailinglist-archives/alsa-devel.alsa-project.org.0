Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378770A60D
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 09:05:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A631D836;
	Sat, 20 May 2023 09:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A631D836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684566344;
	bh=uANbKS0cuNFi6Ridjvluzy9ZnziGY0DT9AVZUDCdmiw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=D8g8NW4ktlKreqvjLU5hGChF5Xa7jhSg4QQZyAYukbRkjiTuUIB7dbz2ghYrMuJnU
	 1vq34QMuF/savD4uot5T61eLqgQKaxe5kt0jKw1R0rswYbeq57c8nqfHYwCCYYQtUn
	 RbF0f3MjEfP1OmS/bVZ0Hl4Y40ej4wqr8JDjSNGA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF2A4F805D6; Sat, 20 May 2023 09:02:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D1CF805C5;
	Sat, 20 May 2023 09:02:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 915C3F8025A; Sat, 20 May 2023 09:01:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A049F80431
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 09:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A049F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JeKNDg4P;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zKigNbuw
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A3E62208A;
	Sat, 20 May 2023 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684566026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VrPzMUjBfqcPwLhcgySDW5elVfhKHW1tLSG40ja7Ffk=;
	b=JeKNDg4PcU+AO778GerqxtRt4RwKxHnHtaLegRlf8Mp+PvE22l75tlwHT3+Z6/fDIEs8vM
	NTCGt8woelXhXOL/VJGaq9ufMlX261cGZHxibmCmqqMeSeetD4qNbbnWFjBhyPXvjM6GY5
	WZkmZHAqo/LyIrTzaXB5lYpWT1Fw4/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684566026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VrPzMUjBfqcPwLhcgySDW5elVfhKHW1tLSG40ja7Ffk=;
	b=zKigNbuwAestw+3lkBxK5euy/TTGO/evIiroRexafSZ1FOeopgDOgyPHyzt4bH+XkslCqO
	2LAt2tjlnDVOHJBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A48F134F5;
	Sat, 20 May 2023 07:00:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sJmlAQpwaGTwGwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 07:00:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 5/8] ump: Add helpers to parse / set UMP packet data
Date: Sat, 20 May 2023 09:00:18 +0200
Message-Id: <20230520070021.1301-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230520070021.1301-1-tiwai@suse.de>
References: <20230520070021.1301-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PBYWL3XS4AEEUCSWUCOXLOVUXXXTUH3O
X-Message-ID-Hash: PBYWL3XS4AEEUCSWUCOXLOVUXXXTUH3O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBYWL3XS4AEEUCSWUCOXLOVUXXXTUH3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch defines the structs / unions that can be used for encoding
and decoding UMP packets, as well as inline helper functions.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/Makefile.am     |   2 +-
 include/local.h         |   2 +
 include/ump_msg.h       | 571 ++++++++++++++++++++++++++++++++++++++++
 src/rawmidi/ump_local.h |   1 +
 4 files changed, 575 insertions(+), 1 deletion(-)
 create mode 100644 include/ump_msg.h

diff --git a/include/Makefile.am b/include/Makefile.am
index b7f67b250810..16d68b511297 100644
--- a/include/Makefile.am
+++ b/include/Makefile.am
@@ -34,7 +34,7 @@ endif
 endif
 
 if BUILD_RAWMIDI
-alsainclude_HEADERS += rawmidi.h ump.h
+alsainclude_HEADERS += rawmidi.h ump.h ump_msg.h
 endif
 
 if BUILD_HWDEP
diff --git a/include/local.h b/include/local.h
index 151e3fd4d39b..51042d764f65 100644
--- a/include/local.h
+++ b/include/local.h
@@ -69,9 +69,11 @@
 #if __BYTE_ORDER == __LITTLE_ENDIAN
 #define SND_LITTLE_ENDIAN
 #define SNDRV_LITTLE_ENDIAN
+#define SNDRV_LITTLE_ENDIAN_BITFIELD
 #elif __BYTE_ORDER == __BIG_ENDIAN
 #define SND_BIG_ENDIAN
 #define SNDRV_BIG_ENDIAN
+#define SNDRV_BIG_ENDIAN_BITFIELD
 #else
 #error "Unsupported endian..."
 #endif
diff --git a/include/ump_msg.h b/include/ump_msg.h
new file mode 100644
index 000000000000..1b7f70667054
--- /dev/null
+++ b/include/ump_msg.h
@@ -0,0 +1,571 @@
+/* SPDX-License-Identifier: LGPL-2.1+ */
+/**
+ * \file include/ump_msg.h
+ * \brief API library for ALSA rawmidi/UMP interface
+ *
+ * API library for ALSA rawmidi/UMP interface
+ */
+
+#ifndef __ALSA_UMP_MSG_H
+#define __ALSA_UMP_MSG_H
+
+#include <stdint.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/** general UMP packet header in 32bit word */
+typedef struct _snd_ump_msg_hdr {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t byte1;		/**< First data byte */
+	uint8_t byte2;		/**< Second data byte */
+#else
+	uint8_t byte2;		/**< Second data byte */
+	uint8_t byte1;		/**< First data byte */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+#endif
+} __attribute((packed)) snd_ump_msg_hdr_t;
+
+/** MIDI 1.0 Note Off / Note On (32bit) */
+typedef struct _snd_ump_msg_midi1_note {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t velocity;	/**< Velocity (7bit) */
+#else
+	uint8_t velocity;	/**< Velocity (7bit) */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+#endif
+} __attribute((packed)) snd_ump_msg_midi1_note_t;
+
+/** MIDI 1.0 Poly Pressure (32bit) */
+typedef struct _snd_ump_msg_midi1_paf {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t note;		/** Note (7bit) */
+	uint8_t data;		/** Pressure (7bit) */
+#else
+	uint8_t data;		/** Pressure (7bit) */
+	uint8_t note;		/** Note (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+#endif
+} __attribute((packed)) snd_ump_msg_midi1_paf_t;
+
+/** MIDI 1.0 Control Change (32bit) */
+typedef struct _snd_ump_msg_midi1_cc {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t index;		/** Control index (7bit) */
+	uint8_t data;		/** Control data (7bit) */
+#else
+	uint8_t data;		/** Control data (7bit) */
+	uint8_t index;		/** Control index (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+#endif
+} __attribute((packed)) snd_ump_msg_midi1_cc_t;
+
+/** MIDI 1.0 Program Change (32bit) */
+typedef struct _snd_ump_msg_midi1_program {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t program;	/**< Program number (7bit) */
+	uint8_t reserved;	/**< Unused */
+#else
+	uint8_t reserved;	/**< Unused */
+	uint8_t program;	/**< Program number (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+#endif
+} __attribute((packed)) snd_ump_msg_midi1_program_t;
+
+/** MIDI 1.0 Channel Pressure (32bit) */
+typedef struct _snd_ump_msg_midi1_caf {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t data;		/**< Pressure (7bit) */
+	uint8_t reserved;	/**< Unused */
+#else
+	uint8_t reserved;	/**< Unused */
+	uint8_t data;		/**< Pressure (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+#endif
+} __attribute((packed)) snd_ump_msg_midi1_caf_t;
+
+/** MIDI 1.0 Pitch Bend (32bit) */
+typedef struct _snd_ump_msg_midi1_pitchbend {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t data_lsb;	/**< LSB of pitchbend (7bit) */
+	uint8_t data_msb;	/**< MSB of pitchbend (7bit) */
+#else
+	uint8_t data_msb;	/**< MSB of pitchbend (7bit) */
+	uint8_t data_lsb;	/**< LSB of pitchbend (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+#endif
+} __attribute((packed)) snd_ump_msg_midi1_pitchbend_t;
+
+/** System Common and Real Time messages (32bit); no channel field */
+typedef struct snd_ump_msg_system {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status;		/**< Status */
+	uint8_t parm1;		/**< First parameter */
+	uint8_t parm2;		/**< Second parameter */
+#else
+	uint8_t parm1;		/**< First parameter */
+	uint8_t parm2;		/**< Second parameter */
+	uint8_t status;		/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+#endif
+} __attribute((packed)) snd_ump_msg_system_t;
+
+/** MIDI 1.0 UMP CVM (32bit) */
+typedef union _snd_ump_msg_midi1 {
+	snd_ump_msg_midi1_note_t	note_on;
+	snd_ump_msg_midi1_note_t	note_off;
+	snd_ump_msg_midi1_paf_t		poly_pressure;
+	snd_ump_msg_midi1_cc_t		control_change;
+	snd_ump_msg_midi1_program_t	program_change;
+	snd_ump_msg_midi1_caf_t		channel_pressure;
+	snd_ump_msg_midi1_pitchbend_t	pitchbend;
+	snd_ump_msg_system_t		system;
+	snd_ump_msg_hdr_t		hdr;
+	uint32_t			raw;
+} snd_ump_msg_midi1_t;
+
+/** MIDI 2.0 Note-on/off attribute type */
+enum {
+	SND_UMP_MIDI2_NOTE_ATTR_NO_DATA		= 0x00,	/**< No attribute data */
+	SND_UMP_MIDI2_NOTE_ATTR_MANUFACTURER	= 0x01,	/**< Manufacturer specific */
+	SND_UMP_MIDI2_NOTE_ATTR_PROFILE		= 0x02,	/**< Profile specific */
+	SND_UMP_MIDI2_NOTE_ATTR_PITCH79		= 0x03,	/**< Pitch 7.9 */
+};
+
+/* MIDI 2.0 Note Off / Note On (64bit) */
+typedef struct _snd_ump_msg_midi2_note {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t attr_type;	/**< Attribute type */
+
+	uint16_t velocity;	/**< Velocity (16bit) */
+	uint16_t attr_data;	/**< Attribute data (16bit) */
+#else
+	uint8_t attr_type;	/**< Attribute type */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint16_t attr_data;	/**< Attribute data (16bit) */
+	uint16_t velocity;	/**< Velocity (16bit) */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_note_t;
+
+/** MIDI 2.0 Poly Pressure (64bit) */
+typedef struct _snd_ump_msg_midi2_paf {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t reserved;	/**< Unused */
+
+	uint32_t data;		/**< Pressure (32bit) */
+#else
+	uint8_t reserved;	/**< Unused */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint32_t data;		/**< Pressure (32bit) */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_paf_t;
+
+/** MIDI 2.0 Per-Note Controller (64bit) */
+typedef struct _snd_ump_msg_midi2_per_note_cc {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t index;		/**< Control index (8bit) */
+
+	uint32_t data;		/**< Data (32bit) */
+#else
+	uint8_t index;		/**< Control index (8bit) */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint32_t data;		/**< Data (32bit) */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_per_note_cc_t;
+
+/** MIDI 2.0 per-note management flag bits */
+enum {
+	SND_UMP_MIDI2_PNMGMT_RESET_CONTROLLERS	= 0x01,	/**< Reset (set) per-note controllers */
+	SND_UMP_MIDI2_PNMGMT_DETACH_CONTROLLERS	= 0x02,	/**< Detach per-note controllers */
+};
+
+/** MIDI 2.0 Per-Note Management (64bit) */
+typedef struct _snd_ump_msg_midi2_per_note_mgmt {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t flags;		/**< Option flags (8bit) */
+
+	uint32_t reserved;	/**< Unused */
+#else
+	uint8_t flags;		/**< Option flags (8bit) */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint32_t reserved;	/**< Unused */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_per_note_mgmt_t;
+
+/** MIDI 2.0 Control Change (64bit) */
+typedef struct _snd_ump_msg_midi2_cc {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t index;		/**< Control index (7bit) */
+	uint8_t reserved;	/**< Unused */
+
+	uint32_t data;		/**< Control data (32bit) */
+#else
+	uint8_t reserved;	/**< Unused */
+	uint8_t index;		/**< Control index (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint32_t data;		/**< Control data (32bit) */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_cc_t;
+
+/** MIDI 2.0 Registered Controller (RPN) / Assignable Controller (NRPN) (64bit) */
+typedef struct _snd_ump_msg_midi2_rpn {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t bank;		/**< Bank number (7bit) */
+	uint8_t index;		/**< Control index (7bit) */
+
+	uint32_t data;		/**< Data (32bit) */
+#else
+	uint8_t index;		/**< Control index (7bit) */
+	uint8_t bank;		/**< Bank number (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint32_t data;		/**< Data (32bit) */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_rpn_t;
+
+/** MIDI 2.0 Program Change (64bit) */
+typedef struct _snd_ump_msg_midi2_program {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint16_t reserved:15;	/**< Unused */
+	uint16_t bank_valid:1;	/**< Option flag: bank valid */
+
+	uint8_t program;	/**< Program number (7bit) */
+	uint8_t reserved2;	/**< Unused */
+	uint8_t bank_msb;	/**< MSB of bank (8bit) */
+	uint8_t bank_lsb;	/**< LSB of bank (7bit) */
+#else
+	uint16_t bank_valid:1;	/**< Option flag: bank valid */
+	uint16_t reserved:15;	/**< Unused */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint8_t bank_lsb;	/**< LSB of bank (7bit) */
+	uint8_t bank_msb;	/**< MSB of bank (8bit) */
+	uint8_t reserved2;	/**< Unused */
+	uint8_t program;	/**< Program number (7bit) */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_program_t;
+
+/** MIDI 2.0 Channel Pressure (64bit) */
+typedef struct _snd_ump_msg_midi2_caf {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint16_t reserved;	/**< Unused */
+
+	uint32_t data;		/** Data (32bit) */
+#else
+	uint16_t reserved;	/**< Unused */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint32_t data;		/** Data (32bit) */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_caf_t;
+
+/* MIDI 2.0 Pitch Bend (64bit) */
+typedef struct _snd_ump_msg_midi2_pitchbend {
+#ifdef SNDRV_BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint16_t reserved;	/**< Unused */
+
+	uint32_t data;		/** Data (32bit) */
+#else
+	uint16_t reserved;	/**< Unused */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint32_t data;		/** Data (32bit) */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_pitchbend_t;
+
+/* MIDI 2.0 Per-Note Pitch Bend (64bit) */
+typedef struct _snd_ump_msg_midi2_per_note_pitchbend {
+#ifdef __BIG_ENDIAN_BITFIELD
+	uint8_t type:4;		/**< UMP packet type */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t status:4;	/**< Status */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t reserved;	/**< Unused */
+
+	uint32_t data;		/**< Data (32bit) */
+#else
+	/* 0 */
+	uint8_t reserved;	/**< Unused */
+	uint8_t note;		/**< Note (7bit) */
+	uint8_t channel:4;	/**< Channel */
+	uint8_t status:4;	/**< Status */
+	uint8_t group:4;	/**< UMP Group */
+	uint8_t type:4;		/**< UMP packet type */
+
+	uint32_t data;		/**< Data (32bit) */
+#endif
+} __attribute((packed)) snd_ump_msg_midi2_per_note_pitchbend_t;
+
+/** MIDI2 UMP packet (64bit little-endian) */
+typedef union _snd_ump_msg_midi2 {
+	snd_ump_msg_midi2_note_t	note_on;
+	snd_ump_msg_midi2_note_t	note_off;
+	snd_ump_msg_midi2_paf_t		poly_pressure;
+	snd_ump_msg_midi2_per_note_cc_t	per_note_acc;
+	snd_ump_msg_midi2_per_note_cc_t	per_note_rcc;
+	snd_ump_msg_midi2_per_note_mgmt_t per_note_mgmt;
+	snd_ump_msg_midi2_cc_t		control_change;
+	snd_ump_msg_midi2_rpn_t		rpn;
+	snd_ump_msg_midi2_rpn_t		nrpn;
+	snd_ump_msg_midi2_rpn_t		relative_rpn;
+	snd_ump_msg_midi2_rpn_t		relative_nrpn;
+	snd_ump_msg_midi2_program_t	program_change;
+	snd_ump_msg_midi2_caf_t		channel_pressure;
+	snd_ump_msg_midi2_pitchbend_t	pitchbend;
+	snd_ump_msg_midi2_per_note_pitchbend_t per_note_pitchbend;
+	snd_ump_msg_hdr_t		hdr;
+	uint32_t			raw[2];
+} snd_ump_msg_midi2_t;
+
+/**
+ * UMP message type
+ */
+enum {
+	SND_UMP_MSG_TYPE_SYSTEM			= 0x01,	/* System messages */
+	SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE	= 0x02,	/* MIDI 1.0 messages */
+	SND_UMP_MSG_TYPE_DATA			= 0x03,	/* 7bit SysEx messages */
+	SND_UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE	= 0x04,	/* MIDI 2.0 messages */
+	SND_UMP_MSG_TYPE_EXTENDED_DATA		= 0x05,	/* 8bit data message */
+};
+
+/**
+ * UMP MIDI 1.0 / 2.0 message status code (4bit)
+ */
+enum {
+	SND_UMP_MSG_PER_NOTE_RCC	= 0x0,
+	SND_UMP_MSG_PER_NOTE_ACC	= 0x1,
+	SND_UMP_MSG_RPN			= 0x2,
+	SND_UMP_MSG_NRPN		= 0x3,
+	SND_UMP_MSG_RELATIVE_RPN	= 0x4,
+	SND_UMP_MSG_RELATIVE_NRPN	= 0x5,
+	SND_UMP_MSG_PER_NOTE_PITCHBEND	= 0x6,
+	SND_UMP_MSG_NOTE_OFF		= 0x8,
+	SND_UMP_MSG_NOTE_ON		= 0x9,
+	SND_UMP_MSG_POLY_PRESSURE	= 0xa,
+	SND_UMP_MSG_CONTROL_CHANGE	= 0xb,
+	SND_UMP_MSG_PROGRAM_CHANGE	= 0xc,
+	SND_UMP_MSG_CHANNEL_PRESSURE	= 0xd,
+	SND_UMP_MSG_PITCHBEND		= 0xe,
+	SND_UMP_MSG_PER_NOTE_MGMT	= 0xf,
+};
+
+/**
+ * MIDI System / Realtime message status code (8bit)
+ */
+enum {
+	SND_UMP_MSG_REALTIME		= 0xf0, /* mask */
+	SND_UMP_MSG_SYSEX_START		= 0xf0,
+	SND_UMP_MSG_MIDI_TIME_CODE	= 0xf1,
+	SND_UMP_MSG_SONG_POSITION	= 0xf2,
+	SND_UMP_MSG_SONG_SELECT		= 0xf3,
+	SND_UMP_MSG_TUNE_REQUEST	= 0xf6,
+	SND_UMP_MSG_SYSEX_END		= 0xf7,
+	SND_UMP_MSG_TIMING_CLOCK	= 0xf8,
+	SND_UMP_MSG_START		= 0xfa,
+	SND_UMP_MSG_CONTINUE		= 0xfb,
+	SND_UMP_MSG_STOP		= 0xfc,
+	SND_UMP_MSG_ACTIVE_SENSING	= 0xfe,
+	SND_UMP_MSG_RESET		= 0xff,
+};
+
+/**
+ * \brief get UMP status (4bit) from 32bit UMP message header
+ */
+static inline uint8_t snd_ump_msg_hdr_status(uint32_t ump)
+{
+	return (ump >> 20) & 0x0f;
+}
+
+/**
+ * \brief get UMP channel (4bit) from 32bit UMP message header
+ */
+static inline uint8_t snd_ump_msg_hdr_channel(uint32_t ump)
+{
+	return (ump >> 16) & 0x0f;
+}
+
+/**
+ * \brief get UMP message type (4bit) from 32bit UMP message header
+ */
+static inline uint8_t snd_ump_msg_hdr_type(uint32_t ump)
+{
+	return (ump >> 28);
+}
+
+/**
+ * \brief get UMP group (4bit) from 32bit UMP message header
+ */
+static inline uint8_t snd_ump_msg_hdr_group(uint32_t ump)
+{
+	return (ump >> 24) & 0x0f;
+}
+
+/**
+ * \brief get UMP status from UMP packet pointer
+ */
+static inline uint8_t snd_ump_msg_status(const uint32_t *ump)
+{
+	return snd_ump_msg_hdr_status(*ump);
+}
+
+/**
+ * \brief get UMP channel from UMP packet pointer
+ */
+static inline uint8_t snd_ump_msg_channel(const uint32_t *ump)
+{
+	return snd_ump_msg_hdr_channel(*ump);
+}
+
+/**
+ * \brief get UMP message type from UMP packet pointer
+ */
+static inline uint8_t snd_ump_msg_type(const uint32_t *ump)
+{
+	return snd_ump_msg_hdr_type(*ump);
+}
+
+/**
+ * \brief get UMP group from UMP packet pointer
+ */
+static inline uint8_t snd_ump_msg_group(const uint32_t *ump)
+{
+	return snd_ump_msg_hdr_group(*ump);
+}
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* __ALSA_UMP_MSG_H */
diff --git a/src/rawmidi/ump_local.h b/src/rawmidi/ump_local.h
index 424051ae688b..53ce9a66dfcf 100644
--- a/src/rawmidi/ump_local.h
+++ b/src/rawmidi/ump_local.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: LGPL-2.1+ */
 #include "rawmidi.h"
 #include "ump.h"
+#include "ump_msg.h"
 
 struct _snd_ump {
 	snd_rawmidi_t *rawmidi;
-- 
2.35.3

