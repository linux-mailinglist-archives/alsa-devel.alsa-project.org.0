Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD02672284
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:07:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF877728;
	Wed, 18 Jan 2023 17:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF877728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058061;
	bh=Qp0vX01v3wHHh78p3fXpxXyuMbaSEAJno4SlKsHdHrE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mPg/2qzafb3EKXe7LoehMFeddTy1qgRgOl6uQ56E37zR6FNw6Z7RyQ2U+fs5veZZY
	 V9xWsmftS9OcORx7kV+c+C8oCEpa1X/L+oFcIoFjdf3lRQ8SHPBqXNpnx5iwFYS9Ao
	 l1EVhq1I4w1nZvU0LokuoEayFT25iUXJZtEFHqS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7333F80567;
	Wed, 18 Jan 2023 17:05:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73457F80567; Wed, 18 Jan 2023 17:05:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED81CF80495
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED81CF80495
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=AedMLsmZ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IEDgr8022836; Wed, 18 Jan 2023 10:05:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7baE4YHbXVUPM74pWQRBjY+48Wfg+BcP2GKd/5ZVfB8=;
 b=AedMLsmZGu95xNC4tHAZEfFWQPFq9/UWQ94EiLMkHucSZbKwBc0kdHu2KxLYU1fSWBjf
 vzj6ZvVzB42q6uSW6z0ZdHtGldRsJ0pZjAHi8EvGpx1J1t9wokytw64rQBD926fsYt+s
 /NPhaGZiPUMH6ntHmFrclyq0rlWuMUEZO1P3aXqSUp71mKjG9VvL9nmEMeAXE65/vQ5F
 049gZN2IyXiD/CXEg72f5ev3c9d6oXwj74J10Vo0K8j9+2RIlL6CbLINihjR3VE5Dxtl
 PqLdrs2QDfA2SZJf5zgJzULJ/MV6zaOgKlgWtsMYM6bMdCiwq3C7dFmBtN46O7f2/vj1 YA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n3spx6vk9-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 10:05:04 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 18 Jan
 2023 10:04:57 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Wed, 18 Jan 2023 10:04:57 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4DA1111CB;
 Wed, 18 Jan 2023 16:04:57 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 3/8] ASoC: cs42l42: Ensure MCLKint is a multiple of the
 sample rate
Date: Wed, 18 Jan 2023 16:04:47 +0000
Message-ID: <20230118160452.2385494-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: seZ911bfDpOLQvm-3_xM2TJlVpv7ZKeH
X-Proofpoint-ORIG-GUID: seZ911bfDpOLQvm-3_xM2TJlVpv7ZKeH
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

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
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 82aa11d6937be..939f8bcc222c0 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -653,7 +653,8 @@ static const struct cs42l42_pll_params pll_ratio_table[] = {
 	{ 24576000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12288000, 128, 1}
 };
 
-static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk)
+static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk,
+			      unsigned int sample_rate)
 {
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	int i;
@@ -668,6 +669,10 @@ static int cs42l42_pll_config(struct snd_soc_component *component, unsigned int
 	}
 
 	for (i = 0; i < ARRAY_SIZE(pll_ratio_table); i++) {
+		/* MCLKint must be a multiple of the sample rate */
+		if (pll_ratio_table[i].mclk_int % sample_rate)
+			continue;
+
 		if (pll_ratio_table[i].sclk == clk) {
 			cs42l42->pll_config = i;
 
@@ -893,6 +898,7 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	unsigned int channels = params_channels(params);
 	unsigned int width = (params_width(params) / 8) - 1;
+	unsigned int sample_rate = params_rate(params);
 	unsigned int slot_width = 0;
 	unsigned int val = 0;
 	unsigned int bclk;
@@ -956,11 +962,11 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
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
2.34.1

