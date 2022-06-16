Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DE555201E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079ED1F18;
	Mon, 20 Jun 2022 17:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079ED1F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655738136;
	bh=9k48uS211fiOG/y22BQmbOrytWSTnqWb3abxwJPfoQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJaegWKoCxXTigxgTfW3Pz0BK/oUbnaM2NE33M1D2TGS7RJ4IjPQQucc9Gd53fHyu
	 ChBcXKNLUPnsQ12vDiiHNbNMWW96z9tH7KefhR4Rbh+G6ol447K1mqMaDcKE+Ca/BA
	 Wpxa14LCutEb9eNcuCdM4EnREGJ/7BBoJtzwTPz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D324F805FF;
	Mon, 20 Jun 2022 17:07:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0084F80539; Thu, 16 Jun 2022 16:35:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93F95F8053B
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93F95F8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dxLEgYUi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJf015765;
 Thu, 16 Jun 2022 09:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/OMdhXcsYqZcTE4Jgb/VhFYJ4Ynjb6jiPAj/sWZDfIM=;
 b=dxLEgYUivTIu7nkU3bcr+h40MtfUSuiMMJRkE1dgGKHi8+KAFIQegHWVKQ09BV97NarO
 XBaQso6YiS8V2zmY0Smv941b0v9Zmij7Ecjq+b/9F3sQtbC5/lLlgrSuF+UK/1O7Wc1B
 x9grXSoV8XwFpA3H0+Ph6PLnmC4FtntikRfgJlY5FUgzEVrFTiSnJYzMXVAiZff+4/1+
 b895Dx/1do6U+rr5xDPWciHrkUVltUMUhJGyj4jVRZUsOLonqheZsJzoeYgxspK38Z4k
 AVPFuY9N6fx8ao3R/soH2OZ2wnOBcIM5skUFvLM8srghhq429+1JpXwS4ZFmHgEBmZG4 tQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AF63211DA;
 Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 34/96] ASoC: core: Switch core to new DAI naming flag
Date: Thu, 16 Jun 2022 15:33:27 +0100
Message-ID: <20220616143429.1324494-35-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Q4LsWqzZadA8Y31Ql8B7HUtp73F-6jml
X-Proofpoint-GUID: Q4LsWqzZadA8Y31Ql8B7HUtp73F-6jml
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:45 +0200
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

Now all the drivers are updated to have the new legacy_dai_naming
flag, update the core code so it also uses the new flag. Paving
the way for the old non_legacy_dai_naming flag to be removed.

It should be noted this patch will affect the CODEC drivers that don't
specify the non_legacy_dai_naming flag. These drivers will update from
using legacy DAI naming to the new scheme after this patch, this is
being considered a fix as the intention was for all CODEC drivers to use
the new scheme and all existing CODEC drivers were updated to do so
before componentisation. This just corrects those devices that have
snuck in since componentisation. The corrected devices are as
follows:

adau1372, cros_ec_codec, cs35l41, cs35l45, cx2072x, hdac_hda,
jz4725/60/70, lpass-rx/tx/va/wsa-macro, max98504, max9877,
mt6351/58/59, mt6660, pcm3060, rk3328, rt1308/16, rt5514,
rt5677, rt700/11/15, rt9120, sdw-mockup, tlv320adc3xxx, tscs454,
wcd9335/4x/8x, wsa881x

Some of these devices are used in some in kernel machine drivers,
however it appears all the usages use the actual DAI driver name
(since snd_soc_find_dai checks both the DAI name and the DAI driver
name). So it is not believed this change will break any in tree
machine drivers.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 57f7105c12b76..469c7cfe6240c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2490,7 +2490,7 @@ static int snd_soc_register_dais(struct snd_soc_component *component,
 
 	for (i = 0; i < count; i++) {
 		dai = snd_soc_register_dai(component, dai_drv + i, count == 1 &&
-					   !component->driver->non_legacy_dai_naming);
+					   component->driver->legacy_dai_naming);
 		if (dai == NULL) {
 			ret = -ENOMEM;
 			goto err;
-- 
2.30.2

