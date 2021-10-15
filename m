Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1597042F408
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:42:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92DD717B9;
	Fri, 15 Oct 2021 15:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92DD717B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305335;
	bh=sVpfERhpypRCR0dyeLeRtTbsnjoz6k3lqMefS0KV02c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VlvDGR94SVTpT+17GsTLDiwr3bYkYB1eVVYiWccg28UV7GvMxBK1eqQhjo9liy8/l
	 VeV0KGRge0gBDCe+MNOFnKY90JBpVXm43aUjj/OAwdsfgw706h3SrOBF5kSl460rEc
	 VfNxsJr5e6cUQIV+HcLS2z5yUA6mek0tVL/5RTrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6FA4F80548;
	Fri, 15 Oct 2021 15:37:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E131CF80526; Fri, 15 Oct 2021 15:36:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1C95F8025B
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C95F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cuCIgXuU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F4c2t5023483; 
 Fri, 15 Oct 2021 08:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=sReRsHuECodsZYapwt6scu5oBslOw6SGzFeLYSf+2Gc=;
 b=cuCIgXuUkIsza7xnR5LihcOQmsSR9jUjk6aidKd6db3Zdfi6YrhGFP+srdmHQ4DyO5lz
 fMsLeWApiynkF3S0lltJzeHmBHTCxhgrM5TlcsyzvgKRrJVzO04wgWX1EhzV8LVg4BEF
 ptxExDPqaX70N4lQ6w8htEIhai/I3ah3aFriqTAI8S1930Q+C7b6yoFpdYkH3GTkVec+
 ASDWf4ivwl2Q/Kzfs2fqb4wOjCIcdG/WSpN+QvHaq2mOs78p3h7q+mTkETQE/h+hdiFD
 dnLkFY7VixVeGYqskrpQdPokesiSwKwRhQokXuGf6XJ0jdbY3XT8D4s0PQ6SsuoQ9yLn Kw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5v-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:28 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:25 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1737D11DB;
 Fri, 15 Oct 2021 13:36:25 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 12/16] ASoC: cs42l42: Allow time for HP/ADC to power-up after
 enable
Date: Fri, 15 Oct 2021 14:36:15 +0100
Message-ID: <20211015133619.4698-13-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: J7s3tnD3tsp5CBb0VK4eAWL2GzcOECpK
X-Proofpoint-GUID: J7s3tnD3tsp5CBb0VK4eAWL2GzcOECpK
X-Proofpoint-Spam-Reason: safe
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

After enabling the HP or ADC by writing the corresponding PDN=0,
it takes around 20 milliseconds for it to power up and the midrail
supply to be stable. Add this wait into a DAPM widget callback.

If HP and ADC are both powering up in a DAPM sequence, there's no
need to do the wait twice. The widget will perform one wait in the
POST_PMU if there was a PRE_PMU for one or both.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 31 +++++++++++++++++++++++++++++--
 sound/soc/codecs/cs42l42.h |  2 ++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 64bcabeb8f57..54b4bc391ee9 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -435,10 +435,36 @@ static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 				0x3f, 1, mixer_tlv)
 };
 
+static int cs42l42_hp_adc_ev(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		cs42l42->hp_adc_up_pending = true;
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* Only need one delay if HP and ADC are both powering-up */
+		if (cs42l42->hp_adc_up_pending) {
+			usleep_range(CS42L42_HP_ADC_EN_TIME_US,
+				     CS42L42_HP_ADC_EN_TIME_US + 1000);
+			cs42l42->hp_adc_up_pending = false;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget cs42l42_dapm_widgets[] = {
 	/* Playback Path */
 	SND_SOC_DAPM_OUTPUT("HP"),
-	SND_SOC_DAPM_DAC("DAC", NULL, CS42L42_PWR_CTL1, CS42L42_HP_PDN_SHIFT, 1),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, CS42L42_PWR_CTL1, CS42L42_HP_PDN_SHIFT, 1,
+			   cs42l42_hp_adc_ev, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_MIXER("MIXER", CS42L42_PWR_CTL1, CS42L42_MIXER_PDN_SHIFT, 1, NULL, 0),
 	SND_SOC_DAPM_AIF_IN("SDIN1", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SDIN2", NULL, 1, SND_SOC_NOPM, 0, 0),
@@ -448,7 +474,8 @@ static const struct snd_soc_dapm_widget cs42l42_dapm_widgets[] = {
 
 	/* Capture Path */
 	SND_SOC_DAPM_INPUT("HS"),
-	SND_SOC_DAPM_ADC("ADC", NULL, CS42L42_PWR_CTL1, CS42L42_ADC_PDN_SHIFT, 1),
+	SND_SOC_DAPM_ADC_E("ADC", NULL, CS42L42_PWR_CTL1, CS42L42_ADC_PDN_SHIFT, 1,
+			   cs42l42_hp_adc_ev, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_AIF_OUT("SDOUT1", NULL, 0, CS42L42_ASP_TX_CH_EN, CS42L42_ASP_TX0_CH1_SHIFT, 0),
 	SND_SOC_DAPM_AIF_OUT("SDOUT2", NULL, 1, CS42L42_ASP_TX_CH_EN, CS42L42_ASP_TX0_CH2_SHIFT, 0),
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index d30643398084..024760300937 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -820,6 +820,7 @@
 #define CS42L42_CLOCK_SWITCH_DELAY_US 150
 #define CS42L42_PLL_LOCK_POLL_US	250
 #define CS42L42_PLL_LOCK_TIMEOUT_US	1250
+#define CS42L42_HP_ADC_EN_TIME_US	20000
 
 static const char *const cs42l42_supply_names[CS42L42_NUM_SUPPLIES] = {
 	"VP",
@@ -853,6 +854,7 @@ struct  cs42l42_private {
 	u8 hs_bias_ramp_time;
 	u8 hs_bias_sense_en;
 	u8 stream_use;
+	bool hp_adc_up_pending;
 };
 
 #endif /* __CS42L42_H__ */
-- 
2.11.0

