Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28663242B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 14:47:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175A51ED;
	Mon, 21 Nov 2022 14:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175A51ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669038460;
	bh=UPPmdx65rzJkgaOxrvdU7r7xkYSPQqGacVxm+21s7G8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=izf5UsAl4oncUJxV5JIdnawPISUCiSG0msi9IuMyJws64lTdqxXJbdP9cZlaZRSJo
	 /J8GG1r6iMCSAFhgpOq5oPVdojz1DleGJ8tB9aTP1lNuqH6nqRCwC2SOQhH5mfGCjv
	 ZY3KXpQPkfQiVS28zSKLwJAV4rrZDUiGgwTbbURc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 349EBF80115;
	Mon, 21 Nov 2022 14:46:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BD36F80558; Mon, 21 Nov 2022 14:46:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44AC5F800F3
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 14:46:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44AC5F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AAjl9xW1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AL502xF029046; Mon, 21 Nov 2022 07:46:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=36Qk2o2cOSy9Wte3Pe+ihmxFund0+dvrVRxus9yihoA=;
 b=AAjl9xW1hAIxme5683v4AgoOSh94t50Xk9LgbyKN+aXA0ALE46vcMm1zyGDVW/Qg/Pyj
 Dors6EVZeVcXNhtDumBAot/m82IKKjBOPzWjCYBlr5tcooo+UqdL2wZwP8F+nKSy3dQS
 3qv8w9F5dW+qEG/bh3HmOC77/7Y+SV/rX6CdIq9uec0SDDaHga8t89BMnn4QqUlMvfBx
 QymwDfiwAyxAxt2w12zvkCkcgapP39brgVl5OyxWMCw8jayZra8daKgXCUHTmpaevqvg
 AKh45CnQYCRJzn6Ut79v2VeW7kfXdL05uT2+8Ngjk13n8diUF1xz5IHm/OBlWsSFUSQM VQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet271t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 07:46:10 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 07:46:08 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Mon, 21 Nov 2022 07:46:08 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A4A03B2F;
 Mon, 21 Nov 2022 13:46:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
Subject: [PATCH 2/9] ASoC: max98373-sdw: Switch to new
 snd_sdw_params_to_config helper
Date: Mon, 21 Nov 2022 13:46:01 +0000
Message-ID: <20221121134608.3713033-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
References: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5Nx2C9BHGvqH89iqTlOLjn8XptSO2XJW
X-Proofpoint-GUID: 5Nx2C9BHGvqH89iqTlOLjn8XptSO2XJW
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
 sound/soc/codecs/max98373-sdw.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 899965b19d12d..3cd1be743d9ee 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <linux/of.h>
@@ -533,10 +534,8 @@ static int max98373_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct max98373_priv *max98373 =
 		snd_soc_component_get_drvdata(component);
-
-	struct sdw_stream_config stream_config;
-	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
 	struct sdw_stream_data *stream;
 	int ret, chan_sz, sampling_rate;
 
@@ -548,28 +547,20 @@ static int max98373_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 	if (!max98373->slave)
 		return -EINVAL;
 
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
 		port_config.num = 1;
+
+		if (max98373->slot) {
+			stream_config.ch_count = max98373->slot;
+			port_config.ch_mask = max98373->rx_mask;
+		}
 	} else {
-		direction = SDW_DATA_DIR_TX;
 		port_config.num = 3;
-	}
 
-	stream_config.frame_rate = params_rate(params);
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	if (max98373->slot && direction == SDW_DATA_DIR_RX) {
-		stream_config.ch_count = max98373->slot;
-		port_config.ch_mask = max98373->rx_mask;
-	} else {
 		/* only IV are supported by capture */
-		if (direction == SDW_DATA_DIR_TX)
-			stream_config.ch_count = 2;
-		else
-			stream_config.ch_count = params_channels(params);
-
+		stream_config.ch_count = 2;
 		port_config.ch_mask = GENMASK((int)stream_config.ch_count - 1, 0);
 	}
 
-- 
2.30.2

