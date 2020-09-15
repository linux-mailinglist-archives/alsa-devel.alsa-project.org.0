Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF42D26AD2A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 21:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C621693;
	Tue, 15 Sep 2020 21:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C621693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600197069;
	bh=kcQ9sGGB60O1ci3zTYYRnqomGIouler7LIjcuqR0qq0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p89MESjjdK5X0joHy3FAfYIyfYHl/uztEWB9RhZ6ntB5Ydo/WlEfmufIoyfe2bkXS
	 i0k9sXqc8z9w8ZnGW1cgg0aQMqp+SzQvTh8uAez5eqMm0LziP+kFNpXiZz7+eSbWwO
	 bk9xf8Yz/e1l/ViPIBW/hus2eH9/RgcWQ3XQ+K08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E39BF802FF;
	Tue, 15 Sep 2020 21:06:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1838F802FE; Tue, 15 Sep 2020 21:06:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA6AEF802E2
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 21:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA6AEF802E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CaZ8BHHg"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ6eHA013579;
 Tue, 15 Sep 2020 14:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600196800;
 bh=Y+ES+bpigo4uYOpFKr6Eobr2JA9TuVYc/K8vex49fgQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=CaZ8BHHg5fh7g1LwFUFPuh0jHpzmbLUbDdece9KOox+R6O7nEmoR0WhqU6pW2ayxe
 +fQS8rIvyXj56bb2+WsEq4/ICRrzkvGtVDb9hX9dDf1gqJnvoDEGaOZbbUsZcNUw8H
 1yUYhVAD8YJLUZd6dGifiwTijLQpMVZ6S7LOknmw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08FJ6ewi074083
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 14:06:40 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 14:06:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 14:06:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ6dtZ086050;
 Tue, 15 Sep 2020 14:06:39 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 6/6] ASoC: tlv320adcx140: Add channel slot programming
Date: Tue, 15 Sep 2020 14:06:06 -0500
Message-ID: <20200915190606.1744-6-dmurphy@ti.com>
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

Each channel can be assigned a specific slot to transmit data. This
assignment is done in the device tree.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 17 +++++++++++++++++
 sound/soc/codecs/tlv320adcx140.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 7fa5c8682c51..666b8f3091d0 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -837,6 +837,8 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	int gpi_count;
 	u32 gpi_inputs[ADCX140_NUM_GPI_PINS];
 	u32 gpi_input_val = 0;
+	int slot_count;
+	u32 slot_assignment[ADCX140_NUM_CH];
 	int i;
 	int ret;
 	bool tx_high_z;
@@ -941,6 +943,21 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 		}
 	}
 
+	slot_count = device_property_count_u32(adcx140->dev, "ti,slot-mapping");
+	if ((slot_count <= ADCX140_NUM_CH) && (slot_count > 0)) {
+		ret = device_property_read_u32_array(adcx140->dev, "ti,slot-mapping",
+						     slot_assignment, slot_count);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < slot_count; i++) {
+			ret = regmap_update_bits(adcx140->regmap, ADCX140_ASI_CH1 + i,
+						 ADCX140_SLOT_MSK, slot_assignment[i]);
+			if (ret)
+				return ret;
+		}
+	}
+
 	adcx140_pwr_ctrl(adcx140, true);
 out:
 	return ret;
diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index 107bd7927d9c..5eb27b94aa0a 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -147,5 +147,8 @@
 #define ADCX140_GPO_DRV_MAX		5
 
 #define ADCX140_TX_FILL    BIT(0)
+#define ADCX140_NUM_CH        8
+
+#define ADCX140_SLOT_MSK	GENMASK(5, 0)
 
 #endif /* _TLV320ADCX140_ */
-- 
2.28.0

