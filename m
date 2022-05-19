Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 253FE52D999
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B802C177C;
	Thu, 19 May 2022 17:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B802C177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975877;
	bh=YbKjYJvOJk4aBhbK0tgq7prXu4NfoImXL6I3kcHXZ6E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQsPZtwtA5PlSsjBwRgZGb33vH7p5rqAdxzlP3MEdM1OQW2pOIVMoCF2MJ6G+ldyt
	 E+LuhliE1eNvmhj37ABDQ9hpMBDQiu03jBiYNUcqLqjEBxi7149cn0mTDkgc0d66eQ
	 Dm8An+4sZoF7O99U/C7KSPbS4PpbO0+9LURfbgto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C14DF8065B;
	Thu, 19 May 2022 17:44:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAA20F80621; Thu, 19 May 2022 17:44:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F25C8F80589
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F25C8F80589
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VQjZoP93"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mWF012194;
 Thu, 19 May 2022 10:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oil1ZKHs2gIMho1AoeBK9FgMU7gcVZ4wK4kjgOzdSgU=;
 b=VQjZoP93a0c8d+W/ugsjRxH9Fh1c1s3oEgc2mW54Kkr56QBRJ88v6LW8A8/rSjGStAsO
 Nf1wuE4VqmHUd+/RjkSpFuiZ0cMmWa3CdoAK0RCYsILdmBymnKNchfv1FYGaApL7R4fj
 kPxLk4H6KmvxU/TsS1AKvB1RzEZDzrpsOhNLC+OtRHWFmJnim4Yl0ypQBX2NYM2tFmwh
 SlabDEdIZwWaFx6REBIak6ICHrHTatIr57nUQyEjgxgcyiy0INoclm90w5blGBoZOg/a
 io4sDZ82+vQyPAxpgqierRNnmO+F8kkxvNZAAIKN0iQyMoEssAq1im2hGfWe9JzGdOXB PQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6025911DA;
 Thu, 19 May 2022 15:43:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 56/56] ASoC: simple-card-utils: Move
 snd_soc_component_is_codec to be local
Date: Thu, 19 May 2022 16:43:18 +0100
Message-ID: <20220519154318.2153729-57-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: g2VJ5uiOojlv2ZUJ1ZRM-SzjnwXJaEpV
X-Proofpoint-ORIG-GUID: g2VJ5uiOojlv2ZUJ1ZRM-SzjnwXJaEpV
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

The helper function snd_soc_component_is_codec is based off the
presence of the non_legacy_dai_naming flag. This isn't super robust
as CPU side components may also specify this flag, and indeed the
kernel already contains a couple that do. After componentisation there
isn't really a totally robust solution to identifying what is a CODEC
driver, without introducing a flag specifically for that purpose, and
really the desirable direction to move in is that the distinction
doesn't matter.

This patch does two things to try to mitigate these problems. Firstly,
now that all the other users of the helper function have been removed,
it makes the helper function local to the driver rather, than being
part of the core. This should help to discourage any new code from
being created that depends on the CODEC driver distinction. Secondly,
it updates the helper function itself to use the endianness flag
rather than the non_legacy_dai_naming flag. The endianness flag is
definitely invalid on a CPU side component, so it a more reliable
indicator that the device is definitely a CODEC. The vast majority of
buses require the CODEC to set the endianness flag, so the number of
corner cases should be fairly minimal. It is worth noting that CODECs
sending audio over SPI, or built into the CPU CODECs are potential
corner cases, however the hope is that in most cases those types of
devices do not consitute a simple audio card.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h         | 5 -----
 sound/soc/generic/simple-card-utils.c | 7 ++++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5a764c3099d3e..5c4cfa70b018c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -348,11 +348,6 @@ static inline int snd_soc_component_cache_sync(
 	return regcache_sync(component->regmap);
 }
 
-static inline int snd_soc_component_is_codec(struct snd_soc_component *component)
-{
-	return component->driver->non_legacy_dai_naming;
-}
-
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 539d7f081bd79..50a9827089335 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -513,6 +513,11 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static inline int asoc_simple_component_is_codec(struct snd_soc_component *component)
+{
+	return component->driver->endianness;
+}
+
 static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
 					    struct simple_dai_props *dai_props)
 {
@@ -524,7 +529,7 @@ static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
 
 	/* Only Codecs */
 	for_each_rtd_components(rtd, i, component) {
-		if (!snd_soc_component_is_codec(component))
+		if (!asoc_simple_component_is_codec(component))
 			return 0;
 	}
 
-- 
2.30.2

