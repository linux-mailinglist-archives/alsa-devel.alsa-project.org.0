Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA13E90FF64
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 10:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C7DE86E;
	Thu, 20 Jun 2024 10:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C7DE86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718873426;
	bh=qIFtrk4+jNTGagJEvJP5YHoAWF+6D2TUEBk4+yKW9OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JiucN/4mrCrEcZhmsBcdq8Vc6Q0CWtIoGp0E7TpD/9OSSg028YDyLHK8Zyp/+TK7+
	 td+ay12GgVv5jJWizcAYUgT6k0SQeEsY5RmOIgyWbspz7sRt/zd1w2zA97PvENho/Q
	 HpoDwricogiCJuJfGAF3uULAXg0QArdPcXpcKuw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A92BF805BD; Thu, 20 Jun 2024 10:49:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D1FF805A8;
	Thu, 20 Jun 2024 10:49:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C929F80589; Thu, 20 Jun 2024 10:43:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F245FF80266
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 10:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F245FF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AWbHokCp
Received: by mail.gandi.net (Postfix) with ESMTPA id B86202000E;
	Thu, 20 Jun 2024 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718872993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qz56XJSUWFIXioYtOWzibVEtfgyCjJ8wlnP/M2Ai9vM=;
	b=AWbHokCpxotyrZuw1NlkQ2ZXO2viJ65ahJRtBSnWBWLVA0yV09QVhY4z1epYHtYnt+NMMK
	vcc9NB9k6m9ZXdTniL8PM42Klu3XTbN5b7nKj8uCG1c0phhmvoDKsLql4RwftbhAK9zBey
	SugYVBLETSYrliS9FpbxOkplqU4Rjxy94IYiQgYeTk0c6AL9zIkGWuK6+pTh9ALYTeqv+9
	X1q/R0ydUxz6VkGtTx0erij7w1jgFtXLXvIaS/8DczmSEHQPVrX2lA05jkRaXaOcS3g/tm
	DoiQFKfku+oAuzBglYeE/Y7x9BfLNjO/WpnIq6eq2Cz5etK8YiyV7zJI/dDzfA==
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
Subject: [PATCH 03/10] ASoC: fsl: fsl_qmc_audio: Split channel buffer and PCM
 pointer handling
Date: Thu, 20 Jun 2024 10:42:50 +0200
Message-ID: <20240620084300.397853-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240620084300.397853-1-herve.codina@bootlin.com>
References: <20240620084300.397853-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: YGZCM7UHOVH6A4VK36ZEMQZVOKS5JPAO
X-Message-ID-Hash: YGZCM7UHOVH6A4VK36ZEMQZVOKS5JPAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGZCM7UHOVH6A4VK36ZEMQZVOKS5JPAO/>
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

