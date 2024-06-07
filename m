Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD390002B
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 12:04:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9178A852;
	Fri,  7 Jun 2024 12:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9178A852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717754656;
	bh=EdTYqBxadtY2HYA1NzjCy24oXQlUT2Dqvdo85dtRYz8=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C5yU/EwqSdjrXIF81Ym3spoo4SPqNzr4bLjEBI2mRtWq1lZf85TKYiaNbZoI8uWAH
	 4CkGnoQHlU9Elvr94d5SkxE+h19HH9WqTcIEN4+GbYaw4eXWRBdDwtTtLLXxXiaxGs
	 N9YAX54cmLjyiLHXS/SsDS0gLaopn53WaSlBl9to=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73706F80154; Fri,  7 Jun 2024 12:03:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDC01F80518;
	Fri,  7 Jun 2024 12:03:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E84AF80517; Fri,  7 Jun 2024 12:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2608::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C809F80154
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 12:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C809F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=it33gaka
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZyOsVOJONI1jk/22WUBJCutR/Je9+aV0yk6LdwXG9BjIrLe+wdYg5uLnS0C0LEh1OvST/CQBhwVE9UENfXBEWXeMB8JAcjbbDZVnaJYyo55kqxEI9/vjirMd/eiM52vAKCib2OQSLPj956yn1TybWcfa0l6UUVVNGfgzlGn7z2iWeik2qKGwhhPiiQpsC08lT5hTQ2thQNXaO4LIRXHLypZO3JG2y1NxFy0uP26b0XpPfZ7Y2zFpa/Ldl6yIh1N7PgWZgUZaUVs8oTmM7ggzORWyJPlBJYA1G8EOvWtGG2MZVgnD8y1pziFEyY4WlTc3HR9DpvOCGSk6qAFAZ8iCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUREBq54H9jZE7Z7onfglTlP4FFzPb8AIpnJT0Otv+Q=;
 b=lvZLdRu67NXlRzgKqULKjB7GQ28oufC35OdQdHjEKw9RZDaU5C+/4ZY7vU04z6sMIkldbyoSwTaFzEaQasIEZGzOXnS573Bq3jp95UUSWzpmhXTmRFxB3z77F0kR5eNrlcQ6EmWSpPUxHsjTv7my/we49lXVQi8F2tw0NRiVl2EqJgJ3gNOlESj6nMhvg27VArYsf0wH9+pcBcwsuyQwma7Edhx1u9Gh9ycYZ6zEm/Ul01JfztlVmiO9T6+5t6efpwuUAhMwjjgX2cMGHP8JIxG/3gd9c+KQuiIP/Yqg+1TBidMzGeUtDqsB4S+aGJXuKn+qkvU5JdqKp4Uw30MA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUREBq54H9jZE7Z7onfglTlP4FFzPb8AIpnJT0Otv+Q=;
 b=it33gakapBhZqR0fy1oQKp2LGn+5hQgWAk5TdI3+wxlpps8zYJQBJ98yBM5+cDq6/H9agPRhUqIKUBkJX0NrdjMgUhTyDdzcVttjZ8/x1lu86sd16NSMSO8ld40IyyH/gzB7L6ULXE/hTxHHq3ExAD2naD9mpkWH6r4ekuCp9+U=
Received: from AM6PR08CA0046.eurprd08.prod.outlook.com (2603:10a6:20b:c0::34)
 by PRAPR02MB7833.eurprd02.prod.outlook.com (2603:10a6:102:29d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 7 Jun
 2024 10:00:57 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:c0:cafe::ce) by AM6PR08CA0046.outlook.office365.com
 (2603:10a6:20b:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.21 via Frontend
 Transport; Fri, 7 Jun 2024 10:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 10:00:56 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Jun
 2024 12:00:56 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Jun
 2024 12:00:55 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Jun 2024 12:00:55 +0200
Received: from pc49102-2217.se.axis.com (pc49102-2217.se.axis.com [10.88.7.5])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D9CD332E4;
	Fri,  7 Jun 2024 12:00:55 +0200 (CEST)
Received: by pc49102-2217.se.axis.com (Postfix, from userid 9470)
	id D2F356476FDC; Fri,  7 Jun 2024 12:00:55 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: [PATCH v2 0/2] tlv320adc3xxx: Allow MICBIAS pins to be used as
 GPOs
Date: Fri, 7 Jun 2024 12:00:44 +0200
Message-ID: <20240607-tlv320adc3xxx-micbias-gpo-v2-0-b140a45ffffe@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzaYmYC/32NQQqDMBBFryKz7pSYaNGuvEdxESepDlQjiYQU8
 e5NhW67fA/++zsE69kGuBc7eBs5sFsyyEsBNOlltMgmM0ghK1HLBrdXVFJoQyqlhDPTwDrguDo
 cmqEyJTXVzSjI+9XbJ6ez/egzTxw259/nVSy/9ldt/1RjiQKVEEa1ZInqutOJw5XcDP1xHB/DI
 +ymwQAAAA==
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|PRAPR02MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bba9b4-2942-4c67-b82a-08dc86d8b99e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|82310400017|36860700004|7416005|1800799015|921011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Yk45OStnSXFrWXlneFJTN0o5ZmpURUZEd0tUNDloV1Z1eGlNbE5wbHBGb2E3?=
 =?utf-8?B?QzZoTXpGMmc4QXhwWmFhekRlQTRpM2FkWTR4ZUg0MTBLTnJSV2o2NmlIMGJk?=
 =?utf-8?B?QW9JRElubmN6U1MzWFo3Z1Q0Wjh5cWJPTGsvcnRORU5jcUJGUzJrenlSdE4w?=
 =?utf-8?B?YUlPZmZkZnRFOU85S3d4MUJUcWR1TWdmOGJtWGRrYm94Mk5VSG4zMW01RjF5?=
 =?utf-8?B?Yi9HMHJJS0J0VkJZMmdsS0xmZUZxSnBOOVB5NHhpRWc1YzJGUlZsb3RGU2pU?=
 =?utf-8?B?MWFyc2dJV0c1a2wrUXI5MGpsQllrZTZUcDFmdDBNWnBZUjVXeXFCWjVmeWw0?=
 =?utf-8?B?QnNVYmxhVlFMaUVLTkpHWTRPWWFrY3M2QzlaQi9DYmJDeGhMKzF5cXExZEdj?=
 =?utf-8?B?eWk1UGVSb2Y5Q3hWL0dKSmJGcTVzK0g3T05DT2dRRDludGlBN3ZsNUgwOEt6?=
 =?utf-8?B?c1NOcXR2eGlwODhSMzh5dmx3TzNNZmhBV1BvRVNkQ2VlZFRSRFZXRGllODF2?=
 =?utf-8?B?Z3c5YjZZcmxNZG0wcGZJMHdkZjFTbExoR0VHMy9pelpvd1FkaTBlN0ZnOERL?=
 =?utf-8?B?OGd1akdJK2l3SEoybGdHM0FncG1kVWRaK3hzSEsyZjJDNkZoQS9vampqUjg2?=
 =?utf-8?B?ZmsvcGFNZ0c3b0Q2c0JsMDNpSHhiQnR0OXR6ZVM1NlUyOHRVTWdPRXk1eHFM?=
 =?utf-8?B?VDR6UFNYb1R1L1JNdlFwUE53c1NpYWFlcUFjbSs1R3luekxLc0tFRm55WHhy?=
 =?utf-8?B?Z3B6R0xCVE5PcVc1eUhNYk5meGhzWnhkamxZTmtRMWdtSElueGMyMVZyVEk2?=
 =?utf-8?B?T1NYay9XOFk4SlJQdlZyVWZLMDh5cVlEUUhrSFF2Z0Q1eXEwditzZjBJVkZN?=
 =?utf-8?B?akE0THhxc3c4M212cXVpYUcydTBLZFdSSGNiZTVWWUdGWGQ2ak1TSm9vUEpW?=
 =?utf-8?B?clUzU3VTSzJpQndqemM1dzRXTmpVZTUvbGlhL1p0T1docE9ZenB0ekNwMnY3?=
 =?utf-8?B?elpzOU84WFFLYXEwOXF0bXlLZWJFVGR3bXpyRnY5ejEybVlnazJQdHVhd1ZY?=
 =?utf-8?B?Mk4wRSt5Qlkzd3BoOVNNZlBuTnA4algrOW82MHQ3Zit6MjFYTmEyN3JnSmhH?=
 =?utf-8?B?U254MU5XczJnZFRsc3RhZlRrNTlTRjhiUGxuZnZxeFA1SUxRMzFkdS94UGRF?=
 =?utf-8?B?ZThkcWRSSld3RzlZdzJubVFZNnk5ZDI1TWdIcTRKc0FVMC8zc1lmMElsbUNE?=
 =?utf-8?B?OEQvK28xeUlIU1dqMEJMb1NIV0tuLzBTRHpzZ0cxRkFGQmd4UWEreTF5bDh6?=
 =?utf-8?B?OEorQUJmWityNW05V2dUR1d4MFdyQTZ0WTlVVWoxd1p1OUgvSGVSRUJ4blI2?=
 =?utf-8?B?ZXZ3OWN1S1FSOWFjMUthbi9tRGpYdDFudDZhdTBiUXNXcVEzYVdLWG5aSjV6?=
 =?utf-8?B?WWxOZFU5Ry9paGxmVVFLQnArclNKeG1QaEtBSk1zbktoWmJwMVhHQzg0dzd6?=
 =?utf-8?B?M2ROMVRsanJkVUVJNmFYdXVyeWcvUlRDamhZTGFONDMrZXRNWmFtOWJtNlpQ?=
 =?utf-8?B?VVB6WTEzdnVZUDdoTE5RaTYzK291N212ZlVwM01iUjlLc09IK1VsVVUxTkRC?=
 =?utf-8?B?aHdKV2Z4T0xpblJFOStIcTR0VXRHVktHUTlISnFjbC93Yllxc0RCMjR4N0Vk?=
 =?utf-8?B?T04zZ0JLZTd1am5RcE5rbm9NOHBnYitsTFNiNlF5VWlJMkd3cmpiMW9jYW9C?=
 =?utf-8?B?WGsrdlZDTXAyQXJWdDZ6UEs4WFZnemZJcFhmeVZHUW93Mk5WbHNVTy9nbk05?=
 =?utf-8?B?R1pRZjNhRytKQm1NY2FjWDN3dEY1NHNQV2tNL0JBZFRKTGlOcHVxTE9TajlM?=
 =?utf-8?Q?k4szi4/xQYoqn?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400017)(36860700004)(7416005)(1800799015)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 10:00:56.4543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01bba9b4-2942-4c67-b82a-08dc86d8b99e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7833
Message-ID-Hash: MFYLC5PCKQO62JI67ADJUI5I7BFJDU3T
X-Message-ID-Hash: MFYLC5PCKQO62JI67ADJUI5I7BFJDU3T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFYLC5PCKQO62JI67ADJUI5I7BFJDU3T/>
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
Changes in v2:
- Corrected typo in yaml document for ti,micbias2-vg property reference
- Added dependecies to yaml document for ti,micbias1-gio and ti,micbias2-gpo
- Link to v1: https://lore.kernel.org/r/20240529-tlv320adc3xxx-micbias-gpo-v1-0-300d39cecc55@axis.com

---
Ricard Wanderlof (2):
      ASoC: dt-bindings: tlv320adc3xxx: Add MICBIAS-as-GPO properties
      tlv320adc3xxx: Add support for using MICBIAS pins as GPO

 .../bindings/sound/ti,tlv320adc3xxx.yaml           |  24 +++++
 sound/soc/codecs/tlv320adc3xxx.c                   | 105 ++++++++++++++++-----
 2 files changed, 108 insertions(+), 21 deletions(-)
---
base-commit: 47d09270d7776e46858a161f94b735640b2fb056
change-id: 20240528-tlv320adc3xxx-micbias-gpo-b8b4d1c846d3

Best regards,
-- 
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

