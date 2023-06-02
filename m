Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E155271F922
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 06:11:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 007841F4;
	Fri,  2 Jun 2023 06:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 007841F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685679088;
	bh=fqNpOH+W/QSt26g7REj/C9i5JbLivTRaiu2cCcJT7nA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jPpOr8HK0yIQrcfmAGWEjy60tHsqzgZs9Q1cShXiA1WzePN6ge2AgrFpap/5BPng9
	 TGfbtIwwn87WkfFXVfuV8smlqF3E5fT/YG70W3kQIhDOvuPAU51JWO7Z68QvtMjAHP
	 WDiskGAO7bjBNDvEDiImlcYvxignf1ZUaG2GjVQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D29B5F80544; Fri,  2 Jun 2023 06:10:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20686F80149;
	Fri,  2 Jun 2023 06:10:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32861F8047D; Fri,  2 Jun 2023 06:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DCAEF800BD
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 06:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DCAEF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=Mtg8aX9R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaEdkVtlETaszf7+pPpOFXAg5Me2AhALL1XNMyaVwoDPxklRAUe2SQ9p8R+ihyF59uhdUVinJoV/xvSRQSsP22+amaaAM9Tnnvj/YUZRa8xtpPRdmv8k3OwL7dtWM1LcpqwLLJJPO6TLbvggA4gdeT3YARYpITvBs9L5HKe5zchTV7JiJ0KY7VJpAzHHAB8LioLH0A5VHmB0xrO7g/EgvUfB6+WbLKAfY9Y2+sUFntQsDttgRWTnGWh8NxvMl/aKbQ1DHO2CEV/ovkEG5g39Snb+eQkwVbe5ePt/qUr6XKhrYYKnGpVeWmXrxCa7kXal2Uf033PTniE2Tg/J6oWwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyDmtDVVtgJsFv3He3qtMfNgzy2T9Dq9owX33MhSSpY=;
 b=Xq/Q1Lfc2g5grAr1RT4rtuf6fSIIdbEp7ZNpcurs15AUW/QW39g61aiTunLjKmHS+V+j5U9i18RHo9VY4TLwsQGUmzTM36CrQs8kQkGbusYaiI5419VPjRf+I+cY1fsSBcE+35bhnvnSO1u7vxolOYDJxjF9cE3ZjDDunRWky6AyHpB2mqmkovmo7pgIahB8q8pCVb7E0BfxLuNdMZw2UmzNvdyvgNsKwh0FgcIApDSE2MJqzcfq2kYomhnk77ndIhtStpQ+7CQegSsktXnFqBeAI0GKG/MrDWMqjtYGjV9SyVuzQ1bIp5G24YuBuzTw4vCkVVaKxkyUSEnusvlBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyDmtDVVtgJsFv3He3qtMfNgzy2T9Dq9owX33MhSSpY=;
 b=Mtg8aX9RAnWQA8lagZvSc9lDEyQEbo+qSKbOAgU6WyOt03+SY8F8Q2ssCUvFqN2g7EJNEyTjOzlMu2V0WjQ697Pca4Ckq2imkLsX9JeSPyKudXWzuMgTVXsCGpJQ+ZxMDchA6Iwbb4lA0ey8xeQzTbsLF1KkKc9FHg3/RR8Qldg=
Received: from PS2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::21) by PUZPR03MB6856.apcprd03.prod.outlook.com
 (2603:1096:301:e4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 04:09:37 +0000
Received: from PSAAPC01FT049.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:58:cafe::68) by PS2PR01CA0033.outlook.office365.com
 (2603:1096:300:58::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 04:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 PSAAPC01FT049.mail.protection.outlook.com (10.13.39.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 04:09:37 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 2 Jun 2023
 12:09:35 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH 3/3] ASoC: nau8825: Update output control for NAU8825C
Date: Fri, 2 Jun 2023 12:09:24 +0800
Message-ID: <20230602040924.188913-4-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602040924.188913-1-CTLIN0@nuvoton.com>
References: <20230602040924.188913-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT049:EE_|PUZPR03MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: 0403897d-2363-4ba5-68e8-08db631f2e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pioqjfsd1Woi7RRp3qR9sFCEORwP6jDsqTcZC022a9VppePyCF/8XQ480dYxbxPasSViQNq8VbgZNqQb+/H1amrjiPDwtsH9IahwrRWeWvhkRP0XzI/15Quw1jB0pFOqL1vCadT0S3onP5vH7sjUg9Q5imsuD7XnSC5GReKwYIAMEhSEcAi/nRU8pqf5awavtpNEW0niZTV2se9IFtCmILecp6qMdet2Z7fXq8bQFsLZ+uBrS7SfPtGsCCvqI24BdVlxzb3HPN1itcKGsYMJD4bFoYHHSK2p+PAs3JnnA7emk+6HVy6+pc8Rml1mcZLYcP7xQ5WVkCN0vp5fQtSxB+FtRo1W/LyXfWMj1Y+x7GpkmUc21PBXKr48d+gUK0Q8deGwa6Em2tP94AQO31xFxEjpTjkY5zHe+7VioQgYvsxCV06IiJt5MAC284JWe1kVR0Yl0Pea4RwajuAduOAAEOYj/IHY2zMZKPkRWksZy5F2zqavkntm5HPNVoA+y6HD8hIjfOKaJKqgwNqOSgRE67nzT/ThQho6NQFExshdg1y/5mI5aXtGWjSGtIYUFPz9yZmuPnBqrpVrmKWAnYBhSQesJyqnNsarEnB/j9CdnFMfq71R6V9YZwj8/383vmv4X9t5pGJfvrGivAFj9Ua87HY9oxBZyDuj1yBJ1k8V0qrLA5ia2JTgG6Vf7UPN+raxV05bf5pscQO5O1EvdaUtoNtwfW2szSHuWDkbf83xOi0=
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(36840700001)(46966006)(40470700004)(6916009)(54906003)(15650500001)(8936002)(8676002)(2906002)(70586007)(70206006)(41300700001)(5660300002)(316002)(4326008)(478600001)(6666004)(36860700001)(40460700003)(107886003)(356005)(81166007)(33656002)(186003)(26005)(40480700001)(1076003)(82740400003)(83380400001)(426003)(336012)(47076005)(36756003)(86362001)(82310400005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 04:09:37.7004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0403897d-2363-4ba5-68e8-08db631f2e7c
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	PSAAPC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6856
Message-ID-Hash: UOLCCODITSCDT7JJ3JWMB777KCOJFCB4
X-Message-ID-Hash: UOLCCODITSCDT7JJ3JWMB777KCOJFCB4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOLCCODITSCDT7JJ3JWMB777KCOJFCB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update the output control for NAU8825C.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 47 ++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index e62f3d615b40..9e0e4ddf128e 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -628,8 +628,13 @@ static void nau8825_xtalk_prepare(struct nau8825 *nau8825)
 	regmap_update_bits(nau8825->regmap,
 		NAU8825_REG_INTERRUPT_MASK, NAU8825_IRQ_RMS_EN, 0);
 	/* Power up left and right DAC */
-	regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
-		NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL, 0);
+	if (nau8825->sw_id == NAU8825_SOFTWARE_ID_NAU8825)
+		regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
+				   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL, 0);
+	else
+		regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
+				   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL,
+				   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL);
 }
 
 static void nau8825_xtalk_clean_dac(struct nau8825 *nau8825)
@@ -642,9 +647,14 @@ static void nau8825_xtalk_clean_dac(struct nau8825 *nau8825)
 		NAU8825_SPKR_DWN1R | NAU8825_SPKR_DWN1L,
 		NAU8825_SPKR_DWN1R | NAU8825_SPKR_DWN1L);
 	/* Power down left and right DAC */
-	regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
-		NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL,
-		NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL);
+	if (nau8825->sw_id == NAU8825_SOFTWARE_ID_NAU8825)
+		regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
+				   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL,
+				   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL);
+	else
+		regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
+				   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL, 0);
+
 	/* Enable the TESTDAC and  disable L/R HP impedance */
 	regmap_update_bits(nau8825->regmap, NAU8825_REG_BIAS_ADJ,
 		NAU8825_BIAS_HPR_IMP | NAU8825_BIAS_HPL_IMP |
@@ -1017,10 +1027,25 @@ static int nau8825_output_dac_event(struct snd_soc_dapm_widget *w,
 		/* Disables the TESTDAC to let DAC signal pass through. */
 		regmap_update_bits(nau8825->regmap, NAU8825_REG_BIAS_ADJ,
 			NAU8825_BIAS_TESTDAC_EN, 0);
+		if (nau8825->sw_id == NAU8825_SOFTWARE_ID_NAU8825)
+			regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
+					   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL, 0);
+		else
+			regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
+					   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL,
+					   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		regmap_update_bits(nau8825->regmap, NAU8825_REG_BIAS_ADJ,
 			NAU8825_BIAS_TESTDAC_EN, NAU8825_BIAS_TESTDAC_EN);
+		if (nau8825->sw_id == NAU8825_SOFTWARE_ID_NAU8825)
+			regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
+					   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL,
+					   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL);
+		else
+			regmap_update_bits(nau8825->regmap, NAU8825_REG_CHARGE_PUMP,
+					   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL, 0);
+
 		break;
 	default:
 		return -EINVAL;
@@ -1228,12 +1253,13 @@ static const struct snd_soc_dapm_widget nau8825_dapm_widgets[] = {
 		NAU8825_REG_POWER_UP_CONTROL, 0, 0, NULL, 0),
 
 	SND_SOC_DAPM_PGA_S("Output DACL", 7,
-		NAU8825_REG_CHARGE_PUMP, 8, 1, nau8825_output_dac_event,
+		SND_SOC_NOPM, 0, 0, nau8825_output_dac_event,
 		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_PGA_S("Output DACR", 7,
-		NAU8825_REG_CHARGE_PUMP, 9, 1, nau8825_output_dac_event,
+		SND_SOC_NOPM, 0, 0, nau8825_output_dac_event,
 		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
+
 	/* HPOL/R are ungrounded by disabling 16 Ohm pull-downs on playback */
 	SND_SOC_DAPM_PGA_S("HPOL Pulldown", 8,
 		NAU8825_REG_HSD_CTRL, 0, 1, NULL, 0),
@@ -2227,9 +2253,10 @@ static void nau8825_init_regs(struct nau8825 *nau8825)
 	regmap_update_bits(regmap, NAU8825_REG_DAC_CTRL1,
 		NAU8825_DAC_OVERSAMPLE_MASK, NAU8825_DAC_OVERSAMPLE_64);
 	/* Disable DACR/L power */
-	regmap_update_bits(regmap, NAU8825_REG_CHARGE_PUMP,
-		NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL,
-		NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL);
+	if (nau8825->sw_id == NAU8825_SOFTWARE_ID_NAU8825)
+		regmap_update_bits(regmap, NAU8825_REG_CHARGE_PUMP,
+				   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL,
+				   NAU8825_POWER_DOWN_DACR | NAU8825_POWER_DOWN_DACL);
 	/* Enable TESTDAC. This sets the analog DAC inputs to a '0' input
 	 * signal to avoid any glitches due to power up transients in both
 	 * the analog and digital DAC circuit.
-- 
2.25.1

