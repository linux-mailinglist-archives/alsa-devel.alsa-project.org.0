Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CBB1A39AD
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 20:15:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F6501684;
	Thu,  9 Apr 2020 20:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F6501684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586456104;
	bh=P99yet8b0uvmU8JlUVlFCuaBHqemEvLUdB4Z07zgjik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3BdYEIdvlIcbBjoiDpU/QK7cmof5pJzl9vNC2BGJanyxAk/u6mDHjkOE980XKYh1
	 6NN6fleNkDmsQ2K7lJfT8KstAYcnQN6aIpH7f2GTKvkrPJgVBOavQgQC6QG4PjLsyQ
	 UCAOxE7cZcd0TjspqlbVFDRCUmqfdTqe23pi0lWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CE41F80273;
	Thu,  9 Apr 2020 20:12:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1A72F80107; Thu,  9 Apr 2020 20:12:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE263F801D8
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE263F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VLRIRSG0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039I8fvZ023538; Thu, 9 Apr 2020 13:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=U1KsR2Ja386qpsdganrUW4faoHPc20ZIJ12cu7MMRK0=;
 b=VLRIRSG0UHGM1VVtWjJnvEs3l34GWBhraIH+ykbWFdIVe/O6mX1BV+NWimiUeujKoemD
 YY8oLgEbjgVrLczrlZIKrwC44KqvBt/+dQEMr02UsoIVaPWao0i/3KLzpteJfXJVlPLW
 YwXwk2Gw+rejnY7NHEZjvENHizASfw/yaXWDduI7oBONvkP60MHNBsMatUwWAGJLwYKX
 9opBd3XuiqkzDkdYXCwIJ8OTIqAYjP/yfiiEvHFKDBbKv50ec3W8RsgjAwRVKpS2ZFb9
 zWAimnZx+uWZlbGmukZNdb5gHNAAi5xGU9W7dM/G/XqA026K1gPQgayh80EPHV5uXP9o MQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3091q3411m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 09 Apr 2020 13:12:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 9 Apr
 2020 19:12:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 9 Apr 2020 19:12:09 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B56A644A;
 Thu,  9 Apr 2020 18:12:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: dapm: Remove dapm_connect_dai_link_widgets helper
Date: Thu, 9 Apr 2020 19:12:09 +0100
Message-ID: <20200409181209.30130-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200409181209.30130-1-ckeepax@opensource.cirrus.com>
References: <20200409181209.30130-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=1
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=854 spamscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004090131
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

This helper is adding very little both it and is one caller are very
small functions simply combine the two.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-dapm.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 33168980619b5..a4143ca190d0d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4358,27 +4358,6 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	}
 }
 
-static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
-					  struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai *codec_dai;
-	int i;
-
-	if (rtd->num_cpus == 1) {
-		for_each_rtd_codec_dais(rtd, i, codec_dai)
-			dapm_connect_dai_pair(card, rtd, codec_dai,
-					      rtd->cpu_dais[0]);
-	} else if (rtd->num_codecs == rtd->num_cpus) {
-		for_each_rtd_codec_dais(rtd, i, codec_dai)
-			dapm_connect_dai_pair(card, rtd, codec_dai,
-					      rtd->cpu_dais[i]);
-	} else {
-		dev_err(card->dev,
-			"N cpus to M codecs link is not supported yet\n");
-	}
-
-}
-
 static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 	int event)
 {
@@ -4419,6 +4398,8 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *codec_dai;
+	int i;
 
 	/* for each BE DAI link... */
 	for_each_card_rtds(card, rtd)  {
@@ -4429,7 +4410,18 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->dynamic)
 			continue;
 
-		dapm_connect_dai_link_widgets(card, rtd);
+		if (rtd->num_cpus == 1) {
+			for_each_rtd_codec_dais(rtd, i, codec_dai)
+				dapm_connect_dai_pair(card, rtd, codec_dai,
+						      rtd->cpu_dais[0]);
+		} else if (rtd->num_codecs == rtd->num_cpus) {
+			for_each_rtd_codec_dais(rtd, i, codec_dai)
+				dapm_connect_dai_pair(card, rtd, codec_dai,
+						      rtd->cpu_dais[i]);
+		} else {
+			dev_err(card->dev,
+				"N cpus to M codecs link is not supported yet\n");
+		}
 	}
 }
 
-- 
2.11.0

