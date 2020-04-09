Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85AA1A39AC
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 20:14:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56C8A1678;
	Thu,  9 Apr 2020 20:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56C8A1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586456087;
	bh=Du4WiXQE5ZHaQhKlQShuD736O7CGAXsL2KlS5STnrW0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isOZdadqyf/veSh0icpa+PDvgSolAHaYtjZLVsOr9YCCfZ2P+Eb/oo6jDU81QivZk
	 mEwmq57e7gFhnBz4x9hJRouvXIkir8qhSAAfhXLE1VKtiOkEg4vh2/gj8zH0g0+f3t
	 3bM0FzdMhinKJO76fVRp9KdvASrDe9aVk4/rfEeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E0B2F8025E;
	Thu,  9 Apr 2020 20:12:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 535F4F80107; Thu,  9 Apr 2020 20:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C3E2F80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C3E2F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lZJpz4ed"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039IC10F030906; Thu, 9 Apr 2020 13:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=6eCEshHurZGu/FcajTiZQkDuIOpVUuj2IgDnDp3g+rI=;
 b=lZJpz4edEmFL1AlcbC8ZJL27gCZdLfOQUDAjpV5m2Yni6TfGKiVP76G1bAPtnzpCKISS
 GFfqMZoiQHhEatgpHJCPsc1xWvZwF85CwAyUsSnvzRPlgpAn6XH8XooLBy3fle2pruF6
 +Qc9G6+YsQcqjgWWB0xaH5a8nWFnJqm/fr4Zwma6dfAnlbkzjyyGOI8wrleP8yf0xxTR
 uJ8baSWju40mxPFWyBWfvJaiGD6+6cQXJPlrRKCnvnSJswdaxvGDlar4i89ie6syoptq
 FpTm2s8DO0LRjERYx/Of25y2i015zhbiyo0KYu4M9gif8HXHuJkMoeVwPRXiVIYPXuiI Jw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3091p0m0sb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 09 Apr 2020 13:12:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 9 Apr
 2020 19:12:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 9 Apr 2020 19:12:09 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A4E9C2C5;
 Thu,  9 Apr 2020 18:12:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: dapm: Move error message to avoid some duplication
Date: Thu, 9 Apr 2020 19:12:08 +0100
Message-ID: <20200409181209.30130-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200409181209.30130-1-ckeepax@opensource.cirrus.com>
References: <20200409181209.30130-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=638 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=1 mlxscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090132
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org, shreyas.nc@intel.com,
 yung-chuan.liao@linux.intel.com
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

Move the error message into snd_soc_dapm_new_dai from
dapm_connect_dai_pair, since the two copies are almost identical and
are the only callers.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-dapm.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index fe907f0cc709b..33168980619b5 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4165,6 +4165,8 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 	w = snd_soc_dapm_new_control_unlocked(&card->dapm, &template);
 	if (IS_ERR(w)) {
 		ret = PTR_ERR(w);
+		dev_err(rtd->dev, "ASoC: Failed to create %s widget: %d\n",
+			link_name, ret);
 		goto outfree_kcontrol_news;
 	}
 
@@ -4327,13 +4329,8 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 		if (dai_link->params && !dai_link->playback_widget) {
 			substream = streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "playback");
-			if (IS_ERR(dai)) {
-				dev_err(rtd->dev,
-					"ASoC: Failed to create DAI %s: %ld\n",
-					codec_dai->name,
-					PTR_ERR(dai));
+			if (IS_ERR(dai))
 				goto capture;
-			}
 			dai_link->playback_widget = dai;
 		}
 
@@ -4350,13 +4347,8 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 		if (dai_link->params && !dai_link->capture_widget) {
 			substream = streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "capture");
-			if (IS_ERR(dai)) {
-				dev_err(rtd->dev,
-					"ASoC: Failed to create DAI %s: %ld\n",
-					codec_dai->name,
-					PTR_ERR(dai));
+			if (IS_ERR(dai))
 				return;
-			}
 			dai_link->capture_widget = dai;
 		}
 
-- 
2.11.0

