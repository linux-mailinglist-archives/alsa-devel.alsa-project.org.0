Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8670DC85
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 14:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9269A846;
	Tue, 23 May 2023 14:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9269A846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684844718;
	bh=j3WON3LL9QE3iR0hHv5oygEjLhIxYqqCN93BjwyjpjI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hWXFL9exx+FTSwZE4PZMRgeUm1iJreiDa2zdl+983f5wBeEWLaDxrkEjoKZflKrUa
	 R2PXkY5JRHXxrzg0F7Ioof6kkJZMZTRgkHUr2zPSoYvdJguJSBl4+Fh9XYCYPAgEs2
	 XoOSygPyzwKEH3iqlpCh+sMhSxF0HoUY/qeHonVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A81E4F805B5; Tue, 23 May 2023 14:23:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7036F805B0;
	Tue, 23 May 2023 14:23:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8A21F80588; Tue, 23 May 2023 14:23:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6273FF80544
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 14:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6273FF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ztCaQu+u;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=38HEXNlJ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 12B9620578;
	Tue, 23 May 2023 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684844575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/punAocWtibjwVL1vtC1KZoF82Z+LthzSAiuwKq6hM=;
	b=ztCaQu+u3Ea0nVotWAowZ4nOAMJy38WYYNgUVTvyEpCevE4OuKvGCZbsv6zWJPFmyCiAqW
	yxCqdxnlgwE1FrJnMFv9gHaTsUyIP7P22ryNBFf+O/xhKGNRrlE4m7pvRSyiVsx8x28nO6
	Hr/uweg/jSCkNkh+VOyWhVqvc6hZhHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684844575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/punAocWtibjwVL1vtC1KZoF82Z+LthzSAiuwKq6hM=;
	b=38HEXNlJ2Yeji9jKzctqmE5SDYNROltrIBXWpzcgBntRMTM+QPYWEyhr8Jvwz0YJzj1sPA
	StDY22acTsLlkWBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED16113A1A;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mCIlOR6wbGQNKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 12:22:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 09/10] uapi: Update asequencer.h definitions for
 1.0.3
Date: Tue, 23 May 2023 14:22:46 +0200
Message-Id: <20230523122247.11744-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523122247.11744-1-tiwai@suse.de>
References: <20230523122247.11744-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JRH6CINEJE2MXC4HGZEZXPVDBOVOGITG
X-Message-ID-Hash: JRH6CINEJE2MXC4HGZEZXPVDBOVOGITG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRH6CINEJE2MXC4HGZEZXPVDBOVOGITG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Updated from kernel for supporting UMP on sequencer API.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/uapi/asequencer.h | 91 +++++++++++++++++++++++++--------
 1 file changed, 70 insertions(+), 21 deletions(-)

diff --git a/include/sound/uapi/asequencer.h b/include/sound/uapi/asequencer.h
index 2d600320e2ae..3653a3f33778 100644
--- a/include/sound/uapi/asequencer.h
+++ b/include/sound/uapi/asequencer.h
@@ -26,7 +26,7 @@
 #include <sound/asound.h>
 
 /** version of the sequencer */
-#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 2)
+#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 3)
 
 /**
  * definition of sequencer event types
@@ -190,6 +190,7 @@ struct snd_seq_connect {
 #define SNDRV_SEQ_PRIORITY_HIGH		(1<<4)	/* event should be processed before others */
 #define SNDRV_SEQ_PRIORITY_MASK		(1<<4)
 
+#define SNDRV_SEQ_EVENT_UMP		(1<<5)	/* event holds a UMP packet */
 
 	/* note event */
 struct snd_seq_ev_note {
@@ -268,6 +269,19 @@ struct snd_seq_ev_quote {
 	struct snd_seq_event *event;		/* quoted event */
 } __attribute__((packed));
 
+union snd_seq_event_data { /* event data... */
+	struct snd_seq_ev_note note;
+	struct snd_seq_ev_ctrl control;
+	struct snd_seq_ev_raw8 raw8;
+	struct snd_seq_ev_raw32 raw32;
+	struct snd_seq_ev_ext ext;
+	struct snd_seq_ev_queue_control queue;
+	union snd_seq_timestamp time;
+	struct snd_seq_addr addr;
+	struct snd_seq_connect connect;
+	struct snd_seq_result result;
+	struct snd_seq_ev_quote quote;
+};
 
 	/* sequencer event */
 struct snd_seq_event {
@@ -278,25 +292,27 @@ struct snd_seq_event {
 	unsigned char queue;		/* schedule queue */
 	union snd_seq_timestamp time;	/* schedule time */
 
-
 	struct snd_seq_addr source;	/* source address */
 	struct snd_seq_addr dest;	/* destination address */
 
-	union {				/* event data... */
-		struct snd_seq_ev_note note;
-		struct snd_seq_ev_ctrl control;
-		struct snd_seq_ev_raw8 raw8;
-		struct snd_seq_ev_raw32 raw32;
-		struct snd_seq_ev_ext ext;
-		struct snd_seq_ev_queue_control queue;
-		union snd_seq_timestamp time;
-		struct snd_seq_addr addr;
-		struct snd_seq_connect connect;
-		struct snd_seq_result result;
-		struct snd_seq_ev_quote quote;
-	} data;
+	union snd_seq_event_data data;
 };
 
+	/* (compatible) event for UMP-capable clients */
+struct snd_seq_ump_event {
+	snd_seq_event_type_t type;	/* event type */
+	unsigned char flags;		/* event flags */
+	char tag;
+	unsigned char queue;		/* schedule queue */
+	union snd_seq_timestamp time;	/* schedule time */
+	struct snd_seq_addr source;	/* source address */
+	struct snd_seq_addr dest;	/* destination address */
+
+	union {
+		union snd_seq_event_data data;
+		unsigned int ump[4];
+	};
+};
 
 /*
  * bounce event - stored as variable size data
@@ -344,10 +360,11 @@ typedef int __bitwise snd_seq_client_type_t;
 #define	KERNEL_CLIENT	((snd_seq_client_type_t) 2)
                         
 	/* event filter flags */
-#define SNDRV_SEQ_FILTER_BROADCAST	(1<<0)	/* accept broadcast messages */
-#define SNDRV_SEQ_FILTER_MULTICAST	(1<<1)	/* accept multicast messages */
-#define SNDRV_SEQ_FILTER_BOUNCE		(1<<2)	/* accept bounce event in error */
-#define SNDRV_SEQ_FILTER_USE_EVENT	(1<<31)	/* use event filter */
+#define SNDRV_SEQ_FILTER_BROADCAST	(1U<<0)	/* accept broadcast messages */
+#define SNDRV_SEQ_FILTER_MULTICAST	(1U<<1)	/* accept multicast messages */
+#define SNDRV_SEQ_FILTER_BOUNCE		(1U<<2)	/* accept bounce event in error */
+#define SNDRV_SEQ_FILTER_NO_CONVERT	(1U<<30) /* don't convert UMP events */
+#define SNDRV_SEQ_FILTER_USE_EVENT	(1U<<31)	/* use event filter */
 
 struct snd_seq_client_info {
 	int client;			/* client number to inquire */
@@ -360,9 +377,15 @@ struct snd_seq_client_info {
 	int event_lost;			/* number of lost events */
 	int card;			/* RO: card number[kernel] */
 	int pid;			/* RO: pid[user] */
-	char reserved[56];		/* for future use */
+	unsigned int midi_version;	/* MIDI version */
+	unsigned int group_filter;	/* UMP group filter bitmap */
+	char reserved[48];		/* for future use */
 };
 
+/* MIDI version numbers in client info */
+#define SNDRV_SEQ_CLIENT_LEGACY_MIDI		0	/* Legacy client */
+#define SNDRV_SEQ_CLIENT_UMP_MIDI_1_0		1	/* UMP MIDI 1.0 */
+#define SNDRV_SEQ_CLIENT_UMP_MIDI_2_0		2	/* UMP MIDI 2.0 */
 
 /* client pool size */
 struct snd_seq_client_pool {
@@ -422,6 +445,8 @@ struct snd_seq_remove_events {
 #define SNDRV_SEQ_PORT_CAP_SUBS_READ	(1<<5)	/* allow read subscription */
 #define SNDRV_SEQ_PORT_CAP_SUBS_WRITE	(1<<6)	/* allow write subscription */
 #define SNDRV_SEQ_PORT_CAP_NO_EXPORT	(1<<7)	/* routing not allowed */
+#define SNDRV_SEQ_PORT_CAP_INACTIVE	(1<<8)	/* inactive port */
+#define SNDRV_SEQ_PORT_CAP_UMP_ENDPOINT	(1<<9)	/* MIDI 2.0 UMP Endpoint port */
 
 	/* port type */
 #define SNDRV_SEQ_PORT_TYPE_SPECIFIC	(1<<0)	/* hardware specific */
@@ -431,6 +456,7 @@ struct snd_seq_remove_events {
 #define SNDRV_SEQ_PORT_TYPE_MIDI_XG	(1<<4)	/* XG compatible device */
 #define SNDRV_SEQ_PORT_TYPE_MIDI_MT32	(1<<5)	/* MT-32 compatible device */
 #define SNDRV_SEQ_PORT_TYPE_MIDI_GM2	(1<<6)	/* General MIDI 2 compatible device */
+#define SNDRV_SEQ_PORT_TYPE_MIDI_UMP	(1<<7)	/* UMP */
 
 /* other standards...*/
 #define SNDRV_SEQ_PORT_TYPE_SYNTH	(1<<10)	/* Synth device (no MIDI compatible - direct wavetable) */
@@ -448,6 +474,12 @@ struct snd_seq_remove_events {
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
@@ -464,7 +496,9 @@ struct snd_seq_port_info {
 	void *kernel;			/* reserved for kernel use (must be NULL) */
 	unsigned int flags;		/* misc. conditioning */
 	unsigned char time_queue;	/* queue # for timestamping */
-	char reserved[59];		/* for future use */
+	unsigned char direction;	/* port usage direction (r/w/bidir) */
+	unsigned char ump_group;	/* 0 = UMP EP (no conversion), 1-16 = UMP group number */
+	char reserved[57];		/* for future use */
 };
 
 
@@ -568,6 +602,18 @@ struct snd_seq_query_subs {
 	char reserved[64];	/* for future use */
 };
 
+/*
+ * UMP-specific information
+ */
+/* type of UMP info query */
+#define SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT	0
+#define SNDRV_SEQ_CLIENT_UMP_INFO_BLOCK		1
+
+struct snd_seq_client_ump_info {
+	int client;			/* client number to inquire/set */
+	int type;			/* type to inquire/set */
+	unsigned char info[512];	/* info (either UMP ep or block info) */
+} __packed;
 
 /*
  *  IOCTL commands
@@ -577,9 +623,12 @@ struct snd_seq_query_subs {
 #define SNDRV_SEQ_IOCTL_CLIENT_ID	_IOR ('S', 0x01, int)
 #define SNDRV_SEQ_IOCTL_SYSTEM_INFO	_IOWR('S', 0x02, struct snd_seq_system_info)
 #define SNDRV_SEQ_IOCTL_RUNNING_MODE	_IOWR('S', 0x03, struct snd_seq_running_info)
+#define SNDRV_SEQ_IOCTL_USER_PVERSION	_IOW('S', 0x04, int)
 
 #define SNDRV_SEQ_IOCTL_GET_CLIENT_INFO	_IOWR('S', 0x10, struct snd_seq_client_info)
 #define SNDRV_SEQ_IOCTL_SET_CLIENT_INFO	_IOW ('S', 0x11, struct snd_seq_client_info)
+#define SNDRV_SEQ_IOCTL_GET_CLIENT_UMP_INFO	_IOWR('S', 0x12, struct snd_seq_client_ump_info)
+#define SNDRV_SEQ_IOCTL_SET_CLIENT_UMP_INFO	_IOWR('S', 0x13, struct snd_seq_client_ump_info)
 
 #define SNDRV_SEQ_IOCTL_CREATE_PORT	_IOWR('S', 0x20, struct snd_seq_port_info)
 #define SNDRV_SEQ_IOCTL_DELETE_PORT	_IOW ('S', 0x21, struct snd_seq_port_info)
-- 
2.35.3

