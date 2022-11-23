Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90888636633
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 17:52:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CAD416A3;
	Wed, 23 Nov 2022 17:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CAD416A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669222352;
	bh=O0GcEwTkT8XePD/3xcTnn02QXvYwBoPzyUBwq3mamdw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kM+82vEaKGtjcYLIB7gc5/+f7hXU5TVsvLzFfA4CFReKuyk/aEtKaETfMbtnj2baw
	 KcEfyTNcJYWh6Jb2Co0NTMov+T/NvL6ZO5FD+KDsgmwnF7fnqfc/trKWiG/q1DQsaB
	 /F0chO+0d6jAn4SCK4bUtAaZsOx3bvpubjzlPXEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88479F80542;
	Wed, 23 Nov 2022 17:50:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21837F8055B; Wed, 23 Nov 2022 17:49:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB79AF8030F
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 17:49:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB79AF8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qxYJcd8M"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANFYpmU019647; Wed, 23 Nov 2022 10:49:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rH/+UGaS88zKbPAiYzQq0tBcjHz9UiKzuylZ1zucLXI=;
 b=qxYJcd8Mlb7CEDfGvz5dZLPWEIByGIEjp3wd9VbS92cSxAacwjc+pRjJ4cFRrZL7YnAj
 e7x57gD+ujuBXNP6eUopGbEzBLOZ9mEpfErvL+najmtOC5NMNkj4E94VlbAYQMiC+F1t
 8svcJ9T1IrQk8DIPR/+poGdJYOzbW4o3lrAh76RDN7nrUUOkJv1Dv1ZtKo6x7ncnMTT5
 4FYeWEEBCkvblMRr74jfgCzT82n23vUX+syqkHpQaJwgDfdsjAT8eDqEbW/vwvnWKUPI
 cwCSDtxlKG2Y0fI/fD1Karsd9LmLrxpdvpgD/zMeoNdoqrnsRIwhJUcXb+WitSFcxeUG hg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet55fd-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 10:49:41 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 10:49:39 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Wed, 23 Nov 2022 10:49:39 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D33DB477;
 Wed, 23 Nov 2022 16:49:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
Subject: [PATCH v2 8/9] ASoC: rt715: Switch to new snd_sdw_params_to_config
 helper
Date: Wed, 23 Nov 2022 16:49:36 +0000
Message-ID: <20221123164937.594837-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123164937.594837-1-ckeepax@opensource.cirrus.com>
References: <20221123164937.594837-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GL8_LjyVDq5Apbh75S9rEz9mVIvBmg4D
X-Proofpoint-GUID: GL8_LjyVDq5Apbh75S9rEz9mVIvBmg4D
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
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

The conversion from hw_params to SoundWire config is pretty
standard as such most of the conversation can be handled by the new
snd_sdw_params_to_config helper function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Correct spelling error in commit message

 sound/soc/codecs/rt715-sdca.c | 25 ++++++++-----------------
 sound/soc/codecs/rt715.c      | 25 ++++++++-----------------
 2 files changed, 16 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index ce8bbc76199a8..1fca7a3f46eac 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -20,6 +20,7 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
@@ -820,11 +821,10 @@ static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
-	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
 	struct rt715_sdw_stream_data *stream;
-	int retval, port, num_channels;
+	int retval;
 	unsigned int val;
 
 	stream = snd_soc_dai_get_dma_data(dai, substream);
@@ -835,16 +835,16 @@ static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (!rt715->slave)
 		return -EINVAL;
 
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
+
 	switch (dai->id) {
 	case RT715_AIF1:
-		direction = SDW_DATA_DIR_TX;
-		port = 6;
+		port_config.num = 6;
 		rt715_sdca_index_write(rt715, RT715_VENDOR_REG, RT715_SDW_INPUT_SEL,
 			0xa500);
 		break;
 	case RT715_AIF2:
-		direction = SDW_DATA_DIR_TX;
-		port = 4;
+		port_config.num = 4;
 		rt715_sdca_index_write(rt715, RT715_VENDOR_REG, RT715_SDW_INPUT_SEL,
 			0xaf00);
 		break;
@@ -853,15 +853,6 @@ static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	stream_config.frame_rate =  params_rate(params);
-	stream_config.ch_count = params_channels(params);
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	num_channels = params_channels(params);
-	port_config.ch_mask = GENMASK(num_channels - 1, 0);
-	port_config.num = port;
-
 	retval = sdw_stream_add_slave(rt715->slave, &stream_config,
 					&port_config, 1, stream->sdw_stream);
 	if (retval) {
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index e93240521c74e..917a04092da27 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -28,6 +28,7 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
@@ -801,11 +802,10 @@ static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
-	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
 	struct sdw_stream_data *stream;
-	int retval, port, num_channels;
+	int retval;
 	unsigned int val = 0;
 
 	stream = snd_soc_dai_get_dma_data(dai, substream);
@@ -816,15 +816,15 @@ static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (!rt715->slave)
 		return -EINVAL;
 
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
+
 	switch (dai->id) {
 	case RT715_AIF1:
-		direction = SDW_DATA_DIR_TX;
-		port = 6;
+		port_config.num = 6;
 		rt715_index_write(rt715->regmap, RT715_SDW_INPUT_SEL, 0xa500);
 		break;
 	case RT715_AIF2:
-		direction = SDW_DATA_DIR_TX;
-		port = 4;
+		port_config.num = 4;
 		rt715_index_write(rt715->regmap, RT715_SDW_INPUT_SEL, 0xa000);
 		break;
 	default:
@@ -832,15 +832,6 @@ static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	stream_config.frame_rate =  params_rate(params);
-	stream_config.ch_count = params_channels(params);
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	num_channels = params_channels(params);
-	port_config.ch_mask = (1 << (num_channels)) - 1;
-	port_config.num = port;
-
 	retval = sdw_stream_add_slave(rt715->slave, &stream_config,
 					&port_config, 1, stream->sdw_stream);
 	if (retval) {
-- 
2.30.2

