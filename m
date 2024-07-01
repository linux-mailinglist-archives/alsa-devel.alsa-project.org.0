Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07591DE0A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 13:33:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14CCF236A;
	Mon,  1 Jul 2024 13:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14CCF236A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719833626;
	bh=g06udzdr3FQ3GGjFDr6DB3X29brZkwlgc30sknmNjdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VdSnNPGEH1F8v2dbpcYmCnRDsJ8XIDAd1VdH9iz3w+OrOZN0dFY+Vyik8nvGxfvnq
	 ziPnfDraTql4mDikdKtQUDDMkdFflElpNcEy8lEpr/GgHynITEBfmoT1AH24l2lpZu
	 unXnjXHcURmXFaSQr13chciMCp7Cmm/PHly09R/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 564F1F8064F; Mon,  1 Jul 2024 13:32:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FBB3F80655;
	Mon,  1 Jul 2024 13:32:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36307F804D6; Mon,  1 Jul 2024 13:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E78C3F804D6
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 13:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E78C3F804D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IC5jzmz3
Received: by mail.gandi.net (Postfix) with ESMTPA id 205FF24000A;
	Mon,  1 Jul 2024 11:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jcw3B7br9mMf7ih+RGvbztJQGfoFsNFtd4Dmae4m5o=;
	b=IC5jzmz3RVMVKUDvfu2V+XY4gJ+VHN6WFRD8L1onHskN2e69nRp7IeJEgXosa6zV1QNFxs
	zV59lemE1n19UnDiU/okAXlc69cTrM8bVVX50Rsjk+xsNww3u8LFC1Lkt/cgHjKddn3Ypw
	fX5OXOELddg8RQOVke87B1O+lFsWJMt6YI5DsztR3UBqXpEuwwcce/eKLkDFYkRfhCucys
	niF7SwR7wVERwg7MQ/5erLs6/tRk+tgG2cwqMmyjXZ0Ntu88AuvL3vTeNH1Itfpjhbzct/
	c6eF2AcA3bZT9tnwAdbnYgL5+kQllm3lqYy81VtTzTYd85qFkUajhWjEmC9/6w==
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
Subject: [PATCH v2 05/10] ASoC: fsl: fsl_qmc_audio: Introduce
 qmc_audio_pcm_{read,write}_submit()
Date: Mon,  1 Jul 2024 13:30:32 +0200
Message-ID: <20240701113038.55144-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240701113038.55144-1-herve.codina@bootlin.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: UBHPNU5ZSDNUM7WBSHNE6E2BWCHCKTR7
X-Message-ID-Hash: UBHPNU5ZSDNUM7WBSHNE6E2BWCHCKTR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBHPNU5ZSDNUM7WBSHNE6E2BWCHCKTR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Submitting data to QMC channels is done in several places: transfer
completions and DAI start. The operation done is simple and consist in
one function call.

With the future introduction of support for non-interleaved mode,
submitting data will be more complex.

To avoid copy/paste of code in several places, introduce
qmc_audio_pcm_{read,write}_submit() whose goal is to handle this
data submission.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 93 +++++++++++++++++------------------
 1 file changed, 45 insertions(+), 48 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index b07770257bad..36145f1ddbf1 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -90,11 +90,29 @@ static int qmc_audio_pcm_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static void qmc_audio_pcm_write_complete(void *context);
+
+static int qmc_audio_pcm_write_submit(struct qmc_dai_prtd *prtd)
+{
+	int ret;
+
+	ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
+				    prtd->ch_dma_addr_current, prtd->ch_dma_size,
+				    qmc_audio_pcm_write_complete,
+				    &prtd->qmc_dai->chan);
+	if (ret) {
+		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void qmc_audio_pcm_write_complete(void *context)
 {
 	struct qmc_dai_chan *chan = context;
 	struct qmc_dai_prtd *prtd;
-	int ret;
 
 	prtd = chan->prtd_tx;
 
@@ -106,23 +124,33 @@ static void qmc_audio_pcm_write_complete(void *context)
 	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
 		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
-	ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
-				    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-				    qmc_audio_pcm_write_complete,
-				    &prtd->qmc_dai->chan);
+	qmc_audio_pcm_write_submit(prtd);
+
+	snd_pcm_period_elapsed(prtd->substream);
+}
+
+static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags);
+
+static int qmc_audio_pcm_read_submit(struct qmc_dai_prtd *prtd)
+{
+	int ret;
+
+	ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
+				   prtd->ch_dma_addr_current, prtd->ch_dma_size,
+				   qmc_audio_pcm_read_complete,
+				   &prtd->qmc_dai->chan);
 	if (ret) {
-		dev_err(prtd->qmc_dai->dev, "write_submit failed %d\n",
+		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
 			ret);
 	}
 
-	snd_pcm_period_elapsed(prtd->substream);
+	return 0;
 }
 
 static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags)
 {
 	struct qmc_dai_chan *chan = context;
 	struct qmc_dai_prtd *prtd;
-	int ret;
 
 	prtd = chan->prtd_rx;
 
@@ -139,14 +167,7 @@ static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned i
 	if (prtd->ch_dma_addr_current >= prtd->ch_dma_addr_end)
 		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
-	ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
-				   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-				   qmc_audio_pcm_read_complete,
-				   &prtd->qmc_dai->chan);
-	if (ret) {
-		dev_err(prtd->qmc_dai->dev, "read_submit failed %d\n",
-			ret);
-	}
+	qmc_audio_pcm_read_submit(prtd);
 
 	snd_pcm_period_elapsed(prtd->substream);
 }
@@ -168,15 +189,9 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 			prtd->qmc_dai->chan.prtd_tx = prtd;
 
 			/* Submit first chunk ... */
-			ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
-						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						    qmc_audio_pcm_write_complete,
-						    &prtd->qmc_dai->chan);
-			if (ret) {
-				dev_err(component->dev, "write_submit failed %d\n",
-					ret);
+			ret = qmc_audio_pcm_write_submit(prtd);
+			if (ret)
 				return ret;
-			}
 
 			/* ... prepare next one ... */
 			prtd->ch_dma_addr_current += prtd->ch_dma_size;
@@ -184,28 +199,16 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
-			ret = qmc_chan_write_submit(prtd->qmc_dai->chan.qmc_chan,
-						    prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						    qmc_audio_pcm_write_complete,
-						    &prtd->qmc_dai->chan);
-			if (ret) {
-				dev_err(component->dev, "write_submit failed %d\n",
-					ret);
+			ret = qmc_audio_pcm_write_submit(prtd);
+			if (ret)
 				return ret;
-			}
 		} else {
 			prtd->qmc_dai->chan.prtd_rx = prtd;
 
 			/* Submit first chunk ... */
-			ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
-						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						   qmc_audio_pcm_read_complete,
-						   &prtd->qmc_dai->chan);
-			if (ret) {
-				dev_err(component->dev, "read_submit failed %d\n",
-					ret);
+			ret = qmc_audio_pcm_read_submit(prtd);
+			if (ret)
 				return ret;
-			}
 
 			/* ... prepare next one ... */
 			prtd->ch_dma_addr_current += prtd->ch_dma_size;
@@ -213,15 +216,9 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 				prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
 			/* ... and send it */
-			ret = qmc_chan_read_submit(prtd->qmc_dai->chan.qmc_chan,
-						   prtd->ch_dma_addr_current, prtd->ch_dma_size,
-						   qmc_audio_pcm_read_complete,
-						   &prtd->qmc_dai->chan);
-			if (ret) {
-				dev_err(component->dev, "write_submit failed %d\n",
-					ret);
+			ret = qmc_audio_pcm_read_submit(prtd);
+			if (ret)
 				return ret;
-			}
 		}
 		break;
 
-- 
2.45.0

