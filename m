Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA67427FE
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 16:12:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B26083A;
	Thu, 29 Jun 2023 16:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B26083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688047945;
	bh=b8dXG8qqAmEn+KZIa3/idP8bhKO1odtgGPWglSAm2nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TS4UpaP/+G0ouoTPhWbrn7lqetaki7PyYSDmh6wRvwxQch3ZjQZyrqHu6/nDGP7Tx
	 kf/sqGyMCRg18HWemHCoY0wtv6hFswGsYn2CURXj8Fy7ixGWSTVOpEG2GmE/oY4Pjs
	 oDf8P+kfiruxK78k3wUtZHxrKnqbE0tcWlLKcSPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48F2DF80557; Thu, 29 Jun 2023 16:10:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF195F80548;
	Thu, 29 Jun 2023 16:10:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98802F8027B; Thu, 29 Jun 2023 16:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B922F80246
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 16:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B922F80246
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1qEsM0-0004bc-EC; Thu, 29 Jun 2023 16:10:36 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1qEsLz-00AvCr-Nq; Thu, 29 Jun 2023 16:10:35 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1qEsLy-00BC2x-Vm; Thu, 29 Jun 2023 16:10:34 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 2/2] ASoC: fsl_sai: Fill Tx FIFO to avoid initial underruns
Date: Thu, 29 Jun 2023 16:10:34 +0200
Message-Id: <20230629141034.2659669-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629141034.2659669-1-s.hauer@pengutronix.de>
References: <20230629141034.2659669-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 7OGEN474P7BVJSJK4MPQMZCTEV5Z2RNE
X-Message-ID-Hash: 7OGEN474P7BVJSJK4MPQMZCTEV5Z2RNE
X-MailFrom: sha@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OGEN474P7BVJSJK4MPQMZCTEV5Z2RNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

JACK handles XRuns by stopping and start the ALSA device. On occasion,
this leads to early underruns on start leading to reorderd output
channels.

By filling the FIFO initially, we can avoid these early underruns.
This is also suggested by the i.MX8MM reference manual:

  "If the Transmit FIFO is empty, then to avoid a FIFO underrun, the
  Transmit Data Register must be written at least 3 bit clocks before
  the start of the next unmasked word. Before enabling the transmitter,
  the Transmit FIFO should be initialized with data (since after the
  transmitter is enabled, the transmitter will start a new frame, and
  if no data is in the FIFO, then the transmitter will immediately give
  an error)"

[1]: Rev. 0, 02/2019, 13.9.3.5.2 FIFO pointers
Fixes: 435508214942 ("ASoC: Add SAI SoC Digital Audio Interface driver.")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Notes:
    Changes since v1:
    - Add missing Signed-off-by

 sound/soc/fsl/fsl_sai.c | 18 ++++++++++++++++++
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 36f6115469843..6a4f990110d91 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -755,6 +755,21 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 	}
 }
 
+static void fsl_sai_tx_fill_fifo(struct fsl_sai *sai,
+				 struct snd_pcm_runtime *runtime)
+{
+	u32 slots, slot_width, pins;
+	int i;
+
+	slot_width = sai->slot_width ?: snd_pcm_format_physical_width(runtime->format);
+
+	slots = fsl_sai_get_tdm_slots(sai, runtime->channels, slot_width);
+	pins = DIV_ROUND_UP(runtime->channels, slots);
+
+	for (i = 0; i < runtime->channels; i++)
+		regmap_write(sai->regmap, FSL_SAI_TDR(i % pins), 0x0);
+}
+
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		struct snd_soc_dai *cpu_dai)
 {
@@ -784,6 +799,9 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/* Fill FIFO to avoid initial underruns */
+		if (tx)
+			fsl_sai_tx_fill_fifo(sai, substream->runtime);
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
 
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index a53c4f0e25faf..66a136d97a441 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -34,6 +34,7 @@
 #define FSL_SAI_TDR5	0x34 /* SAI Transmit Data 5 */
 #define FSL_SAI_TDR6	0x38 /* SAI Transmit Data 6 */
 #define FSL_SAI_TDR7	0x3C /* SAI Transmit Data 7 */
+#define FSL_SAI_TDR(ofs)	(FSL_SAI_TDR0 + (ofs) * 4)
 #define FSL_SAI_TFR0	0x40 /* SAI Transmit FIFO 0 */
 #define FSL_SAI_TFR1	0x44 /* SAI Transmit FIFO 1 */
 #define FSL_SAI_TFR2	0x48 /* SAI Transmit FIFO 2 */
-- 
2.39.2

