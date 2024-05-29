Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAB98D3CBB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 18:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC02DF6;
	Wed, 29 May 2024 18:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC02DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717000507;
	bh=3EDTejQBK8ZSb8KFoFK8hFhKx09BsYjN+k8vp/f4ouE=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qU/iLkGHcT0MVNnWqJHvdPL5o9Aziz9Rxe/nnpzbH8rjBeQMuI9gY5p4xNornZ8IC
	 kXiIskN5Cwt8Xpb3NnU6TRsabODNYf1BaDXPduuw32v+hf7eCcSKL9NfpFJWLtMx92
	 nEXrAfYoogqNK7hYzb/P0h7GcPrCjIT9D9Pdy6og=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94D67F805AA; Wed, 29 May 2024 18:34:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C72CF805C6;
	Wed, 29 May 2024 18:34:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75AD1F8026D; Wed, 29 May 2024 18:34:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2606::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C1D4F80149
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 18:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C1D4F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=KvQBm+m3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pjm4ZdWVUu5zIAlE47DW3uOnzkDKgCI6b62nRA3JiYGDkOb93tsWgndtGQLNLVEZj9dcXjRrVRIFMI9xmMAU8h1QWvjX8YGY1OuVMcdpEmpoCk+fTBtYqbq1LsF9J2HOW6Y8Qr0fgy6KveGnTwxgcSvx67gmrDzt59hjFXEKz0POIoxApMXsd5+HkligGRffRgqPMMonJ9fkb7VrcgwoBbUWxQ9Jyfamdq3k+SbAgq4Q8lf6lAJvHPQ3Tcrbxre8BbVAUQCMSHi6VJM8c1BQkQu4R2STUHC3Wi25QLQJpq1qpY70KMfPq+Xzs8X7tv01LfwHV+hMT37jcJMJSVqkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4dwp47QF2kvHWQZYXvYXXkdSImV0logEUIG5VxBoM8=;
 b=AvY3r7QT2yGloBY81Lhb5FqeVL2CJcfFXnsfvEfZvXH1qLXsfwbbo1O30DHGFSCPSRRdTJMKPTOhbG5mHxSkAYI1ewKMIan1+PY81B9CqfSDRwQHJrW8wofaMu0BywkZtZ/ktNzrNKYnj2gECqfgx3D2MGT7EG9tLrVkV4BdyJlHoJBwEtE8D+8uU8cS0RpcJsqNTkaBhIQ+ro56QgNqL2RaieXlEkwym7oy1/Uf900YG/G3O+aYiLInRJQN3RGCnDZWHmG43e9olV3ZxZgCgCqWh3IFbG/Gq8wuBtn7k/11USoqhVI+Bu4naB21tR/V/tu2Dy8ALmEhIsBMixhfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4dwp47QF2kvHWQZYXvYXXkdSImV0logEUIG5VxBoM8=;
 b=KvQBm+m3G5yjZJEWfwUSca9mVeUErOpTNOU3PfD2CS71E9P92f0rUa/3s+icDkFIB+1Fh7th9e+AnkuWEOFlSB8Zyur6CtRvuiQ3HElFl38BS0FqL769xIPBjp/yR761q2T06fl9tDD221lHfF7nQaefxZo5RD663mhGAdbrnVs=
Received: from AM0PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:208:122::36)
 by DU2PR02MB10159.eurprd02.prod.outlook.com (2603:10a6:10:491::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 16:33:57 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:208:122:cafe::e3) by AM0PR04CA0023.outlook.office365.com
 (2603:10a6:208:122::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Wed, 29 May 2024 16:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Wed, 29 May 2024 16:33:57 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 May
 2024 18:33:56 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 29 May
 2024 18:33:56 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 29 May 2024 18:33:56 +0200
Received: from pc49102-2217.se.axis.com (pc49102-2217.se.axis.com [10.88.7.5])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 353C5583;
	Wed, 29 May 2024 18:33:56 +0200 (CEST)
Received: by pc49102-2217.se.axis.com (Postfix, from userid 9470)
	id 30965666EA08; Wed, 29 May 2024 18:33:56 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: [PATCH 0/2] tlv320adc3xxx: Allow MICBIAS pins to be used as GPOs
Date: Wed, 29 May 2024 18:33:43 +0200
Message-ID: <20240529-tlv320adc3xxx-micbias-gpo-v1-0-300d39cecc55@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOdYV2YC/x3MywqAIBBA0V+JWTdgaiH9SrTwMdVALzRCiP49a
 XkW9z6QKDIl6KsHIt2c+NgLmroCv9h9JuRQDFJILVpp8FpvJYUNXuWccWPv2CaczwOdcTo03ug
 uKCj9GWni/L+H8X0/Oes+NmsAAAA=
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
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|DU2PR02MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: 12169276-c0dc-4f41-365f-08dc7ffd2365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015|7416005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RWJTQnlWTTVBZmFiZVhZWmRMSzJYUGJ2Vmo5YVROY2E1YnNzYmNvakJpK0tp?=
 =?utf-8?B?dC9jMkZ5MFVVZjh0NXFtbVVsNFVISUFSWUNEZFgra3dBTVNTTmx3aU5hb1or?=
 =?utf-8?B?RTRib0F0NU1qQnkzQWl3ZUx5NXhRVThnWEJqdXUrVVFCV3hNeG02dnlzMXh3?=
 =?utf-8?B?bVVPeWhGNVpCV2NxSDBGV3VqN0VrRlVLc3lMS2UxUVlUaEJiblhzRzUyTGdj?=
 =?utf-8?B?NmNDUUhMTldWRURncGdJQmxaYitFWW1iMnlWamxzaTkvbzhhOXc4UjUwVCtW?=
 =?utf-8?B?c1Z3L2RYRWpVUm1reDFSeWVpUFJrczJpNVMwT3FINmhoNU02Uk9idVhaY1Vn?=
 =?utf-8?B?U3RWZ1JxaWJzbjN0cm5wZlg5M1MxRWdIZ2MxZExQdUFSbG1HT2oxM2x0Ukcw?=
 =?utf-8?B?M1hMZHQ5TzlnQk9GaXlkL1JUNHVKK2FkK2FVTWRyRkRIZlpuc0VsMUtuaHBM?=
 =?utf-8?B?TnNNZktNK2dJZlFZalEvM1MxZnZ4L055NDR5bStVT2ZsUnNGWXpWZUEzNk1M?=
 =?utf-8?B?d1BmdFoxeWErS0V0Y0JrdzFaUHZXZzQ4YW9BbWQ1Rm5KZ3BJYTJlTHROMEp0?=
 =?utf-8?B?bEh5YTlJVFZTVk42L0pWbFRMTmpoczYxTkJtaWtWd1pwSDhPSjIrL2U4Q2la?=
 =?utf-8?B?RXp1b004bEl0SDNHKzlmVm5KNHAvd3FDVUNGOEZTeUREMUVjOFBuVUx4K2FO?=
 =?utf-8?B?K3pkNFNQSmNTRmJHYnJWRDFHWFg2NDhMTnB6dFE4OFpvR3ZWRnNUQWE0VjJ2?=
 =?utf-8?B?dHl0RGhYWXhvNHErSnZqMDhCNGtDTkdETmVmL2lsK1Voam9iWTU5UXk2Vk1L?=
 =?utf-8?B?SFg0aGtTbGhQdE1NbkNyejVJTXorVFdwSmpCQnNLaEVpclNHTEtrVlNwVUh5?=
 =?utf-8?B?TW05UnVaVlBoMThxenBBMUFTL1E3emNLU0hEcW1UbjUyM3VMNW55c0NaSTYr?=
 =?utf-8?B?VjZkMUxGRjlCK0s1Q1RqVEVQTkZJYVN5ZndFTm9RaTFrZWVaVFhLTVNCOUVY?=
 =?utf-8?B?UUtvRXluWTBadTFRcDhPWjVmc2RUamxXOWdva2RSUWpWWnEzV2k0Y2l6RThl?=
 =?utf-8?B?Ym9rZ3JNcFpjWGJKNnpjakxyVHRBNU1pdGpKWW9uVjRoMXo4TE5OMVBIV21B?=
 =?utf-8?B?ZmxFTkJkRGpGOXhTcll6OEhOQ0VnVGRYbkJyLy9hcE0rZUtrTUhqeW5ESDNR?=
 =?utf-8?B?M2dGdzgxVEx0UmdRTldib0hBWHJmWkYwL0U1NzdrM1FITkVPYUxqTjZXbWpQ?=
 =?utf-8?B?ZzA5TTc4NmxMN3NUQTVLbGFlZWU0T1BsNFA5Ri9JdnlFVGFRQ0wzQzlIZ3Uz?=
 =?utf-8?B?ajVhWlRLNFF5bmpLVHRub3BoaGhaeVdnK0pqbUxuajlhdmhoS0VpQ3VJZGxo?=
 =?utf-8?B?enRHNTNMOW5rZTI1QVlwUGV6RVhPVHFqS09ONFp3NDM2NUtlVUJHMVlsQ1pu?=
 =?utf-8?B?QnVnNTlFdlVxRjFCbURXd0ZaMlJmMW5tNDNMRkc3blcyQ2xyS2FiZDNRSDVG?=
 =?utf-8?B?aGpQL1lySUpjOGJKWmRUN2U4a2Nhbm5iSzNOZFpCaWNwRUloNVova2dZL015?=
 =?utf-8?B?SlRaR1Q3ZzBvWERlVEJrYzF3TmRUT2ZjV3dWbloyWTl1MXlFa1lESEhpeVV6?=
 =?utf-8?B?UTByS0J4ZElJSTUwZGprWmluYjlGY0p6aVNVZWxzZkQyZkdFRDEyWmpwdmRz?=
 =?utf-8?B?bmNhMkIwZTZLZ1k1d1ZRMTYzVmtVNXdUM3N5dS9GU1BPRWkzeHdJQW9TVEhO?=
 =?utf-8?B?cnhvbks1YlloTHNmYTc4bzRpV3E2ZWVwbEcxbFVYbmd3ZXp6L2dpWmZ4aFZT?=
 =?utf-8?B?Nk1WUWJ4bDJXZlRLNDE2Zz09?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015)(7416005)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 16:33:57.6744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 12169276-c0dc-4f41-365f-08dc7ffd2365
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10159
Message-ID-Hash: KQXWZFR7G5QF2P3OEMHMOR2IVQ3YCQDS
X-Message-ID-Hash: KQXWZFR7G5QF2P3OEMHMOR2IVQ3YCQDS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQXWZFR7G5QF2P3OEMHMOR2IVQ3YCQDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In some cases, depending on system design, the MICBIAS pins on the
chip are not needed as such, but a couple of extra GPIO pins would be
useful. This patch allows the MICBIAS pins to be configured in the
device tree as general purpose output pins, controlled via the GPIO
framework.

Owing to their originally intended purpose there are some limitations:
when the MICBIAS pins are deactivated, they will float, so will likely
need a pulldown in many applications. When activated, they will
assume the voltage specified by the micbias1-vg and micbias2-vg
properties, respectively, meaning that the resulting output voltage
will be 2.0 V, 2.5 V or AVDD .

Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
---
Ricard Wanderlof (2):
      ASoC: dt-bindings: tlv320adc3xxx: Add MICBIAS-as-GPO properties
      tlv320adc3xxx: Add support for using MICBIAS pins as GPO

 .../bindings/sound/ti,tlv320adc3xxx.yaml           |  20 ++++
 sound/soc/codecs/tlv320adc3xxx.c                   | 105 ++++++++++++++++-----
 2 files changed, 104 insertions(+), 21 deletions(-)
---
base-commit: 47d09270d7776e46858a161f94b735640b2fb056
change-id: 20240528-tlv320adc3xxx-micbias-gpo-b8b4d1c846d3

Best regards,
-- 
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

