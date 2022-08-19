Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2153F599C45
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA371166F;
	Fri, 19 Aug 2022 14:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA371166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913762;
	bh=ZJMnGVlZqYvreD+eXL0Tt4oYboqA0uYiAr1T4Pc1bAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2ibGGK0oKQ2HcrxTVAanXgoOGkaB70fJulNHFPCe/JmzL9neln9vxMZ4AWBsixjM
	 DzpBnNYSmQIZ6wXJU8qdFFniKvSLB/JedjRYIpI/FMjFkXKys8PKsHT1TUGYK36nux
	 iw6AbO8CB2uYY5nBj4WgrKFo0D1t16/QyRJxnj08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B19EAF8056F;
	Fri, 19 Aug 2022 14:53:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AB7EF80549; Fri, 19 Aug 2022 14:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FBD2F80525
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBD2F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WU4M3FjY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J5opPn018534;
 Fri, 19 Aug 2022 07:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Cahuxfx8FbsiBBuZYNG0sBEu8gh5h4CTMFEjgx6vfNk=;
 b=WU4M3FjY74C34jUbsKsQxHQ3le1svxC9uCNTcQX/+lEbfXP87ZMoswBo3s06hdL9AWTZ
 FwLvbTdKxB9Y2PNbHiRDe/BGA4f4Ldpavakzz8j2OXp7CfgPeB4HHbkBGISjt19Vu35y
 O3MQSvwwzJB4Rjk9OzWQEc8aO+d3B90LaxALaUY1rnWCi47gKj7U8ObJCuaLKzFM6rFY
 UvKpqX21B5NV5Nv0KLYRjwbQZzdLCULfNcDA6JB1I4XGIdCp4R0u+/itfi4v3VJD4c2a
 4X6+by2b/t1Vc8hOQfI1i3/hAdD1N2F8hXBwfHRZtWhL9nQpV+fMNn/H+tZ7erEtRZU6 0A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hx9c1yrtp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 07:52:36 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 19 Aug
 2022 07:52:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 19 Aug 2022 07:52:34 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8FF4F476;
 Fri, 19 Aug 2022 12:52:34 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 02/12] ASoC: cs42l42: Add bitclock frequency argument to
 cs42l42_pll_config()
Date: Fri, 19 Aug 2022 13:52:20 +0100
Message-ID: <20220819125230.42731-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819125230.42731-1-rf@opensource.cirrus.com>
References: <20220819125230.42731-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AKnqAx_bzldxlWqbCX3_YlSB19dKW_Kv
X-Proofpoint-GUID: AKnqAx_bzldxlWqbCX3_YlSB19dKW_Kv
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

Clean up the handling of bitclock frequency by keeping all the logic
in cs42l42_pcm_hw_params(), which then simply passes the frequency as
an argument to cs42l42_pll_config().

The previous code had become clunky as a legacy of earlier versions of
the clock handling. The logic was split across cs42l42_pcm_hw_params()
and cs42l42_pll_config(), with the params-derived bclk stashed in
struct cs42l42_private only to pass it to cs42l42_pll_config().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 32 ++++++++++++++++----------------
 sound/soc/codecs/cs42l42.h |  1 -
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 440d414efe0a..1745b83310ac 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -649,18 +649,12 @@ static const struct cs42l42_pll_params pll_ratio_table[] = {
 	{ 24576000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12288000, 128, 1}
 };
 
-static int cs42l42_pll_config(struct snd_soc_component *component)
+static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk)
 {
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	int i;
-	u32 clk;
 	u32 fsync;
 
-	if (!cs42l42->sclk)
-		clk = cs42l42->bclk;
-	else
-		clk = cs42l42->sclk;
-
 	/* Don't reconfigure if there is an audio stream running */
 	if (cs42l42->stream_use) {
 		if (pll_ratio_table[cs42l42->pll_config].sclk == clk)
@@ -897,19 +891,25 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	unsigned int width = (params_width(params) / 8) - 1;
 	unsigned int slot_width = 0;
 	unsigned int val = 0;
+	unsigned int bclk;
 	int ret;
 
 	cs42l42->srate = params_rate(params);
 
-	/*
-	 * Assume 24-bit samples are in 32-bit slots, to prevent SCLK being
-	 * more than assumed (which would result in overclocking).
-	 */
-	if (params_width(params) == 24)
-		slot_width = 32;
+	if (cs42l42->sclk) {
+		/* machine driver has set the SCLK */
+		bclk = cs42l42->sclk;
+	} else {
+		/*
+		 * Assume 24-bit samples are in 32-bit slots, to prevent SCLK being
+		 * more than assumed (which would result in overclocking).
+		 */
+		if (params_width(params) == 24)
+			slot_width = 32;
 
-	/* I2S frame always has multiple of 2 channels */
-	cs42l42->bclk = snd_soc_tdm_params_to_bclk(params, slot_width, 0, 2);
+		/* I2S frame always has multiple of 2 channels */
+		bclk = snd_soc_tdm_params_to_bclk(params, slot_width, 0, 2);
+	}
 
 	switch (substream->stream) {
 	case SNDRV_PCM_STREAM_CAPTURE:
@@ -949,7 +949,7 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	ret = cs42l42_pll_config(component);
+	ret = cs42l42_pll_config(component, bclk);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 50299c9f283a..b4ba1467c558 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -30,7 +30,6 @@ struct  cs42l42_private {
 	struct snd_soc_jack *jack;
 	struct mutex irq_lock;
 	int pll_config;
-	int bclk;
 	u32 sclk;
 	u32 srate;
 	u8 plug_state;
-- 
2.30.2

