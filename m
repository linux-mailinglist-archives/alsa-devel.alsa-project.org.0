Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F38A48B4
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 09:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7219214DE;
	Mon, 15 Apr 2024 09:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7219214DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713164893;
	bh=0lGJraeOnhn2LSfbE4L9G1q3vyowZF0x4ziiuiJ7DgI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YuciLB8rz5lklWF16H6DnZwyKkAeKc3Vat5B5bR6i6LmTFZMp2babO+DkNoyT8AIY
	 X9u7jcZ4fLZeBQfRoYwQ7zkn0Wu9F1/5g5TqTLsaBKj0s759SWumqYuK6DzG9P5/kp
	 Ru0z2IsLYh+QwWgpCamwACg3f16Qu0Bx4zQREax8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA9CEF805E4; Mon, 15 Apr 2024 09:07:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3274EF805CA;
	Mon, 15 Apr 2024 09:07:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28FE4F80494; Mon, 15 Apr 2024 09:07:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDB4BF8025A
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 09:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDB4BF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=Ciowmm2T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSHt72zZIoc9TQhYQMJcZSWAF8YJAxnhYg6P8FH79UVk0wSmnim76vijMcCaHNF6z8Dl/H4rNIHQ7zMOjJ17vcsdHCye65Seb8GgnghJAdjIKciXtrkPT6RqFTpzN/Pa71ihHpu1T9lzr5DUdK1DMbXw3OOUlhC4WXlsMLlRFHqX1LYexeJEpjN+I2OgAZ+sQTO5rvTDs0AMM6aEhRxQqoq/DKOJDDYmvqMJgcCqP0UwPeA/tX6SWjC6EA/9fKQkcipHPrGcyJh4QX6ZqgHLxRS93hsvNfLAUGh7Phu/PUnzkvhNi11CrUUT1/1gLcKHEYYiDZEYmgWM2vY8YcFh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYxW85wyM+TsJ4FqeTwjSl+YqmMB37izNjJ8yOHYDkA=;
 b=eE5HIpkOawFz6J9JF68PEjPxsX8qxikHCjbrAcpGv6NllG1OWheNkEzUTK8HBOFWuOH3JTYvcIbmDfZxLEnZ8RfpmrpZ5DwnYoB+aKu5GfQ6edqUBZu5/Rp5XCXs4T2mD3U0q1TXOVqPpu3XrrtlljkpKgNUvd0LbbZ+5awklFJv87bzUvL7flFIWTCL7nSs4gO9KUBOpHM91hxbLt1AqNoNUKnwmv9AwqdsssyIohW0J300ZlMZp/IuPCKebvxJi6b56fPMNeLtG9kxVYrHytofVIaJFRqNMe2TLjaeVTcDit7ujuri0/mPStNEsExJzoCOWZSPl1n+IeRUA7b9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYxW85wyM+TsJ4FqeTwjSl+YqmMB37izNjJ8yOHYDkA=;
 b=Ciowmm2TeRjZtUwguL0cz7TjYj2hGoTnm4Oy0iBkw9aH3N2UK0amQx8J9zTffSpI6D1FP1UJ6GLm1MfEGHWEZnKeESG+UJ50WsXrud+lxoDKi/SIP+Qg1BI/wdmG71HT9oba7RhH3tXnCxbui1KdKPzUzXXQq7eY8Uvtu1bbkrk=
Received: from SI1PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:1f5::18)
 by SI2PR03MB6485.apcprd03.prod.outlook.com (2603:1096:4:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Mon, 15 Apr
 2024 07:06:57 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:4:1f5:cafe::81) by SI1PR02CA0049.outlook.office365.com
 (2603:1096:4:1f5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Mon, 15 Apr 2024 07:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 15 Apr 2024 07:06:57 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 Apr
 2024 15:06:53 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 15 Apr
 2024 15:06:53 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 Apr 2024 15:06:53 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <edson.drosdeck@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v2 2/3] ASoC: nau8821: Add delay control for ADC
Date: Mon, 15 Apr 2024 15:06:48 +0800
Message-ID: <20240415070649.3496487-3-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415070649.3496487-1-wtli@nuvoton.com>
References: <20240415070649.3496487-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|SI2PR03MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cb4708-8773-4c74-3e90-08dc5d1aa3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kt/djPQpe1N09DnUuhfeNYpGCtOGbywi8iVs83rxjmRfespS+GBiCS5LZgtH?=
 =?us-ascii?Q?lHhSghVk7iMvDVyzrKW3MookP+gQ+U77n+AZtvVklsBVRwpY0GshPmIR6GPj?=
 =?us-ascii?Q?ux2wU00ynLieq1dYP/0aru4gvKUU2XSn5Fzldgv7QtoAla95bllUC75TOVpQ?=
 =?us-ascii?Q?ykMo0F0s9dh3ITTMhwopGmQ9XOUPhk1qvN5UkaeTPkdqbrUkRy8onxflGgUM?=
 =?us-ascii?Q?d8/kTk60+B5jpgF4aDzluVQvbh9P+woUO/XBIKArV6J+0fmnpetQ01CaIFzv?=
 =?us-ascii?Q?vI1rTcZ+sUx3mfZIGEqa76TmNZQOWiZ1UoHhACIT7XGxHLeGqjOhONj3545s?=
 =?us-ascii?Q?+bpvMYIsdkT4I+GGWcB+qgVGi2nwpEnCHQ5qpS6z4kdXZDhHjHc2lrydbyjW?=
 =?us-ascii?Q?cXD8L4YrFC0rO498eOtm0clPKR5YQ73ng2mvySMAF5n32Q9T9rBjIzT28eHB?=
 =?us-ascii?Q?M81lx1YTXrb+eTvSDdffekLZG+1zfWOv+sMVT1qjhqkQwoqs8nk6hL/Z62x8?=
 =?us-ascii?Q?j/L3dOZ6EGh0s1/Xaxo+Oy5hcDaZy91cCas0IUtIMkxV8lr7ImPEI+hETHDv?=
 =?us-ascii?Q?VhUAxOHpW04aoCsY2RwifbkO8zl4ofP/47F9VlcAvtU6S6dgTXd16TsPeLPg?=
 =?us-ascii?Q?Zqx8YkZHBs7Vaz5TFcYI5oqtni3jGf3GvER0QbhUkXu4Q7W9MiYwwT5sWcfp?=
 =?us-ascii?Q?e/b/KeLItXyw9GWDNm1B1bI7ugpDdM2FZElv7z66ncDq7P6KHRWVIpQa7KgA?=
 =?us-ascii?Q?obLuzIv928ig2xFMkQ/hy5MHPnPAj/jPJ5LEKjlrwQv5pgu/AiRgintYMbPG?=
 =?us-ascii?Q?QhFwD1yVJNM4kNd+jZghB2zsJrk+cn/ty93A6KgU1ZUddOJEcqXk8pxqmnh2?=
 =?us-ascii?Q?Apx7yj9iqF1kpMKGkrJGq/0lxNI2zwFPziCfejtYDFgO496FCBaIkEUaOtZ2?=
 =?us-ascii?Q?DSchHLKYiC7MlfK/NkRAVzE9ICYRP324eH+iF4bdWPv1xFZMjvc1HYK3+p5z?=
 =?us-ascii?Q?ywMKsctpdq5bkT4UbW/hfbjBXmIkVn0EprnztIArhktE0xKAdRTxJ0E3Dkk0?=
 =?us-ascii?Q?SPPOsbYIwh16MY7JR0pwseTZBIN4EiWJrW8sEOih4v5WbzYF7Km262A2Q0hO?=
 =?us-ascii?Q?c+RR0QDcLdYBUGBhwT0R0xfGZoja/iIJ8dCIM5qWqh+k/ZVHZ292Q1LW1VFG?=
 =?us-ascii?Q?JjJOcMkm6kOxjiuWqA5gdCfYGodaDcLVbpD9pTHnaGhrPOENGa9N3YqgkpTN?=
 =?us-ascii?Q?B+/gFNJhzWLOOBa+F0Byx2feETJZ20aZoHQARr1fIbvLuAqGBGGvEzIdi0Pw?=
 =?us-ascii?Q?m2j7Gb2q7tig3Zp9cmkmGqC8K15pARvGDtDwcXvBLWs9CuiSpVkCoMasDVF0?=
 =?us-ascii?Q?LOkrmwA=3D?=
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 07:06:57.5413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e0cb4708-8773-4c74-3e90-08dc5d1aa3a6
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6485
Message-ID-Hash: 27FKMSCL5C52RU37AKMJGSCALLLZXSEX
X-Message-ID-Hash: 27FKMSCL5C52RU37AKMJGSCALLLZXSEX
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27FKMSCL5C52RU37AKMJGSCALLLZXSEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the original fixed delay to the assignment from the property.
It will make it more flexible to different platforms to avoid pop
noise at the beginning of recording.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 sound/soc/codecs/nau8821.c | 11 +++++++++--
 sound/soc/codecs/nau8821.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 012e347e6391..fec669e00a10 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -511,7 +511,7 @@ static int nau8821_left_adc_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		msleep(125);
+		msleep(nau8821->adc_delay);
 		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
 			NAU8821_EN_ADCL, NAU8821_EN_ADCL);
 		break;
@@ -535,7 +535,7 @@ static int nau8821_right_adc_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		msleep(125);
+		msleep(nau8821->adc_delay);
 		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
 			NAU8821_EN_ADCR, NAU8821_EN_ADCR);
 		break;
@@ -1697,6 +1697,7 @@ static void nau8821_print_device_properties(struct nau8821 *nau8821)
 	dev_dbg(dev, "dmic-clk-threshold:       %d\n",
 		nau8821->dmic_clk_threshold);
 	dev_dbg(dev, "key_enable:       %d\n", nau8821->key_enable);
+	dev_dbg(dev, "adc-delay-ms:		%d\n", nau8821->adc_delay);
 }
 
 static int nau8821_read_device_properties(struct device *dev,
@@ -1742,6 +1743,12 @@ static int nau8821_read_device_properties(struct device *dev,
 		&nau8821->dmic_slew_rate);
 	if (ret)
 		nau8821->dmic_slew_rate = 0;
+	ret = device_property_read_u32(dev, "nuvoton,adc-delay-ms",
+		&nau8821->adc_delay);
+	if (ret)
+		nau8821->adc_delay = 125;
+	if (nau8821->adc_delay < 125 || nau8821->adc_delay > 500)
+		dev_warn(dev, "Please set the suitable delay time!\n");
 
 	return 0;
 }
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
index 62eaad130b2e..f0935ffafcbe 100644
--- a/sound/soc/codecs/nau8821.h
+++ b/sound/soc/codecs/nau8821.h
@@ -577,6 +577,7 @@ struct nau8821 {
 	int dmic_clk_threshold;
 	int dmic_slew_rate;
 	int key_enable;
+	int adc_delay;
 };
 
 int nau8821_enable_jack_detect(struct snd_soc_component *component,
-- 
2.25.1

