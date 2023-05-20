Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A04DE70A60C
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 09:05:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D36DF84A;
	Sat, 20 May 2023 09:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D36DF84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684566335;
	bh=j3WON3LL9QE3iR0hHv5oygEjLhIxYqqCN93BjwyjpjI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qu+RHaKaAjYf4ND2PQM2Q6Uat9GfdPK8X4jJsJCtXTmxjWqXgGDkVIdKMCPH5GCpG
	 GYCv/AAS+1bUgTNoOrI2Iqkwwk1XqUkUGrpeFUz4osLFngJiq1+f/j6PO30Z0rtBYb
	 dqeiACgs4vXM0hEoLIaidQussqLw2x+cxfq8tPDA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A19AF805AC; Sat, 20 May 2023 09:02:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2221F805AC;
	Sat, 20 May 2023 09:02:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAFFDF8025A; Sat, 20 May 2023 09:01:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 989E4F802E8
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 09:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 989E4F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sczDET0f;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gFQuC1Rg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 675B11FE41;
	Sat, 20 May 2023 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684566026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/punAocWtibjwVL1vtC1KZoF82Z+LthzSAiuwKq6hM=;
	b=sczDET0fk22h7y4IbxM8ATdvRn/SIkU8iU7vAaMZFdzbWYC7jaMdimT5oyL/Pj1IT8HCpc
	LFhNtFltmz5/s4oAHrxCwb89Rcf5AzKhd0B4Dmbb/8czWoWGozxmCFhO1RrkLCH3xebaKP
	6u7dXig2sxU8PPbnZr5dU9kxT6r4FRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684566026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/punAocWtibjwVL1vtC1KZoF82Z+LthzSAiuwKq6hM=;
	b=gFQuC1RgrQPd6MxqgpJRGAxH8SjqVIGZo+xwiFN0HFpTgNkEAx0k/OxQMd4kysn0g8uZFH
	MaKGJPKfBC49HcDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C638134F5;
	Sat, 20 May 2023 07:00:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WE3fEQpwaGTwGwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 07:00:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 7/8] uapi: Update asequencer.h definitions for 1.0.3
Date: Sat, 20 May 2023 09:00:20 +0200
Message-Id: <20230520070021.1301-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230520070021.1301-1-tiwai@suse.de>
References: <20230520070021.1301-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XBDNQTVTTEQLSVJM2QBOAS3R2QE4RDRN
X-Message-ID-Hash: XBDNQTVTTEQLSVJM2QBOAS3R2QE4RDRN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBDNQTVTTEQLSVJM2QBOAS3R2QE4RDRN/>
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

