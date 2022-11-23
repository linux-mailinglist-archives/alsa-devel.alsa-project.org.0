Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8608D636630
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 17:51:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D3B166D;
	Wed, 23 Nov 2022 17:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D3B166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669222306;
	bh=3n27SOiF10TYL0OsicIukX05gA1731AdEyOm19XOI/I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JsgT6J9LVXsqhCyzUh9faez11kgQ/Wx0gQYEann6Yk+cGCyDBigTP4EsSM2J68yP8
	 DNAWSLU1dXLCgU9LSqrprzgiDMmN2mUKVjtnZ0ZP0XHsc2+zBlNN0Cie+jWZfN/X+F
	 sfwsY1EYNcO7NTFCr38JcMHYfMx3fJwGOmwZhrXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD7ACF8056F;
	Wed, 23 Nov 2022 17:49:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1D7AF8049C; Wed, 23 Nov 2022 17:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CDB3F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 17:49:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CDB3F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="rH8uneV5"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANFYpmT019647; Wed, 23 Nov 2022 10:49:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Pw18gJz4MmyGaleE1M9QRK0cfmlTPfyeaAtEqWOvtjU=;
 b=rH8uneV5TG0M+p/g/Z8mwfZVcnAJHVLXOdxhDitpd3XHA+UT/pSJTJaccvw0B0muHALH
 JAPJ9o2NUavXwOnURRLnez6mvtO7wzxQPQRYcvrhCvzqtcCKWkSNNmST9YWfMlVVpHBt
 OXeVSX3vSRlSXkyG6bNbopEyyNirIgGhdb2hx9rdZjTsby7NawochPrm8uYMLImzKWSy
 xACu5qmI0I+fEAjo62SBS+A/mxgy3r+k9oVsjUWnCf5YiI0INkCOVqMnPzy1pSe4OvQC
 f7w3YxfZxV2lgWn8YeSub5HtO495qCZFOm7kTf4bbfFP9daj9fqF0EE6TqC/ZAgyVXVX Rg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet55fe-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 10:49:40 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 10:49:38 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 23 Nov 2022 10:49:38 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 77338B2F;
 Wed, 23 Nov 2022 16:49:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
Subject: [PATCH v2 5/9] ASoC: rt5682-sdw: Switch to new
 snd_sdw_params_to_config helper
Date: Wed, 23 Nov 2022 16:49:33 +0000
Message-ID: <20221123164937.594837-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123164937.594837-1-ckeepax@opensource.cirrus.com>
References: <20221123164937.594837-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jViDGnds-3v3ag0DCr2fGDgKl7lnN99a
X-Proofpoint-GUID: jViDGnds-3v3ag0DCr2fGDgKl7lnN99a
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

 sound/soc/codecs/rt5682-sdw.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index c1a94229dc7e3..d8a573dcb771b 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -24,6 +24,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/jack.h>
+#include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
@@ -130,11 +131,10 @@ static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
-	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
 	struct sdw_stream_data *stream;
-	int retval, port, num_channels;
+	int retval;
 	unsigned int val_p = 0, val_c = 0, osr_p = 0, osr_c = 0;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
@@ -147,22 +147,12 @@ static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	/* SoundWire specific configuration */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
-		port = 1;
-	} else {
-		direction = SDW_DATA_DIR_TX;
-		port = 2;
-	}
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
-	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = params_channels(params);
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	num_channels = params_channels(params);
-	port_config.ch_mask = (1 << (num_channels)) - 1;
-	port_config.num = port;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		port_config.num = 1;
+	else
+		port_config.num = 2;
 
 	retval = sdw_stream_add_slave(rt5682->slave, &stream_config,
 				      &port_config, 1, stream->sdw_stream);
-- 
2.30.2

