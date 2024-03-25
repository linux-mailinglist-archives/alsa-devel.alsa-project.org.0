Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D34894BBC
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 993022BAC;
	Tue,  2 Apr 2024 08:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 993022BAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040448;
	bh=e18u4Zx+/EJmVkR05i1wQWx/l3yrJ3WydzFhrZJeVEo=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L6Szc5mRBwfkPgwD5h4v5c5RCn3ZIwH0r+rqF3HaosIer7ihiVSabFDp5CUjBevFM
	 zofq0n29xJmZgciiPoxPfk1Bul/7C+l2UyIj0EwdxBgqDFT5112nsomSXh0UQ6dGCl
	 10C1DHAIuA/5Kf/bGbFEPp0YpJ6KGEUmz649cpd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5EF0F805F8; Tue,  2 Apr 2024 08:46:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 146C8F805E3;
	Tue,  2 Apr 2024 08:46:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C393FF8025F; Tue, 26 Mar 2024 00:54:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC67AF80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 00:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC67AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=R5ju2o7B
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 99E62120002;
	Tue, 26 Mar 2024 02:54:21 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 99E62120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711410861;
	bh=/VGhO9g3eLyI3DESf5O8GZK0vOI9FoBBKXuZ7OPsOuY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=R5ju2o7B45ahyVSiF39mcNRMAUqnPGpji4GHX/iajeG4RrqfujwqkOcymDjiyMR+D
	 8Hl/clsCTydAowO3FflAD+m3faQW7+AQG1TAMj0LlJQ1UBehLETGdJ9Hrsyn0AUzBk
	 BqEJploVZ7iNb/ealUhK2ublCUf0CfhMgDxQLwqoUHbM6gyw4X9qPp4okHt6M1trz9
	 93WJejsLAbB2Zq7ox5f09jzThHyBGRyZQnEYrR052DkfuaEdnRdowWxwKjr2Xbz4D8
	 yDWtlb9JDgneTuE0/Ba3D76wlftiymjKg+rva+EeY3rV6SnY7kQXZpHVK1aDQfrM6b
	 uiRdsbYuYqjiA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 26 Mar 2024 02:54:21 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 26 Mar 2024 02:54:20 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v2] ASoC: meson: g12a-toacodec: rework the definition of
 bits
Date: Tue, 26 Mar 2024 02:53:11 +0300
Message-ID: <20240325235311.411920-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184404 [Mar 25 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 11 0.3.11
 5ecf9895443a5066245fcb91e8430edf92b1b594, {Tracking_smtp_not_equal_from},
 {Tracking_uf_ne_domains},
 salutedevices.com:7.1.1;lore.kernel.org:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1,
 FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int},
 {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/03/25 23:10:00
X-KSMG-LinksScanning: Clean, bases: 2024/03/25 23:09:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/03/25 18:32:00 #24438765
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Z2SA7HNIOEUIBCOROS5ZGQX2GEIKNXOE
X-Message-ID-Hash: Z2SA7HNIOEUIBCOROS5ZGQX2GEIKNXOE
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:46:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a lot of defines, but almost all of them are not used. Lets
rework them:

 - keep separate the definition for different platforms to make easier
   checking that they match documentation.

 - use LSB/MSB sufixes for uniformity.

 - don't use hard-coded values for already declared defines.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
Links:

 [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/

Changes v1 -> v2:
 - Detached from v1's series (patch 7).
 - Fixed my wrong understanding of SOC_SINGLE's input parameters.

 sound/soc/meson/g12a-toacodec.c | 79 ++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 30 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 531bb8707a3e..22181f4bab72 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -20,26 +20,37 @@
 #define G12A_TOACODEC_DRV_NAME "g12a-toacodec"
 
 #define TOACODEC_CTRL0			0x0
-#define  CTRL0_ENABLE_SHIFT		31
-#define  CTRL0_DAT_SEL_SM1_MSB		19
-#define  CTRL0_DAT_SEL_SM1_LSB		18
-#define  CTRL0_DAT_SEL_MSB		15
-#define  CTRL0_DAT_SEL_LSB		14
-#define  CTRL0_LANE_SEL_SM1		16
-#define  CTRL0_LANE_SEL			12
-#define  CTRL0_LRCLK_SEL_SM1_MSB	14
-#define  CTRL0_LRCLK_SEL_SM1_LSB	12
-#define  CTRL0_LRCLK_SEL_MSB		9
-#define  CTRL0_LRCLK_SEL_LSB		8
-#define  CTRL0_LRCLK_INV_SM1		BIT(10)
-#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
-#define  CTRL0_BLK_CAP_INV		BIT(7)
-#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
-#define  CTRL0_BCLK_O_INV		BIT(6)
-#define  CTRL0_BCLK_SEL_SM1_MSB		6
-#define  CTRL0_BCLK_SEL_MSB		5
-#define  CTRL0_BCLK_SEL_LSB		4
-#define  CTRL0_MCLK_SEL			GENMASK(2, 0)
+
+/* Common bits */
+#define CTRL0_ENABLE_SHIFT		31
+#define CTRL0_MCLK_SEL			GENMASK(2, 0)
+
+/* G12A bits */
+#define CTRL0_DAT_SEL_G12A_MSB		15
+#define CTRL0_DAT_SEL_G12A_LSB		14
+#define CTRL0_LANE_SEL_G12A_MSB		13
+#define CTRL0_LANE_SEL_G12A_LSB		12
+#define CTRL0_LANE_SEL_G12A_MAX		3
+#define CTRL0_LRCLK_SEL_G12A_MSB	9
+#define CTRL0_LRCLK_SEL_G12A_LSB	8
+#define CTRL0_BLK_CAP_INV_G12A		BIT(7)
+#define CTRL0_BCLK_O_INV_G12A		BIT(6)
+#define CTRL0_BCLK_SEL_G12A_MSB		5
+#define CTRL0_BCLK_SEL_G12A_LSB		4
+
+/* SM1 bits */
+#define CTRL0_DAT_SEL_SM1_MSB		19
+#define CTRL0_DAT_SEL_SM1_LSB		18
+#define CTRL0_LANE_SEL_SM1_MSB		17
+#define CTRL0_LANE_SEL_SM1_LSB		16
+#define CTRL0_LANE_SEL_SM1_MAX		3
+#define CTRL0_LRCLK_SEL_SM1_MSB		14
+#define CTRL0_LRCLK_SEL_SM1_LSB		12
+#define CTRL0_LRCLK_INV_SM1		BIT(10)
+#define CTRL0_BLK_CAP_INV_SM1		BIT(9)
+#define CTRL0_BCLK_O_INV_SM1		BIT(8)
+#define CTRL0_BCLK_SEL_SM1_MSB		6
+#define CTRL0_BCLK_SEL_SM1_LSB		4
 
 #define TOACODEC_OUT_CHMAX		2
 
@@ -108,7 +119,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
-			    CTRL0_DAT_SEL_LSB,
+			    CTRL0_DAT_SEL_G12A_LSB,
 			    g12a_toacodec_mux_texts);
 
 static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
@@ -210,7 +221,7 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
 {
 	/* Initialize the static clock parameters */
 	return snd_soc_component_write(c, TOACODEC_CTRL0,
-				       CTRL0_BLK_CAP_INV);
+				       CTRL0_BLK_CAP_INV_G12A);
 }
 
 static int sm1_toacodec_component_probe(struct snd_soc_component *c)
@@ -229,11 +240,13 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 };
 
 static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
-	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_G12A_LSB,
+		   CTRL0_LANE_SEL_G12A_MAX, 0),
 };
 
 static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
-	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1_LSB,
+		   CTRL0_LANE_SEL_SM1_MAX, 0),
 };
 
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
@@ -266,16 +279,22 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
 
 static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
 	.component_drv	= &g12a_toacodec_component_drv,
-	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
-	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
-	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_G12A_LSB,
+				    CTRL0_DAT_SEL_G12A_MSB),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_G12A_LSB,
+				     CTRL0_LRCLK_SEL_G12A_MSB),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_G12A_LSB,
+				    CTRL0_BCLK_SEL_G12A_MSB),
 };
 
 static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
 	.component_drv	= &sm1_toacodec_component_drv,
-	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 18, 19),
-	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
-	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB,
+				    CTRL0_DAT_SEL_SM1_MSB),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
+				     CTRL0_LRCLK_SEL_SM1_MSB),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_SM1_LSB,
+				    CTRL0_BCLK_SEL_SM1_MSB),
 };
 
 static const struct of_device_id g12a_toacodec_of_match[] = {
-- 
2.34.1

