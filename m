Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 408E5525591
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 21:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E831AD3;
	Thu, 12 May 2022 21:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E831AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652382940;
	bh=DdhhLOFPZig1VU2iZKKY292fvAuM6yP8UHuXeREmE70=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W3um+rZ6O8fUuSS9jShP6FFnb9DZwjIhtiEx0ze6gcNAOu4UNcWyAjHvZ18EhdbcX
	 2vVX2RREMUStIKr15NNBa1xM2MTWOZudm2BVupRkD0O52fIJvcpN0qOsKNowgllbvp
	 NNUW4zz4dgUpuo01l8vMQIFAOGxbrhDlNIO2CbZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 214B8F80254;
	Thu, 12 May 2022 21:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56BF9F80245; Thu, 12 May 2022 21:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from 11.mo561.mail-out.ovh.net (11.mo561.mail-out.ovh.net
 [87.98.184.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EEFFF8011C
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 21:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EEFFF8011C
Received: from player691.ha.ovh.net (unknown [10.109.138.174])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 34F19244D3
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 19:14:29 +0000 (UTC)
Received: from mesotic.com (82-65-23-224.subs.proxad.net [82.65.23.224])
 (Authenticated sender: dylan.laduranty@mesotic.com)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id A18D62A832EF5;
 Thu, 12 May 2022 19:14:26 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005e3ab9ef5-d3e5-4fca-9458-7b69d4340694,
 22B69E6227CD80ADC50F3962316E1959FFA6139C)
 smtp.auth=dylan.laduranty@mesotic.com
X-OVh-ClientIp: 82.65.23.224
From: Dylan Laduranty <dylan.laduranty@mesotic.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2 v2] ASoC: ADAU7118: add bindings for managing pins drive
 strength
Date: Thu, 12 May 2022 21:13:51 +0200
Message-Id: <20220512191352.15602-1-dylan.laduranty@mesotic.com>
X-Mailer: git-send-email 2.17.1
X-Ovh-Tracer-Id: 6670956952226483404
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgddufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffosedttdertdertddtnecuhfhrohhmpeffhihlrghnucfnrgguuhhrrghnthihuceougihlhgrnhdrlhgrughurhgrnhhthiesmhgvshhothhitgdrtghomheqnecuggftrfgrthhtvghrnheptedvhfffvddtjedtheevhfdvteevfeelkefgvdekfeetfefftdfggfefjeeltedunecukfhppedtrddtrddtrddtpdekvddrieehrddvfedrvddvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrieeluddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpeguhihlrghnrdhlrgguuhhrrghnthihsehmvghsohhtihgtrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrgh
Cc: Dylan Laduranty <dylan.laduranty@mesotic.com>, nuno.sa@analog.com
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

This allows users to change SDATA and both PDM clocks pins drive strength during device probing according to their need.

Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
---

Changes since v1: split new bindings and documentation into separate patches

 sound/soc/codecs/adau7118.c | 62 ++++++++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index 841229dcbca1..18c1f246f911 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -29,6 +29,12 @@
 				FIELD_PREP(ADAU7118_LRCLK_BCLK_POL_MASK, x)
 #define ADAU7118_SPT_SLOT_MASK		GENMASK(7, 4)
 #define ADAU7118_SPT_SLOT(x)		FIELD_PREP(ADAU7118_SPT_SLOT_MASK, x)
+#define ADAU7118_DS_PDM_CLK0_MASK	GENMASK(1, 0)
+#define ADAU7118_DS_PDM_CLK0(x)		FIELD_PREP(ADAU7118_DS_PDM_CLK0_MASK, x)
+#define ADAU7118_DS_PDM_CLK1_MASK	GENMASK(3, 2)
+#define ADAU7118_DS_PDM_CLK1(x)		FIELD_PREP(ADAU7118_DS_PDM_CLK1_MASK, x)
+#define ADAU7118_DS_SDATA_MASK		GENMASK(5, 4)
+#define ADAU7118_DS_SDATA(x)		FIELD_PREP(ADAU7118_DS_SDATA_MASK, x)
 #define ADAU7118_FULL_SOFT_R_MASK	BIT(1)
 #define ADAU7118_FULL_SOFT_R(x)		FIELD_PREP(ADAU7118_FULL_SOFT_R_MASK, x)
 
@@ -489,7 +495,7 @@ static int adau7118_regulator_setup(struct adau7118_data *st)
 static int adau7118_parset_dt(const struct adau7118_data *st)
 {
 	int ret;
-	u32 dec_ratio = 0;
+	u32 val32 = 0;
 	/* 4 inputs */
 	u32 clk_map[4], regval;
 
@@ -497,9 +503,9 @@ static int adau7118_parset_dt(const struct adau7118_data *st)
 		return 0;
 
 	ret = device_property_read_u32(st->dev, "adi,decimation-ratio",
-				       &dec_ratio);
+				       &val32);
 	if (!ret) {
-		switch (dec_ratio) {
+		switch (val32) {
 		case 64:
 			regval = ADAU7118_DEC_RATIO(0);
 			break;
@@ -510,7 +516,7 @@ static int adau7118_parset_dt(const struct adau7118_data *st)
 			regval = ADAU7118_DEC_RATIO(2);
 			break;
 		default:
-			dev_err(st->dev, "Invalid dec ratio: %u", dec_ratio);
+			dev_err(st->dev, "Invalid dec ratio: %u", val32);
 			return -EINVAL;
 		}
 
@@ -537,6 +543,54 @@ static int adau7118_parset_dt(const struct adau7118_data *st)
 			return ret;
 	}
 
+	ret = device_property_read_u32(st->dev, "adi,pdm-clk0-ds",
+					&val32);
+	if (!ret) {
+		if (val32 > 3) {
+			dev_err(st->dev, "Invalid pdm-clk0-ds: %u", val32);
+			return -EINVAL;
+		}
+
+		ret = regmap_update_bits(st->map,
+					ADAU7118_REG_DRIVE_STRENGTH,
+					ADAU7118_DS_PDM_CLK0_MASK,
+					ADAU7118_DS_PDM_CLK0(val32));
+		if (ret)
+			return ret;
+	}
+
+	ret = device_property_read_u32(st->dev, "adi,pdm-clk1-ds",
+					&val32);
+	if (!ret) {
+		if (val32 > 3) {
+			dev_err(st->dev, "Invalid pdm-clk1-ds: %u", val32);
+			return -EINVAL;
+		}
+
+		ret = regmap_update_bits(st->map,
+					ADAU7118_REG_DRIVE_STRENGTH,
+					ADAU7118_DS_PDM_CLK1_MASK,
+					ADAU7118_DS_PDM_CLK1(val32));
+		if (ret)
+			return ret;
+	}
+
+	ret = device_property_read_u32(st->dev, "adi,sdata-ds",
+					&val32);
+	if (!ret) {
+		if (val32 > 3) {
+			dev_err(st->dev, "Invalid sdata-ds: %u", val32);
+			return -EINVAL;
+		}
+
+		ret = regmap_update_bits(st->map,
+					ADAU7118_REG_DRIVE_STRENGTH,
+					ADAU7118_DS_SDATA_MASK,
+					ADAU7118_DS_SDATA(val32));
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.17.1

