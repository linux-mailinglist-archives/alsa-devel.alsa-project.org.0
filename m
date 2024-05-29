Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF978D3CCC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 18:35:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C239DF8;
	Wed, 29 May 2024 18:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C239DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717000523;
	bh=2ETKfb8VK13PTpYLFe3lnJNuwIXowCxaZWOea5Pv7io=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y/h66hMBhU8n600tGnFTvTc3q5rhRaii+9+0bYhFkC+ULCl7rLUCApmIcMEXSnUN6
	 HTHSBE3klKJ9GDUodQCKiG9SklvxAlEGZxO4Lsrp8aBSXgMeCanNabNCDKxqlbaoZX
	 y28cD519+VzF8rrm+JZXQUD4wrkmVBQL2OuxSxmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4313F805F2; Wed, 29 May 2024 18:34:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF43BF805F0;
	Wed, 29 May 2024 18:34:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61B1CF805CB; Wed, 29 May 2024 18:34:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260f::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56C8AF8003A
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 18:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C8AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=MZPxxetz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HP8ZRptf0CjccotXtNsRPR4rwlxs28sDeA0U0RQ1Bmx0SNO+RALjQkdda+as67/RuBMC/4OL6FRtZIowDwI5E9DSv8428NnDTdEx544loh4siiBmmiw4NRW9FN4cfWgoj552ob3T2Dz7l3p27mZF9ECyPBeY8m78p+T901dN4S3GCuKxfLuqYlQruPv+dp2z0+n8sFQh/UjqXdNO+dYaCYMo5ROaHJ7sjhLwv/dKJwqPgg0kuNAtC2MuIg1A5/+wyBMyBChQBJ2K5R7ugWYVqRSiEwtxJ3YrCW68kUrOclkvv8vkSqk18jSTbdUWayP3MlhudZHcZinFkmXbZkA0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1ZWXcyDO3jwG8kkAMerrUqvg4yIbozd2NQHtmO25kY=;
 b=CdPYBlMvcUC4mtd2P2eoSeqZWOjHV6z6ghAmOYuIBF3S8aa3wqKMvQMU9anR/AGBcWFxPXfxC0B2EgcnE3f845cQPbZPvuEVMuAyEb//qQf9vkE7hOCwiDjoEECVtV4wr0JqJFmC9GSLMux1jkgLPh7d+z+nQClP5vmlOmIwvEC+IUis/CUuDuErYSEbU3YnFYEtGNp+1qw+C6sp1hKtmoFD3Ju5wuFOqa9f1qRVx5dB/zvt5HEChi+2WpylEYPQ3oAhpZJxfoxHUroK3i++PLrWk0RDzyx0iwdfU8PNzQ62l4JWzuy77bmtLMYa59XPPy0tnyPAW0xmeP9yeXIxkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1ZWXcyDO3jwG8kkAMerrUqvg4yIbozd2NQHtmO25kY=;
 b=MZPxxetzfrwYfBA1h8efOJM/lL+UIFIjLahKm12uUPJ5IZfH1H5jjtoyu5Si77moZAUqJOtsV6yUzOLp77XZlTRnqLCLXOja0XCDsULd3if5i9HXcL4H+ah1Vc+qfgGfSi/Sqep737oLcNjM+3P1ijIzBpGnUzCgxIBjeaZ3CAA=
Received: from DU6P191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::18)
 by PR3PR02MB6313.eurprd02.prod.outlook.com (2603:10a6:102:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 16:33:57 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::c7) by DU6P191CA0042.outlook.office365.com
 (2603:10a6:10:53f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19 via Frontend
 Transport; Wed, 29 May 2024 16:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Wed, 29 May 2024 16:33:56 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 May
 2024 18:33:56 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 29 May 2024 18:33:56 +0200
Received: from pc49102-2217.se.axis.com (pc49102-2217.se.axis.com [10.88.7.5])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 38DA02325;
	Wed, 29 May 2024 18:33:56 +0200 (CEST)
Received: by pc49102-2217.se.axis.com (Postfix, from userid 9470)
	id 3434A63F27EB; Wed, 29 May 2024 18:33:56 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 29 May 2024 18:33:45 +0200
Subject: [PATCH 2/2] tlv320adc3xxx: Add support for using MICBIAS pins as
 GPO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240529-tlv320adc3xxx-micbias-gpo-v1-2-300d39cecc55@axis.com>
References: <20240529-tlv320adc3xxx-micbias-gpo-v1-0-300d39cecc55@axis.com>
In-Reply-To: <20240529-tlv320adc3xxx-micbias-gpo-v1-0-300d39cecc55@axis.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C1:EE_|PR3PR02MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: e7651bc9-25aa-4dfb-322e-08dc7ffd22e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015|7416005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFBlTHlWbW03MXYvSkpZcjBVcW8xT21rc2FXenZjQ1M1STVCZmlhbFhyLy8y?=
 =?utf-8?B?WlozNmVNazdSSnI3YURDRWUzQ09vUStNOXkxdzdsYyt4YnkzaVRJcDRiZnJw?=
 =?utf-8?B?NHEyeGVxUHpPMW54OC9ONldOZEoyZjdCU3Q4NS83a2xhd0h6ekhqTUVNdkh3?=
 =?utf-8?B?UmhnVnNPd3VkeFZEaHB2ZGlacTljSGdvKy8zY0orcHlrWU05OUk0K0lrUC85?=
 =?utf-8?B?ajZJUnVkRTVGWnQ4YXlTN29vemRYY0F6UjIxajltREVpR1JNeWdRSVNYbU9D?=
 =?utf-8?B?M3g2aG55YU05UDdLWnc3TkhseG9CSlJqUDNlNFpMa2VSaU1zVXF5c1o0cmYz?=
 =?utf-8?B?R29nVWVOb1ZrZGc4MG5pbXZTaGpocjBwRGwybGxJWDhpK3hJRVRzV1l1cEJJ?=
 =?utf-8?B?bE1VaitJSlhxQW8vcE1nNys0RWdzWklBemhHbDdkTExMM0hXVEdDMGlLdkVB?=
 =?utf-8?B?bHEwb2JJSUZnM0h1K2JlejhSSk51eWtic0Zic0ZiR2ZwMnRxa1d2ZkNaeDNL?=
 =?utf-8?B?ZXNOSUNlckhSTTl3NzhtVzlVV3lFbHBLZDB6MHpEZDZzYS92WEFDZHV6aHhp?=
 =?utf-8?B?VUowMWN0ZWhhQkVjN25aUzJLSlB2WGRvYmwwT2hUcGxCMkFCbldWL3JmTDVh?=
 =?utf-8?B?blF6TGlnUTJqL0JOYmhieDNOMWRncHJFYTVscjJiTWJ3cngwY0NuL1VWeGls?=
 =?utf-8?B?MFp5bU8rN0FXWUVieTJnMEZMNkRPUEpPOFlzcC93VHA1ZEdWOC9BWndQa2lr?=
 =?utf-8?B?Umtrclh5ZFJ5blU1Q1E0TjZGM1o2UFgvZnVGaWVwV05jaXJCV3FleDVhRld0?=
 =?utf-8?B?eG9zNVZtcTdpSkMwSGkxakY5U2lYZGVobERnM0Rsam5FaFR3WHZodWd4K3JK?=
 =?utf-8?B?Q2RUZ1pmeWRVUnFDOWhIMHNIamdPTFV0bXF1dzhEeGFPYy9GNTkxZG9mNkts?=
 =?utf-8?B?STRkZkRLa21uYnB0UVp3VTN4WkpRR2Jhb3hITGlGVWdlcHdzeHJkWUgyRHZm?=
 =?utf-8?B?SWx6WFM0S25kaFpieG0rTG9nUHFySFVscWRzeXJidFlHTHVrNE1hTUdiV2FI?=
 =?utf-8?B?OHREZnVtdVVEcUw5WUcrZkZUaGROYjQ0THdxS1JUVG5SKzVnbkFKaEJLN1JT?=
 =?utf-8?B?RVRYSFZua090ZlVSSFpoWG1PSzc5dGc1clJXK2VQUnlYUVJkbVFXSUxvcHBV?=
 =?utf-8?B?akJTeE15WGZ4RHJjdndpOW1EWG5hb3BBdmJ4QTVBZi85cjJHVEpUbUVRVTZM?=
 =?utf-8?B?VmFnTXVMNXFXSzFvY3VDZjZrN0ozcWt4NjZDN3l2ekQ3Zm5mMjFTQ3RMdHVx?=
 =?utf-8?B?VDVOdnBLTkptZlJ5NmhqNDcxeFVmV2M0QWt4UHludm5XazVRMXByOVQxVnd3?=
 =?utf-8?B?UzRwdmN1ODZDN2t5dmNuQUR3MVo0Wmk1ME9lT2JDYlZXYlNFL0NYZlhYWk9w?=
 =?utf-8?B?ZGJzK3pjU1RLeC9VMy83akduMHEzTXVFc3llU3dod1BZTjFNbkZuSzZ6Umx2?=
 =?utf-8?B?QkdXT3ZuQ2NScXJvTk81UlVjL05nY1dzQW54OFpxZ3Vhd3RSbWlUay9Pd0Ni?=
 =?utf-8?B?YTZmVjNEa0JVVU03Tk9KZHJ2Umplb0tLbVFudG54ZGdiOGZhMGQ0YVBkV3Zu?=
 =?utf-8?B?c0NuTUo5ZmtNMFU4eGlmNVhBdVRvVWErTXBwZWw0a3hyN0dtd2NMN0pYV29s?=
 =?utf-8?B?R1E4VmlEcUE1UlM2Z0dFckxnRzZIaWw0VW1lSXFiYUdMbkNxd2k4WHVnb1R5?=
 =?utf-8?B?T2IzL0EzWGtLZWNHaWJVY1ljdm5IVWhvVDNNVCsyeHBKMGpEeG9ZeWo2aE5h?=
 =?utf-8?B?bU9Pc2F4eXROQkQ4eWZWZHJLQ1RrL0trV2FTWkh2dkZUOXhmd3VYLzBxOWFY?=
 =?utf-8?Q?DTggcy7tL5Sb+?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015)(7416005)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 16:33:56.7885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e7651bc9-25aa-4dfb-322e-08dc7ffd22e5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6313
Message-ID-Hash: B3DUIHTIQQMHFNTFLNHTIR7LOPCZD627
X-Message-ID-Hash: B3DUIHTIQQMHFNTFLNHTIR7LOPCZD627
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3DUIHTIQQMHFNTFLNHTIR7LOPCZD627/>
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

