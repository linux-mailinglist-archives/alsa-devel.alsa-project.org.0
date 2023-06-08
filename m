Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A49727A6A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 10:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40C5682A;
	Thu,  8 Jun 2023 10:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40C5682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686214184;
	bh=TsKcmK9QZGJOPJ/OK2hMt+7KH5PMIKg71tTT0DRiI50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ioarb4qMA93gq5VtFbpcUueLnYnb0ew9DbecOnnShMjwfpV2EPHE8sP/cTH6jh+OM
	 qk7dxh3V+jb8P5gMgRT8CGPTdYwz+rpzBTv7JqYdVYzC7w/hOIj9El3wWgTIva9L0i
	 EIfsLUF0o7n1TLqXgbw7LPaUm1d6Gtet8k0kv+Vs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74A14F8057D; Thu,  8 Jun 2023 10:48:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AECE7F80551;
	Thu,  8 Jun 2023 10:48:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42C9FF80553; Thu,  8 Jun 2023 10:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83706F8016C
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 10:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83706F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ZhmXkxAi
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AB23E6606F1E;
	Thu,  8 Jun 2023 09:47:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214061;
	bh=TsKcmK9QZGJOPJ/OK2hMt+7KH5PMIKg71tTT0DRiI50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZhmXkxAiHv/iWg19l5VuDoRZKJ7fj7SlVFjyL4uJk69dZQsA8VtnKj2h7ynK4J9+B
	 nIdkhbMfRkW5s72ZrJa/DSwXw4FNKQcTc+9H6+joIS32fqIi+vlQlqJocpPVWJDUJl
	 VV8VLfEX/6iAXW3hXzNIozau+dUvkmHdlwM0dGziHnydlx/XTugc4yqZFILjze00v7
	 IF0W9lW/t15MZiACDXQBC3Ox05us8JuJIKaSFOhfC3w7SfiF4jn5JOvU2sdSMmv3m+
	 URgUclVMLLd/gj7TSs55IsWeQuHRnmNlUa0MO2Zo8b4irPPnO5/YT/RW2Jien8jBCM
	 Xf8STY0iCpDAQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	amergnat@baylibre.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 5/5] ASoC: mediatek: mt8188-mt6359: Use bitfield macros for
 registers
Date: Thu,  8 Jun 2023 10:47:27 +0200
Message-Id: <20230608084727.74403-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5JJ2PQR6WV6FAXI43KRHA5HHXL25GNMD
X-Message-ID-Hash: 5JJ2PQR6WV6FAXI43KRHA5HHXL25GNMD
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JJ2PQR6WV6FAXI43KRHA5HHXL25GNMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace open coded instances of FIELD_GET() with it, move register
definitions at the top of the file and also replace magic numbers
with register definitions.

While at it, also change a regmap_update_bits() call to regmap_write()
because the top 29 bits of AUD_TOP_CFG (31:3) are reserved (unused).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 32 ++++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 5b2660139421..ac69c23e0da1 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -6,6 +6,7 @@
  * Author: Trevor Wu <trevor.wu@mediatek.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -19,6 +20,15 @@
 #include "../common/mtk-afe-platform-driver.h"
 #include "../common/mtk-soundcard-driver.h"
 
+#define CKSYS_AUD_TOP_CFG	0x032c
+ #define RG_TEST_ON		BIT(0)
+ #define RG_TEST_TYPE		BIT(2)
+#define CKSYS_AUD_TOP_MON	0x0330
+ #define TEST_MISO_COUNT_1	GENMASK(3, 0)
+ #define TEST_MISO_COUNT_2	GENMASK(7, 4)
+ #define TEST_MISO_DONE_1	BIT(28)
+ #define TEST_MISO_DONE_2	BIT(29)
+
 #define NAU8825_HS_PRESENT	BIT(0)
 
 /*
@@ -251,9 +261,6 @@ static const struct snd_kcontrol_new mt8188_nau8825_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 };
 
-#define CKSYS_AUD_TOP_CFG 0x032c
-#define CKSYS_AUD_TOP_MON 0x0330
-
 static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_afe =
@@ -265,13 +272,13 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	struct mtkaif_param *param;
 	int chosen_phase_1, chosen_phase_2;
 	int prev_cycle_1, prev_cycle_2;
-	int test_done_1, test_done_2;
+	u8 test_done_1, test_done_2;
 	int cycle_1, cycle_2;
 	int mtkaif_chosen_phase[MT8188_MTKAIF_MISO_NUM];
 	int mtkaif_phase_cycle[MT8188_MTKAIF_MISO_NUM];
 	int mtkaif_calibration_num_phase;
 	bool mtkaif_calibration_ok;
-	unsigned int monitor = 0;
+	u32 monitor = 0;
 	int counter;
 	int phase;
 	int i;
@@ -303,8 +310,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	mt6359_mtkaif_calibration_enable(cmpnt_codec);
 
 	/* set test type to synchronizer pulse */
-	regmap_update_bits(afe_priv->topckgen,
-			   CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
+	regmap_write(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_TYPE);
 	mtkaif_calibration_num_phase = 42;	/* mt6359: 0 ~ 42 */
 	mtkaif_calibration_ok = true;
 
@@ -314,7 +320,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
 						    phase, phase, phase);
 
-		regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
+		regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
 
 		test_done_1 = 0;
 		test_done_2 = 0;
@@ -326,14 +332,14 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		while (!(test_done_1 & test_done_2)) {
 			regmap_read(afe_priv->topckgen,
 				    CKSYS_AUD_TOP_MON, &monitor);
-			test_done_1 = (monitor >> 28) & 0x1;
-			test_done_2 = (monitor >> 29) & 0x1;
+			test_done_1 = FIELD_GET(TEST_MISO_DONE_1, monitor);
+			test_done_2 = FIELD_GET(TEST_MISO_DONE_2, monitor);
 
 			if (test_done_1 == 1)
-				cycle_1 = monitor & 0xf;
+				cycle_1 = FIELD_GET(TEST_MISO_COUNT_1, monitor);
 
 			if (test_done_2 == 1)
-				cycle_2 = (monitor >> 4) & 0xf;
+				cycle_2 = FIELD_GET(TEST_MISO_COUNT_2, monitor);
 
 			/* handle if never test done */
 			if (++counter > 10000) {
@@ -361,7 +367,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 			mtkaif_phase_cycle[MT8188_MTKAIF_MISO_1] = prev_cycle_2;
 		}
 
-		regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
+		regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
 
 		if (mtkaif_chosen_phase[MT8188_MTKAIF_MISO_0] >= 0 &&
 		    mtkaif_chosen_phase[MT8188_MTKAIF_MISO_1] >= 0)
-- 
2.40.1

