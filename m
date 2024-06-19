Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECA090F230
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 17:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72401950;
	Wed, 19 Jun 2024 17:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72401950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718811062;
	bh=+Tz9A/ZCsR9L9zmEoJNGjGAaVvT1UNYXgMY56tm2Y2I=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hlG8+Uz62Ci5RvQddxpS0xqbjPW68Lc5jkI8PTBvkE4ozXZTkEz/qVxZWDWDQqZTa
	 fAFPZQPV/uQcq0vAYBGaZdNhB8MitLT+rDXeSua9wQ8f76SAcM3OklgtSErnltaQy+
	 kn7hZozTeIJkfVx8dsWEtlNo2PKGtKG4++9L5usU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1490AF805B5; Wed, 19 Jun 2024 17:30:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF70F805AA;
	Wed, 19 Jun 2024 17:30:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE0CF80588; Wed, 19 Jun 2024 17:30:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3E4FF80266
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 17:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3E4FF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=a1/LD71e;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MwhgTArz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=a1/LD71e;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MwhgTArz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2B88C1F7EE;
	Wed, 19 Jun 2024 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9I/c1ZI31pmZ4KPMqsSha0SUJWt5dXbyY3vnhz6+08=;
	b=a1/LD71ej7iHS+8kFNiQx6J+8Ky17a98h5DgQ5U2nJOzhN6syItavfJqQjqdBPQuMNeaM5
	9KZPn7HWhFdZhCb5yTAvy/5zbTESncmP2/XyBm7Yq8nxhxaHDD2yvnHBN3N3KRr9Z71A1Q
	yU74iKoRO1sPoeEcPb4Cayvp8TPTRSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9I/c1ZI31pmZ4KPMqsSha0SUJWt5dXbyY3vnhz6+08=;
	b=MwhgTArzr6bD1SoIZI7oVvyTdu3EHYoFAnQwcYLK4BlQYwvrZz1dWywK5hIRQ3kxP4SUAg
	2/oSMF5lIAX2vPDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="a1/LD71e";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MwhgTArz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9I/c1ZI31pmZ4KPMqsSha0SUJWt5dXbyY3vnhz6+08=;
	b=a1/LD71ej7iHS+8kFNiQx6J+8Ky17a98h5DgQ5U2nJOzhN6syItavfJqQjqdBPQuMNeaM5
	9KZPn7HWhFdZhCb5yTAvy/5zbTESncmP2/XyBm7Yq8nxhxaHDD2yvnHBN3N3KRr9Z71A1Q
	yU74iKoRO1sPoeEcPb4Cayvp8TPTRSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9I/c1ZI31pmZ4KPMqsSha0SUJWt5dXbyY3vnhz6+08=;
	b=MwhgTArzr6bD1SoIZI7oVvyTdu3EHYoFAnQwcYLK4BlQYwvrZz1dWywK5hIRQ3kxP4SUAg
	2/oSMF5lIAX2vPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 121F413668;
	Wed, 19 Jun 2024 15:28:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yBxFAx/5cmYRJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Jun 2024 15:28:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 2/4] seq: Add API helper functions for creating UMP
 Endpoint and Blocks
Date: Wed, 19 Jun 2024 17:28:51 +0200
Message-ID: <20240619152855.6809-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619152855.6809-1-tiwai@suse.de>
References: <20240619152855.6809-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2B88C1F7EE
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: C7ULBAOOGDDY4KPY3D4K77VMHMS3D34O
X-Message-ID-Hash: C7ULBAOOGDDY4KPY3D4K77VMHMS3D34O
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7ULBAOOGDDY4KPY3D4K77VMHMS3D34O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For making it easer for applications to create a virtual UMP Endpoint
and UMP blocks, add two API helper functions.

snd_seq_create_ump_endpoint() creates (unsurprisingly) a UMP Endpoint,
based on the given snd_ump_endpoint_info_t information.  The number of
(max) UMP groups belonging to this Endpoint has to be specified.
This function sets up the Endpoint info on the sequencer client, and
creates a MIDI 2.0 UMP port as well as UMP Group ports automatically.
The name of the sequencer client is updated from the Endpoint name,
too.

After creating a UMP Endpoint, create each UMP Block via
snd_seq_create_ump_block() function with a snd_ump_block_info_t info.
The associated groups for each block have to be specified there.
The port names and capability bits are updated accordingly after
setting each block information.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/seqmid.h    |   7 ++
 include/ump.h       |   6 ++
 src/seq/seq.c       |   6 +-
 src/seq/seq_local.h |   4 +
 src/seq/seqmid.c    | 249 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 271 insertions(+), 1 deletion(-)

diff --git a/include/seqmid.h b/include/seqmid.h
index 4464c2d3af0b..bf968a5b2c7b 100644
--- a/include/seqmid.h
+++ b/include/seqmid.h
@@ -520,6 +520,13 @@ int snd_seq_reset_pool_input(snd_seq_t *seq);
 	((ev)->type = SND_SEQ_EVENT_SYSEX,\
 	 snd_seq_ev_set_variable(ev, datalen, dataptr))
 
+/* Helper API functions for UMP endpoint and block creations */
+int snd_seq_create_ump_endpoint(snd_seq_t *seq,
+				const snd_ump_endpoint_info_t *info,
+				unsigned int num_groups);
+int snd_seq_create_ump_block(snd_seq_t *seq, int blkid,
+			     const snd_ump_block_info_t *info);
+
 /** \} */
 
 #ifdef __cplusplus
diff --git a/include/ump.h b/include/ump.h
index 45b3ad270db7..01363a329fa7 100644
--- a/include/ump.h
+++ b/include/ump.h
@@ -69,6 +69,9 @@ enum _snd_ump_direction {
 /** Bit flag for JRTS in Receive */
 #define SND_UMP_EP_INFO_PROTO_JRTS_RX		0x0002
 
+/** Default version passed to UMP Endpoint info */
+#define SND_UMP_EP_INFO_DEFAULT_VERSION		0x0101
+
 size_t snd_ump_endpoint_info_sizeof(void);
 /** \hideinitializer
  * \brief allocate an invalid #snd_ump_endpoint_info_t using standard alloca
@@ -125,6 +128,9 @@ enum _snd_ump_block_ui_hint {
 	SND_UMP_BLOCK_UI_HINT_BOTH =		0x03,
 };
 
+/** Default MIDI CI version passed to UMP Block info */
+#define SND_UMP_BLOCK_INFO_DEFAULT_MIDI_CI_VERSION	0x01
+
 size_t snd_ump_block_info_sizeof(void);
 /** \hideinitializer
  * \brief allocate an invalid #snd_ump_block_info_t using standard alloca
diff --git a/src/seq/seq.c b/src/seq/seq.c
index 5eac4848b9c7..ff0468140177 100644
--- a/src/seq/seq.c
+++ b/src/seq/seq.c
@@ -1042,7 +1042,8 @@ int _snd_seq_open_lconf(snd_seq_t **seqp, const char *name,
  */
 int snd_seq_close(snd_seq_t *seq)
 {
-	int err;
+	int i, err;
+
 	assert(seq);
 	err = seq->ops->close(seq);
 	if (seq->dl_handle)
@@ -1051,6 +1052,9 @@ int snd_seq_close(snd_seq_t *seq)
 	free(seq->ibuf);
 	free(seq->tmpbuf);
 	free(seq->name);
+	free(seq->ump_ep);
+	for (i = 0; i < 16; i++)
+		free(seq->ump_blks[i]);
 	free(seq);
 	return err;
 }
diff --git a/src/seq/seq_local.h b/src/seq/seq_local.h
index 468248062638..263029702739 100644
--- a/src/seq/seq_local.h
+++ b/src/seq/seq_local.h
@@ -94,6 +94,10 @@ struct _snd_seq {
 	size_t tmpbufsize;		/* size of errbuf */
 	size_t packet_size;		/* input packet alignment size */
 	int midi_version;	/* current protocol version */
+
+	unsigned int num_ump_groups;		/* number of UMP groups */
+	snd_ump_endpoint_info_t *ump_ep;	/* optional UMP info */
+	snd_ump_block_info_t *ump_blks[16];	/* optional UMP block info */
 };
 
 int snd_seq_hw_open(snd_seq_t **handle, const char *name, int streams, int mode);
diff --git a/src/seq/seqmid.c b/src/seq/seqmid.c
index 9ec93ee8ade1..d7eac6cafa0e 100644
--- a/src/seq/seqmid.c
+++ b/src/seq/seqmid.c
@@ -493,3 +493,252 @@ int snd_seq_parse_address(snd_seq_t *seq, snd_seq_addr_t *addr, const char *arg)
 	return 0;
 }
 
+/**
+ * \brief create a UMP Endpoint for the given sequencer client
+ * \param seq sequencer handle
+ * \param info UMP Endpoint information to initialize
+ * \param num_groups max number of groups in the endpoint
+ * \return 0 on success or negative error code
+ *
+ * This function initializes the sequencer client to the corresponding
+ * MIDI 2.0 mode (either MIDI 1.0 or MIDI 2.0 protocol) depending on the
+ * given snd_ump_endpoint_info_t info.
+ *
+ * This function should be called right after opening a sequencer client.
+ * The client name is updated from the UMP Endpoint name, and a primary
+ * MIDI 2.0 UMP port and each UMP Group port are created.
+ * The application should pass each UMP block info via succeeding
+ * snd_seq_create_ump_block() call.
+ */
+int snd_seq_create_ump_endpoint(snd_seq_t *seq,
+				const snd_ump_endpoint_info_t *info,
+				unsigned int num_groups)
+{
+	int err, version;
+	unsigned int i;
+	snd_seq_port_info_t *pinfo;
+
+	if (seq->ump_ep)
+		return -EBUSY;
+
+	if (num_groups < 1 || num_groups > SND_UMP_MAX_GROUPS)
+		return -EINVAL;
+
+	if (!(info->protocol_caps & info->protocol)) {
+		SNDERR("Inconsistent UMP protocol_caps and protocol\n");
+		return -EINVAL;
+	}
+
+	if (info->protocol & SND_UMP_EP_INFO_PROTO_MIDI2) {
+		version = SND_SEQ_CLIENT_UMP_MIDI_2_0;
+	} else if (info->protocol & SND_UMP_EP_INFO_PROTO_MIDI1) {
+		version = SND_SEQ_CLIENT_UMP_MIDI_1_0;
+	} else {
+		SNDERR("Invalid UMP protocol set 0x%x\n", info->protocol);
+		return -EINVAL;
+	}
+
+	err = snd_seq_set_client_midi_version(seq, version);
+	if (err < 0) {
+		SNDERR("Failed to set to MIDI protocol 0x%x\n", version);
+		return err;
+	}
+
+	seq->ump_ep = malloc(sizeof(*info));
+	if (!seq->ump_ep)
+		return -ENOMEM;
+
+	*seq->ump_ep = *info;
+	if (!seq->ump_ep->version)
+		seq->ump_ep->version = SND_UMP_EP_INFO_DEFAULT_VERSION;
+
+	if (info->name) {
+		err = snd_seq_set_client_name(seq, (const char *)info->name);
+		if (err < 0)
+			goto error_free;
+	}
+
+	err = snd_seq_set_ump_endpoint_info(seq, seq->ump_ep);
+	if (err < 0) {
+		SNDERR("Failed to set UMP EP info\n");
+		goto error_free;
+	}
+
+	snd_seq_port_info_alloca(&pinfo);
+
+	snd_seq_port_info_set_port(pinfo, 0);
+	snd_seq_port_info_set_port_specified(pinfo, 1);
+	snd_seq_port_info_set_name(pinfo, "MIDI 2.0");
+	snd_seq_port_info_set_capability(pinfo,
+					 SNDRV_SEQ_PORT_CAP_READ |
+					 SNDRV_SEQ_PORT_CAP_SYNC_READ |
+					 SNDRV_SEQ_PORT_CAP_SUBS_READ |
+					 SNDRV_SEQ_PORT_CAP_WRITE |
+					 SNDRV_SEQ_PORT_CAP_SYNC_WRITE |
+					 SNDRV_SEQ_PORT_CAP_SUBS_WRITE |
+					 SNDRV_SEQ_PORT_CAP_DUPLEX);
+	snd_seq_port_info_set_type(pinfo,
+				   SND_SEQ_PORT_TYPE_MIDI_GENERIC |
+				   SNDRV_SEQ_PORT_TYPE_MIDI_UMP |
+				   SND_SEQ_PORT_TYPE_APPLICATION |
+				   SNDRV_SEQ_PORT_TYPE_PORT);
+	snd_seq_port_info_set_ump_group(pinfo,
+					SND_SEQ_PORT_TYPE_MIDI_GENERIC |
+				   SNDRV_SEQ_PORT_TYPE_MIDI_UMP |
+				   SND_SEQ_PORT_TYPE_APPLICATION |
+				   SNDRV_SEQ_PORT_TYPE_PORT);
+	err = snd_seq_create_port(seq, pinfo);
+	if (err < 0) {
+		SNDERR("Failed to create MIDI 2.0 port\n");
+		goto error_free;
+	}
+
+	for (i = 0; i < num_groups; i++) {
+		char name[32];
+
+		snd_seq_port_info_set_port(pinfo, i + 1);
+		snd_seq_port_info_set_port_specified(pinfo, 1);
+		sprintf(name, "Group %d", i + 1);
+		snd_seq_port_info_set_capability(pinfo, 0); /* set later */
+		snd_seq_port_info_set_name(pinfo, name);
+		snd_seq_port_info_set_ump_group(pinfo, i + 1);
+		err = snd_seq_create_port(seq, pinfo);
+		if (err < 0) {
+			SNDERR("Failed to create Group port %d\n", i + 1);
+			goto error;
+		}
+	}
+
+	seq->num_ump_groups = num_groups;
+	return 0;
+
+ error:
+	/* delete all ports including port 0 */
+	for (i = 0; i <= num_groups; i++)
+		snd_seq_delete_port(seq, i);
+ error_free:
+	free(seq->ump_ep);
+	seq->ump_ep = NULL;
+	return err;
+}
+
+/* update each port name and capability from the block list */
+static void update_group_ports(snd_seq_t *seq, snd_ump_endpoint_info_t *ep)
+{
+	unsigned int i, b;
+	snd_seq_port_info_t *pinfo;
+	snd_ump_block_info_t *bp;
+
+	snd_seq_port_info_alloca(&pinfo);
+
+	for (i = 0; i < seq->num_ump_groups; i++) {
+		char blknames[64];
+		char name[64];
+		unsigned int caps = 0;
+
+		blknames[0] = 0;
+		for (b = 0; b < ep->num_blocks; b++) {
+			bp = seq->ump_blks[b];
+			if (!bp)
+				continue;
+			if (i < bp->first_group ||
+			    i >= bp->first_group + bp->num_groups)
+				continue;
+			switch (bp->direction) {
+			case SNDRV_UMP_DIR_INPUT:
+				caps |= SNDRV_SEQ_PORT_CAP_READ |
+					SNDRV_SEQ_PORT_CAP_SYNC_READ |
+					SNDRV_SEQ_PORT_CAP_SUBS_READ;
+				break;
+			case SNDRV_UMP_DIR_OUTPUT:
+				caps |= SNDRV_SEQ_PORT_CAP_WRITE |
+					SNDRV_SEQ_PORT_CAP_SYNC_WRITE |
+					SNDRV_SEQ_PORT_CAP_SUBS_WRITE;
+				break;
+			case SNDRV_UMP_DIR_BIDIRECTION:
+				caps |= SNDRV_SEQ_PORT_CAP_READ |
+					SNDRV_SEQ_PORT_CAP_SYNC_READ |
+					SNDRV_SEQ_PORT_CAP_SUBS_READ |
+					SNDRV_SEQ_PORT_CAP_WRITE |
+					SNDRV_SEQ_PORT_CAP_SYNC_WRITE |
+					SNDRV_SEQ_PORT_CAP_SUBS_WRITE |
+					SNDRV_SEQ_PORT_CAP_DUPLEX;
+				break;
+			}
+
+			if (!*bp->name)
+				continue;
+			if (*blknames) {
+				strlcat(blknames, ", ", sizeof(blknames));
+				strlcat(blknames, (const char *)bp->name,
+					sizeof(blknames));
+			} else {
+				snd_strlcpy(blknames, (const char *)bp->name,
+					    sizeof(blknames));
+			}
+		}
+
+		if (!*blknames)
+			continue;
+
+		snprintf(name, sizeof(name), "Group %d (%s)", i + 1, blknames);
+		if (snd_seq_get_port_info(seq, i + 1, pinfo) < 0)
+			continue;
+
+		if (strcmp(name, snd_seq_port_info_get_name(pinfo)) ||
+		    snd_seq_port_info_get_capability(pinfo) != caps) {
+			snd_seq_port_info_set_name(pinfo, name);
+			snd_seq_port_info_set_capability(pinfo, caps);
+			snd_seq_set_port_info(seq, i + 1, pinfo);
+		}
+	}
+}
+
+/**
+ * \brief create a UMP block for the given sequencer client
+ * \param seq sequencer handle
+ * \param blkid 0-based block id
+ * \param info UMP block info to initialize
+ * \return 0 on success or negative error code
+ *
+ * This function sets up the UMP block info of the given block id.
+ * The sequencer port name is updated accordingly with the associated
+ * block name automatically.
+ */
+int snd_seq_create_ump_block(snd_seq_t *seq, int blkid,
+			     const snd_ump_block_info_t *info)
+{
+	snd_ump_block_info_t *bp;
+	snd_ump_endpoint_info_t *ep = seq->ump_ep;
+	int err;
+
+	if (!ep)
+		return -EINVAL;
+	if (info->first_group >= seq->num_ump_groups ||
+	    info->first_group + info->num_groups > seq->num_ump_groups)
+		return -EINVAL;
+	if (blkid < 0 || blkid >= (int)ep->num_blocks)
+		return -EINVAL;
+
+	if (seq->ump_blks[blkid])
+		return -EBUSY;
+	seq->ump_blks[blkid] = bp = malloc(sizeof(*info));
+	if (!bp)
+		return -ENOMEM;
+	*bp = *info;
+
+	if (!bp->midi_ci_version)
+		bp->midi_ci_version = SND_UMP_BLOCK_INFO_DEFAULT_MIDI_CI_VERSION;
+	bp->active = 1;
+
+	err = snd_seq_set_ump_block_info(seq, blkid, bp);
+	if (err < 0) {
+		SNDERR("Failed to set UMP EP info\n");
+		free(bp);
+		seq->ump_blks[blkid] = NULL;
+		return err;
+	}
+
+	update_group_ports(seq, ep);
+	return 0;
+}
-- 
2.43.0

