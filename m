Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0E6D8807
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 22:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68235826;
	Wed,  5 Apr 2023 22:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68235826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680725781;
	bh=DqHrJUoxXR3LmgIYmWU0XlRRntGEcjW4WJBPBtwKDBI=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L9xgCEltF5S5BPcxgyyRyhbdNBT/3yxMmR0itPsJJSjczW5Gu8ut5jz5YwpAqUCXO
	 C5pPbGm3PFt4L4zv6XeYD8wOrDhyvHRdGGl0XROjw3+5NsIFvFXAx9YfplUFNt7zlV
	 V+wAbtYPeXURA9W4sn2xT8qOFT+wCI76PtCZ6ZeU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E80DF8059F;
	Wed,  5 Apr 2023 22:13:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 574E9F80580; Wed,  5 Apr 2023 22:12:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42405F801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42405F801C0
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id BF8DB24258
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:12:20 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pk9US-Dln-00
	for <alsa-devel@alsa-project.org>; Wed, 05 Apr 2023 22:12:20 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH] docs: sound: kernel-api: writing-an-alsa-driver.rst: add
 FIXMEs
Date: Wed,  5 Apr 2023 22:12:20 +0200
Message-Id: <20230405201220.2197878-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OW2FEKVKWHK5WPEPX4BRKZ3DV6QBLM6P
X-Message-ID-Hash: OW2FEKVKWHK5WPEPX4BRKZ3DV6QBLM6P
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OW2FEKVKWHK5WPEPX4BRKZ3DV6QBLM6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Consider this a review by an under-informed reader.
---
 .../sound/kernel-api/writing-an-alsa-driver.rst    | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index b58f15f2dc7c..1b605867dbd0 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -82,10 +82,11 @@ core/seq/oss
 This contains the OSS sequencer emulation code.
 
 include directory
 -----------------
 
+// FIXME: needs update for uapi
 This is the place for the public header files of ALSA drivers, which are
 to be exported to user-space, or included by several files in different
 directories. Basically, the private header files should not be placed in
 this directory, but you may still find files there, due to historical
 reasons :)
@@ -1646,11 +1647,11 @@ Typically, you'll have a hardware descriptor as below::
 
    The “period” is a term that corresponds to a fragment in the OSS
    world. The period defines the point at which a PCM interrupt is
    generated. This point strongly depends on the hardware. Generally,
    a smaller period size will give you more interrupts, that is,
-   more controls. In the case of capture, this size defines the input
+   more controls (FIXME: huh? granularity, maybe?). In the case of capture, this size defines the input
    latency. On the other hand, the whole buffer size defines the
    output latency for the playback direction.
 
 -  There is also a field ``fifo_size``. This specifies the size of the
    hardware FIFO, but currently it is neither used by the drivers nor
@@ -1682,10 +1683,11 @@ frames as unsigned integer while ``snd_pcm_sframes_t`` is for
 frames as signed integer.
 
 DMA Buffer Information
 ~~~~~~~~~~~~~~~~~~~~~~
 
+// FIXME: this is outdated; dma_private is available only through dma_buffer_p!
 The DMA buffer is defined by the following four fields: ``dma_area``,
 ``dma_addr``, ``dma_bytes`` and ``dma_private``. ``dma_area``
 holds the buffer pointer (the logical address). You can call
 :c:func:`memcpy()` from/to this pointer. Meanwhile, ``dma_addr`` holds
 the physical address of the buffer. This field is specified only when
@@ -1709,10 +1711,11 @@ Running Status
 The running status can be referred via ``runtime->status``. This is
 a pointer to a struct snd_pcm_mmap_status record.
 For example, you can get the current
 DMA hardware pointer via ``runtime->status->hw_ptr``.
 
+// FIXME: DMA application pointer is not explained.
 The DMA application pointer can be referred via ``runtime->control``,
 which points to a struct snd_pcm_mmap_control record.
 However, accessing this value directly is not recommended.
 
 Private Data
@@ -2010,10 +2013,12 @@ is called by the interrupt routine. Then the PCM middle layer updates
 the position and calculates the available space, and wakes up the
 sleeping poll threads, etc.
 
 This callback is also atomic by default.
 
+FIXME: this does not specifiy whether this is the pre- or post-fifo position.
+
 copy_user, copy_kernel and fill_silence ops
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 These callbacks are not mandatory, and can be omitted in most cases.
 These callbacks are used when the hardware buffer cannot be in the
@@ -2384,10 +2389,14 @@ fields.
 
 The ``name`` is the name identifier string. Since ALSA 0.9.x, the
 control name is very important, because its role is classified from
 its name. There are pre-defined standard control names. The details
 are described in the `Control Names`_ subsection.
+// This is a questionable design, IMO. Why user-space heuristics when
+// the driver could set the roles/capabilities? This would avoid
+// problems like the Tone Control sliders (unlike the switch?!) being
+// misclassified as applying also to capture.
 
 The ``index`` field holds the index number of this control. If there
 are several different controls with the same name, they can be
 distinguished by the index number. This is the case when several
 codecs exist on the card. If the index is zero, you can omit the
@@ -2485,10 +2494,11 @@ a control constantly.
 When the control may be updated, but currently has no effect on anything,
 setting the ``INACTIVE`` flag may be appropriate. For example, PCM
 controls should be inactive while no PCM device is open.
 
 There are ``LOCK`` and ``OWNER`` flags to change the write permissions.
+// FIXME: explain.
 
 Control Callbacks
 -----------------
 
 info callback
@@ -3355,10 +3365,11 @@ Buffer and Memory Management
 ============================
 
 Buffer Types
 ------------
 
+// FIXME: this appears obsolete, i only found one pair of functions.
 ALSA provides several different buffer allocation functions depending on
 the bus and the architecture. All these have a consistent API. The
 allocation of physically-contiguous pages is done via the
 :c:func:`snd_malloc_xxx_pages()` function, where xxx is the bus
 type.
@@ -3670,10 +3681,11 @@ user (root by default), do as follows::
  entry->mode = S_IFREG | S_IRUGO | S_IWUSR;
 
 and set the write buffer size and the callback::
 
   entry->c.text.write = my_proc_write;
+  // FIXME: something's missing here?
 
 In the write callback, you can use :c:func:`snd_info_get_line()`
 to get a text line, and :c:func:`snd_info_get_str()` to retrieve
 a string from the line. Some examples are found in
 ``core/oss/mixer_oss.c``, core/oss/and ``pcm_oss.c``.
-- 
2.40.0.152.g15d061e6df

