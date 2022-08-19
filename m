Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC702599C42
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:55:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CCA11666;
	Fri, 19 Aug 2022 14:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CCA11666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913713;
	bh=fDTJj0sR+CjoWeLcOuLLzFTy1HUVVzg/9gEXCyhL6e0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+Bt+dIy2V1x1ad9OBY+vDXlvRI772pA6Fn4uCYBy7p4wQyZmKYyAwkxegZ0OCw0D
	 PafEG7px316FH09KUPlJq8ZBaQ2g7UZ858c/ZQjpJCU2oy04eLFTfn7dDaq7TzYpDy
	 Os5pY9u71ddlkULWWP26Sjgapq6V7NXYC0ncwNC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB78FF80553;
	Fri, 19 Aug 2022 14:53:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24340F80533; Fri, 19 Aug 2022 14:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97635F802A0
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97635F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hseGJlHF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J5opPo018534;
 Fri, 19 Aug 2022 07:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=VG7YSU/cYAKrW65aE8mh5zeQwZiWTAjDbpKQXBnwCro=;
 b=hseGJlHFyKI4oLN8yXRxvhLzeh3FUYZ8P6CN4jHUqJvdL5nDsQsztJqri5yFpiHBoPQj
 1s40Km0Z2AFV/4JYNUkVu/JCf5eIpS4AJqroAv7z543MaHkCtjRI5Au5zYTlt+/n/Ey6
 Nd4X5p/QutuH0WuHdU8psI7kXumEDemUlg5ebjap9hXXs0Bc1TqVihPjJQSkBYdX0tJP
 +0DvckFxd8s98GlLagE0Wx9g0RMjjR+HNF6weN0lombIKCqEmwXje6yatavQ0lVG0sTv
 ZV/3tFcxDDmiLqUrVr1Q5n0SZzyInbUlmdWRiMWOofw/+fKkGkV9Y8plv4QRHs4FvA5m 1Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hx9c1yrtp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 07:52:37 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 19 Aug
 2022 07:52:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 19 Aug 2022 07:52:34 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9515C11DA;
 Fri, 19 Aug 2022 12:52:34 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 03/12] ASoC: cs42l42: Ensure MCLKint is a multiple of the
 sample rate
Date: Fri, 19 Aug 2022 13:52:21 +0100
Message-ID: <20220819125230.42731-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819125230.42731-1-rf@opensource.cirrus.com>
References: <20220819125230.42731-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: CENTUxRxpjrLobtgkyOYKYw1H2jZ2Pyj
X-Proofpoint-GUID: CENTUxRxpjrLobtgkyOYKYw1H2jZ2Pyj
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

The chosen clocking configuration must give an internal MCLK (MCLKint)
that is an integer multiple of the sample rate.

On I2S each of the supported bit clock frequencies can only be generated
from one sample rate group (either the 44100 or the 48000) so the code
could use only the bitclock to look up a PLL config.

The relationship between sample rate and bitclock frequency is more
complex on Soundwire and so it is possible to set a frame shape to
generate a bitclock from the "wrong" group. For example 2*147 with a
48000 sample rate would give a bitclock of 14112000 which on I2S
could only be derived from a 44100 sample rate.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 1745b83310ac..66c10d24169d 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -649,7 +649,8 @@ static const struct cs42l42_pll_params pll_ratio_table[] = {
 	{ 24576000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12288000, 128, 1}
 };
 
-static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk)
+static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk,
+			      unsigned int sample_rate)
 {
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	int i;
@@ -664,6 +665,10 @@ static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int
 	}
 
 	for (i = 0; i < ARRAY_SIZE(pll_ratio_table); i++) {
+		/* MCLKint must be a multiple of the sample rate */
+		if (pll_ratio_table[i].mclk_int % sample_rate)
+			continue;
+
 		if (pll_ratio_table[i].sclk == clk) {
 			cs42l42->pll_config = i;
 
@@ -889,6 +894,7 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	unsigned int channels = params_channels(params);
 	unsigned int width = (params_width(params) / 8) - 1;
+	unsigned int sample_rate = params_rate(params);
 	unsigned int slot_width = 0;
 	unsigned int val = 0;
 	unsigned int bclk;
@@ -949,11 +955,11 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	ret = cs42l42_pll_config(component, bclk);
+	ret = cs42l42_pll_config(component, bclk, sample_rate);
 	if (ret)
 		return ret;
 
-	cs42l42_src_config(component, params_rate(params));
+	cs42l42_src_config(component, sample_rate);
 
 	return 0;
 }
-- 
2.30.2

