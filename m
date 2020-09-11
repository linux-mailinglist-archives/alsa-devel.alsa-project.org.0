Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163A265B34
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 10:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B781690;
	Fri, 11 Sep 2020 10:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B781690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599811848;
	bh=7iXQurqdmnj5JgTv3so0/9ESqJL99OpKAYLbxFsmjzc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NMTylDJTPGbk/GJdFoSWgJa2p9m4wWOmu/LDTXYb6MgRjWVOQpW4JU9OVsXOwscY/
	 L965IceKbNbzIs3SkDhigz2zmHVWjtnXIY8ZvDKp+3Vb8R6wAYAK4dZwM9dnbZWUH8
	 vxXMDRXNcNFiOtY2OcD+4IC+zh/snQaUKhIO+RxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60716F802C4;
	Fri, 11 Sep 2020 10:08:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46977F802C3; Fri, 11 Sep 2020 10:08:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11DC7F80115
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 10:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11DC7F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="PgwEQbpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=6557; q=dns/txt; s=axis-central1;
 t=1599811692; x=1631347692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eO+zTlfW52CayMzwiMc5LkDQ62LE8ZAr9cOy6EuS3R8=;
 b=PgwEQbpRoDyP33l0gHssNl6N2uC8rK3tQjrMfRjY/DXyOJ5I1RGd3Qrj
 e709I/+VT4TXXNxFT5FyW65BZDhOh6xogTn7bbDVdv41W65D5Hr5tx5zO
 JcdCbbpmnM0YW9knKNZwyf6nmRFB9M2iiE7+t2QcnP2viaMR5UwAt/QDG
 5eeGQ7Vh0kMiy4552J0jdNscOzRfpfdswAfV9kamBhT9mc4WXilIOJUBY
 fxXPOrj6wUjuXqSL7KDNT02HqlY2mlYmUj5VYuD0jKn3Ef7upNk8mbfwu
 PYSQPDKSDdRuywYQ34xefLXRZ9+BhWpfFf1lGrPEHDzq+TMhtPSL8VC+m A==;
IronPort-SDR: c5MZVV8Z0QXbTjZzPNPTzZ9iQdkR1ZZQ1NZus8kUuW3rRy8FxVoNVQFf0n4qxRiWrP7Ggf/3SC
 hYuCM6nxPiLlN6l8Dl8vArS8w9tPX2zDaMHyiWIBH4SolCaO+BeI2Ned9kp589UO4K2Qzxcwi7
 huxj/DKWJpvNqYwMH2s8t9Lx9Mw5xdNiL3W7qxNEGD17ilqflsFoaykR/yCkFttVx++85anpr6
 vUC5m+g/CMvthZufMVrlnk4xW+EF4AlMWrQOo96lq6S2y2a28vNjZ+IF3MMAOWzofhVCDgxsd/
 MLg=
X-IronPort-AV: E=Sophos;i="5.76,414,1592863200"; d="scan'208";a="12818407"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <dmurphy@ti.com>
Subject: [PATCH v2 3/3] ASoC: tlv320adcx140: Add proper support for master mode
Date: Fri, 11 Sep 2020 10:07:53 +0200
Message-ID: <20200911080753.30342-3-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911080753.30342-1-camel.guo@axis.com>
References: <20200911080753.30342-1-camel.guo@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

From: Camel Guo <camelg@axis.com>

Add setup of bclk-to-ws ratio and sample rate when in master mode,
as well as MCLK input pin setup.

Signed-off-by: Camel Guo <camelg@axis.com>
---
 v2:
  - Move GPIO setting into devicetree
  - Move master config register setting into a new function

 sound/soc/codecs/tlv320adcx140.c | 139 ++++++++++++++++++++++++++++++-
 sound/soc/codecs/tlv320adcx140.h |  27 ++++++
 2 files changed, 162 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 97f16fbba441..685f5fd8b537 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -35,6 +35,7 @@ struct adcx140_priv {
 	unsigned int dai_fmt;
 	unsigned int tdm_delay;
 	unsigned int slot_width;
+	bool master;
 };
 
 static const char * const gpo_config_names[] = {
@@ -651,11 +652,136 @@ static int adcx140_reset(struct adcx140_priv *adcx140)
 	return ret;
 }
 
+static int adcx140_fs_bclk_ratio(unsigned int bclk_ratio)
+{
+	switch (bclk_ratio) {
+	case 16:
+		return ADCX140_RATIO_16;
+	case 24:
+		return ADCX140_RATIO_24;
+	case 32:
+		return ADCX140_RATIO_32;
+	case 48:
+		return ADCX140_RATIO_48;
+	case 64:
+		return ADCX140_RATIO_64;
+	case 96:
+		return ADCX140_RATIO_96;
+	case 128:
+		return ADCX140_RATIO_128;
+	case 192:
+		return ADCX140_RATIO_192;
+	case 256:
+		return ADCX140_RATIO_256;
+	case 384:
+		return ADCX140_RATIO_384;
+	case 512:
+		return ADCX140_RATIO_512;
+	case 1024:
+		return ADCX140_RATIO_1024;
+	case 2048:
+		return ADCX140_RATIO_2048;
+	default:
+		break;
+	}
+	return -EINVAL;
+}
+
+static int adcx140_fs_rate(unsigned int rate)
+{
+	switch (rate) {
+	case 7350:
+	case 8000:
+		return ADCX140_8_OR_7_35KHZ;
+	case 14700:
+	case 16000:
+		return ADCX140_16_OR_14_7KHZ;
+	case 22050:
+	case 24000:
+		return ADCX140_24_OR_22_05KHZ;
+	case 29400:
+	case 32000:
+		return ADCX140_32_OR_29_4KHZ;
+	case 44100:
+	case 48000:
+		return ADCX140_48_OR_44_1KHZ;
+	case 88200:
+	case 96000:
+		return ADCX140_96_OR_88_2KHZ;
+	case 176400:
+	case 192000:
+		return ADCX140_192_OR_176_4KHZ;
+	case 352800:
+	case 384000:
+		return ADCX140_384_OR_352_8KHZ;
+	case 705600:
+	case 768000:
+		return ADCX140_768_OR_705_6KHZ;
+	default:
+		break;
+	}
+	return -EINVAL;
+}
+
+static int adcx140_setup_master_config(struct snd_soc_component *component,
+				       struct snd_pcm_hw_params *params)
+{
+	int ret = 0;
+	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
+
+	if (adcx140->master) {
+		u8 mst_cfg1 = 0;
+		u8 mst_cfg0 = 0;
+		unsigned int bclk_ratio;
+
+		mst_cfg0 = ADCX140_BCLK_FSYNC_MASTER;
+		if (params_rate(params) % 1000)
+			mst_cfg0 |= ADCX140_FSYNCINV_BIT; /* 44.1 kHz et al */
+
+		ret = adcx140_fs_rate(params_rate(params));
+		if (ret < 0) {
+			dev_err(adcx140->dev, "%s: Unsupported rate %d\n",
+					__func__, params_rate(params));
+			return ret;
+		}
+		mst_cfg1 |= ret;
+
+		/* In slave mode when using automatic clock configuration,
+		 * the codec figures out the BCLK to FSYNC ratio itself. But
+		 * here in master mode, we need to tell it.
+		 */
+
+		bclk_ratio = snd_soc_params_to_frame_size(params);
+		ret = adcx140_fs_bclk_ratio(bclk_ratio);
+		if (ret < 0) {
+			dev_err(adcx140->dev, "%s: Unsupported bclk_ratio %d\n",
+					__func__, bclk_ratio);
+			return ret;
+		}
+		mst_cfg1 |= ret;
+
+		snd_soc_component_update_bits(component, ADCX140_MST_CFG1,
+				ADCX140_FS_RATE_MSK |
+				ADCX140_RATIO_MSK,
+				mst_cfg1);
+
+		snd_soc_component_update_bits(component, ADCX140_MST_CFG0,
+				ADCX140_FSYNCINV_BIT |
+				ADCX140_BCLK_FSYNC_MASTER,
+				mst_cfg0);
+
+	}
+
+	return ret;
+}
+
+
 static int adcx140_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	int ret = 0;
 	u8 data = 0;
 
 	switch (params_width(params)) {
@@ -677,6 +803,13 @@ static int adcx140_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	ret = adcx140_setup_master_config(component, params);
+	if (ret < 0) {
+		dev_err(component->dev, "%s: Failed to set up master config\n",
+			__func__);
+		return ret;
+	}
+
 	snd_soc_component_update_bits(component, ADCX140_ASI_CFG0,
 			    ADCX140_WORD_LEN_MSK, data);
 
@@ -689,16 +822,16 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	struct snd_soc_component *component = codec_dai->component;
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
 	u8 iface_reg1 = 0;
-	u8 iface_reg2 = 0;
 	int offset = 0;
 	int width = adcx140->slot_width;
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBM_CFM:
-		iface_reg2 |= ADCX140_BCLK_FSYNC_MASTER;
+		adcx140->master = true;
 		break;
 	case SND_SOC_DAIFMT_CBS_CFS:
+		adcx140->master = false;
 		break;
 	case SND_SOC_DAIFMT_CBS_CFM:
 	case SND_SOC_DAIFMT_CBM_CFS:
@@ -751,8 +884,6 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
 				      ADCX140_BCLKINV_BIT |
 				      ADCX140_ASI_FORMAT_MSK,
 				      iface_reg1);
-	snd_soc_component_update_bits(component, ADCX140_MST_CFG0,
-				      ADCX140_BCLK_FSYNC_MASTER, iface_reg2);
 
 	/* Configure data offset */
 	snd_soc_component_update_bits(component, ADCX140_ASI_CFG1,
diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index 96f067e65e2a..1fbb7fa3c73d 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -149,4 +149,31 @@
 #define ADCX140_GPIO_CFG_MAX		15
 #define ADCX140_GPIO_DRV_MAX		5
 
+/* MST_CFG1 */
+#define ADCX140_8_OR_7_35KHZ	(0 << 4)
+#define ADCX140_16_OR_14_7KHZ	(1 << 4)
+#define ADCX140_24_OR_22_05KHZ	(2 << 4)
+#define ADCX140_32_OR_29_4KHZ	(3 << 4)
+#define ADCX140_48_OR_44_1KHZ	(4 << 4)
+#define ADCX140_96_OR_88_2KHZ	(5 << 4)
+#define ADCX140_192_OR_176_4KHZ	(6 << 4)
+#define ADCX140_384_OR_352_8KHZ	(7 << 4)
+#define ADCX140_768_OR_705_6KHZ	(8 << 4)
+#define ADCX140_FS_RATE_MSK	GENMASK(7, 4)
+
+#define ADCX140_RATIO_16	0
+#define ADCX140_RATIO_24	1
+#define ADCX140_RATIO_32	2
+#define ADCX140_RATIO_48	3
+#define ADCX140_RATIO_64	4
+#define ADCX140_RATIO_96	5
+#define ADCX140_RATIO_128	6
+#define ADCX140_RATIO_192	7
+#define ADCX140_RATIO_256	8
+#define ADCX140_RATIO_384	9
+#define ADCX140_RATIO_512	10
+#define ADCX140_RATIO_1024	11
+#define ADCX140_RATIO_2048	12
+#define ADCX140_RATIO_MSK	GENMASK(3, 0)
+
 #endif /* _TLV320ADCX140_ */
-- 
2.20.1

