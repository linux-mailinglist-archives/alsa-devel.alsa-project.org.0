Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C526623FB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 12:16:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28F9CC4B8;
	Mon,  9 Jan 2023 12:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28F9CC4B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673263011;
	bh=zUxynVVGAwnhZfaOb/9/e5JWdRk7/MYZWS3LEpjGF/s=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QjGn9GWxjpe2bh8tdAMD2ALaFtCR7JPvywf/e7HxwwV0ckZeQbnflCOFErkYbMB73
	 X3NAZ+F+0JxtHxQdpP5Xfi0zxwjo9akt1eU7bnLzahnR/eMEERW6OlrrRKEA+EaB+p
	 Yggnb3aeGAHwXYCsKG4adrW72pPGCcJTg1XCMQ48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98DC3F803DC;
	Mon,  9 Jan 2023 12:15:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78591F8030F; Mon,  9 Jan 2023 12:15:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2047.outbound.protection.outlook.com [40.107.117.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05659F800C7
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 12:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05659F800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=YpnSMO9P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA/GvDVU75mdbKd3e47s2Jv/Ox8ygTqL9wrCV1OGnaJbu+GgZJ+Bt9lAZo33/UHbr0/PtbT2g3uZ+o0jEJw1EQ+s6vCw9i3be61AUmNC2xk7X9T3jGoPY2LDDT9GJRbobCM6jJJIsCb1vMF7d1YFVbgcyCJGwyPjr87yFEi4zQCWf9Q/VMFyQwWMRGpyjUxJnPnpLcdV/T1mdwVPEQEsS7XtfdAUVZKlObtYBP1eLIQwFWP8hh4S4trYbZVco2ftlkAwrA0qW3atC09ySeddfROdKXzw3Jy/AsIj8FVxwLuYBqGnrkRKxeXU6nMVd5B+LFMTdY4DNbUHqDzVhZ9Lig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/eDTTyf7TnHis9ug3gcJyATUHf08pwqCV7lSBV6pU8=;
 b=ESgzfR4kO0wcH6ZkZyiOqhwntnM72ClNMG57TeXVSkXhWPt7N00THugSru33PLFkUTsxEVhPO+1G6ATNcfTcVI5s4uvX4P5zUrmy019cLDdVeVktD5Svj8ESDjt4rnSJ+QtEZbW7oyAB9nXvfh2FQury3AUuyeM9sw+QykZO5U5E7WqCvBt42bbpMpkp2EempxHk8QRyXHUNmc+wUbOlXseKA1rGbDA5h6tCci5lmEK5H6aEks8AXuKGY3iOY3kMGdzYau9TPTWQQ+wCf84yPdfrmcjPR5Bqylx1vSDCmjoy7qgtDUDiv/s2+fJYT2drB8/6DlG/rhnR/ptcDgCGwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/eDTTyf7TnHis9ug3gcJyATUHf08pwqCV7lSBV6pU8=;
 b=YpnSMO9P6Plbmr4b0RkHi7os/lKxgW9Tr7QU8m0MY6oRwDLPve4bu6G5BTDzpKc5JgdXWWrLWd50LC6Oetfw01udV75AdMhRRWrpAvdtLzyNtjPo05bjUob52eJHwRDsbf6d9oBEw1+sThDiBHxgdwIrCWYrAPf8g30oP56ImCA=
Received: from PS2PR04CA0009.apcprd04.prod.outlook.com (2603:1096:300:55::21)
 by KL1PR03MB5745.apcprd03.prod.outlook.com (2603:1096:820:65::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 11:15:37 +0000
Received: from PSAAPC01FT064.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:55:cafe::5e) by PS2PR04CA0009.outlook.office365.com
 (2603:1096:300:55::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Mon, 9 Jan 2023 11:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 PSAAPC01FT064.mail.protection.outlook.com (10.13.38.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 11:15:37 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 9 Jan 2023
 19:15:34 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.7 via Frontend Transport; 
 Mon, 9 Jan 2023 19:15:34 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8821: Implement DRC controls
Date: Mon, 9 Jan 2023 19:15:31 +0800
Message-ID: <20230109111531.391034-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT064:EE_|KL1PR03MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d969927-3a81-46c6-acc5-08daf232d5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewVrZ/AU9Ui6j31gftREmEA32HzzEgU2k3RJo8UVnGMbLFAj73VXscI2vaMVOHq/muQQ+Ey7DRlF8miuIqmw0HixQxb5AAKSYe3ZAcA1Lgir7a9Xl1D4jpS+bE7FIw5qrBhtjxv66x9jda7mgL7HUh2xgDYW6t5DVqOoR26cPY7e8wXZBfxF2Zd4BswTJf0yHJIBcTUobaEnqn9Lk5ErkSw0pq4TCnZcSprZ2GzB75qCCTC3HiOF4D8HAwZB7awahyyOPvZTaZJcHMOkv3Qmwom3pYX5k58WXGqH1dO5eNacOOSrG+DAf3HnqlQK/IOGTvORCb85L0uOcby+wKjXsCr9QRs6yxwqKg4my8R010zFECo0U4wjnaWPwVPLL7SglY1U7qQF4QrMCRpVRatpCCK/lS8cxNXeC8GPfn0K8zFcGdU5iM30O7zgaLGK4TPsE5PaTeU61pev869qClWPXBzR2YYfi1mcBmNDLPR0V8rvDZ8s9OnO6H9EDneUUAMa8pFT5PMSImgmhQDzDPCWKyQO1qsuSWSyCEc2HxDhVTA31Hw4CuvT00NXj6ZuTY7q5FuU2PuFYSaL4q4A/3enJVnE32UXL5ikqZS8hsp70ZBzTIeNTb/h//a4ny0Etvs7xAmtTmzLUP1KXdg5df+hGjoK5HJ/+urbGWH6nmu4FIgoKfHxwIG4w74/FQZFPsKRaqCctsbJlJ2uMwCvwp28w+wbcrPg7PZ80CtuBSX9N6LVLmhGdPCu+KVY1eGPOt/E
X-Forefront-Antispam-Report: CIP:211.75.126.7; CTRY:TW; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:NTHCCAS01.nuvoton.com;
 PTR:211-75-126-7.hinet-ip.hinet.net; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(40460700003)(1076003)(426003)(47076005)(54906003)(36906005)(2616005)(316002)(41300700001)(4326008)(70586007)(36756003)(8676002)(6916009)(336012)(70206006)(82310400005)(86362001)(36860700001)(81166007)(356005)(82740400003)(40480700001)(5660300002)(83380400001)(8936002)(2906002)(478600001)(186003)(107886003)(6666004)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 11:15:37.3582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d969927-3a81-46c6-acc5-08daf232d5be
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07; Ip=[211.75.126.7];
 Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT064.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5745
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
