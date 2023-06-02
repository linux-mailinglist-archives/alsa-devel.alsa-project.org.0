Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1C871F925
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 06:12:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA2F5839;
	Fri,  2 Jun 2023 06:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA2F5839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685679146;
	bh=Te9HOvLZpKtpHY+x8qQbBi4dpcZFdmf32iMXC7de5OM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h9/RXgi4UPV1DLk9WlCVV2PLzbsWScwnlCzijoeYul2XCJnrwq2l6I52n6aLqbnBO
	 CiC6oOOx/lljOQBw5WdtjD7NPQzYoizDTt1sd0oh31FQ9KOBMUAyfJ1+XkMLqtOfHN
	 lmsSKLySE0yeoeLc8s8yl2F0IUtWmmH/plOdEKQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC61BF80570; Fri,  2 Jun 2023 06:10:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4328F8047D;
	Fri,  2 Jun 2023 06:10:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 623E4F8016B; Fri,  2 Jun 2023 06:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92F25F80149
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 06:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92F25F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=DGcrqQ4I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPv/tNMzAKBaW+msdWtJlINRkAwrFwswFBYz7EPZtcPh73OduY5PIZEVvpBu2KiVufe3de0f3oRb2kI5FqO4S9lf6WZ+vh4q05AGkez2CpE8d4eEs3O9Felip2R69r06H0hh/UBmrY/TjTnwNWUFgNMmItTEG7vKZo+GpHxCBFt4f+gxVCvKkagUes/zg17fvQUED9TBqfjY0h0OJGqoU+On/5Gp3JGi0h3NBW2LQje/lQ1ki0FIkVgvYKqdPPRhAzY0jEPd25XpQRgtnPFyPBYMKb/RQs+hk4r8SaM3bGkdh1ehgfkaQXz1BKHD9b2Es7Qh0xNIxOZxdccBk29p5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0v0l7CcUK6IzqQladg5sFbCkEe8ah0B+Dgdc0TbeEw=;
 b=LHfKlB8svZqjblvMCyPlksXESqx/vwje7SbBYZOUCZm1YYVWgmZEgK8XHZfa74mNzvHcabdIsEPGKAnXPbLZopLc7QBu9Bsvq3vFN859XWHwPBbRVWR5wGadWwHguCM07LMBb8mOseozTHid1s9WwqcKYPPiEu7qtP7/CRl7u9+YLNSx4euGRpjeA5Jb7ziP+vmaWwsiepuEHs9Ty5apo6WMr23JRZ4N7TBIvDOWBFhMaq7aywKXZt8G+daijpNAn3VyCzlH3tFFwYF+S7aYOq17S4KRD3W7Ml+SJE/ty7LH1ebMv/MhKIU4RcxT0W6RixwMFdYaSagW1MPtBlPghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0v0l7CcUK6IzqQladg5sFbCkEe8ah0B+Dgdc0TbeEw=;
 b=DGcrqQ4IspsfE0wlcC0bY/H+XOu1U+89oTAJ35i2F6p2mJOcHz0CbQduRFtDXYASi1GZ5e0OVmC7FitRD5yOk96vrsvgDRsubn6EsJl+QGsZbWN4n2Ovai637lo04fggD1u8GUvVH1LyFFhgTn+v6Y1pG6Mz7YWSiwC6zlP9gL0=
Received: from SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21) by
 SEYPR03MB7046.apcprd03.prod.outlook.com (2603:1096:101:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.24; Fri, 2 Jun 2023 04:09:43 +0000
Received: from SG2APC01FT0060.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:1:cafe::e2) by SG2PR06CA0189.outlook.office365.com
 (2603:1096:4:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 04:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 SG2APC01FT0060.mail.protection.outlook.com (10.13.36.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6455.13 via Frontend Transport; Fri, 2 Jun 2023 04:09:42 +0000
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 2 Jun
 2023 12:09:34 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Fri, 2 Jun 2023
 12:09:34 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Fri, 2 Jun 2023 12:09:34 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>, <WTLI@nuvoton.com>,
	<SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH 1/3] ASoC: nau8825: Add registers patch for NAU8825C
Date: Fri, 2 Jun 2023 12:09:22 +0800
Message-ID: <20230602040924.188913-2-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602040924.188913-1-CTLIN0@nuvoton.com>
References: <20230602040924.188913-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0060:EE_|SEYPR03MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: c9bce271-97d0-44bb-63b4-08db631f315e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	569pVsYIBOmeaopJ79BFG4DYC/++Qcm0lVr9RjYJ8M54yTj++wOw5hIpOCcW+TxnG3TOUa/9UhqmuBIJG+R0b+bezqUrnJ5aBqSvSfJqmWHScmLQNODmJIGbPIFhQMyNWD0icdU5DICWJuTQRZbwvs3NIddB3pj5kaqLjiNdNTForYmg4hgrCL9oYZ7q1zOKmVL2tqhYE/5Ejs5cauwodLZjtQwtpkReZCOzEu52yLhOwbnrWblo3WkwQwzUs8oACRZdmVZKtq2a7QM5jjf2ZKE2qY+il0ZGtgo8hED+el9KkaODNpXCqGBOCL5xAwW3Klqfkxh25U+HAmCe7SMhIN+887zOY0Uv8BffA1AelQKAJQsb0HVMs5S6s83L0JUAWV+mT1UsgwGgdGmAmXcye/EECxjnpCqEQe5l7VqX5782L/epx9dat2gSSwGcuj+4+4a9IeDN23HQpSmvEcWE8BAf6I/ffmeg3//xbaFuj6PXB9sMV/tMbFrK6566VHM3XyYurYJD6CQ4EIgo/zphQ34koOTcv44gWx717DMzdbRFl13t1K2pZgV8IG34ecnSlIW2eSecbKEK4lMLxsAhh5U5hOZRbrIQU4sTUbjMnwwySbjYa4N3Ak7WTY7iaKlWLd2y9o3O7vO8fyCKFtyuXUkOltYSmgaUqP4A7rhlwNgKQM/qL8Z9SblbmkThFTQ4y1eyvzldRO+nNG3nENy/9pzV9v5kAh7weehOhbpfysdkyAyaHgL9UqYeh+Cah35UuKj4CzqZPobbZ7F4VNrBeEu574yVliqpXEbaEr2ytEY=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(4326008)(1076003)(107886003)(26005)(186003)(6666004)(36860700001)(47076005)(2616005)(426003)(336012)(83380400001)(41300700001)(5660300002)(316002)(8936002)(2906002)(8676002)(478600001)(54906003)(6916009)(70206006)(70586007)(86362001)(40480700001)(33656002)(36756003)(82740400003)(356005)(81166007)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 04:09:42.5368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c9bce271-97d0-44bb-63b4-08db631f315e
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2APC01FT0060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7046
Message-ID-Hash: 5JHDC4NWV5R6WA5446243OYJVFF44CRD
X-Message-ID-Hash: 5JHDC4NWV5R6WA5446243OYJVFF44CRD
X-MailFrom: CTLIN0@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JHDC4NWV5R6WA5446243OYJVFF44CRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch is to update default regmap and register a set of registers
for NAU8825C.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 37 ++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/nau8825.h |  4 ++++
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index f6dd84b32e0b..91eb05899a88 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -178,6 +178,8 @@ static const struct reg_default nau8825_reg_defaults[] = {
 	{ NAU8825_REG_CLASSG_CTRL, 0x0 },
 	{ NAU8825_REG_OPT_EFUSE_CTRL, 0x0 },
 	{ NAU8825_REG_MISC_CTRL, 0x0 },
+	{ NAU8825_REG_FLL2_LOWER, 0x0 },
+	{ NAU8825_REG_FLL2_UPPER, 0x0 },
 	{ NAU8825_REG_BIAS_ADJ, 0x0 },
 	{ NAU8825_REG_TRIM_SETTINGS, 0x0 },
 	{ NAU8825_REG_ANALOG_CONTROL_1, 0x0 },
@@ -200,6 +202,23 @@ static struct reg_default nau8825_xtalk_baktab[] = {
 	{ NAU8825_REG_DACR_CTRL, 0x02cf },
 };
 
+/* The regmap patch for Rev C */
+static const struct reg_sequence nau8825_regmap_patch[] = {
+	{ NAU8825_REG_FLL2, 0x0000 },
+	{ NAU8825_REG_FLL4, 0x8010 },
+	{ NAU8825_REG_FLL_VCO_RSV, 0x0bc0 },
+	{ NAU8825_REG_INTERRUPT_MASK, 0x0800 },
+	{ NAU8825_REG_DACL_CTRL, 0x00cf },
+	{ NAU8825_REG_DACR_CTRL, 0x02cf },
+	{ NAU8825_REG_OPT_EFUSE_CTRL, 0x0400 },
+	{ NAU8825_REG_FLL2_LOWER, 0x26e9 },
+	{ NAU8825_REG_FLL2_UPPER, 0x0031 },
+	{ NAU8825_REG_ANALOG_CONTROL_2, 0x0020 },
+	{ NAU8825_REG_ANALOG_ADC_2, 0x0220 },
+	{ NAU8825_REG_MIC_BIAS, 0x0046 },
+};
+
+
 static const unsigned short logtable[256] = {
 	0x0000, 0x0171, 0x02e0, 0x044e, 0x05ba, 0x0725, 0x088e, 0x09f7,
 	0x0b5d, 0x0cc3, 0x0e27, 0x0f8a, 0x10eb, 0x124b, 0x13aa, 0x1508,
@@ -855,7 +874,7 @@ static bool nau8825_readable_reg(struct device *dev, unsigned int reg)
 	case NAU8825_REG_IMM_MODE_CTRL ... NAU8825_REG_IMM_RMS_R:
 	case NAU8825_REG_CLASSG_CTRL ... NAU8825_REG_OPT_EFUSE_CTRL:
 	case NAU8825_REG_MISC_CTRL:
-	case NAU8825_REG_I2C_DEVICE_ID ... NAU8825_REG_SARDOUT_RAM_STATUS:
+	case NAU8825_REG_I2C_DEVICE_ID ... NAU8825_REG_FLL2_UPPER:
 	case NAU8825_REG_BIAS_ADJ:
 	case NAU8825_REG_TRIM_SETTINGS ... NAU8825_REG_ANALOG_CONTROL_2:
 	case NAU8825_REG_ANALOG_ADC_1 ... NAU8825_REG_MIC_BIAS:
@@ -881,6 +900,7 @@ static bool nau8825_writeable_reg(struct device *dev, unsigned int reg)
 	case NAU8825_REG_IMM_MODE_CTRL:
 	case NAU8825_REG_CLASSG_CTRL ... NAU8825_REG_OPT_EFUSE_CTRL:
 	case NAU8825_REG_MISC_CTRL:
+	case NAU8825_REG_FLL2_LOWER ... NAU8825_REG_FLL2_UPPER:
 	case NAU8825_REG_BIAS_ADJ:
 	case NAU8825_REG_TRIM_SETTINGS ... NAU8825_REG_ANALOG_CONTROL_2:
 	case NAU8825_REG_ANALOG_ADC_1 ... NAU8825_REG_MIC_BIAS:
@@ -2930,8 +2950,19 @@ static int nau8825_i2c_probe(struct i2c_client *i2c)
 			ret);
 		return ret;
 	}
-	if ((value & NAU8825_SOFTWARE_ID_MASK) !=
-			NAU8825_SOFTWARE_ID_NAU8825) {
+	nau8825->sw_id = value & NAU8825_SOFTWARE_ID_MASK;
+	switch (nau8825->sw_id) {
+	case NAU8825_SOFTWARE_ID_NAU8825:
+		break;
+	case NAU8825_SOFTWARE_ID_NAU8825C:
+		ret = regmap_register_patch(nau8825->regmap, nau8825_regmap_patch,
+					    ARRAY_SIZE(nau8825_regmap_patch));
+		if (ret) {
+			dev_err(dev, "Failed to register Rev C patch: %d\n", ret);
+			return ret;
+		}
+		break;
+	default:
 		dev_err(dev, "Not a NAU8825 chip\n");
 		return -ENODEV;
 	}
diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
index 38ce052aed50..2abfbb5184da 100644
--- a/sound/soc/codecs/nau8825.h
+++ b/sound/soc/codecs/nau8825.h
@@ -75,6 +75,8 @@
 #define NAU8825_REG_MISC_CTRL		0x55
 #define NAU8825_REG_I2C_DEVICE_ID		0x58
 #define NAU8825_REG_SARDOUT_RAM_STATUS		0x59
+#define NAU8825_REG_FLL2_LOWER		0x5a
+#define NAU8825_REG_FLL2_UPPER		0x5b
 #define NAU8825_REG_BIAS_ADJ		0x66
 #define NAU8825_REG_TRIM_SETTINGS		0x68
 #define NAU8825_REG_ANALOG_CONTROL_1		0x69
@@ -386,6 +388,7 @@
 #define NAU8825_GPIO2JD1	(1 << 7)
 #define NAU8825_SOFTWARE_ID_MASK	0x3
 #define NAU8825_SOFTWARE_ID_NAU8825	0x0
+#define NAU8825_SOFTWARE_ID_NAU8825C	0x1
 
 /* BIAS_ADJ (0x66) */
 #define NAU8825_BIAS_HPR_IMP		(1 << 15)
@@ -497,6 +500,7 @@ struct nau8825 {
 	struct clk *mclk;
 	struct work_struct xtalk_work;
 	struct semaphore xtalk_sem;
+	int sw_id;
 	int irq;
 	int mclk_freq; /* 0 - mclk is disabled */
 	int button_pressed;
-- 
2.25.1

