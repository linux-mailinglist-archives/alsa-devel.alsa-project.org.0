Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD4D52D871
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 901241650;
	Thu, 19 May 2022 17:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 901241650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975106;
	bh=keoK72xjy7sINyY0NIwB+FkFYMaB7br8aZNTtN7axRI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kE4KPJgLDYBeLzR9vvt6S8tjiyLXaskITCim/dnpNKPCMndYMgHyoBml9bxgeRapV
	 firpe3o/4XuX4Sexq+bKnzYlKtBqcYcovYjUww12lFTd3yD18lIRlbbc4b07Z1vHAQ
	 lkLAHkUhD1v6HOmahCE5h2FAqrk/0TAuI3ZmQrT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 909D6F8053A;
	Thu, 19 May 2022 17:43:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B56BF80527; Thu, 19 May 2022 17:43:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1E2BF80237
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1E2BF80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="QMABav7q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11l002261;
 Thu, 19 May 2022 10:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=iD7IdaADaZKm5Uf70oqcAnHMJaLJ4BQnPHz9AoPIIeY=;
 b=QMABav7q1bi3lupFCvjwMSAaDfpEMv4GDmGS+mHiyMEs/xXTJcHgM0m6ngX/ojwNKk78
 DQ/+etWHIvCAd43+fYb7dl2NlQYTi1W+fKdRSAmADlyGQov8GAex8HP3QV4a3P6ktihr
 wcuijAnnT5B+Ni4tXGS03XR6IriOzla7ddNvXh4+Gc1KN5eueo0rLxQdKCk1B0pzce7Q
 0iX0mWXVfoEYAfkOxqcCwq/nA8xPtftgUXg6MiON8zmS0ZIWPQTYXS9YwXRjQ1T+BUCY
 HkvupMShxNaWO3Z2m4/1JAciwKjvCfAJ09RPJ4CUsfk08SGOdC+7HxqyDE9yB707mcxP wQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A0CAB11D3;
 Thu, 19 May 2022 15:43:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 04/56] ASoC: au1x: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:26 +0100
Message-ID: <20220519154318.2153729-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0oVtGFU5FK9rPm57juQgQwWdRbWT9Ugo
X-Proofpoint-ORIG-GUID: 0oVtGFU5FK9rPm57juQgQwWdRbWT9Ugo
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

As part of updating the core to directly tell drivers if they are clock
provider or consumer update these CPU side drivers to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/au1x/i2sc.c    | 4 ++--
 sound/soc/au1x/psc-i2s.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 740d4e052e4df..72f16b7fda3e9 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -121,7 +121,7 @@ static int au1xi2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 
 	/* I2S controller only supports provider */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:	/* CODEC consumer */
+	case SND_SOC_DAIFMT_BP_FP:	/* CODEC consumer */
 		break;
 	default:
 		goto out;
@@ -206,7 +206,7 @@ static const struct snd_soc_dai_ops au1xi2s_dai_ops = {
 	.startup	= au1xi2s_startup,
 	.trigger	= au1xi2s_trigger,
 	.hw_params	= au1xi2s_hw_params,
-	.set_fmt	= au1xi2s_set_fmt,
+	.set_fmt_new	= au1xi2s_set_fmt,
 };
 
 static struct snd_soc_dai_driver au1xi2s_dai_driver = {
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index b2b8896bb593c..d82c1353f2f09 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -91,10 +91,10 @@ static int au1xpsc_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:	/* CODEC provider */
+	case SND_SOC_DAIFMT_BC_FC:	/* CODEC provider */
 		ct |= PSC_I2SCFG_MS;	/* PSC I2S consumer mode */
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:	/* CODEC consumer */
+	case SND_SOC_DAIFMT_BP_FP:	/* CODEC consumer */
 		ct &= ~PSC_I2SCFG_MS;	/* PSC I2S provider mode */
 		break;
 	default:
@@ -266,7 +266,7 @@ static const struct snd_soc_dai_ops au1xpsc_i2s_dai_ops = {
 	.startup	= au1xpsc_i2s_startup,
 	.trigger	= au1xpsc_i2s_trigger,
 	.hw_params	= au1xpsc_i2s_hw_params,
-	.set_fmt	= au1xpsc_i2s_set_fmt,
+	.set_fmt_new	= au1xpsc_i2s_set_fmt,
 };
 
 static const struct snd_soc_dai_driver au1xpsc_i2s_dai_template = {
-- 
2.30.2

