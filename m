Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274E4895AC
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 10:50:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30EB417A3;
	Mon, 10 Jan 2022 10:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30EB417A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641808255;
	bh=dn8pmcGSz/09RA9zuzSxTWyhiebMQ9U2OjT8AtUfbdU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EikyE24rbJY8nncStBXIQYL/27l44kBw1UKejKNEWti0GdzlWknwrXlLrtbIRzdvq
	 1tevgPeyh5x8pisB7v7gVZAc+p3F56YwKHtliCEsvPAfdYVPiPFBg93DEmPrhTvg42
	 xdQhX0wW66XySHaxtL4efNmzIAvOH4dYqPvfoRzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 233ECF80519;
	Mon, 10 Jan 2022 10:48:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 396B9F8012E; Mon, 10 Jan 2022 10:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B44C5F80248
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 10:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B44C5F80248
X-IronPort-AV: E=Sophos;i="5.88,276,1635174000"; d="scan'208";a="106545264"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 10 Jan 2022 18:48:03 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1D68C4238CA4;
 Mon, 10 Jan 2022 18:48:00 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/5] ASoC: sh: rz-ssi: Add functions to get/set substream
 pointer
Date: Mon, 10 Jan 2022 09:47:11 +0000
Message-Id: <20220110094711.8574-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Pavel Machek <pavel@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
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

A copy of substream pointer is stored in priv structure during
rz_ssi_dai_trigger() callback ie in SNDRV_PCM_TRIGGER_START case
and the pointer is assigned to NULL in case of SNDRV_PCM_TRIGGER_STOP.

The driver used the locks only in rz_ssi_stream_is_valid() and assigned
the local substream pointer to NULL in rz_ssi_dai_trigger() callback and
in rest of the driver no locking was used while assigning substream
pointer.

This patch adds functions to get/set substream pointer with locks acquired
and replaces the instances of access to substream pointer with the
get/set functions.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/sh/rz-ssi.c | 55 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index aabd15e9d515..057aedacedec 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -201,12 +201,36 @@ static bool rz_ssi_stream_is_valid(struct rz_ssi_priv *ssi,
 	return ret;
 }
 
+static struct snd_pcm_substream *rz_ssi_get_substream(struct rz_ssi_stream *strm)
+{
+	struct rz_ssi_priv *ssi = strm->priv;
+	struct snd_pcm_substream *substream;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ssi->lock, flags);
+	substream = strm->substream;
+	spin_unlock_irqrestore(&ssi->lock, flags);
+
+	return substream;
+}
+
+static void rz_ssi_set_substream(struct rz_ssi_stream *strm,
+				 struct snd_pcm_substream *substream)
+{
+	struct rz_ssi_priv *ssi = strm->priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ssi->lock, flags);
+	strm->substream = substream;
+	spin_unlock_irqrestore(&ssi->lock, flags);
+}
+
 static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 			       struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	strm->substream = substream;
+	rz_ssi_set_substream(strm, substream);
 	strm->sample_width = samples_to_bytes(runtime, 1);
 	strm->dma_buffer_pos = 0;
 	strm->period_counter = 0;
@@ -223,12 +247,13 @@ static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 			       struct rz_ssi_stream *strm)
 {
-	struct snd_soc_dai *dai = rz_ssi_get_dai(strm->substream);
-	unsigned long flags;
+	struct snd_pcm_substream *substream;
+	struct snd_soc_dai *dai;
 
-	spin_lock_irqsave(&ssi->lock, flags);
-	strm->substream = NULL;
-	spin_unlock_irqrestore(&ssi->lock, flags);
+	substream = rz_ssi_get_substream(strm);
+	rz_ssi_set_substream(strm, NULL);
+
+	dai = rz_ssi_get_dai(substream);
 
 	if (strm->oerr_num > 0)
 		dev_info(dai->dev, "overrun = %d\n", strm->oerr_num);
@@ -301,7 +326,8 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	bool is_play = rz_ssi_stream_is_play(ssi, strm->substream);
+	struct snd_pcm_substream *substream = rz_ssi_get_substream(strm);
+	bool is_play = rz_ssi_stream_is_play(ssi, substream);
 	u32 ssicr, ssifcr;
 
 	ssicr = rz_ssi_reg_readl(ssi, SSICR);
@@ -382,7 +408,7 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 
 static void rz_ssi_pointer_update(struct rz_ssi_stream *strm, int frames)
 {
-	struct snd_pcm_substream *substream = strm->substream;
+	struct snd_pcm_substream *substream = rz_ssi_get_substream(strm);
 	struct snd_pcm_runtime *runtime;
 	int current_period;
 
@@ -399,14 +425,14 @@ static void rz_ssi_pointer_update(struct rz_ssi_stream *strm, int frames)
 
 	current_period = strm->buffer_pos / runtime->period_size;
 	if (strm->period_counter != current_period) {
-		snd_pcm_period_elapsed(strm->substream);
+		snd_pcm_period_elapsed(substream);
 		strm->period_counter = current_period;
 	}
 }
 
 static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	struct snd_pcm_substream *substream = strm->substream;
+	struct snd_pcm_substream *substream = rz_ssi_get_substream(strm);
 	struct snd_pcm_runtime *runtime;
 	bool done = false;
 	u16 *buf;
@@ -464,7 +490,7 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 
 static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	struct snd_pcm_substream *substream = strm->substream;
+	struct snd_pcm_substream *substream = rz_ssi_get_substream(strm);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int sample_space;
 	int samples = 0;
@@ -588,7 +614,7 @@ static int rz_ssi_dma_slave_config(struct rz_ssi_priv *ssi,
 static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
 			       struct rz_ssi_stream *strm)
 {
-	struct snd_pcm_substream *substream = strm->substream;
+	struct snd_pcm_substream *substream = rz_ssi_get_substream(strm);
 	struct dma_async_tx_descriptor *desc;
 	struct snd_pcm_runtime *runtime;
 	enum dma_transfer_direction dir;
@@ -646,12 +672,13 @@ static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
 static void rz_ssi_dma_complete(void *data)
 {
 	struct rz_ssi_stream *strm = (struct rz_ssi_stream *)data;
+	struct snd_pcm_substream *substream = rz_ssi_get_substream(strm);
 
-	if (!strm->running || !strm->substream || !strm->substream->runtime)
+	if (!strm->running || !substream || !substream->runtime)
 		return;
 
 	/* Note that next DMA transaction has probably already started */
-	rz_ssi_pointer_update(strm, strm->substream->runtime->period_size);
+	rz_ssi_pointer_update(strm, substream->runtime->period_size);
 
 	/* Queue up another DMA transaction */
 	rz_ssi_dma_transfer(strm->priv, strm);
-- 
2.17.1

