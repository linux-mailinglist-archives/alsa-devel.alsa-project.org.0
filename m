Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2637E5045
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 07:22:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E215827;
	Wed,  8 Nov 2023 07:21:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E215827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699424532;
	bh=+ekcFKHgfr9d2r1+O3Wjfsyd9YTliBOttzC54tLSggg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZW3gbVjxdWPZftaYazQTTmBeUMicfqa0uLAWrB5Jw3GF9gY7JaR/GvEjPgOikbnDR
	 tWLfJ5yLmKkmbwbqTNTkZPd7VS63riiqxqhLFuOuc1bOQOLAYwL/nFUAQXu83/re+e
	 F9vQCECbYu+SQDmVox3p/4piHJDaz/uHAnRL1Bj8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EF71F80169; Wed,  8 Nov 2023 07:21:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2646F80169;
	Wed,  8 Nov 2023 07:21:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0161FF8016D; Wed,  8 Nov 2023 07:18:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE0D1F80152
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 07:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE0D1F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=B+8X6WRn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffwbt0pJYP0m8IlU0MxEE+qLBHHKcHNmv+1/w1Az3kr1NjuUt1O33UPRmkY+Dof9IPb/Gj3URPh6Ru3GtNzgXiNLc13YBngyPPgKlgqCMpFX4FSSfQZyXNM2y9sp+X/CCTk+uXG6JF3GlPGOkelyT9JfYKShnXkQ5XKEtZmhARUTKajq8YXibqU0mBsPQFYqKDolzkFMRxpyhjxGAfdL+o7VxF24Y0Cp1vZxnorw1peJpFfRnIaEUFwiKpbstk0TsmabP6lPc2J0CEkQbMLQFGvVAdh+paFR6P9OBEQ6SC1Am3BNHjeDecJxmxmhJbYsWG75qz5oAwnwXBnVC3jomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hn25Mwu3zZi1ZhbTkLrylBfv1PfboSJGkanjO9uNekU=;
 b=hMErd4qnExpeEpJ3zIh+Fb3qoyjEVAepiQr63KkueMSddxloqeRM/xCCbV3R7PP08oKu5Ib2lhg4n2/NHyCfindSjBJWhu6XZZq+ayBL3RolGOtdQyOiGWWojzGex3jU0NVXOua5v0cglcICI8lZ/s+L9Y0IiEm9bRgdLCOfutM5p1yUZUgWsakErze+50pOAeAG6z1eELsEjR+y55V6SHlmLQKso/crruZbxTaVrVYS35jYfccwEOl55mLwcyp/0TaZmqMX5gyKU/tYqnKW1N7N68IsKl3XGQK8pOKDeusb7l1HKAtt9oK/Fq1eYJeahWBarGJaYRJu85GfcGOnhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hn25Mwu3zZi1ZhbTkLrylBfv1PfboSJGkanjO9uNekU=;
 b=B+8X6WRnRzfg7cN5+lIYKG3w3Y71QU1fY0+wt9SZDB3Y24Zt1TC7uKIXaEI143qbYryIDYsiaY0WOsiD0YpPZuRqPv6AeLxQsboNAMfsrwOzH7OIKfE1EyvmUeF8T0+FN04ar8GP7fXc4uyw3DrYyKm4uoI582t+oh3AcQ2kMoM=
Received: from PS2PR02CA0001.apcprd02.prod.outlook.com (2603:1096:300:41::13)
 by SI2PR03MB5577.apcprd03.prod.outlook.com (2603:1096:4:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 06:17:33 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:300:41:cafe::9b) by PS2PR02CA0001.outlook.office365.com
 (2603:1096:300:41::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 06:17:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 8 Nov 2023 06:17:32 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Wed, 8
 Nov 2023 14:17:29 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 8 Nov 2023 14:17:29 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>, <WTLI@nuvoton.com>,
	<SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH] ASoC: nau8540: Add self recovery to improve capture quility
Date: Wed, 8 Nov 2023 14:16:59 +0800
Message-ID: <20231108061658.1265065-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|SI2PR03MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: ca08595d-2c37-4718-b8a2-08dbe0226491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S4An5hxjWbyX89pO77D7f9fkCC9Cl2/9H68hxhDdcQDWmYJftg4mipFENH65bl+fZdtLdb2Zwvz2DVczKXXhOkZ2e5FHoYPKK96BL5wF7n/iYxeET2Ub9QI6sHt2mC0iv5Wevo14WCTj3Gq0MXgKjXez3V4Ev8ppIJ84vbT6HMwjZnIrIXVSBzNSJHPp9tCa7yf7UfjSwJIh3qQVBVr8OfuwDr3HD894x5sBpOT4vl4w2uGqt+nDDesIwQ9hgigwHzxpho0ZwVfobIzsZqAJA3uKX1zqo4DrrK8eM/w5tkXSN71OELotaPvN45Md9CsZuutdypB3PKoOGW1aNCjv9SZRGmqXaHRw8sISdVDk25Gxn5Ov164h4NEdF7/dVqmTklodWVTtYRNFeYfOkO7jX0ROC56xxJyGs7JQ+ggqWZlpeRKPLW0iOgu0o5Q148R9MY2w9UMJ/zB/bfawDjPEz+x/sC4F2bqgAn4e19085LtLDqj6SWJW1lNW4VQD3pa6WxlhyMAyF0RSZHriR1YbcpkZHkFPcitNm7WjwZQCR/1Rm/2IwIcMHr8UNw4ev5O/4RUI7cDuNITEfj4tddwn9JWzDie/7VjBaYN8ab3LUaBeJxd5K9H/DmNSaWaqiZ2dAm1HbybBarka8WMjHqZmBHXDR6b/MSbfSoPAgAnLm3eN9lM+Wc98AK88eyPDnftS0aRR/JtzP5Yp7jeTBce0x7uwL1+l+ySgzjDELxkStIvH0MqY6nmwi5yffUbJPtU4GVXpP7H9o7C3rbAxOejTUx9bCnVmK+lgx5GdWgd5JdI=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(40470700004)(46966006)(36840700001)(2906002)(478600001)(40460700003)(5660300002)(26005)(41300700001)(336012)(426003)(86362001)(82740400003)(36756003)(47076005)(6916009)(316002)(2616005)(1076003)(107886003)(54906003)(33656002)(8676002)(8936002)(4326008)(83380400001)(81166007)(40480700001)(6666004)(36860700001)(70206006)(70586007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 06:17:32.3526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca08595d-2c37-4718-b8a2-08dbe0226491
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5577
Message-ID-Hash: TSAWA5VH2UE6GVQBXRDRPUJB6NMAS7R2
X-Message-ID-Hash: TSAWA5VH2UE6GVQBXRDRPUJB6NMAS7R2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSAWA5VH2UE6GVQBXRDRPUJB6NMAS7R2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reading the peak data to detect abnormal data in the ADC channel.
If abnormal data occurs, the driver takes recovery actions to
refresh the ADC channel.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8540.c | 49 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/nau8540.h | 15 ++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index 5cf28d034f09..f66417a0f29f 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -530,12 +530,61 @@ static int nau8540_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int nau8540_dai_trigger(struct snd_pcm_substream *substream,
+			       int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = nau8540->regmap;
+	unsigned int val;
+	int ret = 0;
+
+	/* Reading the peak data to detect abnormal data in the ADC channel.
+	 * If abnormal data happens, the driver takes recovery actions to
+	 * refresh the ADC channel.
+	 */
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		regmap_update_bits(regmap, NAU8540_REG_CLOCK_CTRL,
+				   NAU8540_CLK_AGC_EN, NAU8540_CLK_AGC_EN);
+		regmap_update_bits(regmap, NAU8540_REG_ALC_CONTROL_3,
+				   NAU8540_ALC_CH_ALL_EN, NAU8540_ALC_CH_ALL_EN);
+
+		regmap_read(regmap, NAU8540_REG_PEAK_CH1, &val);
+		dev_dbg(nau8540->dev, "1.ADC CH1 peak data %x", val);
+		if (!val) {
+			regmap_update_bits(regmap, NAU8540_REG_MUTE,
+					   NAU8540_PGA_CH_ALL_MUTE, NAU8540_PGA_CH_ALL_MUTE);
+			regmap_update_bits(regmap, NAU8540_REG_MUTE,
+					   NAU8540_PGA_CH_ALL_MUTE, 0);
+			regmap_write(regmap, NAU8540_REG_RST, 0x1);
+			regmap_write(regmap, NAU8540_REG_RST, 0);
+			regmap_read(regmap, NAU8540_REG_PEAK_CH1, &val);
+			dev_dbg(nau8540->dev, "2.ADC CH1 peak data %x", val);
+			if (!val) {
+				dev_err(nau8540->dev, "Channel recovery failed!!");
+				ret = -EIO;
+			}
+		}
+		regmap_update_bits(regmap, NAU8540_REG_CLOCK_CTRL,
+				   NAU8540_CLK_AGC_EN, 0);
+		regmap_update_bits(regmap, NAU8540_REG_ALC_CONTROL_3,
+				   NAU8540_ALC_CH_ALL_EN, 0);
+		break;
+
+	default:
+		break;
+	}
+
+	return ret;
+}
 
 static const struct snd_soc_dai_ops nau8540_dai_ops = {
 	.startup = nau8540_dai_startup,
 	.hw_params = nau8540_hw_params,
 	.set_fmt = nau8540_set_fmt,
 	.set_tdm_slot = nau8540_set_tdm_slot,
+	.trigger = nau8540_dai_trigger,
 };
 
 #define NAU8540_RATES SNDRV_PCM_RATE_8000_48000
diff --git a/sound/soc/codecs/nau8540.h b/sound/soc/codecs/nau8540.h
index 305ea9207cf0..2ce6063d462b 100644
--- a/sound/soc/codecs/nau8540.h
+++ b/sound/soc/codecs/nau8540.h
@@ -85,6 +85,7 @@
 
 /* CLOCK_CTRL (0x02) */
 #define NAU8540_CLK_ADC_EN		(0x1 << 15)
+#define NAU8540_CLK_AGC_EN		(0x1 << 3)
 #define NAU8540_CLK_I2S_EN		(0x1 << 1)
 
 /* CLOCK_SRC (0x03) */
@@ -168,6 +169,13 @@
 #define NAU8540_TDM_OFFSET_EN		(0x1 << 14)
 #define NAU8540_TDM_TX_MASK		0xf
 
+/* ALC_CONTROL_3 (0x22) */
+#define NAU8540_ALC_CH1_EN		(0x1 << 12)
+#define NAU8540_ALC_CH2_EN		(0x1 << 13)
+#define NAU8540_ALC_CH3_EN		(0x1 << 14)
+#define NAU8540_ALC_CH4_EN		(0x1 << 15)
+#define NAU8540_ALC_CH_ALL_EN		(0xf << 12)
+
 /* ADC_SAMPLE_RATE (0x3A) */
 #define NAU8540_CH_SYNC		(0x1 << 14)
 #define NAU8540_ADC_OSR_MASK		0x3
@@ -181,6 +189,13 @@
 #define NAU8540_VMID_SEL_SFT		4
 #define NAU8540_VMID_SEL_MASK		(0x3 << NAU8540_VMID_SEL_SFT)
 
+/* MUTE (0x61) */
+#define NAU8540_PGA_CH1_MUTE		0x1
+#define NAU8540_PGA_CH2_MUTE		0x2
+#define NAU8540_PGA_CH3_MUTE		0x4
+#define NAU8540_PGA_CH4_MUTE		0x8
+#define NAU8540_PGA_CH_ALL_MUTE		0xf
+
 /* MIC_BIAS (0x67) */
 #define NAU8540_PU_PRE			(0x1 << 8)
 
-- 
2.25.1

