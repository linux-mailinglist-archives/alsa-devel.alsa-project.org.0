Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E029A632435
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 14:48:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7344815DC;
	Mon, 21 Nov 2022 14:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7344815DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669038532;
	bh=R5+4Ph3yw9O6hfQjpGnSZEf7jo4uMThgIWg0k9609zE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HNhY/S2LiVfBNjF63cO9kXZZbi6R1n5m0Eolo6BxCUDyW0z7fH3Tp/OA9QjKidw1i
	 BMjT0Lj/VzSzHScJK7A8SvV7BVSNP6y2yOxTjGONRoDDXfyOsYcyshKMe5MBL+Umen
	 FmJNgBsgcRsMDKOpc7HHGCOoOJBU7Qpi5oOJ4fo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02EA7F80578;
	Mon, 21 Nov 2022 14:46:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92F0BF80558; Mon, 21 Nov 2022 14:46:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DAF8F80149
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 14:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DAF8F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="iCbyTh3Y"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AL502xH029046; Mon, 21 Nov 2022 07:46:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=h+oTKXjYDyudR+qr7rbI+0ql/anOq7qmqTsnTji7nHA=;
 b=iCbyTh3YznDhvp7Gw3JHQMbZM7ON0giyFoIu21BUWdKew5Yym3jzNT88cG8F5BWs4J4k
 5wh3ln9FPfnAAFwKNc1v8wOT62Yhr5H+jExeMnhrFsQ9Rf1VzRzYL1OIDWOler66w3Mz
 kAjZQbWxHU1Kvf2eXtghvgMWubVB0ajjrrb+RddocgS6pUp9Ho6j0WxbFYlWjeOLlxpG
 Jfhy8VcqFJ6vcly/bsPL2ba/mhsft/3OtLCAHiqflLOIDT0SeZJbiQ25ts2o2xKap8m4
 RIt7V9dyvrY1YuXm7lPPrJYwHQoJbvc6lqGeqe6nEqQiEM5tt1qmrvLC8yYccghmJqjk Ow== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet271t-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 07:46:11 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 07:46:08 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Mon, 21 Nov 2022 07:46:08 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B2BD8B12;
 Mon, 21 Nov 2022 13:46:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
Subject: [PATCH 3/9] ASoC: rt1308-sdw: Switch to new snd_sdw_params_to_config
 helper
Date: Mon, 21 Nov 2022 13:46:02 +0000
Message-ID: <20221121134608.3713033-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
References: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tdvnHQUn598vsssVzWcn5nD_IZ_OkpgY
X-Proofpoint-GUID: tdvnHQUn598vsssVzWcn5nD_IZ_OkpgY
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
 sound/soc/codecs/rt1308-sdw.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 7f4248284f35e..ca2790d63b719 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -17,6 +17,7 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
@@ -553,11 +554,10 @@ static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct rt1308_sdw_priv *rt1308 =
 		snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
-	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
 	struct sdw_stream_data *stream;
-	int retval, port, num_channels, ch_mask;
+	int retval;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
 	stream = snd_soc_dai_get_dma_data(dai, substream);
@@ -569,30 +569,19 @@ static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	/* SoundWire specific configuration */
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
+
 	/* port 1 for playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
-		port = 1;
-	} else {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		port_config.num = 1;
+	else
 		return -EINVAL;
-	}
 
 	if (rt1308->slots) {
-		num_channels = rt1308->slots;
-		ch_mask = rt1308->rx_mask;
-	} else {
-		num_channels = params_channels(params);
-		ch_mask = (1 << num_channels) - 1;
+		stream_config.ch_count = rt1308->slots;
+		port_config.ch_mask = rt1308->rx_mask;
 	}
 
-	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = num_channels;
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	port_config.ch_mask = ch_mask;
-	port_config.num = port;
-
 	retval = sdw_stream_add_slave(rt1308->sdw_slave, &stream_config,
 				&port_config, 1, stream->sdw_stream);
 	if (retval) {
-- 
2.30.2

