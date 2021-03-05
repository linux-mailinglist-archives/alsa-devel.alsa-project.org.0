Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2341A32F177
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 18:39:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B875718E8;
	Fri,  5 Mar 2021 18:38:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B875718E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614965945;
	bh=6s0bZE15TjQa594rS33lVYEt6l4kejZbjrX7JvxwcV4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R56jdAdHuA3SR2HC8LCD56/ah80EQPie8q5bSyDLdKZU0QYJaLs9aGit7E6lCVow8
	 cFwQSQkyYmaSA9tDDI9I5ewAXAEmE+lqll3Fp4p8oMbi5RYwtDIB0Y8+svhjWGrzlf
	 4AyZVUntFyxZsUA12ZWs4MbU6piLJqwwa9BZKu+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E16FBF804D9;
	Fri,  5 Mar 2021 18:35:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52A0FF804AC; Fri,  5 Mar 2021 18:35:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25021F8027D
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 18:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25021F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hD87y+1L"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125HWLWZ005729; Fri, 5 Mar 2021 11:34:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=CVGdymO0D9InHOamvCYyKbmvQ3/otN79u+2DnXyD0CQ=;
 b=hD87y+1LpN3CrfNMIl+fw5ydHXuz6rpXXa6rabRb9NslKrioFyCYzLi2+FHWqa2rLmca
 UhzypBiXD/vES4fPE+haZx7SbC/dds0mourzmB2CIyZaqSMSYmbgvGnL7rmPcXYXt2DQ
 Cp9knpyzWzYkzGeD3wdGxkntWCXQuHrF3UOJd/XVBi+QXPr5T5ZGIXX9z4jORWCORDi6
 jGhSlwqe5P4qqLzanvIQBySbh8ZLmEO8txHZVBuf4wZH3d5S42K3iWVt5oIt6l6wSfcI
 DOgOHOu0gZ1ubPb9uMbuDoLcCZhXbzJ4FBI5r+tNeQcdVfoxxSCqK+sAZ09PKrbj6vkC YQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc70eyn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 05 Mar 2021 11:34:48 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 5 Mar 2021
 17:34:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:34:46 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 23B7811D7;
 Fri,  5 Mar 2021 17:34:46 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v2 04/15] ASoC: cs42l42: Don't enable/disable regulator at
 Bias Level
Date: Fri, 5 Mar 2021 17:34:31 +0000
Message-ID: <20210305173442.195740-5-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
References: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=834 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103050090
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

dev_pm_ops already enable/disable the codec if not in use

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
Changes in v2:
- No changes

 sound/soc/codecs/cs42l42.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index d5078ce79fadd..eee3fc3200308 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -511,43 +511,6 @@ static const struct snd_soc_dapm_route cs42l42_audio_map[] = {
 	{"HP", NULL, "HPDRV"}
 };
 
-static int cs42l42_set_bias_level(struct snd_soc_component *component,
-					enum snd_soc_bias_level level)
-{
-	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-		break;
-	case SND_SOC_BIAS_PREPARE:
-		break;
-	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
-			regcache_cache_only(cs42l42->regmap, false);
-			regcache_sync(cs42l42->regmap);
-			ret = regulator_bulk_enable(
-						ARRAY_SIZE(cs42l42->supplies),
-						cs42l42->supplies);
-			if (ret != 0) {
-				dev_err(component->dev,
-					"Failed to enable regulators: %d\n",
-					ret);
-				return ret;
-			}
-		}
-		break;
-	case SND_SOC_BIAS_OFF:
-
-		regcache_cache_only(cs42l42->regmap, true);
-		regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies),
-						    cs42l42->supplies);
-		break;
-	}
-
-	return 0;
-}
-
 static int cs42l42_component_probe(struct snd_soc_component *component)
 {
 	struct cs42l42_private *cs42l42 =
@@ -560,7 +523,6 @@ static int cs42l42_component_probe(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
 	.probe			= cs42l42_component_probe,
-	.set_bias_level		= cs42l42_set_bias_level,
 	.dapm_widgets		= cs42l42_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(cs42l42_dapm_widgets),
 	.dapm_routes		= cs42l42_audio_map,
-- 
2.30.1

