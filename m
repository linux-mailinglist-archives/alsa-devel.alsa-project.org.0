Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3937D1055
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 15:14:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92207A4E;
	Fri, 20 Oct 2023 15:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92207A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697807662;
	bh=k1D8WfaGfwDPsgq9XEp5Hau9khZ3xMJakIVchT5Lz7s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rnx1qtmLI/LjDswJqYtxw1miXOuFf1o0LDa8HesGEcP3y7KFeOI/wP3RizbCiPEjH
	 V3jOumlgbCPh4j4uZ8ZFgGFkEptIClmpnEyl/ZjgakeYNXS8bvzgnMTDX0slHzTtJo
	 ALGdKe03hqsKtWCfVGB33ZGCQPJagMmalqRUNfOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26315F805A1; Fri, 20 Oct 2023 15:12:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB02F80589;
	Fri, 20 Oct 2023 15:12:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24E61F80553; Fri, 20 Oct 2023 11:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id 16546F8024E
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 11:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16546F8024E
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1461492:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Fri, 20 Oct 2023 17:50:37 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 20 Oct
 2023 17:50:36 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Fri, 20 Oct 2023 17:50:36 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, ChiYuan Huang <cy_huang@richtek.com>, Allen
 Lin <allen_lin@richtek.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] ASoC: codecs: rtq9128: Fix TDM enable and DAI format
 control flow
Date: Fri, 20 Oct 2023 17:50:34 +0800
Message-ID: <1697795435-5858-3-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1697795435-5858-1-git-send-email-cy_huang@richtek.com>
References: <1697795435-5858-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=165218EEE3=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: U4BD2XFQWAW3EKIHPBF734XWKROHJFZN
X-Message-ID-Hash: U4BD2XFQWAW3EKIHPBF734XWKROHJFZN
X-Mailman-Approved-At: Fri, 20 Oct 2023 13:12:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4BD2XFQWAW3EKIHPBF734XWKROHJFZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

To enable TDM mode, the current control flow limits the function
calling order should be 'set_tdm_slot->set_dai_fmt'. But not all
platform sound card like as simeple card to follow this design.
To bypass this limit, adjust the DAI format setting in runtime
'hw_param' callback.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rtq9128.c | 67 ++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 8c1c3c65475e..8a61a8a32db1 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -59,6 +59,7 @@
 
 struct rtq9128_data {
 	struct gpio_desc *enable;
+	unsigned int daifmt;
 	int tdm_slots;
 	int tdm_slot_width;
 	bool tdm_input_data2_select;
@@ -437,10 +438,7 @@ static const struct snd_soc_component_driver rtq9128_comp_driver = {
 static int rtq9128_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct rtq9128_data *data = snd_soc_dai_get_drvdata(dai);
-	struct snd_soc_component *comp = dai->component;
 	struct device *dev = dai->dev;
-	unsigned int audfmt, fmtval;
-	int ret;
 
 	dev_dbg(dev, "%s: fmt 0x%8x\n", __func__, fmt);
 
@@ -450,35 +448,10 @@ static int rtq9128_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	fmtval = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
-	if (data->tdm_slots && fmtval != SND_SOC_DAIFMT_DSP_A && fmtval != SND_SOC_DAIFMT_DSP_B) {
-		dev_err(dev, "TDM is used, format only support DSP_A or DSP_B\n");
-		return -EINVAL;
-	}
+	/* Store here and will be used in runtime hw_params for DAI format setting */
+	data->daifmt = fmt;
 
-	switch (fmtval) {
-	case SND_SOC_DAIFMT_I2S:
-		audfmt = 8;
-		break;
-	case SND_SOC_DAIFMT_LEFT_J:
-		audfmt = 9;
-		break;
-	case SND_SOC_DAIFMT_RIGHT_J:
-		audfmt = 10;
-		break;
-	case SND_SOC_DAIFMT_DSP_A:
-		audfmt = data->tdm_slots ? 12 : 11;
-		break;
-	case SND_SOC_DAIFMT_DSP_B:
-		audfmt = data->tdm_slots ? 4 : 3;
-		break;
-	default:
-		dev_err(dev, "Unsupported format 0x%8x\n", fmt);
-		return -EINVAL;
-	}
-
-	ret = snd_soc_component_write_field(comp, RTQ9128_REG_I2S_OPT, RTQ9128_AUDFMT_MASK, audfmt);
-	return ret < 0 ? ret : 0;
+	return 0;
 }
 
 static int rtq9128_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
@@ -554,10 +527,38 @@ static int rtq9128_dai_hw_params(struct snd_pcm_substream *stream, struct snd_pc
 	unsigned int width, slot_width, bitrate, audbit, dolen;
 	struct snd_soc_component *comp = dai->component;
 	struct device *dev = dai->dev;
+	unsigned int fmtval, audfmt;
 	int ret;
 
 	dev_dbg(dev, "%s: width %d\n", __func__, params_width(param));
 
+	fmtval = FIELD_GET(SND_SOC_DAIFMT_FORMAT_MASK, data->daifmt);
+	if (data->tdm_slots && fmtval != SND_SOC_DAIFMT_DSP_A && fmtval != SND_SOC_DAIFMT_DSP_B) {
+		dev_err(dev, "TDM is used, format only support DSP_A or DSP_B\n");
+		return -EINVAL;
+	}
+
+	switch (fmtval) {
+	case SND_SOC_DAIFMT_I2S:
+		audfmt = 8;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		audfmt = 9;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		audfmt = 10;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		audfmt = data->tdm_slots ? 12 : 11;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		audfmt = data->tdm_slots ? 4 : 3;
+		break;
+	default:
+		dev_err(dev, "Unsupported format 0x%8x\n", fmtval);
+		return -EINVAL;
+	}
+
 	switch (width = params_width(param)) {
 	case 16:
 		audbit = 0;
@@ -611,6 +612,10 @@ static int rtq9128_dai_hw_params(struct snd_pcm_substream *stream, struct snd_pc
 		return -EINVAL;
 	}
 
+	ret = snd_soc_component_write_field(comp, RTQ9128_REG_I2S_OPT, RTQ9128_AUDFMT_MASK, audfmt);
+	if (ret < 0)
+		return ret;
+
 	ret = snd_soc_component_write_field(comp, RTQ9128_REG_I2S_OPT, RTQ9128_AUDBIT_MASK, audbit);
 	if (ret < 0)
 		return ret;
-- 
2.34.1

