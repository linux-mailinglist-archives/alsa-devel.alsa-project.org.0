Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523AE82E7F9
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 03:46:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D17841F7;
	Tue, 16 Jan 2024 03:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D17841F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705373193;
	bh=hZAdKk9RqaNXKB4WIBK7PviliEVlwmq+uQTyO9qGRjw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=izfj5X8n9hqOkOT26MIpmXDRRnUlRorlryXEaLnEpXHSZAiET28+QZ3eoX5uAwvJT
	 oIDqgKC/icS78Jki2Mn3XAFBm1GRHr0/inToBdT7STzF9WsZijoFYgWV7j71dFV46g
	 8RlVMR4O3X/hNC5uhumgYRpZLxNBLQdUYE2NPvC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C4A8F80587; Tue, 16 Jan 2024 03:46:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA769F80236;
	Tue, 16 Jan 2024 03:46:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA9C2F801F5; Tue, 16 Jan 2024 03:45:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79E87F800C1
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 03:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E87F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=OvmlieMW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbnMSnb38t1fFYUrkF5sGHlF9KRonOES/Mb1qFUWEtK1j26yS6Zjca4KqTEuVEimW5um+8r0U+8wT8w26sYm55iylmmTs160M6Ezm6TmdvAFaZdOgaP2arSD2VymbdcL/x0ngTr2vUEIkmqIxHPEGYICzrpg0pwZ/H5r1pcnwPgrZ8gCi6+mLcK52wqe4jPv2Wa7SCNHZptpSkWBZGlhTyBqdnAq0Krc7A5gC+SPur7zJwrj7g79jQAfsQsrpaafNPVKVeeYBIgsRrd1zWNvogOI92L9tCOurdbiEUHtj3VlvYE3R+AdsQT1ERlEVdbeA+XFRs3JXgXFv334kgrchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3v2xzzu41Gcqq6D0aP2ECTb8gtI6yhjHodyu3ZWoYc=;
 b=IV1mxb/NiNIijOQ04o3jTCjOsYeF+Rj3XGH7K4nlmIEFY6+rv7piZM2npsaH340nyoHgV8BP/jytfg+ceGIjJx/UnMOC0WGB1a1JeElw+gaP0cbv0HzEHYT9kp3JvujWABCIBwYtJTBvEJfYRwxvGP81faRmALYD2Pzj79A5cEJNlSZkWYOJcR7E8RIs1Fdo0HACjfKFIabyJNsuC/AsacxZ3ZeYK6nzj8lhVN1AcNET/s1KaEG0im6PUosaCPetvyDXNGrTgIDOiBRr2CNfZwHcWa+9PVAlqjTbVEHAbN7Lp+xUrmeO97tKBLFmalZil9vKkRN9ZrLnkt7s1r0vRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3v2xzzu41Gcqq6D0aP2ECTb8gtI6yhjHodyu3ZWoYc=;
 b=OvmlieMWzBt5WCH5q/Y3bFRcEaQATYQHUWgHFZTsTA3ipRgr2iZ6foGN7mXd2/rwP/rKZB7wJJMBMfKpHWUlcdq2dltPT3etYEQmUv8veLshC6mWqJa6cAn+/iHqIuU5f/qbZqo9aJpM8CFEbBW3vXgltAKYJiLwH3AjSkPGLss=
Received: from SG2PR01CA0149.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::29) by PSAPR03MB5765.apcprd03.prod.outlook.com
 (2603:1096:301:83::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Tue, 16 Jan
 2024 02:45:36 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:8f:cafe::31) by SG2PR01CA0149.outlook.office365.com
 (2603:1096:4:8f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28 via Frontend
 Transport; Tue, 16 Jan 2024 02:45:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Tue, 16 Jan 2024 02:45:35 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 Jan
 2024 10:45:29 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 16 Jan
 2024 10:45:29 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 Jan 2024 10:45:29 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>, <WTLI@nuvoton.com>,
	<SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH] ASoC: nau8540: Add pre-charge actions for input
Date: Tue, 16 Jan 2024 10:45:20 +0800
Message-ID: <20240116024519.24569-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|PSAPR03MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb94c46-bd50-4589-0a08-08dc163d376e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pBFN6CqesivY3H7+uQnJAsK2YCK5NjgQEkTuYwUnzjHzhT0SF3UslTEuWrJG4YZ9orMTeR1kOt443SfQBSIKXUSLO1K5xXUleVKgPIfZDcLU6WSX8OyBN455yr5fPIwnCm3v2Jxp6/zNF7AFQYUS2qW+NYb5lkTlYe8rYJWv1BjiYvMDBjVNKFKjhMwmBWv493iH9naI8JPRF0vTvOm0+HtcBNN9CSrmZeAt0GMYPXd0g0j6+n42fqjBkOAmm5TZ+bJTQJcwfrprsuixb+aLRsW5tHhRoqxdZDqVpzFeiTOmEtVYlvHdgTVHKiK+wWFUk0IkxB4O3WWkJPb8EEo10N4tqtJPVbXW40iwiOxp0PQC9nltYVZK6ipF5Fp6RVXSs6pgtyM/JEyBKW3tzjk3jE/upHrlkm91JLO9lK+YJEHfn4H0ncnqIMWn+an/rPzMdamV/CUBPv/rIQQjmHSmuyD8pataT4nHzAko3SbMXSMNMQy+dojKAjJxozxO0HoZPBEEykxSPx1UldVEYCV/ocjaGa54Sl4GL9mplzY4EI2Gu3eUM0BWpBb0AqB0aqIOYG8DjslD6/rxDnQlZ+5cqtEDlPgzQ++z98MBxK2P+U94cI50uyJnHyH1UN2+lL6slWanAcWskwGRAm7PFunx9VoSCxPIS8Skp+83lWTr9V/D9+RWNNrETTYznBcgl5nBHHDg3+EBJAfTmH7/OrQpGSZ9TlLUAnEhWhpxBsXzgpk=
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82310400011)(40470700004)(36840700001)(46966006)(41300700001)(82740400003)(47076005)(83380400001)(36860700001)(36756003)(33656002)(86362001)(81166007)(356005)(70586007)(70206006)(54906003)(316002)(6916009)(2906002)(4326008)(8676002)(8936002)(5660300002)(1076003)(2616005)(336012)(426003)(26005)(107886003)(478600001)(6666004)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 02:45:35.7448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9eb94c46-bd50-4589-0a08-08dc163d376e
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5765
Message-ID-Hash: ZVVXSIBURDS64EAJYLQBJTBTSMAIXWRD
X-Message-ID-Hash: ZVVXSIBURDS64EAJYLQBJTBTSMAIXWRD
X-MailFrom: CTLIN0@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVVXSIBURDS64EAJYLQBJTBTSMAIXWRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adding pre-charge mechanism to make FEPGA power stable faster. It
not only improved the recording quality at the beginning but also
meaningfully decreased the final adc delay time.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8540.c | 116 +++++++++++++++++++++++++------------
 sound/soc/codecs/nau8540.h |  13 ++++-
 2 files changed, 92 insertions(+), 37 deletions(-)

diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index f66417a0f29f..22251fb2fa1f 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -26,7 +26,6 @@
 #include <sound/tlv.h>
 #include "nau8540.h"
 
-
 #define NAU_FREF_MAX 13500000
 #define NAU_FVCO_MAX 100000000
 #define NAU_FVCO_MIN 90000000
@@ -230,6 +229,49 @@ static SOC_ENUM_SINGLE_DECL(
 static const struct snd_kcontrol_new digital_ch1_mux =
 	SOC_DAPM_ENUM("Digital CH1 Select", digital_ch1_enum);
 
+static int nau8540_fepga_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_update_bits(nau8540->regmap, NAU8540_REG_FEPGA2,
+				   NAU8540_ACDC_CTL_MASK, NAU8540_ACDC_CTL_MIC1P_VREF |
+				   NAU8540_ACDC_CTL_MIC1N_VREF | NAU8540_ACDC_CTL_MIC2P_VREF |
+				   NAU8540_ACDC_CTL_MIC2N_VREF | NAU8540_ACDC_CTL_MIC3P_VREF |
+				   NAU8540_ACDC_CTL_MIC3N_VREF | NAU8540_ACDC_CTL_MIC4P_VREF |
+				   NAU8540_ACDC_CTL_MIC4N_VREF);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int nau8540_precharge_event(struct snd_soc_dapm_widget *w,
+				   struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_update_bits(nau8540->regmap, NAU8540_REG_REFERENCE,
+				   NAU8540_DISCHRG_EN, NAU8540_DISCHRG_EN);
+		msleep(40);
+		regmap_update_bits(nau8540->regmap, NAU8540_REG_REFERENCE,
+				   NAU8540_DISCHRG_EN, 0);
+		regmap_update_bits(nau8540->regmap, NAU8540_REG_FEPGA2,
+				   NAU8540_ACDC_CTL_MASK, 0);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
 static int adc_power_control(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *k, int  event)
 {
@@ -237,8 +279,10 @@ static int adc_power_control(struct snd_soc_dapm_widget *w,
 	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		msleep(300);
+		msleep(160);
 		/* DO12 and DO34 pad output enable */
+		regmap_update_bits(nau8540->regmap, NAU8540_REG_POWER_MANAGEMENT,
+				   NAU8540_ADC_ALL_EN, NAU8540_ADC_ALL_EN);
 		regmap_update_bits(nau8540->regmap, NAU8540_REG_PCM_CTRL1,
 			NAU8540_I2S_DO12_TRI, 0);
 		regmap_update_bits(nau8540->regmap, NAU8540_REG_PCM_CTRL2,
@@ -248,6 +292,8 @@ static int adc_power_control(struct snd_soc_dapm_widget *w,
 			NAU8540_I2S_DO12_TRI, NAU8540_I2S_DO12_TRI);
 		regmap_update_bits(nau8540->regmap, NAU8540_REG_PCM_CTRL2,
 			NAU8540_I2S_DO34_TRI, NAU8540_I2S_DO34_TRI);
+		regmap_update_bits(nau8540->regmap, NAU8540_REG_POWER_MANAGEMENT,
+				   NAU8540_ADC_ALL_EN, 0);
 	}
 	return 0;
 }
@@ -274,28 +320,26 @@ static const struct snd_soc_dapm_widget nau8540_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("MIC3"),
 	SND_SOC_DAPM_INPUT("MIC4"),
 
-	SND_SOC_DAPM_PGA("Frontend PGA1", NAU8540_REG_PWR, 12, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Frontend PGA2", NAU8540_REG_PWR, 13, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Frontend PGA3", NAU8540_REG_PWR, 14, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Frontend PGA4", NAU8540_REG_PWR, 15, 0, NULL, 0),
-
-	SND_SOC_DAPM_ADC_E("ADC1", NULL,
-		NAU8540_REG_POWER_MANAGEMENT, 0, 0, adc_power_control,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
-	SND_SOC_DAPM_ADC_E("ADC2", NULL,
-		NAU8540_REG_POWER_MANAGEMENT, 1, 0, adc_power_control,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
-	SND_SOC_DAPM_ADC_E("ADC3", NULL,
-		NAU8540_REG_POWER_MANAGEMENT, 2, 0, adc_power_control,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
-	SND_SOC_DAPM_ADC_E("ADC4", NULL,
-		NAU8540_REG_POWER_MANAGEMENT, 3, 0, adc_power_control,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
-
-	SND_SOC_DAPM_PGA("ADC CH1", NAU8540_REG_ANALOG_PWR, 0, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("ADC CH2", NAU8540_REG_ANALOG_PWR, 1, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("ADC CH3", NAU8540_REG_ANALOG_PWR, 2, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("ADC CH4", NAU8540_REG_ANALOG_PWR, 3, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("Frontend PGA1", 0, NAU8540_REG_PWR, 12, 0,
+			   nau8540_fepga_event, SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_PGA_S("Frontend PGA2", 0, NAU8540_REG_PWR, 13, 0,
+			   nau8540_fepga_event, SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_PGA_S("Frontend PGA3", 0, NAU8540_REG_PWR, 14, 0,
+			   nau8540_fepga_event, SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_PGA_S("Frontend PGA4", 0, NAU8540_REG_PWR, 15, 0,
+			   nau8540_fepga_event, SND_SOC_DAPM_POST_PMU),
+
+	SND_SOC_DAPM_PGA_S("Precharge", 1, SND_SOC_NOPM, 0, 0,
+			   nau8540_precharge_event, SND_SOC_DAPM_POST_PMU),
+
+	SND_SOC_DAPM_PGA_S("ADC CH1", 2, NAU8540_REG_ANALOG_PWR, 0, 0,
+			   adc_power_control, SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_PGA_S("ADC CH2", 2, NAU8540_REG_ANALOG_PWR, 1, 0,
+			   adc_power_control, SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_PGA_S("ADC CH3", 2, NAU8540_REG_ANALOG_PWR, 2, 0,
+			   adc_power_control, SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_PGA_S("ADC CH4", 2, NAU8540_REG_ANALOG_PWR, 3, 0,
+			   adc_power_control, SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 
 	SND_SOC_DAPM_MUX("Digital CH4 Mux",
 		SND_SOC_NOPM, 0, 0, &digital_ch4_mux),
@@ -316,20 +360,20 @@ static const struct snd_soc_dapm_route nau8540_dapm_routes[] = {
 	{"Frontend PGA3", NULL, "MIC3"},
 	{"Frontend PGA4", NULL, "MIC4"},
 
-	{"ADC1", NULL, "Frontend PGA1"},
-	{"ADC2", NULL, "Frontend PGA2"},
-	{"ADC3", NULL, "Frontend PGA3"},
-	{"ADC4", NULL, "Frontend PGA4"},
+	{"Precharge", NULL, "Frontend PGA1"},
+	{"Precharge", NULL, "Frontend PGA2"},
+	{"Precharge", NULL, "Frontend PGA3"},
+	{"Precharge", NULL, "Frontend PGA4"},
 
-	{"ADC CH1", NULL, "ADC1"},
-	{"ADC CH2", NULL, "ADC2"},
-	{"ADC CH3", NULL, "ADC3"},
-	{"ADC CH4", NULL, "ADC4"},
+	{"ADC CH1", NULL, "Precharge"},
+	{"ADC CH2", NULL, "Precharge"},
+	{"ADC CH3", NULL, "Precharge"},
+	{"ADC CH4", NULL, "Precharge"},
 
-	{"ADC1", NULL, "MICBIAS1"},
-	{"ADC2", NULL, "MICBIAS1"},
-	{"ADC3", NULL, "MICBIAS2"},
-	{"ADC4", NULL, "MICBIAS2"},
+	{"ADC CH1", NULL, "MICBIAS1"},
+	{"ADC CH2", NULL, "MICBIAS1"},
+	{"ADC CH3", NULL, "MICBIAS2"},
+	{"ADC CH4", NULL, "MICBIAS2"},
 
 	{"Digital CH1 Mux", "ADC channel 1", "ADC CH1"},
 	{"Digital CH1 Mux", "ADC channel 2", "ADC CH2"},
diff --git a/sound/soc/codecs/nau8540.h b/sound/soc/codecs/nau8540.h
index 2ce6063d462b..762bb93b06fd 100644
--- a/sound/soc/codecs/nau8540.h
+++ b/sound/soc/codecs/nau8540.h
@@ -78,6 +78,7 @@
 
 
 /* POWER_MANAGEMENT (0x01) */
+#define NAU8540_ADC_ALL_EN	0xf
 #define NAU8540_ADC4_EN		(0x1 << 3)
 #define NAU8540_ADC3_EN		(0x1 << 2)
 #define NAU8540_ADC2_EN		(0x1 << 1)
@@ -202,6 +203,7 @@
 /* REFERENCE (0x68) */
 #define NAU8540_PRECHARGE_DIS		(0x1 << 13)
 #define NAU8540_GLOBAL_BIAS_EN	(0x1 << 12)
+#define NAU8540_DISCHRG_EN		(0x1 << 11)
 
 /* FEPGA1 (0x69) */
 #define NAU8540_FEPGA1_MODCH2_SHT_SFT	7
@@ -214,7 +216,16 @@
 #define NAU8540_FEPGA2_MODCH4_SHT	(0x1 << NAU8540_FEPGA2_MODCH4_SHT_SFT)
 #define NAU8540_FEPGA2_MODCH3_SHT_SFT	3
 #define NAU8540_FEPGA2_MODCH3_SHT	(0x1 << NAU8540_FEPGA2_MODCH3_SHT_SFT)
-
+#define NAU8540_ACDC_CTL_SFT		8
+#define NAU8540_ACDC_CTL_MASK		(0xff << NAU8540_ACDC_CTL_SFT)
+#define NAU8540_ACDC_CTL_MIC4N_VREF	(0x1 << 15)
+#define NAU8540_ACDC_CTL_MIC4P_VREF	(0x1 << 14)
+#define NAU8540_ACDC_CTL_MIC3N_VREF	(0x1 << 13)
+#define NAU8540_ACDC_CTL_MIC3P_VREF	(0x1 << 12)
+#define NAU8540_ACDC_CTL_MIC2N_VREF	(0x1 << 11)
+#define NAU8540_ACDC_CTL_MIC2P_VREF	(0x1 << 10)
+#define NAU8540_ACDC_CTL_MIC1N_VREF	(0x1 << 9)
+#define NAU8540_ACDC_CTL_MIC1P_VREF	(0x1 << 8)
 
 /* System Clock Source */
 enum {
-- 
2.25.1

