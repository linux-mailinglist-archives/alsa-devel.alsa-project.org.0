Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 937319008A8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 17:24:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 815E17F4;
	Fri,  7 Jun 2024 17:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 815E17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717773842;
	bh=2ETKfb8VK13PTpYLFe3lnJNuwIXowCxaZWOea5Pv7io=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Klwjk26n4AULX/d+x9hGipaQIO0jThEqsoSIypaMJy3HoMoY/fBS2aaJtwaecWOY0
	 sHpYGNBDfjBc45zCnlD7asGeJ+7w92KYMIQKcIw6vzKvp4d2M9Xr4FU76sJhvuTtXK
	 u/2J9uHWRmU4KPbriXBcxshQe52DzwJHdRa6lcLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 493D4F805A9; Fri,  7 Jun 2024 17:23:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2183F805AA;
	Fri,  7 Jun 2024 17:23:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7623F80517; Fri,  7 Jun 2024 17:22:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2607::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60896F8010C
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 17:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60896F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=ZoUkNxqy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoM3MLwhGx2xp64BYekPQYnVsl4qV7mukjG/uozhua5Q1DsZ99Au+y4rCgnN+NwCMaOuLGKMHCyZgm8znWNvyfVSXvj6y64ThBi1MaDKzlBLyt6kGv8KJZFmRmVXQ/OKY7NWuIZMrW0QkynUTKq+VRKv02L01morOylPaz4tJx532Z8fhbfB8IN+ic7TvHcQcsKwUL5TLJPwOP/pYdXvOSMNVPCPpp3G3o7zk+SLi/P2og8d5Yucv7A5Nk2gywoZdbB+14T4fk8jMBxftfEdqdfo7rU/xcNkfS7OwVOaRR6s3YVt3iG3mnDBxirPYfu58cEOXdHUSGNbO4mqmkUQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1ZWXcyDO3jwG8kkAMerrUqvg4yIbozd2NQHtmO25kY=;
 b=KhCB1l5HWZRGbPP3y4bSc2fVR37GNuzepXFL3mF+LiNMW/yE91xohdea6F7UwQdr72CNK8e+qWoizgZoOj0OGoQr0tsG8gFHqVH34xAjc3FE9sh3VMqikiRlDEBbGsiBUnjEDtav8jtbbzyBCrlEfqs7d3jcODeixNekP2xZFkGcmpan7C0o+NeDPJzGnLctBR9QiGiWc84m9e5ZagE0mnH1LlMyTJnLmYRfPkdrcEauy0+s1UcuIXW44GtmIP6/TAes/zCa7e/Bvxva+6qXZz80sND+6iEgquJkkxqVvybY7H190c+fforq2prxS4WV274CbLM8gPP3vJHxuRxZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1ZWXcyDO3jwG8kkAMerrUqvg4yIbozd2NQHtmO25kY=;
 b=ZoUkNxqyXUChs5M6TZfLKck8xTSZKikoRLgook/SMGBRj8Q0rw/jOaOpzHIPaKu8346fIG6IqmkL1WKRmt7MWOgQDGlOyxHNYkzDVerx3Ohyn6S036mQ2ZmSVoOnY6W+Oz1Sg93MiNnGhN4wWASA9Dx73WMZ+DMw2ul9DRAX3MI=
Received: from AS9PR06CA0773.eurprd06.prod.outlook.com (2603:10a6:20b:484::28)
 by AM7PR02MB6273.eurprd02.prod.outlook.com (2603:10a6:20b:1b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 15:22:15 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:484:cafe::58) by AS9PR06CA0773.outlook.office365.com
 (2603:10a6:20b:484::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Fri, 7 Jun 2024 15:22:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 15:22:15 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Jun
 2024 17:22:14 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Jun 2024 17:22:14 +0200
Received: from pc49102-2217.se.axis.com (pc49102-2217.se.axis.com [10.88.7.5])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E0CA334A3;
	Fri,  7 Jun 2024 17:22:14 +0200 (CEST)
Received: by pc49102-2217.se.axis.com (Postfix, from userid 9470)
	id C53B56476FDE; Fri,  7 Jun 2024 17:22:14 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Fri, 7 Jun 2024 17:22:05 +0200
Subject: [PATCH v3 2/2] tlv320adc3xxx: Add support for using MICBIAS pins
 as GPO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240607-tlv320adc3xxx-micbias-gpo-v3-2-59dbec8b98f4@axis.com>
References: <20240607-tlv320adc3xxx-micbias-gpo-v3-0-59dbec8b98f4@axis.com>
In-Reply-To: <20240607-tlv320adc3xxx-micbias-gpo-v3-0-59dbec8b98f4@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ricard Wanderlof
	<ricardw@axis.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Ricard
 Wanderlof" <ricard.wanderlof@axis.com>, <kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|AM7PR02MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4f23c9-4c62-4a6b-1cff-08dc87059caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|7416005|82310400017|1800799015|376005|36860700004|921011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3JpYWhSSmZaTllBWWpHSTlGa2ErZ3RLc3p5SUs3RXliSzhUbmZYVm5pQXNa?=
 =?utf-8?B?clBWTlU4c2QySCtGazBHa01rTkVVZkRXV3VZM0xpUkpKVkdJS0lvU0dMdjEr?=
 =?utf-8?B?UXdydytkREc3Z3ZSN1FFUmxNZ2xLNDVndXdsVExuZVZZak8vYTc4ZDhIek50?=
 =?utf-8?B?NVYyYjM2S3hUckVSTitHUlJTWlNqNklNVTh2bVVDZUFBcmRwbk1vZzVid2sy?=
 =?utf-8?B?NHdGd0FvNVBBMVo0SjRqcnRMazU3UUZ1VDB4d2pYdGxEL2Z6OVpsTURPL0V2?=
 =?utf-8?B?K1lqZHBsL2tQcHk3M0FpMjJuVnh0VFppQlhvNUtoNnlFWEJDc2ZvY0lNV2dq?=
 =?utf-8?B?WGdHK3YyeGxUTndWdzdCWG5FVm9DUEduekdZNVcyRVdiblJKMlVwaGczb3U2?=
 =?utf-8?B?WmdHVzRSWjJmVDZ1OVl5T2VQMW5Cb3pkYVlxMEZNMFlGUmRWczBVMjltNlk2?=
 =?utf-8?B?SlRoMy9lT1NYVmpNRlRQeVJZZ0UxYkM5Q1ZVblRyZUpQZm50MzUya09ROGRB?=
 =?utf-8?B?NllNVkFaNmtaeC9IYTh3WWZFNmI0L2hMTWlIMzl3NC9QdjVEaEc5T2p3c2E2?=
 =?utf-8?B?bldGTkNTYkVuNkVFTlZBUngvVHJ4Mks5dU1IdHB2YWR0SmNJeHlmWG1WVWxl?=
 =?utf-8?B?VEE2Ty9aZ1hwZjhUcFRpUm9XblpmNnVHYmtKcmRJV2JuQkRQNUl0VFlSRjN0?=
 =?utf-8?B?K0RNd3cyMzFiVHpOQ01iekpTWFRicVBGNkhid3FTcE1QTVlLYWFiTE81Ynor?=
 =?utf-8?B?bGpEWm5VamVXOTdPRnMyM01kcEpUN3hzSHhPcWxLRWhGMW9WYkN5Q0Z3TEFr?=
 =?utf-8?B?WjhKNVkzRHdtM1VtZDVsaTlrR0lnU2hQUTFUc3pZMjZmQURGV2gwUHhFc3hB?=
 =?utf-8?B?bXpnenpNL3RSd01qaXh3RUw3TUVFTG1JclNNNzBlSjE3R0ozQThQNHBaK0Zw?=
 =?utf-8?B?REdDRFpoaFR1QUdIKzNvSHVuRkJOTk1TSm54M2hEWTRybkpqOWxGTXlCQ1NV?=
 =?utf-8?B?ZHVObEs2ektaVStmQ28wY1pRcGNBZmZUWFpRZzdNOHo5Skp1OUpxTDJVVmVI?=
 =?utf-8?B?Tmt2TnlZL2pvbnlNQkFKM1ZXWllrWWNZM3BPZnJYdVYwKy8rYXdlNWVlY1BN?=
 =?utf-8?B?WTExZUZkR3RrNUlVT0pINVR2eUovKzVEYnNEVEl1SmN1aEFMK1U0RE9GSHg4?=
 =?utf-8?B?SXAzYWJ2MWJvUEtLdkNaRFhKSUF1cDIrV1hzWDdYTnpTTWd3WGdOZWpLU2VH?=
 =?utf-8?B?V0xQN1R1UHVmVGUwMUd6N2dVQTRHWWpRWk5PU29tNGdHTVBJUmRWWllTa2Nw?=
 =?utf-8?B?YnAyWkxONDdqcm9OUXFnMmc4N2JuUzdiS1ptQzZvazJTaUNWUVhENTBpbnFz?=
 =?utf-8?B?WGRUY2dsajJ2OUJuREhqS0h1UmF1QkV1bFY3WTV5TUlUT29KMU1Bc1JFWnZR?=
 =?utf-8?B?Uzd0ZEVrNXZaekVnQjgwZmRXSy9TaWF2YkE5RGp0VjBhd1BkUGpHTHJzU1k4?=
 =?utf-8?B?SEdJbVNObVFHdFpIdkFRVnM0Zk00ZEZjQTQweCtXNjdlUFkxZW0zQkJYeWhB?=
 =?utf-8?B?MVl1MmZSMzVFYmcxM2JGVWxZbWlKYWlqckFDRGJ1ajRVZkJobThST0owK1h0?=
 =?utf-8?B?SGg5S2lMTENaRkRhT0QwVXNjQzV5K2FDNE9SMkUzTnFPYk5hWmJBOFJ1V2FW?=
 =?utf-8?B?c093K3h2MTQ1d3JueERjdXdkWStVMjFDTFQ5akxOTjNGdnF4dDdEWnFTNGpD?=
 =?utf-8?B?UTFJNHhET1dBQ3o2ZUowNFFGYVNISlRJQ2Rzd3JDT0c0SGFhWnBQZ1ZrQi93?=
 =?utf-8?B?TGsza3N0UGFyQlFMbUFsZFVKTDF1U0FuL0J2WU1IQ0F5UnVpOXVCS1h0Wk4x?=
 =?utf-8?B?MnRaOFF6d3FOWmpRak5BS1VwOUdDSXpkbExERkEvWlVqemJZcTJPQXlpRVhY?=
 =?utf-8?Q?0kTyxmZZ8Fo=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(82310400017)(1800799015)(376005)(36860700004)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 15:22:15.2607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f4f23c9-4c62-4a6b-1cff-08dc87059caf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6273
Message-ID-Hash: Z3GB4XFB2H6NV62JPQ2V5MHKI3SMSSRY
X-Message-ID-Hash: Z3GB4XFB2H6NV62JPQ2V5MHKI3SMSSRY
X-MailFrom: Ricard.Wanderlof@axis.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3GB4XFB2H6NV62JPQ2V5MHKI3SMSSRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add boolean ti,micbias1-gpo and ti,micbias2-gpo devicetree properties.

When set, the respective MICBIAS pins can be used as general purpose
outputs controlled via the GPIO framework, in addition to the two
configurable GPIO pins.

This is useful in applications where the MICBIAS functionality is
not required, but it is useful to have a couple of extra GPIO pins.

The voltage on the respective MICBIAS pin in the active state is
governed by the ti,micbias1-vg and ti,micbias2-vg properties,
respectively (same properties as when the pins are used as
MICBIAS pins).

Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 105 +++++++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index e100cc9f5c19..182955bccebc 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -40,9 +40,10 @@
  */
 
 #define ADC3XXX_MICBIAS_PINS		2
+#define ADC3XXX_GPIO_PINS		2
 
 /* Number of GPIO pins exposed via the gpiolib interface */
-#define ADC3XXX_GPIOS_MAX		2
+#define ADC3XXX_GPIOS_MAX		(ADC3XXX_MICBIAS_PINS + ADC3XXX_GPIO_PINS)
 
 #define ADC3XXX_RATES		SNDRV_PCM_RATE_8000_96000
 #define ADC3XXX_FORMATS		(SNDRV_PCM_FMTBIT_S16_LE | \
@@ -321,7 +322,8 @@ struct adc3xxx {
 	struct gpio_desc *rst_pin;
 	unsigned int pll_mode;
 	unsigned int sysclk;
-	unsigned int gpio_cfg[ADC3XXX_GPIOS_MAX]; /* value+1 (0 => not set)  */
+	unsigned int gpio_cfg[ADC3XXX_GPIO_PINS]; /* value+1 (0 => not set)  */
+	unsigned int micbias_gpo[ADC3XXX_MICBIAS_PINS]; /* 1 => pin is GPO */
 	unsigned int micbias_vg[ADC3XXX_MICBIAS_PINS];
 	int master;
 	u8 page_no;
@@ -329,7 +331,7 @@ struct adc3xxx {
 	struct gpio_chip gpio_chip;
 };
 
-static const unsigned int adc3xxx_gpio_ctrl_reg[ADC3XXX_GPIOS_MAX] = {
+static const unsigned int adc3xxx_gpio_ctrl_reg[ADC3XXX_GPIO_PINS] = {
 	ADC3XXX_GPIO1_CTRL,
 	ADC3XXX_GPIO2_CTRL
 };
@@ -960,14 +962,23 @@ static int adc3xxx_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= ADC3XXX_GPIOS_MAX)
 		return -EINVAL;
 
-	/* GPIO1 is offset 0, GPIO2 is offset 1 */
-	/* We check here that the GPIO pins are either not configured in the
-	 * DT, or that they purposely are set as outputs.
-	 * (Input mode not yet implemented).
-	 */
-	if (adc3xxx->gpio_cfg[offset] != 0 &&
-	    adc3xxx->gpio_cfg[offset] != ADC3XXX_GPIO_GPO + 1)
-		return -EINVAL;
+	if (offset >= 0 && offset < ADC3XXX_GPIO_PINS) {
+		/* GPIO1 is offset 0, GPIO2 is offset 1 */
+		/* We check here that the GPIO pins are either not configured
+		 * in the DT, or that they purposely are set as outputs.
+		 * (Input mode not yet implemented).
+		 */
+		if (adc3xxx->gpio_cfg[offset] != 0 &&
+		    adc3xxx->gpio_cfg[offset] != ADC3XXX_GPIO_GPO + 1)
+			return -EINVAL;
+	} else if (offset >= ADC3XXX_GPIO_PINS && offset < ADC3XXX_GPIOS_MAX) {
+		/* MICBIAS1 is offset 2, MICBIAS2 is offset 3 */
+		/* We check here if the MICBIAS pins are in fact configured
+		 * as GPOs.
+		 */
+		if (!adc3xxx->micbias_gpo[offset - ADC3XXX_GPIO_PINS])
+			return -EINVAL;
+	}
 
 	return 0;
 }
@@ -977,6 +988,21 @@ static int adc3xxx_gpio_direction_out(struct gpio_chip *chip,
 {
 	struct adc3xxx *adc3xxx = gpiochip_get_data(chip);
 
+	/* For the MICBIAS pins, they are by definition outputs. */
+	if (offset >= ADC3XXX_GPIO_PINS) {
+		unsigned int vg;
+		unsigned int micbias = offset - ADC3XXX_GPIO_PINS;
+
+		if (value)
+			vg = adc3xxx->micbias_vg[micbias];
+		else
+			vg = ADC3XXX_MICBIAS_OFF;
+		return regmap_update_bits(adc3xxx->regmap,
+					   ADC3XXX_MICBIAS_CTRL,
+					   ADC3XXX_MICBIAS_MASK << adc3xxx_micbias_shift[micbias],
+					   vg << adc3xxx_micbias_shift[micbias]);
+	}
+
 	/* Set GPIO output function. */
 	return regmap_update_bits(adc3xxx->regmap,
 				  adc3xxx_gpio_ctrl_reg[offset],
@@ -1005,9 +1031,17 @@ static int adc3xxx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	unsigned int regval;
 	int ret;
 
-	/* We only allow output pins, so just read the value set in the output
-	 * pin register field.
-	 */
+	/* We only allow output pins, so just read the value prevously set. */
+	if (offset >= ADC3XXX_GPIO_PINS) {
+		/* MICBIAS pins */
+		unsigned int micbias = offset - ADC3XXX_GPIO_PINS;
+
+		ret = regmap_read(adc3xxx->regmap, ADC3XXX_MICBIAS_CTRL, &regval);
+		if (ret)
+			return ret;
+		return ((regval >> adc3xxx_micbias_shift[micbias]) & ADC3XXX_MICBIAS_MASK) !=
+		       ADC3XXX_MICBIAS_OFF;
+	}
 	ret = regmap_read(adc3xxx->regmap, adc3xxx_gpio_ctrl_reg[offset], &regval);
 	if (ret)
 		return ret;
@@ -1049,7 +1083,7 @@ static void adc3xxx_init_gpio(struct adc3xxx *adc3xxx)
 	 * This allows us to set up things which are not software
 	 * controllable GPIOs, such as PDM microphone I/O,
 	 */
-	for (gpio = 0; gpio < ADC3XXX_GPIOS_MAX; gpio++) {
+	for (gpio = 0; gpio < ADC3XXX_GPIO_PINS; gpio++) {
 		unsigned int cfg = adc3xxx->gpio_cfg[gpio];
 
 		if (cfg) {
@@ -1061,9 +1095,15 @@ static void adc3xxx_init_gpio(struct adc3xxx *adc3xxx)
 		}
 	}
 
-	/* Set up micbias voltage */
+	/* Set up micbias voltage. */
+	/* If pin is configured as GPO, set off initially. */
 	for (micbias = 0; micbias < ADC3XXX_MICBIAS_PINS; micbias++) {
-		unsigned int vg = adc3xxx->micbias_vg[micbias];
+		unsigned int vg;
+
+		if (adc3xxx->micbias_gpo[micbias])
+			vg = ADC3XXX_MICBIAS_OFF;
+		else
+			vg = adc3xxx->micbias_vg[micbias];
 
 		regmap_update_bits(adc3xxx->regmap,
 				   ADC3XXX_MICBIAS_CTRL,
@@ -1091,8 +1131,19 @@ static int adc3xxx_parse_dt_gpio(struct adc3xxx *adc3xxx,
 	return 0;
 }
 
-static int adc3xxx_parse_dt_micbias(struct adc3xxx *adc3xxx,
-				    const char *propname, unsigned int *vg)
+static int adc3xxx_parse_dt_micbias_gpo(struct adc3xxx *adc3xxx,
+					const char *propname,
+					unsigned int *cfg)
+{
+	struct device *dev = adc3xxx->dev;
+	struct device_node *np = dev->of_node;
+
+	*cfg = of_property_read_bool(np, propname);
+	return 0;
+}
+
+static int adc3xxx_parse_dt_micbias_vg(struct adc3xxx *adc3xxx,
+				       const char *propname, unsigned int *vg)
 {
 	struct device *dev = adc3xxx->dev;
 	struct device_node *np = dev->of_node;
@@ -1383,16 +1434,28 @@ static int adc3xxx_i2c_probe(struct i2c_client *i2c)
 		dev_dbg(dev, "Enabled MCLK, freq %lu Hz\n", clk_get_rate(adc3xxx->mclk));
 	}
 
+	/* Configure mode for DMDIN/GPIO1 pin */
 	ret = adc3xxx_parse_dt_gpio(adc3xxx, "ti,dmdin-gpio1", &adc3xxx->gpio_cfg[0]);
 	if (ret < 0)
 		goto err_unprepare_mclk;
+	/* Configure mode for DMCLK/GPIO2 pin */
 	ret = adc3xxx_parse_dt_gpio(adc3xxx, "ti,dmclk-gpio2", &adc3xxx->gpio_cfg[1]);
 	if (ret < 0)
 		goto err_unprepare_mclk;
-	ret = adc3xxx_parse_dt_micbias(adc3xxx, "ti,micbias1-vg", &adc3xxx->micbias_vg[0]);
+	/* Configure mode for MICBIAS1: as Mic Bias output or GPO */
+	ret = adc3xxx_parse_dt_micbias_gpo(adc3xxx, "ti,micbias1-gpo", &adc3xxx->micbias_gpo[0]);
+	if (ret < 0)
+		goto err_unprepare_mclk;
+	/* Configure mode for MICBIAS2: as Mic Bias output or GPO */
+	ret = adc3xxx_parse_dt_micbias_gpo(adc3xxx, "ti,micbias2-gpo", &adc3xxx->micbias_gpo[1]);
+	if (ret < 0)
+		goto err_unprepare_mclk;
+	/* Configure voltage for MICBIAS1 pin (ON voltage when used as GPO) */
+	ret = adc3xxx_parse_dt_micbias_vg(adc3xxx, "ti,micbias1-vg", &adc3xxx->micbias_vg[0]);
 	if (ret < 0)
 		goto err_unprepare_mclk;
-	ret = adc3xxx_parse_dt_micbias(adc3xxx, "ti,micbias2-vg", &adc3xxx->micbias_vg[1]);
+	/* Configure voltage for MICBIAS2 pin (ON voltage when used as GPO) */
+	ret = adc3xxx_parse_dt_micbias_vg(adc3xxx, "ti,micbias2-vg", &adc3xxx->micbias_vg[1]);
 	if (ret < 0)
 		goto err_unprepare_mclk;
 

-- 
2.30.2

