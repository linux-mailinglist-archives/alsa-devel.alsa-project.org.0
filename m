Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC8C26AD25
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 21:10:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4886A168D;
	Tue, 15 Sep 2020 21:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4886A168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600197023;
	bh=m0xkLEu8BLbZKsEEBW9qzMsiQIZsGaZgIyuB2OCvEHM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNQokJzPv+61UrFRKpuTq4cNBWmhnC+zfifSo9vlUor1gZQCJ2d14i+GEejsOWoIk
	 NzYjNDce+Ozd2nLG2MFCvoqzGPANFmdevqRBjZD9mzzTj2dm6oyWpHckNd76D9Ttkr
	 HIhFfNhnlU0aCxgIKmc2FJgr/PaVvszbHHlZRkFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C589FF802E8;
	Tue, 15 Sep 2020 21:06:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9913DF802E1; Tue, 15 Sep 2020 21:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66BE3F802E0
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 21:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66BE3F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IO5DMOoX"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ6T8e060905;
 Tue, 15 Sep 2020 14:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600196789;
 bh=D4KwWA3PAUDgR7udHAL3tu/8wxSo8YWIeqTiceCZ3J0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=IO5DMOoX3KpUlEAILLPSCVQ9CkqRfGBaw0gaW/H9C9AT1GyXdyO9709jDW8uGLYZR
 hv+7Ix/O8WpANRpaXr0yMYRw0/xrP+RtZ+nqeKPCptZmATY2KyM1Ezpww4KlsThPJt
 nwNTqYEkLhWW0qC2T/eIFdmiBd4UfVUdroy7d5ys=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08FJ6TYe060751
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 14:06:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 14:06:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 14:06:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ6Tiq102549;
 Tue, 15 Sep 2020 14:06:29 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 4/6] ASoC: tlv320adcx140: Add the config to configure Tx ASI
 output
Date: Tue, 15 Sep 2020 14:06:04 -0500
Message-ID: <20200915190606.1744-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200915190606.1744-1-dmurphy@ti.com>
References: <20200915190606.1744-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, camel.guo@axis.com
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

Add code to allow the ASI Tx output to be placed into High-z mode
during unused ASI cycles.  This allows for other devices that may be on
the bus to drive the ASI out. By default the 320adcx140 sends 0's for
unused cycles.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 11 +++++++++++
 sound/soc/codecs/tlv320adcx140.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 73d18e8002e4..7fa5c8682c51 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -839,6 +839,7 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	u32 gpi_input_val = 0;
 	int i;
 	int ret;
+	bool tx_high_z;
 
 	ret = device_property_read_u32(adcx140->dev, "ti,mic-bias-source",
 				      &bias_source);
@@ -930,6 +931,16 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		dev_err(adcx140->dev, "setting MIC bias failed %d\n", ret);
 
+	tx_high_z = device_property_read_bool(adcx140->dev, "ti,asi-tx-drive");
+	if (tx_high_z) {
+		ret = regmap_update_bits(adcx140->regmap, ADCX140_ASI_CFG0,
+				 ADCX140_TX_FILL, ADCX140_TX_FILL);
+		if (ret) {
+			dev_err(adcx140->dev, "Setting Tx drive failed %d\n", ret);
+			goto out;
+		}
+	}
+
 	adcx140_pwr_ctrl(adcx140, true);
 out:
 	return ret;
diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index 94c6d1fd2977..107bd7927d9c 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -146,5 +146,6 @@
 #define ADCX140_GPO_CFG_MAX		4
 #define ADCX140_GPO_DRV_MAX		5
 
+#define ADCX140_TX_FILL    BIT(0)
 
 #endif /* _TLV320ADCX140_ */
-- 
2.28.0

