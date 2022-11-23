Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B23263663A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 17:56:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25CC016B1;
	Wed, 23 Nov 2022 17:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25CC016B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669222588;
	bh=Q1Tf8i33G7AdPhDQetDGgeM3kjLkQqvLu1GolLs7WEM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I0RKKkTN6VuffhWLMT2eMDpHMT1p8fm5EfrPAyWHu8S0QDCMt+poKdbTclQTLtgXv
	 hilwFhT0FhemJcMazKgHplOck4wqw5jLpSrq1znkxYpnky3lWWGtuL4b3Eq7fCr/5H
	 YG3IfdxW4GeZ3b+XpIsCHOF/MKAClDJ+Hm6ApdoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B88E3F8049C;
	Wed, 23 Nov 2022 17:54:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 673FCF80563; Wed, 23 Nov 2022 17:54:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80CDEF800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 17:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80CDEF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="J8v3mWDP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANFXduF006384; Wed, 23 Nov 2022 10:54:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=kPnwel1BxSdNg2PoZ7xE2NvwG4Qq2H8cIQbstGHMN9Y=;
 b=J8v3mWDPmNNwme+/A/vSqtIooxZZLAS1Io5x3m+/Km2L5jkUF9nSvVpavKe5r9IcfO3l
 BFo1Y4KP/wKS6bnnI9b2ty0fZwyWh4+YvrR0zsqyeHVOJuNGJ6hNfVK93/z4uMXaaWMP
 zsPSsJisTAlPLIHmqRyAMYjjtIZDUOvaWzwWxnBObqaeM8+JRmxeaG/yCmqrzYbj2KSI
 4+VaaDLod0e6H94iatYmB5wCd80nyrr/qZz9OTqW86Xy41iJQcT+PsablxrScpQB3INd
 8NoTr5PN8DXQ+z/8XapSvXj2/+Nrto18+xvJpt5ga0OrnMqYgGZNjH9rgPbuCdbYq7zq kA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6w4y2-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 10:54:36 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 10:54:32 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 23 Nov 2022 10:54:32 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4B9B0B10;
 Wed, 23 Nov 2022 16:54:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
Subject: [PATCH v3 3/9] ASoC: rt1308-sdw: Switch to new
 snd_sdw_params_to_config helper
Date: Wed, 23 Nov 2022 16:54:26 +0000
Message-ID: <20221123165432.594972-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123165432.594972-1-ckeepax@opensource.cirrus.com>
References: <20221123165432.594972-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ITGRbMt6xrrHGRpMT3X1xXco-N5AbbOk
X-Proofpoint-GUID: ITGRbMt6xrrHGRpMT3X1xXco-N5AbbOk
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
standard as such most of the conversion can be handled by the new
snd_sdw_params_to_config helper function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Correct other spelling error, sorry.
Changes since v1:
 - Correct spelling error in commit message

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

