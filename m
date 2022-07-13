Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B557349D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 12:51:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83F1B16F5;
	Wed, 13 Jul 2022 12:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83F1B16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657709478;
	bh=Dwl0HTAa4BwNwj9NWbzdG23MszOFSEtzyF9Urdq6MaM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i2vQW4lAVpkfGQA5jeQpq9Fwp2LkAyWHZeBI693zGOA/zYW+YnEpSAx5sRXVZZomR
	 L7D81eWwCAuMp95c9zoEaIJGrwvM4fM2RuKy/WSWbTgGyPHBagvgi0OqO8DMKG7vKF
	 w14iqQho4fIqsvR0g4CPr34eCsOqk6JF3s4q6C30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE0A2F8057A;
	Wed, 13 Jul 2022 12:48:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C38B1F804EC; Wed, 13 Jul 2022 12:48:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89352F804CA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 12:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89352F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="pYoS99dH"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5t99tbkJ"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D8801FF88;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657709286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBCP36pJlgRE3PcrZiT17KGDRXcn/O9QQpEMF5mQ0h4=;
 b=pYoS99dHy/jrX7vsscaYcHQPmMjR8DzJYkMhwDkQe5K/dg1lJiB53M6QqESpqRCr8bxsRK
 xeUi23/fHueQzPva5tFWbd/yl3qUb4OZ6dFwfCrWGwWEaNjuRQ5c/8/vc6rG6EGAVp/NCI
 SRSVcKapMa0XsTrkP0JprrN86Ej0z9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657709286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBCP36pJlgRE3PcrZiT17KGDRXcn/O9QQpEMF5mQ0h4=;
 b=5t99tbkJDulGfLoIQxQAPmZ51cb9JlT0Cr2gnw3TcISKpMmqvOx4yoUB4t1UC3q8XY4SrK
 0+kNF44ctj77o+Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E1A413754;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2LskGuaizmLceAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 13 Jul 2022 10:48:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ALSA: pcm: Fix missing return value comments for kernel
 docs
Date: Wed, 13 Jul 2022 12:47:54 +0200
Message-Id: <20220713104759.4365-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713104759.4365-1-tiwai@suse.de>
References: <20220713104759.4365-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Each kernel doc comment expects the definition of the return value in
a proper format.  This patch adds or fixes the missing entries for PCM
API.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     | 50 +++++++++++++++++++++++++++++++++++++++--
 sound/core/pcm.c        |  4 ++++
 sound/core/pcm_memory.c |  4 ++++
 sound/core/pcm_native.c |  6 +++++
 4 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 6b99310b5b88..08cf4a5801f3 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -607,7 +607,7 @@ snd_pcm_debug_name(struct snd_pcm_substream *substream, char *buf, size_t size)
  * snd_pcm_stream_linked - Check whether the substream is linked with others
  * @substream: substream to check
  *
- * Returns true if the given substream is being linked with others.
+ * Return: true if the given substream is being linked with others
  */
 static inline int snd_pcm_stream_linked(struct snd_pcm_substream *substream)
 {
@@ -673,7 +673,7 @@ void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substream,
  * snd_pcm_running - Check whether the substream is in a running state
  * @substream: substream to check
  *
- * Returns true if the given substream is in the state RUNNING, or in the
+ * Return: true if the given substream is in the state RUNNING, or in the
  * state DRAINING for playback.
  */
 static inline int snd_pcm_running(struct snd_pcm_substream *substream)
@@ -687,6 +687,8 @@ static inline int snd_pcm_running(struct snd_pcm_substream *substream)
  * bytes_to_samples - Unit conversion of the size from bytes to samples
  * @runtime: PCM runtime instance
  * @size: size in bytes
+ *
+ * Return: the size in samples
  */
 static inline ssize_t bytes_to_samples(struct snd_pcm_runtime *runtime, ssize_t size)
 {
@@ -697,6 +699,8 @@ static inline ssize_t bytes_to_samples(struct snd_pcm_runtime *runtime, ssize_t
  * bytes_to_frames - Unit conversion of the size from bytes to frames
  * @runtime: PCM runtime instance
  * @size: size in bytes
+ *
+ * Return: the size in frames
  */
 static inline snd_pcm_sframes_t bytes_to_frames(struct snd_pcm_runtime *runtime, ssize_t size)
 {
@@ -707,6 +711,8 @@ static inline snd_pcm_sframes_t bytes_to_frames(struct snd_pcm_runtime *runtime,
  * samples_to_bytes - Unit conversion of the size from samples to bytes
  * @runtime: PCM runtime instance
  * @size: size in samples
+ *
+ * Return: the byte size
  */
 static inline ssize_t samples_to_bytes(struct snd_pcm_runtime *runtime, ssize_t size)
 {
@@ -717,6 +723,8 @@ static inline ssize_t samples_to_bytes(struct snd_pcm_runtime *runtime, ssize_t
  * frames_to_bytes - Unit conversion of the size from frames to bytes
  * @runtime: PCM runtime instance
  * @size: size in frames
+ *
+ * Return: the byte size
  */
 static inline ssize_t frames_to_bytes(struct snd_pcm_runtime *runtime, snd_pcm_sframes_t size)
 {
@@ -727,6 +735,8 @@ static inline ssize_t frames_to_bytes(struct snd_pcm_runtime *runtime, snd_pcm_s
  * frame_aligned - Check whether the byte size is aligned to frames
  * @runtime: PCM runtime instance
  * @bytes: size in bytes
+ *
+ * Return: true if aligned, or false if not
  */
 static inline int frame_aligned(struct snd_pcm_runtime *runtime, ssize_t bytes)
 {
@@ -736,6 +746,8 @@ static inline int frame_aligned(struct snd_pcm_runtime *runtime, ssize_t bytes)
 /**
  * snd_pcm_lib_buffer_bytes - Get the buffer size of the current PCM in bytes
  * @substream: PCM substream
+ *
+ * Return: buffer byte size
  */
 static inline size_t snd_pcm_lib_buffer_bytes(struct snd_pcm_substream *substream)
 {
@@ -746,6 +758,8 @@ static inline size_t snd_pcm_lib_buffer_bytes(struct snd_pcm_substream *substrea
 /**
  * snd_pcm_lib_period_bytes - Get the period size of the current PCM in bytes
  * @substream: PCM substream
+ *
+ * Return: period byte size
  */
 static inline size_t snd_pcm_lib_period_bytes(struct snd_pcm_substream *substream)
 {
@@ -758,6 +772,8 @@ static inline size_t snd_pcm_lib_period_bytes(struct snd_pcm_substream *substrea
  * @runtime: PCM runtime instance
  *
  * Result is between 0 ... (boundary - 1)
+ *
+ * Return: available frame size
  */
 static inline snd_pcm_uframes_t snd_pcm_playback_avail(struct snd_pcm_runtime *runtime)
 {
@@ -774,6 +790,8 @@ static inline snd_pcm_uframes_t snd_pcm_playback_avail(struct snd_pcm_runtime *r
  * @runtime: PCM runtime instance
  *
  * Result is between 0 ... (boundary - 1)
+ *
+ * Return: available frame size
  */
 static inline snd_pcm_uframes_t snd_pcm_capture_avail(struct snd_pcm_runtime *runtime)
 {
@@ -786,6 +804,8 @@ static inline snd_pcm_uframes_t snd_pcm_capture_avail(struct snd_pcm_runtime *ru
 /**
  * snd_pcm_playback_hw_avail - Get the queued space for playback
  * @runtime: PCM runtime instance
+ *
+ * Return: available frame size
  */
 static inline snd_pcm_sframes_t snd_pcm_playback_hw_avail(struct snd_pcm_runtime *runtime)
 {
@@ -795,6 +815,8 @@ static inline snd_pcm_sframes_t snd_pcm_playback_hw_avail(struct snd_pcm_runtime
 /**
  * snd_pcm_capture_hw_avail - Get the free space for capture
  * @runtime: PCM runtime instance
+ *
+ * Return: available frame size
  */
 static inline snd_pcm_sframes_t snd_pcm_capture_hw_avail(struct snd_pcm_runtime *runtime)
 {
@@ -934,6 +956,8 @@ static inline const struct snd_interval *hw_param_interval_c(const struct snd_pc
 /**
  * params_channels - Get the number of channels from the hw params
  * @p: hw params
+ *
+ * Return: the number of channels
  */
 static inline unsigned int params_channels(const struct snd_pcm_hw_params *p)
 {
@@ -943,6 +967,8 @@ static inline unsigned int params_channels(const struct snd_pcm_hw_params *p)
 /**
  * params_rate - Get the sample rate from the hw params
  * @p: hw params
+ *
+ * Return: the sample rate
  */
 static inline unsigned int params_rate(const struct snd_pcm_hw_params *p)
 {
@@ -952,6 +978,8 @@ static inline unsigned int params_rate(const struct snd_pcm_hw_params *p)
 /**
  * params_period_size - Get the period size (in frames) from the hw params
  * @p: hw params
+ *
+ * Return: the period size in frames
  */
 static inline unsigned int params_period_size(const struct snd_pcm_hw_params *p)
 {
@@ -961,6 +989,8 @@ static inline unsigned int params_period_size(const struct snd_pcm_hw_params *p)
 /**
  * params_periods - Get the number of periods from the hw params
  * @p: hw params
+ *
+ * Return: the number of periods
  */
 static inline unsigned int params_periods(const struct snd_pcm_hw_params *p)
 {
@@ -970,6 +1000,8 @@ static inline unsigned int params_periods(const struct snd_pcm_hw_params *p)
 /**
  * params_buffer_size - Get the buffer size (in frames) from the hw params
  * @p: hw params
+ *
+ * Return: the buffer size in frames
  */
 static inline unsigned int params_buffer_size(const struct snd_pcm_hw_params *p)
 {
@@ -979,6 +1011,8 @@ static inline unsigned int params_buffer_size(const struct snd_pcm_hw_params *p)
 /**
  * params_buffer_bytes - Get the buffer size (in bytes) from the hw params
  * @p: hw params
+ *
+ * Return: the buffer size in bytes
  */
 static inline unsigned int params_buffer_bytes(const struct snd_pcm_hw_params *p)
 {
@@ -1241,6 +1275,8 @@ int snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
  * only the given sized buffer and doesn't allow re-allocation nor dynamic
  * allocation of a larger buffer unlike the standard one.
  * The function may return -ENOMEM error, hence the caller must check it.
+ *
+ * Return: zero if successful, or a negative error code
  */
 static inline int __must_check
 snd_pcm_set_fixed_buffer(struct snd_pcm_substream *substream, int type,
@@ -1259,6 +1295,8 @@ snd_pcm_set_fixed_buffer(struct snd_pcm_substream *substream, int type,
  * Apply the set up of the fixed buffer via snd_pcm_set_fixed_buffer() for
  * all substream.  If any of allocation fails, it returns -ENOMEM, hence the
  * caller must check the return value.
+ *
+ * Return: zero if successful, or a negative error code
  */
 static inline int __must_check
 snd_pcm_set_fixed_buffer_all(struct snd_pcm *pcm, int type,
@@ -1315,6 +1353,8 @@ static inline int snd_pcm_lib_alloc_vmalloc_32_buffer
  * snd_pcm_sgbuf_get_addr - Get the DMA address at the corresponding offset
  * @substream: PCM substream
  * @ofs: byte offset
+ *
+ * Return: DMA address
  */
 static inline dma_addr_t
 snd_pcm_sgbuf_get_addr(struct snd_pcm_substream *substream, unsigned int ofs)
@@ -1328,6 +1368,8 @@ snd_pcm_sgbuf_get_addr(struct snd_pcm_substream *substream, unsigned int ofs)
  * @substream: PCM substream
  * @ofs: byte offset
  * @size: byte size to examine
+ *
+ * Return: chunk size
  */
 static inline unsigned int
 snd_pcm_sgbuf_get_chunk_size(struct snd_pcm_substream *substream,
@@ -1430,6 +1472,8 @@ struct snd_pcm_chmap {
  * snd_pcm_chmap_substream - get the PCM substream assigned to the given chmap info
  * @info: chmap information
  * @idx: the substream number index
+ *
+ * Return: the matched PCM substream, or NULL if not found
  */
 static inline struct snd_pcm_substream *
 snd_pcm_chmap_substream(struct snd_pcm_chmap *info, unsigned int idx)
@@ -1460,6 +1504,8 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 /**
  * pcm_format_to_bits - Strong-typed conversion of pcm_format to bitwise
  * @pcm_format: PCM format
+ *
+ * Return: 64bit mask corresponding to the given PCM format
  */
 static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
 {
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 977d54320a5c..03fc5fa5813e 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -216,6 +216,8 @@ static const char * const snd_pcm_format_names[] = {
 /**
  * snd_pcm_format_name - Return a name string for the given PCM format
  * @format: PCM format
+ *
+ * Return: the format name string
  */
 const char *snd_pcm_format_name(snd_pcm_format_t format)
 {
@@ -1138,6 +1140,8 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
  * This adds the given notifier to the global list so that the callback is
  * called for each registered PCM devices.  This exists only for PCM OSS
  * emulation, so far.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_pcm_notify(struct snd_pcm_notify *notify, int nfree)
 {
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index b8296b6eb2c1..7bde7fb64011 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -350,6 +350,8 @@ EXPORT_SYMBOL(snd_pcm_lib_preallocate_pages_for_all);
  * SNDRV_DMA_TYPE_VMALLOC type.
  *
  * Upon successful buffer allocation and setup, the function returns 0.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_pcm_set_managed_buffer(struct snd_pcm_substream *substream, int type,
 				struct device *data, size_t size, size_t max)
@@ -369,6 +371,8 @@ EXPORT_SYMBOL(snd_pcm_set_managed_buffer);
  *
  * Do pre-allocation to all substreams of the given pcm for the specified DMA
  * type and size, and set the managed_buffer_alloc flag to each substream.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
 				   struct device *data,
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 4adaee62ef33..aa0453e51595 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3412,6 +3412,8 @@ static long snd_pcm_ioctl(struct file *file, unsigned int cmd,
  * The function is provided primarily for OSS layer and USB gadget drivers,
  * and it allows only the limited set of ioctls (hw_params, sw_params,
  * prepare, start, drain, drop, forward).
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_pcm_kernel_ioctl(struct snd_pcm_substream *substream,
 			 unsigned int cmd, void *arg)
@@ -3810,6 +3812,8 @@ static const struct vm_operations_struct snd_pcm_vm_ops_data_fault = {
  *
  * This is the default mmap handler for PCM data.  When mmap pcm_ops is NULL,
  * this function is invoked implicitly.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_pcm_lib_default_mmap(struct snd_pcm_substream *substream,
 			     struct vm_area_struct *area)
@@ -3836,6 +3840,8 @@ EXPORT_SYMBOL_GPL(snd_pcm_lib_default_mmap);
  * When your hardware uses the iomapped pages as the hardware buffer and
  * wants to mmap it, pass this function as mmap pcm_ops.  Note that this
  * is supposed to work only on limited architectures.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_pcm_lib_mmap_iomem(struct snd_pcm_substream *substream,
 			   struct vm_area_struct *area)
-- 
2.35.3

