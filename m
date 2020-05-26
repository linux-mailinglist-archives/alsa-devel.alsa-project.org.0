Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EFA1E26C8
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 18:21:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B177175F;
	Tue, 26 May 2020 18:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B177175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590510084;
	bh=+JFzq9TvgwW8JMxm+9YrhUKiAjRJR3QziXV6DbeFHCw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pl0f7EAYkG9RfLfk7iXYlQXvH/JzE1ZKiN2/4s0nxpMMlqtHBg92L4ZtcTp1cH/yc
	 1BiFqoOu2w7eiTR6u2jgQO2xP/URa2TBTYZmJ2l93SUZS4Q0EBlAmuKKH1CTSd2HhU
	 zDdWI/wnNqGvGHWJix5hDhF3ew88W4YkINtfun9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D8C1F8015C;
	Tue, 26 May 2020 18:19:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 862B2F80150; Tue, 26 May 2020 18:19:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 524B3F80131
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 18:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 524B3F80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="phVOb023"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04QGHMX9030902; Tue, 26 May 2020 11:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=wUxsBdkjWzyO/wNweoig6s8sCmIeI39SkTYkWgimWbU=;
 b=phVOb023cq0tM8cREF7RjeTWVVe5ad6d/b9rq9x5HZoTJHZU3/CDuSkwCysV7CggP3Ov
 rNRlHfHTma+UW2q+bK9jrH74f5pJ9Bh6r4u8invyiQCv5WAvkAtssJaUK8d0SI4hj9ww
 XhJJHAYpx0BTjJnLnykhKqi9XkIv76ddH5MHMXhNX3ea0g6qCCP3+5yRiS6jfPYWt/E6
 Ai6ytFp41LmCUJrCax3sKnPIQ9riDselG2ptV9R6BkOvP5eZFWbmN6P8fVCeSxsyV35e
 UxHekbGOHgoXFRRM9PO5Hllhf7NQi2F4HuEOqtYU0hzi0lBmChkY/XnhJccB96l5ayxq Pg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 31708puwwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 May 2020 11:19:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 26 May
 2020 17:19:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 26 May 2020 17:19:30 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3F7612D4;
 Tue, 26 May 2020 16:19:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: dapm: Move dai_link widgets to runtime to fix use after
 free
Date: Tue, 26 May 2020 17:19:30 +0100
Message-ID: <20200526161930.30759-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 spamscore=0 mlxlogscore=846 cotscore=-2147483648
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005260126
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

The newly added CODEC to CODEC DAI link widget pointers in
snd_soc_dai_link are better placed in snd_soc_pcm_runtime.
snd_soc_dai_link is really intended for static configuration of
the DAI, and the runtime for dynamic data.  The snd_soc_dai_link
structures are not destroyed if the card is unbound. The widgets
are cleared up on unbind, however if the card is rebound as the
snd_soc_dai_link structures are reused these pointers will be left at
their old values, causing access to freed memory.

Fixes: 595571cca4de ("ASoC: dapm: Fix regression introducing multiple copies of DAI widgets")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc.h  |  6 +++---
 sound/soc/soc-dapm.c | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index a7fa642601081..ba07cdfcdcee4 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -801,9 +801,6 @@ struct snd_soc_dai_link {
 	const struct snd_soc_pcm_stream *params;
 	unsigned int num_params;
 
-	struct snd_soc_dapm_widget *playback_widget;
-	struct snd_soc_dapm_widget *capture_widget;
-
 	unsigned int dai_fmt;           /* format to set on init */
 
 	enum snd_soc_dpcm_trigger trigger[2]; /* trigger type for DPCM */
@@ -1169,6 +1166,9 @@ struct snd_soc_pcm_runtime {
 	unsigned int num_codecs;
 	unsigned int num_cpus;
 
+	struct snd_soc_dapm_widget *playback_widget;
+	struct snd_soc_dapm_widget *capture_widget;
+
 	struct delayed_work delayed_work;
 	void (*close_delayed_work_func)(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_DEBUG_FS
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index a4de3e4bc2eff..fc40f283a2480 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4340,16 +4340,16 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	codec = codec_dai->playback_widget;
 
 	if (playback_cpu && codec) {
-		if (dai_link->params && !dai_link->playback_widget) {
+		if (dai_link->params && !rtd->playback_widget) {
 			substream = streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "playback");
 			if (IS_ERR(dai))
 				goto capture;
-			dai_link->playback_widget = dai;
+			rtd->playback_widget = dai;
 		}
 
 		dapm_connect_dai_routes(&card->dapm, cpu_dai, playback_cpu,
-					dai_link->playback_widget,
+					rtd->playback_widget,
 					codec_dai, codec);
 	}
 
@@ -4358,16 +4358,16 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	codec = codec_dai->capture_widget;
 
 	if (codec && capture_cpu) {
-		if (dai_link->params && !dai_link->capture_widget) {
+		if (dai_link->params && !rtd->capture_widget) {
 			substream = streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "capture");
 			if (IS_ERR(dai))
 				return;
-			dai_link->capture_widget = dai;
+			rtd->capture_widget = dai;
 		}
 
 		dapm_connect_dai_routes(&card->dapm, codec_dai, codec,
-					dai_link->capture_widget,
+					rtd->capture_widget,
 					cpu_dai, capture_cpu);
 	}
 }
-- 
2.11.0

