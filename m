Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC77632442
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 14:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B8E31662;
	Mon, 21 Nov 2022 14:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B8E31662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669038566;
	bh=6XUBSfqA/AYQJH+lqOy7CqiKFUESx/kcE+KE1N5qCN0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FKBD7ND3HFz/Oacrmzi3G8OPsqfeGrWwyNxq0ZdbX9aWG5d4uwbt8GWDe1EFPJ1Pz
	 1Bj9WXSabsaSvf7CjNWvB9JD5zacngZ8vDmo6LghNyVe+fZ5il+MpzGWCuLmwt1ru5
	 iCNjGFpBSoKLSC2eVDxh5zzncr1T0lbAkiJK1hJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F54F80589;
	Mon, 21 Nov 2022 14:46:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EF0BF8057D; Mon, 21 Nov 2022 14:46:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 220D2F80519
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 14:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 220D2F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mqk7bO2g"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AL502xK029046; Mon, 21 Nov 2022 07:46:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rU8D4IIGgYuq3+CJd6vO8qhlUC6r6iU2cG2WHbN6SkE=;
 b=mqk7bO2g3CYxw4HSM7cvLKu2+gJAaMBwLXI47V4kd20tVgI/R6/QaClTpaOC969xxCN/
 NaFm2hatBFUECKlhwyD+DV3GEASdZ8timbQQjk8uML9yKJWrdN9z0rONo8KUYcPFO2zq
 ZE1YhxMUTtApzw4ayNvyV44//FwiWKptozTUKTxcACbMQzUCbu1Bh8snZHcU/zWOZswm
 nFss00LVV8TtGvUjHZs10BgSABYsOzWbTDMDlUcbczjyAumuiVHqYDBiXoAYdS8JJWtI
 jvrOc6EBQhrHnBxeex7+H4uICVatsEA+YlHf0wnTGTuePzCQek4Vddjua4QkAKsXcWud Hw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet271t-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 07:46:13 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 07:46:09 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Mon, 21 Nov 2022 07:46:09 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F16AFB2F;
 Mon, 21 Nov 2022 13:46:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
Subject: [PATCH 7/9] ASoC: rt711: Switch to new snd_sdw_params_to_config helper
Date: Mon, 21 Nov 2022 13:46:06 +0000
Message-ID: <20221121134608.3713033-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
References: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eS9KVEaOggY7Nq8qjtYpYBQLViVK7LRU
X-Proofpoint-GUID: eS9KVEaOggY7Nq8qjtYpYBQLViVK7LRU
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

The conversation from hw_params to SoundWire config is pretty
standard as such most of the conversation can be handled by the new
snd_sdw_params_to_config helper function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt711-sdca.c | 27 +++++++++------------------
 sound/soc/codecs/rt711.c      | 27 +++++++++------------------
 2 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 9252681219017..b78dd5994edbf 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -18,6 +18,7 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/sdw.h>
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
@@ -1257,11 +1258,10 @@ static int rt711_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
-	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
 	struct sdw_stream_data *stream;
-	int retval, port, num_channels;
+	int retval;
 	unsigned int sampling_rate;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
@@ -1274,28 +1274,19 @@ static int rt711_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	/* SoundWire specific configuration */
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
-		port = 3;
+		port_config.num = 3;
 	} else {
-		direction = SDW_DATA_DIR_TX;
 		if (dai->id == RT711_AIF1)
-			port = 2;
+			port_config.num = 2;
 		else if (dai->id == RT711_AIF2)
-			port = 4;
+			port_config.num = 4;
 		else
 			return -EINVAL;
 	}
 
-	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = params_channels(params);
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	num_channels = params_channels(params);
-	port_config.ch_mask = GENMASK(num_channels - 1, 0);
-	port_config.num = port;
-
 	retval = sdw_stream_add_slave(rt711->slave, &stream_config,
 					&port_config, 1, stream->sdw_stream);
 	if (retval) {
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 1bf6180891942..78e1da9b07388 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -19,6 +19,7 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
@@ -999,11 +1000,10 @@ static int rt711_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
-	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
 	struct sdw_stream_data *stream;
-	int retval, port, num_channels;
+	int retval;
 	unsigned int val = 0;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
@@ -1016,28 +1016,19 @@ static int rt711_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	/* SoundWire specific configuration */
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
-		port = 3;
+		port_config.num = 3;
 	} else {
-		direction = SDW_DATA_DIR_TX;
 		if (dai->id == RT711_AIF1)
-			port = 4;
+			port_config.num = 4;
 		else if (dai->id == RT711_AIF2)
-			port = 2;
+			port_config.num = 2;
 		else
 			return -EINVAL;
 	}
 
-	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = params_channels(params);
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	num_channels = params_channels(params);
-	port_config.ch_mask = (1 << (num_channels)) - 1;
-	port_config.num = port;
-
 	retval = sdw_stream_add_slave(rt711->slave, &stream_config,
 					&port_config, 1, stream->sdw_stream);
 	if (retval) {
-- 
2.30.2

