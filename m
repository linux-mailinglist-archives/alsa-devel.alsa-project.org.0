Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA6F52D962
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:52:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB141167B;
	Thu, 19 May 2022 17:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB141167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975554;
	bh=fx4O1+6VJloUREcg8uU9RNvXIjDDb1MfIb/nxHlLfGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ly3UEGs+L74rin9i911UaItdIk/xbhWw8q/5BAauaLo8OrNYRrlv7ujbFSttYEZ+v
	 PZe4v92zpWe1jt/lA7wicsob+ZgjEIht24RedeLbV2oQzdaSfGLgxRlCBtUWsHAv4F
	 C4wm1kSimIDOrhSyb3PDJi8+7gMdckWsO3mGfgLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACCE6F80613;
	Thu, 19 May 2022 17:44:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B53F805D7; Thu, 19 May 2022 17:44:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52017F8053C
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52017F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GnXSynfB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11v002261;
 Thu, 19 May 2022 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=12SYcb+LPlWeAIlnRTxwEljNJZIM/ewy54HOgWYskh4=;
 b=GnXSynfBzO8n537g+rp7kqP0/0lA9/JpYWRMNa9wbJbvkncces1SvZyk9UeX35jutn12
 uQ4Y2h9Rzef7efsUNa1BcbL80H1vVOrPSHiNkcqYdm+ruVDqLQjRPubT0HCwRyr121wT
 eGxaS3SuQVClqoRpl+x235/sUaYVinSYpdJMogMUZcXzJSGAqgwgCnvbzfg8dAPnh1N4
 JJ5WzMvpF9HZr691IJWzsiB2OsdTWIe1/yMndxjhdiHmZlKc+rlSYW2xHeGc/TsenSxt
 I+v5SiXdgtIzvO101BIz3eJGc05mx5b851MdtWzXKdmdgPjJz3kldB5tA/7s/a/KuxdW Yg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DE8D611D3;
 Thu, 19 May 2022 15:43:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 35/56] ASoC: fsl: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:42:57 +0100
Message-ID: <20220519154318.2153729-36-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XH-DUBRhSyMMMA3SDjeA6SJsnafPjfxH
X-Proofpoint-ORIG-GUID: XH-DUBRhSyMMMA3SDjeA6SJsnafPjfxH
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
 sound/soc/fsl/fsl_audmix.c | 2 +-
 sound/soc/fsl/fsl_esai.c   | 2 +-
 sound/soc/fsl/fsl_mqs.c    | 2 +-
 sound/soc/fsl/fsl_sai.c    | 2 +-
 sound/soc/fsl/fsl_ssi.c    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index c580dcb9a4cfe..43857b7a81c94 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -317,7 +317,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 }
 
 static const struct snd_soc_dai_ops fsl_audmix_dai_ops = {
-	.set_fmt_new  = fsl_audmix_dai_set_fmt,
+	.set_fmt  = fsl_audmix_dai_set_fmt,
 	.trigger      = fsl_audmix_dai_trigger,
 };
 
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 572bdaee73eb6..75f7807df29af 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -790,7 +790,7 @@ static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.trigger = fsl_esai_trigger,
 	.hw_params = fsl_esai_hw_params,
 	.set_sysclk = fsl_esai_set_dai_sysclk,
-	.set_fmt_new = fsl_esai_set_dai_fmt,
+	.set_fmt = fsl_esai_set_dai_fmt,
 	.set_tdm_slot = fsl_esai_set_dai_tdm_slot,
 };
 
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 371d441b1dbef..fc539a1392509 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -152,7 +152,7 @@ static const struct snd_soc_dai_ops fsl_mqs_dai_ops = {
 	.startup = fsl_mqs_startup,
 	.shutdown = fsl_mqs_shutdown,
 	.hw_params = fsl_mqs_hw_params,
-	.set_fmt_new = fsl_mqs_set_dai_fmt,
+	.set_fmt = fsl_mqs_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver fsl_mqs_dai = {
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 3edd302eb5c22..f67d8527876e7 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -704,7 +704,7 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
 	.set_sysclk	= fsl_sai_set_dai_sysclk,
-	.set_fmt_new	= fsl_sai_set_dai_fmt,
+	.set_fmt	= fsl_sai_set_dai_fmt,
 	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
 	.hw_params	= fsl_sai_hw_params,
 	.hw_free	= fsl_sai_hw_free,
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 32e4cf37c2029..7dd0c48cd9ae4 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1156,7 +1156,7 @@ static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
 	.shutdown = fsl_ssi_shutdown,
 	.hw_params = fsl_ssi_hw_params,
 	.hw_free = fsl_ssi_hw_free,
-	.set_fmt_new = fsl_ssi_set_dai_fmt,
+	.set_fmt = fsl_ssi_set_dai_fmt,
 	.set_tdm_slot = fsl_ssi_set_dai_tdm_slot,
 	.trigger = fsl_ssi_trigger,
 };
-- 
2.30.2

