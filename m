Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF687CA28
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 09:44:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C06B1931;
	Fri, 15 Mar 2024 09:44:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C06B1931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710492268;
	bh=Yt5zFOftrqT2wzEvoq7cia/KskA8mEKdbWcPzDasIGY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hWMEeyPe6wfYfxZT89qKvs/Ais5gpGj2ejERkJoqMmwP3wiWTWTNWRP4/VsFtqqTE
	 Wp256AzUNlI8hi0AaUJWp0G5CNL/u5kDe+qsFRjfyxL/TCteGdzRFOmXEKTnxOtZ0T
	 C/NKLeayZ++HzuVNBxPCop7/XZXjBXkkQ9FlM/cM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E25BF80692; Fri, 15 Mar 2024 09:41:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C315F804E7;
	Fri, 15 Mar 2024 09:41:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95AE6F805AE; Fri, 15 Mar 2024 00:23:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADC38F8025F
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 00:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC38F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=fbafMPha
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2626812000C;
	Fri, 15 Mar 2024 02:23:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2626812000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458583;
	bh=CCvJrpEy8sCRXCr8dMiJp3FMH8ERqXOpfe0cLHeVGoc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=fbafMPhazDMHL8jLJUDMUBps9XXh6YqILIDeVkfRYxY4Kd3tiirAcAhWopKN5WZbg
	 zvpCNbU2sDk3hvJ7UklbC/di83AlfNXI71dC1VHjvZweGx909EMhXKazjofpxsxzoc
	 qJ3E6Amu1d0pcrcL7VVwO70Cgb10WM2+wkErXc2Lun5Md2iF2LUVz9gQ5l+Zv+rFXf
	 vd/+utQUEQmC11h6xelNs2rLl2K9FaK9T8RS2JuwM9lYxxytjk4YaL+2pt+NAr0IIl
	 tE8DBnDorVRb0zH91zidP3oOP3KPOy7lpa6IrAOiNJ6mZgD/6tgR2IQ9psAqCU3EZA
	 Pv8Kd0tCDTsaA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:03 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:02 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>
Subject: [PATCH 07/25] ASoC: meson: g12a-toacodec: rework the definition of
 bits
Date: Fri, 15 Mar 2024 02:21:43 +0300
Message-ID: <20240314232201.2102178-8-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from},
 FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DLDQMKKQFGMLQANUPDVRIMEPKFOESGNE
X-Message-ID-Hash: DLDQMKKQFGMLQANUPDVRIMEPKFOESGNE
X-Mailman-Approved-At: Fri, 15 Mar 2024 08:36:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
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
 sound/soc/meson/g12a-toacodec.c | 77 ++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index b92de2235627..325cf420fd69 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -20,26 +20,35 @@
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
+#define CTRL0_LRCLK_SEL_SM1_MSB		14
+#define CTRL0_LRCLK_SEL_SM1_LSB		12
+#define CTRL0_LRCLK_INV_SM1		BIT(10)
+#define CTRL0_BLK_CAP_INV_SM1		BIT(9)
+#define CTRL0_BCLK_O_INV_SM1		BIT(8)
+#define CTRL0_BCLK_SEL_SM1_MSB		6
+#define CTRL0_BCLK_SEL_SM1_LSB		4
 
 #define TOACODEC_OUT_CHMAX		2
 
@@ -108,7 +117,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
-			    CTRL0_DAT_SEL_LSB,
+			    CTRL0_DAT_SEL_G12A_LSB,
 			    g12a_toacodec_mux_texts);
 
 static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
@@ -210,7 +219,7 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
 {
 	/* Initialize the static clock parameters */
 	return snd_soc_component_write(c, TOACODEC_CTRL0,
-				       CTRL0_BLK_CAP_INV);
+				       CTRL0_BLK_CAP_INV_G12A);
 }
 
 static int sm1_toacodec_component_probe(struct snd_soc_component *c)
@@ -229,11 +238,13 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 };
 
 static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
-	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 2, 0),
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_G12A_LSB,
+		   CTRL0_LANE_SEL_G12A_MSB - CTRL0_LANE_SEL_G12A_LSB + 1, 0),
 };
 
 static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
-	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 2, 0),
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1_LSB,
+		   CTRL0_LANE_SEL_SM1_MSB - CTRL0_LANE_SEL_SM1_LSB + 1, 0),
 };
 
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
@@ -266,16 +277,22 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
 
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

