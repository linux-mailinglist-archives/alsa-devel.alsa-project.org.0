Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE120CD10
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 09:53:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78F4A167F;
	Mon, 29 Jun 2020 09:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78F4A167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593417225;
	bh=ErchkDOamwN3rAMIPB9pr36SlNkChONRoW17kGzzZts=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tq1xKRoo6d+ZVqx7NvJqhsg9dZe/nVYpC8TkocJQAxFEK1nmK58A2YCfMz4vNbudB
	 zECwE85ytQMCbrXyl1vHGfz8oLFxaFm4psLMkfKxt1PL7GViLfmYes2eiShKiQa0Xe
	 1i4EeJLBHLZ+KPgqV7+EYSFnxZfC0WpOgQyofz7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31C7AF802BD;
	Mon, 29 Jun 2020 09:50:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC5A7F802BC; Mon, 29 Jun 2020 09:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BC36F8022B
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 09:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BC36F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dfjz2Ag+"
Received: from localhost.localdomain (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E25142333B;
 Mon, 29 Jun 2020 07:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593417025;
 bh=ErchkDOamwN3rAMIPB9pr36SlNkChONRoW17kGzzZts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dfjz2Ag+/F2mZiFKbTWKr4NKvfoaXBTRvBbIlDoxDjTIKWtSBOUps7ho5rGibCcVA
 otReZv7YYKC3u0Df2B1diHZl5en2u9B7YcXR3w/LvQmVmxOlZ3ZuLHZ1yaziKPgN1i
 LoNJD3xkXBcJ4pohdYiT6JFkZUMxaaQLNd8HjoTU=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v4 3/3] ALSA: compress: fix partial_drain completion state
Date: Mon, 29 Jun 2020 13:20:02 +0530
Message-Id: <20200629075002.11436-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629075002.11436-1-vkoul@kernel.org>
References: <20200629075002.11436-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On partial_drain completion we should be in SNDRV_PCM_STATE_RUNNING
state, so set that for partially draining streams in
snd_compr_drain_notify() and use a flag for partially draining streams

While at it, add locks for stream state change in
snd_compr_drain_notify() as well.

Fixes: f44f2a5417b2 ("ALSA: compress: fix drain calls blocking other compress functions (v6)")
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/sound/compress_driver.h | 10 +++++++++-
 sound/core/compress_offload.c   |  4 ++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 3df8d8c90191..8d23351f7ad7 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -66,6 +66,7 @@ struct snd_compr_runtime {
  * @direction: stream direction, playback/recording
  * @metadata_set: metadata set flag, true when set
  * @next_track: has userspace signal next track transition, true when set
+ * @partial_drain: undergoing partial_drain for stream, true when set
  * @private_data: pointer to DSP private data
  * @dma_buffer: allocated buffer if any
  */
@@ -78,6 +79,7 @@ struct snd_compr_stream {
 	enum snd_compr_direction direction;
 	bool metadata_set;
 	bool next_track;
+	bool partial_drain;
 	void *private_data;
 	struct snd_dma_buffer dma_buffer;
 };
@@ -187,7 +189,13 @@ static inline void snd_compr_drain_notify(struct snd_compr_stream *stream)
 	if (snd_BUG_ON(!stream))
 		return;
 
-	stream->runtime->state = SNDRV_PCM_STATE_SETUP;
+	/* for partial_drain case we are back to running state on success */
+	if (stream->partial_drain) {
+		stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
+		stream->partial_drain = false; /* clear this flag as well */
+	} else {
+		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
+	}
 
 	wake_up(&stream->runtime->sleep);
 }
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index e618580feac4..1c4b2cf450a0 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -803,6 +803,9 @@ static int snd_compr_stop(struct snd_compr_stream *stream)
 
 	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_STOP);
 	if (!retval) {
+		/* clear flags and stop any drain wait */
+		stream->partial_drain = false;
+		stream->metadata_set = false;
 		snd_compr_drain_notify(stream);
 		stream->runtime->total_bytes_available = 0;
 		stream->runtime->total_bytes_transferred = 0;
@@ -960,6 +963,7 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 	if (stream->next_track == false)
 		return -EPERM;
 
+	stream->partial_drain = true;
 	retval = stream->ops->trigger(stream, SND_COMPR_TRIGGER_PARTIAL_DRAIN);
 	if (retval) {
 		pr_debug("Partial drain returned failure\n");
-- 
2.26.2

