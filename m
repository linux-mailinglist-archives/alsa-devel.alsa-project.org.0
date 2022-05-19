Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6052D99A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:58:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 609B717A5;
	Thu, 19 May 2022 17:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 609B717A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975890;
	bh=nu3Z5aU/CZvT/PaJy4lfe0LCjaPIWseYIcTiY9tT/yc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/GaIiWLZQlEWjusCWVfCAeM+5IZEKXPC50EkmGr3d5vJXkYQhwjIU56oFdQ7T1Zr
	 i1/zHW5N/kW0GBt+xC/q8xQ4W3baL49UDDKvwPmxmGgwFfa4SSOIrIs/aEg8Any+BZ
	 gNI0UZThTY22PfAasj/GEEqyxI278nhcf8b9fANI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9CFF806F7;
	Thu, 19 May 2022 17:44:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24C71F80623; Thu, 19 May 2022 17:44:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 888BAF800D1
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 888BAF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="O+w8tG67"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k12A002261;
 Thu, 19 May 2022 10:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=eGYFlG3Htf11GYri2u8Av0yY7RtKBp+5GHIN2hbYX6g=;
 b=O+w8tG67JSaQk07m3qWqUWMeSMitpMGwE2mqPEef9kEUYE83vSjG6ylpMUSPTpeQ5Y4s
 YjU3erNeoJHT+w9R5LsYXXwH+u/oo1M3j1o6o+iH1+ETquH28K+XrORFKS/f/sB95TRB
 Ldc6rtbGEg2SB8vnp/4TTgOhRHO4zYWi7NZUyyYTCXbEMiSXUXXlphks0xZZZo4ssekn
 K7oxRN6VdpsOhB6GyZwVnavWG96WNuWjLC4Zxq1oRMwNne8je7f1RNspA16LtPj1b0ut
 afC1ItdmxzfcgjUiYLsIiG1JHRIF6xcobUziLvk4mi8sq+AH6qDgQdCPEvJItjuhy9ju 0Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1485F11D3;
 Thu, 19 May 2022 15:43:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 52/56] ASoC: ti: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:43:14 +0100
Message-ID: <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mdgP--FrYQJ8LQr97yUif1MMz6GgTqJw
X-Proofpoint-ORIG-GUID: mdgP--FrYQJ8LQr97yUif1MMz6GgTqJw
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

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/ti/davinci-i2s.c   | 2 +-
 sound/soc/ti/davinci-mcasp.c | 2 +-
 sound/soc/ti/omap-mcbsp.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index c7368d5296688..fe572b720b094 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -606,7 +606,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.prepare	= davinci_i2s_prepare,
 	.trigger	= davinci_i2s_trigger,
 	.hw_params	= davinci_i2s_hw_params,
-	.set_fmt_new	= davinci_i2s_set_dai_fmt,
+	.set_fmt	= davinci_i2s_set_dai_fmt,
 	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
 
 };
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 961bac6963652..e2aab4729f3ab 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1620,7 +1620,7 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
 	.trigger	= davinci_mcasp_trigger,
 	.delay		= davinci_mcasp_delay,
 	.hw_params	= davinci_mcasp_hw_params,
-	.set_fmt_new	= davinci_mcasp_set_dai_fmt,
+	.set_fmt	= davinci_mcasp_set_dai_fmt,
 	.set_clkdiv	= davinci_mcasp_set_clkdiv,
 	.set_sysclk	= davinci_mcasp_set_sysclk,
 	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 5bfb56d4ff844..58d8e200a7b97 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1271,7 +1271,7 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
 	.trigger	= omap_mcbsp_dai_trigger,
 	.delay		= omap_mcbsp_dai_delay,
 	.hw_params	= omap_mcbsp_dai_hw_params,
-	.set_fmt_new	= omap_mcbsp_dai_set_dai_fmt,
+	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
 	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
 	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
 };
-- 
2.30.2

