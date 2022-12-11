Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018C649206
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Dec 2022 03:42:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A689423B9;
	Sun, 11 Dec 2022 03:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A689423B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670726542;
	bh=/WZiT1Nes+cN6ffpo7TFDqN/FWw3HNMpUzzHGYYOY8Y=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TmPUguI7aYFAxrxXzJk3ABvrm1KWb8G96Et93q8kH/NbBd3Mb+E1pWWjIw25f4o4o
	 +f2ULsdYAdsE8fnBYIby9goU7F/XjC4LGWnJYmV3Ngt5YVoIqRN3iTExPH0S8Izlx0
	 zSB03ar4z8AV5DbROqgwp9p+EvyijKWgANYTB6bE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A21F80165;
	Sun, 11 Dec 2022 03:41:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD790F80507; Sun, 11 Dec 2022 03:41:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C06FF8027B
 for <alsa-devel@alsa-project.org>; Sun, 11 Dec 2022 03:41:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C06FF8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=yWWIAPgj
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1392A852FB;
 Sun, 11 Dec 2022 03:41:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670726481;
 bh=SOg9hgv2RLEU7soc1FT7P2rV7QjD4+ysnAYkPyulc1M=;
 h=From:To:Cc:Subject:Date:From;
 b=yWWIAPgjY4lCOleXX0EbkBym57jOAeW839cZ8QHyCff3ZKp5gLd/PylLAOPB0oTDM
 eBjMYIVVazT1OeU0QsiOKYajomFuiXbHlIP9uCpvy4E1NBDV1zIsY0HVqVJbF6tW+5
 KVHmJM6nAYEBDouAqe/AAEnbq/Q+qfR146Ns0pTArphg4MJbrfLyPh+yw2edejvjU4
 ps43SCp6SseYZyG569GhekjNVDhERp5M97L22aF188ii5rWwYB7w8uBDnMg7/Q4WFi
 CeI+dwU2t4HR0Sq9WPSDdoHhbEI6tddV62s0aBXta6WtiNT+JPN2B09BIBD9BqRFsz
 CQDZNR8kNCAnw==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: fsl_sai: Factor out SAI reset
Date: Sun, 11 Dec 2022 03:41:08 +0100
Message-Id: <20221211024109.671538-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Marek Vasut <marex@denx.de>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The driver performs SAI reset in three places, factor the reset handling
into single function to avoid duplication. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
To: alsa-devel@alsa-project.org
---
 sound/soc/fsl/fsl_sai.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 1c9be8a5dcb13..ade5a6b44b66a 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -704,6 +704,21 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static void fsl_sai_reset(struct fsl_sai *sai, bool rx, bool tx)
+{
+	unsigned int ofs = sai->soc_data->reg_offset;
+
+	if (tx)
+		regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
+	if (rx)
+		regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
+	usleep_range(1000, 2000);
+	if (tx)
+		regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
+	if (rx)
+		regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
+}
+
 static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 {
 	unsigned int ofs = sai->soc_data->reg_offset;
@@ -729,12 +744,8 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 	 * This is a hardware bug, and will be fix in the
 	 * next sai version.
 	 */
-	if (!sai->is_consumer_mode) {
-		/* Software Reset */
-		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
-		/* Clear SR bit to finish the reset */
-		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
-	}
+	if (!sai->is_consumer_mode)
+		fsl_sai_reset(sai, dir == RX, dir == TX);
 }
 
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -863,12 +874,7 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	struct fsl_sai *sai = dev_get_drvdata(cpu_dai->dev);
 	unsigned int ofs = sai->soc_data->reg_offset;
 
-	/* Software Reset for both Tx and Rx */
-	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
-	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
-	/* Clear SR bit to finish the reset */
-	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
+	fsl_sai_reset(sai, true, true);
 
 	regmap_update_bits(sai->regmap, FSL_SAI_TCR1(ofs),
 			   FSL_SAI_CR1_RFW_MASK(sai->soc_data->fifo_depth),
@@ -1632,7 +1638,6 @@ static int fsl_sai_runtime_suspend(struct device *dev)
 static int fsl_sai_runtime_resume(struct device *dev)
 {
 	struct fsl_sai *sai = dev_get_drvdata(dev);
-	unsigned int ofs = sai->soc_data->reg_offset;
 	int ret;
 
 	ret = clk_prepare_enable(sai->bus_clk);
@@ -1658,11 +1663,8 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	regcache_cache_only(sai->regmap, false);
 	regcache_mark_dirty(sai->regmap);
-	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
-	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
-	usleep_range(1000, 2000);
-	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
+
+	fsl_sai_reset(sai, true, true);
 
 	ret = regcache_sync(sai->regmap);
 	if (ret)
-- 
2.35.1

