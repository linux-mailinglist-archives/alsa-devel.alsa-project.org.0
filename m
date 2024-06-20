Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CDB90FF7C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 10:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7E6293A;
	Thu, 20 Jun 2024 10:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7E6293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718873539;
	bh=AxIKPqTO+wF+1yoEnfWDUj8D8R3BzcUWs0scf2kg4mU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eEZ4LgR0yzBCx9VNybOmi1n/7TfyHwNoaN3e8UuSqpnmPUXVM6vKMSxTrIceXQKZo
	 lNHKmIfv2A2NAprz3NGKYpS/8egzI9WhCB4adaLRWj4r+rS63gQMP5s/cvfh7zPFOa
	 c9zU2CA96UJc5VMxW7LD0ZyQVdBl5+ki7QmaF7yU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B791FF806A0; Thu, 20 Jun 2024 10:50:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77763F8069E;
	Thu, 20 Jun 2024 10:50:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53310F80236; Thu, 20 Jun 2024 10:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C977F80269
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 10:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C977F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e9ggyz3+
Received: by mail.gandi.net (Postfix) with ESMTPA id D358620011;
	Thu, 20 Jun 2024 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718872994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFI+0E0euoS+1MCJ9IhOD3qEiKcvASTCp8dMcDFqcOg=;
	b=e9ggyz3+6HHiSIpE/iQE79+VB+G+1HKI0ClqW79MRrOOy8T7fXlAMKw4WIXXKungvubb4f
	U4bQHzxdmr2RKQEFz7Ov7VRzFfEwisFMTpCTGNProk/T0XFUTxjNZCdMxvPAziN9d1nIrx
	AQ8LWvEtHlG6sX5m0Lgl5XAdkY1B75R3ePcdks7wQWyGgQvV61TcANwNfHhFLkHaGPWYD3
	VvUVP6D/eMJ0FUCS9UTI5fhfUrlJLSCsiLsMRVeRGnrqcgk70lTKCqjEey9n1RNyJcrTji
	PGroAx7J9W8cJSGP+WiJ7byUQ3mgfEY8T3KT/M01rmvh9DatmlZG4FDwFnkV6w==
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
Subject: [PATCH 04/10] ASoC: fsl: fsl_qmc_audio: Identify the QMC channel
 involved in completion routines
Date: Thu, 20 Jun 2024 10:42:51 +0200
Message-ID: <20240620084300.397853-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240620084300.397853-1-herve.codina@bootlin.com>
References: <20240620084300.397853-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: JQLPQB6AIWDXCYCJYWAYTJUB7DMGMT5F
X-Message-ID-Hash: JQLPQB6AIWDXCYCJYWAYTJUB7DMGMT5F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQLPQB6AIWDXCYCJYWAYTJUB7DMGMT5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current QMC audio driver uses only one QMC channel per DAI. The
context used by QMC channel transfer (read and write) completion
routines does not contains any QMC channel and the only one available
per DAI is used to schedule the next transfer.
This works pretty well with only one QMC channel per DAI.

The future support for non-inlerleave mode will use several QMC channel
per DAI. In that case, QMC channel transfer completion routines need to
identify the QMC channel related to the completion.

In order to fill this lack, even if identifying the current QMC channel
among several QMC channels is not needed for the current code, add one
indirection level and introduce the qmc_dai_chan data structrure.
This structure contains the QMC channel involved in the completion and
refererences to the runtime context (capture and playback) used by the
DAI.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 72 +++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index e8281e548746..b07770257bad 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -17,13 +17,19 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
+struct qmc_dai_chan {
+	struct qmc_dai_prtd *prtd_tx;
+	struct qmc_dai_prtd *prtd_rx;
+	struct qmc_chan *qmc_chan;
+};
+
 struct qmc_dai {
 	char *name;
 	int id;
 	struct device *dev;
-	struct qmc_chan *qmc_chan;
 	unsigned int nb_tx_ts;
 	unsigned int nb_rx_ts;
+	struct qmc_dai_chan chan;
 };
 
 struct qmc_audio {
@@ -86,9 +92,12 @@ static int qmc_audio_pcm_hw_params(struct snd_soc_component *component,
 
 static void qmc_audio_pcm_write_complete(void *context)
 {
-	struct qmc_dai_prtd *prtd = context;
+	struct qmc_dai_chan *chan = context;
+	struct qmc_dai_prtd *prtd;
 	int ret;
 
+	prtd = chan->prtd_tx;
+
 	prtd->buffer_ended += prtd->period_size;
 	if (prtd->buffer_ended >= prtd->buffer_size)
 		prtd->buffer_ended = 0;
@@ -97,9 +106,10 @@ static void qmc_audio_pcm_write_complete(void *context)
 	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
 		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
-	ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
+	ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
 				    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-				    qmc_audio_pcm_write_complete, prtd);
+				    qmc_audio_pcm_write_complete,
+				    &prtd->qmc_dai->chan);
 	if (ret) {
 		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
 			ret);
@@ -110,9 +120,12 @@ static void qmc_audio_pcm_write_complete(void *context)
 
 static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags)
 {
-	struct qmc_dai_prtd *prtd = context;
+	struct qmc_dai_chan *chan = context;
+	struct qmc_dai_prtd *prtd;
 	int ret;
 
+	prtd = chan->prtd_rx;
+
 	if (length != prtd->ch_dma_size) {
 		dev_err(prtd->qmc_dai->dev, "read complete length = %zu, exp %zu\n",
 			length, prtd->ch_dma_size);
@@ -126,9 +139,10 @@ static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned i
 	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
 		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
-	ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
+	ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
 				   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-				   qmc_audio_pcm_read_complete, prtd);
+				   qmc_audio_pcm_read_complete,
+				   &prtd->qmc_dai->chan);
 	if (ret) {
 		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
 			ret);
@@ -151,10 +165,13 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			prtd->qmc_dai->chan.prtd_tx = prtd;
+
 			/* Submit first chunk ... */
-			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
+			ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
 						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						    qmc_audio_pcm_write_complete, prtd);
+						    qmc_audio_pcm_write_complete,
+						    &prtd->qmc_dai->chan);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
 					ret);
@@ -167,19 +184,23 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
-			ret = qmc_chan_write_submit(prtd->qmc_dai->qmc_chan,
+			ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
 						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						    qmc_audio_pcm_write_complete, prtd);
+						    qmc_audio_pcm_write_complete,
+						    &prtd->qmc_dai->chan);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
 					ret);
 				return ret;
 			}
 		} else {
+			prtd->qmc_dai->chan.prtd_rx = prtd;
+
 			/* Submit first chunk ... */
-			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
+			ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
 						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						   qmc_audio_pcm_read_complete, prtd);
+						   qmc_audio_pcm_read_complete,
+						   &prtd->qmc_dai->chan);
 			if (ret) {
 				dev_err(component->dev, "read_submit failed %d\n",
 					ret);
@@ -192,9 +213,10 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
-			ret = qmc_chan_read_submit(prtd->qmc_dai->qmc_chan,
+			ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
 						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						   qmc_audio_pcm_read_complete, prtd);
+						   qmc_audio_pcm_read_complete,
+						   &prtd->qmc_dai->chan);
 			if (ret) {
 				dev_err(component->dev, "write_submit failed %d\n",
 					ret);
@@ -489,7 +511,7 @@ static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		chan_param.mode = QMC_TRANSPARENT;
 		chan_param.transp.max_rx_buf_size = params_period_bytes(params);
-		ret = qmc_chan_set_param(qmc_dai->qmc_chan, &chan_param);
+		ret = qmc_chan_set_param(qmc_dai->chan.qmc_chan, &chan_param);
 		if (ret) {
 			dev_err(dai->dev, "set param failed %d\n",
 				ret);
@@ -520,23 +542,23 @@ static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		ret = qmc_chan_start(qmc_dai->qmc_chan, direction);
+		ret = qmc_chan_start(qmc_dai->chan.qmc_chan, direction);
 		if (ret)
 			return ret;
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
-		ret = qmc_chan_stop(qmc_dai->qmc_chan, direction);
+		ret = qmc_chan_stop(qmc_dai->chan.qmc_chan, direction);
 		if (ret)
 			return ret;
-		ret = qmc_chan_reset(qmc_dai->qmc_chan, direction);
+		ret = qmc_chan_reset(qmc_dai->chan.qmc_chan, direction);
 		if (ret)
 			return ret;
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = qmc_chan_stop(qmc_dai->qmc_chan, direction);
+		ret = qmc_chan_stop(qmc_dai->chan.qmc_chan, direction);
 		if (ret)
 			return ret;
 		break;
@@ -613,10 +635,10 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 	if (!qmc_dai->name)
 		return -ENOMEM;
 
-	qmc_dai->qmc_chan = devm_qmc_chan_get_byphandle(qmc_audio->dev, np,
-							"fsl,qmc-chan");
-	if (IS_ERR(qmc_dai->qmc_chan)) {
-		ret = PTR_ERR(qmc_dai->qmc_chan);
+	qmc_dai->chan.qmc_chan = devm_qmc_chan_get_byphandle(qmc_audio->dev, np,
+							     "fsl,qmc-chan");
+	if (IS_ERR(qmc_dai->chan.qmc_chan)) {
+		ret = PTR_ERR(qmc_dai->chan.qmc_chan);
 		return dev_err_probe(qmc_audio->dev, ret,
 				     "dai %d get QMC channel failed\n", qmc_dai->id);
 	}
@@ -624,7 +646,7 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 	qmc_soc_dai_driver->id = qmc_dai->id;
 	qmc_soc_dai_driver->name = qmc_dai->name;
 
-	ret = qmc_chan_get_info(qmc_dai->qmc_chan, &info);
+	ret = qmc_chan_get_info(qmc_dai->chan.qmc_chan, &info);
 	if (ret) {
 		dev_err(qmc_audio->dev, "dai %d get QMC channel info failed %d\n",
 			qmc_dai->id, ret);
-- 
2.45.0

