Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B33BF874DF7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 12:47:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 546B7E69;
	Thu,  7 Mar 2024 12:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 546B7E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709812033;
	bh=a9JEFvUwTVuwqjXH9zivYh52MX7RhbBCVDFOk812vYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WVOYpkJOi+kcayoVnyLqIil7Xy5Y30pnzvDdK6DJ1O6QIRNUQ8NYI2K77hEJkSAVv
	 a6mOmleIlgHZ+188AFA+I7v7pAeFQxO4mSINUbEpk8cJSQOjCXC8MTvJfTmNX6VC5R
	 MarKo3m93XolnF514D6qswTZc46nyOM2qak/q80M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3603FF80682; Thu,  7 Mar 2024 12:45:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B350BF80682;
	Thu,  7 Mar 2024 12:45:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B81B5F80609; Thu,  7 Mar 2024 12:45:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5102F8024E
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 12:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5102F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=h8onTShE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709811900;
	bh=a9JEFvUwTVuwqjXH9zivYh52MX7RhbBCVDFOk812vYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h8onTShEu9kPBvlRNUN371hFoGAhCGRkk421kEt+/is5HTz+9GogQkbOXmEKpreJm
	 yfDAK9fJcu8StE5HbxAgFwQoU71sPVTpDyiz00POYdsYQmvn1VUPna0DH6D032aTqc
	 WMsDbMKtJOvTIymWhN9QTG51btZyddG4aDbwmjMg+RCJBMW0G03d/birSwpgK95uZk
	 MqctAtqx4FhYU9iWaTb8O4hNbxeCOwpud2Jaboaz3MDCNefj0VQm4ReUqA7smM0nxR
	 sPao/is3AfnlJAqOueMF6Y2+v0/9aW5MN87ZhC6H1ztb4XvCVSBDCBPfoUPDdEMFPw
	 7rV2UPSdNV2kg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1740737820EE;
	Thu,  7 Mar 2024 11:44:58 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 03/22] ASoC: mediatek: Commonize ADDA rate transform
 functions and enums
Date: Thu,  7 Mar 2024 12:44:26 +0100
Message-ID: <20240307114445.196981-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PX7BAIRKAEQMD7ZPELEIHKRQ3Z6CPQPW
X-Message-ID-Hash: PX7BAIRKAEQMD7ZPELEIHKRQ3Z6CPQPW
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PX7BAIRKAEQMD7ZPELEIHKRQ3Z6CPQPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Both the enumerations for UL/DL rates, delay data and the functions
adda_{dl,ul}_rate_transform were duplicated for each MediaTek SoC
dai-adda driver: move the common bits to a new mtk-dai-adda-common
file and its header.
While at it, also add the "mtk_" prefix to the exported functions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/common/Makefile            |  2 +
 .../soc/mediatek/common/mtk-dai-adda-common.c | 70 ++++++++++++++
 .../soc/mediatek/common/mtk-dai-adda-common.h | 45 +++++++++
 sound/soc/mediatek/mt6797/mt6797-dai-adda.c   | 85 +----------------
 sound/soc/mediatek/mt8183/mt8183-dai-adda.c   | 90 +-----------------
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c   | 92 +------------------
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c   | 89 +-----------------
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c   | 90 +-----------------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c   | 90 +-----------------
 9 files changed, 135 insertions(+), 518 deletions(-)
 create mode 100644 sound/soc/mediatek/common/mtk-dai-adda-common.c
 create mode 100644 sound/soc/mediatek/common/mtk-dai-adda-common.h

diff --git a/sound/soc/mediatek/common/Makefile b/sound/soc/mediatek/common/Makefile
index 42e636c10c1e..363cc258a3d5 100644
--- a/sound/soc/mediatek/common/Makefile
+++ b/sound/soc/mediatek/common/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # platform driver
 snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o mtk-dsp-sof-common.o mtk-soundcard-driver.o
+snd-soc-mtk-common-objs += mtk-dai-adda-common.o
+
 obj-$(CONFIG_SND_SOC_MEDIATEK) += snd-soc-mtk-common.o
 
 obj-$(CONFIG_SND_SOC_MTK_BTCVSD) += mtk-btcvsd.o
diff --git a/sound/soc/mediatek/common/mtk-dai-adda-common.c b/sound/soc/mediatek/common/mtk-dai-adda-common.c
new file mode 100644
index 000000000000..4dc1412489d6
--- /dev/null
+++ b/sound/soc/mediatek/common/mtk-dai-adda-common.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek ALSA SoC Audio DAI ADDA Common
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
+ *         AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+
+#include "mtk-base-afe.h"
+#include "mtk-dai-adda-common.h"
+
+unsigned int mtk_adda_dl_rate_transform(struct mtk_base_afe *afe, u32 rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_ADDA_DL_RATE_8K;
+	case 11025:
+		return MTK_AFE_ADDA_DL_RATE_11K;
+	case 12000:
+		return MTK_AFE_ADDA_DL_RATE_12K;
+	case 16000:
+		return MTK_AFE_ADDA_DL_RATE_16K;
+	case 22050:
+		return MTK_AFE_ADDA_DL_RATE_22K;
+	case 24000:
+		return MTK_AFE_ADDA_DL_RATE_24K;
+	case 32000:
+		return MTK_AFE_ADDA_DL_RATE_32K;
+	case 44100:
+		return MTK_AFE_ADDA_DL_RATE_44K;
+	case 48000:
+		return MTK_AFE_ADDA_DL_RATE_48K;
+	case 96000:
+		return MTK_AFE_ADDA_DL_RATE_96K;
+	case 192000:
+		return MTK_AFE_ADDA_DL_RATE_192K;
+	default:
+		dev_info(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
+			 __func__, rate);
+		return MTK_AFE_ADDA_DL_RATE_48K;
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_adda_dl_rate_transform);
+
+unsigned int mtk_adda_ul_rate_transform(struct mtk_base_afe *afe, u32 rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_ADDA_UL_RATE_8K;
+	case 16000:
+		return MTK_AFE_ADDA_UL_RATE_16K;
+	case 32000:
+		return MTK_AFE_ADDA_UL_RATE_32K;
+	case 48000:
+		return MTK_AFE_ADDA_UL_RATE_48K;
+	case 96000:
+		return MTK_AFE_ADDA_UL_RATE_96K;
+	case 192000:
+		return MTK_AFE_ADDA_UL_RATE_192K;
+	default:
+		dev_info(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
+			 __func__, rate);
+		return MTK_AFE_ADDA_UL_RATE_48K;
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_adda_ul_rate_transform);
diff --git a/sound/soc/mediatek/common/mtk-dai-adda-common.h b/sound/soc/mediatek/common/mtk-dai-adda-common.h
new file mode 100644
index 000000000000..208b0dd89f57
--- /dev/null
+++ b/sound/soc/mediatek/common/mtk-dai-adda-common.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
+ *         AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef _MTK_DAI_ADDA_COMMON_H_
+#define _MTK_DAI_ADDA_COMMON_H_
+
+struct mtk_base_afe;
+
+enum adda_input_mode_rate {
+	MTK_AFE_ADDA_DL_RATE_8K = 0,
+	MTK_AFE_ADDA_DL_RATE_11K = 1,
+	MTK_AFE_ADDA_DL_RATE_12K = 2,
+	MTK_AFE_ADDA_DL_RATE_16K = 3,
+	MTK_AFE_ADDA_DL_RATE_22K = 4,
+	MTK_AFE_ADDA_DL_RATE_24K = 5,
+	MTK_AFE_ADDA_DL_RATE_32K = 6,
+	MTK_AFE_ADDA_DL_RATE_44K = 7,
+	MTK_AFE_ADDA_DL_RATE_48K = 8,
+	MTK_AFE_ADDA_DL_RATE_96K = 9,
+	MTK_AFE_ADDA_DL_RATE_192K = 10,
+};
+
+enum adda_voice_mode_rate {
+	MTK_AFE_ADDA_UL_RATE_8K = 0,
+	MTK_AFE_ADDA_UL_RATE_16K = 1,
+	MTK_AFE_ADDA_UL_RATE_32K = 2,
+	MTK_AFE_ADDA_UL_RATE_48K = 3,
+	MTK_AFE_ADDA_UL_RATE_96K = 4,
+	MTK_AFE_ADDA_UL_RATE_192K = 5,
+	MTK_AFE_ADDA_UL_RATE_48K_HD = 6,
+};
+
+enum adda_rxif_delay_data {
+	DELAY_DATA_MISO1 = 0,
+	DELAY_DATA_MISO0 = 1,
+	DELAY_DATA_MISO2 = 1,
+};
+
+unsigned int mtk_adda_dl_rate_transform(struct mtk_base_afe *afe, u32 rate);
+unsigned int mtk_adda_ul_rate_transform(struct mtk_base_afe *afe, u32 rate);
+#endif
diff --git a/sound/soc/mediatek/mt6797/mt6797-dai-adda.c b/sound/soc/mediatek/mt6797/mt6797-dai-adda.c
index 0ac6409c6d61..78f3ad758c12 100644
--- a/sound/soc/mediatek/mt6797/mt6797-dai-adda.c
+++ b/sound/soc/mediatek/mt6797/mt6797-dai-adda.c
@@ -10,86 +10,7 @@
 #include "mt6797-afe-common.h"
 #include "mt6797-interconnection.h"
 #include "mt6797-reg.h"
-
-enum {
-	MTK_AFE_ADDA_DL_RATE_8K = 0,
-	MTK_AFE_ADDA_DL_RATE_11K = 1,
-	MTK_AFE_ADDA_DL_RATE_12K = 2,
-	MTK_AFE_ADDA_DL_RATE_16K = 3,
-	MTK_AFE_ADDA_DL_RATE_22K = 4,
-	MTK_AFE_ADDA_DL_RATE_24K = 5,
-	MTK_AFE_ADDA_DL_RATE_32K = 6,
-	MTK_AFE_ADDA_DL_RATE_44K = 7,
-	MTK_AFE_ADDA_DL_RATE_48K = 8,
-	MTK_AFE_ADDA_DL_RATE_96K = 9,
-	MTK_AFE_ADDA_DL_RATE_192K = 10,
-};
-
-enum {
-	MTK_AFE_ADDA_UL_RATE_8K = 0,
-	MTK_AFE_ADDA_UL_RATE_16K = 1,
-	MTK_AFE_ADDA_UL_RATE_32K = 2,
-	MTK_AFE_ADDA_UL_RATE_48K = 3,
-	MTK_AFE_ADDA_UL_RATE_96K = 4,
-	MTK_AFE_ADDA_UL_RATE_192K = 5,
-	MTK_AFE_ADDA_UL_RATE_48K_HD = 6,
-};
-
-static unsigned int adda_dl_rate_transform(struct mtk_base_afe *afe,
-					   unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_DL_RATE_8K;
-	case 11025:
-		return MTK_AFE_ADDA_DL_RATE_11K;
-	case 12000:
-		return MTK_AFE_ADDA_DL_RATE_12K;
-	case 16000:
-		return MTK_AFE_ADDA_DL_RATE_16K;
-	case 22050:
-		return MTK_AFE_ADDA_DL_RATE_22K;
-	case 24000:
-		return MTK_AFE_ADDA_DL_RATE_24K;
-	case 32000:
-		return MTK_AFE_ADDA_DL_RATE_32K;
-	case 44100:
-		return MTK_AFE_ADDA_DL_RATE_44K;
-	case 48000:
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_DL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_DL_RATE_192K;
-	default:
-		dev_warn(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	}
-}
-
-static unsigned int adda_ul_rate_transform(struct mtk_base_afe *afe,
-					   unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_UL_RATE_8K;
-	case 16000:
-		return MTK_AFE_ADDA_UL_RATE_16K;
-	case 32000:
-		return MTK_AFE_ADDA_UL_RATE_32K;
-	case 48000:
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_UL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_UL_RATE_192K;
-	default:
-		dev_warn(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	}
-}
+#include "../common/mtk-dai-adda-common.h"
 
 /* dai component */
 static const struct snd_kcontrol_new mtk_adda_dl_ch1_mix[] = {
@@ -246,7 +167,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 		regmap_write(afe->regmap, AFE_ADDA_PREDIS_CON1, 0);
 
 		/* set input sampling rate */
-		dl_src2_con0 = adda_dl_rate_transform(afe, rate) << 28;
+		dl_src2_con0 = mtk_adda_dl_rate_transform(afe, rate) << 28;
 
 		/* set output mode */
 		switch (rate) {
@@ -296,7 +217,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 				   0x1 << 0,
 				   0x0 << 0);
 
-		voice_mode = adda_ul_rate_transform(afe, rate);
+		voice_mode = mtk_adda_ul_rate_transform(afe, rate);
 
 		ul_src_con0 |= (voice_mode << 17) & (0x7 << 17);
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
index 5b8a274419ed..be69bcea2a78 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
@@ -10,6 +10,7 @@
 #include "mt8183-afe-common.h"
 #include "mt8183-interconnection.h"
 #include "mt8183-reg.h"
+#include "../common/mtk-dai-adda-common.h"
 
 enum {
 	AUDIO_SDM_LEVEL_MUTE = 0,
@@ -18,91 +19,6 @@ enum {
 	/* you need to change formula of hp impedance and dc trim too */
 };
 
-enum {
-	DELAY_DATA_MISO1 = 0,
-	DELAY_DATA_MISO2,
-};
-
-enum {
-	MTK_AFE_ADDA_DL_RATE_8K = 0,
-	MTK_AFE_ADDA_DL_RATE_11K = 1,
-	MTK_AFE_ADDA_DL_RATE_12K = 2,
-	MTK_AFE_ADDA_DL_RATE_16K = 3,
-	MTK_AFE_ADDA_DL_RATE_22K = 4,
-	MTK_AFE_ADDA_DL_RATE_24K = 5,
-	MTK_AFE_ADDA_DL_RATE_32K = 6,
-	MTK_AFE_ADDA_DL_RATE_44K = 7,
-	MTK_AFE_ADDA_DL_RATE_48K = 8,
-	MTK_AFE_ADDA_DL_RATE_96K = 9,
-	MTK_AFE_ADDA_DL_RATE_192K = 10,
-};
-
-enum {
-	MTK_AFE_ADDA_UL_RATE_8K = 0,
-	MTK_AFE_ADDA_UL_RATE_16K = 1,
-	MTK_AFE_ADDA_UL_RATE_32K = 2,
-	MTK_AFE_ADDA_UL_RATE_48K = 3,
-	MTK_AFE_ADDA_UL_RATE_96K = 4,
-	MTK_AFE_ADDA_UL_RATE_192K = 5,
-	MTK_AFE_ADDA_UL_RATE_48K_HD = 6,
-};
-
-static unsigned int adda_dl_rate_transform(struct mtk_base_afe *afe,
-					   unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_DL_RATE_8K;
-	case 11025:
-		return MTK_AFE_ADDA_DL_RATE_11K;
-	case 12000:
-		return MTK_AFE_ADDA_DL_RATE_12K;
-	case 16000:
-		return MTK_AFE_ADDA_DL_RATE_16K;
-	case 22050:
-		return MTK_AFE_ADDA_DL_RATE_22K;
-	case 24000:
-		return MTK_AFE_ADDA_DL_RATE_24K;
-	case 32000:
-		return MTK_AFE_ADDA_DL_RATE_32K;
-	case 44100:
-		return MTK_AFE_ADDA_DL_RATE_44K;
-	case 48000:
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_DL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_DL_RATE_192K;
-	default:
-		dev_warn(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	}
-}
-
-static unsigned int adda_ul_rate_transform(struct mtk_base_afe *afe,
-					   unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_UL_RATE_8K;
-	case 16000:
-		return MTK_AFE_ADDA_UL_RATE_16K;
-	case 32000:
-		return MTK_AFE_ADDA_UL_RATE_32K;
-	case 48000:
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_UL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_UL_RATE_192K;
-	default:
-		dev_warn(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	}
-}
-
 /* dai component */
 static const struct snd_kcontrol_new mtk_adda_dl_ch1_mix[] = {
 	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN3, I_DL1_CH1, 1, 0),
@@ -369,7 +285,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 		regmap_write(afe->regmap, AFE_ADDA_PREDIS_CON1, 0);
 
 		/* set sampling rate */
-		dl_src2_con0 = adda_dl_rate_transform(afe, rate) << 28;
+		dl_src2_con0 = mtk_adda_dl_rate_transform(afe, rate) << 28;
 
 		/* set output mode */
 		switch (rate) {
@@ -420,7 +336,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 				   0x1 << 0,
 				   0x0 << 0);
 
-		voice_mode = adda_ul_rate_transform(afe, rate);
+		voice_mode = mtk_adda_ul_rate_transform(afe, rate);
 
 		ul_src_con0 |= (voice_mode << 17) & (0x7 << 17);
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index ad6d4b5cf697..dbd157d1a1ea 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -11,6 +11,7 @@
 #include "mt8186-afe-common.h"
 #include "mt8186-afe-gpio.h"
 #include "mt8186-interconnection.h"
+#include "../common/mtk-dai-adda-common.h"
 
 enum {
 	UL_IIR_SW = 0,
@@ -33,35 +34,6 @@ enum {
 	AUDIO_SDM_3RD,
 };
 
-enum {
-	DELAY_DATA_MISO1 = 0,
-	DELAY_DATA_MISO2,
-};
-
-enum {
-	MTK_AFE_ADDA_DL_RATE_8K = 0,
-	MTK_AFE_ADDA_DL_RATE_11K = 1,
-	MTK_AFE_ADDA_DL_RATE_12K = 2,
-	MTK_AFE_ADDA_DL_RATE_16K = 3,
-	MTK_AFE_ADDA_DL_RATE_22K = 4,
-	MTK_AFE_ADDA_DL_RATE_24K = 5,
-	MTK_AFE_ADDA_DL_RATE_32K = 6,
-	MTK_AFE_ADDA_DL_RATE_44K = 7,
-	MTK_AFE_ADDA_DL_RATE_48K = 8,
-	MTK_AFE_ADDA_DL_RATE_96K = 9,
-	MTK_AFE_ADDA_DL_RATE_192K = 10,
-};
-
-enum {
-	MTK_AFE_ADDA_UL_RATE_8K = 0,
-	MTK_AFE_ADDA_UL_RATE_16K = 1,
-	MTK_AFE_ADDA_UL_RATE_32K = 2,
-	MTK_AFE_ADDA_UL_RATE_48K = 3,
-	MTK_AFE_ADDA_UL_RATE_96K = 4,
-	MTK_AFE_ADDA_UL_RATE_192K = 5,
-	MTK_AFE_ADDA_UL_RATE_48K_HD = 6,
-};
-
 #define SDM_AUTO_RESET_THRESHOLD 0x190000
 
 struct mtk_afe_adda_priv {
@@ -83,64 +55,6 @@ static struct mtk_afe_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
 	return afe_priv->dai_priv[dai_id];
 }
 
-static unsigned int adda_dl_rate_transform(struct mtk_base_afe *afe,
-					   unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_DL_RATE_8K;
-	case 11025:
-		return MTK_AFE_ADDA_DL_RATE_11K;
-	case 12000:
-		return MTK_AFE_ADDA_DL_RATE_12K;
-	case 16000:
-		return MTK_AFE_ADDA_DL_RATE_16K;
-	case 22050:
-		return MTK_AFE_ADDA_DL_RATE_22K;
-	case 24000:
-		return MTK_AFE_ADDA_DL_RATE_24K;
-	case 32000:
-		return MTK_AFE_ADDA_DL_RATE_32K;
-	case 44100:
-		return MTK_AFE_ADDA_DL_RATE_44K;
-	case 48000:
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_DL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_DL_RATE_192K;
-	default:
-		dev_dbg(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-	}
-
-	return MTK_AFE_ADDA_DL_RATE_48K;
-}
-
-static unsigned int adda_ul_rate_transform(struct mtk_base_afe *afe,
-					   unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_UL_RATE_8K;
-	case 16000:
-		return MTK_AFE_ADDA_UL_RATE_16K;
-	case 32000:
-		return MTK_AFE_ADDA_UL_RATE_32K;
-	case 48000:
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_UL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_UL_RATE_192K;
-	default:
-		dev_dbg(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-	}
-
-	return MTK_AFE_ADDA_UL_RATE_48K;
-}
-
 /* dai component */
 static const struct snd_kcontrol_new mtk_adda_dl_ch1_mix[] = {
 	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN3, I_DL1_CH1, 1, 0),
@@ -658,7 +572,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 		adda_priv->dl_rate = rate;
 
 		/* set sampling rate */
-		dl_src2_con0 = adda_dl_rate_transform(afe, rate) <<
+		dl_src2_con0 = mtk_adda_dl_rate_transform(afe, rate) <<
 			       DL_2_INPUT_MODE_CTL_SFT;
 
 		/* set output mode, UP_SAMPLING_RATE_X8 */
@@ -721,7 +635,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 		}
 	} else {
 		unsigned int ul_src_con0 = 0;
-		unsigned int voice_mode = adda_ul_rate_transform(afe, rate);
+		unsigned int voice_mode = mtk_adda_ul_rate_transform(afe, rate);
 
 		adda_priv->ul_rate = rate;
 		ul_src_con0 |= (voice_mode << 17) & (0x7 << 17);
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
index 7dc029f2b428..8a17d1935c48 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
@@ -14,6 +14,7 @@
 #include "mt8188-afe-clk.h"
 #include "mt8188-afe-common.h"
 #include "mt8188-reg.h"
+#include "../common/mtk-dai-adda-common.h"
 
 #define ADDA_HIRES_THRES 48000
 
@@ -24,94 +25,10 @@ enum {
 	SUPPLY_SEQ_ADDA_AFE_ON,
 };
 
-enum {
-	MTK_AFE_ADDA_DL_RATE_8K = 0,
-	MTK_AFE_ADDA_DL_RATE_11K = 1,
-	MTK_AFE_ADDA_DL_RATE_12K = 2,
-	MTK_AFE_ADDA_DL_RATE_16K = 3,
-	MTK_AFE_ADDA_DL_RATE_22K = 4,
-	MTK_AFE_ADDA_DL_RATE_24K = 5,
-	MTK_AFE_ADDA_DL_RATE_32K = 6,
-	MTK_AFE_ADDA_DL_RATE_44K = 7,
-	MTK_AFE_ADDA_DL_RATE_48K = 8,
-	MTK_AFE_ADDA_DL_RATE_96K = 9,
-	MTK_AFE_ADDA_DL_RATE_192K = 10,
-};
-
-enum {
-	MTK_AFE_ADDA_UL_RATE_8K = 0,
-	MTK_AFE_ADDA_UL_RATE_16K = 1,
-	MTK_AFE_ADDA_UL_RATE_32K = 2,
-	MTK_AFE_ADDA_UL_RATE_48K = 3,
-	MTK_AFE_ADDA_UL_RATE_96K = 4,
-	MTK_AFE_ADDA_UL_RATE_192K = 5,
-};
-
-enum {
-	DELAY_DATA_MISO1 = 0,
-	DELAY_DATA_MISO0 = 1,
-};
-
 struct mtk_dai_adda_priv {
 	bool hires_required;
 };
 
-static unsigned int afe_adda_dl_rate_transform(struct mtk_base_afe *afe,
-					       unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_DL_RATE_8K;
-	case 11025:
-		return MTK_AFE_ADDA_DL_RATE_11K;
-	case 12000:
-		return MTK_AFE_ADDA_DL_RATE_12K;
-	case 16000:
-		return MTK_AFE_ADDA_DL_RATE_16K;
-	case 22050:
-		return MTK_AFE_ADDA_DL_RATE_22K;
-	case 24000:
-		return MTK_AFE_ADDA_DL_RATE_24K;
-	case 32000:
-		return MTK_AFE_ADDA_DL_RATE_32K;
-	case 44100:
-		return MTK_AFE_ADDA_DL_RATE_44K;
-	case 48000:
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_DL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_DL_RATE_192K;
-	default:
-		dev_info(afe->dev, "%s(), rate %u invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	}
-}
-
-static unsigned int afe_adda_ul_rate_transform(struct mtk_base_afe *afe,
-					       unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_UL_RATE_8K;
-	case 16000:
-		return MTK_AFE_ADDA_UL_RATE_16K;
-	case 32000:
-		return MTK_AFE_ADDA_UL_RATE_32K;
-	case 48000:
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_UL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_UL_RATE_192K;
-	default:
-		dev_info(afe->dev, "%s(), rate %u invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	}
-}
-
 static int mt8188_adda_mtkaif_init(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
@@ -440,7 +357,7 @@ static int mtk_dai_da_configure(struct mtk_base_afe *afe,
 	/* set sampling rate */
 	mask |= DL_2_INPUT_MODE_CTL_MASK;
 	val |= FIELD_PREP(DL_2_INPUT_MODE_CTL_MASK,
-			  afe_adda_dl_rate_transform(afe, rate));
+			  mtk_adda_dl_rate_transform(afe, rate));
 
 	/* turn off saturation */
 	mask |= DL_2_CH1_SATURATION_EN_CTL;
@@ -474,7 +391,7 @@ static int mtk_dai_ad_configure(struct mtk_base_afe *afe,
 
 	mask = UL_VOICE_MODE_CTL_MASK;
 	val = FIELD_PREP(UL_VOICE_MODE_CTL_MASK,
-			 afe_adda_ul_rate_transform(afe, rate));
+			 mtk_adda_ul_rate_transform(afe, rate));
 
 	regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0,
 			   mask, val);
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index 36d33032a37a..99de85b87643 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -13,6 +13,7 @@
 #include "mt8192-afe-common.h"
 #include "mt8192-afe-gpio.h"
 #include "mt8192-interconnection.h"
+#include "../common/mtk-dai-adda-common.h"
 
 enum {
 	UL_IIR_SW = 0,
@@ -35,93 +36,8 @@ enum {
 	AUDIO_SDM_3RD,
 };
 
-enum {
-	DELAY_DATA_MISO1 = 0,
-	DELAY_DATA_MISO2,
-};
-
-enum {
-	MTK_AFE_ADDA_DL_RATE_8K = 0,
-	MTK_AFE_ADDA_DL_RATE_11K = 1,
-	MTK_AFE_ADDA_DL_RATE_12K = 2,
-	MTK_AFE_ADDA_DL_RATE_16K = 3,
-	MTK_AFE_ADDA_DL_RATE_22K = 4,
-	MTK_AFE_ADDA_DL_RATE_24K = 5,
-	MTK_AFE_ADDA_DL_RATE_32K = 6,
-	MTK_AFE_ADDA_DL_RATE_44K = 7,
-	MTK_AFE_ADDA_DL_RATE_48K = 8,
-	MTK_AFE_ADDA_DL_RATE_96K = 9,
-	MTK_AFE_ADDA_DL_RATE_192K = 10,
-};
-
-enum {
-	MTK_AFE_ADDA_UL_RATE_8K = 0,
-	MTK_AFE_ADDA_UL_RATE_16K = 1,
-	MTK_AFE_ADDA_UL_RATE_32K = 2,
-	MTK_AFE_ADDA_UL_RATE_48K = 3,
-	MTK_AFE_ADDA_UL_RATE_96K = 4,
-	MTK_AFE_ADDA_UL_RATE_192K = 5,
-	MTK_AFE_ADDA_UL_RATE_48K_HD = 6,
-};
-
 #define SDM_AUTO_RESET_THRESHOLD 0x190000
 
-static unsigned int adda_dl_rate_transform(struct mtk_base_afe *afe,
-					   unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_DL_RATE_8K;
-	case 11025:
-		return MTK_AFE_ADDA_DL_RATE_11K;
-	case 12000:
-		return MTK_AFE_ADDA_DL_RATE_12K;
-	case 16000:
-		return MTK_AFE_ADDA_DL_RATE_16K;
-	case 22050:
-		return MTK_AFE_ADDA_DL_RATE_22K;
-	case 24000:
-		return MTK_AFE_ADDA_DL_RATE_24K;
-	case 32000:
-		return MTK_AFE_ADDA_DL_RATE_32K;
-	case 44100:
-		return MTK_AFE_ADDA_DL_RATE_44K;
-	case 48000:
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_DL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_DL_RATE_192K;
-	default:
-		dev_warn(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	}
-}
-
-static unsigned int adda_ul_rate_transform(struct mtk_base_afe *afe,
-					   unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_UL_RATE_8K;
-	case 16000:
-		return MTK_AFE_ADDA_UL_RATE_16K;
-	case 32000:
-		return MTK_AFE_ADDA_UL_RATE_32K;
-	case 48000:
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_UL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_UL_RATE_192K;
-	default:
-		dev_warn(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	}
-}
-
 /* dai component */
 static const struct snd_kcontrol_new mtk_adda_dl_ch1_mix[] = {
 	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN3, I_DL1_CH1, 1, 0),
@@ -1156,7 +1072,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 		unsigned int dl_src2_con1 = 0;
 
 		/* set sampling rate */
-		dl_src2_con0 = adda_dl_rate_transform(afe, rate) <<
+		dl_src2_con0 = mtk_adda_dl_rate_transform(afe, rate) <<
 			       DL_2_INPUT_MODE_CTL_SFT;
 
 		/* set output mode, UP_SAMPLING_RATE_X8 */
@@ -1246,7 +1162,7 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 		unsigned int voice_mode = 0;
 		unsigned int ul_src_con0 = 0;	/* default value */
 
-		voice_mode = adda_ul_rate_transform(afe, rate);
+		voice_mode = mtk_adda_ul_rate_transform(afe, rate);
 
 		ul_src_con0 |= (voice_mode << 17) & (0x7 << 17);
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 0dd35255066b..8da1587128cc 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -12,6 +12,7 @@
 #include "mt8195-afe-clk.h"
 #include "mt8195-afe-common.h"
 #include "mt8195-reg.h"
+#include "../common/mtk-dai-adda-common.h"
 
 #define ADDA_DL_GAIN_LOOPBACK 0x1800
 #define ADDA_HIRES_THRES 48000
@@ -25,35 +26,6 @@ enum {
 	SUPPLY_SEQ_ADDA_AFE_ON,
 };
 
-enum {
-	MTK_AFE_ADDA_DL_RATE_8K = 0,
-	MTK_AFE_ADDA_DL_RATE_11K = 1,
-	MTK_AFE_ADDA_DL_RATE_12K = 2,
-	MTK_AFE_ADDA_DL_RATE_16K = 3,
-	MTK_AFE_ADDA_DL_RATE_22K = 4,
-	MTK_AFE_ADDA_DL_RATE_24K = 5,
-	MTK_AFE_ADDA_DL_RATE_32K = 6,
-	MTK_AFE_ADDA_DL_RATE_44K = 7,
-	MTK_AFE_ADDA_DL_RATE_48K = 8,
-	MTK_AFE_ADDA_DL_RATE_96K = 9,
-	MTK_AFE_ADDA_DL_RATE_192K = 10,
-};
-
-enum {
-	MTK_AFE_ADDA_UL_RATE_8K = 0,
-	MTK_AFE_ADDA_UL_RATE_16K = 1,
-	MTK_AFE_ADDA_UL_RATE_32K = 2,
-	MTK_AFE_ADDA_UL_RATE_48K = 3,
-	MTK_AFE_ADDA_UL_RATE_96K = 4,
-	MTK_AFE_ADDA_UL_RATE_192K = 5,
-};
-
-enum {
-	DELAY_DATA_MISO1 = 0,
-	DELAY_DATA_MISO0 = 1,
-	DELAY_DATA_MISO2 = 1,
-};
-
 enum {
 	MTK_AFE_ADDA,
 	MTK_AFE_ADDA6,
@@ -63,62 +35,6 @@ struct mtk_dai_adda_priv {
 	bool hires_required;
 };
 
-static unsigned int afe_adda_dl_rate_transform(struct mtk_base_afe *afe,
-					       unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_DL_RATE_8K;
-	case 11025:
-		return MTK_AFE_ADDA_DL_RATE_11K;
-	case 12000:
-		return MTK_AFE_ADDA_DL_RATE_12K;
-	case 16000:
-		return MTK_AFE_ADDA_DL_RATE_16K;
-	case 22050:
-		return MTK_AFE_ADDA_DL_RATE_22K;
-	case 24000:
-		return MTK_AFE_ADDA_DL_RATE_24K;
-	case 32000:
-		return MTK_AFE_ADDA_DL_RATE_32K;
-	case 44100:
-		return MTK_AFE_ADDA_DL_RATE_44K;
-	case 48000:
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_DL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_DL_RATE_192K;
-	default:
-		dev_info(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_DL_RATE_48K;
-	}
-}
-
-static unsigned int afe_adda_ul_rate_transform(struct mtk_base_afe *afe,
-					       unsigned int rate)
-{
-	switch (rate) {
-	case 8000:
-		return MTK_AFE_ADDA_UL_RATE_8K;
-	case 16000:
-		return MTK_AFE_ADDA_UL_RATE_16K;
-	case 32000:
-		return MTK_AFE_ADDA_UL_RATE_32K;
-	case 48000:
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	case 96000:
-		return MTK_AFE_ADDA_UL_RATE_96K;
-	case 192000:
-		return MTK_AFE_ADDA_UL_RATE_192K;
-	default:
-		dev_info(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
-			 __func__, rate);
-		return MTK_AFE_ADDA_UL_RATE_48K;
-	}
-}
-
 static int mt8195_adda_mtkaif_init(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
@@ -644,7 +560,7 @@ static int mtk_dai_da_configure(struct mtk_base_afe *afe,
 
 	/* set sampling rate */
 	mask |= DL_2_INPUT_MODE_CTL_MASK;
-	val |= DL_2_INPUT_MODE_CTL(afe_adda_dl_rate_transform(afe, rate));
+	val |= DL_2_INPUT_MODE_CTL(mtk_adda_dl_rate_transform(afe, rate));
 
 	/* turn off saturation */
 	mask |= DL_2_CH1_SATURATION_EN_CTL;
@@ -681,7 +597,7 @@ static int mtk_dai_ad_configure(struct mtk_base_afe *afe,
 	unsigned int mask = 0;
 
 	mask |= UL_VOICE_MODE_CTL_MASK;
-	val |= UL_VOICE_MODE_CTL(afe_adda_ul_rate_transform(afe, rate));
+	val |= UL_VOICE_MODE_CTL(mtk_adda_ul_rate_transform(afe, rate));
 
 	switch (id) {
 	case MT8195_AFE_IO_UL_SRC1:
-- 
2.44.0

