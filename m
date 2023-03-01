Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF76A6BDD
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:41:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47D6C843;
	Wed,  1 Mar 2023 12:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47D6C843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677670876;
	bh=5tklInZTjxW7nUOT7xUU9g3nrOpxKYCG1GaGB1k0my8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aKjP93tbhA4GQZM5c+2SLuELbSa56A8bi3Tq8x2Ee2n1kxxeQq+XEBk+MFBJq6rs/
	 dsC1RjxFLenDsc+B7ehatuQsgT0gZ5nIQQX26Onf+x2XCqgka6Eo/5eN0TzZdHJRD3
	 GGMN0LnEalm+NPHX2EY6Kz1VY/mYCBMxcCDSNJOU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BF36F80553;
	Wed,  1 Mar 2023 12:38:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AD3EF80544; Wed,  1 Mar 2023 12:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9C75F8052E
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9C75F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=2GbAd0fY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677670731; x=1709206731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5tklInZTjxW7nUOT7xUU9g3nrOpxKYCG1GaGB1k0my8=;
  b=2GbAd0fY1RigRvxtgc8ZfGhuN+5GLhmlX+dEpur6fCrZqx4XojQsnqLe
   NKYuKLd/heECPSEZa0XXngaUC+bCGcO09L486QXrfkuuYMy/z61wdtid6
   fYLLX7TbQSEkPoXKKYXIaKyQwWmUY6AuPfVsWVFaTD4DJV9grAcVibmHR
   nllPSA0Q+17H5T4LLDPqzDw8OIZOWmT9PoCIt17JnEj9F0Qcxbc1OAnEZ
   v5yvpK5mos+GWybFNj4M1ITbfQZBbym1WfE33V1Q6xfq48fHdaf17VhIx
   6ZYWSqEIXv5pB0+wSkzluN3QpZAytLOjq3hWafFYeykTm5D6Z1zoF83N6
   A==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673938800";
   d="scan'208";a="139640258"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 04:38:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 04:38:41 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 1 Mar 2023 04:38:37 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 4/8] ASoC: mchp-pdmc: use FIELD_PREP() where possible
Date: Wed, 1 Mar 2023 13:38:03 +0200
Message-ID: <20230301113807.24036-5-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301113807.24036-1-claudiu.beznea@microchip.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: CQNKYIZQGF3QGDCS7TDNCII75CYDAW3W
X-Message-ID-Hash: CQNKYIZQGF3QGDCS7TDNCII75CYDAW3W
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQNKYIZQGF3QGDCS7TDNCII75CYDAW3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use FIELD_PREP() macro where possible instead of driver local defined
macros.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 1aed3baa9369..6ec5324fd65e 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/sound/microchip,pdmc.h>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -49,8 +50,6 @@
 #define MCHP_PDMC_MR_OSR256		(3 << 16)
 
 #define MCHP_PDMC_MR_SINCORDER_MASK	GENMASK(23, 20)
-#define MCHP_PDMC_MR_SINCORDER(order)	(((order) << 20) & \
-					 MCHP_PDMC_MR_SINCORDER_MASK)
 
 #define MCHP_PDMC_MR_SINC_OSR_MASK	GENMASK(27, 24)
 #define MCHP_PDMC_MR_SINC_OSR_DIS	(0 << 24)
@@ -62,8 +61,6 @@
 #define MCHP_PDMC_MR_SINC_OSR_256	(6 << 24)
 
 #define MCHP_PDMC_MR_CHUNK_MASK		GENMASK(31, 28)
-#define MCHP_PDMC_MR_CHUNK(chunk)	(((chunk) << 28) & \
-					 MCHP_PDMC_MR_CHUNK_MASK)
 
 /*
  * ---- Configuration Register (Read/Write) ----
@@ -617,10 +614,10 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 
 	mr_val |= mchp_pdmc_mr_set_osr(dd->audio_filter_en, osr);
 
-	mr_val |= MCHP_PDMC_MR_SINCORDER(dd->sinc_order);
+	mr_val |= FIELD_PREP(MCHP_PDMC_MR_SINCORDER_MASK, dd->sinc_order);
 
 	dd->addr.maxburst = mchp_pdmc_period_to_maxburst(snd_pcm_lib_period_bytes(substream));
-	mr_val |= MCHP_PDMC_MR_CHUNK(dd->addr.maxburst);
+	mr_val |= FIELD_PREP(MCHP_PDMC_MR_CHUNK_MASK, dd->addr.maxburst);
 	dev_dbg(comp->dev, "maxburst set to %d\n", dd->addr.maxburst);
 
 	snd_soc_component_update_bits(comp, MCHP_PDMC_MR,
-- 
2.34.1

