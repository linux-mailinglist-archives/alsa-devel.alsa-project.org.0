Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7DB58CA3D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 16:14:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5098282B;
	Mon,  8 Aug 2022 16:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5098282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659968097;
	bh=zz/nQe6E0Bs+iFNB36fUWBSqp08YicjyNdp4NnxDxbQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HD3xGcem5+X9GMes49N18hOk5SQPv8itUOw1bWCOziR5lWBC2Q3dq5shK718dW+/Z
	 g3CPkAcyOekEyICLnCXxpf9uZH+/xUGgyP3AzrsazeCfbYb88JW99MPj9ccSD3MWc6
	 OBPOBwcNYkyXlK+FPFiT5R4RWBuvbIdAt344Td1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F26F80507;
	Mon,  8 Aug 2022 16:13:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F00FF8012B; Mon,  8 Aug 2022 16:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,RDNS_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5205F8012B
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 16:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5205F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="eW9gGOFo"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1659968028; bh=ib8r/AIaYsAtqmifxmdDYYXoFfRn3JeYUHoc/D5TFUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eW9gGOFo44UUq67FI8Mu6BGtibqGBZpNhNXfQKXXXuTt0PTUARFcfL3FeLR+5fi5S
 f/5zjGOnMQ9AqKGTuyftEWhBTiYa8ebymuU3j/o8X42gfOYptboHGz+RKO/T/Yaj74
 BCdbnvx8VhMteB6qdcyR8RAjviiFCuTIOMz2fgGI=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/4] ASoC: tas2770: Set correct FSYNC polarity
Date: Mon,  8 Aug 2022 16:12:43 +0200
Message-Id: <20220808141246.5749-2-povik+lin@cutebit.org>
In-Reply-To: <20220808141246.5749-1-povik+lin@cutebit.org>
References: <20220808141246.5749-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 linux-kernel@vger.kernel.org, Frank Shi <shifu0704@thundersoft.com>,
 asahi@lists.linux.dev,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

Fix setting of FSYNC polarity for DAI formats other than I2S. Also
add support for polarity inversion.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2770.c | 20 +++++++++++++++++++-
 sound/soc/codecs/tas2770.h |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index c1dbd978d550..10b64d5ba756 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -337,7 +337,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
+	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
@@ -349,9 +349,15 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_IF:
+		invert_fpol = 1;
+		fallthrough;
 	case SND_SOC_DAIFMT_NB_NF:
 		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_RSING;
 		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		invert_fpol = 1;
+		fallthrough;
 	case SND_SOC_DAIFMT_IB_NF:
 		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_FALING;
 		break;
@@ -369,15 +375,19 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		tdm_rx_start_slot = 1;
+		fpol_preinv = 0;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
 		tdm_rx_start_slot = 0;
+		fpol_preinv = 1;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
 		tdm_rx_start_slot = 1;
+		fpol_preinv = 1;
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		tdm_rx_start_slot = 0;
+		fpol_preinv = 1;
 		break;
 	default:
 		dev_err(tas2770->dev,
@@ -391,6 +401,14 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	if (ret < 0)
 		return ret;
 
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+					    TAS2770_TDM_CFG_REG0_FPOL_MASK,
+					    (fpol_preinv ^ invert_fpol)
+					     ? TAS2770_TDM_CFG_REG0_FPOL_RSING
+					     : TAS2770_TDM_CFG_REG0_FPOL_FALING);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index d156666bcc55..d51e88d8c338 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -41,6 +41,9 @@
 #define TAS2770_TDM_CFG_REG0_31_44_1_48KHZ  0x6
 #define TAS2770_TDM_CFG_REG0_31_88_2_96KHZ  0x8
 #define TAS2770_TDM_CFG_REG0_31_176_4_192KHZ  0xa
+#define TAS2770_TDM_CFG_REG0_FPOL_MASK  BIT(0)
+#define TAS2770_TDM_CFG_REG0_FPOL_RSING  0
+#define TAS2770_TDM_CFG_REG0_FPOL_FALING  1
     /* TDM Configuration Reg1 */
 #define TAS2770_TDM_CFG_REG1  TAS2770_REG(0X0, 0x0B)
 #define TAS2770_TDM_CFG_REG1_MASK	GENMASK(5, 1)
-- 
2.33.0

