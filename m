Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C011D3031
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 14:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC606166F;
	Thu, 14 May 2020 14:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC606166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589460370;
	bh=B4xpKbOEwunkDybNxLoKMmQlDU/GVAVtv1tPc43J8TQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ajjEo0EeBsETPqAlcBvRsUy2WN3du3Hq9mly2MK4XQTjGibb/5eXaOcOgxpZW2563
	 LcL1c78WR7B6UXpmjHBofCeiWdco/Af9NsuQ37OMEUUnYItU86SP1GYpHNl4yAIhZJ
	 +szYUGboYQUakzefGwJjk74v1v8SkVuJV/0wk6lI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 298CCF800E3;
	Thu, 14 May 2020 14:43:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47109F8027D; Thu, 14 May 2020 14:43:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37E44F80274
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 14:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E44F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZzYL2yj4"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04EChLJW068221;
 Thu, 14 May 2020 07:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589460201;
 bh=e5oLHvSAcu1wID8AuM4YdTSx1fGtweYfUrxREiY/l9M=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZzYL2yj4lW+zhLcKMjsSTdTS2fE29lTKlJ8Ggipl0k8j3MPxk5B3VZXMxQJYjqbya
 7CXtPd1IQRbCKiqb7+1bbug0Fp2QmrztoxTl2a2AL9D7ku42OwaRNIO2P67p5TPKfa
 gXpaubt1qVABlteXdF/td+vUct15nOCJzrupxfZ8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04EChLME122019
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 14 May 2020 07:43:21 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 May 2020 07:43:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 May 2020 07:43:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04EChLrv030975;
 Thu, 14 May 2020 07:43:21 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 3/3] ASoC: tlv320adcx140: Configure PDM sampling edge
Date: Thu, 14 May 2020 07:33:38 -0500
Message-ID: <20200514123338.20392-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514123338.20392-1-dmurphy@ti.com>
References: <20200514123338.20392-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Configure the PDM sampling edges based on the values from the firmware.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 22 ++++++++++++++++++++++
 sound/soc/codecs/tlv320adcx140.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 97634e0ca0ba..140a5802a9a9 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -760,6 +760,10 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	int sleep_cfg_val = ADCX140_WAKE_DEV;
 	u8 bias_source;
 	u8 vref_source;
+	int pdm_count;
+	u32 pdm_edges[ADCX140_NUM_PDM_EDGES];
+	u32 pdm_edge_val = 0;
+	int i;
 	int ret;
 
 	ret = device_property_read_u8(adcx140->dev, "ti,mic-bias-source",
@@ -786,6 +790,24 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 
 	bias_source |= vref_source;
 
+	pdm_count = device_property_count_u32(adcx140->dev,
+					      "ti,pdm-edge-select");
+	if (pdm_count <= ADCX140_NUM_PDM_EDGES && pdm_count > 0) {
+		ret = device_property_read_u32_array(adcx140->dev,
+						     "ti,pdm-edge-select",
+						     pdm_edges, pdm_count);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < pdm_count; i++)
+			pdm_edge_val |= pdm_edges[i] << (ADCX140_PDM_EDGE_SHIFT - i);
+
+		ret = regmap_write(adcx140->regmap, ADCX140_PDM_CFG,
+				   pdm_edge_val);
+		if (ret)
+			return ret;
+	}
+
 	ret = adcx140_reset(adcx140);
 	if (ret)
 		goto out;
diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index 6d055e55909e..432eaf25d1a7 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -128,4 +128,7 @@
 
 #define ADCX140_TX_OFFSET_MASK		GENMASK(4, 0)
 
+#define ADCX140_NUM_PDM_EDGES		4
+#define ADCX140_PDM_EDGE_SHIFT		7
+
 #endif /* _TLV320ADCX140_ */
-- 
2.26.2

