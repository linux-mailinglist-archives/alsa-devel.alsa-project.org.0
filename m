Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B98FC67EB9A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:53:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66316E84;
	Fri, 27 Jan 2023 17:52:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66316E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674838399;
	bh=O70BN066NXanXFdKIm70BwR5oQtspYkacWfkA5h7hYE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k9dYrBVWZ92u2nLLLgQ+sNjXjmiyoNQ8Mcp3s7x/QN//2vtcFSaMGaIpX/tc2nKJt
	 9ufXeRksk7WIpAIKPTkQCBs8XB0WiQHAy3PEoeOfk+8c+Lvzahpb1M8lA2FPz2fKdJ
	 qjBM5R82KmgirMB1Erp3KP/sxuNQweE9rL/2aVuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43316F80543;
	Fri, 27 Jan 2023 17:51:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D66E5F80224; Fri, 27 Jan 2023 17:51:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EA8CF80224
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:51:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EA8CF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=EIRhEgaJ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30R9k8LP030633; Fri, 27 Jan 2023 10:51:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=gzww93MA3M79V6JYJ0KSkJ/wBLiBFaVv6r0gK+hWsXw=;
 b=EIRhEgaJzWmHA5zR66SR2EivoiTvbu5HCfUR7KZUZF7clFQBcv7jJGGSS9Fk/GfqAtD/
 OcZmegfmh5bC8RKPueKjJFAURrEd7+3nj0r5p1DiegppKnqj50MPdktLOZMYxV0qgQ6+
 +sATVnPN+4tEk6g0GyRsxaIWh7uDQMS9v0d03JyDslDHpf38awUHnISDLYeTTrDF9Zsh
 z50lTH2EjbaWaA/KOGgRWdHZH/7Kn9+eU1YFxiHrtPXQTlZYivXW3RvarMRDLmRB/+UJ
 cI8KYh2oyLU5fEMbetsvI/3aVclUvjKrU1ZxQItoj1c9hZCcyxeHFyScIIFYH2UTWNdQ Tw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n8dbsvrd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 10:51:30 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 27 Jan
 2023 10:51:29 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Fri, 27 Jan 2023 10:51:29 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 05A7311D6;
 Fri, 27 Jan 2023 16:51:29 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 5/8] ASoC: cs42l42: Export some functions for SoundWire
Date: Fri, 27 Jan 2023 16:51:08 +0000
Message-ID: <20230127165111.3010960-6-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MWrLG6xNTkMsmJ1yAyy9tnEMFXowVR19
X-Proofpoint-GUID: MWrLG6xNTkMsmJ1yAyy9tnEMFXowVR19
X-Proofpoint-Spam-Reason: safe
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Export functions that will be needed by a SoundWire module.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 14 +++++++++-----
 sound/soc/codecs/cs42l42.h |  5 +++++
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index d81c6eb1c1e59..cefefd7061689 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -653,8 +653,8 @@ static const struct cs42l42_pll_params pll_ratio_table[] = {
 	{ 24576000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12288000, 128, 1}
 };
 
-static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk,
-			      unsigned int sample_rate)
+int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk,
+		       unsigned int sample_rate)
 {
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	int i;
@@ -740,8 +740,9 @@ static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int
 
 	return -EINVAL;
 }
+EXPORT_SYMBOL_NS_GPL(cs42l42_pll_config, SND_SOC_CS42L42_CORE);
 
-static void cs42l42_src_config(struct snd_soc_component *component, unsigned int sample_rate)
+void cs42l42_src_config(struct snd_soc_component *component, unsigned int sample_rate)
 {
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	unsigned int fs;
@@ -773,6 +774,7 @@ static void cs42l42_src_config(struct snd_soc_component *component, unsigned int
 				      CS42L42_CLK_OASRC_SEL_MASK,
 				      fs << CS42L42_CLK_OASRC_SEL_SHIFT);
 }
+EXPORT_SYMBOL_NS_GPL(cs42l42_src_config, SND_SOC_CS42L42_CORE);
 
 static int cs42l42_asp_config(struct snd_soc_component *component,
 			      unsigned int sclk, unsigned int sample_rate)
@@ -1013,7 +1015,7 @@ static int cs42l42_set_bclk_ratio(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
@@ -1106,6 +1108,7 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(cs42l42_mute_stream, SND_SOC_CS42L42_CORE);
 
 #define CS42L42_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE |\
@@ -1648,7 +1651,7 @@ static const struct cs42l42_irq_params irq_params_table[] = {
 		CS42L42_TSRS_PLUG_VAL_MASK}
 };
 
-static irqreturn_t cs42l42_irq_thread(int irq, void *data)
+irqreturn_t cs42l42_irq_thread(int irq, void *data)
 {
 	struct cs42l42_private *cs42l42 = (struct cs42l42_private *)data;
 	unsigned int stickies[12];
@@ -1765,6 +1768,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, SND_SOC_CS42L42_CORE);
 
 static void cs42l42_set_interrupt_masks(struct cs42l42_private *cs42l42)
 {
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 17aab06adc8e6..ef8219f489100 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -61,6 +61,11 @@ extern struct snd_soc_dai_driver cs42l42_dai;
 bool cs42l42_readable_register(struct device *dev, unsigned int reg);
 bool cs42l42_volatile_register(struct device *dev, unsigned int reg);
 
+int cs42l42_pll_config(struct snd_soc_component *component,
+		       unsigned int clk, unsigned int sample_rate);
+void cs42l42_src_config(struct snd_soc_component *component, unsigned int sample_rate);
+int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream);
+irqreturn_t cs42l42_irq_thread(int irq, void *data);
 int cs42l42_suspend(struct device *dev);
 int cs42l42_resume(struct device *dev);
 void cs42l42_resume_restore(struct device *dev);
-- 
2.34.1

