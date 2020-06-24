Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AD32078EB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 18:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41EB51884;
	Wed, 24 Jun 2020 18:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41EB51884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593015558;
	bh=ArmfbbDnyFqNypH7WUuZRwZQVlDE7i4eEhwEoRqLh/8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YPHX9KFjhQD7e1huCOkHY1NbvPoPpF/spCRP+DXAwbrZIncXEi+mAe5Xe4YlLls34
	 Od5F7vWBCnYzWvuGVhcAbmK+sSFuCXgQaMGVkJ1+dupsCyYMLkgTt4TeRn4+ujdPaJ
	 sp3jmiihBhfJ8+OCGbMA9B1LhAtRmfmuOBUfsJ5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47FCBF802F7;
	Wed, 24 Jun 2020 18:15:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F9D2F802E0; Wed, 24 Jun 2020 18:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E861F80268
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 18:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E861F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="b0Tf4PR1"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05OGFMJC038562;
 Wed, 24 Jun 2020 11:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593015322;
 bh=Y5MdwCGXU77RAWVwX/WygJujeCPyLUiyCkJR3oQySLQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=b0Tf4PR1HtSIeUBiCHH1c4L6C++nPwuKH1nD4RmBvdwoK9GjKinpV1hJuquszow2i
 4NFo69/tYvk6j0xqcTWPBZuMJX5zc0joVtcGoQTjAAm39NpAys6GVP6+tSiVo99a60
 fQWfkb94FL+1WIRDI9iUld8s/r2f9qhNFoBVNRb8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05OGFHew058586
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 24 Jun 2020 11:15:17 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 24
 Jun 2020 11:15:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 24 Jun 2020 11:15:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OGFGhm099160;
 Wed, 24 Jun 2020 11:15:16 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v5 4/7] ASoC: tas2562: Add rx and tx slot programming
Date: Wed, 24 Jun 2020 11:14:56 -0500
Message-ID: <20200624161459.19248-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200624161459.19248-1-dmurphy@ti.com>
References: <20200624161459.19248-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org
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

Add programming for the tdm slots for both tx and rx offsets.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2562.c | 17 ++++++++++++++++-
 sound/soc/codecs/tas2562.h |  4 ++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index d26e30a2948c..2f1d4b697f01 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -208,6 +208,22 @@ static int tas2562_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	if (ret < 0)
 		return ret;
 
+	if (tx_mask > TAS2562_TX_OFF_MAX) {
+		dev_err(tas2562->dev, "TX slot is larger then %d",
+			TAS2562_TX_OFF_MAX);
+		return -EINVAL;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2562_TDM_CFG1,
+					    TAS2562_RX_OFF_MASK, rx_mask << 1);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_component_update_bits(component, TAS2562_TDM_CFG4,
+					    TAS2562_TX_OFF_MASK, tx_mask << 1);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -327,7 +343,6 @@ static int tas2562_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	ret = snd_soc_component_update_bits(component, TAS2562_TDM_CFG1,
 					    TAS2562_TDM_CFG1_RX_OFFSET_MASK,
 					    tdm_rx_start_slot);
-
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
index 28e75fc431d0..47e59c82eef3 100644
--- a/sound/soc/codecs/tas2562.h
+++ b/sound/soc/codecs/tas2562.h
@@ -34,6 +34,10 @@
 #define TAS2562_TDM_DET		TAS2562_REG(0, 0x11)
 #define TAS2562_REV_ID		TAS2562_REG(0, 0x7d)
 
+#define TAS2562_RX_OFF_MASK	GENMASK(5, 1)
+#define TAS2562_TX_OFF_MASK	GENMASK(3, 1)
+#define TAS2562_TX_OFF_MAX	7
+
 /* Page 2 */
 #define TAS2562_DVC_CFG1	TAS2562_REG(2, 0x0c)
 #define TAS2562_DVC_CFG2	TAS2562_REG(2, 0x0d)
-- 
2.26.2

