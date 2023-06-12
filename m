Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D67272BA28
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D990820;
	Mon, 12 Jun 2023 10:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D990820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686558057;
	bh=sAOiIGDgwUN985n3Cv7l18QQGNrd9EbbKFbJywNdMoU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GPZJtBOTl2wSFWHBsxpZ6cmfRMhe6TVA2zMGeUU03NTVkCjmvjOBs0uAAi2YqHDo1
	 zm0B3/d2Wo5C3vBWe5PrvuV9okmyl64m7E1QpJdYG1f+J/zRZRantlSERuN7Bjp1Lc
	 84dkUf03nQQ29uekcyYvFVE1IHOeLijSNUzyy35g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2E30F80149; Mon, 12 Jun 2023 10:20:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E0A9F80130;
	Mon, 12 Jun 2023 10:20:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDE16F800BA; Mon, 12 Jun 2023 10:20:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C2C5F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C2C5F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VI3myUeW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KYCbsWwt
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4944620487;
	Mon, 12 Jun 2023 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686558000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfrY9dgHX1IgoFS4kTyrdA8BY8ShvIpfZjRQZZfBZyY=;
	b=VI3myUeWA3Dv7DNBi/5bRjgRvTe3xb/QF1sBbA0XN1cj4o1ZE1MPn3a1h17vHQ/fzucexC
	RhsqnsqIzz8SCvKxN7L3/lMeRfcduHDIu5tHhdLP6bbpNaNjpHqpO61umRQiO/corpqb/6
	1CymIkHcweUbuuH6HE5AwtpgSaWpHtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686558000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfrY9dgHX1IgoFS4kTyrdA8BY8ShvIpfZjRQZZfBZyY=;
	b=KYCbsWwt7hE8xERwggZkSowcw/K9TLV8W5crfDzWojKTJBcGtYT/0xX9ogqAtgth1MQsP1
	/sd3R3de+rnAouCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DE4313A67;
	Mon, 12 Jun 2023 08:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IAViCjDVhmT5cwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:20:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/3] uapi: Update rawmidi API to 2.0.4
Date: Mon, 12 Jun 2023 10:19:46 +0200
Message-Id: <20230612081948.18346-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081948.18346-1-tiwai@suse.de>
References: <20230612081948.18346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BPRN6P3ZJD4JCIOADJWV2ZGQ5KRGTDIG
X-Message-ID-Hash: BPRN6P3ZJD4JCIOADJWV2ZGQ5KRGTDIG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPRN6P3ZJD4JCIOADJWV2ZGQ5KRGTDIG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sync with the kernel change of rawmidi API for supporting UMP 1.1
features.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/uapi/asound.h | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/sound/uapi/asound.h b/include/sound/uapi/asound.h
index 80cd57e968e5..32095ef79cab 100644
--- a/include/sound/uapi/asound.h
+++ b/include/sound/uapi/asound.h
@@ -706,7 +706,7 @@ enum {
  *  Raw MIDI section - /dev/snd/midi??
  */
 
-#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 3)
+#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 4)
 
 enum {
 	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
@@ -776,6 +776,9 @@ struct snd_rawmidi_status {
 	unsigned char reserved[16];	/* reserved for future use */
 };
 
+/* UMP EP info flags */
+#define SNDRV_UMP_EP_INFO_STATIC_BLOCKS		0x01
+
 /* UMP EP Protocol / JRTS capability bits */
 #define SNDRV_UMP_EP_INFO_PROTO_MIDI_MASK	0x0300
 #define SNDRV_UMP_EP_INFO_PROTO_MIDI1		0x0100 /* MIDI 1.0 */
@@ -793,7 +796,11 @@ struct snd_ump_endpoint_info {
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
@@ -808,6 +815,12 @@ struct snd_ump_endpoint_info {
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
@@ -821,7 +834,9 @@ struct snd_ump_block_info {
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
-- 
2.35.3

