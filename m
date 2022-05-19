Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617B52D9AA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 18:00:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A533717FD;
	Thu, 19 May 2022 17:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A533717FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652976021;
	bh=J29XorFsZJUCEvRXMORThFx+IOHnBjsE0jDDfeL/p/w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXtNU53qCcI7FlWuoe8fg5XhXQpF5hCud3MaS6gY1NDyFadwwF2p+VmMbYxR0iH39
	 Ie+DAlyalw4SrR1nnUMLSA84Z+qzbUOjKi93rEbuLoc3h+V1tM2bv7HArp3tQCOEL0
	 KEKAOoORqbGk8MBYIVs0g6vs+5VEKsAB05ruSde8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B763F8072D;
	Thu, 19 May 2022 17:45:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4877F8065C; Thu, 19 May 2022 17:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EED57F805A9
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EED57F805A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ie5ibsCR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k12F002261;
 Thu, 19 May 2022 10:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rAmdzdVBPsEtNYul1g2dUSOHayNdAUAKJpBqG3aOzJY=;
 b=ie5ibsCRNwZZmuJ7F4ifhgUDhbNFdVJXurj2KqdorbsRNTljtVbeF65ukdcB6nMZxS1g
 d/+JCVd0dfnhu8SFO5FcqFh03IdcFk6O3lsqMmEw1lESZSVQHVZ768Y11iK86gX5wded
 HncPrtvS2Pl8abpQqBrsNWAkSKm2te7Ec6s073jO0yUjL3doZ1eCxMJMUFeuIRv573M7
 cF+XfwzCbtl4LQmuL75idWHAKV+YfIjGUNGlufoB7XcZz6PoZ0EJmFPIM6OMvgi5aiwF
 GPkauF4RCdfiZLjEaeIYEGePTVTkMuTQ+kstkKdPr8UnRxIFlDMj6R/YD9CBCRFNzP3q 3w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-15
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4CA0D11D3;
 Thu, 19 May 2022 15:43:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 55/56] ASoC: soc-dai: Remove set_fmt_new callback
Date: Thu, 19 May 2022 16:43:17 +0100
Message-ID: <20220519154318.2153729-56-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kWHk-gfbxXTo-HjPUeZ0SF66_rmIJn2u
X-Proofpoint-ORIG-GUID: kWHk-gfbxXTo-HjPUeZ0SF66_rmIJn2u
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

Now the behaviour of the core and all drivers is updated to the new
direct clock specification the temporary set_fmt_new callback can be
completely removed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 1 -
 sound/soc/soc-dai.c     | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 9c1d92d5a3738..ea75096720864 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -288,7 +288,6 @@ struct snd_soc_dai_ops {
 	 * Called by soc_card drivers, normally in their hw_params.
 	 */
 	int (*set_fmt)(struct snd_soc_dai *dai, unsigned int fmt);
-	int (*set_fmt_new)(struct snd_soc_dai *dai, unsigned int fmt);
 	int (*xlate_tdm_slot_mask)(unsigned int slots,
 		unsigned int *tx_mask, unsigned int *rx_mask);
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 996712f4d9bfd..d530e8c2b77b1 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -208,11 +208,7 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	int ret = -ENOTSUPP;
 
-	if (dai->driver->ops &&
-	    dai->driver->ops->set_fmt_new)
-		ret = dai->driver->ops->set_fmt_new(dai, fmt);
-	else if (dai->driver->ops &&
-		 dai->driver->ops->set_fmt)
+	if (dai->driver->ops && dai->driver->ops->set_fmt)
 		ret = dai->driver->ops->set_fmt(dai, fmt);
 
 	return soc_dai_ret(dai, ret);
-- 
2.30.2

