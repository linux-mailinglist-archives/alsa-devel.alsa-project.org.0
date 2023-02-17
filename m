Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D8169A816
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 10:26:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3661FEEC;
	Fri, 17 Feb 2023 10:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3661FEEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676626012;
	bh=12G6qCLNr8dN8hhxtfBGg0tQOQJii+2bVNijr3LlXn0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oXBevPn5ecor+cH0mkGOHdqDwGIrUUcb3U6gRaguzbK/yFFTHTK+laEQUjEHz0WcO
	 eRB7BxZcbkUj9oYwLUbebJAlb485yistv/2ij+V5sLcAYcsTZYutj8Zk0Ia5fOLB9U
	 ejziOBFYwIfvZgbmzbx6NcSnbmykpkuZ/MFav1v8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0070F800AA;
	Fri, 17 Feb 2023 10:26:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37ED7F80171; Fri, 17 Feb 2023 10:25:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E122F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 10:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E122F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=ZWQLy6L2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jpkv4p8fQetO2iX3hKfrsdkxDl+a1l00OzzJKu1FE5j1NP1hVmc9oU4ramRXbe53Rf44JkAH/sKF4SNP2li+Lv8CAXJXXXYWGQ7nAogu7Nz9rAMCopaynU7vicq94pCyR133CODV4o81BhZyMl3342jpmHK8yaVXHwN482RzL2l675KafmpaLNGcqRnLxvMgjEgormAyPbqGfSrVNfxDyqsEAP14HFdkSqDQomnLZOo3HwtN4UH+bWriVggoT3RRguIj+ZjndJ30peTJFOSXUIGBwqnZQ3dtEd6gyZwOKp2N/myRKfmUdyyaoZWhJemoxBL2++NEmXHskPDVGds7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dSeROhezzWdqP19U+2pNscygcI+5vGRLgNbXVyrzzY=;
 b=WcKURt3saikibc3JWdegE2dz2UkoCxKwyshksPTW78vDJaugSP+8d/oNR0sRBjqPNCrj66L2K4Yw0a41M9JMuzGb2m2OJWcIzZn7/04SeL1uSs/hV82LQNEgZD/tM8r+hAAkn4y6DMuSHTTN8yO3S29klG7G8W+ysckV7W2yZe2jBWfVjuwiCOjc/erk/lHgTZXutR4EgoQszN0Y0CIvwlSR0bNm0lomjYZYKBccsWbQv7OQdKhYXQmnJwAK2KFU/WIL2j+IzuSKoRFZV5YkYjbuZi0yv2fYRlsiMH77qJQ1weDZDB5sWeI54yRskWdBdtrS6Py6EiBeOlng2HPeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dSeROhezzWdqP19U+2pNscygcI+5vGRLgNbXVyrzzY=;
 b=ZWQLy6L2df+eSK8nZ/OuL9R4NDOcfDETe7t7YyShAKUXXryg4B34ukO8fjgsIwJyNKjMLz1N9B4IdFVSyZPnFhfNv1YXGiLgdzAbClGNImLEn8FN0Qji9yJ1gpbBg94bvIo/6dtA9BRPyOGljXRCiVncwZR5P89KLegw/U8r4fg=
Received: from SG2PR06CA0251.apcprd06.prod.outlook.com (2603:1096:4:ac::35) by
 SEZPR03MB6892.apcprd03.prod.outlook.com (2603:1096:101:a3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Fri, 17 Feb 2023 09:25:35 +0000
Received: from SG2APC01FT0006.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:ac:cafe::9a) by SG2PR06CA0251.outlook.office365.com
 (2603:1096:4:ac::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15 via Frontend
 Transport; Fri, 17 Feb 2023 09:25:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 SG2APC01FT0006.mail.protection.outlook.com (10.13.37.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6111.17 via Frontend Transport; Fri, 17 Feb 2023 09:25:34 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 17
 Feb 2023 17:25:30 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.7 via Frontend Transport;
 Fri, 17 Feb 2023 17:25:30 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8821: Implement DRC controls
Date: Fri, 17 Feb 2023 17:25:23 +0800
Message-ID: <20230217092523.357142-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0006:EE_|SEZPR03MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d55241-1f46-4c2b-662f-08db10c8ec21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NLjGdKtzIc213fG5FZJqWOXHNc0iaeVQLjq38TcVefQZPGkLKoNa6Nt95oSx/+wkegWVLwgcdtr+z6963Y7osKKCVKArKpGPGLjicQZxfMRVdoD/A1vsDhPv+hm/N2Mfd+BDppB/TIUS16YJA1Mdd4o/ujQJ1+OTnqJ4jwkE83M3I2a6prCzlkdTdYSZa/ZmYEPzs9fWmllwz1S5Jh0dURn6LLSrWw3fn+G7jIQH5Z35DkVhaHEWvhDWmpx8YR5kGamKci54MCz9//kH3tWZuX/7KSsjtChGTRStSAuiizMV19Wmt9AfWu2oVszyda3wZr8lfi/OWuF+feKFUsrULWhUECWJTvgF5p4fY3+/s2inJLdko4lkB6zCUuh9svyST3zvkb6NGGfu5LO8TaxKiwBluqOdZ/9Jo8R63pfhPOBmjcUQ6G+3eRIUBthVKmdiq5WXbqxJwmuBvyHwspgleDrIc1s3Z2bGG7eToCND6FAjsdOnHUzzSygr+V0waIEpo5/L52L5LjcMf+k01YKwJoRROTyp9UbY8wzmhnyks/KF8Y252lpmTt15NsUd8WQ600mMCDRTjQFBtYAEEatTvcKtV5pSLcpoILiL8UVdr74EXibetuKQwgJm3es2bIfMMZbpK27NmGyiFveJwh+fHrPBIm+9g35pnk94rLyk+BaYpsdViQQ1wHBe6OrLiiq8OY7tnILoEALxpqbwE4RxGQ==
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(83380400001)(40460700003)(36860700001)(40480700001)(356005)(82310400005)(82740400003)(54906003)(316002)(81166007)(107886003)(478600001)(336012)(426003)(2616005)(2906002)(70586007)(6666004)(41300700001)(70206006)(8676002)(4326008)(6916009)(5660300002)(186003)(26005)(1076003)(86362001)(8936002)(36756003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 09:25:34.2922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c9d55241-1f46-4c2b-662f-08db10c8ec21
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2APC01FT0006.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6892
Message-ID-Hash: OZL63PXXSFCKZIK4XRDBLXF2MHU7PM3F
X-Message-ID-Hash: OZL63PXXSFCKZIK4XRDBLXF2MHU7PM3F
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com,
 Seven Lee <wtli@nuvoton.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZL63PXXSFCKZIK4XRDBLXF2MHU7PM3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch is support dynamic range compression controls.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
Signed-off-by: Seven Lee <scott6986@gmail.com>
---
 sound/soc/codecs/nau8821.c | 96 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/nau8821.h | 23 +++++++++
 2 files changed, 119 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 4a72b94e8410..fee970427a24 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -322,12 +322,92 @@ static const struct soc_enum nau8821_dac_oversampl_enum =
 	SOC_ENUM_SINGLE(NAU8821_R2C_DAC_CTRL1, NAU8821_DAC_OVERSAMPLE_SFT,
 		ARRAY_SIZE(nau8821_dac_oversampl), nau8821_dac_oversampl);
 
+static const char * const nau8821_adc_drc_noise_gate[] = {
+	"1:1", "2:1", "4:1", "8:1" };
+
+static const struct soc_enum nau8821_adc_drc_noise_gate_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES, NAU8821_DRC_NG_SLP_ADC_SFT,
+		ARRAY_SIZE(nau8821_adc_drc_noise_gate),
+		nau8821_adc_drc_noise_gate);
+
+static const char * const nau8821_adc_drc_expansion_slope[] = {
+	"1:1", "2:1", "4:1" };
+
+static const struct soc_enum nau8821_adc_drc_expansion_slope_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES, NAU8821_DRC_EXP_SLP_ADC_SFT,
+		ARRAY_SIZE(nau8821_adc_drc_expansion_slope),
+		nau8821_adc_drc_expansion_slope);
+
+static const char * const nau8821_adc_drc_lower_region[] = {
+	"0", "1:2", "1:4", "1:8", "1:16", "", "", "1:1" };
+
+static const struct soc_enum nau8821_adc_drc_lower_region_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES,
+		NAU8821_DRC_CMP2_SLP_ADC_SFT,
+		ARRAY_SIZE(nau8821_adc_drc_lower_region),
+		nau8821_adc_drc_lower_region);
+
+static const char * const nau8821_higher_region[] = {
+	"0", "1:2", "1:4", "1:8", "1:16", "", "", "1:1" };
+
+static const struct soc_enum nau8821_higher_region_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES,
+		NAU8821_DRC_CMP1_SLP_ADC_SFT,
+		ARRAY_SIZE(nau8821_higher_region),
+		nau8821_higher_region);
+
+static const char * const nau8821_limiter_slope[] = {
+	"0", "1:2", "1:4", "1:8", "1:16", "1:32", "1:64", "1:1" };
+
+static const struct soc_enum nau8821_limiter_slope_enum =
+	SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES,
+		NAU8821_DRC_LMT_SLP_ADC_SFT, ARRAY_SIZE(nau8821_limiter_slope),
+		nau8821_limiter_slope);
+
+static const char * const nau8821_detection_attack_time[] = {
+	"Ts", "3Ts", "7Ts", "15Ts", "31Ts", "63Ts", "127Ts", "255Ts",
+	"", "511Ts" };
+
+static const struct soc_enum nau8821_detection_attack_time_enum =
+	SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY,
+		NAU8821_DRC_PK_COEF1_ADC_SFT,
+		ARRAY_SIZE(nau8821_detection_attack_time),
+		nau8821_detection_attack_time);
+
+static const char * const nau8821_detection_release_time[] = {
+	"63Ts", "127Ts", "255Ts", "511Ts", "1023Ts", "2047Ts", "4095Ts",
+	"8191Ts", "", "16383Ts" };
+
+static const struct soc_enum nau8821_detection_release_time_enum =
+	SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY,
+		NAU8821_DRC_PK_COEF2_ADC_SFT,
+		ARRAY_SIZE(nau8821_detection_release_time),
+		nau8821_detection_release_time);
+
+static const char * const nau8821_attack_time[] = {
+	"Ts", "3Ts", "7Ts", "15Ts", "31Ts", "63Ts", "127Ts", "255Ts",
+	"511Ts", "1023Ts", "2047Ts", "4095Ts", "8191Ts" };
+
+static const struct soc_enum nau8821_attack_time_enum =
+	SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY, NAU8821_DRC_ATK_ADC_SFT,
+		ARRAY_SIZE(nau8821_attack_time), nau8821_attack_time);
+
+static const char * const nau8821_decay_time[] = {
+	"63Ts", "127Ts", "255Ts", "511Ts", "1023Ts", "2047Ts", "4095Ts",
+	"8191Ts", "16383Ts", "32757Ts", "65535Ts" };
+
+static const struct soc_enum nau8821_decay_time_enum =
+	SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY, NAU8821_DRC_DCY_ADC_SFT,
+		ARRAY_SIZE(nau8821_decay_time), nau8821_decay_time);
+
 static const DECLARE_TLV_DB_MINMAX_MUTE(adc_vol_tlv, -6600, 2400);
 static const DECLARE_TLV_DB_MINMAX_MUTE(sidetone_vol_tlv, -4200, 0);
 static const DECLARE_TLV_DB_MINMAX(hp_vol_tlv, -900, 0);
 static const DECLARE_TLV_DB_SCALE(playback_vol_tlv, -6600, 50, 1);
 static const DECLARE_TLV_DB_MINMAX(fepga_gain_tlv, -100, 3600);
 static const DECLARE_TLV_DB_MINMAX_MUTE(crosstalk_vol_tlv, -7000, 2400);
+static const DECLARE_TLV_DB_MINMAX(drc_knee4_tlv, -9800, -3500);
+static const DECLARE_TLV_DB_MINMAX(drc_knee3_tlv, -8100, -1800);
 
 static const struct snd_kcontrol_new nau8821_controls[] = {
 	SOC_DOUBLE_TLV("Mic Volume", NAU8821_R35_ADC_DGAIN_CTRL1,
@@ -346,6 +426,22 @@ static const struct snd_kcontrol_new nau8821_controls[] = {
 	SOC_DOUBLE_TLV("Headphone Crosstalk Volume",
 		NAU8821_R2F_DAC_DGAIN_CTRL,
 		0, 8, 0xff, 0, crosstalk_vol_tlv),
+	SOC_SINGLE_TLV("ADC DRC KNEE4", NAU8821_R37_ADC_DRC_KNEE_IP34,
+		NAU8821_DRC_KNEE4_IP_ADC_SFT, 0x3f, 1, drc_knee4_tlv),
+	SOC_SINGLE_TLV("ADC DRC KNEE3", NAU8821_R37_ADC_DRC_KNEE_IP34,
+		NAU8821_DRC_KNEE3_IP_ADC_SFT, 0x3f, 1, drc_knee3_tlv),
+
+	SOC_ENUM("ADC DRC Noise Gate", nau8821_adc_drc_noise_gate_enum),
+	SOC_ENUM("ADC DRC Expansion Slope", nau8821_adc_drc_expansion_slope_enum),
+	SOC_ENUM("ADC DRC Lower Region", nau8821_adc_drc_lower_region_enum),
+	SOC_ENUM("ADC DRC Higher Region", nau8821_higher_region_enum),
+	SOC_ENUM("ADC DRC Limiter Slope", nau8821_limiter_slope_enum),
+	SOC_ENUM("ADC DRC Peak Detection Attack Time", nau8821_detection_attack_time_enum),
+	SOC_ENUM("ADC DRC Peak Detection Release Time", nau8821_detection_release_time_enum),
+	SOC_ENUM("ADC DRC Attack Time", nau8821_attack_time_enum),
+	SOC_ENUM("ADC DRC Decay Time", nau8821_decay_time_enum),
+	SOC_SINGLE("DRC Enable Switch", NAU8821_R36_ADC_DRC_KNEE_IP12,
+		NAU8821_DRC_ENA_ADC_SFT, 1, 0),
 
 	SOC_ENUM("ADC Decimation Rate", nau8821_adc_decimation_enum),
 	SOC_ENUM("DAC Oversampling Rate", nau8821_dac_oversampl_enum),
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
index c44251f54d48..d962293c218e 100644
--- a/sound/soc/codecs/nau8821.h
+++ b/sound/soc/codecs/nau8821.h
@@ -350,6 +350,29 @@
 #define NAU8821_ADCL_CH_VOL_SFT	        0
 #define NAU8821_ADCL_CH_VOL_MASK	0xff
 
+/* ADC_DRC_KNEE_IP12 (0x36) */
+#define NAU8821_DRC_ENA_ADC_SFT		15
+#define NAU8821_DRC_ENA_ADC_EN		(0x1 << NAU8821_DRC_ENA_ADC_SFT)
+
+/* ADC_DRC_KNEE_IP34 (0x37) */
+#define NAU8821_DRC_KNEE4_IP_ADC_SFT	8
+#define NAU8821_DRC_KNEE4_IP_ADC_MASK	(0xff << NAU8821_DRC_KNEE4_IP_ADC_SFT)
+#define NAU8821_DRC_KNEE3_IP_ADC_SFT	0
+#define NAU8821_DRC_KNEE3_IP_ADC_MASK	0xff
+
+/* ADC_DRC_SLOPES (0x38) */
+#define NAU8821_DRC_NG_SLP_ADC_SFT	12
+#define NAU8821_DRC_EXP_SLP_ADC_SFT	9
+#define NAU8821_DRC_CMP2_SLP_ADC_SFT	6
+#define NAU8821_DRC_CMP1_SLP_ADC_SFT	3
+#define NAU8821_DRC_LMT_SLP_ADC_SFT	0
+
+/* ADC_DRC_ATKDCY (0x39) */
+#define NAU8821_DRC_PK_COEF1_ADC_SFT	12
+#define NAU8821_DRC_PK_COEF2_ADC_SFT	8
+#define NAU8821_DRC_ATK_ADC_SFT		4
+#define NAU8821_DRC_DCY_ADC_SFT		0
+
 /* BIQ1_COF10 (0x4a) */
 #define NAU8821_BIQ1_DAC_EN_SFT	        3
 #define NAU8821_BIQ1_DAC_EN_EN          (0x1 << NAU8821_BIQ1_DAC_EN_SFT)
-- 
2.25.1

