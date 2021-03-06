Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1B32FCB5
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Mar 2021 20:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C451F47;
	Sat,  6 Mar 2021 20:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C451F47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615058397;
	bh=9CyzxahLv/LTSTNBpDK3lzaqzBXcF0rSXJ3aMWa7mvc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPjqst1irdIlCBmHwj8HUNzaO0GLVGAmjyGYagu80riDtN2+CDb9QyodBOdA0WgJL
	 urrNTA87BapwABVyont2gzNJK94dFJHVZCX8LBkZuYSKtbyy9F68jYU6Yne7Qgi6hJ
	 G/ubZ96a8JeB6SuPfoZfCsxYs2yIdIlqGP0i9HG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE316F80507;
	Sat,  6 Mar 2021 20:14:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA01EF804E2; Sat,  6 Mar 2021 20:14:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A64BF8032C
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 20:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A64BF8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BMjHq7at"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 126J6uDO011401; Sat, 6 Mar 2021 13:13:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=IktnEuzg1ZGoJtu1+yDY32Nu0JF3e7Ysdso1aDneHnk=;
 b=BMjHq7at49TU1j9jxa3CpiOO98cdhzX0Kb7b5rk7WqgbBCeQABgQHHLEpAHJ33silchB
 4jRyMqCdcKR1ndwkAx/naK2iprWILuKBfdk6dZDxcE3TtntlabTtdjSuILfgYj/uFuT9
 +ZdtARTKy+bQhGXNBEfaHHxhZeehvflVcluBiP6ClLsZvM3UhQLToQW345fu7VRidjlP
 wIXKKpEi3eQm6ltrXgEItq60HzxCfF9gAadQzJPhiboBcKjZ68q7lUmRoLl9hlk9zdkX
 6b7k4SMb46l9dxCkw/HtjL7F7JI6HhWtg0Qk4KeEQKHQe2KKNLkcCGH+fzJnso1YUvNs SA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3748198d06-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 06 Mar 2021 13:13:35 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 6 Mar 2021
 18:56:30 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Sat, 6 Mar 2021 18:56:30 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 06FD911D7;
 Sat,  6 Mar 2021 18:56:30 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v3 15/15] ASoC: cs42l42: Wait for PLL to lock before switching
 to it
Date: Sat, 6 Mar 2021 18:55:53 +0000
Message-ID: <20210306185553.62053-16-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
References: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=958 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103060119
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Richard Fitzgerald <rf@opensource.cirrus.com>

The PLL should have locked before using it to supply MCLK.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
Changes in v3:
- No changes

Changes in v2:
- Lucas signed-off added

 sound/soc/codecs/cs42l42.c | 12 +++++++++++-
 sound/soc/codecs/cs42l42.h |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index d7a314aa59b73..bf982e145e945 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -862,6 +862,7 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	unsigned int regval;
 	u8 fullScaleVol;
+	int ret;
 
 	if (mute) {
 		/* Mute the headphone */
@@ -887,9 +888,18 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	} else {
 		if (!cs42l42->stream_use) {
 			/* SCLK must be running before codec unmute */
-			if ((cs42l42->bclk < 11289600) && (cs42l42->sclk < 11289600))
+			if ((cs42l42->bclk < 11289600) && (cs42l42->sclk < 11289600)) {
 				snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
 							      CS42L42_PLL_START_MASK, 1);
+				ret = regmap_read_poll_timeout(cs42l42->regmap,
+							       CS42L42_PLL_LOCK_STATUS,
+							       regval,
+							       (regval & 1),
+							       CS42L42_PLL_LOCK_POLL_US,
+							       CS42L42_PLL_LOCK_TIMEOUT_US);
+				if (ret < 0)
+					dev_warn(component->dev, "PLL failed to lock: %d\n", ret);
+			}
 
 			/* Mark SCLK as present, turn off internal oscillator */
 			regmap_multi_reg_write(cs42l42->regmap, cs42l42_to_sclk_seq,
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 214cee762709d..36b763f0d1a06 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -756,6 +756,8 @@
 #define CS42L42_NUM_SUPPLIES	5
 #define CS42L42_BOOT_TIME_US	3000
 #define CS42L42_CLOCK_SWITCH_DELAY_US 150
+#define CS42L42_PLL_LOCK_POLL_US	250
+#define CS42L42_PLL_LOCK_TIMEOUT_US	1250
 
 static const char *const cs42l42_supply_names[CS42L42_NUM_SUPPLIES] = {
 	"VA",
-- 
2.30.1

