Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7508D51A897
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 19:12:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19694168D;
	Wed,  4 May 2022 19:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19694168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651684346;
	bh=AS8j4WwM3/L446RHcZ1NuDPVRGaCnslwh1Afk4De5pI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C30thDJLZW8g6tK0xNruRUxsRVMjsdkFjQWcJHlUN9N0Aq/SoVkwsLPvhqnJLVQ66
	 j6MW+qK08LM1lxBilNPIwd4Ma0/I4iTODvHjFg1BChX6rW3tEGhMgE5ijfUw2BWfbM
	 KfnbgqfyAw3tNf7s6rBBYah1XDnRXloFvy797gJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF8CF80552;
	Wed,  4 May 2022 19:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFCA7F80538; Wed,  4 May 2022 19:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D44F7F80507
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 19:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D44F7F80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RBO8PQjR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVq8001835;
 Wed, 4 May 2022 12:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=epPzlLGEOlrrbGIfh48/Ui6qXv0aQrzvwrAiH5BnENA=;
 b=RBO8PQjREXt0YeT7kt33+UdtJQDUldJrHBOGkufsxD9IDAcKgGmlqZeWgz37c6tMeODG
 r4StQ1PTM2G5k6y5WcrHgaof0dtzK3UnmBZMmBZgHleShBH7YVMJnFVqI8qHVUvoRpmE
 v1sv1LSjDUgfjUdBFQg5+il0K86jq9wJ7XjBf0jLYgxzGiiA0LhmBoC+Nd6l/nkaaTUV
 zOOHkqLtUgrbjFkjeEjYgGQ2JU72O5MFDE310k1ysnqTx6IHF7XILRAbfFBmEy6Ne3Om
 +F0V5gJ5mogsjLrm6zF5vBxTq+Qb1aZtVux4S1TPt6PDcm0kYKWzmZlxRpkaBTPuAmA3 Pg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C0D3811D1;
 Wed,  4 May 2022 17:09:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 10/38] ASoC: hdac_hda: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:37 +0100
Message-ID: <20220504170905.332415-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 42y-B7VDjPqN7dT7IBD8ETmXk2V1cu2i
X-Proofpoint-GUID: 42y-B7VDjPqN7dT7IBD8ETmXk2V1cu2i
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
link. This device receives audio over an HDA DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/hdac_hda.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index a9f61c7e44ee7..8debcee592247 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -571,13 +571,14 @@ static const struct snd_soc_dapm_widget hdac_hda_dapm_widgets[] = {
 };
 
 static const struct snd_soc_component_driver hdac_hda_codec = {
-	.probe		= hdac_hda_codec_probe,
-	.remove		= hdac_hda_codec_remove,
-	.idle_bias_on	= false,
-	.dapm_widgets           = hdac_hda_dapm_widgets,
-	.num_dapm_widgets       = ARRAY_SIZE(hdac_hda_dapm_widgets),
-	.dapm_routes            = hdac_hda_dapm_routes,
-	.num_dapm_routes        = ARRAY_SIZE(hdac_hda_dapm_routes),
+	.probe			= hdac_hda_codec_probe,
+	.remove			= hdac_hda_codec_remove,
+	.dapm_widgets		= hdac_hda_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(hdac_hda_dapm_widgets),
+	.dapm_routes		= hdac_hda_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(hdac_hda_dapm_routes),
+	.idle_bias_on		= false,
+	.endianness		= 1,
 };
 
 static int hdac_hda_dev_probe(struct hdac_device *hdev)
-- 
2.30.2

