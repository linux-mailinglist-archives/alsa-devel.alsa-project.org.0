Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2151A920
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 19:15:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4744716FA;
	Wed,  4 May 2022 19:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4744716FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651684558;
	bh=X1mZxkFwQ+/uuL1jQAEjLwoDOfXXaZIYsC778Cmz1GA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TyBLwo2rckjIJ/jH5vL4Avd3v7bVQYmxC2mZ9E9dSXvEsWc7n6Wp4b9yf3BeD2esv
	 CO0viBovl44O8KKYiLM1k8tEW46+5Ke/kjtlQzii1T+MyWGKx7Bwi/JO1movZbokPc
	 ZNS09xF0rh5+q5Xr9FmER+qm2dM4LN/2DbxAyqaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7490DF805C2;
	Wed,  4 May 2022 19:09:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B265F805C7; Wed,  4 May 2022 19:09:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86A20F805C5
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 19:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86A20F805C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BcRw2krZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAD021058;
 Wed, 4 May 2022 12:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=PRSBmR1vLscIqyEvR35nn0Bdk4VErdfF+QcvigdBmR4=;
 b=BcRw2krZWrkH7ct371SCR0lrvoGMVYQPvON5P38A/T+NNU+WUw3RBJmz+YelcQxN/BY0
 PoNm7EE7WiG26YqM8oCLU4+NeTEkl78BiwVjZLuXxuvUxcig2GX7CZKtUv6nFom31WMp
 YKM9U8bwkl65RaV6bbxJZeQlsWJdgi4nYNxB66B0qUld1sVRyrk8wYwkwSxeHpnhZHXa
 /iurcW+sDUm1Qfifv2ThjMauSWJJtJcuCmt9x1JCFI266o96rqCf+NEAwDg0I3TrdS0Q
 gEJf/sfrbpRqfUDZmkfBY7ZzUV0XcGhPJGOv6HM82EANhx7e+Onud81CrGXb7NPWhKUB Yg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 61BD7459;
 Wed,  4 May 2022 17:09:06 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 21/38] ASoC: pcm3060: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:48 +0100
Message-ID: <20220504170905.332415-22-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: rH5_Y_FmF_PjRbNP32lgmw508FUj3XFL
X-Proofpoint-GUID: rH5_Y_FmF_PjRbNP32lgmw508FUj3XFL
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
 sound/soc/codecs/pcm3060.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
index 4e3bfb9fa4442..586ec8c7246ca 100644
--- a/sound/soc/codecs/pcm3060.c
+++ b/sound/soc/codecs/pcm3060.c
@@ -255,6 +255,7 @@ static const struct snd_soc_component_driver pcm3060_soc_comp_driver = {
 	.num_dapm_widgets = ARRAY_SIZE(pcm3060_dapm_widgets),
 	.dapm_routes = pcm3060_dapm_map,
 	.num_dapm_routes = ARRAY_SIZE(pcm3060_dapm_map),
+	.endianness = 1,
 };
 
 /* regmap */
-- 
2.30.2

