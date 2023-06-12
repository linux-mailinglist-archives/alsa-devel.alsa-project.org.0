Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA872BA3B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E2382A;
	Mon, 12 Jun 2023 10:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E2382A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686558108;
	bh=8KjHrGq7ISmfB6+FUFRPjvbUWq1eASizVWFfPvpSfFk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GEJ85BwL4/sJnhfli6+RuUFk/nrfHP+pHFUxQ5qO3UKcgH1aAJjsXhvo7YLbVz0cP
	 vI8VHWs9aOfoeKa9gOkb9kJya7c9xO2XjADn6R4Cp8q//0i1cwj7A5Bnx4Tg7MJ5JO
	 2S0sbo8Ii9FQ69SH8CKwh1DueCLlgQSaEefsD5F0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EA3CF80558; Mon, 12 Jun 2023 10:20:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B2CCF80548;
	Mon, 12 Jun 2023 10:20:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3E91F80132; Mon, 12 Jun 2023 10:20:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C383BF80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C383BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gppoz6Nq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jVw1gmTR
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A7EC20488;
	Mon, 12 Jun 2023 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686558000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pHssYjzKlY10PMN7nOcHqRS6MbUfj2AMN4M8kIXFAEY=;
	b=gppoz6NqsE8zHROJILXHPL8N4KfqKs10EiUw1zE3ikDJGv6tZ+IBwicHby9rme6dPjDCxS
	W1AHehj6hQch4awDCOrC/cuAApPm0Na1mUg+fhpG9zHof5T4wtDwqWPWHTVgaeUVSCnAAW
	zOU6qddEth5CaG1nypKNWr5a8N4MIbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686558000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pHssYjzKlY10PMN7nOcHqRS6MbUfj2AMN4M8kIXFAEY=;
	b=jVw1gmTR2xseFnUlwx1C+aXI4wIe6PhDlPXzhexWya7zGa2L5WazmuN2T5+VPE9r9O2g8F
	2V/aaI2a1pFKYXBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D863138EC;
	Mon, 12 Jun 2023 08:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GGj/ETDVhmT5cwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:20:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 2/3] ump: Add UMP 1.1 features
Date: Mon, 12 Jun 2023 10:19:47 +0200
Message-Id: <20230612081948.18346-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081948.18346-1-tiwai@suse.de>
References: <20230612081948.18346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2ZVXC6X4X42UB2X3R3BNCCHKNBKHVHCW
X-Message-ID-Hash: 2ZVXC6X4X42UB2X3R3BNCCHKNBKHVHCW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZVXC6X4X42UB2X3R3BNCCHKNBKHVHCW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a few new features for UMP 1.1:
- New attributes in UMP Endpoint and Block info
- Static block bit flag for EP info

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/ump.h     | 22 +++++++++++++++
 include/ump_msg.h | 67 +++++++++++++++++++++++++++++++++++++++++++++
 src/rawmidi/ump.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/include/ump.h b/include/ump.h
index c79b2335aeff..1e5e053454b3 100644
--- a/include/ump.h
+++ b/include/ump.h
@@ -53,6 +53,9 @@ enum _snd_ump_direction {
 	SND_UMP_DIR_BIDIRECTION	=	0x03,
 };
 
+/** UMP EP holds only static blocks */
+#define SND_UMP_EP_INFO_STATIC_BLOCKS		0x01
+
 /** Bitmask for UMP EP MIDI protocols */
 #define SND_UMP_EP_INFO_PROTO_MIDI_MASK		0x0300
 /** Bit flag for MIDI 1.0 protocol */
@@ -82,6 +85,10 @@ unsigned int snd_ump_endpoint_info_get_protocol_caps(const snd_ump_endpoint_info
 unsigned int snd_ump_endpoint_info_get_protocol(const snd_ump_endpoint_info_t *info);
 unsigned int snd_ump_endpoint_info_get_num_blocks(const snd_ump_endpoint_info_t *info);
 unsigned int snd_ump_endpoint_info_get_version(const snd_ump_endpoint_info_t *info);
+unsigned int snd_ump_endpoint_info_get_manufacturer_id(const snd_ump_endpoint_info_t *info);
+unsigned int snd_ump_endpoint_info_get_family_id(const snd_ump_endpoint_info_t *info);
+unsigned int snd_ump_endpoint_info_get_model_id(const snd_ump_endpoint_info_t *info);
+const unsigned char *snd_ump_endpoint_info_get_sw_revision(const snd_ump_endpoint_info_t *info);
 const char *snd_ump_endpoint_info_get_name(const snd_ump_endpoint_info_t *info);
 const char *snd_ump_endpoint_info_get_product_id(const snd_ump_endpoint_info_t *info);
 int snd_ump_endpoint_info(snd_ump_t *ump, snd_ump_endpoint_info_t *info);
@@ -91,6 +98,18 @@ int snd_ump_endpoint_info(snd_ump_t *ump, snd_ump_endpoint_info_t *info);
 /** Bit flag for 31.25Kbps B/W MIDI1 port in UMP Block info flags */
 #define SND_UMP_BLOCK_IS_LOWSPEED	(1U << 1)
 
+/** UMP block user-interface hint */
+enum _snd_ump_block_ui_hint {
+	/** Unknown or undeclared */
+	SND_UMP_BLOCK_UI_HINT_UNKNOWN	=	0x00,
+	/** Primarily a receiver or a destination for MIDI messages */
+	SND_UMP_BLOCK_UI_HINT_RECEIVER =	0x01,
+	/** Primarily a sender or a source of MIDI messages */
+	SND_UMP_BLOCK_UI_HINT_SENDER =		0x02,
+	/** Both a sender and receiver of MIDI messages */
+	SND_UMP_BLOCK_UI_HINT_BOTH =		0x03,
+};
+
 size_t snd_ump_block_info_sizeof(void);
 /** \hideinitializer
  * \brief allocate an invalid #snd_ump_block_info_t using standard alloca
@@ -109,6 +128,9 @@ unsigned int snd_ump_block_info_get_flags(const snd_ump_block_info_t *info);
 unsigned int snd_ump_block_info_get_direction(const snd_ump_block_info_t *info);
 unsigned int snd_ump_block_info_get_first_group(const snd_ump_block_info_t *info);
 unsigned int snd_ump_block_info_get_num_groups(const snd_ump_block_info_t *info);
+unsigned int snd_ump_block_info_get_midi_ci_version(const snd_ump_block_info_t *info);
+unsigned int snd_ump_block_info_get_sysex8_streams(const snd_ump_block_info_t *info);
+unsigned int snd_ump_block_info_get_ui_hint(const snd_ump_block_info_t *info);
 const char *snd_ump_block_info_get_name(const snd_ump_block_info_t *info);
 int snd_ump_block_info(snd_ump_t *ump, snd_ump_block_info_t *info);
 
diff --git a/include/ump_msg.h b/include/ump_msg.h
index 4ccce546f8d5..e0264f6ecd00 100644
--- a/include/ump_msg.h
+++ b/include/ump_msg.h
@@ -453,11 +453,14 @@ typedef union _snd_ump_msg_midi2 {
  * UMP message type
  */
 enum {
+	SND_UMP_MSG_TYPE_UTILITY		= 0x00,	/* Utility messages */
 	SND_UMP_MSG_TYPE_SYSTEM			= 0x01,	/* System messages */
 	SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE	= 0x02,	/* MIDI 1.0 messages */
 	SND_UMP_MSG_TYPE_DATA			= 0x03,	/* 7bit SysEx messages */
 	SND_UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE	= 0x04,	/* MIDI 2.0 messages */
 	SND_UMP_MSG_TYPE_EXTENDED_DATA		= 0x05,	/* 8bit data message */
+	SND_UMP_MSG_TYPE_FLEX_DATA		= 0x0d,	/* Flexible data messages */
+	SND_UMP_MSG_TYPE_STREAM			= 0x0f,	/* Stream messages */
 };
 
 /**
@@ -508,6 +511,62 @@ enum {
 	SND_UMP_SYSEX_STATUS_END	= 3,
 };
 
+/** UMP Utility Type Status (type 0x0) **/
+enum {
+	SND_UMP_UTILITY_MSG_STATUS_NOOP		= 0x00,
+	SND_UMP_UTILITY_MSG_STATUS_JR_CLOCK	= 0x01,
+	SND_UMP_UTILITY_MSG_STATUS_JR_TSTAMP	= 0x02,
+	SND_UMP_UTILITY_MSG_STATUS_DCTPQ	= 0x03,
+	SND_UMP_UTILITY_MSG_STATUS_DC		= 0x04,
+};
+
+/** UMP Stream Message Status (type 0xf) */
+enum {
+	SND_UMP_STREAM_MSG_STATUS_EP_DISCOVERY	= 0x00,
+	SND_UMP_STREAM_MSG_STATUS_EP_INFO	= 0x01,
+	SND_UMP_STREAM_MSG_STATUS_DEVICE_INFO	= 0x02,
+	SND_UMP_STREAM_MSG_STATUS_EP_NAME	= 0x03,
+	SND_UMP_STREAM_MSG_STATUS_PRODUCT_ID	= 0x04,
+	SND_UMP_STREAM_MSG_STATUS_STREAM_CFG_REQUEST = 0x05,
+	SND_UMP_STREAM_MSG_STATUS_STREAM_CFG	= 0x06,
+	SND_UMP_STREAM_MSG_STATUS_FB_DISCOVERY	= 0x10,
+	SND_UMP_STREAM_MSG_STATUS_FB_INFO	= 0x11,
+	SND_UMP_STREAM_MSG_STATUS_FB_NAME	= 0x12,
+	SND_UMP_STREAM_MSG_STATUS_START_CLIP	= 0x20,
+	SND_UMP_STREAM_MSG_STATUS_END_CLIP	= 0x21,
+};
+
+/** UMP Endpoint Discovery filter bitmap */
+enum {
+	SND_UMP_STREAM_MSG_REQUEST_EP_INFO	= (1U << 0),
+	SND_UMP_STREAM_MSG_REQUEST_DEVICE_INFO	= (1U << 1),
+	SND_UMP_STREAM_MSG_REQUEST_EP_NAME	= (1U << 2),
+	SND_UMP_STREAM_MSG_REQUEST_PRODUCT_ID	= (1U << 3),
+	SND_UMP_STREAM_MSG_REQUEST_STREAM_CFG	= (1U << 4),
+};
+
+/** UMP Function Block Discovery filter bitmap */
+enum {
+	SND_UMP_STREAM_MSG_REQUEST_FB_INFO	= (1U << 0),
+	SND_UMP_STREAM_MSG_REQUEST_FB_NAME	= (1U << 1),
+};
+
+/** UMP Endpoint Info capability bits (used for protocol request/notify, too) */
+enum {
+	SND_UMP_STREAM_MSG_EP_INFO_CAP_TXJR	= (1U << 0), /* Sending JRTS */
+	SND_UMP_STREAM_MSG_EP_INFO_CAP_RXJR	= (1U << 1), /* Receiving JRTS */
+	SND_UMP_STREAM_MSG_EP_INFO_CAP_MIDI1	= (1U << 8), /* MIDI 1.0 */
+	SND_UMP_STREAM_MSG_EP_INFO_CAP_MIDI2	= (1U << 9), /* MIDI 2.0 */
+};
+
+/** UMP Endpoint / Function Block name string format bits */
+enum {
+	SND_UMP_STREAM_MSG_FORMAT_SINGLE	= 0,
+	SND_UMP_STREAM_MSG_FORMAT_START		= 1,
+	SND_UMP_STREAM_MSG_FORMAT_CONTINUE	= 2,
+	SND_UMP_STREAM_MSG_FORMAT_END		= 3,
+};
+
 /**
  * \brief get UMP status (4bit) from 32bit UMP message header
  */
@@ -532,6 +591,14 @@ static inline uint8_t snd_ump_msg_hdr_type(uint32_t ump)
 	return (ump >> 28);
 }
 
+/**
+ * \brief check if the given UMP type is a groupless message
+ */
+static inline int snd_ump_msg_type_is_groupless(uint8_t type)
+{
+	return type == SND_UMP_MSG_TYPE_UTILITY || type == SND_UMP_MSG_TYPE_STREAM;
+}
+
 /**
  * \brief get UMP group (4bit) from 32bit UMP message header
  */
diff --git a/src/rawmidi/ump.c b/src/rawmidi/ump.c
index 2482884f2661..80fa514003a7 100644
--- a/src/rawmidi/ump.c
+++ b/src/rawmidi/ump.c
@@ -422,6 +422,46 @@ unsigned int snd_ump_endpoint_info_get_version(const snd_ump_endpoint_info_t *in
 	return info->version;
 }
 
+/**
+ * \brief get UMP manufacturer ID
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP manufacturer ID
+ */
+unsigned int snd_ump_endpoint_info_get_manufacturer_id(const snd_ump_endpoint_info_t *info)
+{
+	return info->manufacturer_id;
+}
+
+/**
+ * \brief get UMP family ID
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP family ID
+ */
+unsigned int snd_ump_endpoint_info_get_family_id(const snd_ump_endpoint_info_t *info)
+{
+	return info->family_id;
+}
+
+/**
+ * \brief get UMP model ID
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP model ID
+ */
+unsigned int snd_ump_endpoint_info_get_model_id(const snd_ump_endpoint_info_t *info)
+{
+	return info->model_id;
+}
+
+/**
+ * \brief get UMP software revision
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP software revision
+ */
+const unsigned char *snd_ump_endpoint_info_get_sw_revision(const snd_ump_endpoint_info_t *info)
+{
+	return info->sw_revision;
+}
+
 /**
  * \brief get UMP endpoint name string
  * \param info pointer to a snd_ump_endpoint_info_t structure
@@ -592,6 +632,36 @@ unsigned int snd_ump_block_info_get_num_groups(const snd_ump_block_info_t *info)
 	return info->num_groups;
 }
 
+/**
+ * \brief get MIDI-CI version number
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return MIDI-CI version number
+ */
+unsigned int snd_ump_block_info_get_midi_ci_version(const snd_ump_block_info_t *info)
+{
+	return info->midi_ci_version;
+}
+
+/**
+ * \brief get number of supported SysEx8 streams
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return number of supported SysEx8 streams
+ */
+unsigned int snd_ump_block_info_get_sysex8_streams(const snd_ump_block_info_t *info)
+{
+	return info->sysex8_streams;
+}
+
+/**
+ * \brief get UI hint of the given UMP block
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return the hint bits
+ */
+unsigned int snd_ump_block_info_get_ui_hint(const snd_ump_block_info_t *info)
+{
+	return info->ui_hint;
+}
+
 /**
  * \brief get the name string of UMP block
  * \param info pointer to a snd_ump_block_info_t structure
-- 
2.35.3

