Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE451A89B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 19:13:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDC0016BC;
	Wed,  4 May 2022 19:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDC0016BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651684411;
	bh=fi4qgg8kfGyz6Zf3xzkH48K5dcHhozayqdePFwW8ej4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cMJJTIlPyLxj8NYbmALpY6rRUkalm6yBO+bFdc+rXKOQFYkT4P861sFeXNmVe9CAM
	 BrVD3Ae4kNd+spriGTXGLW6ry/T6H27AiWD1o1UH4a4mNpi6YYzudGOaIl6OhtqFYx
	 4lW8esB5UgJUZUtY4e7GaMhp1+lw9JHF6RS93dtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D23DF80528;
	Wed,  4 May 2022 19:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD034F80548; Wed,  4 May 2022 19:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE1CF80508
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 19:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE1CF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oV++uEMc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqC001835;
 Wed, 4 May 2022 12:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=5CPa81SfyLqdlyC7KvgtFBBAAHzWfo4nMUT95WgRFtM=;
 b=oV++uEMcS6GDAQvCr6Ok+rNey9GL1A7JErmBI2vfwu7H/enbwx9wpQk7jOBPszC6POFV
 BoFpmMQKMPAoxblmqqt2oDqBgz3gChtkBw4aPLPsvin6/T+rlvh8S/HsNODfZs+1PUVd
 fLlDcBwE0TrfR1ZyTcBqNn4Oc/+K0fQJHm6KK5LwDBRqZ4bUWj6fYGzcr/q+Hojz88/u
 aoRm4p6ide/6Zw92xRHSZps5nyZas8sOwFk3C6W5fr1mrYETRAoo69mjHJmdRcpliQeH
 UwrtMz2bZLUZeeX/buoykvFtSO2Urxfb7naBLPBJ8XRQfHyFjdd5fuIAK6e1bL9erv5d iw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1817F459;
 Wed,  4 May 2022 17:09:06 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 15/38] ASoC: cx2072x: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:42 +0100
Message-ID: <20220504170905.332415-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VcoAWQ5rCW6ZjtMwCZQy0I8qltyxIIf5
X-Proofpoint-GUID: VcoAWQ5rCW6ZjtMwCZQy0I8qltyxIIf5
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
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cx2072x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 0d3a00434c6d6..b35debb5818db 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1527,6 +1527,7 @@ static const struct snd_soc_component_driver soc_codec_driver_cx2072x = {
 	.num_dapm_widgets = ARRAY_SIZE(cx2072x_dapm_widgets),
 	.dapm_routes = cx2072x_intercon,
 	.num_dapm_routes = ARRAY_SIZE(cx2072x_intercon),
+	.endianness = 1,
 };
 
 /*
-- 
2.30.2

