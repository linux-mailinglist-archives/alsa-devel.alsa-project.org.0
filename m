Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E142B63663C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 17:56:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77B2316C0;
	Wed, 23 Nov 2022 17:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77B2316C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669222616;
	bh=YKR8bPiGlEg31hN+Pwm03imsY9Z1mQeJ0my1eoXXMQo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GlqTGYGfrF2P3v8fmDTgRRm+Ds+BzepQ1ArbXAl0z6rdSiJuOyFcIIxub6QXxyW93
	 WgbDl0CF/ZaIq2/zsGGk6FKjRpckIrR8w6vga0k1m9N20/AELg/asHfVTXxpP3iERr
	 7tc0msEcw35s+yHMHOFDPxAAJUO1d1R8DwomjFwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88995F80567;
	Wed, 23 Nov 2022 17:54:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8F9DF8055B; Wed, 23 Nov 2022 17:54:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A045F8025D
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 17:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A045F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="S4qqAxuD"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANFXduC006384; Wed, 23 Nov 2022 10:54:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=+5/JCNyM+AJMXKhFfJ/ML8UlgZYx9Ey+Y5damJbRG4g=;
 b=S4qqAxuDxDYwXRn4bvF5BM6j6QDx7RVNXXkKuZdb+7N+61nIU/NFYTRZkmaaP+IAuNbp
 FXtXCRRI8i6DH7xjJsfTEnrTpfSnOMAOO6jW2BWi601h/MKz03Hxc+zBgRx0K+VLxoBO
 9T99UfO9RwMVgSmnSynHuvoH8jGxfijxWjUG9oXHiiDVehtCbBS0/9T+O/+RA/aKpO9R
 bl75g3dAyBRlFD5N18ue2et6Y6PtJ3ZpC+DYesRpshsvG0FCp27ecDUavjJcyYfxqbWZ
 wJ550lHZ1oGXqPGPAzu0Z8kv5Dvj2klVkyDLEWJiKN9jZS9reLAoj4O93cJIecZx/4b1 Lg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6w4y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 10:54:34 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 10:54:32 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 23 Nov 2022 10:54:32 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5A7D3B2F;
 Wed, 23 Nov 2022 16:54:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
Subject: [PATCH v3 4/9] ASoC: rt1316-sdw: Switch to new
 snd_sdw_params_to_config helper
Date: Wed, 23 Nov 2022 16:54:27 +0000
Message-ID: <20221123165432.594972-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123165432.594972-1-ckeepax@opensource.cirrus.com>
References: <20221123165432.594972-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UXrKF7IG1e0Mvt10ZironzDVxiCvyKwn
X-Proofpoint-GUID: UXrKF7IG1e0Mvt10ZironzDVxiCvyKwn
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

 sound/soc/codecs/rt1316-sdw.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 2db7ee6c6d334..e6294cc7a9954 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -14,6 +14,7 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/sdw.h>
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include "rt1316-sdw.h"
@@ -530,11 +531,10 @@ static int rt1316_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct rt1316_sdw_priv *rt1316 =
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
@@ -546,25 +546,13 @@ static int rt1316_sdw_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	/* SoundWire specific configuration */
-	/* port 1 for playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
-		port = 1;
-	} else {
-		direction = SDW_DATA_DIR_TX;
-		port = 2;
-	}
-
-	num_channels = params_channels(params);
-	ch_mask = (1 << num_channels) - 1;
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
-	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = num_channels;
-	stream_config.bps = snd_pcm_format_width(params_format(params));
-	stream_config.direction = direction;
-
-	port_config.ch_mask = ch_mask;
-	port_config.num = port;
+	/* port 1 for playback */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		port_config.num = 1;
+	else
+		port_config.num = 2;
 
 	retval = sdw_stream_add_slave(rt1316->sdw_slave, &stream_config,
 				&port_config, 1, stream->sdw_stream);
-- 
2.30.2

