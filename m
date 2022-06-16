Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CCE552121
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:35:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 390EF2860;
	Mon, 20 Jun 2022 17:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 390EF2860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739351;
	bh=9LQovC95FqkFEn9EkPegq9kSk3FrFhPVfuodp9nN0Z4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lem9cjy5AhKsS5Qsk67MJRSTaHINuK42dt2z0kC9WyVw6QvpPWts+MDud70U9ukB9
	 CsddfdaL/GsezAmj7scyUV66CiEd3xzApggLRo0s5wJr4uiEhg/8MkrHef8XMDNXq8
	 G7isbB/qGP9o/MzfP4WalfZgi0B9e5yqXVKi1jc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC34BF80CB6;
	Mon, 20 Jun 2022 17:08:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72741F80310; Thu, 16 Jun 2022 16:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49770F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49770F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gsdkNsfo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CG027888;
 Thu, 16 Jun 2022 09:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=NdWNqGk7KYNCnb6vF06SM0HZUNiwmzGy7/npWlCANTY=;
 b=gsdkNsfo/0O13JhpLG/Y6+/kJMHeayAZNaKGelZCe/HB68N4BqesyNXhHbOCDFQqUwPB
 /u9V891+dcl70g7R+PJrhdN9nzqabkNoc74zYBpj6YuYVzA9ZlQG3zw+jXJbqqc/gxVz
 PWPmhIZpW7vnyd/UNpjgrY4mBgbnwit1gZOQk5ko1OZjRhJCekop+6K3435/3WBslkaV
 MqPhFncyZpcWCAfO0FZhM11MicI1Yp8Rc5Q6WXamy/dwG3viSP7+Ny9oCYORDn+LfIFZ
 6nx1t5hKqtTaVpkE7f3j5qKFAEBsOx3MIrhNYH5q/y13IlXxh9ezb7OfJU5GO/rOXn0S aw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 99B5C11D4;
 Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 33/96] ASoC: samsung: Migrate to new style legacy DAI naming
 flag
Date: Thu, 16 Jun 2022 15:33:26 +0100
Message-ID: <20220616143429.1324494-34-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8_ol56DkCUVdYxwog0l7JC1OmNRUBq55
X-Proofpoint-ORIG-GUID: 8_ol56DkCUVdYxwog0l7JC1OmNRUBq55
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:46 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 vkoul@kernel.org, jarkko.nikula@bitmer.com, daniel@ffwll.ch,
 shawnguo@kernel.org, daniel@zonque.org
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

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/samsung/i2s.c         | 2 ++
 sound/soc/samsung/pcm.c         | 3 ++-
 sound/soc/samsung/s3c2412-i2s.c | 7 ++++---
 sound/soc/samsung/s3c24xx-i2s.c | 7 ++++---
 sound/soc/samsung/spdif.c       | 7 ++++---
 5 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index fdd9561c6a9f3..9505200f3d11b 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1143,6 +1143,8 @@ static const struct snd_soc_component_driver samsung_i2s_component = {
 
 	.suspend = i2s_suspend,
 	.resume = i2s_resume,
+
+	.legacy_dai_naming = 1,
 };
 
 #define SAMSUNG_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | \
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index c2eb3534bfccb..e859252ae5e6e 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -480,7 +480,8 @@ static struct snd_soc_dai_driver s3c_pcm_dai[] = {
 };
 
 static const struct snd_soc_component_driver s3c_pcm_component = {
-	.name		= "s3c-pcm",
+	.name			= "s3c-pcm",
+	.legacy_dai_naming	= 1,
 };
 
 static int s3c_pcm_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index ec1c6f9d76ac7..0579a352961cc 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -192,9 +192,10 @@ static struct snd_soc_dai_driver s3c2412_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver s3c2412_i2s_component = {
-	.name		= "s3c2412-i2s",
-	.suspend	= s3c2412_i2s_suspend,
-	.resume		= s3c2412_i2s_resume,
+	.name			= "s3c2412-i2s",
+	.suspend		= s3c2412_i2s_suspend,
+	.resume			= s3c2412_i2s_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int s3c2412_iis_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 4082ad7cbcc11..e760fc8b42636 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -415,9 +415,10 @@ static struct snd_soc_dai_driver s3c24xx_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver s3c24xx_i2s_component = {
-	.name		= "s3c24xx-i2s",
-	.suspend	= s3c24xx_i2s_suspend,
-	.resume		= s3c24xx_i2s_resume,
+	.name			= "s3c24xx-i2s",
+	.suspend		= s3c24xx_i2s_suspend,
+	.resume			= s3c24xx_i2s_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 47b6d19e43ffb..7d815e237e5c6 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -352,9 +352,10 @@ static struct snd_soc_dai_driver samsung_spdif_dai = {
 };
 
 static const struct snd_soc_component_driver samsung_spdif_component = {
-	.name		= "samsung-spdif",
-	.suspend	= spdif_suspend,
-	.resume		= spdif_resume,
+	.name			= "samsung-spdif",
+	.suspend		= spdif_suspend,
+	.resume			= spdif_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int spdif_probe(struct platform_device *pdev)
-- 
2.30.2

