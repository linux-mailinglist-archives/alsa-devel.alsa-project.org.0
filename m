Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39006241ECF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 19:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E06E7167C;
	Tue, 11 Aug 2020 19:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E06E7167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597165269;
	bh=NfODOX3AyceTkFsO+FCfdAwUWtJfY7mN0kYSu2PpvyE=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IX3YJ5trRLyE8EL5VvY6maLshoZo3ftUlscWdZnsawCKhBEeV1yDNxBQ7QZ2vPmz0
	 AzCot6qNa+C5OI0+qea7pM2NH70cxQI3jbfR4UrIXGOcyMUQllgeMHvYq2gd4z3/EF
	 OnxJaZ/BVKFyN27lMwruw/oUOvO81Nku4DlRDkW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 024E2F802E2;
	Tue, 11 Aug 2020 18:57:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D88BF800BC; Tue, 11 Aug 2020 18:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,FROM_WORDY,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140074.outbound.protection.outlook.com [40.107.14.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E647F8015B
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 18:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E647F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="TxLWT7jJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIeNru/YkNXeDKqdRBV/Qf9kUWXib93ZNpE/iZjHpRuwq9cH2MUFAi5pijoVeciYNrjTUTD4SigeM85LkLhC2jPNhO+bfiaUShtghwzZ9fzcJaxgJx8R/awNSw7Hc1kFEJ9MnEABNi7c1Xm87BnNuimc9r+uEmxdK5l8Ugc3ykP2avU21cSQTM1mpTd3IMObvFEROBKn357ceKsL+B5WEZSUKWcqiFCGH+N0/cTQK1NsKR96z6GXDd7hargyl4j8fTDs7my5b4PBoYLsT6W2mYkaHJRyAQTmDb1hBstla49vftvFgYG4JYOSHa2HUS8YgPAhtchg/+nLhz508fwu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sLLe4aKx9uY5vx95LS9KGu/ZAh34CYYf6bXCMFpAn0=;
 b=CSJPcWpepQyL3ggXww02ZRRWhmkGMTWaZau0lReOJYTulMvWFN/UlN4X515F94YpK02sTPUc988L1mc78e4yRXtRSh2KMPW/E0IGYNc4WvEyn+LBuYr6+S7yAJQ//p1N+gERCHzd0sKnCvLROWHTxSO0GzHSFdjAvEKEuF92zWZoMapGcEzMVIIuifCtNy/2zsCur9OB82FvFympc0+a4sqLaHf9psbBLj3/38+ZVgnfHp/rSyjey172NCmghJAs/N+sVMA0Oh9tcrHNi1bUNhP0Hkacg1VCMML0D9dUCqkCmlJqe8ZYSfbjYiubAsboiY3HtVGMrrgQnw4S8HecyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=perex.cz smtp.mailfrom=diasemi.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=diasemi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sLLe4aKx9uY5vx95LS9KGu/ZAh34CYYf6bXCMFpAn0=;
 b=TxLWT7jJ0PmRjvx6yWR0ENAYehWjUkbYlBcusXEeDMgljI2ATOh4vIvKfeFd+hugqU4JEgeWzYWhDlty/sqtKBl51smpStfNS0kAIe64jkzgdmmSXWwKPImQrsc3Y1SbZAznLkuXf7zMCOL2zGYDzw13V+aUktYy/kKoUeodTzQ=
Received: from AM6PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:20b:6e::31)
 by AM5PR1001MB1121.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:12::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Tue, 11 Aug
 2020 16:57:28 +0000
Received: from HE1EUR02FT053.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::76) by AM6PR02CA0018.outlook.office365.com
 (2603:10a6:20b:6e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Tue, 11 Aug 2020 16:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; perex.cz; dkim=none (message not
 signed) header.d=none;perex.cz; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT053.mail.protection.outlook.com (10.152.11.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3261.16 via Frontend Transport; Tue, 11 Aug 2020 16:57:27 +0000
Received: from swsrvapps-01.diasemi.com (10.20.28.141) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 11 Aug 2020 18:57:24 +0200
Received: by swsrvapps-01.diasemi.com (Postfix, from userid 22379)	id
 C87343FBA6; Tue, 11 Aug 2020 17:57:24 +0100 (BST)
Message-ID: <f7603a4855647429b754ce76f887ec441622015c.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
In-Reply-To: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
References: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Date: Tue, 11 Aug 2020 17:57:24 +0100
Subject: [PATCH 2/3] ASoC: da7219: Move soft reset handling to codec level
 probe
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbbe1430-16e2-4d1d-fd68-08d83e17a11d
X-MS-TrafficTypeDiagnostic: AM5PR1001MB1121:
X-Microsoft-Antispam-PRVS: <AM5PR1001MB112183D646B6D0D1BD9FD8B1A7450@AM5PR1001MB1121.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIX+eO2yfD+B2ersWHFpi7Zm2e63MFrZ0EinIEDkuVTI348T1W0dPyG/s8FmgwGd5ZaS6pbUoWc/bxoMdSlztg3gA08c7VDH7GpQN+1WGI9yB9+yqu5AThkuWY0tHOcg7QADRdTJD04+YHRryJos6BN6WI1y2wEQbY+DqEnRM2ZTte9aAAftRvLRitjwHx0clNxatz4xy9U6NI3XEkftePPa54Pe4iZweuCXOEr+O4/EGxiXKvgtGkyyORkDurnNbNQjBHE55rXwfcrc9QV/c8t+p8vUdBCmCK+n7PxZscp2ydbuEHQXwF9DSDq7pdMuxx+M+AyrrwXq6yo3UsLPPge8WCkihAdEOtvDEcI+cKLiayAKa5fQoYv3tuOXZtXdJ8JdOxzveEdwPnAUOwQgC9wIbG2kBoJhhDnTdm1TJ7Rf2xJjS7ZZwJkMnjRkvTq9+z0Yih0VlMXOiWO+L3sbgA==
X-Forefront-Antispam-Report: CIP:193.240.239.45; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailrelay1.diasemi.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(39850400004)(396003)(346002)(46966005)(4326008)(36756003)(336012)(47076004)(82740400003)(30864003)(426003)(33310700002)(81166007)(2906002)(83380400001)(478600001)(82310400002)(356005)(8676002)(8936002)(6266002)(107886003)(70586007)(70206006)(42186006)(186003)(5660300002)(110136005)(36906005)(86362001)(26005)(2616005)(316002)(54906003)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 16:57:27.8443 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbe1430-16e2-4d1d-fd68-08d83e17a11d
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c; Ip=[193.240.239.45];
 Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT053.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1121
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Yong Zhi <yong.zhi@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

As part of the reorganisation of the device level and codec
level probe functionlity, the soft reset handling should really
reside at the codec level and after the instantiation of supplies.
This commit makes the relevant changes to support this change of
scope including the remove of devm_* functions being called for
regulator instantiation at the codec level.

Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
 sound/soc/codecs/da7219.c | 371 +++++++++++++++++++++++-----------------------
 1 file changed, 188 insertions(+), 183 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 82d35bc..0d1c70f8 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1844,19 +1844,19 @@ static int da7219_set_bias_level(struct snd_soc_component *component,
 	[DA7219_SUPPLY_VDDIO] = "VDDIO",
 };
 
-static int da7219_handle_supplies(struct snd_soc_component *component)
+static int da7219_handle_supplies(struct snd_soc_component *component,
+				  u8 *io_voltage_lvl)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	struct regulator *vddio;
-	u8 io_voltage_lvl = DA7219_IO_VOLTAGE_LEVEL_2_5V_3_6V;
 	int i, ret;
 
 	/* Get required supplies */
 	for (i = 0; i < DA7219_NUM_SUPPLIES; ++i)
 		da7219->supplies[i].supply = da7219_supply_names[i];
 
-	ret = devm_regulator_bulk_get(component->dev, DA7219_NUM_SUPPLIES,
-				      da7219->supplies);
+	ret = regulator_bulk_get(component->dev, DA7219_NUM_SUPPLIES,
+				 da7219->supplies);
 	if (ret) {
 		dev_err(component->dev, "Failed to get supplies");
 		return ret;
@@ -1868,21 +1868,18 @@ static int da7219_handle_supplies(struct snd_soc_component *component)
 	if (ret < 1200000)
 		dev_warn(component->dev, "Invalid VDDIO voltage\n");
 	else if (ret < 2800000)
-		io_voltage_lvl = DA7219_IO_VOLTAGE_LEVEL_1_2V_2_8V;
+		*io_voltage_lvl = DA7219_IO_VOLTAGE_LEVEL_1_2V_2_8V;
+	else
+		*io_voltage_lvl = DA7219_IO_VOLTAGE_LEVEL_2_5V_3_6V;
 
 	/* Enable main supplies */
 	ret = regulator_bulk_enable(DA7219_NUM_SUPPLIES, da7219->supplies);
 	if (ret) {
 		dev_err(component->dev, "Failed to enable supplies");
+		regulator_bulk_free(DA7219_NUM_SUPPLIES, da7219->supplies);
 		return ret;
 	}
 
-	/* Ensure device in active mode */
-	snd_soc_component_write(component, DA7219_SYSTEM_ACTIVE, DA7219_SYSTEM_ACTIVE_MASK);
-
-	/* Update IO voltage level range */
-	snd_soc_component_write(component, DA7219_IO_CTRL, io_voltage_lvl);
-
 	return 0;
 }
 
@@ -2248,6 +2245,142 @@ static void da7219_handle_pdata(struct snd_soc_component *component)
 	}
 }
 
+
+/*
+ * Regmap configs
+ */
+
+static struct reg_default da7219_reg_defaults[] = {
+	{ DA7219_MIC_1_SELECT, 0x00 },
+	{ DA7219_CIF_TIMEOUT_CTRL, 0x01 },
+	{ DA7219_SR_24_48, 0x00 },
+	{ DA7219_SR, 0x0A },
+	{ DA7219_CIF_I2C_ADDR_CFG, 0x02 },
+	{ DA7219_PLL_CTRL, 0x10 },
+	{ DA7219_PLL_FRAC_TOP, 0x00 },
+	{ DA7219_PLL_FRAC_BOT, 0x00 },
+	{ DA7219_PLL_INTEGER, 0x20 },
+	{ DA7219_DIG_ROUTING_DAI, 0x10 },
+	{ DA7219_DAI_CLK_MODE, 0x01 },
+	{ DA7219_DAI_CTRL, 0x28 },
+	{ DA7219_DAI_TDM_CTRL, 0x40 },
+	{ DA7219_DIG_ROUTING_DAC, 0x32 },
+	{ DA7219_DAI_OFFSET_LOWER, 0x00 },
+	{ DA7219_DAI_OFFSET_UPPER, 0x00 },
+	{ DA7219_REFERENCES, 0x08 },
+	{ DA7219_MIXIN_L_SELECT, 0x00 },
+	{ DA7219_MIXIN_L_GAIN, 0x03 },
+	{ DA7219_ADC_L_GAIN, 0x6F },
+	{ DA7219_ADC_FILTERS1, 0x80 },
+	{ DA7219_MIC_1_GAIN, 0x01 },
+	{ DA7219_SIDETONE_CTRL, 0x40 },
+	{ DA7219_SIDETONE_GAIN, 0x0E },
+	{ DA7219_DROUTING_ST_OUTFILT_1L, 0x01 },
+	{ DA7219_DROUTING_ST_OUTFILT_1R, 0x02 },
+	{ DA7219_DAC_FILTERS5, 0x00 },
+	{ DA7219_DAC_FILTERS2, 0x88 },
+	{ DA7219_DAC_FILTERS3, 0x88 },
+	{ DA7219_DAC_FILTERS4, 0x08 },
+	{ DA7219_DAC_FILTERS1, 0x80 },
+	{ DA7219_DAC_L_GAIN, 0x6F },
+	{ DA7219_DAC_R_GAIN, 0x6F },
+	{ DA7219_CP_CTRL, 0x20 },
+	{ DA7219_HP_L_GAIN, 0x39 },
+	{ DA7219_HP_R_GAIN, 0x39 },
+	{ DA7219_MIXOUT_L_SELECT, 0x00 },
+	{ DA7219_MIXOUT_R_SELECT, 0x00 },
+	{ DA7219_MICBIAS_CTRL, 0x03 },
+	{ DA7219_MIC_1_CTRL, 0x40 },
+	{ DA7219_MIXIN_L_CTRL, 0x40 },
+	{ DA7219_ADC_L_CTRL, 0x40 },
+	{ DA7219_DAC_L_CTRL, 0x40 },
+	{ DA7219_DAC_R_CTRL, 0x40 },
+	{ DA7219_HP_L_CTRL, 0x40 },
+	{ DA7219_HP_R_CTRL, 0x40 },
+	{ DA7219_MIXOUT_L_CTRL, 0x10 },
+	{ DA7219_MIXOUT_R_CTRL, 0x10 },
+	{ DA7219_CHIP_ID1, 0x23 },
+	{ DA7219_CHIP_ID2, 0x93 },
+	{ DA7219_IO_CTRL, 0x00 },
+	{ DA7219_GAIN_RAMP_CTRL, 0x00 },
+	{ DA7219_PC_COUNT, 0x02 },
+	{ DA7219_CP_VOL_THRESHOLD1, 0x0E },
+	{ DA7219_DIG_CTRL, 0x00 },
+	{ DA7219_ALC_CTRL2, 0x00 },
+	{ DA7219_ALC_CTRL3, 0x00 },
+	{ DA7219_ALC_NOISE, 0x3F },
+	{ DA7219_ALC_TARGET_MIN, 0x3F },
+	{ DA7219_ALC_TARGET_MAX, 0x00 },
+	{ DA7219_ALC_GAIN_LIMITS, 0xFF },
+	{ DA7219_ALC_ANA_GAIN_LIMITS, 0x71 },
+	{ DA7219_ALC_ANTICLIP_CTRL, 0x00 },
+	{ DA7219_ALC_ANTICLIP_LEVEL, 0x00 },
+	{ DA7219_DAC_NG_SETUP_TIME, 0x00 },
+	{ DA7219_DAC_NG_OFF_THRESH, 0x00 },
+	{ DA7219_DAC_NG_ON_THRESH, 0x00 },
+	{ DA7219_DAC_NG_CTRL, 0x00 },
+	{ DA7219_TONE_GEN_CFG1, 0x00 },
+	{ DA7219_TONE_GEN_CFG2, 0x00 },
+	{ DA7219_TONE_GEN_CYCLES, 0x00 },
+	{ DA7219_TONE_GEN_FREQ1_L, 0x55 },
+	{ DA7219_TONE_GEN_FREQ1_U, 0x15 },
+	{ DA7219_TONE_GEN_FREQ2_L, 0x00 },
+	{ DA7219_TONE_GEN_FREQ2_U, 0x40 },
+	{ DA7219_TONE_GEN_ON_PER, 0x02 },
+	{ DA7219_TONE_GEN_OFF_PER, 0x01 },
+	{ DA7219_ACCDET_IRQ_MASK_A, 0x00 },
+	{ DA7219_ACCDET_IRQ_MASK_B, 0x00 },
+	{ DA7219_ACCDET_CONFIG_1, 0xD6 },
+	{ DA7219_ACCDET_CONFIG_2, 0x34 },
+	{ DA7219_ACCDET_CONFIG_3, 0x0A },
+	{ DA7219_ACCDET_CONFIG_4, 0x16 },
+	{ DA7219_ACCDET_CONFIG_5, 0x21 },
+	{ DA7219_ACCDET_CONFIG_6, 0x3E },
+	{ DA7219_ACCDET_CONFIG_7, 0x01 },
+	{ DA7219_SYSTEM_ACTIVE, 0x00 },
+};
+
+static bool da7219_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case DA7219_MIC_1_GAIN_STATUS:
+	case DA7219_MIXIN_L_GAIN_STATUS:
+	case DA7219_ADC_L_GAIN_STATUS:
+	case DA7219_DAC_L_GAIN_STATUS:
+	case DA7219_DAC_R_GAIN_STATUS:
+	case DA7219_HP_L_GAIN_STATUS:
+	case DA7219_HP_R_GAIN_STATUS:
+	case DA7219_CIF_CTRL:
+	case DA7219_PLL_SRM_STS:
+	case DA7219_ALC_CTRL1:
+	case DA7219_SYSTEM_MODES_INPUT:
+	case DA7219_SYSTEM_MODES_OUTPUT:
+	case DA7219_ALC_OFFSET_AUTO_M_L:
+	case DA7219_ALC_OFFSET_AUTO_U_L:
+	case DA7219_TONE_GEN_CFG1:
+	case DA7219_ACCDET_STATUS_A:
+	case DA7219_ACCDET_STATUS_B:
+	case DA7219_ACCDET_IRQ_EVENT_A:
+	case DA7219_ACCDET_IRQ_EVENT_B:
+	case DA7219_ACCDET_CONFIG_8:
+	case DA7219_SYSTEM_STATUS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config da7219_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = DA7219_SYSTEM_ACTIVE,
+	.reg_defaults = da7219_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(da7219_reg_defaults),
+	.volatile_reg = da7219_volatile_register,
+	.cache_type = REGCACHE_RBTREE,
+};
+
 static struct reg_sequence da7219_rev_aa_patch[] = {
 	{ DA7219_REFERENCES, 0x08 },
 };
@@ -2255,18 +2388,56 @@ static void da7219_handle_pdata(struct snd_soc_component *component)
 static int da7219_probe(struct snd_soc_component *component)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	unsigned int rev;
-	int ret;
+	unsigned int system_active, system_status, rev;
+	u8 io_voltage_lvl;
+	int i, ret;
 
 	da7219->component = component;
 	mutex_init(&da7219->ctrl_lock);
 	mutex_init(&da7219->pll_lock);
 
 	/* Regulator configuration */
-	ret = da7219_handle_supplies(component);
+	ret = da7219_handle_supplies(component, &io_voltage_lvl);
 	if (ret)
 		return ret;
 
+	regcache_cache_bypass(da7219->regmap, true);
+
+	/* Disable audio paths if still active from previous start */
+	regmap_read(da7219->regmap, DA7219_SYSTEM_ACTIVE, &system_active);
+	if (system_active) {
+		regmap_write(da7219->regmap, DA7219_GAIN_RAMP_CTRL,
+			     DA7219_GAIN_RAMP_RATE_NOMINAL);
+		regmap_write(da7219->regmap, DA7219_SYSTEM_MODES_INPUT, 0x00);
+		regmap_write(da7219->regmap, DA7219_SYSTEM_MODES_OUTPUT, 0x01);
+
+		for (i = 0; i < DA7219_SYS_STAT_CHECK_RETRIES; ++i) {
+			regmap_read(da7219->regmap, DA7219_SYSTEM_STATUS,
+				    &system_status);
+			if (!system_status)
+				break;
+
+			msleep(DA7219_SYS_STAT_CHECK_DELAY);
+		}
+	}
+
+	/* Soft reset component */
+	regmap_write_bits(da7219->regmap, DA7219_ACCDET_CONFIG_1,
+			  DA7219_ACCDET_EN_MASK, 0);
+	regmap_write_bits(da7219->regmap, DA7219_CIF_CTRL,
+			  DA7219_CIF_REG_SOFT_RESET_MASK,
+			  DA7219_CIF_REG_SOFT_RESET_MASK);
+	regmap_write_bits(da7219->regmap, DA7219_SYSTEM_ACTIVE,
+			  DA7219_SYSTEM_ACTIVE_MASK, 0);
+	regmap_write_bits(da7219->regmap, DA7219_SYSTEM_ACTIVE,
+			  DA7219_SYSTEM_ACTIVE_MASK, 1);
+
+	regcache_cache_bypass(da7219->regmap, false);
+	regmap_reinit_cache(da7219->regmap, &da7219_regmap_config);
+
+	/* Update IO voltage level range based on supply level */
+	snd_soc_component_write(component, DA7219_IO_CTRL, io_voltage_lvl);
+
 	ret = regmap_read(da7219->regmap, DA7219_CHIP_REVISION, &rev);
 	if (ret) {
 		dev_err(component->dev, "Failed to read chip revision: %d\n", ret);
@@ -2347,6 +2518,7 @@ static int da7219_probe(struct snd_soc_component *component)
 
 err_disable_reg:
 	regulator_bulk_disable(DA7219_NUM_SUPPLIES, da7219->supplies);
+	regulator_bulk_free(DA7219_NUM_SUPPLIES, da7219->supplies);
 
 	return ret;
 }
@@ -2369,6 +2541,7 @@ static void da7219_remove(struct snd_soc_component *component)
 
 	/* Supplies */
 	regulator_bulk_disable(DA7219_NUM_SUPPLIES, da7219->supplies);
+	regulator_bulk_free(DA7219_NUM_SUPPLIES, da7219->supplies);
 }
 
 #ifdef CONFIG_PM
@@ -2422,142 +2595,6 @@ static int da7219_resume(struct snd_soc_component *component)
 
 
 /*
- * Regmap configs
- */
-
-static struct reg_default da7219_reg_defaults[] = {
-	{ DA7219_MIC_1_SELECT, 0x00 },
-	{ DA7219_CIF_TIMEOUT_CTRL, 0x01 },
-	{ DA7219_SR_24_48, 0x00 },
-	{ DA7219_SR, 0x0A },
-	{ DA7219_CIF_I2C_ADDR_CFG, 0x02 },
-	{ DA7219_PLL_CTRL, 0x10 },
-	{ DA7219_PLL_FRAC_TOP, 0x00 },
-	{ DA7219_PLL_FRAC_BOT, 0x00 },
-	{ DA7219_PLL_INTEGER, 0x20 },
-	{ DA7219_DIG_ROUTING_DAI, 0x10 },
-	{ DA7219_DAI_CLK_MODE, 0x01 },
-	{ DA7219_DAI_CTRL, 0x28 },
-	{ DA7219_DAI_TDM_CTRL, 0x40 },
-	{ DA7219_DIG_ROUTING_DAC, 0x32 },
-	{ DA7219_DAI_OFFSET_LOWER, 0x00 },
-	{ DA7219_DAI_OFFSET_UPPER, 0x00 },
-	{ DA7219_REFERENCES, 0x08 },
-	{ DA7219_MIXIN_L_SELECT, 0x00 },
-	{ DA7219_MIXIN_L_GAIN, 0x03 },
-	{ DA7219_ADC_L_GAIN, 0x6F },
-	{ DA7219_ADC_FILTERS1, 0x80 },
-	{ DA7219_MIC_1_GAIN, 0x01 },
-	{ DA7219_SIDETONE_CTRL, 0x40 },
-	{ DA7219_SIDETONE_GAIN, 0x0E },
-	{ DA7219_DROUTING_ST_OUTFILT_1L, 0x01 },
-	{ DA7219_DROUTING_ST_OUTFILT_1R, 0x02 },
-	{ DA7219_DAC_FILTERS5, 0x00 },
-	{ DA7219_DAC_FILTERS2, 0x88 },
-	{ DA7219_DAC_FILTERS3, 0x88 },
-	{ DA7219_DAC_FILTERS4, 0x08 },
-	{ DA7219_DAC_FILTERS1, 0x80 },
-	{ DA7219_DAC_L_GAIN, 0x6F },
-	{ DA7219_DAC_R_GAIN, 0x6F },
-	{ DA7219_CP_CTRL, 0x20 },
-	{ DA7219_HP_L_GAIN, 0x39 },
-	{ DA7219_HP_R_GAIN, 0x39 },
-	{ DA7219_MIXOUT_L_SELECT, 0x00 },
-	{ DA7219_MIXOUT_R_SELECT, 0x00 },
-	{ DA7219_MICBIAS_CTRL, 0x03 },
-	{ DA7219_MIC_1_CTRL, 0x40 },
-	{ DA7219_MIXIN_L_CTRL, 0x40 },
-	{ DA7219_ADC_L_CTRL, 0x40 },
-	{ DA7219_DAC_L_CTRL, 0x40 },
-	{ DA7219_DAC_R_CTRL, 0x40 },
-	{ DA7219_HP_L_CTRL, 0x40 },
-	{ DA7219_HP_R_CTRL, 0x40 },
-	{ DA7219_MIXOUT_L_CTRL, 0x10 },
-	{ DA7219_MIXOUT_R_CTRL, 0x10 },
-	{ DA7219_CHIP_ID1, 0x23 },
-	{ DA7219_CHIP_ID2, 0x93 },
-	{ DA7219_IO_CTRL, 0x00 },
-	{ DA7219_GAIN_RAMP_CTRL, 0x00 },
-	{ DA7219_PC_COUNT, 0x02 },
-	{ DA7219_CP_VOL_THRESHOLD1, 0x0E },
-	{ DA7219_DIG_CTRL, 0x00 },
-	{ DA7219_ALC_CTRL2, 0x00 },
-	{ DA7219_ALC_CTRL3, 0x00 },
-	{ DA7219_ALC_NOISE, 0x3F },
-	{ DA7219_ALC_TARGET_MIN, 0x3F },
-	{ DA7219_ALC_TARGET_MAX, 0x00 },
-	{ DA7219_ALC_GAIN_LIMITS, 0xFF },
-	{ DA7219_ALC_ANA_GAIN_LIMITS, 0x71 },
-	{ DA7219_ALC_ANTICLIP_CTRL, 0x00 },
-	{ DA7219_ALC_ANTICLIP_LEVEL, 0x00 },
-	{ DA7219_DAC_NG_SETUP_TIME, 0x00 },
-	{ DA7219_DAC_NG_OFF_THRESH, 0x00 },
-	{ DA7219_DAC_NG_ON_THRESH, 0x00 },
-	{ DA7219_DAC_NG_CTRL, 0x00 },
-	{ DA7219_TONE_GEN_CFG1, 0x00 },
-	{ DA7219_TONE_GEN_CFG2, 0x00 },
-	{ DA7219_TONE_GEN_CYCLES, 0x00 },
-	{ DA7219_TONE_GEN_FREQ1_L, 0x55 },
-	{ DA7219_TONE_GEN_FREQ1_U, 0x15 },
-	{ DA7219_TONE_GEN_FREQ2_L, 0x00 },
-	{ DA7219_TONE_GEN_FREQ2_U, 0x40 },
-	{ DA7219_TONE_GEN_ON_PER, 0x02 },
-	{ DA7219_TONE_GEN_OFF_PER, 0x01 },
-	{ DA7219_ACCDET_IRQ_MASK_A, 0x00 },
-	{ DA7219_ACCDET_IRQ_MASK_B, 0x00 },
-	{ DA7219_ACCDET_CONFIG_1, 0xD6 },
-	{ DA7219_ACCDET_CONFIG_2, 0x34 },
-	{ DA7219_ACCDET_CONFIG_3, 0x0A },
-	{ DA7219_ACCDET_CONFIG_4, 0x16 },
-	{ DA7219_ACCDET_CONFIG_5, 0x21 },
-	{ DA7219_ACCDET_CONFIG_6, 0x3E },
-	{ DA7219_ACCDET_CONFIG_7, 0x01 },
-	{ DA7219_SYSTEM_ACTIVE, 0x00 },
-};
-
-static bool da7219_volatile_register(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case DA7219_MIC_1_GAIN_STATUS:
-	case DA7219_MIXIN_L_GAIN_STATUS:
-	case DA7219_ADC_L_GAIN_STATUS:
-	case DA7219_DAC_L_GAIN_STATUS:
-	case DA7219_DAC_R_GAIN_STATUS:
-	case DA7219_HP_L_GAIN_STATUS:
-	case DA7219_HP_R_GAIN_STATUS:
-	case DA7219_CIF_CTRL:
-	case DA7219_PLL_SRM_STS:
-	case DA7219_ALC_CTRL1:
-	case DA7219_SYSTEM_MODES_INPUT:
-	case DA7219_SYSTEM_MODES_OUTPUT:
-	case DA7219_ALC_OFFSET_AUTO_M_L:
-	case DA7219_ALC_OFFSET_AUTO_U_L:
-	case DA7219_TONE_GEN_CFG1:
-	case DA7219_ACCDET_STATUS_A:
-	case DA7219_ACCDET_STATUS_B:
-	case DA7219_ACCDET_IRQ_EVENT_A:
-	case DA7219_ACCDET_IRQ_EVENT_B:
-	case DA7219_ACCDET_CONFIG_8:
-	case DA7219_SYSTEM_STATUS:
-		return true;
-	default:
-		return false;
-	}
-}
-
-static const struct regmap_config da7219_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = DA7219_SYSTEM_ACTIVE,
-	.reg_defaults = da7219_reg_defaults,
-	.num_reg_defaults = ARRAY_SIZE(da7219_reg_defaults),
-	.volatile_reg = da7219_volatile_register,
-	.cache_type = REGCACHE_RBTREE,
-};
-
-
-/*
  * I2C layer
  */
 
@@ -2566,8 +2603,7 @@ static int da7219_i2c_probe(struct i2c_client *i2c,
 {
 	struct device *dev = &i2c->dev;
 	struct da7219_priv *da7219;
-	unsigned int system_active, system_status;
-	int i, ret;
+	int ret;
 
 	da7219 = devm_kzalloc(dev, sizeof(struct da7219_priv),
 			      GFP_KERNEL);
@@ -2583,37 +2619,6 @@ static int da7219_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
-	regcache_cache_bypass(da7219->regmap, true);
-
-	/* Disable audio paths if still active from previous start */
-	regmap_read(da7219->regmap, DA7219_SYSTEM_ACTIVE, &system_active);
-	if (system_active) {
-		regmap_write(da7219->regmap, DA7219_GAIN_RAMP_CTRL,
-			     DA7219_GAIN_RAMP_RATE_NOMINAL);
-		regmap_write(da7219->regmap, DA7219_SYSTEM_MODES_INPUT, 0x00);
-		regmap_write(da7219->regmap, DA7219_SYSTEM_MODES_OUTPUT, 0x01);
-
-		for (i = 0; i < DA7219_SYS_STAT_CHECK_RETRIES; ++i) {
-			regmap_read(da7219->regmap, DA7219_SYSTEM_STATUS,
-				    &system_status);
-			if (!system_status)
-				break;
-
-			msleep(DA7219_SYS_STAT_CHECK_DELAY);
-		}
-	}
-
-	/* Soft reset component */
-	regmap_write_bits(da7219->regmap, DA7219_ACCDET_CONFIG_1,
-			  DA7219_ACCDET_EN_MASK, 0);
-	regmap_write_bits(da7219->regmap, DA7219_CIF_CTRL,
-			  DA7219_CIF_REG_SOFT_RESET_MASK,
-			  DA7219_CIF_REG_SOFT_RESET_MASK);
-	regmap_write_bits(da7219->regmap, DA7219_SYSTEM_ACTIVE,
-			  DA7219_SYSTEM_ACTIVE_MASK, 0);
-
-	regcache_cache_bypass(da7219->regmap, false);
-
 	/* Retrieve DT/ACPI/Platform data */
 	da7219->pdata = dev_get_platdata(dev);
 	if (!da7219->pdata)
-- 
1.9.1

