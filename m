Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A2570D78A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:34:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B95C9839;
	Tue, 23 May 2023 10:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B95C9839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684830881;
	bh=qLDLJN38LoB1QlVj9g094jCz31rMVA2Zqq98usG66Vc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eBUIxhSQSMr3OZPWhAAVeiJe16rLipv1HXJ9dhdBwVCygNbA1XUk06eAZH8gL7nG2
	 dfDTsRqNYP5NNmdeGA+rvV2skgVgoRFc6uhfnyr8bDsarBBQq+82wPL6e3B1WD24Bk
	 J5IBfg5ccawBX2DILNVQdQlKbcuq3tsVTfi8tNik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0263F8053D; Tue, 23 May 2023 10:33:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB2FFF800DF;
	Tue, 23 May 2023 10:33:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96271F8024E; Tue, 23 May 2023 10:33:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF648F80086
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 10:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF648F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=GuoswnjV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L27OCqGSjoBsgefTuexTRYFnGW+9Kn/x9wX5I5RgYSoGTreyd5emQxcTwvKoqFxc5x5q5JGnwa6mSRzcneMHC7QwUOmQB9Fj+QTapQ8dsjILGD7H3L5Hq1XwJJZzCi9R8P2kxrXtkn0sbrWtRjc8Wis8UJXL9vz4LjhtlCBi1vZkCMsBD5mLeA7FyTtKlHdD71fw36GwnX1NwDS/qtIcwdLzw6BT+zvCGeZAQ8EmV0mWoAlQRW1ASkJSdwayYRfYeqw3nvU9oVSRJaZy/SeZrEIVm6kkVoiJcjlNokwgoW/j9NF2h0Vq2p6iVip1bJDgXk/zVljFQqoxYCTLjydjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFXnpjbjY05OYJdXLyOLt2Abodf2/A0H8pT6MT2jljU=;
 b=I5AG8Lo4b6ozN4vMb8G+Cy8zyzAV/nVJxUFrnFrw2WuxYYuVdNiMPthWEkWNcjV3GC6Utc+jY02UuJwPxF3DoeF4cbI4LpLEi/zQj/U1qlpUHF4bC+4e4NBL3k52V1U1WkckI6N3zHms929/QyOyPeFaHgNOzY08PmbOgqg/KBb1LNBKmO/aRsKrjrm3yG7tSHGQmlnRCikkg2pneJP16AFgjIblr+H1jTkn9dhLdq+HNeutPqDiYypyTabfSjKNPOK1xBdovZ2hAJA2otwKiHMJ15LnGFZxfpj8wPHISxr7OfC/6HKnRT2woOCTGcz8A52wCQKaiseeakDPoLk4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFXnpjbjY05OYJdXLyOLt2Abodf2/A0H8pT6MT2jljU=;
 b=GuoswnjV5FxFln+RqpC7mvyoN9WoSmzqrpJqgLMJyG6aFnTJ9e3EiNDTTKi8+JSJJXsiejjYQ1mhbuIBODAfr+23lqqp3g/ieyH/f98X/7lv55Al1ucSYE0vO9+AGv958COhUxIThpG/WpbwALutYHS96Qn/XhcTomlvbvrSc/4=
Received: from SG2PR02CA0035.apcprd02.prod.outlook.com (2603:1096:3:18::23) by
 TYSPR03MB7910.apcprd03.prod.outlook.com (2603:1096:400:481::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 08:33:28 +0000
Received: from SG2APC01FT0052.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:18:cafe::64) by SG2PR02CA0035.outlook.office365.com
 (2603:1096:3:18::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 08:33:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 SG2APC01FT0052.mail.protection.outlook.com (10.13.36.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 08:33:27 +0000
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 May 2023 16:33:26 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Tue, 23 May 2023 16:33:26 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>, <WTLI@nuvoton.com>,
	<SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH] ASoC: nau8825: Add pre-charge actions for input
Date: Tue, 23 May 2023 16:33:04 +0800
Message-ID: <20230523083303.98436-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0052:EE_|TYSPR03MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: ca961614-96d5-44f0-8609-08db5b6861bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JIfrauUTw12xn4Yw/FnI+j3uDfHWiG0KoYYxsJ+VFAVpFP5N3BQyOk4xpw+ADMdbaDKU7It5ALOm5ugmcJIJSQgPnm+WBk7/jDeRELLLe+7ZiH0w5Rhf5uH6/fRJJr98dNrbj7NYx4o/t0DiBgy2YAlCTVg5HTFDd6vAsoBxCGQPUlnHY09CgxRb1aIcifsmYcI0aeQOiQ3nw3vh1oLJz/U7Z6B6veVMjXykv3zmdLRGmUgH1f2ZoIMS7GVhwZRzqOBDNgXILiufVBFvGUrX5aJLPl/Vy23u5kFCfC5igt7vCi/NGuw2GOL2BOCP/iz/X01nlqFP+Nzy+KOyUZqmIQrlmvBBZ+nDkBs7tgXtlhmbAaXTDNkzY7wZJK2LdAC8t4yqxhBU20wPhthrWivmZkyN0+1Vwktn5afhSojPM9WzpuwDDcmuyO6JlZ/vctUtukLA9e+KVac8jdnuQejQ0CNSChioaBm5Bt4DhiShl0XV3H8Z/YM+hKnFfPYjEvMResuGCD1arzTuygeU4/1YWMuEpcNgE0MuFvyTqsAOFud6Dh6KNa/RW7AvwIsYxkFqFkRmz2bAf3tCvvUpyt0FiMNMaarYMhDacmuXyk1/yQNpGYhkV43cC0h3XL7c7P2hCyfp51LXhdkwAVwBVdLEZucCHE/HF23stMpSZtEV0oxiMfvTy0x9JzQrUAL28MEgqmIdoI9hYrX8+0EJ09bU7y+t9lBbJomvvgAD6k6322r3xYNuAWFesyBvRpp0TLm4sK6Ohcr42jql+CMaHYaJw/DZlGX4vaZK01Pgqa9s8Qk=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(336012)(426003)(47076005)(41300700001)(2616005)(83380400001)(186003)(2906002)(36860700001)(6916009)(4326008)(70586007)(70206006)(316002)(6666004)(478600001)(54906003)(5660300002)(1076003)(26005)(107886003)(8676002)(8936002)(40480700001)(82310400005)(82740400003)(81166007)(356005)(33656002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 08:33:27.6475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca961614-96d5-44f0-8609-08db5b6861bf
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2APC01FT0052.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7910
Message-ID-Hash: TKNJM5E2OOALRSJKMC4JA64AYAXWRQXZ
X-Message-ID-Hash: TKNJM5E2OOALRSJKMC4JA64AYAXWRQXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKNJM5E2OOALRSJKMC4JA64AYAXWRQXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adding pre-charge actions to make FEPGA power stable faster. It
improve the recording quality at the beginning. Thus, it is also
meaningfully to decrease the final adc delay time.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 30 ++++++++++++++++++++++++++++--
 sound/soc/codecs/nau8825.h |  7 +++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 775c8e0cb09e..cc3e18207c42 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -911,6 +911,32 @@ static bool nau8825_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static int nau8825_fepga_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_update_bits(nau8825->regmap, NAU8825_REG_FEPGA,
+				   NAU8825_ACDC_CTRL_MASK,
+				   NAU8825_ACDC_VREF_MICP | NAU8825_ACDC_VREF_MICN);
+		regmap_update_bits(nau8825->regmap, NAU8825_REG_BOOST,
+				   NAU8825_DISCHRG_EN, NAU8825_DISCHRG_EN);
+		msleep(40);
+		regmap_update_bits(nau8825->regmap, NAU8825_REG_BOOST,
+				   NAU8825_DISCHRG_EN, 0);
+		regmap_update_bits(nau8825->regmap, NAU8825_REG_FEPGA,
+				   NAU8825_ACDC_CTRL_MASK, 0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int nau8825_adc_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
@@ -1127,8 +1153,8 @@ static const struct snd_soc_dapm_widget nau8825_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("MIC"),
 	SND_SOC_DAPM_MICBIAS("MICBIAS", NAU8825_REG_MIC_BIAS, 8, 0),
 
-	SND_SOC_DAPM_PGA("Frontend PGA", NAU8825_REG_POWER_UP_CONTROL, 14, 0,
-		NULL, 0),
+	SND_SOC_DAPM_PGA_E("Frontend PGA", NAU8825_REG_POWER_UP_CONTROL, 14, 0,
+			   NULL, 0, nau8825_fepga_event, SND_SOC_DAPM_POST_PMU),
 
 	SND_SOC_DAPM_ADC_E("ADC", NULL, SND_SOC_NOPM, 0, 0,
 		nau8825_adc_event, SND_SOC_DAPM_POST_PMU |
diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
index 44b62bc3880f..38ce052aed50 100644
--- a/sound/soc/codecs/nau8825.h
+++ b/sound/soc/codecs/nau8825.h
@@ -442,10 +442,17 @@
 /* BOOST (0x76) */
 #define NAU8825_PRECHARGE_DIS	(1 << 13)
 #define NAU8825_GLOBAL_BIAS_EN	(1 << 12)
+#define NAU8825_DISCHRG_EN	(1 << 11)
 #define NAU8825_HP_BOOST_DIS		(1 << 9)
 #define NAU8825_HP_BOOST_G_DIS	(1 << 8)
 #define NAU8825_SHORT_SHUTDOWN_EN	(1 << 6)
 
+/* FEPGA (0x77) */
+#define NAU8825_ACDC_CTRL_SFT		14
+#define NAU8825_ACDC_CTRL_MASK		(0x3 << NAU8825_ACDC_CTRL_SFT)
+#define NAU8825_ACDC_VREF_MICP		(0x1 << NAU8825_ACDC_CTRL_SFT)
+#define NAU8825_ACDC_VREF_MICN		(0x2 << NAU8825_ACDC_CTRL_SFT)
+
 /* POWER_UP_CONTROL (0x7f) */
 #define NAU8825_POWERUP_INTEGR_R	(1 << 5)
 #define NAU8825_POWERUP_INTEGR_L	(1 << 4)
-- 
2.25.1

