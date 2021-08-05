Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D604D3E194B
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 18:15:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DB911701;
	Thu,  5 Aug 2021 18:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DB911701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628180104;
	bh=a0AJkf/K/QRONY9A6+xtiL22mENfR2JzR/ayNlz97+U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YfiEw8qVKaSEK9461iJbDfVsObXcHMLJ68VWkr/Gl1T8zaDh9MoTQbFDpvcMFOU9d
	 9GmkYVmAKFW+vN4iUZu6j3gR69308usVtdvXbPOd04UkH1bVPrIvdlKbKEd1TTzgDC
	 UruRwE+FPg6TTvIsXEGV40uFChjr0sVIfZkZ4afY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C43F80510;
	Thu,  5 Aug 2021 18:11:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5978CF804F2; Thu,  5 Aug 2021 18:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13099F8010A
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 18:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13099F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NkfVvFUT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 175EPV3Z027692; 
 Thu, 5 Aug 2021 11:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=GUD4E4n576SurHs80HUJjNEjvNZkJsMXz5+9y1aMpmE=;
 b=NkfVvFUTv5LaySxLsEpcQqGYyy3e0wmjFV2uA46D41piR0cnb9AXuoWoGKsLMvPU8gro
 vXCU1977Ts8f6jlYUCnWKgmm/Nr9rzEoto8wRrO1SafLAIy/bJxfNQ+wV8INRg6igAi8
 OPD+hSqaHooxVDgN1wUWpU48DUgGrJG7619BG0j59DaTDkSJxqMpfoInY879OE0JMNiH
 nLzMETfGPQA4rUDOFSoknG/vcK972RXdqXNke4TzYJ3U6QjZh4T6OewMWeR1BsvD9tYS
 5ftQ0IIszEizASZMIXGWznmWd02NkwF2cgr7/LE7+clwUDxWlqEG+3tuZ9kDK2+ipMgg Mw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a8c61rku5-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 05 Aug 2021 11:11:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 5 Aug
 2021 17:11:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 5 Aug 2021 17:11:14 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.37])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A4B5A45D;
 Thu,  5 Aug 2021 16:11:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 4/8] ASoC: cs42l42: Fix mono playback
Date: Thu, 5 Aug 2021 17:11:07 +0100
Message-ID: <20210805161111.10410-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805161111.10410-1-rf@opensource.cirrus.com>
References: <20210805161111.10410-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yVfdxU6ZsutE4FHh5qAbt3ED9052nz_M
X-Proofpoint-ORIG-GUID: yVfdxU6ZsutE4FHh5qAbt3ED9052nz_M
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050099
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

I2S always has two LRCLK phases and both CH1 and CH2 of the RX
must be enabled (corresponding to the low and high phases of LRCLK.)
The selection of the valid data channels is done by setting the DAC
CHA_SEL and CHB_SEL. CHA_SEL is always the first (left) channel,
CHB_SEL depends on the number of active channels.

Previously for mono ASP CH2 was not enabled, the result was playing
mono data would not produce any audio output.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 621d65f3b868 ("ASoC: cs42l42: Provide finer control on playback path")
---
 sound/soc/codecs/cs42l42.c | 15 +++++++++++++--
 sound/soc/codecs/cs42l42.h |  2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 29e0c8dc8466..99c022be94a6 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -460,8 +460,8 @@ static const struct snd_soc_dapm_widget cs42l42_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("HP"),
 	SND_SOC_DAPM_DAC("DAC", NULL, CS42L42_PWR_CTL1, CS42L42_HP_PDN_SHIFT, 1),
 	SND_SOC_DAPM_MIXER("MIXER", CS42L42_PWR_CTL1, CS42L42_MIXER_PDN_SHIFT, 1, NULL, 0),
-	SND_SOC_DAPM_AIF_IN("SDIN1", NULL, 0, CS42L42_ASP_RX_DAI0_EN, CS42L42_ASP_RX0_CH1_SHIFT, 0),
-	SND_SOC_DAPM_AIF_IN("SDIN2", NULL, 1, CS42L42_ASP_RX_DAI0_EN, CS42L42_ASP_RX0_CH2_SHIFT, 0),
+	SND_SOC_DAPM_AIF_IN("SDIN1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SDIN2", NULL, 1, SND_SOC_NOPM, 0, 0),
 
 	/* Playback Requirements */
 	SND_SOC_DAPM_SUPPLY("ASP DAI0", CS42L42_PWR_CTL1, CS42L42_ASP_DAI_PDN_SHIFT, 1, NULL, 0),
@@ -866,6 +866,17 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_component_update_bits(component, CS42L42_ASP_RX_DAI0_CH2_AP_RES,
 							 CS42L42_ASP_RX_CH_AP_MASK |
 							 CS42L42_ASP_RX_CH_RES_MASK, val);
+
+		/* Channel B comes from the last active channel */
+		snd_soc_component_update_bits(component, CS42L42_SP_RX_CH_SEL,
+					      CS42L42_SP_RX_CHB_SEL_MASK,
+					      (channels - 1) << CS42L42_SP_RX_CHB_SEL_SHIFT);
+
+		/* Both LRCLK slots must be enabled */
+		snd_soc_component_update_bits(component, CS42L42_ASP_RX_DAI0_EN,
+					      CS42L42_ASP_RX0_CH_EN_MASK,
+					      BIT(CS42L42_ASP_RX0_CH1_SHIFT) |
+					      BIT(CS42L42_ASP_RX0_CH2_SHIFT));
 		break;
 	default:
 		break;
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index b92c17be7f58..8734f6828f3e 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -653,6 +653,8 @@
 
 /* Page 0x25 Audio Port Registers */
 #define CS42L42_SP_RX_CH_SEL		(CS42L42_PAGE_25 + 0x01)
+#define CS42L42_SP_RX_CHB_SEL_SHIFT	2
+#define CS42L42_SP_RX_CHB_SEL_MASK	(3 << CS42L42_SP_RX_CHB_SEL_SHIFT)
 
 #define CS42L42_SP_RX_ISOC_CTL		(CS42L42_PAGE_25 + 0x02)
 #define CS42L42_SP_RX_RSYNC_SHIFT	6
-- 
2.11.0

