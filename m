Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A95AC9008AF
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 17:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9946D74C;
	Fri,  7 Jun 2024 17:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9946D74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717773899;
	bh=PoBbEyhaFxLC78gBUQwE8bFvnM5RB6hFEAjwIX6Dz4o=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jeWOCDgIfUPeEk6sGtdB/HsGAln8L4VXj9f3FKcF0u5ux6vdcd2IBDIMfUo9ZabP9
	 nMQrew4SEqqPzjbsIw2bLnAMhwuWnYS+gA5InCXDY3RTuMWieJO0a4y3VhMzO0YT1Y
	 G8KXxLPEWZY9ZvSQlFADymYAFaHGtYhW8P4BOzl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EC2CF805B6; Fri,  7 Jun 2024 17:24:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24697F80517;
	Fri,  7 Jun 2024 17:24:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E3EDF80171; Fri,  7 Jun 2024 17:22:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 873EFF80171
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 17:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 873EFF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=qEhQiVIH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5N2KGSGu/XUvgj/DWSdt83yXyb6LqDL9S+g7m4UxG0OkI9hCkdmlFFpqEDU/yIldfEz6r08ptvbtbXEOZkYNVQeIqyguPR/X1eHHk4ryvwtrspJ9jIOTz0bUpQUaXusx48TsMwxd8jmRiw9s7BPY2Q1BHyJhwQtnzfLCSxQPzycgfT+hrcr/LE7PtBEHuRVSnK8pXxZGxjtXIdXV3dGjUXYx3s3890hCR3lb2Ra2a8iLi1DyMGOEfPVDTRJfZAI3aSloIeZ3HvT4cGZm68aoeIMUwaoUbC8Uw0JYIIXGQzwsT3UR2YkTJAQKvd+02BlZkVQfsdkH6vXPnVWyXE4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7PWeh6WCakgE+Fy8XUxlEUsg0m0AHqI4L91GShTGJc=;
 b=bUdipaA4eke2rogS/bzT4TFLLN2AgV5A+32otHOYrneApz4gEPzlcc/vD7OK/+gwEm+Kz7oNP3IS01n9/3Il1zA2blS6Hinc86O4lbZgiJDiXyeucXRIIVyIRQLJ0/nToUp47xJP3NaIpuFZ4sy360nzjTZ6M1fvMWzke9eIq8Owrrl8eaqeN3FKhYWedvZsNa8U4EJ+C9FKhIJosjsC8wMFQg51dM6uMSPbXZqxbi43UKOAF/DairDgGlxR19+k1fntwSob/mla5nqfreBJ/Usv77CDyRAzoGVD6AH5nhE1WKHXZWxjh2gmuHaglshuCjJfRxEyMP6qfS5YigiY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7PWeh6WCakgE+Fy8XUxlEUsg0m0AHqI4L91GShTGJc=;
 b=qEhQiVIHdnLHCkpkF0sft0kGvNUeADNgVhHYy0dld8SXAYX9qpBU+rSopQoY4xTCLja3ZxGgl1hmdX2ddvOd5ENNFCPmEeaivZwX3TcbAiLyi/nmzE2B5d8S2RFjU+1In0IVF1ckl/8a+2keIo34IpgA/tydBWy3z23O2MmZcpc=
Received: from DB7PR03CA0087.eurprd03.prod.outlook.com (2603:10a6:10:72::28)
 by GV1PR02MB11108.eurprd02.prod.outlook.com (2603:10a6:150:210::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 15:22:17 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::4f) by DB7PR03CA0087.outlook.office365.com
 (2603:10a6:10:72::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.21 via Frontend
 Transport; Fri, 7 Jun 2024 15:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 15:22:17 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Jun
 2024 17:22:15 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Jun
 2024 17:22:14 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Jun 2024 17:22:14 +0200
Received: from pc49102-2217.se.axis.com (pc49102-2217.se.axis.com [10.88.7.5])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id DF73B3495;
	Fri,  7 Jun 2024 17:22:14 +0200 (CEST)
Received: by pc49102-2217.se.axis.com (Postfix, from userid 9470)
	id C32326476FDB; Fri,  7 Jun 2024 17:22:14 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Fri, 7 Jun 2024 17:22:04 +0200
Subject: [PATCH v3 1/2] ASoC: dt-bindings: tlv320adc3xxx: Add
 MICBIAS-as-GPO properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240607-tlv320adc3xxx-micbias-gpo-v3-1-59dbec8b98f4@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B99:EE_|GV1PR02MB11108:EE_
X-MS-Office365-Filtering-Correlation-Id: 4871573a-56d8-457f-2bf3-08dc87059ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|1800799015|376005|7416005|36860700004|921011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2NMTktyU1pzTEF4UVpwUFhvNzIzQ0NlUUtqQjRib3MrNUpaSjBScGV2V05T?=
 =?utf-8?B?bVE5c0NyU0NnUlJsTUFxc0ZIcFJXTjdiTkt1aWNHbWFJUWVjb1ZxMFppUkRM?=
 =?utf-8?B?NStHR0NBc1pibE5rdEd6RHI4SzE4Sm9pRllmY0NmckMvSGtBOVc1NFZGRHRU?=
 =?utf-8?B?bFBwb0N4V0o1RVZJcUlldVBuZHlYdXNRU0RPb3VzdEtsVHFiUFFSUFRXcEcv?=
 =?utf-8?B?UDJmaEdCeitRWEZBSmpKTGFsQkc5cS9UWGlsdktmMkQwL2Q0SDEwMzRGWUo4?=
 =?utf-8?B?ZmtyMGpSc04raDRGY29ObENBU1o1QVNuNUFXK0pReXczOUpSYW81WW1FNzEw?=
 =?utf-8?B?N3VWOEN5d1lFR2hKejRzRDNDVE1Rb0NBNzlNdlVlMXNMZ3lGVnJEaEl0Vkdy?=
 =?utf-8?B?Z1BES1Z1QlNGcnhUaTBwSnkrSVp0SWN3NWx2U3NKbUl5ZVBMeS9uL1JQblRx?=
 =?utf-8?B?SDRCN2xZQVUyQU1wTDZMelVGUlBaelZIOEw1ZStKaFVMQVNKNjlUMmVUcERi?=
 =?utf-8?B?WmZFSGRNNjdyUm40dVdKKzM2YmVJV0V3Z25NYkg4MFBvaXdmazl1UWpGSUJB?=
 =?utf-8?B?d1ljTStVaE9OVlpmQjJrNnljUnlTeUhYTlpKSmhlV1Q5cTNKY0RFb2RiWlVV?=
 =?utf-8?B?QXhWWmJFZXhXbUwrVHJiRk5zYXlxclRFa0FvZUR6T3FMRjZjaW91ajE3bjBK?=
 =?utf-8?B?NTNWSCtnTHdyVHdobkVVbW13K2xWQ0FHOGsrRWI2YnpSV2FlZ2hJUlB1WVBz?=
 =?utf-8?B?bVp2emZsWDlidy9tb3BROW9ESFVIakJSOThyY0tuakI0YTF6VFY3Q0ZYajdF?=
 =?utf-8?B?L3hYZkRzNGJaOTk3a3JrWElNYTNmTDNkWFJzWlhrMmM2bTZvTC9TUysydE1i?=
 =?utf-8?B?NitDNlBvbXVhT0ZNTmkzaGdQT0hRbW9Rb1c0ZEM2SlZweERPQWwwdURsM3Qr?=
 =?utf-8?B?d1MvZlJUejBMN1c2RVhZM0dkYU5SejRpYTlSblE3SCtWcXFwQVUwNWUxVy9l?=
 =?utf-8?B?MllDYXdabTBteERaNzZ5UlcvcG5kd1lvSkFNZFV6eWl2OWpsRG5RenUrbE1J?=
 =?utf-8?B?Z3Y2VVo4Uzl0U2dqb1JjNUdycDlpM2lHVXEzbGdHNm9VZTk0dXNvNnVXMHlq?=
 =?utf-8?B?VCtHdnRtei9pTFUrUVUzcUszZ1ZSMFBJSUlhOGJnTjhySjBQL3dtZVhzVE0r?=
 =?utf-8?B?MURaMWlLZTgwRHgzdjVIV0J3aDVOMTBjSnBKRGxuYlB1ck80ZklSY3I2dGdU?=
 =?utf-8?B?dFl6TGZhT2JCQ2ZnbmxWamU4ZGlGbmlheGN1bHpyTWNnZDROcVlZNTFVMStD?=
 =?utf-8?B?aGJhejBZdENyNm1kUG80TG9TeHorVGhIV2NrOFZEcEJjdFBnUmRKaDhFaFBo?=
 =?utf-8?B?S0tCemZZNFdOZ1BmWkdURFBOK0pXK2cvenUyNEl5SysrWWtJVUJqSUlLWkZv?=
 =?utf-8?B?YkM4SDhPUEt0V2JNeGZXMDRieGVnUGJFM1lrODBYbDB5dFBKV2h0VzFNNjcz?=
 =?utf-8?B?SnJKRkFIYjZCeDNIZGpPSjdWY0dnVWNsRllEZXBCYmZuL292dU94R3FGZkt0?=
 =?utf-8?B?UnN3ejlHZkVocW05ZFFSeEdCdmhHMlpLQ2ZHbS8veTBadkhpRUZLV0gxYVdl?=
 =?utf-8?B?MmZBTUN0RktKQTQwSVVsbnZZRGxQRGNHaDVqUkVVOFFadDM0MjcrR2c4Rk5S?=
 =?utf-8?B?RnFxeHY3b0RCMW0zN01EdXpuWVNNaWNJNWdiQVJCM2pqUzJJRkxEVytPd3Ex?=
 =?utf-8?B?RUM4aE16NlRXOHBKd2dFeWlSaHlTek5reDBRQ2VlV0I3dGJsd0t5bjluUVdo?=
 =?utf-8?B?S2lhc2RkQUROTUhrSW9DTVIwYU1jMjlXNVJyREhFc0JIdmxPV01IcjlYdml4?=
 =?utf-8?B?TDVqR3V6UERQeE42dkFKOUZVc3diaHI1eUIzWFY4ZzhQSDVCYjhpeVRScm40?=
 =?utf-8?Q?K8rZtYmJe4w=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(7416005)(36860700004)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 15:22:17.1959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4871573a-56d8-457f-2bf3-08dc87059ddb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB11108
Message-ID-Hash: F3QK3KT3P3EIZBM4GEUVJTOHLK25NCBH
X-Message-ID-Hash: F3QK3KT3P3EIZBM4GEUVJTOHLK25NCBH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3QK3KT3P3EIZBM4GEUVJTOHLK25NCBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add properties for configuring the MICBIAS pins as general purpose
outputs, with some limitations: The voltage on the pin when activated
may be set using another property to 2.0 V, 2.5 V or AVDD.
When deactivated the pin will float.

Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
---
 .../bindings/sound/ti,tlv320adc3xxx.yaml           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
index ede14ca2c07a..1a6c6877b2f7 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
@@ -82,6 +82,26 @@ properties:
       Note that there is currently no support for reading the GPIO pins as
       inputs.
 
+  ti,micbias1-gpo:
+    type: boolean
+    description: |
+      When set, the MICBIAS1 pin may be controlled via the GPIO framework,
+      as pin number 3 on the device.
+
+      In this mode, when the pin is activated, it will be set to the voltage
+      specified by the ti,micbias1-vg property. When deactivated, the pin will
+      float.
+
+  ti,micbias2-gpo:
+    type: boolean
+    description: |
+      When set, the MICBIAS2 pin may be controlled via the GPIO framework,
+      as pin number 4 on the device.
+
+      In this mode, when the pin is activated, it will be set to the voltage
+      specified by the ti,micbias2-vg property. When deactivated, the pin will
+      float.
+
   ti,micbias1-vg:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum:
@@ -104,6 +124,10 @@ properties:
     description: |
       Mic bias voltage output on MICBIAS2 pin
 
+dependencies:
+  ti,micbias1-gpo: ['ti,micbias1-vg']
+  ti,micbias2-gpo: ['ti,micbias2-vg']
+
 required:
   - compatible
   - reg

-- 
2.30.2

