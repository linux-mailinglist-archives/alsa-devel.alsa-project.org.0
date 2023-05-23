Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D3170DC90
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 14:27:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98B80868;
	Tue, 23 May 2023 14:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98B80868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684844821;
	bh=Tz6803L9pIC3IxU30R6mXDfsK1qqjOe1uUr/Lbp146o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FxDsz7XchfRAlZR3/LnBaHke6aLziIJtMwScYJbLd+Ow7++Ey+Cy1IGRYLkeQrC+9
	 D04+t8kKZoh41mylUu/WC3jS/px0ND2vTsdvmKvl3FvLrXEYp/EibwKgEm+l48MVgV
	 /zCNvVHDR/BviOms0WyGdEYjCB8ztdUSNAQPKPbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 335EAF805F0; Tue, 23 May 2023 14:24:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9067CF8055B;
	Tue, 23 May 2023 14:24:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06A67F805ED; Tue, 23 May 2023 14:24:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FEB3F80425
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 14:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FEB3F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eoZq8i2c;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=07/L+pZt
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8382F22A35;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684844574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9HgxvfeavMjqkHgkUNMfnskdHOXkbIZcGQDNUUCbTU=;
	b=eoZq8i2cy3ckHW+yPp4HopJdfw1TTlBk8iGi//TZyKQ+czwiCRgyVRorMwgnPrqfzWVNdG
	NsrqvOk7d126MxdXM0MtwWzeFPEN6+PAxtRPQlHV8Jno4AkxG7vS1uJ6YWVgH9W7IumohA
	FdlMPVDzDfiNGLZIXRiMxT62Fxd7gCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684844574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9HgxvfeavMjqkHgkUNMfnskdHOXkbIZcGQDNUUCbTU=;
	b=07/L+pZtHtUrUhnHhtqOIUK1tIMuQifqsvQB+oKoDnh9jn6sb4YW/THvXw+hQz6t6QpA59
	d8G+RpIP0gGd5ACQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FC9F13588;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qI+wEh6wbGQNKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 12:22:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 04/10] ump: Add initial support
Date: Tue, 23 May 2023 14:22:41 +0200
Message-Id: <20230523122247.11744-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523122247.11744-1-tiwai@suse.de>
References: <20230523122247.11744-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3RH7X7Y5UAYJFIENN25FVL5XA53B7G5P
X-Message-ID-Hash: 3RH7X7Y5UAYJFIENN25FVL5XA53B7G5P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RH7X7Y5UAYJFIENN25FVL5XA53B7G5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds the initial support for UMP rawmidi access.
It's merely the wrapper for the standard rawmidi to access to the UMP
rawmidi device.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 configure.ac                |   1 +
 include/Makefile.am         |   2 +-
 include/rawmidi.h           |   3 +
 include/ump.h               | 119 +++++++
 src/Versions.in             |   6 +
 src/rawmidi/Makefile.am     |   5 +-
 src/rawmidi/rawmidi_hw.c    |  10 +-
 src/rawmidi/rawmidi_local.h |   2 +
 src/rawmidi/ump.c           | 616 ++++++++++++++++++++++++++++++++++++
 src/rawmidi/ump_local.h     |   9 +
 10 files changed, 769 insertions(+), 4 deletions(-)
 create mode 100644 include/ump.h
 create mode 100644 src/rawmidi/ump.c
 create mode 100644 src/rawmidi/ump_local.h

diff --git a/configure.ac b/configure.ac
index b6266651b9d6..0588eec34f81 100644
--- a/configure.ac
+++ b/configure.ac
@@ -795,6 +795,7 @@ cat >> include/asoundlib.h <<EOF
 EOF
 test "$build_pcm" = "yes" && echo "#include <alsa/pcm.h>" >> include/asoundlib.h
 test "$build_rawmidi" = "yes" && echo "#include <alsa/rawmidi.h>" >> include/asoundlib.h
+test "$build_rawmidi" = "yes" && echo "#include <alsa/ump.h>" >> include/asoundlib.h
 test "$build_pcm" = "yes" && echo "#include <alsa/timer.h>" >> include/asoundlib.h
 test "$build_hwdep" = "yes" && echo "#include <alsa/hwdep.h>" >> include/asoundlib.h
 echo "#include <alsa/control.h>" >> include/asoundlib.h
diff --git a/include/Makefile.am b/include/Makefile.am
index 9909fb73c7d6..b7f67b250810 100644
--- a/include/Makefile.am
+++ b/include/Makefile.am
@@ -34,7 +34,7 @@ endif
 endif
 
 if BUILD_RAWMIDI
-alsainclude_HEADERS += rawmidi.h
+alsainclude_HEADERS += rawmidi.h ump.h
 endif
 
 if BUILD_HWDEP
diff --git a/include/rawmidi.h b/include/rawmidi.h
index 716810536a2e..2630d1e67572 100644
--- a/include/rawmidi.h
+++ b/include/rawmidi.h
@@ -93,6 +93,9 @@ typedef enum _snd_rawmidi_read_mode {
 	SND_RAWMIDI_READ_TSTAMP = 1,
 } snd_rawmidi_read_mode_t;
 
+/** rawmidi info bit flags */
+#define SND_RAWMIDI_INFO_UMP			0x00000008	/* rawmidi is UMP */
+
 int snd_rawmidi_open(snd_rawmidi_t **in_rmidi, snd_rawmidi_t **out_rmidi,
 		     const char *name, int mode);
 int snd_rawmidi_open_lconf(snd_rawmidi_t **in_rmidi, snd_rawmidi_t **out_rmidi,
diff --git a/include/ump.h b/include/ump.h
new file mode 100644
index 000000000000..c79b2335aeff
--- /dev/null
+++ b/include/ump.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: LGPL-2.1+ */
+/**
+ * \file include/ump.h
+ * \brief API library for ALSA rawmidi/UMP interface
+ *
+ * API library for ALSA rawmidi/UMP interface
+ */
+
+#ifndef __ALSA_UMP_H
+#define __ALSA_UMP_H
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/** UMP (Endpoint) RawMIDI device */
+typedef struct _snd_ump snd_ump_t;
+/** UMP Endpoint information container */
+typedef struct snd_ump_endpoint_info snd_ump_endpoint_info_t;
+/** UMP Block information container */
+typedef struct snd_ump_block_info snd_ump_block_info_t;
+
+int snd_ump_open(snd_ump_t **inputp, snd_ump_t **outputp, const char *name, int mode);
+int snd_ump_close(snd_ump_t *ump);
+snd_rawmidi_t *snd_ump_rawmidi(snd_ump_t *ump);
+const char *snd_ump_name(snd_ump_t *ump);
+int snd_ump_poll_descriptors_count(snd_ump_t *ump);
+int snd_ump_poll_descriptors(snd_ump_t *ump, struct pollfd *pfds, unsigned int space);
+int snd_ump_poll_descriptors_revents(snd_ump_t *ump, struct pollfd *pfds, unsigned int nfds, unsigned short *revents);
+int snd_ump_nonblock(snd_ump_t *ump, int nonblock);
+int snd_ump_rawmidi_info(snd_ump_t *ump, snd_rawmidi_info_t *info);
+int snd_ump_rawmidi_params(snd_ump_t *ump, snd_rawmidi_params_t *params);
+int snd_ump_rawmidi_params_current(snd_ump_t *ump, snd_rawmidi_params_t *params);
+int snd_ump_rawmidi_status(snd_ump_t *ump, snd_rawmidi_status_t *status);
+int snd_ump_drop(snd_ump_t *ump);
+int snd_ump_drain(snd_ump_t *ump);
+ssize_t snd_ump_write(snd_ump_t *ump, const void *buffer, size_t size);
+ssize_t snd_ump_read(snd_ump_t *ump, void *buffer, size_t size);
+ssize_t snd_ump_tread(snd_ump_t *ump, struct timespec *tstamp, void *buffer, size_t size);
+
+/** Max number of UMP Groups */
+#define SND_UMP_MAX_GROUPS		16
+/** Max number of UMP Blocks */
+#define SND_UMP_MAX_BLOCKS		32
+
+/** UMP direction */
+enum _snd_ump_direction {
+	/** Input only */
+	SND_UMP_DIR_INPUT =		0x01,
+	/** Output only */
+	SND_UMP_DIR_OUTPUT =		0x02,
+	/** Bidirectional */
+	SND_UMP_DIR_BIDIRECTION	=	0x03,
+};
+
+/** Bitmask for UMP EP MIDI protocols */
+#define SND_UMP_EP_INFO_PROTO_MIDI_MASK		0x0300
+/** Bit flag for MIDI 1.0 protocol */
+#define SND_UMP_EP_INFO_PROTO_MIDI1		0x0100
+/** Bit flag for MIDI 2.0 protocol */
+#define SND_UMP_EP_INFO_PROTO_MIDI2		0x0200
+/** Bitmask for UMP Jitter-reduction timestamp */
+#define SND_UMP_EP_INFO_PROTO_JRTS_MASK		0x0003
+/** Bit flag for JRTS in Transmit */
+#define SND_UMP_EP_INFO_PROTO_JRTS_TX		0x0001
+/** Bit flag for JRTS in Receive */
+#define SND_UMP_EP_INFO_PROTO_JRTS_RX		0x0002
+
+size_t snd_ump_endpoint_info_sizeof(void);
+/** \hideinitializer
+ * \brief allocate an invalid #snd_ump_endpoint_info_t using standard alloca
+ * \param ptr returned pointer
+ */
+#define snd_ump_endpoint_info_alloca(ptr) __snd_alloca(ptr, snd_ump_endpoint_info)
+int snd_ump_endpoint_info_malloc(snd_ump_endpoint_info_t **info);
+void snd_ump_endpoint_info_free(snd_ump_endpoint_info_t *info);
+void snd_ump_endpoint_info_copy(snd_ump_endpoint_info_t *dst, const snd_ump_endpoint_info_t *src);
+int snd_ump_endpoint_info_get_card(const snd_ump_endpoint_info_t *info);
+int snd_ump_endpoint_info_get_device(const snd_ump_endpoint_info_t *info);
+unsigned int snd_ump_endpoint_info_get_flags(const snd_ump_endpoint_info_t *info);
+unsigned int snd_ump_endpoint_info_get_protocol_caps(const snd_ump_endpoint_info_t *info);
+unsigned int snd_ump_endpoint_info_get_protocol(const snd_ump_endpoint_info_t *info);
+unsigned int snd_ump_endpoint_info_get_num_blocks(const snd_ump_endpoint_info_t *info);
+unsigned int snd_ump_endpoint_info_get_version(const snd_ump_endpoint_info_t *info);
+const char *snd_ump_endpoint_info_get_name(const snd_ump_endpoint_info_t *info);
+const char *snd_ump_endpoint_info_get_product_id(const snd_ump_endpoint_info_t *info);
+int snd_ump_endpoint_info(snd_ump_t *ump, snd_ump_endpoint_info_t *info);
+
+/** Bit flag for MIDI 1.0 port w/o restrict in UMP Block info flags */
+#define SND_UMP_BLOCK_IS_MIDI1		(1U << 0)
+/** Bit flag for 31.25Kbps B/W MIDI1 port in UMP Block info flags */
+#define SND_UMP_BLOCK_IS_LOWSPEED	(1U << 1)
+
+size_t snd_ump_block_info_sizeof(void);
+/** \hideinitializer
+ * \brief allocate an invalid #snd_ump_block_info_t using standard alloca
+ * \param ptr returned pointer
+ */
+#define snd_ump_block_info_alloca(ptr) __snd_alloca(ptr, snd_ump_block_info)
+int snd_ump_block_info_malloc(snd_ump_block_info_t **info);
+void snd_ump_block_info_free(snd_ump_block_info_t *info);
+void snd_ump_block_info_copy(snd_ump_block_info_t *dst, const snd_ump_block_info_t *src);
+int snd_ump_block_info_get_card(const snd_ump_block_info_t *info);
+int snd_ump_block_info_get_device(const snd_ump_block_info_t *info);
+unsigned int snd_ump_block_info_get_block_id(const snd_ump_block_info_t *info);
+void snd_ump_block_info_set_block_id(snd_ump_block_info_t *info, unsigned int id);
+unsigned int snd_ump_block_info_get_active(const snd_ump_block_info_t *info);
+unsigned int snd_ump_block_info_get_flags(const snd_ump_block_info_t *info);
+unsigned int snd_ump_block_info_get_direction(const snd_ump_block_info_t *info);
+unsigned int snd_ump_block_info_get_first_group(const snd_ump_block_info_t *info);
+unsigned int snd_ump_block_info_get_num_groups(const snd_ump_block_info_t *info);
+const char *snd_ump_block_info_get_name(const snd_ump_block_info_t *info);
+int snd_ump_block_info(snd_ump_t *ump, snd_ump_block_info_t *info);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* __ALSA_UMP_H */
diff --git a/src/Versions.in b/src/Versions.in
index ed7376811d62..3315fa2840e0 100644
--- a/src/Versions.in
+++ b/src/Versions.in
@@ -148,3 +148,9 @@ ALSA_1.2.9 {
     @SYMBOL_PREFIX@snd_pcm_hw_params_set_drain_silence;
     @SYMBOL_PREFIX@snd_pcm_hw_params_get_drain_silence;
 } ALSA_1.2.6;
+
+ALSA_1.2.10 {
+  global:
+
+    @SYMBOL_PREFIX@snd_ump_*;
+} ALSA_1.2.9;
diff --git a/src/rawmidi/Makefile.am b/src/rawmidi/Makefile.am
index 41858a1fb07e..269186597335 100644
--- a/src/rawmidi/Makefile.am
+++ b/src/rawmidi/Makefile.am
@@ -1,10 +1,11 @@
 EXTRA_LTLIBRARIES=librawmidi.la
 
-librawmidi_la_SOURCES = rawmidi.c rawmidi_hw.c rawmidi_symbols.c
+librawmidi_la_SOURCES = rawmidi.c rawmidi_hw.c rawmidi_symbols.c \
+	ump.c
 if BUILD_SEQ
 librawmidi_la_SOURCES += rawmidi_virt.c
 endif
-noinst_HEADERS = rawmidi_local.h
+noinst_HEADERS = rawmidi_local.h ump_local.h
 
 all: librawmidi.la
 
diff --git a/src/rawmidi/rawmidi_hw.c b/src/rawmidi/rawmidi_hw.c
index 69e5e02f1d6a..3119db9d7490 100644
--- a/src/rawmidi/rawmidi_hw.c
+++ b/src/rawmidi/rawmidi_hw.c
@@ -35,6 +35,7 @@ const char *_snd_module_rawmidi_hw = "";
 #endif
 
 #define SNDRV_FILE_RAWMIDI		ALSA_DEVICE_DIRECTORY "midiC%iD%i"
+#define SNDRV_FILE_UMP_RAWMIDI		ALSA_DEVICE_DIRECTORY "umpC%iD%i"
 #define SNDRV_RAWMIDI_VERSION_MAX	SNDRV_PROTOCOL_VERSION(2, 0, 0)
 
 #ifndef DOC_HIDDEN
@@ -321,8 +322,12 @@ int snd_rawmidi_hw_open(snd_rawmidi_t **inputp, snd_rawmidi_t **outputp,
 	snd_rawmidi_t *rmidi;
 	snd_rawmidi_hw_t *hw = NULL;
 	snd_rawmidi_info_t info;
+	int is_ump;
 	int fmode;
 
+	is_ump = !!(mode & _SND_RAWMIDI_OPEN_UMP);
+	mode &= ~_SND_RAWMIDI_OPEN_UMP;
+
 	if (inputp)
 		*inputp = NULL;
 	if (outputp)
@@ -332,7 +337,10 @@ int snd_rawmidi_hw_open(snd_rawmidi_t **inputp, snd_rawmidi_t **outputp,
 	
 	if ((ret = snd_ctl_hw_open(&ctl, NULL, card, 0)) < 0)
 		return ret;
-	sprintf(filename, SNDRV_FILE_RAWMIDI, card, device);
+	if (is_ump)
+		sprintf(filename, SNDRV_FILE_UMP_RAWMIDI, card, device);
+	else
+		sprintf(filename, SNDRV_FILE_RAWMIDI, card, device);
 
       __again:
       	if (attempt++ > 3) {
diff --git a/src/rawmidi/rawmidi_local.h b/src/rawmidi/rawmidi_local.h
index 7025542f6774..19dbf72584fa 100644
--- a/src/rawmidi/rawmidi_local.h
+++ b/src/rawmidi/rawmidi_local.h
@@ -67,3 +67,5 @@ int snd_rawmidi_virtual_open(snd_rawmidi_t **inputp, snd_rawmidi_t **outputp,
 
 int _snd_rawmidi_ump_endpoint_info(snd_rawmidi_t *rmidi, void *info);
 int _snd_rawmidi_ump_block_info(snd_rawmidi_t *rmidi, void *info);
+
+#define _SND_RAWMIDI_OPEN_UMP	(1U << 16)	/* internal open mode bit */
diff --git a/src/rawmidi/ump.c b/src/rawmidi/ump.c
new file mode 100644
index 000000000000..5da79459f618
--- /dev/null
+++ b/src/rawmidi/ump.c
@@ -0,0 +1,616 @@
+/* SPDX-License-Identifier: LGPL-2.1+ */
+/**
+ * \file rawmidi/ump.c
+ * \brief Universal MIDI Protocol (UMP) Interface
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <limits.h>
+#include "local.h"
+#include "rawmidi_local.h"
+#include "ump_local.h"
+
+static int get_rawmidi_flags(snd_ump_t *ump)
+{
+	snd_rawmidi_info_t info;
+	int err;
+
+	err = snd_rawmidi_info(ump->rawmidi, &info);
+	if (err < 0)
+		return err;
+	if (!(info.flags & SNDRV_RAWMIDI_INFO_UMP))
+		return -EINVAL;
+	ump->flags = info.flags;
+	return 0;
+}
+
+/**
+ * \brief Opens a new connection to the UMP interface.
+ * \param inputp Returned input handle (NULL if not wanted)
+ * \param outputp Returned output handle (NULL if not wanted)
+ * \param name ASCII identifier of the UMP handle
+ * \param mode Open mode
+ * \return 0 on success otherwise a negative error code
+ *
+ * Opens a new connection to the UMP interface specified with
+ * an ASCII identifier and mode.
+ */
+int snd_ump_open(snd_ump_t **inputp, snd_ump_t **outputp, const char *name,
+		 int mode)
+{
+	snd_ump_t *input = NULL, *output = NULL;
+	int err;
+
+	if (inputp)
+		*inputp = NULL;
+	if (outputp)
+		*outputp = NULL;
+	if (!inputp && !outputp)
+		return -EINVAL;
+
+	err = -ENOMEM;
+	if (inputp) {
+		input = calloc(1, sizeof(*input));
+		if (!input)
+			goto error;
+		input->is_input = 1;
+	}
+	if (outputp) {
+		output = calloc(1, sizeof(*output));
+		if (!output)
+			goto error;
+	}
+
+	err = snd_rawmidi_open(input ? &input->rawmidi : NULL,
+			       output ? &output->rawmidi : NULL,
+			       name, mode | _SND_RAWMIDI_OPEN_UMP);
+	if (err < 0)
+		goto error;
+
+	if (input) {
+		err = get_rawmidi_flags(input);
+		if (err < 0)
+			goto error;
+	}
+	if (output) {
+		err = get_rawmidi_flags(output);
+		if (err < 0)
+			goto error;
+	}
+
+	if (inputp)
+		*inputp = input;
+	if (outputp)
+		*outputp = output;
+
+	return 0;
+
+ error:
+	if (input) {
+		if (input->rawmidi)
+			snd_rawmidi_close(input->rawmidi);
+		free(input);
+	}
+	if (output) {
+		if (output->rawmidi)
+			snd_rawmidi_close(output->rawmidi);
+		free(output);
+	}
+	return err;
+}
+
+/**
+ * \brief close UMP handle
+ * \param ump UMP handle
+ * \return 0 on success otherwise a negative error code
+ *
+ * Closes the specified UMP handle and frees all associated
+ * resources.
+ */
+int snd_ump_close(snd_ump_t *ump)
+{
+	int err;
+
+	err = snd_rawmidi_close(ump->rawmidi);
+	free(ump);
+	return err;
+}
+
+/**
+ * \brief get RawMidi instance associated with the UMP handle
+ * \param ump UMP handle
+ * \return the associated RawMidi handle
+ *
+ * Returns the associated RawMidi instance with the given UMP handle
+ */
+snd_rawmidi_t *snd_ump_rawmidi(snd_ump_t *ump)
+{
+	return ump->rawmidi;
+}
+
+/**
+ * \brief get identifier of UMP handle
+ * \param ump UMP handle
+ * \return ascii identifier of UMP handle
+ *
+ * Returns the ASCII identifier of given UMP handle. It's the same
+ * identifier specified in snd_ump_open().
+ */
+const char *snd_ump_name(snd_ump_t *ump)
+{
+	return snd_rawmidi_name(ump->rawmidi);
+}
+
+/**
+ * \brief get count of poll descriptors for UMP handle
+ * \param ump UMP handle
+ * \return count of poll descriptors
+ */
+int snd_ump_poll_descriptors_count(snd_ump_t *ump)
+{
+	return snd_rawmidi_poll_descriptors_count(ump->rawmidi);
+}
+
+/**
+ * \brief get poll descriptors
+ * \param ump UMP handle
+ * \param pfds array of poll descriptors
+ * \param space space in the poll descriptor array
+ * \return count of filled descriptors
+ */
+int snd_ump_poll_descriptors(snd_ump_t *ump, struct pollfd *pfds,
+			     unsigned int space)
+{
+	return snd_rawmidi_poll_descriptors(ump->rawmidi, pfds, space);
+}
+
+/**
+ * \brief get returned events from poll descriptors
+ * \param ump UMP handle
+ * \param pfds array of poll descriptors
+ * \param nfds count of poll descriptors
+ * \param revents returned events
+ * \return zero if success, otherwise a negative error code
+ */
+int snd_ump_poll_descriptors_revents(snd_ump_t *ump, struct pollfd *pfds,
+				     unsigned int nfds, unsigned short *revents)
+{
+	return snd_rawmidi_poll_descriptors_revents(ump->rawmidi, pfds, nfds,
+						    revents);
+}
+
+/**
+ * \brief set nonblock mode
+ * \param ump UMP handle
+ * \param nonblock 0 = block, 1 = nonblock mode
+ * \return 0 on success otherwise a negative error code
+ *
+ * The nonblock mode cannot be used when the stream is in
+ * #SND_RAWMIDI_APPEND state.
+ */
+int snd_ump_nonblock(snd_ump_t *ump, int nonblock)
+{
+	return snd_rawmidi_nonblock(ump->rawmidi, nonblock);
+}
+
+/**
+ * \brief get information about associated RawMidi handle
+ * \param ump UMP handle
+ * \param info pointer to a snd_rawmidi_info_t structure to be filled
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_ump_rawmidi_info(snd_ump_t *ump, snd_rawmidi_info_t *info)
+{
+	return snd_rawmidi_info(ump->rawmidi, info);
+}
+
+/**
+ * \brief set parameters about associated RawMidi stream
+ * \param ump UMP handle
+ * \param params pointer to a snd_rawmidi_params_t structure to be filled
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_ump_rawmidi_params(snd_ump_t *ump, snd_rawmidi_params_t *params)
+{
+	return snd_rawmidi_params(ump->rawmidi, params);
+}
+
+/**
+ * \brief get current parameters about associated RawMidi stream
+ * \param ump UMP handle
+ * \param params pointer to a snd_rawmidi_params_t structure to be filled
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_ump_rawmidi_params_current(snd_ump_t *ump, snd_rawmidi_params_t *params)
+{
+	return snd_rawmidi_params_current(ump->rawmidi, params);
+}
+
+/**
+ * \brief get status of associated RawMidi stream
+ * \param ump UMP handle
+ * \param status pointer to a snd_rawmidi_status_t structure to be filled
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_ump_rawmidi_status(snd_ump_t *ump, snd_rawmidi_status_t *status)
+{
+	return snd_rawmidi_status(ump->rawmidi, status);
+}
+
+/**
+ * \brief drop all packets in the rawmidi I/O ring buffer immediately
+ * \param ump UMP handle
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_ump_drop(snd_ump_t *ump)
+{
+	return snd_rawmidi_drop(ump->rawmidi);
+}
+
+/**
+ * \brief drain all packets in the UMP I/O ring buffer
+ * \param ump UMP handle
+ * \return 0 on success otherwise a negative error code
+ *
+ * Waits until all MIDI packets are not drained (sent) to the
+ * hardware device.
+ */
+int snd_ump_drain(snd_ump_t *ump)
+{
+	return snd_rawmidi_drain(ump->rawmidi);
+}
+
+/**
+ * \brief write UMP packets to UMP stream
+ * \param ump UMP handle
+ * \param buffer buffer containing UMP packets
+ * \param size output buffer size in bytes
+ */
+ssize_t snd_ump_write(snd_ump_t *ump, const void *buffer, size_t size)
+{
+	if (ump->is_input)
+		return -EINVAL;
+	return snd_rawmidi_write(ump->rawmidi, buffer, size);
+}
+
+/**
+ * \brief read UMP packets from UMP stream
+ * \param ump UMP handle
+ * \param buffer buffer to store the input MIDI bytes
+ * \param size input buffer size in bytes
+ * \retval count of UMP packet in bytes otherwise a negative error code
+ */
+ssize_t snd_ump_read(snd_ump_t *ump, void *buffer, size_t size)
+{
+	if (!ump->is_input)
+		return -EINVAL;
+	return snd_rawmidi_read(ump->rawmidi, buffer, size);
+}
+
+/**
+ * \brief read UMP packets from UMP stream with timestamp
+ * \param ump UMP handle
+ * \param[out] tstamp timestamp for the returned UMP packets
+ * \param buffer buffer to store the input UMP packets
+ * \param size input buffer size in bytes
+ * \retval count of UMP packet in bytes otherwise a negative error code
+ */
+ssize_t snd_ump_tread(snd_ump_t *ump, struct timespec *tstamp, void *buffer,
+		      size_t size)
+{
+	if (!ump->is_input)
+		return -EINVAL;
+	return snd_rawmidi_tread(ump->rawmidi, tstamp, buffer, size);
+}
+
+/**
+ * \brief get size of the snd_ump_endpoint_info_t structure in bytes
+ * \return size of the snd_ump_endpoint_info_t structure in bytes
+ */
+size_t snd_ump_endpoint_info_sizeof(void)
+{
+	return sizeof(snd_ump_endpoint_info_t);
+}
+
+/**
+ * \brief allocate the snd_ump_endpoint_info_t structure
+ * \param ptr returned pointer
+ * \return 0 on success otherwise a negative error code if fails
+ *
+ * Allocates a new snd_rawmidi_status_t structure using the standard
+ * malloc C library function.
+ */
+int snd_ump_endpoint_info_malloc(snd_ump_endpoint_info_t **info)
+{
+	*info = calloc(1, sizeof(snd_ump_endpoint_info_t));
+	if (!*info)
+		return -ENOMEM;
+	return 0;
+}
+
+/**
+ * \brief frees the snd_ump_endpoint_info_t structure
+ * \param status pointer to the snd_ump_endpoint_info_t structure to free
+ *
+ * Frees the given snd_ump_endpoint_info_t structure using the standard
+ * free C library function.
+ */
+void snd_ump_endpoint_info_free(snd_ump_endpoint_info_t *info)
+{
+	free(info);
+}
+
+/**
+ * \brief copy one snd_ump_endpoint_info_t structure to another
+ * \param dst destination snd_ump_endpoint_info_t structure
+ * \param src source snd_ump_endpoint_info_t structure
+ */
+void snd_ump_endpoint_info_copy(snd_ump_endpoint_info_t *dst,
+				const snd_ump_endpoint_info_t *src)
+{
+	*dst = *src;
+}
+
+/**
+ * \brief get card number of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return the card number of the given UMP endpoint
+ */
+int snd_ump_endpoint_info_get_card(const snd_ump_endpoint_info_t *info)
+{
+	return info->card;
+}
+
+/**
+ * \brief get device number of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return the device number of the given UMP endpoint
+ */
+int snd_ump_endpoint_info_get_device(const snd_ump_endpoint_info_t *info)
+{
+	return info->device;
+}
+
+/**
+ * \brief get UMP endpoint info flags
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP endpoint flag bits
+ */
+unsigned int snd_ump_endpoint_info_get_flags(const snd_ump_endpoint_info_t *info)
+{
+	return info->flags;
+}
+
+/**
+ * \brief get UMP endpoint protocol capability bits
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP endpoint protocol capability bits
+ */
+unsigned int snd_ump_endpoint_info_get_protocol_caps(const snd_ump_endpoint_info_t *info)
+{
+	return info->protocol_caps;
+}
+
+/**
+ * \brief get the current UMP endpoint protocol
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP endpoint protocol bits
+ */
+unsigned int snd_ump_endpoint_info_get_protocol(const snd_ump_endpoint_info_t *info)
+{
+	return info->protocol;
+}
+
+/**
+ * \brief get the number of UMP blocks belonging to the endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return number of UMP blocks
+ */
+unsigned int snd_ump_endpoint_info_get_num_blocks(const snd_ump_endpoint_info_t *info)
+{
+	return info->num_blocks;
+}
+
+/**
+ * \brief get UMP version number
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP version number
+ */
+unsigned int snd_ump_endpoint_info_get_version(const snd_ump_endpoint_info_t *info)
+{
+	return info->version;
+}
+
+/**
+ * \brief get UMP endpoint name string
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP endpoint name string
+ */
+const char *snd_ump_endpoint_info_get_name(const snd_ump_endpoint_info_t *info)
+{
+	return (const char *)info->name;
+}
+
+/**
+ * \brief get UMP endpoint product ID string
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \return UMP endpoint product ID string
+ */
+const char *snd_ump_endpoint_info_get_product_id(const snd_ump_endpoint_info_t *info)
+{
+	return (const char *)info->product_id;
+}
+
+/**
+ * \brief get endpoint information about UMP handle
+ * \param ump UMP handle
+ * \param info pointer to a snd_ump_endpoint_info_t structure to be filled
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_ump_endpoint_info(snd_ump_t *ump, snd_ump_endpoint_info_t *info)
+{
+	return _snd_rawmidi_ump_endpoint_info(ump->rawmidi, info);
+}
+
+/**
+ * \brief get size of the snd_ump_block_info_t structure in bytes
+ * \return size of the snd_ump_block_info_t structure in bytes
+ */
+size_t snd_ump_block_info_sizeof(void)
+{
+	return sizeof(snd_ump_block_info_t);
+}
+
+/**
+ * \brief allocate the snd_ump_block_info_t structure
+ * \param ptr returned pointer
+ * \return 0 on success otherwise a negative error code if fails
+ *
+ * Allocates a new snd_ump_block_info_t structure using the standard
+ * malloc C library function.
+ */
+int snd_ump_block_info_malloc(snd_ump_block_info_t **info)
+{
+	*info = calloc(1, sizeof(snd_ump_block_info_t));
+	if (!*info)
+		return -ENOMEM;
+	return 0;
+}
+
+/**
+ * \brief frees the snd_ump_block_info_t structure
+ * \param status pointer to the snd_ump_block_info_t structure to free
+ *
+ * Frees the given snd_ump_block_info_t structure using the standard
+ * free C library function.
+ */
+void snd_ump_block_info_free(snd_ump_block_info_t *info)
+{
+	free(info);
+}
+
+/**
+ * \brief copy one snd_ump_block_info_t structure to another
+ * \param dst destination snd_ump_block_info_t structure
+ * \param src source snd_ump_block_info_t structure
+ */
+void snd_ump_block_info_copy(snd_ump_block_info_t *dst,
+			     const snd_ump_block_info_t *src)
+{
+	*dst = *src;
+}
+
+/**
+ * \brief get card number of UMP block
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return the card number of the given UMP block
+ */
+int snd_ump_block_info_get_card(const snd_ump_block_info_t *info)
+{
+	return info->card;
+}
+
+/**
+ * \brief get device number of UMP block
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return the device number of the given UMP block
+ */
+int snd_ump_block_info_get_device(const snd_ump_block_info_t *info)
+{
+	return info->device;
+}
+
+/**
+ * \brief get UMP block ID
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return ID number of the given UMP block
+ */
+unsigned int snd_ump_block_info_get_block_id(const snd_ump_block_info_t *info)
+{
+	return info->block_id;
+}
+
+/**
+ * \brief set UMP block ID for query
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param id the ID number for query
+ */
+void snd_ump_block_info_set_block_id(snd_ump_block_info_t *info,
+				     unsigned int id)
+{
+	info->block_id = id;
+}
+
+/**
+ * \brief get UMP block activeness
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return 1 if the block is active or 0 if inactive
+ */
+unsigned int snd_ump_block_info_get_active(const snd_ump_block_info_t *info)
+{
+	return info->active;
+}
+
+/**
+ * \brief get UMP block information flags
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return info flag bits for the given UMP block
+ */
+unsigned int snd_ump_block_info_get_flags(const snd_ump_block_info_t *info)
+{
+	return info->flags;
+}
+
+/**
+ * \brief get UMP block direction
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return direction of UMP block (input,output,bidirectional)
+ */
+unsigned int snd_ump_block_info_get_direction(const snd_ump_block_info_t *info)
+{
+	return info->direction;
+}
+
+/**
+ * \brief get first UMP group ID belonging to the block
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return the first UMP group ID belonging to the block
+ */
+unsigned int snd_ump_block_info_get_first_group(const snd_ump_block_info_t *info)
+{
+	return info->first_group;
+}
+
+/**
+ * \brief get number of UMP groups belonging to the block
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return the number of UMP groups belonging to the block
+ */
+unsigned int snd_ump_block_info_get_num_groups(const snd_ump_block_info_t *info)
+{
+	return info->num_groups;
+}
+
+/**
+ * \brief get the name string of UMP block
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return the name string of UMP block
+ */
+const char *snd_ump_block_info_get_name(const snd_ump_block_info_t *info)
+{
+	return (const char *)info->name;
+}
+
+/**
+ * \brief get UMP block information
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \return 0 on success otherwise a negative error code
+ *
+ * The caller should fill the block ID to query at first via
+ * snd_ump_block_info_set_block_id().
+ */
+int snd_ump_block_info(snd_ump_t *ump, snd_ump_block_info_t *info)
+{
+	return _snd_rawmidi_ump_block_info(ump->rawmidi, info);
+}
diff --git a/src/rawmidi/ump_local.h b/src/rawmidi/ump_local.h
new file mode 100644
index 000000000000..424051ae688b
--- /dev/null
+++ b/src/rawmidi/ump_local.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: LGPL-2.1+ */
+#include "rawmidi.h"
+#include "ump.h"
+
+struct _snd_ump {
+	snd_rawmidi_t *rawmidi;
+	unsigned int flags;
+	int is_input;
+};
-- 
2.35.3

