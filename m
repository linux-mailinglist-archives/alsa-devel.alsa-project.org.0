Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8702C6821C0
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:01:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9633ADF3;
	Tue, 31 Jan 2023 03:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9633ADF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130480;
	bh=vBTOQaZ49F6ANUXrzwapNKExAQIm8jWSCaG1V/yTnVI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vCrpj4AFPkV+IVd2IBfXxWo++B7hwZd4a31KC9W2cErqzPrHX7HLjtVrbUGXqILYu
	 QiMsnl2AC1J77moW3s46lXIEYe3lKoiZigEcL/U0tfM56u9iVMYkSIwxPLRYzl3Q/a
	 1C7GM5SoHjvymPjz4kgIqWZlGepOGlxIVxcjdj4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C8FBF8055B;
	Tue, 31 Jan 2023 02:59:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B42AFF80567; Tue, 31 Jan 2023 02:59:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2127.outbound.protection.outlook.com [40.107.117.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 841E8F8055B
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 02:59:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 841E8F8055B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XaHhzhUF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yd9DW0nP6HBx7LHvqmRh/sPLT4pjpicVT9kV9T1YH/f3dDvruF2DgeXEbl+ajNy6XccMbZUuL79xSZZMBoqeypHKuXdljxmnrMRXFTjeRkAly1QeIBPnzzFsseiUqxq7nghphwqb9l4NMTKj5L47zbFlrV7Du70132cC3o4J8A0YwkeURk7dweUxbyJNOWJLZiNW9wHtvP9Ut84AVG8dgn+IFTXYv3Ff1fjs/8ZBjjeGo3q1Sls8Qez7AdVVRHgIgwRqXsiqgNUzrb/XcZH5oeWWu4afW6Tb4nvsFJ+PdSk2IXyFbdDJyJlXYTAGtD27YfHZMGoi3y0dqwBgYRHLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/fZ75kVDHBU1wLcbZHXe1AOntqNjN8UwMjt0c1H/XI=;
 b=e969vVd7slspT1Gmxe1JCu3zhVkvDyP0mFp3oVs9SH9+bPHTllSkeOyp5eKRonDzYMc5rgGioWM4M1Z5R9AG43iTOEfhD42LY4f2/+l7CzBO0tEsDEzeQaV7otmhNwYaxSj4mGG8MxYD6dKgAbHjkKxHPiZ+1/qZs+a/NMu0hu0OtmyGx854+VlN7lbaYRKb5+Kr04aPgoA7wezPAIy6CgCLcXZa6j5ninXzwjLy9m2+cm1dv+TPE3q6hYNjf+M4p4UXw0s/Rf+5AEig2YTg0t28xtUy1lGciP/JfFVctzkcuzqVzk+22orHEsd1UQOQjuClnoamiaRO0Wnj4M4N8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/fZ75kVDHBU1wLcbZHXe1AOntqNjN8UwMjt0c1H/XI=;
 b=XaHhzhUFM/oYh5+0Wah8anK4hgLtTq8qg5BrB9dk9EczzvS+hIOzDw9DqbZnoPQjf/FpZEGRcV1T+fHxOQ0beEQDivBm2e7ha+47GaEnTEg7lQtWTC3bNVAXhasvk6l1HvTlZk5+WO6l0aB4ieFC0/1cPCWJZ2U3vzmKCKqkyQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9980.jpnprd01.prod.outlook.com (2603:1096:400:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 01:59:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:59:27 +0000
Message-ID: <875ycnfoqp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 05/25] ASoC: soc.h: add snd_soc_card_is_instantiated()
 helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 01:59:27 +0000
X-ClientProxiedBy: TYAPR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:404:15::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9980:EE_
X-MS-Office365-Filtering-Correlation-Id: d9408cff-614d-4524-e171-08db032ec8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g4xf/1j0zbinOTGJlWiSRQfNsvYtI7oxFuC3+7bfsHlULwJ9wgQrvL6qxeEZlrfkxrNYNZ7ACfcDODv/6QO8fx07xXOVBxChTloX5jSlKj7S8ygxkEPx1ELa2J+gI+NS94m5ZmQ3Qlxw7Do3Czve716hDrSsdpIJrT0u7kM6oRhAqcEe4EqbMSK4pvRIbDWEqzCAR+SEGCxsT3brwCltDwVxyEMqQRH3f1/4PUPZjP16GHINmiUoFAAU3v8ixPkdAJSeQyLCA3YnnlQCFYnbb6bpoXfbs0g9eD4XvdwJjm0AZ7kMDjZ4VEMBJJ6x1Q+2xYA9CypgOUWX/bQC2WE6H5U5BtdZgYSR6jo4PN04i8BXV1y1b/f911rXPbHU083xczOW9IJ8hCIjhq6tBFy/rZzqGXjm0MnUTP98VP81zeWN6L00cAaw310iobIX9WT0y9h/84/AOULH3ewWfPygoLwVbx4qH/djbUiwg60QvKtlCC5hHgHuWHg4Mgo6ISKkmB5CnWICbifrPNeFcevMs/p5h2LJVNMhnabDBJm7L9ISm9v5AKqy1k/UEGnXLEXv4aIycZ4fIz/Ukeq1Tz8w8P9o6cqEOBXcvXyub8yTrWR3dU7NE7SStpZE2ay46cacT6Q5hiKHgd/Ozf7ANFGe7CEkoZ2eS6arwuQJ8MmKaaWSxv7LkDowmROGYzZehKbxyu//ATxQgRXBcHTTLWtUAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(66476007)(8676002)(66946007)(66556008)(4326008)(41300700001)(6916009)(8936002)(316002)(2906002)(5660300002)(4744005)(6486002)(478600001)(52116002)(186003)(6506007)(26005)(6512007)(2616005)(36756003)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rLMDsdJ2C+LI8hjGkHTv2d1GLFV93dqq2wEkVQ/LFXzbkQiGYzhL+W/b7Cgi?=
 =?us-ascii?Q?Atn03Fw3zvKwOZ7KPdCshqVbHgcpB2Zpm8PYfkFg/JCIrpY2PY4ffPzvcXdX?=
 =?us-ascii?Q?k76Zhb5BfYgBnzkNlIhwhAmmIzJCPR4+R8TYLYqWDZpr8Lf2bqVRyYbaqTu1?=
 =?us-ascii?Q?3gLVNPr0N4nn0mSrM676zED6rNJ42Cie5O+8Yztw7moknrrXcfT88zMIGUWK?=
 =?us-ascii?Q?Lv72+gcW9Yv8k0nR0I/J01GJtLUjhuTXYJ7J9qfImT9pAc3Z0Up1e214ig8e?=
 =?us-ascii?Q?NrqhzyebaExheLwJ7xEvagyXGQUOUIGTajoBd/5EtRMmx0sT1tkp78nKFiLV?=
 =?us-ascii?Q?zRdzfRDnpH+udHLVNWTEon1dqQkarptUyQfKs4bn0cAy479HOHmgXmWxxCx8?=
 =?us-ascii?Q?ASr6fgE5Ow9yeY28C8wj9Rk2hLduJpZ/e104tkHDdJmFIfGrz+XykHSV/9ur?=
 =?us-ascii?Q?gW4TxgA2VCBI8sFjw65fuxZ8gRMIb9e9XHVzgHDRTj0E0YuAk3A1Z0BDExPj?=
 =?us-ascii?Q?JqinHDn6SsYhOB0lIi+c1J1BAcxJeSAEEGUiCaVG2wj82Z9oHesJipGxr2Pl?=
 =?us-ascii?Q?WdOPjpgc1CdpduRf88t7A5y3Vilay+2WzUL1KV3uLtaaNRVWhQvCDFg14Fss?=
 =?us-ascii?Q?XTtnlB078f0FIW3CMZsGCY47XZqcP5p7BLd1/mjik6s5zAigeeJn44mmw7dQ?=
 =?us-ascii?Q?kum7Blr/93Zvh8KtpuujdZtRB2JOxP8z9iXqyeixDHqUNZro88amObylFJ4h?=
 =?us-ascii?Q?3gxIBV2XdfJ/yO191DgsNdd4LtOVPxnorQ+SntIraVRIGOjC+AjtxRd4Zp2g?=
 =?us-ascii?Q?5KEvkB+apuqmcsy50oeWwG/mkdyUDqRbE+3So73RS2bV5G59v/hjwFmmxTbz?=
 =?us-ascii?Q?QrIkKTjE68CqPrMBXK5fIt5i+C7UK/eTlvGAfYLs83KBtbntf8JdhI00b3QD?=
 =?us-ascii?Q?c6heDvPWKBtJQmIMvQyPS+sFfww7Xj04x/ze+TKqnrvbH1SvhvntWHdnxE9c?=
 =?us-ascii?Q?yxjpUjT5NJnNWAujYgfRHX0Fmn1A7dFHl8zDaZ68S9mL4KYI0TQ7z9v5g7+N?=
 =?us-ascii?Q?JzOQnr2FvNiFHxJZAlKjx74FU4jUCuEu5AlId9GPGPSlA//9iacLjaR8hrZV?=
 =?us-ascii?Q?eowSp/JkTwAIGWvjmRFqH/1CeraHD0U/AGagDEjj1XkIkeLbt6kBQ9hEaWEw?=
 =?us-ascii?Q?vRHaQyjYDIcBBIPE/wOiptD9bFiV+4II480wFTOP2zfGHqkqUEFk/P1Lve09?=
 =?us-ascii?Q?EBERcfTkaOq+KgC77rnPckd/SxgzRMXMWPO0nL5w4QWigvZQvgcwttvr0Noz?=
 =?us-ascii?Q?xCsrIddjnAKewmCBz72Sm9mjys2fWGVaSrNpE5FWF6o7UCvF67inhvS87hcN?=
 =?us-ascii?Q?QauqG8YGjNXcgP2NAqs7KT/71/jND9TYe5Ddb0A3jSj56j7rewmv9DcOORoW?=
 =?us-ascii?Q?g8l1GkYHJVXs5kofV7yEHvDDkjCX/tlCTXBwR3H/67csKq4S6Bg8e4WojSFQ?=
 =?us-ascii?Q?TlwEKZUEDAUWZIZs02yjwimbVLUS++iqUA9KYYOn53ikOs9EOG77oskFRjZS?=
 =?us-ascii?Q?6KoypTw8jTKH6mH9XTCuah09q1r2/EazAVzQ4ek7FINyFPME3d+LauoQ2591?=
 =?us-ascii?Q?QGl8K7wPYANO8N9xBotDIdk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9408cff-614d-4524-e171-08db032ec8bd
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:59:27.5260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKHYqGgVYCfUDGF4/lddT7V3bf9wGryAqtMGGj14fTmPqh4PoEKgEuOHiGLycOBOwA0jKrIMHtpINoB9Fp7UUtlZkEMAKYu8NpGezJB4Xy4MoDzEb7cdpiorILPN/X6L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9980
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC framework/driver checks whether card was instantiated every
where. Then, it should check card pointer too in such case.
This patch adds snd_soc_card_is_instantiated() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 37bbfc8b45cb..e58b43b5da7c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1052,6 +1052,12 @@ struct snd_soc_card {
 #define for_each_card_widgets_safe(card, w, _w)	\
 	list_for_each_entry_safe(w, _w, &card->widgets, list)
 
+
+static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
+{
+	return card && card->instantiated;
+}
+
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
 struct snd_soc_pcm_runtime {
 	struct device *dev;
-- 
2.25.1

