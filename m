Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EEE91DE12
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 13:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39FA62366;
	Mon,  1 Jul 2024 13:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39FA62366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719833658;
	bh=nVi64ptT3yeC9c3LdQUftdhINtCOQi2phyoQtm7QQOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sTZ3ctdS4WW+dLOufCp1bn3x+fwo8tolSZ+pPyMEa+uQW+JkeD+7yXlbxRp10dsN4
	 dcMDLg2Iift6Sto6K4XWmGiBdqs9Rz/JVzbuOo3lVA+nPrU8x3Z0fzBuvG8O7jvQKS
	 JY+ofZm51agtQb63nLq5bpXD/UR2msdlLPHIm1z0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BEB9F80697; Mon,  1 Jul 2024 13:32:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE387F806A5;
	Mon,  1 Jul 2024 13:32:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 877F5F8003A; Mon,  1 Jul 2024 13:32:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34597F8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 13:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34597F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M/BsLWhQ
Received: by mail.gandi.net (Postfix) with ESMTPA id CD8B624000D;
	Mon,  1 Jul 2024 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XcZoHw1OxV6TsmAdg+08k1YhnLc5NmNZMePFnQJFI74=;
	b=M/BsLWhQlhBXtz7jXLYBkW328atssS5Oa1BgPQh367OA0eJfDC1DPdTxY1nVe/S8uzbizj
	F5Eb586GxIKNTMEJygbBtWYVusUY31BevPhabLHPYdD8Mjxf0fYzdiakKRwIZsmWFF6aYP
	KlSL7hNso/mgc0iyJiCSZAkV6Ac/NYcos2eyHxHDk3GsHca/RGj9MwGLPkkGzIjrvCCVEi
	t1iNScaRt7SbiJiQjMQfcnuU5mBSwODUaLkGRjyVbKotKQ/TYFq71Lumb9TQLKiib/EAcB
	ROm5vUAoNGG9Oxql1dx+33gEEYsc1PfIkF2ff/kT+JNMc+h5fsW+Ob2ox3aZYw==
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
Subject: [PATCH v2 06/10] ASoC: fsl: fsl_qmc_audio: Introduce
 qmc_dai_constraints_interleaved()
Date: Mon,  1 Jul 2024 13:30:33 +0200
Message-ID: <20240701113038.55144-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240701113038.55144-1-herve.codina@bootlin.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: XABHVQ4POPT67I52OSXLU7UTDVHUA7UY
X-Message-ID-Hash: XABHVQ4POPT67I52OSXLU7UTDVHUA7UY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XABHVQ4POPT67I52OSXLU7UTDVHUA7UY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Constraints are set by qmc_dai_startup(). These constraints are specific
to the interleaved mode.

With the future introduction of support for non-interleaved mode, a new
set of constraints will be set. To make the code clear and keep
qmc_dai_startup() simple, extract the current interleaved mode
constraints settings to a specific function.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 37 +++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 36145f1ddbf1..f70c6c8eec4a 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -436,24 +436,14 @@ static int qmc_dai_hw_rule_capture_format_by_channels(struct snd_pcm_hw_params *
 	return qmc_dai_hw_rule_format_by_channels(qmc_dai, params, qmc_dai->nb_rx_ts);
 }
 
-static int qmc_dai_startup(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
+static int qmc_dai_constraints_interleaved(struct snd_pcm_substream *substream,
+					   struct qmc_dai *qmc_dai)
 {
-	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
 	snd_pcm_hw_rule_func_t hw_rule_channels_by_format;
 	snd_pcm_hw_rule_func_t hw_rule_format_by_channels;
-	struct qmc_dai *qmc_dai;
 	unsigned int frame_bits;
 	int ret;
 
-	qmc_dai = qmc_dai_get_data(dai);
-	if (!qmc_dai) {
-		dev_err(dai->dev, "Invalid dai\n");
-		return -EINVAL;
-	}
-
-	prtd->qmc_dai = qmc_dai;
-
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		hw_rule_channels_by_format = qmc_dai_hw_rule_capture_channels_by_format;
 		hw_rule_format_by_channels = qmc_dai_hw_rule_capture_format_by_channels;
@@ -468,7 +458,7 @@ static int qmc_dai_startup(struct snd_pcm_substream *substream,
 				  hw_rule_channels_by_format, qmc_dai,
 				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
 	if (ret) {
-		dev_err(dai->dev, "Failed to add channels rule (%d)\n", ret);
+		dev_err(qmc_dai->dev, "Failed to add channels rule (%d)\n", ret);
 		return ret;
 	}
 
@@ -476,7 +466,7 @@ static int qmc_dai_startup(struct snd_pcm_substream *substream,
 				  hw_rule_format_by_channels, qmc_dai,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (ret) {
-		dev_err(dai->dev, "Failed to add format rule (%d)\n", ret);
+		dev_err(qmc_dai->dev, "Failed to add format rule (%d)\n", ret);
 		return ret;
 	}
 
@@ -484,13 +474,30 @@ static int qmc_dai_startup(struct snd_pcm_substream *substream,
 					   SNDRV_PCM_HW_PARAM_FRAME_BITS,
 					   frame_bits);
 	if (ret < 0) {
-		dev_err(dai->dev, "Failed to add frame_bits constraint (%d)\n", ret);
+		dev_err(qmc_dai->dev, "Failed to add frame_bits constraint (%d)\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
 
+static int qmc_dai_startup(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct qmc_dai_prtd *prtd = substream->runtime->private_data;
+	struct qmc_dai *qmc_dai;
+
+	qmc_dai = qmc_dai_get_data(dai);
+	if (!qmc_dai) {
+		dev_err(dai->dev, "Invalid dai\n");
+		return -EINVAL;
+	}
+
+	prtd->qmc_dai = qmc_dai;
+
+	return qmc_dai_constraints_interleaved(substream, qmc_dai);
+}
+
 static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
-- 
2.45.0

