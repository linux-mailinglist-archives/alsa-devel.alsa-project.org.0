Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A166637C9
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 04:15:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D82CD7CE;
	Tue, 10 Jan 2023 04:15:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D82CD7CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673320555;
	bh=zUxynVVGAwnhZfaOb/9/e5JWdRk7/MYZWS3LEpjGF/s=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=C7uMvnOgSArLAvbWzdhvKTiMbDyXs79dgLqGwXiWay6gtgQi+bwkwHihH+/RLgC6u
	 4IENj0suQPbEiSyR6ve2lXq1N5AiqMteZORMWbKhOt0dtYPm89CtLnCv21fvcOybJy
	 DjkBT2GBsD24DCopiQEZQfn+zdnt+ZwxpDdwW2eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7258AF804CA;
	Tue, 10 Jan 2023 04:14:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEBEBF804C1; Tue, 10 Jan 2023 04:14:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2060.outbound.protection.outlook.com [40.107.117.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 769F6F800C7
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 04:14:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 769F6F800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=Bfru7vr8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9G9drcSH1pQ3Zxg/sR/fkwArnBCay0cGeT+miVjIWyTY9fTyJSnapm1sTT9+G1jGZe4tVAOLIMwK0YyarTwJaoN4xLTULp30eTyv0vSrHH64c/4d3ZiHsq3Nyp0RAp8nYJbWOVDhoW2MgYmpt87DKf4pmwz4BTvnJdv2IInynrhSlEx6PMlSX7RGYOpGPu+LEb3ZCa49t5GKHLH228wTpm92uQtq25qaxh0tRQj1EooD0IFrZogLf9uSuJxQdqLBNa16SySCc6lXy6ZKRLbcxZ7Lf+DSshYTxV/pEDLfko5XqzC1K79kHqMl+0s4nv7mRONsWval0i9SOAREuT9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/eDTTyf7TnHis9ug3gcJyATUHf08pwqCV7lSBV6pU8=;
 b=jNNNnacB/AnzBPlUMo/1AXGKnDq/fqFYMm8vYW1h4JRfND1CT94iM/kW73ucx/81tHaBpdRWdWX5fa6DbFc9Hp61K1Z3c8LePt31nqGMb2bV3OqUDaHuu7ep+qiTbWa3EOstahT23MTmD4Ffdrmkj/KHGccxjWCgpFVKkGo9emlZ4najmaVOXhszp7zPyNmavAy7mCKD/O9aBEitvAnFCoLZEhLetETFWiFzMFuWehofNsI2ilxl8rcxUeOuEztaL1F0YDtXytB/3clEVeiwo9XhC8+OWkZDKfbrLeBhcCA/rltQXjA8N+sYK6fjppgWuhssqW2+sQK7QSDmLq79iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/eDTTyf7TnHis9ug3gcJyATUHf08pwqCV7lSBV6pU8=;
 b=Bfru7vr8NFdLAkzDij+FXoaJiCUGM1+UyQbRKe4Owfr0Hjinlb3gIn2Q8eK5BA9SD8/iq25W+lbQP4syiuvRz6vqRUZJZwNklT+zRkyAypq75KXFhYtZbFTVo+7LNs5nNj2v7bVsFuWZYns7Vzvsj1OJsEMBuxSc5nsXFNi3zlQ=
Received: from TYBP286CA0018.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:ce::30)
 by SEYPR03MB6483.apcprd03.prod.outlook.com (2603:1096:101:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 03:14:39 +0000
Received: from TYZAPC01FT061.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:ce:cafe::6c) by TYBP286CA0018.outlook.office365.com
 (2603:1096:404:ce::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 03:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 TYZAPC01FT061.mail.protection.outlook.com (10.118.152.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 03:14:38 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 10
 Jan 2023 11:14:33 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.7 via Frontend Transport; 
 Tue, 10 Jan 2023 11:14:34 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8821: Implement DRC controls
Date: Tue, 10 Jan 2023 11:14:27 +0800
Message-ID: <20230110031427.459588-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT061:EE_|SEYPR03MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: ad84f534-8149-4292-eaca-08daf2b8cf0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zahB9Ed9Ibnx86vVnVFPCF/w2nSKrjuy2/NQGpcs7yiq0pbvYP0d6EeBpg3kA+jxlzFmbZqIvTQe18nJ38FSLopr0kdiNaa7XfxFvamih1RHQ5PN5OZSBVvDUSsj4ygMiQAkmgKyi5KdS9qQse+pbkRLlwtct9cP5qt7Lpc/u/u0lLKZ9XzuYfBAogbceSDDttA6hwTUWgZgpaFm/iNpQR13nOrS3vRkOQqmsRqkTunIRRwmsa0G9JpOBgNmJ1Pwgi7Vfaswmju2CB3sdh+D+BztEJ+nMRxV0uz5Xr8qjuTCARM9qGeoe+9YO+fntG+LWI3QRvnGb6Fsm/TxMCr721sDOGSKEBYuozw+MvTvTGp/ZgL70Rij5vZiWvZNnGan81vnluSSZGJ3S8rYPvMQZHjOwj7Vq5eQ5n0zAN/gz7425SHZgj3blTuDsG+ZtNgPr0PB22ajjLwr25CcCSJYqnibqvI6q1HQVB00GOu2uXRJCbcg9KVWFV9+rIujTq/IAfTA14Wp3YTi2KQaarC3oFvKRF9T7YSh6UnrY0XX7eHdt1QzhzhhzGwtqbZDeHZ/bJ6B+lq6jShS3H8B4s1mI7qBWE5BiWZ0PKkr1I52Y6JMrbbMU2vgUdxtH42mvgm4Kw+FRhXnqNPa0E+RQO0IvymfOXywrxtZzXimbNrnmvgsnfNuvLDjfhjkStcJT0TNxTN3k3BHCnRi/8WGwSqgfg==
X-Forefront-Antispam-Report: CIP:175.98.123.7; CTRY:TW; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:NTHCCAS04.nuvoton.com; PTR:175-98-123-7.static.tfn.net.tw;
 CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(478600001)(26005)(186003)(6666004)(107886003)(36906005)(54906003)(316002)(2616005)(1076003)(8676002)(36756003)(70586007)(6916009)(336012)(40460700003)(70206006)(4326008)(47076005)(41300700001)(426003)(5660300002)(83380400001)(82740400003)(36860700001)(40480700001)(82310400005)(86362001)(356005)(81166007)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 03:14:38.7265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad84f534-8149-4292-eaca-08daf2b8cf0d
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07; Ip=[175.98.123.7];
 Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT061.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6483
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
