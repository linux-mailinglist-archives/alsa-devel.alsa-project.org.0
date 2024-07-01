Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4736191DE0F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 13:33:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D32A12368;
	Mon,  1 Jul 2024 13:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D32A12368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719833637;
	bh=qIFtrk4+jNTGagJEvJP5YHoAWF+6D2TUEBk4+yKW9OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V2NA5id/erbTeDHkF+v18oyMZz3Ba6LUaeKCceREjee517wwWCHU5+dVEWx9Kd4Gh
	 tL3yK5hL72oJSKe37sId6ssKfCalPHvDOZWSULTlxB5xd8w7TiLDzXMYBdqFBrrRCZ
	 SuvdR2tmQbanm6uVgGMcaeuK/AhSE8UGZnecayYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4623F80686; Mon,  1 Jul 2024 13:32:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44CD6F8067E;
	Mon,  1 Jul 2024 13:32:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 768E5F805FD; Mon,  1 Jul 2024 13:32:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C63A8F8028B
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 13:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63A8F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qn7BuU8l
Received: by mail.gandi.net (Postfix) with ESMTPA id D103624000C;
	Mon,  1 Jul 2024 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qz56XJSUWFIXioYtOWzibVEtfgyCjJ8wlnP/M2Ai9vM=;
	b=Qn7BuU8l4SABc26cXeY5fXzvX2JTxMN+hjuYbmlIbf/hJmf8HHCixsYahNv4qs8XCW/pS3
	53S40kUKmjlqpFimDWiAoLHlL+agIhJwTb4t1K95F4fBk3psHH/NlmPC+NR2MPWDm3j+ss
	njv/7N3MJNClabHkBe1NuYnKMix8hkCaAgZL1jfMkAw8g8Jnu+E0SnpatGeW3Fc53YPHZK
	+83BSiZJxLC5oTwoKxkcpeAiW41vz34NJ3QpsjQyicnyUah1B7ELrLunAkOgbq40BNAELQ
	QmGlmFYhHckomdhk/A9nUwU6w5Sk8mbTyPUJ2Yn5N8vebjN+k/BF9JWP6aV50g==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 03/10] ASoC: fsl: fsl_qmc_audio: Split channel buffer and
 PCM pointer handling
Date: Mon,  1 Jul 2024 13:30:30 +0200
Message-ID: <20240701113038.55144-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240701113038.55144-1-herve.codina@bootlin.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: OMF4EFO4XRNYR63IMOBIPX545SIZKNHA
X-Message-ID-Hash: OMF4EFO4XRNYR63IMOBIPX545SIZKNHA
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMF4EFO4XRNYR63IMOBIPX545SIZKNHA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver mixes some internal values for channel DMA buffer handling
and PCM pointer handling. In the currently supported interleaved mode,
this mix does not lead to any issues but in order to prepare the
support for the non-interleaved mode, having them clearly separated will
ease the support and avoid additional computation to convert values used
in channel DMA buffer management in values usable for PCM pointer.

Use a specific set of variable for PCM pointer handling and an other set
for channel DMA buffer.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 84 +++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 917a32389f3d..e8281e548746 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -35,11 +35,16 @@ struct qmc_audio {
 
 struct qmc_dai_prtd {
 	struct qmc_dai *qmc_dai;
-	dma_addr_t dma_buffer_start;
-	dma_addr_t period_ptr_submitted;
-	dma_addr_t period_ptr_ended;
-	dma_addr_t dma_buffer_end;
-	size_t period_size;
+
+	snd_pcm_uframes_t buffer_ended;
+	snd_pcm_uframes_t buffer_size;
+	snd_pcm_uframes_t period_size;
+
+	dma_addr_t ch_dma_addr_start;
+	dma_addr_t ch_dma_addr_current;
+	dma_addr_t ch_dma_addr_end;
+	size_t ch_dma_size;
+
 	struct snd_pcm_substream *substream;
 };
 
@@ -65,13 +70,17 @@ static int qmc_audio_pcm_hw_params(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
 
-	prtd->dma_buffer_start = runtime->dma_addr;
-	prtd->dma_buffer_end = runtime->dma_addr + params_buffer_bytes(params);
-	prtd->period_size = params_period_bytes(params);
-	prtd->period_ptr_submitted = prtd->dma_buffer_start;
-	prtd->period_ptr_ended = prtd->dma_buffer_start;
 	prtd->substream = substream;
 
+	prtd->buffer_ended = 0;
+	prtd->buffer_size = params_buffer_size(params);
+	prtd->period_size = params_period_size(params);
+
+	prtd->ch_dma_addr_start = runtime->dma_addr;
+	prtd->ch_dma_addr_end = runtime->dma_addr + params_buffer_bytes(params);
+	prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
+	prtd->ch_dma_size = params_period_bytes(params);
+
 	return 0;
 }
 
@@ -80,16 +89,16 @@ static void qmc_audio_pcm_write_complete(void *context)
 	struct qmc_dai_prtd *prtd = context;
 	int ret;
 
-	prtd->period_ptr_ended += prtd->period_size;
-	if (prtd->period_ptr_ended >= prtd->dma_buffer_end)
-		prtd->period_ptr_ended = prtd->dma_buffer_start;
+	prtd->buffer_ended += prtd->period_size;
+	if (prtd->buffer_ended >= prtd->buffer_size)
+		prtd->buffer_ended = 0;
 
-	prtd->period_ptr_submitted += prtd->period_size;
-	if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
-		prtd->period_ptr_submitted = prtd->dma_buffer_start;
+	prtd->ch_dma_addr_current += prtd->ch_dma_size;
+	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
+		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 	ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
-				    prtd->period_ptr_submitted, prtd->period_size,
+				    prtd->ch_dma_addr_current, prtd->ch_dma_size,
 				    qmc_audio_pcm_write_complete, prtd);
 	if (ret) {
 		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
@@ -104,21 +113,21 @@ static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned i
 	struct qmc_dai_prtd *prtd = context;
 	int ret;
 
-	if (length != prtd->period_size) {
+	if (length != prtd->ch_dma_size) {
 		dev_err(prtd->qmc_dai->dev, "read complete length = %zu, exp %zu\n",
-			length, prtd->period_size);
+			length, prtd->ch_dma_size);
 	}
 
-	prtd->period_ptr_ended += prtd->period_size;
-	if (prtd->period_ptr_ended >= prtd->dma_buffer_end)
-		prtd->period_ptr_ended = prtd->dma_buffer_start;
+	prtd->buffer_ended += prtd->period_size;
+	if (prtd->buffer_ended >= prtd->buffer_size)
+		prtd->buffer_ended = 0;
 
-	prtd->period_ptr_submitted += prtd->period_size;
-	if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
-		prtd->period_ptr_submitted = prtd->dma_buffer_start;
+	prtd->ch_dma_addr_current += prtd->ch_dma_size;
+	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
+		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 	ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
-				   prtd->period_ptr_submitted, prtd->period_size,
+				   prtd->ch_dma_addr_current, prtd->ch_dma_size,
 				   qmc_audio_pcm_read_complete, prtd);
 	if (ret) {
 		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
@@ -144,7 +153,7 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			/* Submit first chunk ... */
 			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
-						    prtd->period_ptr_submitted, prtd->period_size,
+						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
 						    qmc_audio_pcm_write_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
@@ -153,13 +162,13 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 			}
 
 			/* ... prepare next one ... */
-			prtd->period_ptr_submitted += prtd->period_size;
-			if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
-				prtd->period_ptr_submitted = prtd->dma_buffer_start;
+			prtd->ch_dma_addr_current += prtd->ch_dma_size;
+			if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
+				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
 			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
-						    prtd->period_ptr_submitted, prtd->period_size,
+						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
 						    qmc_audio_pcm_write_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
@@ -169,7 +178,7 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 		} else {
 			/* Submit first chunk ... */
 			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
-						   prtd->period_ptr_submitted, prtd->period_size,
+						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
 						   qmc_audio_pcm_read_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "read_submit failed %d\n",
@@ -178,13 +187,13 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 			}
 
 			/* ... prepare next one ... */
-			prtd->period_ptr_submitted += prtd->period_size;
-			if (prtd->period_ptr_submitted >= prtd->dma_buffer_end)
-				prtd->period_ptr_submitted = prtd->dma_buffer_start;
+			prtd->ch_dma_addr_current += prtd->ch_dma_size;
+			if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
+				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
 			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
-						   prtd->period_ptr_submitted, prtd->period_size,
+						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
 						   qmc_audio_pcm_read_complete, prtd);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
@@ -215,8 +224,7 @@ static snd_pcm_uframes_t qmc_audio_pcm_pointer(struct snd_soc_component *compone
 {
 	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
 
-	return bytes_to_frames(substream->runtime,
-			       prtd->period_ptr_ended - prtd->dma_buffer_start);
+	return prtd->buffer_ended;
 }
 
 static int qmc_audio_of_xlate_dai_name(struct snd_soc_component *component,
-- 
2.45.0

