Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7251A93E
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 19:16:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0ADD16ED;
	Wed,  4 May 2022 19:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0ADD16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651684584;
	bh=EhU7u9McYpZsYHzdQS/L23C80oFN609oMFW8L7NeOuc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HWoSOnX1duEa2LPxhjyWvojHoizFYQ1BbwZ6nAA59m5MgIHFhM1eKjAUpIZO150tF
	 kREeY8s8pzCGRLICdkFRfxmZXrQIQ9G1EybVLVD/HtK03pg1NJVzzHcsRpUOJupaER
	 mKbq6FRUtBNNuwADZWNWsYhoGqbhvvpmQvE5Gk9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5447BF805E0;
	Wed,  4 May 2022 19:10:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ECF7F805D9; Wed,  4 May 2022 19:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F913F805D6
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 19:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F913F805D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="FEdicFys"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqF001835;
 Wed, 4 May 2022 12:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=N70CgzfPRFiDL3i/BgnSWsROeIsYdnqRncPM8jMsPxI=;
 b=FEdicFysSh+imBwM3TBkOycRhOWBNda7lKROVcfYUlMEiaMf07uxSuLpJljhJzi+jOoU
 xG3QfkZJjP8l/7hChEsIRNza3kZtc6dZvylWpd7/gM0hENHd9TZgulCRiB8WxBVRGhHB
 ARgRbnzbGFVFDIeHm2RI6ZjLPsUgFo4jdtOpjmB2RJXe3Zu7kn3nSzIg/XkHZkdCwqwv
 ljWQhENoeexVobzlvGUd2W9D9wki0I/oMw2j7VsbGxIapXrK8SlSN7TEzFTqdLUr0KEU
 awjd9zTPrcBcT5AgwUDZFAA8ieLb6AnVHrc1hWjxBpKxMAXU34uuus7lSA9Pm+VB5eJn 1Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A4BB511D4;
 Wed,  4 May 2022 17:09:06 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 26/38] ASoC: cros_ec_codec: Add endianness flag in
 i2s_rx_component_driver
Date: Wed, 4 May 2022 18:08:53 +0100
Message-ID: <20220504170905.332415-27-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: uagaiIz6ub4aNnKz_RIkJXGGBhHmjZbu
X-Proofpoint-GUID: uagaiIz6ub4aNnKz_RIkJXGGBhHmjZbu
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, steven.eckhoff.opensource@gmail.com,
 alexandre.belloni@bootlin.com, lars@metafoo.de,
 kuninori.morimoto.gx@renesas.com, kmarinushkin@birdec.com,
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com,
 chrome-platform@lists.linux.dev, codrin.ciubotariu@microchip.com,
 alsa-devel@alsa-project.org, bleung@chromium.org, cychiang@chromium.org
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

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. The i2s_rx component receives audio over an I2S DAI and as such
should have endianness applied.

A fixup is also required to use the width directly rather than relying
on the format in hw_params, now both little and big endian would be
supported.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cros_ec_codec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 9b92e1a0d1a3a..8b0a9c788a264 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -232,11 +232,11 @@ static int i2s_rx_hw_params(struct snd_pcm_substream *substream,
 	if (params_rate(params) != 48000)
 		return -EINVAL;
 
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_LE:
+	switch (params_width(params)) {
+	case 16:
 		depth = EC_CODEC_I2S_RX_SAMPLE_DEPTH_16;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
+	case 24:
 		depth = EC_CODEC_I2S_RX_SAMPLE_DEPTH_24;
 		break;
 	default:
@@ -387,6 +387,7 @@ static const struct snd_soc_component_driver i2s_rx_component_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(i2s_rx_dapm_widgets),
 	.dapm_routes		= i2s_rx_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(i2s_rx_dapm_routes),
+	.endianness		= 1,
 };
 
 static void *wov_map_shm(struct cros_ec_codec_priv *priv,
-- 
2.30.2

