Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED715520A9
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08B812098;
	Mon, 20 Jun 2022 17:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08B812098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655738731;
	bh=Yj3PqmIBpHIzyozrl+UfYUTqhbMmoZzKuZ+TgpJSw1k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OG1eX76330RXIPg8G4A5fZ/1ezrp96iIdR87Kn6ZUEvYbUPNMDSDgkQuMspokOhzX
	 ikEqtryGUfo8qoXPkwgzTlp9kcixeBVeVVOUmeDnf31jvKii9V3FMFeyy+679IhJIh
	 Cha2aFAoPjhjBXPXGY8xCSn2Qq5lOBsdVCDJVxBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEB6EF80772;
	Mon, 20 Jun 2022 17:07:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E955DF801D8; Thu, 16 Jun 2022 16:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4420FF80570
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4420FF80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ouPrD0vU"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBnCaM029573;
 Thu, 16 Jun 2022 09:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=XTmK71WuLA/9Ac99kLz4eBCLnu0emzzD2gDzWBOz9gw=;
 b=ouPrD0vUxrg5wqwMz6ytNI/eWUqeRG+CjEflUIy7GD/jbt5am5B8H/CHpL8CWd6OGrBT
 UJJlZGtExSrRRjCpUFflt9skPyFYfYfJIrm+HQ3aCT92QE/KMewWIRyOilJowkzFEwyk
 jX0WDjYT2amA/MfjQd2oJHmKBXztvsMq7mGBAC5VzZrcNv02PjgkjrMbyausVAh1JxgM
 IHDI5tJJCPJxA9UW1iMq9nXTJkKB4g7V/MAIJqA8nhnGFoHSEaAO3vaSzf1oFPTMaefC
 BwxhPiyuRl3eZt9cknm4Ms2c8WXSAjgAJZwghjhMmM9eXg5m2m/2qExHxQ+hDjdYjl2b KA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3m-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:44 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:33 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8263711DA;
 Thu, 16 Jun 2022 14:34:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 44/96] ASoC: topology: KUnit: Remove now redundant
 non_legacy_dai_naming flag
Date: Thu, 16 Jun 2022 15:33:37 +0100
Message-ID: <20220616143429.1324494-45-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nFsoe9Gac6mxi3v6zo_f_OUaPb_Nl9IN
X-Proofpoint-GUID: nFsoe9Gac6mxi3v6zo_f_OUaPb_Nl9IN
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

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-topology-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index ae3968161509c..f3ba2be259e5c 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -104,7 +104,6 @@ static const struct snd_soc_component_driver test_component = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe,
 	.remove = d_remove,
-	.non_legacy_dai_naming = 1,
 };
 
 /* ===== TOPOLOGY TEMPLATES ================================================= */
@@ -238,7 +237,6 @@ static int d_probe_null_comp(struct snd_soc_component *component)
 static const struct snd_soc_component_driver test_component_null_comp = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe_null_comp,
-	.non_legacy_dai_naming = 1,
 };
 
 static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
@@ -346,7 +344,6 @@ static int d_probe_null_fw(struct snd_soc_component *component)
 static const struct snd_soc_component_driver test_component_null_fw = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe_null_fw,
-	.non_legacy_dai_naming = 1,
 };
 
 static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
-- 
2.30.2

