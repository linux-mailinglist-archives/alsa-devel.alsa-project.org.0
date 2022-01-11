Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D648A92A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 09:16:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D936A190B;
	Tue, 11 Jan 2022 09:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D936A190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641888999;
	bh=zfQ3F8yDmAzgg0Iwrr+k64rtQWjsO8HH1AbVrp0Z4oY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PBDdZHEqFlM67mZ12Mg2TIsXB1ys/Ro9yvhcuYaLm73tXEMhfnAcsmNHomyet5fy0
	 IzKdkzKUgpQCnM75TtFnd4Ri6m02ZQpbwcGi1t8LCCBBkHiFeQTfw6sRhlaNcs8wK7
	 7yWl1v2vikWSYYGkluQgLChjePqwFALeD+iJTAcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49305F80430;
	Tue, 11 Jan 2022 09:15:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52720F80302; Tue, 11 Jan 2022 09:15:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 529DEF80054
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 09:15:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 529DEF80054
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1n7CJN-0000A3-D8; Tue, 11 Jan 2022 09:15:21 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1n7CJL-0047bv-6J; Tue, 11 Jan 2022 09:15:19 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_sai: Enable combine mode soft
Date: Tue, 11 Jan 2022 09:15:18 +0100
Message-Id: <20220111081518.982437-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de, Xiubo Li <Xiubo.Lee@gmail.com>
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

The fsl_sai driver calculates the number of pins used and enables
multiple channels if necessary. This means the SAI expects data in
one FIFO per pin. The SDMA engine only services a single FIFO, so
multi pin support doesn't work at all.

This patch enables the software combine mode in chips that support
it. With this the SAI presents only a single FIFO to the outside
and distributes the data into the different FIFOs internally.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 9 +++++++++
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 10544fa27dc0..cab015d96889 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -517,6 +517,10 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 				   FSL_SAI_CR5_FBT_MASK, val_cr5);
 	}
 
+	if (sai->soc_data->pins > 1)
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
+				   FSL_SAI_CR4_FCOMB_MASK, FSL_SAI_CR4_FCOMB_SOFT);
+
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
 			   FSL_SAI_CR3_TRCE_MASK,
 			   FSL_SAI_CR3_TRCE((1 << pins) - 1));
@@ -1195,6 +1199,7 @@ static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.use_imx_pcm = false,
 	.use_edma = false,
 	.fifo_depth = 32,
+	.pins = 1,
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
@@ -1204,6 +1209,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.use_imx_pcm = true,
 	.use_edma = false,
 	.fifo_depth = 32,
+	.pins = 1,
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = true,
 	.flags = 0,
@@ -1213,6 +1219,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
 	.use_imx_pcm = true,
 	.use_edma = false,
 	.fifo_depth = 16,
+	.pins = 2,
 	.reg_offset = 8,
 	.mclk0_is_mclk1 = false,
 	.flags = PMQOS_CPU_LATENCY,
@@ -1222,6 +1229,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
 	.use_imx_pcm = true,
 	.use_edma = false,
 	.fifo_depth = 128,
+	.pins = 8,
 	.reg_offset = 8,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
@@ -1231,6 +1239,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
 	.use_imx_pcm = true,
 	.use_edma = true,
 	.fifo_depth = 64,
+	.pins = 1,
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 9aaf231bc024..410f6e6a9137 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -223,6 +223,7 @@ struct fsl_sai_soc_data {
 	bool use_edma;
 	bool mclk0_is_mclk1;
 	unsigned int fifo_depth;
+	unsigned int pins;
 	unsigned int reg_offset;
 	unsigned int flags;
 };
-- 
2.30.2

