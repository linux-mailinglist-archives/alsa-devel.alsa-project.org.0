Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C07332FCB0
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Mar 2021 20:17:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A57F41F34;
	Sat,  6 Mar 2021 20:17:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A57F41F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615058275;
	bh=5bNSeDnRW10CjMLDAH39oxitYBw6X0hm0FBFY5KOIaQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MdxB4zFMps84I+5jh97m6jaTSAjx9sfaIg4k0BqfPfguiv+K0f3IvBdyGooSR9hxO
	 iULC+jgpyfwj75w/c+mMJY1UO3koyMjsjoGqBj48gS/JHgbe3yUklsuA2MmkF0smT5
	 pc7ZtMnuOFB/qdapta8J8qHi8yOuq0t24XXTa7Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 809CFF802E3;
	Sat,  6 Mar 2021 20:14:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B24D6F804CF; Sat,  6 Mar 2021 20:14:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DC57F802C4
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 20:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DC57F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="We6H5cyw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 126JCNcf017698; Sat, 6 Mar 2021 13:13:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=wPSDKxGxlPyJi/idIuSZPJ+4etMy5RzWXBgwugWh+Iw=;
 b=We6H5cywIxKaZhqYgl73PUsdJE64yFMCHrHmdkAafU4CIa/Poym1DmaVhk6ez1fixrTG
 jsIqS4TUUhYwjZ2sNH+T0atdpE5udkl/OVduOABwi3hrj4KKSxlJqay7nkryi8QXb2b7
 MzaXhjNAb/HrtclRxlxGdZqF+MM1f4rAn4mEBGpbMuKQuAJrglGrFBV+XOLUoytNcIc1
 m1GZqLBm0AEQOMhVWBlUGJenLtvHtFuvuIobMRQc2zwW9ZCe64EeLDj/JpsYPGdMTR4d
 ajwzht2ik0x4vycs7ZK8uohCArUTdyixXA4ej0vgpOTRAmbtvC0grWty4yzq29CLWjvS +g== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3748198d08-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 06 Mar 2021 13:13:34 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 6 Mar 2021
 18:56:29 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Sat, 6 Mar 2021 18:56:29 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 10ED711CB;
 Sat,  6 Mar 2021 18:56:29 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v3 12/15] ASoC: cs42l42: Use bclk from hw_params if set_sysclk
 was not called
Date: Sat, 6 Mar 2021 18:55:50 +0000
Message-ID: <20210306185553.62053-13-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
References: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103060119
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

Add support for reading the source clock from snd_soc_params_to_bclk
so the machine driver is not required to call cs42l42_set_sysclk

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
Changes in v3:
- No changes

Changes in v2:
- No changes

 sound/soc/codecs/cs42l42.c | 17 +++++++++++++----
 sound/soc/codecs/cs42l42.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 594bf22521037..68b7ed71ad542 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -588,10 +588,16 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 {
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	int i;
+	u32 clk;
 	u32 fsync;
 
+	if (!cs42l42->sclk)
+		clk = cs42l42->bclk;
+	else
+		clk = cs42l42->sclk;
+
 	for (i = 0; i < ARRAY_SIZE(pll_ratio_table); i++) {
-		if (pll_ratio_table[i].sclk == cs42l42->sclk) {
+		if (pll_ratio_table[i].sclk == clk) {
 			/* Configure the internal sample rate */
 			snd_soc_component_update_bits(component, CS42L42_MCLK_CTL,
 					CS42L42_INTERNAL_FS_MASK,
@@ -611,12 +617,12 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 					(pll_ratio_table[i].mclk_div <<
 					CS42L42_MCLKDIV_SHIFT));
 			/* Set up the LRCLK */
-			fsync = cs42l42->sclk / cs42l42->srate;
-			if (((fsync * cs42l42->srate) != cs42l42->sclk)
+			fsync = clk / cs42l42->srate;
+			if (((fsync * cs42l42->srate) != clk)
 				|| ((fsync % 2) != 0)) {
 				dev_err(component->dev,
 					"Unsupported sclk %d/sample rate %d\n",
-					cs42l42->sclk,
+					clk,
 					cs42l42->srate);
 				return -EINVAL;
 			}
@@ -788,6 +794,7 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	unsigned int val = 0;
 
 	cs42l42->srate = params_rate(params);
+	cs42l42->bclk = snd_soc_params_to_bclk(params);
 
 	switch(substream->stream) {
 	case SNDRV_PCM_STREAM_CAPTURE:
@@ -921,6 +928,8 @@ static struct snd_soc_dai_driver cs42l42_dai = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = CS42L42_FORMATS,
 		},
+		.symmetric_rate = 1,
+		.symmetric_sample_bits = 1,
 		.ops = &cs42l42_ops,
 };
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index e12828877a20d..429c6833fc811 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -771,6 +771,7 @@ struct  cs42l42_private {
 	struct gpio_desc *reset_gpio;
 	struct completion pdn_done;
 	struct snd_soc_jack jack;
+	int bclk;
 	u32 sclk;
 	u32 srate;
 	u8 plug_state;
-- 
2.30.1

