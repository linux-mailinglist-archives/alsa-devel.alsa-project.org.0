Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5C70DC8D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 14:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10BC3200;
	Tue, 23 May 2023 14:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10BC3200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684844772;
	bh=FN1iPRn/OM71K+z9mqgksCnRn2tUkyxRNXXuYERcsH4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cgQeLx/IO03Gxb23lOXesa3YLeBzSja+nkjyl4SNBhYOqUjON73DluND3yu4etHuL
	 OsrAH25vp7gbzooCIFfJSIgHcmEDxXMSFbc08mp4YX/qSL0BC82Lqtx7X4WC8elXCr
	 /c3qLxQjtXOy8SNlXcpuJMJ7R1BKFPWc1c0mmTBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD32EF805D6; Tue, 23 May 2023 14:23:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4AB4F805D2;
	Tue, 23 May 2023 14:23:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6E63F805BE; Tue, 23 May 2023 14:23:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 35D99F80551
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 14:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35D99F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=H4XuebYu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ysMzFdO4
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A70B22A38;
	Tue, 23 May 2023 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684844575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=scExec/caLmoo02tSL9ky10a3sVY7N+z8rVlKrGWHhg=;
	b=H4XuebYullfVCDStBMiICrHpNz2sI4pF+npWGt2CqtKLopXmt7Qpa4TylFtGvQL9g2LQdN
	1/7siIPOK26dmU9pbuq8WToocDtbyXJJSpgVCjrN5zlEZw2fw+Rms/9aJhWEc2WQaD8gpI
	S3mvb+e5gBykVSFyGnLBGR1+LTmtJsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684844575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=scExec/caLmoo02tSL9ky10a3sVY7N+z8rVlKrGWHhg=;
	b=ysMzFdO4OZkKWOFzHv/mEF9yTi9sjzcnS8s6eKhJnc54S1+YxMf///yelqMnSRe2gwnj1M
	I2Nv+GVzqZjrQLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DEE613588;
	Tue, 23 May 2023 12:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sDMbBh+wbGQNKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 12:22:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 10/10] seq: Add UMP support
Date: Tue, 23 May 2023 14:22:47 +0200
Message-Id: <20230523122247.11744-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523122247.11744-1-tiwai@suse.de>
References: <20230523122247.11744-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NPMFRXAISQLXYURQFRYKERNGKR77YHDM
X-Message-ID-Hash: NPMFRXAISQLXYURQFRYKERNGKR77YHDM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPMFRXAISQLXYURQFRYKERNGKR77YHDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds the basic support of UMP on ALSA sequencer API.
An extended event type, snd_seq_ump_event_t, is defined.  It's
compatible with the existing type, snd_seq_event_t, but it has a
larger payload of 16 bytes instead of 12 bytes, for holding the full
128bit UMP packet.

The new snd_seq_ump_event_t must have the bit SND_SEQ_EVENT_UMP in the
event flags.

A few new API functions have been added such as
snd_seq_ump_event_output() and snd_seq_ump_event_input() for
reading/writing this new event object.

The support of UMP in the sequencer client is switched by the function
snd_seq_client_set_midi_version().  It can switch from the default
legacy MIDI to UMP MIDI 1.0 or 2.0 on the fly.

The automatic event conversion among UMP and legacy clients can be
suppressed via snd_seq_client_set_ump_conversion().

The inquiry of the associated UMP Endpoints and UMP Blocks can be done
via snd_seq_get_ump_endpoint_info() and snd_seq_get_ump_block_info().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/local.h     |   2 +
 include/seq.h       |  44 +++++
 include/seq_event.h |  42 +++--
 include/seqmid.h    |  24 +++
 src/Versions.in     |  17 ++
 src/seq/seq.c       | 410 ++++++++++++++++++++++++++++++++++++++++----
 src/seq/seq_hw.c    |  72 +++++++-
 src/seq/seq_local.h |   6 +-
 src/seq/seqmid.c    |  38 ++++
 9 files changed, 604 insertions(+), 51 deletions(-)

diff --git a/include/local.h b/include/local.h
index c6be21ee20ca..512e44555361 100644
--- a/include/local.h
+++ b/include/local.h
@@ -196,7 +196,9 @@
 #define snd_seq_real_time	sndrv_seq_real_time
 #define snd_seq_timestamp	sndrv_seq_timestamp
 #define snd_seq_event_type_t	sndrv_seq_event_type_t
+#define snd_seq_event_data	sndrv_seq_event_data
 #define snd_seq_event		sndrv_seq_event
+#define snd_seq_ump_event	sndrv_seq_ump_event
 #define snd_seq_connect		sndrv_seq_connect
 #define snd_seq_ev_note		sndrv_seq_ev_note
 #define snd_seq_ev_ctrl		sndrv_seq_ev_ctrl
diff --git a/include/seq.h b/include/seq.h
index 123a1057f568..7faf4367df3d 100644
--- a/include/seq.h
+++ b/include/seq.h
@@ -130,6 +130,13 @@ typedef enum snd_seq_client_type {
 	SND_SEQ_KERNEL_CLIENT   = 2	/**< kernel client */
 } snd_seq_client_type_t;
                         
+/** client MIDI version */
+enum {
+	SND_SEQ_CLIENT_LEGACY_MIDI = 0,		/**< Legacy client */
+	SND_SEQ_CLIENT_UMP_MIDI_1_0 = 1,	/**< UMP MIDI 1.0 */
+	SND_SEQ_CLIENT_UMP_MIDI_2_0 = 2		/**< UMP MIDI 2.0 */
+};
+
 size_t snd_seq_client_info_sizeof(void);
 /** allocate a #snd_seq_client_info_t container on stack */
 #define snd_seq_client_info_alloca(ptr) \
@@ -149,11 +156,19 @@ const unsigned char *snd_seq_client_info_get_event_filter(const snd_seq_client_i
 int snd_seq_client_info_get_num_ports(const snd_seq_client_info_t *info);
 int snd_seq_client_info_get_event_lost(const snd_seq_client_info_t *info);
 
+int snd_seq_client_info_get_midi_version(const snd_seq_client_info_t *info);
+int snd_seq_client_info_get_ump_group_enabled(const snd_seq_client_info_t *info,
+					      int group);
+int snd_seq_client_info_get_ump_conversion(const snd_seq_client_info_t *info);
 void snd_seq_client_info_set_client(snd_seq_client_info_t *info, int client);
 void snd_seq_client_info_set_name(snd_seq_client_info_t *info, const char *name);
 void snd_seq_client_info_set_broadcast_filter(snd_seq_client_info_t *info, int val);
 void snd_seq_client_info_set_error_bounce(snd_seq_client_info_t *info, int val);
 void snd_seq_client_info_set_event_filter(snd_seq_client_info_t *info, unsigned char *filter);
+void snd_seq_client_info_set_midi_version(snd_seq_client_info_t *info, int midi_version);
+void snd_seq_client_info_set_ump_group_enabled(snd_seq_client_info_t *info,
+					       int group, int enable);
+void snd_seq_client_info_set_ump_conversion(snd_seq_client_info_t *info, int enable);
 
 void snd_seq_client_info_event_filter_clear(snd_seq_client_info_t *info);
 void snd_seq_client_info_event_filter_add(snd_seq_client_info_t *info, int event_type);
@@ -165,6 +180,11 @@ int snd_seq_get_any_client_info(snd_seq_t *handle, int client, snd_seq_client_in
 int snd_seq_set_client_info(snd_seq_t *handle, snd_seq_client_info_t *info);
 int snd_seq_query_next_client(snd_seq_t *handle, snd_seq_client_info_t *info);
 
+int snd_seq_get_ump_endpoint_info(snd_seq_t *seq, int client, void *info);
+int snd_seq_get_ump_block_info(snd_seq_t *seq, int client, int blk, void *info);
+int snd_seq_set_ump_endpoint_info(snd_seq_t *seq, const void *info);
+int snd_seq_set_ump_block_info(snd_seq_t *seq, int blk, const void *info);
+
 /*
  */
 
@@ -222,6 +242,14 @@ typedef struct _snd_seq_port_info snd_seq_port_info_t;
 #define SND_SEQ_PORT_CAP_SUBS_READ	(1<<5)	/**< allow read subscription */
 #define SND_SEQ_PORT_CAP_SUBS_WRITE	(1<<6)	/**< allow write subscription */
 #define SND_SEQ_PORT_CAP_NO_EXPORT	(1<<7)	/**< routing not allowed */
+#define SND_SEQ_PORT_CAP_INACTIVE	(1<<8)	/**< inactive port */
+#define SND_SEQ_PORT_CAP_UMP_ENDPOINT	(1<<9)	/**< UMP Endpoint port */
+
+/** port direction */
+#define SND_SEQ_PORT_DIR_UNKNOWN	0	/**< Unknown */
+#define SND_SEQ_PORT_DIR_INPUT		1	/**< Input only */
+#define SND_SEQ_PORT_DIR_OUTPUT		2	/**< Output only */
+#define SND_SEQ_PORT_DIR_BIDIRECTION	3	/**< Input/output bidirectional */
 
 /* port type */
 /** Messages sent from/to this port have device-specific semantics. */
@@ -238,6 +266,8 @@ typedef struct _snd_seq_port_info snd_seq_port_info_t;
 #define SND_SEQ_PORT_TYPE_MIDI_MT32	(1<<5)
 /** This port is compatible with the General MIDI 2 specification. */
 #define SND_SEQ_PORT_TYPE_MIDI_GM2	(1<<6)
+/** This port is a UMP port. */
+#define SND_SEQ_PORT_TYPE_MIDI_UMP	(1<<7)
 /** This port understands SND_SEQ_EVENT_SAMPLE_xxx messages
     (these are not MIDI messages). */
 #define SND_SEQ_PORT_TYPE_SYNTH		(1<<10)
@@ -283,6 +313,8 @@ int snd_seq_port_info_get_port_specified(const snd_seq_port_info_t *info);
 int snd_seq_port_info_get_timestamping(const snd_seq_port_info_t *info);
 int snd_seq_port_info_get_timestamp_real(const snd_seq_port_info_t *info);
 int snd_seq_port_info_get_timestamp_queue(const snd_seq_port_info_t *info);
+int snd_seq_port_info_get_direction(const snd_seq_port_info_t *info);
+int snd_seq_port_info_get_ump_group(const snd_seq_port_info_t *info);
 
 void snd_seq_port_info_set_client(snd_seq_port_info_t *info, int client);
 void snd_seq_port_info_set_port(snd_seq_port_info_t *info, int port);
@@ -297,6 +329,8 @@ void snd_seq_port_info_set_port_specified(snd_seq_port_info_t *info, int val);
 void snd_seq_port_info_set_timestamping(snd_seq_port_info_t *info, int enable);
 void snd_seq_port_info_set_timestamp_real(snd_seq_port_info_t *info, int realtime);
 void snd_seq_port_info_set_timestamp_queue(snd_seq_port_info_t *info, int queue);
+void snd_seq_port_info_set_direction(snd_seq_port_info_t *info, int direction);
+void snd_seq_port_info_set_ump_gruop(snd_seq_port_info_t *info, int ump_group);
 
 int snd_seq_create_port(snd_seq_t *handle, snd_seq_port_info_t *info);
 int snd_seq_delete_port(snd_seq_t *handle, int port);
@@ -572,6 +606,12 @@ void snd_seq_remove_events_set_tag(snd_seq_remove_events_t *info, int tag);
 
 int snd_seq_remove_events(snd_seq_t *handle, snd_seq_remove_events_t *info);
 
+int snd_seq_ump_event_output(snd_seq_t *seq, snd_seq_ump_event_t *ev);
+int snd_seq_ump_event_output_buffer(snd_seq_t *seq, snd_seq_ump_event_t *ev);
+int snd_seq_ump_extract_output(snd_seq_t *seq, snd_seq_ump_event_t **ev_res);
+int snd_seq_ump_event_output_direct(snd_seq_t *seq, snd_seq_ump_event_t *ev);
+int snd_seq_ump_event_input(snd_seq_t *seq, snd_seq_ump_event_t **ev);
+
 /** \} */
 
 /**
@@ -729,6 +769,10 @@ extern const unsigned int snd_seq_event_types[];
 #define snd_seq_ev_is_direct(ev) \
 	((ev)->queue == SND_SEQ_QUEUE_DIRECT)
 
+/** UMP events */
+#define snd_seq_ev_is_ump(ev) \
+	((ev)->flags & SND_SEQ_EVENT_UMP)
+
 /** \} */
 
 #ifdef __cplusplus
diff --git a/include/seq_event.h b/include/seq_event.h
index 60727f52a358..9ca384ee4a0a 100644
--- a/include/seq_event.h
+++ b/include/seq_event.h
@@ -225,6 +225,7 @@ typedef union snd_seq_timestamp {
 #define SND_SEQ_PRIORITY_HIGH		(1<<4)	/**< event should be processed before others */
 #define SND_SEQ_PRIORITY_MASK		(1<<4)	/**< mask for priority bits */
 
+#define SND_SEQ_EVENT_UMP		(1<<5)	/**< UMP packet event */
 
 /** Note event */
 typedef struct snd_seq_ev_note {
@@ -291,6 +292,19 @@ typedef struct snd_seq_ev_queue_control {
 	} param;				/**< data value union */
 } snd_seq_ev_queue_control_t;
 
+/** Sequencer event data */
+typedef union snd_seq_event_data {
+	snd_seq_ev_note_t note;		/**< note information */
+	snd_seq_ev_ctrl_t control;	/**< MIDI control information */
+	snd_seq_ev_raw8_t raw8;		/**< raw8 data */
+	snd_seq_ev_raw32_t raw32;	/**< raw32 data */
+	snd_seq_ev_ext_t ext;		/**< external data */
+	snd_seq_ev_queue_control_t queue; /**< queue control */
+	snd_seq_timestamp_t time;	/**< timestamp */
+	snd_seq_addr_t addr;		/**< address */
+	snd_seq_connect_t connect;	/**< connect information */
+	snd_seq_result_t result;	/**< operation result code */
+} snd_seq_event_data_t;
 
 /** Sequencer event */
 typedef struct snd_seq_event {
@@ -304,20 +318,24 @@ typedef struct snd_seq_event {
 	snd_seq_addr_t source;		/**< source address */
 	snd_seq_addr_t dest;		/**< destination address */
 
-	union {
-		snd_seq_ev_note_t note;		/**< note information */
-		snd_seq_ev_ctrl_t control;	/**< MIDI control information */
-		snd_seq_ev_raw8_t raw8;		/**< raw8 data */
-		snd_seq_ev_raw32_t raw32;	/**< raw32 data */
-		snd_seq_ev_ext_t ext;		/**< external data */
-		snd_seq_ev_queue_control_t queue; /**< queue control */
-		snd_seq_timestamp_t time;	/**< timestamp */
-		snd_seq_addr_t addr;		/**< address */
-		snd_seq_connect_t connect;	/**< connect information */
-		snd_seq_result_t result;	/**< operation result code */
-	} data;				/**< event data... */
+	snd_seq_event_data_t data;	/**< event data... */
 } snd_seq_event_t;
 
+/** UMP sequencer event; compatible with legacy sequencer event */
+typedef struct snd_seq_ump_event {
+	snd_seq_event_type_t type;	/**< event type */
+	unsigned char flags;		/**< event flags */
+	unsigned char tag;		/**< tag */
+	unsigned char queue;		/**< schedule queue */
+	snd_seq_timestamp_t time;	/**< schedule time */
+	snd_seq_addr_t source;		/**< source address */
+	snd_seq_addr_t dest;		/**< destination address */
+
+	union {
+		snd_seq_event_data_t data;	/**< (shared) legacy data */
+		unsigned int ump[4];		/**< UMP data bytes */
+	};
+} snd_seq_ump_event_t;
 
 /** \} */
 
diff --git a/include/seqmid.h b/include/seqmid.h
index 3986628a06f3..4089ac207861 100644
--- a/include/seqmid.h
+++ b/include/seqmid.h
@@ -284,6 +284,28 @@ extern "C" {
 	 (ev)->data.queue.queue = (q),\
 	 (ev)->data.queue.param.time.tick = (ttime))
 
+/**
+ * \brief set the event UMP flag
+ * \param ev event record
+ */
+static inline void snd_seq_ev_set_ump(snd_seq_ump_event_t *ev)
+{
+	ev->flags |= SND_SEQ_EVENT_UMP;
+	ev->type = 0; /* unused for UMP */
+}
+
+/**
+ * \brief set the event UMP flag and fill UMP raw bytes
+ * \param ev event record
+ * \param data UMP packet data
+ * \param bytes UMP packet size in bytes
+ */
+static inline void snd_seq_ev_set_ump_data(snd_seq_ump_event_t *ev, void *data, size_t bytes)
+{
+	snd_seq_ev_set_ump(ev);
+	memcpy(ev->ump, data, bytes);
+}
+
 /* set and send a queue control event */
 int snd_seq_control_queue(snd_seq_t *seq, int q, int type, int value, snd_seq_event_t *ev);
 
@@ -343,6 +365,8 @@ int snd_seq_disconnect_to(snd_seq_t *seq, int my_port, int dest_client, int dest
  */
 int snd_seq_set_client_name(snd_seq_t *seq, const char *name);
 int snd_seq_set_client_event_filter(snd_seq_t *seq, int event_type);
+int snd_seq_set_client_midi_version(snd_seq_t *seq, int midi_version);
+int snd_seq_set_client_ump_conversion(snd_seq_t *seq, int enable);
 int snd_seq_set_client_pool_output(snd_seq_t *seq, size_t size);
 int snd_seq_set_client_pool_output_room(snd_seq_t *seq, size_t size);
 int snd_seq_set_client_pool_input(snd_seq_t *seq, size_t size);
diff --git a/src/Versions.in b/src/Versions.in
index 2acf3d1889df..0c2837305039 100644
--- a/src/Versions.in
+++ b/src/Versions.in
@@ -156,4 +156,21 @@ ALSA_1.2.10 {
     @SYMBOL_PREFIX@snd_ctl_ump_next_device;
     @SYMBOL_PREFIX@snd_ctl_ump_endpoint_info;
     @SYMBOL_PREFIX@snd_ctl_ump_block_info;
+    @SYMBOL_PREFIX@snd_seq_ump_*;
+    @SYMBOL_PREFIX@snd_seq_client_info_get_midi_version;
+    @SYMBOL_PREFIX@snd_seq_seq_client_info_get_ump_group_enabled;
+    @SYMBOL_PREFIX@snd_seq_seq_client_get_ump_conversion;
+    @SYMBOL_PREFIX@snd_seq_client_info_set_midi_version;
+    @SYMBOL_PREFIX@snd_seq_seq_client_info_set_ump_group_enabled;
+    @SYMBOL_PREFIX@snd_seq_seq_client_set_ump_conversion;
+    @SYMBOL_PREFIX@snd_seq_get_ump_endpoint_info;
+    @SYMBOL_PREFIX@snd_seq_get_ump_block_info;
+    @SYMBOL_PREFIX@snd_seq_set_ump_endpoint_info;
+    @SYMBOL_PREFIX@snd_seq_set_ump_block_info;
+    @SYMBOL_PREFIX@snd_seq_port_info_get_direction;
+    @SYMBOL_PREFIX@snd_seq_port_info_get_ump_group;
+    @SYMBOL_PREFIX@snd_seq_port_info_set_direction;
+    @SYMBOL_PREFIX@snd_seq_port_info_set_ump_group;
+    @SYMBOL_PREFIX@snd_seq_set_client_midi_version;
+    @SYMBOL_PREFIX@snd_seq_set_client_ump_conversion;
 } ALSA_1.2.9;
diff --git a/src/seq/seq.c b/src/seq/seq.c
index f051426f9648..65ccaaed5896 100644
--- a/src/seq/seq.c
+++ b/src/seq/seq.c
@@ -1204,6 +1204,11 @@ size_t snd_seq_get_output_buffer_size(snd_seq_t *seq)
 	return seq->obufsize;
 }
 
+static inline size_t get_packet_size(snd_seq_t *seq)
+{
+	return seq->packet_size ? seq->packet_size : sizeof(snd_seq_event_t);
+}
+
 /**
  * \brief Return the size of input buffer
  * \param seq sequencer handle
@@ -1219,7 +1224,7 @@ size_t snd_seq_get_input_buffer_size(snd_seq_t *seq)
 	assert(seq);
 	if (!seq->ibuf)
 		return 0;
-	return seq->ibufsize * sizeof(snd_seq_event_t);
+	return seq->ibufsize * get_packet_size(seq);
 }
 
 /**
@@ -1261,13 +1266,17 @@ int snd_seq_set_output_buffer_size(snd_seq_t *seq, size_t size)
  */
 int snd_seq_set_input_buffer_size(snd_seq_t *seq, size_t size)
 {
+	size_t packet_size;
+
 	assert(seq && seq->ibuf);
-	assert(size >= sizeof(snd_seq_event_t));
+	assert(size >= packet_size);
 	snd_seq_drop_input(seq);
-	size = (size + sizeof(snd_seq_event_t) - 1) / sizeof(snd_seq_event_t);
+	packet_size = get_packet_size(seq);
+	size = (size + packet_size - 1) / packet_size;
 	if (size != seq->ibufsize) {
-		snd_seq_event_t *newbuf;
-		newbuf = calloc(sizeof(snd_seq_event_t), size);
+		char *newbuf;
+		/* use ump event size for avoiding reallocation at switching */
+		newbuf = calloc(sizeof(snd_seq_ump_event_t), size);
 		if (newbuf == NULL)
 			return -ENOMEM;
 		free(seq->ibuf);
@@ -1726,6 +1735,47 @@ int snd_seq_client_info_get_event_lost(const snd_seq_client_info_t *info)
 	return info->event_lost;
 }
 
+/**
+ * \brief Get the MIDI protocol version number of a client_info container
+ * \param info client_info container
+ * \return MIDI protocol version
+ *
+ * \sa snd_seq_get_client_info()
+ */
+int snd_seq_client_info_get_midi_version(const snd_seq_client_info_t *info)
+{
+	assert(info);
+	return info->midi_version;
+}
+
+/**
+ * \brief Get the UMP group filter status
+ * \param info client_info container
+ * \param group 0-based group index
+ * \return 0 if the group is filtered / disabled, 1 if it's processed
+ *
+ * \sa snd_seq_get_client_info()
+ */
+int snd_seq_client_info_get_ump_group_enabled(const snd_seq_client_info_t *info,
+					      int group)
+{
+	assert(info);
+	return !(info->group_filter & (1U << group));
+}
+
+/**
+ * \brief Get the automatic conversion mode for UMP
+ * \param info client_info container
+ * \return 1 if the conversion is enabled, 0 if not
+ *
+ * \sa snd_seq_get_client_info()
+ */
+int snd_seq_client_info_get_ump_conversion(const snd_seq_client_info_t *info)
+{
+	assert(info);
+	return info->midi_version;
+}
+
 /**
  * \brief Set the client id of a client_info container
  * \param info client_info container
@@ -1769,6 +1819,54 @@ void snd_seq_client_info_set_broadcast_filter(snd_seq_client_info_t *info, int v
 		info->filter &= ~SNDRV_SEQ_FILTER_BROADCAST;
 }
 
+/**
+ * \brief Set the MIDI protocol version of a client_info container
+ * \param info client_info container
+ * \param midi_version MIDI protocol version to set
+ *
+ * \sa snd_seq_get_client_info(), snd_seq_client_info_get_midi_version()
+ */
+void snd_seq_client_info_set_midi_version(snd_seq_client_info_t *info, int midi_version)
+{
+	assert(info);
+	info->midi_version = midi_version;
+}
+
+/**
+ * \brief Set the UMP group filter status
+ * \param info client_info container
+ * \param group 0-based group index
+ * \param enable 0 to filter/disable the group, non-zero to enable
+ *
+ * \sa snd_seq_set_client_info(), snd_seq_client_info_get_ump_group_enabled()
+ */
+void snd_seq_client_info_set_ump_group_enabled(snd_seq_client_info_t *info,
+					       int group, int enable)
+{
+	assert(info);
+	if (enable)
+		info->group_filter &= ~(1U << group);
+	else
+		info->group_filter |= (1U << group);
+}
+
+/**
+ * \brief Set the automatic conversion mode for UMP
+ * \param info client_info container
+ * \param enable 0 or 1 for disabling/enabling the conversion
+ *
+ * \sa snd_seq_set_client_info(), snd_seq_client_info_get_ump_conversion()
+ */
+void snd_seq_client_info_set_ump_conversion(snd_seq_client_info_t *info,
+					    int enable)
+{
+	assert(info);
+	if (enable)
+		info->filter &= ~SNDRV_SEQ_FILTER_NO_CONVERT;
+	else
+		info->filter |= SNDRV_SEQ_FILTER_NO_CONVERT;
+}
+
 /**
  * \brief Set the error-bounce usage of a client_info container
  * \param info client_info container
@@ -1887,6 +1985,65 @@ int snd_seq_query_next_client(snd_seq_t *seq, snd_seq_client_info_t *info)
 	return seq->ops->query_next_client(seq, info);
 }
 
+/**
+ * \brief Get UMP Endpoint information
+ * \param seq sequencer handle
+ * \param client client number to query
+ * \param info the pointer to store snd_ump_endpoint_info_t data
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_seq_get_ump_endpoint_info(snd_seq_t *seq, int client, void *info)
+{
+	assert(seq && info);
+	return seq->ops->get_ump_info(seq, client,
+				      SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT,
+				      info);
+}
+
+/**
+ * \brief Get UMP Block information
+ * \param seq sequencer handle
+ * \param client sequencer client number to query
+ * \param blk UMP block number (0-based) to query
+ * \param info the pointer to store snd_ump_block_info_t data
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_seq_get_ump_block_info(snd_seq_t *seq, int client, int blk, void *info)
+{
+	assert(seq && info);
+	return seq->ops->get_ump_info(seq, client,
+				      SNDRV_SEQ_CLIENT_UMP_INFO_BLOCK + blk,
+				      info);
+}
+
+/**
+ * \brief Set UMP Endpoint information to the current client
+ * \param seq sequencer handle
+ * \param info the pointer to send snd_ump_endpoint_info_t data
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_seq_set_ump_endpoint_info(snd_seq_t *seq, const void *info)
+{
+	assert(seq && info);
+	return seq->ops->set_ump_info(seq,
+				      SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT,
+				      info);
+}
+
+/**
+ * \brief Set UMP Block information to the current client
+ * \param seq sequencer handle
+ * \param blk UMP block number (0-based) to send
+ * \param info the pointer to send snd_ump_block_info_t data
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_seq_set_ump_block_info(snd_seq_t *seq, int blk, const void *info)
+{
+	assert(seq && info);
+	return seq->ops->set_ump_info(seq,
+				      SNDRV_SEQ_CLIENT_UMP_INFO_BLOCK + blk,
+				      info);
+}
 
 /*----------------------------------------------------------------*/
 
@@ -2134,6 +2291,32 @@ int snd_seq_port_info_get_timestamp_queue(const snd_seq_port_info_t *info)
 	return info->time_queue;
 }
 
+/**
+ * \brief Get the direction of the port
+ * \param info port_info container
+ * \return the direction of the port
+ *
+ * \sa snd_seq_get_port_info(), snd_seq_port_info_set_direction()
+ */
+int snd_seq_port_info_get_direction(const snd_seq_port_info_t *info)
+{
+	assert(info);
+	return info->direction;
+}
+
+/**
+ * \brief Get the UMP Group assigned to the port
+ * \param info port_info container
+ * \return 0 for no conversion, or the (1-based) UMP Group number assigned to the port
+ *
+ * \sa snd_seq_get_port_info(), snd_seq_port_info_set_ump_group()
+ */
+int snd_seq_port_info_get_ump_group(const snd_seq_port_info_t *info)
+{
+	assert(info);
+	return info->ump_group;
+}
+
 /**
  * \brief Set the client id of a port_info container
  * \param info port_info container
@@ -2312,6 +2495,31 @@ void snd_seq_port_info_set_timestamp_queue(snd_seq_port_info_t *info, int queue)
 	info->time_queue = queue;
 }
 
+/**
+ * \brief Set the direction of the port
+ * \param info port_info container
+ * \param direction the port direction
+ *
+ * \sa snd_seq_get_port_info(), snd_seq_port_info_get_direction()
+ */
+void snd_seq_port_info_set_direction(snd_seq_port_info_t *info, int direction)
+{
+	assert(info);
+	info->direction = direction;
+}
+
+/**
+ * \brief Set the UMP Group assigned to the port
+ * \param info port_info container
+ * \param ump_group 0 for no conversion, or the (1-based) UMP Group number
+ *
+ * \sa snd_seq_get_port_info(), snd_seq_port_info_get_ump_gruop()
+ */
+void snd_seq_port_info_set_ump_group(snd_seq_port_info_t *info, int ump_group)
+{
+	assert(info);
+	info->ump_group = ump_group;
+}
 
 /**
  * \brief create a sequencer port on the current client
@@ -3874,7 +4082,9 @@ ssize_t snd_seq_event_length(snd_seq_event_t *ev)
 {
 	ssize_t len = sizeof(snd_seq_event_t);
 	assert(ev);
-	if (snd_seq_ev_is_variable(ev))
+	if (snd_seq_ev_is_ump(ev))
+		len = sizeof(snd_seq_ump_event_t);
+	else if (snd_seq_ev_is_variable(ev))
 		len += ev->data.ext.len;
 	return len;
 }
@@ -3925,7 +4135,10 @@ int snd_seq_event_output(snd_seq_t *seq, snd_seq_event_t *ev)
  *
  * This function doesn't drain buffer unlike snd_seq_event_output().
  *
- * \sa snd_seq_event_output()
+ * \note
+ * For a UMP event, use snd_seq_ump_event_output_buffer() instead.
+ *
+ * \sa snd_seq_event_output(), snd_seq_ump_event_output_buffer()
  */
 int snd_seq_event_output_buffer(snd_seq_t *seq, snd_seq_event_t *ev)
 {
@@ -3938,12 +4151,15 @@ int snd_seq_event_output_buffer(snd_seq_t *seq, snd_seq_event_t *ev)
 		return -EINVAL;
 	if ((seq->obufsize - seq->obufused) < (size_t) len)
 		return -EAGAIN;
-	memcpy(seq->obuf + seq->obufused, ev, sizeof(snd_seq_event_t));
-	seq->obufused += sizeof(snd_seq_event_t);
-	if (snd_seq_ev_is_variable(ev)) {
-		memcpy(seq->obuf + seq->obufused, ev->data.ext.ptr, ev->data.ext.len);
-		seq->obufused += ev->data.ext.len;
+	if (snd_seq_ev_is_ump(ev)) {
+		memcpy(seq->obuf + seq->obufused, ev, sizeof(snd_seq_ump_event_t));
+	} else {
+		memcpy(seq->obuf + seq->obufused, ev, sizeof(snd_seq_event_t));
+		if (snd_seq_ev_is_variable(ev))
+			memcpy(seq->obuf + seq->obufused + sizeof(snd_seq_event_t),
+			       ev->data.ext.ptr, ev->data.ext.len);
 	}
+	seq->obufused += len;
 	return seq->obufused;
 }
 
@@ -3991,7 +4207,7 @@ int snd_seq_event_output_direct(snd_seq_t *seq, snd_seq_event_t *ev)
 	len = snd_seq_event_length(ev);
 	if (len < 0)
 		return len;
-	else if (len == sizeof(*ev)) {
+	if (snd_seq_ev_is_ump(ev) || !snd_seq_ev_is_variable(ev)) {
 		buf = ev;
 	} else {
 		if (alloc_tmpbuf(seq, (size_t)len) < 0)
@@ -4049,6 +4265,36 @@ int snd_seq_drain_output(snd_seq_t *seq)
 	return 0;
 }
 
+static int extract_output(snd_seq_t *seq, snd_seq_event_t **ev_res, int ump_allowed)
+{
+	size_t len, olen;
+	assert(seq);
+	if (ev_res)
+		*ev_res = NULL;
+ repeat:
+	if ((olen = seq->obufused) < sizeof(snd_seq_event_t))
+		return -ENOENT;
+	len = snd_seq_event_length((snd_seq_event_t *)seq->obuf);
+	if (olen < len)
+		return -ENOENT;
+	/* skip invalid UMP events */
+	if (snd_seq_ev_is_ump((snd_seq_event_t *)seq->obuf) && !ump_allowed) {
+		seq->obufused -= len;
+		memmove(seq->obuf, seq->obuf + len, seq->obufused);
+		goto repeat;
+	}
+	if (ev_res) {
+		/* extract the event */
+		if (alloc_tmpbuf(seq, len) < 0)
+			return -ENOMEM;
+		memcpy(seq->tmpbuf, seq->obuf, len);
+		*ev_res = (snd_seq_event_t *)seq->tmpbuf;
+	}
+	seq->obufused = olen - len;
+	memmove(seq->obuf, seq->obuf + len, seq->obufused);
+	return 0;
+}
+
 /**
  * \brief extract the first event in output buffer
  * \param seq sequencer handle
@@ -4062,25 +4308,7 @@ int snd_seq_drain_output(snd_seq_t *seq)
  */
 int snd_seq_extract_output(snd_seq_t *seq, snd_seq_event_t **ev_res)
 {
-	size_t len, olen;
-	snd_seq_event_t ev;
-	assert(seq);
-	if (ev_res)
-		*ev_res = NULL;
-	if ((olen = seq->obufused) < sizeof(snd_seq_event_t))
-		return -ENOENT;
-	memcpy(&ev, seq->obuf, sizeof(snd_seq_event_t));
-	len = snd_seq_event_length(&ev);
-	if (ev_res) {
-		/* extract the event */
-		if (alloc_tmpbuf(seq, len) < 0)
-			return -ENOMEM;
-		memcpy(seq->tmpbuf, seq->obuf, len);
-		*ev_res = seq->tmpbuf;
-	}
-	seq->obufused = olen - len;
-	memmove(seq->obuf, seq->obuf + len, seq->obufused);
-	return 0;
+	return extract_output(seq, ev_res, 0);
 }
 
 /*----------------------------------------------------------------*/
@@ -4094,32 +4322,35 @@ int snd_seq_extract_output(snd_seq_t *seq, snd_seq_event_t **ev_res)
  */
 static ssize_t snd_seq_event_read_buffer(snd_seq_t *seq)
 {
+	size_t packet_size = get_packet_size(seq);
 	ssize_t len;
-	len = (seq->ops->read)(seq, seq->ibuf, seq->ibufsize * sizeof(snd_seq_event_t));
+
+	len = (seq->ops->read)(seq, seq->ibuf, seq->ibufsize * packet_size);
 	if (len < 0)
 		return len;
-	seq->ibuflen = len / sizeof(snd_seq_event_t);
+	seq->ibuflen = len / packet_size;
 	seq->ibufptr = 0;
 	return seq->ibuflen;
 }
 
 static int snd_seq_event_retrieve_buffer(snd_seq_t *seq, snd_seq_event_t **retp)
 {
+	size_t packet_size = get_packet_size(seq);
 	size_t ncells;
 	snd_seq_event_t *ev;
 
-	*retp = ev = &seq->ibuf[seq->ibufptr];
+	*retp = ev = (snd_seq_event_t *)(seq->ibuf + seq->ibufptr * packet_size);
 	seq->ibufptr++;
 	seq->ibuflen--;
 	if (! snd_seq_ev_is_variable(ev))
 		return 1;
-	ncells = (ev->data.ext.len + sizeof(snd_seq_event_t) - 1) / sizeof(snd_seq_event_t);
+	ncells = (ev->data.ext.len + packet_size - 1) / packet_size;
 	if (seq->ibuflen < ncells) {
 		seq->ibuflen = 0; /* clear buffer */
 		*retp = NULL;
 		return -EINVAL;
 	}
-	ev->data.ext.ptr = ev + 1;
+	ev->data.ext.ptr = (char *)ev + packet_size;
 	seq->ibuflen -= ncells;
 	seq->ibufptr += ncells;
 	return 1;
@@ -4212,6 +4443,111 @@ int snd_seq_event_input_pending(snd_seq_t *seq, int fetch_sequencer)
 
 /*----------------------------------------------------------------*/
 
+/*
+ * I/O for UMP packets
+ */
+
+/**
+ * \brief output a UMP event
+ * \param seq sequencer handle
+ * \param ev UMP event to be output
+ * \return the number of remaining events or a negative error code
+ *
+ * Just like snd_seq_event_output(), it puts an event onto the buffer,
+ * draining the buffer automatically when needed, but the event is
+ * snd_seq_ump_event_t type instead snd_seq_event_t.
+ *
+ * Calling this function is allowed only when the client is set to
+ * \c SND_SEQ_CLIENT_UMP_MIDI_1_0 or \c SND_SEQ_CLIENT_UMP_MIDI_2_0.
+ *
+ * The flushing and clearing of the buffer is done via the same functions,
+ * snd_seq_event_drain_output() and snd_seq_drop_output().
+ *
+ * \sa snd_seq_event_output()
+ */
+int snd_seq_ump_event_output(snd_seq_t *seq, snd_seq_ump_event_t *ev)
+{
+	if (!seq->midi_version)
+		return -EBADFD;
+	return snd_seq_event_output(seq, (snd_seq_event_t *)ev);
+}
+
+/**
+ * \brief output an event onto the lib buffer without draining buffer
+ * \param seq sequencer handle
+ * \param ev UMP event to be output
+ * \return the byte size of remaining events. \c -EAGAIN if the buffer becomes full.
+ *
+ * This is a UMP event version of snd_seq_event_output_buffer().
+ *
+ * \sa snd_seq_event_output_buffer(), snd_seq_ump_event_output()
+ */
+int snd_seq_ump_event_output_buffer(snd_seq_t *seq, snd_seq_ump_event_t *ev)
+{
+	if (!seq->midi_version)
+		return -EBADFD;
+	return snd_seq_event_output_buffer(seq, (snd_seq_event_t *)ev);
+}
+
+/**
+ * \brief extract the first UMP event in output buffer
+ * \param seq sequencer handle
+ * \param ev_res UMP event pointer to be extracted
+ * \return 0 on success otherwise a negative error code
+ *
+ * This is a UMP event version of snd_seq_extract_output().
+ *
+ * \sa snd_seq_extract_output(), snd_seq_ump_event_output()
+ */
+int snd_seq_ump_extract_output(snd_seq_t *seq, snd_seq_ump_event_t **ev_res)
+{
+	if (!seq->midi_version)
+		return -EBADFD;
+	return extract_output(seq, (snd_seq_event_t **)ev_res, 1);
+}
+
+/**
+ * \brief output a UMP event directly to the sequencer NOT through output buffer
+ * \param seq sequencer handle
+ * \param ev UMP event to be output
+ * \return the byte size sent to sequencer or a negative error code
+ *
+ * This is a UMP event version of snd_seq_event_output_direct().
+ *
+ * \sa snd_seq_event_output_direct()
+ */
+int snd_seq_ump_event_output_direct(snd_seq_t *seq, snd_seq_ump_event_t *ev)
+{
+	if (!seq->midi_version)
+		return -EBADFD;
+	return snd_seq_event_output_direct(seq, (snd_seq_event_t *)ev);
+}
+
+/**
+ * \brief retrieve a UMP event from sequencer
+ * \param seq sequencer handle
+ * \param ev UMP event pointer to be stored
+ *
+ * Like snd_seq_event_input(), this reads out the input event, but in
+ * snd_seq_ump_event_t type instead of snd_seq_event_t type.
+ *
+ * Calling this function is allowed only when the client is set to
+ * \c SND_SEQ_CLIENT_UMP_MIDI_1_0 or \c SND_SEQ_CLIENT_UMP_MIDI_2_0.
+ *
+ * For other input operations, the same function like
+ * snd_seq_event_input_pending() or snd_seq_drop_input() can be still used.
+ *
+ * \sa snd_seq_event_input()
+ */
+int snd_seq_ump_event_input(snd_seq_t *seq, snd_seq_ump_event_t **ev)
+{
+	if (!seq->midi_version)
+		return -EBADFD;
+	return snd_seq_event_input(seq, (snd_seq_event_t **)ev);
+}
+
+/*----------------------------------------------------------------*/
+
 /*
  * clear event buffers
  */
diff --git a/src/seq/seq_hw.c b/src/seq/seq_hw.c
index e4b4d2a02a0d..196de970f6f3 100644
--- a/src/seq/seq_hw.c
+++ b/src/seq/seq_hw.c
@@ -94,6 +94,20 @@ static int snd_seq_hw_system_info(snd_seq_t *seq, snd_seq_system_info_t * info)
 	return 0;
 }
 
+static void update_midi_version(snd_seq_t *seq, snd_seq_client_info_t *info)
+{
+	snd_seq_hw_t *hw = seq->private_data;
+
+	if (SNDRV_PROTOCOL_VERSION(1, 0, 3) <= hw->version &&
+	    seq->midi_version != (int)info->midi_version) {
+		seq->midi_version = info->midi_version;
+		if (info->midi_version > 0)
+			seq->packet_size = sizeof(snd_seq_ump_event_t);
+		else
+			seq->packet_size = sizeof(snd_seq_event_t);
+	}
+}
+
 static int snd_seq_hw_get_client_info(snd_seq_t *seq, snd_seq_client_info_t * info)
 {
 	snd_seq_hw_t *hw = seq->private_data;
@@ -105,16 +119,64 @@ static int snd_seq_hw_get_client_info(snd_seq_t *seq, snd_seq_client_info_t * in
 		info->card = -1;
 		info->pid = -1;
 	}
+	update_midi_version(seq, info);
 	return 0;
 }
 
 static int snd_seq_hw_set_client_info(snd_seq_t *seq, snd_seq_client_info_t * info)
 {
 	snd_seq_hw_t *hw = seq->private_data;
+
 	if (ioctl(hw->fd, SNDRV_SEQ_IOCTL_SET_CLIENT_INFO, info) < 0) {
 		/*SYSERR("SNDRV_SEQ_IOCTL_SET_CLIENT_INFO failed");*/
 		return -errno;
 	}
+	update_midi_version(seq, info);
+	return 0;
+}
+
+static int snd_seq_hw_get_ump_info(snd_seq_t *seq, int client, int type, void *info)
+{
+	snd_seq_hw_t *hw = seq->private_data;
+	struct snd_seq_client_ump_info buf;
+	size_t size;
+
+	if (type < 0 || type >= SNDRV_SEQ_CLIENT_UMP_INFO_BLOCK + 32)
+		return -EINVAL;
+	if (hw->version < SNDRV_PROTOCOL_VERSION(1, 0, 3))
+		return -ENOTTY;
+	if (type == SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT)
+		size = sizeof(struct snd_ump_endpoint_info);
+	else
+		size = sizeof(struct snd_ump_block_info);
+	buf.client = client;
+	buf.type = type;
+	if (ioctl(hw->fd, SNDRV_SEQ_IOCTL_GET_CLIENT_UMP_INFO, &buf) < 0)
+		return -errno;
+	memcpy(info, buf.info, size);
+	return 0;
+}
+
+static int snd_seq_hw_set_ump_info(snd_seq_t *seq, int type, const void *info)
+{
+	snd_seq_hw_t *hw = seq->private_data;
+	struct snd_seq_client_ump_info buf;
+	size_t size;
+
+	if (type < 0 || type >= SNDRV_SEQ_CLIENT_UMP_INFO_BLOCK + 32)
+		return -EINVAL;
+	if (hw->version < SNDRV_PROTOCOL_VERSION(1, 0, 3))
+		return -ENOTTY;
+	if (type == SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT)
+		size = sizeof(struct snd_ump_endpoint_info);
+	else
+		size = sizeof(struct snd_ump_block_info);
+	buf.client = seq->client;
+	buf.type = type;
+	memcpy(buf.info, info, size);
+	*(int *)buf.info = -1; /* invalidate the card number */
+	if (ioctl(hw->fd, SNDRV_SEQ_IOCTL_SET_CLIENT_UMP_INFO, &buf) < 0)
+		return -errno;
 	return 0;
 }
 
@@ -396,6 +458,8 @@ static const snd_seq_ops_t snd_seq_hw_ops = {
 	.system_info = snd_seq_hw_system_info,
 	.get_client_info = snd_seq_hw_get_client_info,
 	.set_client_info = snd_seq_hw_set_client_info,
+	.get_ump_info = snd_seq_hw_get_ump_info,
+	.set_ump_info = snd_seq_hw_set_ump_info,
 	.create_port = snd_seq_hw_create_port,
 	.delete_port = snd_seq_hw_delete_port,
 	.get_port_info = snd_seq_hw_get_port_info,
@@ -476,6 +540,11 @@ int snd_seq_hw_open(snd_seq_t **handle, const char *name, int streams, int mode)
 		close(fd);
 		return -SND_ERROR_INCOMPATIBLE_VERSION;
 	}
+	if (SNDRV_PROTOCOL_VERSION(1, 0, 3) <= ver) {
+		/* inform the protocol version we're supporting */
+		unsigned int user_ver = SNDRV_SEQ_VERSION;
+		ioctl(fd, SNDRV_SEQ_IOCTL_USER_PVERSION, &user_ver);
+	}
 	hw = calloc(1, sizeof(snd_seq_hw_t));
 	if (hw == NULL) {
 		close(fd);
@@ -500,7 +569,7 @@ int snd_seq_hw_open(snd_seq_t **handle, const char *name, int streams, int mode)
 		}
 	}
 	if (streams & SND_SEQ_OPEN_INPUT) {
-		seq->ibuf = (snd_seq_event_t *) calloc(sizeof(snd_seq_event_t), seq->ibufsize = SND_SEQ_IBUF_SIZE);
+		seq->ibuf = (char *) calloc(sizeof(snd_seq_ump_event_t), seq->ibufsize = SND_SEQ_IBUF_SIZE);
 		if (!seq->ibuf) {
 			free(seq->obuf);
 			free(hw);
@@ -519,6 +588,7 @@ int snd_seq_hw_open(snd_seq_t **handle, const char *name, int streams, int mode)
 	seq->poll_fd = fd;
 	seq->ops = &snd_seq_hw_ops;
 	seq->private_data = hw;
+	seq->packet_size = sizeof(snd_seq_event_t);
 	client = snd_seq_hw_client_id(seq);
 	if (client < 0) {
 		snd_seq_close(seq);
diff --git a/src/seq/seq_local.h b/src/seq/seq_local.h
index f97a5200397a..9b4a65459d3d 100644
--- a/src/seq/seq_local.h
+++ b/src/seq/seq_local.h
@@ -41,6 +41,8 @@ typedef struct {
 	int (*system_info)(snd_seq_t *seq, snd_seq_system_info_t * info);
 	int (*get_client_info)(snd_seq_t *seq, snd_seq_client_info_t * info);
 	int (*set_client_info)(snd_seq_t *seq, snd_seq_client_info_t * info);
+	int (*get_ump_info)(snd_seq_t *seq, int client, int type, void *info);
+	int (*set_ump_info)(snd_seq_t *seq, int type, const void *info);
 	int (*create_port)(snd_seq_t *seq, snd_seq_port_info_t * port);
 	int (*delete_port)(snd_seq_t *seq, snd_seq_port_info_t * port);
 	int (*get_port_info)(snd_seq_t *seq, snd_seq_port_info_t * info);
@@ -84,12 +86,14 @@ struct _snd_seq {
 	char *obuf;		/* output buffer */
 	size_t obufsize;		/* output buffer size */
 	size_t obufused;		/* output buffer used size */
-	snd_seq_event_t *ibuf;	/* input buffer */
+	char *ibuf;		/* input buffer */
 	size_t ibufptr;		/* current pointer of input buffer */
 	size_t ibuflen;		/* queued length */
 	size_t ibufsize;		/* input buffer size */
 	snd_seq_event_t *tmpbuf;	/* temporary event for extracted event */
 	size_t tmpbufsize;		/* size of errbuf */
+	size_t packet_size;		/* input packet alignment size */
+	int midi_version;	/* current protocol version */
 };
 
 int snd_seq_hw_open(snd_seq_t **handle, const char *name, int streams, int mode);
diff --git a/src/seq/seqmid.c b/src/seq/seqmid.c
index 75061a577ef3..55651f3896f3 100644
--- a/src/seq/seqmid.c
+++ b/src/seq/seqmid.c
@@ -255,6 +255,44 @@ int snd_seq_set_client_event_filter(snd_seq_t *seq, int event_type)
 	return snd_seq_set_client_info(seq, &info);
 }
 
+/**
+ * \brief set client MIDI protocol version
+ * \param seq sequencer handle
+ * \param midi_version MIDI protocol version to set
+ * \return 0 on success or negative error code
+ *
+ * \sa snd_seq_set_client_info()
+ */
+int snd_seq_set_client_midi_version(snd_seq_t *seq, int midi_version)
+{
+	snd_seq_client_info_t info;
+	int err;
+
+	if ((err = snd_seq_get_client_info(seq, &info)) < 0)
+		return err;
+	snd_seq_client_info_set_midi_version(&info, midi_version);
+	return snd_seq_set_client_info(seq, &info);
+}
+
+/**
+ * \brief enable/disable client's automatic conversion of UMP/legacy events
+ * \param seq sequencer handle
+ * \param enable 0 or 1 to disable/enable the conversion
+ * \return 0 on success or negative error code
+ *
+ * \sa snd_seq_set_client_info()
+ */
+int snd_seq_set_client_ump_conversion(snd_seq_t *seq, int enable)
+{
+	snd_seq_client_info_t info;
+	int err;
+
+	if ((err = snd_seq_get_client_info(seq, &info)) < 0)
+		return err;
+	snd_seq_client_info_set_ump_conversion(&info, enable);
+	return snd_seq_set_client_info(seq, &info);
+}
+
 /**
  * \brief change the output pool size of the given client
  * \param seq sequencer handle
-- 
2.35.3

