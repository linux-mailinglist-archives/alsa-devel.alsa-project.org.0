Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D09632436
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 14:48:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9E9F1638;
	Mon, 21 Nov 2022 14:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9E9F1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669038537;
	bh=p370Bod8sHzxiBjycP+m1ewUGok0gLAP50vbhkP9F6w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRa1G0v8xXPlMLIeetIvK8vBAEy4wSdOEkfefqrvB+igoC6qzk1qDXFBxTy+iyV+E
	 hdtkJhi/t3uMc3ENtBzZOsLX5+EP1M78XRWDs0316PlqEBh3uMC2OgpBezgyhgnpNS
	 cMpitdIrXeaLXWlOje1oRJ0D1PNrtIKpsPXdSfjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C95A8F80579;
	Mon, 21 Nov 2022 14:46:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D51D7F80563; Mon, 21 Nov 2022 14:46:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3C1AF804D0
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 14:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3C1AF804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="IBcnNuq4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AL502xI029046; Mon, 21 Nov 2022 07:46:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=YyUimI9eFGYqPah/Gdj8TT7o8ghUxAih2hDvOpwwbvI=;
 b=IBcnNuq4WagWpH6YftYVh7Nn/uqnwWlYlTpBmpO3wvRAlyKj5Zn/RlzEnNyhbH8HrtJJ
 2tJUIGNrE0gvMlpLINdOLsXJ6bZwPx24QjmPx6/pgmQHOoXy4o4G+q3OZOug6uolWT9N
 dC1bAcfCiPckjxKLHL+PcIwG37u6OAjk1DMXNCiP3qKhvx1cfpGhKM/oNu+bykauwma4
 ZdTD1C9CaTkMnAGoc5ftPaPzsU6u/7NXo5PwBQDnTcalTEkdjQGHfEn8m4pVsToTrOUF
 l8FV1ZSMhEguvWx2sR72N9W+sc5zEjRHT8xKwU7joIq/kjzuGymQzZ9tufY+bnDbY/gl EA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet271t-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 07:46:12 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 07:46:09 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Mon, 21 Nov 2022 07:46:09 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0CDA3468;
 Mon, 21 Nov 2022 13:46:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
Subject: [PATCH 8/9] ASoC: rt715: Switch to new snd_sdw_params_to_config helper
Date: Mon, 21 Nov 2022 13:46:07 +0000
Message-ID: <20221121134608.3713033-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
References: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: d0mB6CQ5Itw1siJLBVTskpWWWuBfdSMc
X-Proofpoint-GUID: d0mB6CQ5Itw1siJLBVTskpWWWuBfdSMc
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

