Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA98573495
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 12:49:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B0451710;
	Wed, 13 Jul 2022 12:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B0451710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657709394;
	bh=UEyk8JuDi6V/x283xrIEzuTYvfogpgRzqD9y63XFQbA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NxJV5S15PE/JyHN/AqWl17zZgp8DdYjfiVMXxEio5kTfoBlENbE9RbaROP0zx5PjV
	 namkgkUNy80wqNMUpJtfQmO/g4Vl1HSacfcvEa8C6AZJTm9puxotkt3vZf5eFNRYvB
	 r6Es2vWT8Q8yb/ydelLtD8mgG74cZYHygcKmCWWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9833CF80310;
	Wed, 13 Jul 2022 12:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB880F8054A; Wed, 13 Jul 2022 12:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 525B4F80249
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 12:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 525B4F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tgrIS4Vv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="EtrbJFpj"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A9F921FF8A;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657709286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmjIkuBX+i+NgsG8xs2kb1yrkedswGeklfJm2ndQK78=;
 b=tgrIS4Vv9TdnGDj2M3gbR6ajQ6gHGfB/DhYNgBoNmcll5AYDbVnU/4HAM4TvbhRrZXH75P
 N2gxEmiZGuSXDpYSdI7aIWP3EH45UcEroY5tG+c+23TkBqGMh0jscTFTqGxJgwpeBW7SH1
 H287Ge+tvX2p691KkXeZ+Or1I7CNVrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657709286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmjIkuBX+i+NgsG8xs2kb1yrkedswGeklfJm2ndQK78=;
 b=EtrbJFpjaOaX11Ea5nrCRB2WQINh6Nlh5hXoobIJgqnruik4dIr1BNq08J0gXerGhutpFf
 MlOjkKTB6N53IdDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FD6713AC7;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qAVnIuaizmLceAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 13 Jul 2022 10:48:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ALSA: dmaengine: Fix missing return value comments for
 kernel docs
Date: Wed, 13 Jul 2022 12:47:55 +0200
Message-Id: <20220713104759.4365-4-tiwai@suse.de>
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
dmaengine API.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/dmaengine_pcm.h |  2 ++
 sound/core/pcm_dmaengine.c    | 30 ++++++++++++++++++++----------
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 38ea046e653c..2df54cf02cb3 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -15,6 +15,8 @@
  * snd_pcm_substream_to_dma_direction - Get dma_transfer_direction for a PCM
  *   substream
  * @substream: PCM substream
+ *
+ * Return: DMA transfer direction
  */
 static inline enum dma_transfer_direction
 snd_pcm_substream_to_dma_direction(const struct snd_pcm_substream *substream)
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index af6f717e1e7e..5b2ca028f5aa 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -48,6 +48,8 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_get_chan);
  *
  * This function can be used to initialize a dma_slave_config from a substream
  * and hw_params in a dmaengine based PCM driver implementation.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_hwparams_to_dma_slave_config(const struct snd_pcm_substream *substream,
 	const struct snd_pcm_hw_params *params,
@@ -175,10 +177,10 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
  * @substream: PCM substream
  * @cmd: Trigger command
  *
- * Returns 0 on success, a negative error code otherwise.
- *
  * This function can be used as the PCM trigger callback for dmaengine based PCM
  * driver implementations.
+ *
+ * Return: 0 on success, a negative error code otherwise
  */
 int snd_dmaengine_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
@@ -223,6 +225,8 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_trigger);
  *
  * This function is deprecated and should not be used by new drivers, as its
  * results may be unreliable.
+ *
+ * Return: PCM position in frames
  */
 snd_pcm_uframes_t snd_dmaengine_pcm_pointer_no_residue(struct snd_pcm_substream *substream)
 {
@@ -237,6 +241,8 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_pointer_no_residue);
  *
  * This function can be used as the PCM pointer callback for dmaengine based PCM
  * driver implementations.
+ *
+ * Return: PCM position in frames
  */
 snd_pcm_uframes_t snd_dmaengine_pcm_pointer(struct snd_pcm_substream *substream)
 {
@@ -266,9 +272,9 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_pointer);
  * @filter_fn: Filter function used to request the DMA channel
  * @filter_data: Data passed to the DMA filter function
  *
- * Returns NULL or the requested DMA channel.
- *
  * This function request a DMA channel for usage with dmaengine PCM.
+ *
+ * Return: NULL or the requested DMA channel
  */
 struct dma_chan *snd_dmaengine_pcm_request_channel(dma_filter_fn filter_fn,
 	void *filter_data)
@@ -288,11 +294,11 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_request_channel);
  * @substream: PCM substream
  * @chan: DMA channel to use for data transfers
  *
- * Returns 0 on success, a negative error code otherwise.
- *
  * The function should usually be called from the pcm open callback. Note that
  * this function will use private_data field of the substream's runtime. So it
  * is not available to your pcm driver implementation.
+ *
+ * Return: 0 on success, a negative error code otherwise
  */
 int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 	struct dma_chan *chan)
@@ -326,12 +332,12 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open);
  * @filter_fn: Filter function used to request the DMA channel
  * @filter_data: Data passed to the DMA filter function
  *
- * Returns 0 on success, a negative error code otherwise.
- *
  * This function will request a DMA channel using the passed filter function and
  * data. The function should usually be called from the pcm open callback. Note
  * that this function will use private_data field of the substream's runtime. So
  * it is not available to your pcm driver implementation.
+ *
+ * Return: 0 on success, a negative error code otherwise
  */
 int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
 	dma_filter_fn filter_fn, void *filter_data)
@@ -344,6 +350,8 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
 /**
  * snd_dmaengine_pcm_close - Close a dmaengine based PCM substream
  * @substream: PCM substream
+ *
+ * Return: 0 on success, a negative error code otherwise
  */
 int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream)
 {
@@ -362,6 +370,8 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_close);
  * @substream: PCM substream
  *
  * Releases the DMA channel associated with the PCM substream.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
 {
@@ -382,10 +392,10 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_close_release_chan);
  * @hw: PCM hw params
  * @chan: DMA channel to use for data transfers
  *
- * Returns 0 on success, a negative error code otherwise.
- *
  * This function will query DMA capability, then refine the pcm hardware
  * parameters.
+ *
+ * Return: 0 on success, a negative error code otherwise
  */
 int snd_dmaengine_pcm_refine_runtime_hwparams(
 	struct snd_pcm_substream *substream,
-- 
2.35.3

