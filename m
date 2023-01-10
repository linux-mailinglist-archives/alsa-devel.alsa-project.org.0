Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 944596637CD
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 04:17:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF07AD7EC;
	Tue, 10 Jan 2023 04:16:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF07AD7EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673320655;
	bh=zUxynVVGAwnhZfaOb/9/e5JWdRk7/MYZWS3LEpjGF/s=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hHUaru9veqDBlHJ/h4Zd4dO9X5fHS7GyLNqr+4EFMSKF0g0WlMBamR7AyxOwwDUYY
	 ToJbUAwDSfDftYzY3uKeJOqOupVkRvBi6mNP+EjJz3MEDbbrjZyoG9FJhzkomgQPtC
	 Dw533l4WiLHN1oijuGzkD31i5m+r14XeAArUovp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8985FF800C7;
	Tue, 10 Jan 2023 04:16:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 104CCF804C1; Tue, 10 Jan 2023 04:16:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2061.outbound.protection.outlook.com [40.107.255.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E739CF8026A
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 04:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E739CF8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=NyEzeflB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ncgzn5wRs9OdfPw18e6UA6Kwv0ZSue74o1gDSj/j+MggaXfczE7xXsECqj+Ga/ZlzK5/pBFEPkNt248wL4r4kZKic4SKj2K8yBNz21AAjkEJG1iiN7VHXHCB0Qpzq6lkB4trJ2ljJdMRDb5Rc0zMeRoVXVy2CRF6ZU6iBfMqBfquzoJ4qZn/6EJIkyB1w2jpxt+SYjWP84Q5CfIqJp5N/ywsq4q5swJ8khoWCo5DpLIPW1XJRul51usE3dm71jSPO2VP/w8USUeCMik/FLrStjn9k4rKDFc6Y3tIGfhkkkD/KWID99m4dI0zASlTxCSLNqc8WYppxWlgeb/0yQCDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/eDTTyf7TnHis9ug3gcJyATUHf08pwqCV7lSBV6pU8=;
 b=bhk7JQ7v+pDpQdpFcqWYTOggly4IrShqAc1g88KvFqkVcVdL0CfX1tI5CfYImv0Jz2tTIn23xTQBVnMsQr8R7lEFKq3G1a0PNHi1Upyuf9r52bnk3BOe66Ux8JxYhFrvJiJWA49IscXs9fMBXXwseRdoJwLmIGbnJSrPMpE1V1QZTo7DLd2P5q3hnbi8IYPt3Jq79pQ0/9gEkikXg0ONKFZK5M2u0hMkxFCXSR1NaJ2SSqh8ko99GOY6qsp8F4rmIGSggDklrI/nbMSOKy4+res5yATBC/Xp8H5nKtudZg7Om4UsnQ+nDKJuoNGyaRgAqbJsH2TaZrqErZaTlTr+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/eDTTyf7TnHis9ug3gcJyATUHf08pwqCV7lSBV6pU8=;
 b=NyEzeflBZHmKEJpEhpe6pPXgb+Wq6JjVkKYkMCtc9Xsb0ztaXpivhutE/WKPMwga5mM5ngDbuAaEDRScq8zk8ino1/mlU1cOQ0duELBjc96/ics8GqcHTNBzP2mQc31BCvBT+Frhrpk+6aHBod6NmF+m3iREDGPGJZ/2JNPQc2I=
Received: from TYAPR04CA0023.apcprd04.prod.outlook.com (2603:1096:404:15::35)
 by TYZPR03MB5677.apcprd03.prod.outlook.com (2603:1096:400:65::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 03:16:25 +0000
Received: from TYZAPC01FT052.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:15:cafe::24) by TYAPR04CA0023.outlook.office365.com
 (2603:1096:404:15::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 03:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 TYZAPC01FT052.mail.protection.outlook.com (10.118.152.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 03:16:25 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 10
 Jan 2023 11:16:24 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 10 Jan
 2023 11:16:24 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.7 via Frontend Transport; 
 Tue, 10 Jan 2023 11:16:24 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8821: Implement DRC controls
Date: Tue, 10 Jan 2023 11:16:22 +0800
Message-ID: <20230110031622.459686-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT052:EE_|TYZPR03MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd6ca5c-329e-4ce2-9e57-08daf2b90ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mn24iMDHLq4YEAwIxyN1+YyH88oC6uK7Kvb3diGMaQmolwY7D/aYJY8osXTvkAbsGfab0zAzaoQwrrp91kCThnyv2iHiTSiWiDNmW3RKO2YFdW2f4BLADWA0u07KJIQLcANt7c8jKL6myeiI3xVTmVsm71ehVd56hvIy1B4Zx9dWxHHEWpei9N0iufN83yCI4vSdi2otgNNjc0E+Ac/cJN6rvy1SYujQRCzeEKr+KIqtdb9MUNhitph/wL+QImUXi+YXLdAytOZYSmQU5nhWMykXiHSly1BcjnQaGHdw+ruJBa8I6rFCnDict9qx/xrbKlWkVRCU3BrrPnMEi6kt+KWeT/sO1BW0q++1C8TkMSPb2URVPx8cZi47cprNnwOYWjLrpthwsxogMknCt43ITsShA8+hcuh3u2GV6u18QbWnqrXW1oNl+B3MDHKH7tSxkn/ZHzLKT4y0wEOT/6Qu+TVD3O++oqa906vzyOVPwoFbRCm8OnCCe9ZmCgZSF7A4l+1jr/kaEqDp/YSk8Ug9zjFi5sWPEGJWaqTtW/gNhZxzyc53VGvX4desdee9vAjo+AoCFlQ0znmva07e/AeLHt3trzRu3iGC9H5QiKhkPIFan26BqFwjJyVtzv/fAZTlju9aIuflQI/A6EelFhCmxlBrB/9IvKK7V6J787DFyncUTgcO/1LqqCiu8W56uhZFMwm6Tvr2prQfvxnjSklIcw==
X-Forefront-Antispam-Report: CIP:175.98.123.7; CTRY:TW; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:NTHCCAS04.nuvoton.com; PTR:175-98-123-7.static.tfn.net.tw;
 CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(1076003)(5660300002)(316002)(40480700001)(26005)(186003)(478600001)(2616005)(41300700001)(47076005)(426003)(40460700003)(54906003)(336012)(6916009)(4326008)(70586007)(70206006)(8676002)(82310400005)(8936002)(83380400001)(86362001)(36906005)(36756003)(107886003)(36860700001)(82740400003)(356005)(2906002)(81166007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 03:16:25.6375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd6ca5c-329e-4ce2-9e57-08daf2b90ec9
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07; Ip=[175.98.123.7];
 Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT052.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5677
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com,
 Seven Lee <wtli@nuvoton.com>, SJLIN0@nuvoton.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch is support dynamic range compression controls.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 sound/soc/codecs/nau8821.c | 96 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/nau8821.h | 23 +++++++++
 2 files changed, 119 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 4a72b94e8410..fee970427a24 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -322,12 +322,92 @@ static const struct soc_enum nau8821_dac_oversampl_en=
um =3D
        SOC_ENUM_SINGLE(NAU8821_R2C_DAC_CTRL1, NAU8821_DAC_OVERSAMPLE_SFT,
                ARRAY_SIZE(nau8821_dac_oversampl), nau8821_dac_oversampl);

+static const char * const nau8821_adc_drc_noise_gate[] =3D {
+       "1:1", "2:1", "4:1", "8:1" };
+
+static const struct soc_enum nau8821_adc_drc_noise_gate_enum =3D
+       SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES, NAU8821_DRC_NG_SLP_ADC_=
SFT,
+               ARRAY_SIZE(nau8821_adc_drc_noise_gate),
+               nau8821_adc_drc_noise_gate);
+
+static const char * const nau8821_adc_drc_expansion_slope[] =3D {
+       "1:1", "2:1", "4:1" };
+
+static const struct soc_enum nau8821_adc_drc_expansion_slope_enum =3D
+       SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES, NAU8821_DRC_EXP_SLP_ADC=
_SFT,
+               ARRAY_SIZE(nau8821_adc_drc_expansion_slope),
+               nau8821_adc_drc_expansion_slope);
+
+static const char * const nau8821_adc_drc_lower_region[] =3D {
+       "0", "1:2", "1:4", "1:8", "1:16", "", "", "1:1" };
+
+static const struct soc_enum nau8821_adc_drc_lower_region_enum =3D
+       SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES,
+               NAU8821_DRC_CMP2_SLP_ADC_SFT,
+               ARRAY_SIZE(nau8821_adc_drc_lower_region),
+               nau8821_adc_drc_lower_region);
+
+static const char * const nau8821_higher_region[] =3D {
+       "0", "1:2", "1:4", "1:8", "1:16", "", "", "1:1" };
+
+static const struct soc_enum nau8821_higher_region_enum =3D
+       SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES,
+               NAU8821_DRC_CMP1_SLP_ADC_SFT,
+               ARRAY_SIZE(nau8821_higher_region),
+               nau8821_higher_region);
+
+static const char * const nau8821_limiter_slope[] =3D {
+       "0", "1:2", "1:4", "1:8", "1:16", "1:32", "1:64", "1:1" };
+
+static const struct soc_enum nau8821_limiter_slope_enum =3D
+       SOC_ENUM_SINGLE(NAU8821_R38_ADC_DRC_SLOPES,
+               NAU8821_DRC_LMT_SLP_ADC_SFT, ARRAY_SIZE(nau8821_limiter_slo=
pe),
+               nau8821_limiter_slope);
+
+static const char * const nau8821_detection_attack_time[] =3D {
+       "Ts", "3Ts", "7Ts", "15Ts", "31Ts", "63Ts", "127Ts", "255Ts",
+       "", "511Ts" };
+
+static const struct soc_enum nau8821_detection_attack_time_enum =3D
+       SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY,
+               NAU8821_DRC_PK_COEF1_ADC_SFT,
+               ARRAY_SIZE(nau8821_detection_attack_time),
+               nau8821_detection_attack_time);
+
+static const char * const nau8821_detection_release_time[] =3D {
+       "63Ts", "127Ts", "255Ts", "511Ts", "1023Ts", "2047Ts", "4095Ts",
+       "8191Ts", "", "16383Ts" };
+
+static const struct soc_enum nau8821_detection_release_time_enum =3D
+       SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY,
+               NAU8821_DRC_PK_COEF2_ADC_SFT,
+               ARRAY_SIZE(nau8821_detection_release_time),
+               nau8821_detection_release_time);
+
+static const char * const nau8821_attack_time[] =3D {
+       "Ts", "3Ts", "7Ts", "15Ts", "31Ts", "63Ts", "127Ts", "255Ts",
+       "511Ts", "1023Ts", "2047Ts", "4095Ts", "8191Ts" };
+
+static const struct soc_enum nau8821_attack_time_enum =3D
+       SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY, NAU8821_DRC_ATK_ADC_SFT=
,
+               ARRAY_SIZE(nau8821_attack_time), nau8821_attack_time);
+
+static const char * const nau8821_decay_time[] =3D {
+       "63Ts", "127Ts", "255Ts", "511Ts", "1023Ts", "2047Ts", "4095Ts",
+       "8191Ts", "16383Ts", "32757Ts", "65535Ts" };
+
+static const struct soc_enum nau8821_decay_time_enum =3D
+       SOC_ENUM_SINGLE(NAU8821_R39_ADC_DRC_ATKDCY, NAU8821_DRC_DCY_ADC_SFT=
,
+               ARRAY_SIZE(nau8821_decay_time), nau8821_decay_time);
+
 static const DECLARE_TLV_DB_MINMAX_MUTE(adc_vol_tlv, -6600, 2400);
 static const DECLARE_TLV_DB_MINMAX_MUTE(sidetone_vol_tlv, -4200, 0);
 static const DECLARE_TLV_DB_MINMAX(hp_vol_tlv, -900, 0);
 static const DECLARE_TLV_DB_SCALE(playback_vol_tlv, -6600, 50, 1);
 static const DECLARE_TLV_DB_MINMAX(fepga_gain_tlv, -100, 3600);
 static const DECLARE_TLV_DB_MINMAX_MUTE(crosstalk_vol_tlv, -7000, 2400);
+static const DECLARE_TLV_DB_MINMAX(drc_knee4_tlv, -9800, -3500);
+static const DECLARE_TLV_DB_MINMAX(drc_knee3_tlv, -8100, -1800);

 static const struct snd_kcontrol_new nau8821_controls[] =3D {
        SOC_DOUBLE_TLV("Mic Volume", NAU8821_R35_ADC_DGAIN_CTRL1,
@@ -346,6 +426,22 @@ static const struct snd_kcontrol_new nau8821_controls[=
] =3D {
        SOC_DOUBLE_TLV("Headphone Crosstalk Volume",
                NAU8821_R2F_DAC_DGAIN_CTRL,
                0, 8, 0xff, 0, crosstalk_vol_tlv),
+       SOC_SINGLE_TLV("ADC DRC KNEE4", NAU8821_R37_ADC_DRC_KNEE_IP34,
+               NAU8821_DRC_KNEE4_IP_ADC_SFT, 0x3f, 1, drc_knee4_tlv),
+       SOC_SINGLE_TLV("ADC DRC KNEE3", NAU8821_R37_ADC_DRC_KNEE_IP34,
+               NAU8821_DRC_KNEE3_IP_ADC_SFT, 0x3f, 1, drc_knee3_tlv),
+
+       SOC_ENUM("ADC DRC Noise Gate", nau8821_adc_drc_noise_gate_enum),
+       SOC_ENUM("ADC DRC Expansion Slope", nau8821_adc_drc_expansion_slope=
_enum),
+       SOC_ENUM("ADC DRC Lower Region", nau8821_adc_drc_lower_region_enum)=
,
+       SOC_ENUM("ADC DRC Higher Region", nau8821_higher_region_enum),
+       SOC_ENUM("ADC DRC Limiter Slope", nau8821_limiter_slope_enum),
+       SOC_ENUM("ADC DRC Peak Detection Attack Time", nau8821_detection_at=
tack_time_enum),
+       SOC_ENUM("ADC DRC Peak Detection Release Time", nau8821_detection_r=
elease_time_enum),
+       SOC_ENUM("ADC DRC Attack Time", nau8821_attack_time_enum),
+       SOC_ENUM("ADC DRC Decay Time", nau8821_decay_time_enum),
+       SOC_SINGLE("DRC Enable Switch", NAU8821_R36_ADC_DRC_KNEE_IP12,
+               NAU8821_DRC_ENA_ADC_SFT, 1, 0),

        SOC_ENUM("ADC Decimation Rate", nau8821_adc_decimation_enum),
        SOC_ENUM("DAC Oversampling Rate", nau8821_dac_oversampl_enum),
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
index c44251f54d48..d962293c218e 100644
--- a/sound/soc/codecs/nau8821.h
+++ b/sound/soc/codecs/nau8821.h
@@ -350,6 +350,29 @@
 #define NAU8821_ADCL_CH_VOL_SFT                0
 #define NAU8821_ADCL_CH_VOL_MASK       0xff

+/* ADC_DRC_KNEE_IP12 (0x36) */
+#define NAU8821_DRC_ENA_ADC_SFT                15
+#define NAU8821_DRC_ENA_ADC_EN         (0x1 << NAU8821_DRC_ENA_ADC_SFT)
+
+/* ADC_DRC_KNEE_IP34 (0x37) */
+#define NAU8821_DRC_KNEE4_IP_ADC_SFT   8
+#define NAU8821_DRC_KNEE4_IP_ADC_MASK  (0xff << NAU8821_DRC_KNEE4_IP_ADC_S=
FT)
+#define NAU8821_DRC_KNEE3_IP_ADC_SFT   0
+#define NAU8821_DRC_KNEE3_IP_ADC_MASK  0xff
+
+/* ADC_DRC_SLOPES (0x38) */
+#define NAU8821_DRC_NG_SLP_ADC_SFT     12
+#define NAU8821_DRC_EXP_SLP_ADC_SFT    9
+#define NAU8821_DRC_CMP2_SLP_ADC_SFT   6
+#define NAU8821_DRC_CMP1_SLP_ADC_SFT   3
+#define NAU8821_DRC_LMT_SLP_ADC_SFT    0
+
+/* ADC_DRC_ATKDCY (0x39) */
+#define NAU8821_DRC_PK_COEF1_ADC_SFT   12
+#define NAU8821_DRC_PK_COEF2_ADC_SFT   8
+#define NAU8821_DRC_ATK_ADC_SFT                4
+#define NAU8821_DRC_DCY_ADC_SFT                0
+
 /* BIQ1_COF10 (0x4a) */
 #define NAU8821_BIQ1_DAC_EN_SFT                3
 #define NAU8821_BIQ1_DAC_EN_EN          (0x1 << NAU8821_BIQ1_DAC_EN_SFT)
--
2.25.1

________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
