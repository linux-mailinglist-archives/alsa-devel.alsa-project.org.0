Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68D92918E
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2024 09:44:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7603F14DC;
	Sat,  6 Jul 2024 09:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7603F14DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720251859;
	bh=SzliDqhUVfcdlIHtp8+uiwc+mTtahTjOBIFst5jG0xU=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z3jT2b1Z6Uvwl/cxXFxzh3PMzRb2wA7x4aMadoNk6EBT1S4fupDr0a/ALWW3TahAf
	 4knqR9BrJFYQ/VvUj5UPLTyLIYH+kqo8z79AuDBxuSDRvsMUin+2lCE359glD5P5So
	 o/Kk5xfWphlc7vOpedvv2mFZaYTSUJTYSeUEn6BM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74E87F805B0; Sat,  6 Jul 2024 09:43:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC4EEF805B1;
	Sat,  6 Jul 2024 09:43:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A320DF8025E; Sat,  6 Jul 2024 09:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13ECBF800FE
	for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2024 09:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13ECBF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VnyUlLY6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nkh7Syg8;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=rw4LhhrK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=aYCDcXGA
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ECBB31F809;
	Sat,  6 Jul 2024 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=rjegfdrkvxm7VmHodpIKCIdnMQGsBmzcO6AUv6P3RHM=;
	b=VnyUlLY6M0hY0vY2PpXWNQhQaQzbW38qlAKVLcqqovVhKhL8NuauIeqVhI640yP1kqeROZ
	kxAsKVkB+r+9ShVfTKCz6AdOOVEOl+KrXPfzFbEu/ycu8thBk70duk5272/I/YWwflKcGr
	Hm7np1kPobaN+YhPboVb6BIaj5n2YRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=rjegfdrkvxm7VmHodpIKCIdnMQGsBmzcO6AUv6P3RHM=;
	b=nkh7Syg8IFI6jA0F38Xccm6uFiOj4a3sA/YWouWxuiux4o6/6AStbTlQj8gckhr4jG/lCX
	mMPdVj7wrAvdOPDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=rjegfdrkvxm7VmHodpIKCIdnMQGsBmzcO6AUv6P3RHM=;
	b=rw4LhhrKtn9fs6AWRvXkcd7zC4re1Nj+MCnONPcqVVWdS9Sh11+7vpegJ+3qikHajNrdT2
	WR+YpG9qiUM8f85pxPK5ikfJQjzolCD0F0VekdoZsxbJFCMYRnPXI3uZcFtC9CzhR1qoi2
	zZZ+4XvAm5OYpIIX7Tn8p3sT66nrVOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=rjegfdrkvxm7VmHodpIKCIdnMQGsBmzcO6AUv6P3RHM=;
	b=aYCDcXGA2cLNfAdR2Zj34UJbh5TEdja51JqqkfQvFg+bx+fcB1z717/CGLKN4bTTGsr8WY
	Fq2h0G2tAxs+q/Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD6F912FF6;
	Sat,  6 Jul 2024 07:40:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HWtxMOD0iGbgDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jul 2024 07:40:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] seq: Add API functions to set different tempo base
 values
Date: Sat,  6 Jul 2024 09:40:31 +0200
Message-ID: <20240706074032.6256-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: RMAIRRGRUSLQNTKH3BTUD2DSEO3LOZXW
X-Message-ID-Hash: RMAIRRGRUSLQNTKH3BTUD2DSEO3LOZXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RMAIRRGRUSLQNTKH3BTUD2DSEO3LOZXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MIDI2 Set Tempo message uses 10ns-based values, and we need to update
the API to change the base time unit.

This patch adds a few new API functions:
- snd_seq_has_queue_tempo_base() returns 1 if the client supports a
  new tempo-base value; if 0, it's an old system and application has
  to use the tempo in the fixed 1us unit
- the tempo base can be changed with
  snd_seq_queue_tempo_set_tempo_base(), provided in nsec unit;
  the value has to be either 10 or 1000 (or 0 as default, equivalent
  with 1000)

The protocol version is checked and fallback to the fixed 1us base for
the old clients.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/seq.h                   |  3 ++
 include/sound/uapi/asequencer.h |  7 ++--
 src/Versions.in.in              |  3 ++
 src/seq/seq.c                   | 58 +++++++++++++++++++++++++++++++++
 src/seq/seq_hw.c                |  5 +++
 src/seq/seq_local.h             |  1 +
 6 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/include/seq.h b/include/seq.h
index e55f5c16fada..3bad5dd9762c 100644
--- a/include/seq.h
+++ b/include/seq.h
@@ -506,13 +506,16 @@ unsigned int snd_seq_queue_tempo_get_tempo(const snd_seq_queue_tempo_t *info);
 int snd_seq_queue_tempo_get_ppq(const snd_seq_queue_tempo_t *info);
 unsigned int snd_seq_queue_tempo_get_skew(const snd_seq_queue_tempo_t *info);
 unsigned int snd_seq_queue_tempo_get_skew_base(const snd_seq_queue_tempo_t *info);
+unsigned int snd_seq_queue_tempo_get_tempo_base(const snd_seq_queue_tempo_t *info);
 void snd_seq_queue_tempo_set_tempo(snd_seq_queue_tempo_t *info, unsigned int tempo);
 void snd_seq_queue_tempo_set_ppq(snd_seq_queue_tempo_t *info, int ppq);
 void snd_seq_queue_tempo_set_skew(snd_seq_queue_tempo_t *info, unsigned int skew);
 void snd_seq_queue_tempo_set_skew_base(snd_seq_queue_tempo_t *info, unsigned int base);
+void snd_seq_queue_tempo_set_tempo_base(snd_seq_queue_tempo_t *info, unsigned int tempo_base);
 
 int snd_seq_get_queue_tempo(snd_seq_t *handle, int q, snd_seq_queue_tempo_t *tempo);
 int snd_seq_set_queue_tempo(snd_seq_t *handle, int q, snd_seq_queue_tempo_t *tempo);
+int snd_seq_has_queue_tempo_base(snd_seq_t *handle);
 
 /*
  */
diff --git a/include/sound/uapi/asequencer.h b/include/sound/uapi/asequencer.h
index b913f31daa2d..923dfdddfc76 100644
--- a/include/sound/uapi/asequencer.h
+++ b/include/sound/uapi/asequencer.h
@@ -26,7 +26,7 @@
 #include <sound/asound.h>
 
 /** version of the sequencer */
-#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 3)
+#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 4)
 
 /**
  * definition of sequencer event types
@@ -539,11 +539,12 @@ struct snd_seq_queue_status {
 /* queue tempo */
 struct snd_seq_queue_tempo {
 	int queue;			/* sequencer queue */
-	unsigned int tempo;		/* current tempo, us/tick */
+	unsigned int tempo;		/* current tempo, us/tick (or different time-base below) */
 	int ppq;			/* time resolution, ticks/quarter */
 	unsigned int skew_value;	/* queue skew */
 	unsigned int skew_base;		/* queue skew base */
-	char reserved[24];		/* for the future */
+	unsigned short tempo_base;	/* tempo base in nsec unit; either 10 or 1000 */
+	char reserved[22];		/* for the future */
 };
 
 
diff --git a/src/Versions.in.in b/src/Versions.in.in
index 1c40d461dce4..90849277c983 100644
--- a/src/Versions.in.in
+++ b/src/Versions.in.in
@@ -206,6 +206,9 @@ ALSA_1.2.13 {
 #ifdef HAVE_SEQ_SYMS
     @SYMBOL_PREFIX@snd_seq_create_ump_endpoint;
     @SYMBOL_PREFIX@snd_seq_create_ump_block;
+    @SYMBOL_PREFIX@snd_seq_queue_tempo_get_tempo_base;
+    @SYMBOL_PREFIX@snd_seq_queue_tempo_set_tempo_base;
+    @SYMBOL_PREFIX@snd_seq_has_tempo_base;
 #endif
 #ifdef HAVE_RAWMIDI_SYMS
     @SYMBOL_PREFIX@snd_ump_endpoint_info_clear;
diff --git a/src/seq/seq.c b/src/seq/seq.c
index a18f67e2632e..d0ecedf0838f 100644
--- a/src/seq/seq.c
+++ b/src/seq/seq.c
@@ -490,6 +490,21 @@ the buffer is flushed by #snd_seq_drain_output() call.
 You can schedule the event in a certain queue so that the tempo
 change happens at the scheduled time, too.
 
+The tempo is set as default in microsecond unit as defined for
+Standard MIDI Format 1.  But since the value in MIDI2 Set Tempo message
+is based on 10-nanosecand unit, sequencer queue also allows to set up
+in 10-nanosecond unit.  For that, change the tempo-base value in
+#snd_seq_queue_tempo_t to 10 via #snd_seq_queue_tempo_set_tempo_base()
+along with the 10-nanobased tempo value.  The default tempo base is 1000,
+i.e. 1 microsecond.
+Currently the API supports only either 0, 10 or 1000 as the tempo-base
+(where 0 is treated as 1000).
+
+The older kernel might not support the different tempo-base, and setting a
+different value from 1000 would fail.  The application may heck the
+availability of tempo-base change via #snd_seq_has_tempo_base() function
+beforehand, and re-calculate in microsecond unit as fallback.
+
 \subsection seq_ev_start Starting and stopping a queue
 
 To start, stop, or continue a queue, you need to send a queue-control
@@ -3878,6 +3893,19 @@ unsigned int snd_seq_queue_tempo_get_skew_base(const snd_seq_queue_tempo_t *info
 	return info->skew_base;
 }
 
+/**
+ * \brief Get the tempo base of a queue_status container
+ * \param info queue_status container
+ * \return tempo base time in nsec unit
+ *
+ * \sa snd_seq_get_queue_tempo()
+ */
+unsigned int snd_seq_queue_tempo_get_tempo_base(const snd_seq_queue_tempo_t *info)
+{
+	assert(info);
+	return info->tempo_base;
+}
+
 /**
  * \brief Set the tempo of a queue_status container
  * \param info queue_status container
@@ -3933,6 +3961,21 @@ void snd_seq_queue_tempo_set_skew_base(snd_seq_queue_tempo_t *info, unsigned int
 	info->skew_base = base;
 }
 
+/**
+ * \brief Set the tempo base of a queue_status container
+ * \param info queue_status container
+ * \param tempo_base tempo base time in nsec unit
+ *
+ * \sa snd_seq_get_queue_tempo()
+ */
+void snd_seq_queue_tempo_set_tempo_base(snd_seq_queue_tempo_t *info, unsigned int tempo_base)
+{
+	assert(info);
+	if (!tempo_base)
+		tempo_base = 1000;
+	info->tempo_base = tempo_base;
+}
+
 /**
  * \brief obtain the current tempo of the queue
  * \param seq sequencer handle
@@ -3962,10 +4005,25 @@ int snd_seq_get_queue_tempo(snd_seq_t *seq, int q, snd_seq_queue_tempo_t * tempo
 int snd_seq_set_queue_tempo(snd_seq_t *seq, int q, snd_seq_queue_tempo_t * tempo)
 {
 	assert(seq && tempo);
+	if (!seq->has_queue_tempo_base &&
+	    tempo->tempo_base && tempo->tempo_base != 1000)
+		return -EINVAL;
 	tempo->queue = q;
 	return seq->ops->set_queue_tempo(seq, tempo);
 }
 
+/**
+ * \brief inquiry the support of tempo base change
+ * \param seq sequencer handle
+ * \return 1 if the client supports the tempo base change, 0 if not
+ *
+ * \sa snd_seq_get_queue_tempo()
+ */
+int snd_seq_has_queue_tempo_base(snd_seq_t *seq)
+{
+	assert(seq);
+	return seq->has_queue_tempo_base;
+}
 
 /*----------------------------------------------------------------*/
 
diff --git a/src/seq/seq_hw.c b/src/seq/seq_hw.c
index eeaf26e16d1c..e88a7b22b052 100644
--- a/src/seq/seq_hw.c
+++ b/src/seq/seq_hw.c
@@ -275,12 +275,15 @@ static int snd_seq_hw_get_queue_tempo(snd_seq_t *seq, snd_seq_queue_tempo_t * te
 		/*SYSERR("SNDRV_SEQ_IOCTL_GET_QUEUE_TEMPO failed");*/
 		return -errno;
 	}
+	if (!seq->has_queue_tempo_base)
+		tempo->tempo_base = 1000;
 	return 0;
 }
 
 static int snd_seq_hw_set_queue_tempo(snd_seq_t *seq, snd_seq_queue_tempo_t * tempo)
 {
 	snd_seq_hw_t *hw = seq->private_data;
+
 	if (ioctl(hw->fd, SNDRV_SEQ_IOCTL_SET_QUEUE_TEMPO, tempo) < 0) {
 		/*SYSERR("SNDRV_SEQ_IOCTL_SET_QUEUE_TEMPO failed");*/
 		return -errno;
@@ -587,6 +590,8 @@ int snd_seq_hw_open(snd_seq_t **handle, const char *name, int streams, int mode)
 	seq->ops = &snd_seq_hw_ops;
 	seq->private_data = hw;
 	seq->packet_size = sizeof(snd_seq_event_t);
+	seq->has_queue_tempo_base = ver >= SNDRV_PROTOCOL_VERSION(1, 0, 4);
+
 	client = snd_seq_hw_client_id(seq);
 	if (client < 0) {
 		snd_seq_close(seq);
diff --git a/src/seq/seq_local.h b/src/seq/seq_local.h
index 263029702739..00a7615afeae 100644
--- a/src/seq/seq_local.h
+++ b/src/seq/seq_local.h
@@ -94,6 +94,7 @@ struct _snd_seq {
 	size_t tmpbufsize;		/* size of errbuf */
 	size_t packet_size;		/* input packet alignment size */
 	int midi_version;	/* current protocol version */
+	int has_queue_tempo_base;	/* support queue tempo-base? */
 
 	unsigned int num_ump_groups;		/* number of UMP groups */
 	snd_ump_endpoint_info_t *ump_ep;	/* optional UMP info */
-- 
2.43.0

