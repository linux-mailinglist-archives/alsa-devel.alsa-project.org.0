Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D19769B42
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CFE4850;
	Mon, 31 Jul 2023 17:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CFE4850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818693;
	bh=26Sfy9WHH7PNJlSIXGiogeY90gcnkHspKQ3yNw0BqS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nuA2qXERbSRIi9AqGDkfPEjWk/rcpbxDNzKoaw/r4uyelZxRVKI7xjDE62L23DsgG
	 ZXRdiwtOHVMhbLE+N2Jr/ULpdgtJFsDIJKZZYhOti0u/cVJd/cWQELe1gDBv5i4Vda
	 2j0IxHydavx8duTLfaybhjgCvIMiNYFrt5O6DT2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11A6FF80564; Mon, 31 Jul 2023 17:48:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B92D4F80564;
	Mon, 31 Jul 2023 17:48:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 268CCF805E1; Mon, 31 Jul 2023 17:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0577F80567
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0577F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=h2R1AHtz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2CEEpJQp
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 236D8221D0;
	Mon, 31 Jul 2023 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MYi0V9V6CClLbHigdbs6IDXGTQphzijpSRIuKec+tN4=;
	b=h2R1AHtzeU4xSF/D0Iq1wumGVdWlTYGSNqm6Ixul7zmJ0ECASVeBwhSeW2xIY0Dx41zXxA
	WHhmK8T8NWKiPrqpF12DJEjEeDVEcf1bjf2QS+ot4G8L7RKrjc3vguvIY5B1sRVM0BfPx9
	S+TcSTVcARxLWPSBjq+Ijr6fjdO+E3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MYi0V9V6CClLbHigdbs6IDXGTQphzijpSRIuKec+tN4=;
	b=2CEEpJQpAwrojBFkCkHUUUCRTR66LIMgPYfGf/OzWDdloUrnEVp4RjE/sH6rbeH7501HuV
	A1JUT/65x1yNM1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 050781322C;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +N50O47Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 22/24] ALSA: doc: Update description for the new PCM copy ops
Date: Mon, 31 Jul 2023 17:47:16 +0200
Message-Id: <20230731154718.31048-23-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DAUXK7RGF2PVY646NX5UFAWQH54ZPMRH
X-Message-ID-Hash: DAUXK7RGF2PVY646NX5UFAWQH54ZPMRH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DAUXK7RGF2PVY646NX5UFAWQH54ZPMRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update the documentation about the PCM copy callbacks.
The update was kept minimalistic, just correcting the use of copy_user
ops with the single copy ops, and drop/update the text mentioning the
copy_kernel.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../kernel-api/writing-an-alsa-driver.rst     | 59 +++++++------------
 1 file changed, 20 insertions(+), 39 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 4335c98b3d82..2ecd6992b796 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -2018,8 +2018,8 @@ sleeping poll threads, etc.
 
 This callback is also atomic by default.
 
-copy_user, copy_kernel and fill_silence ops
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+copy and fill_silence ops
+~~~~~~~~~~~~~~~~~~~~~~~~~
 
 These callbacks are not mandatory, and can be omitted in most cases.
 These callbacks are used when the hardware buffer cannot be in the
@@ -3444,8 +3444,8 @@ external hardware buffer in interrupts (or in tasklets, preferably).
 
 The first case works fine if the external hardware buffer is large
 enough. This method doesn't need any extra buffers and thus is more
-efficient. You need to define the ``copy_user`` and ``copy_kernel``
-callbacks for the data transfer, in addition to the ``fill_silence``
+efficient. You need to define the ``copy`` callback
+for the data transfer, in addition to the ``fill_silence``
 callback for playback. However, there is a drawback: it cannot be
 mmapped. The examples are GUS's GF1 PCM or emu8000's wavetable PCM.
 
@@ -3458,22 +3458,22 @@ Another case is when the chip uses a PCI memory-map region for the
 buffer instead of the host memory. In this case, mmap is available only
 on certain architectures like the Intel one. In non-mmap mode, the data
 cannot be transferred as in the normal way. Thus you need to define the
-``copy_user``, ``copy_kernel`` and ``fill_silence`` callbacks as well,
+``copy`` and ``fill_silence`` callbacks as well,
 as in the cases above. Examples are found in ``rme32.c`` and
 ``rme96.c``.
 
-The implementation of the ``copy_user``, ``copy_kernel`` and
+The implementation of the ``copy`` and
 ``silence`` callbacks depends upon whether the hardware supports
-interleaved or non-interleaved samples. The ``copy_user`` callback is
+interleaved or non-interleaved samples. The ``copy`` callback is
 defined like below, a bit differently depending on whether the direction
 is playback or capture::
 
-  static int playback_copy_user(struct snd_pcm_substream *substream,
+  static int playback_copy(struct snd_pcm_substream *substream,
                int channel, unsigned long pos,
-               void __user *src, unsigned long count);
-  static int capture_copy_user(struct snd_pcm_substream *substream,
+               sockptr_t src, unsigned long count);
+  static int capture_copy(struct snd_pcm_substream *substream,
                int channel, unsigned long pos,
-               void __user *dst, unsigned long count);
+               sockptr_t dst, unsigned long count);
 
 In the case of interleaved samples, the second argument (``channel``) is
 not used. The third argument (``pos``) specifies the position in bytes.
@@ -3490,18 +3490,18 @@ of data (``count``) at the specified pointer (``src``) to the specified
 offset (``pos``) in the hardware buffer. When coded like memcpy-like
 way, the copy would look like::
 
-  my_memcpy_from_user(my_buffer + pos, src, count);
+  my_memcpy_from_sockptr(my_buffer + pos, src, count);
 
 For the capture direction, you copy the given amount of data (``count``)
 at the specified offset (``pos``) in the hardware buffer to the
 specified pointer (``dst``)::
 
-  my_memcpy_to_user(dst, my_buffer + pos, count);
+  my_memcpy_to_sockptr(dst, my_buffer + pos, count);
 
-Here the functions are named ``from_user`` and ``to_user`` because
-it's the user-space buffer that is passed to these callbacks.  That
-is, the callback is supposed to copy data from/to the user-space
-directly to/from the hardware buffer.
+The given ``src`` or ``dst`` pointer is a ``sockptr_t`` type
+containing a universal pointer that can be either a user-space and
+kernel pointer.  Use the existing helpers to copy or access the data
+as defined in ``linux/sockptr.h``.
 
 Careful readers might notice that these callbacks receive the
 arguments in bytes, not in frames like other callbacks.  It's because
@@ -3519,25 +3519,6 @@ the given user-space buffer, but only for the given channel. For
 details, please check ``isa/gus/gus_pcm.c`` or ``pci/rme9652/rme9652.c``
 as examples.
 
-The above callbacks are the copies from/to the user-space buffer.  There
-are some cases where we want to copy from/to the kernel-space buffer
-instead.  In such a case, the ``copy_kernel`` callback is called.  It'd
-look like::
-
-  static int playback_copy_kernel(struct snd_pcm_substream *substream,
-               int channel, unsigned long pos,
-               void *src, unsigned long count);
-  static int capture_copy_kernel(struct snd_pcm_substream *substream,
-               int channel, unsigned long pos,
-               void *dst, unsigned long count);
-
-As found easily, the only difference is that the buffer pointer is
-without a ``__user`` prefix; that is, a kernel-buffer pointer is passed
-in the fourth argument.  Correspondingly, the implementation would be
-a version without the user-copy, such as::
-
-  my_memcpy(my_buffer + pos, src, count);
-
 Usually for the playback, another callback ``fill_silence`` is
 defined.  It's implemented in a similar way as the copy callbacks
 above::
@@ -3545,10 +3526,10 @@ above::
   static int silence(struct snd_pcm_substream *substream, int channel,
                      unsigned long pos, unsigned long count);
 
-The meanings of arguments are the same as in the ``copy_user`` and
-``copy_kernel`` callbacks, although there is no buffer pointer
+The meanings of arguments are the same as in the ``copy`` callback,
+although there is no buffer pointer
 argument. In the case of interleaved samples, the channel argument has
-no meaning, as for the ``copy_*`` callbacks.
+no meaning, as for the ``copy`` callback.
 
 The role of the ``fill_silence`` callback is to set the given amount
 (``count``) of silence data at the specified offset (``pos``) in the
-- 
2.35.3

