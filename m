Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E948FFA61
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 06:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B43C829;
	Fri,  7 Jun 2024 06:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B43C829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717733981;
	bh=8zXrZ6GxG4HsQbYCy49mHfs5sS3ZuM479G7z+6IrDhs=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WsN0P74XB0at/lBYq1ElzkjU2aGcF4SYY82beS6baGBwZfj5Yh1A4TjuG3EPHS+4Y
	 afjqdHCGLG0W6B11timhQUlhHO0EkfZ9abdGWqBGeO0TcwgJV5/yy6tVY1tbfBKGmn
	 83QeSeAiyoEgAY2tw112aziQcia9SUlvekVeg8cE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC0C3F805F8; Fri,  7 Jun 2024 06:18:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D02E0F805D5;
	Fri,  7 Jun 2024 06:18:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95518F80528; Fri,  7 Jun 2024 06:16:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7815F800AC
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 06:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7815F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Qecald9b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afDPjUT9zTDlLKnQawwWUpjqXtd1INXNtsqG690Z/Er+3mMsMlmzoJfJCSnjkd8pluoCW4aIRhVYQ5B+5THOqCFk0XHJsKc8bPxhtXVleVvK9lgiz311kQcn1D4V2MB1WWZtwjG1JtIDWfQAI6Dc85lsgVrctUAe6wP1WyWbwyDdX1TMw8+5VL+8hT1ieTw+Q6DXArnFGxXCDmlWszuwe7O4dZ7G03jPf4ieq3HYhSRQj7zZd1ObLf33na/SYpPVI0R7C9HapdjSvDL4ydR+mhQh//9LNPLGJQTbAiCmS2303S5qjZgz/0148DXlT29AV+FwTm8UkuOa/s4PoPupYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SorgzsWSLWUgB6uaQs1EsNFWIfGgccjWEBmrohiQKs=;
 b=AiDwDoTtBAhRjpFzZdFBxL0j/sNMVs8pnjjUoTZnPoTU7tXTA1FKSJUYBL7PVvgbgcNqawQN4O22uQzXiRvTNrIZ7/aWrMZ11LAvbSSZ6v8vGvSL2ki4TBikw5cOIj1Q2ptkIrBmXcHAt24JbdIj4gVWGA2R4PC7EqpbECZmoi131twbZiAuF/DfA82uO9Xa0aVE5zew+7VrIi+3Mqs+xYOLmUHYNNqKMGrgwGlWMlqTwdvtehsWJTkxK6TuHllpvIPHRrn0/yXGTt5d9MlgMGf8zBciTZjY1gmYxviXHrcvnwzfCVJABz7mYYRNecx7w4IEBTMkJv/vy4DJgtYVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SorgzsWSLWUgB6uaQs1EsNFWIfGgccjWEBmrohiQKs=;
 b=Qecald9buF2zY1uS8DhSIuskZASjbFlA9A0yhJksDWFih1NfYfuVT5llyYa3c/33BdLk8kT2SahHYY4cPMDrYwvNCoHwanx9/JXVsotSpm9ITP2cd5kZLc65uilscK4APhsGU5nBZxurSXNTp/MhfCFRHsTS4VQcIgrWyVOSou4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8206.jpnprd01.prod.outlook.com
 (2603:1096:400:103::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 04:15:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 04:15:11 +0000
Message-ID: <87sexps81d.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
References: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: simple-card-utils: add link-trigger-order support
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Jun 2024 04:15:10 +0000
X-ClientProxiedBy: TYCP286CA0124.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 997042c5-1080-4063-0614-08dc86a86c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|1800799015|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BY/sDteSplUCwKvXDap8X22PKh51b/XOd0HGNd2O8alUdc3795U58/IX++qC?=
 =?us-ascii?Q?+sCwlXfu7m1MJ58URhcaO4zBYEyUY51F2gmUOpN1XJDtEG7l5E1jI5zyzbFu?=
 =?us-ascii?Q?Qba3NSFu9PVTzZ2cCH+uHakoAVUdTZ2b7UaMWt/GBPZQ45bjIUgJ3JPgnzrq?=
 =?us-ascii?Q?M0EMhw2Td7XCuyYzbx/ke3dgVNUOYq6dmnq1J/jj89YuNXY1yzOLYkhYl0UE?=
 =?us-ascii?Q?Jh/64+T48HNf9ILhaAG3IimAIfjOkdXnpkqJq4hziK499IenSUDSSBjQef5+?=
 =?us-ascii?Q?VtBj1PgoVi0Gs7sHEV2GmQ+7erwx2/vtVOu13jGUrvZAMiWx+3PRqC3jVnKE?=
 =?us-ascii?Q?OyJqOjJIfPQEjrV6jWpyNQu4j85tXIgi7e0I6whQLCDiKvcMLvegCbABkVQn?=
 =?us-ascii?Q?0uzbEsnlQsCTg9J/A+n+QWEx3v6UoDlFWj65KR2/WhVfcS9FfPyAoPV0flJC?=
 =?us-ascii?Q?lC5XwDq2YYZK/Mmqmyd9GBe7cWDs6gvMVwwuMESUm1vA+O8gnNH6NqvmRSYW?=
 =?us-ascii?Q?HtDZOZAIVYNskgqAGW4RQG9CLWKwuhTfnNx+CXInba03F+KkO9liVxV1t2sK?=
 =?us-ascii?Q?f3ZecGR6pDcPsaGnQspmIlGqsU7TTjITAPGsnSEE7tP7BNhIGvH82+sraTfl?=
 =?us-ascii?Q?U4t5NNihN8i0nnClpJHr7VRgm01KcI0RDieYtpdFnDGNbXwwO+Z349S7ViDU?=
 =?us-ascii?Q?yUKV2dIsPTqOjj1Shyxckj6lHb3bCTqUKR8DRga2+Foo2TNnIcsYMMoknvzM?=
 =?us-ascii?Q?+xAl+x76WTdw/eRtqty44yxeJ1CfCj6mMKQ7Z1WfTTNhTModc0VJePRq0+iR?=
 =?us-ascii?Q?M3OQg4YqGrVwRWBxD+KGjTpHXuIBAsOd7AdI155bP+J4FigtTgqX6lThYBuO?=
 =?us-ascii?Q?pcV6Ol3RFeImhD+G0U5QwuQoMJu5GhNNB/e4+fxGxPA8o+T2nKTVR1WHgFAd?=
 =?us-ascii?Q?JzsoJSNSYeCtM3SC3nLUISFHsKd0q+WeBlsrLkwRe/jnss/9IJRKyZ20pnKu?=
 =?us-ascii?Q?E0f5KAgCCcXZWhOWB9zfnezYs+iMi1UV5wf0ODsKuRqO43xX2j8NZGF62Kxw?=
 =?us-ascii?Q?Sm2xjAlGjTAvqJrZ8Y1MG3L7iXnwkByhGQ7sVL8kqau4piSgKCJ6TFZdlCHa?=
 =?us-ascii?Q?9Jd99fyqgXBAWgXB7e74KR9LLZTy2fnd3xJZ2wuu+o58wONJXYgqu/il7pOn?=
 =?us-ascii?Q?A8OZ5bDF49yyrnovCQjYrwuIj0ovIhMMDjAPQdCWZtQf4sCRVRxyNzaNq99v?=
 =?us-ascii?Q?pbhuPLV7wywJ+jFTNNQdeWBnUeX8seiIssn0NDx6aBBFLSYNmLk0tjByIpO3?=
 =?us-ascii?Q?0jLgZHSAoTpaAz/QFn/B3fe5CqUdZPcUquGbkjfTlrQdWsVlfSLgJgNpyVky?=
 =?us-ascii?Q?BxPVY6o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GUkGu1nfv+jKk8876avIsuYkpaXpR+JN6S1WqsSfQ8I6nw+Ex3to8BhITtRr?=
 =?us-ascii?Q?jZgR8JKhjmvCbvOAklV50FfOaQAtZNB3LA+xN+DFpDUtX+4OhVP/3GKRI7/H?=
 =?us-ascii?Q?/4W0rSKC31MQDojOJFv9yyakHC2jRfXsS7B6hMfuXf6e2osiTJlW3e5Bbnqj?=
 =?us-ascii?Q?35lY+rKW4m/wqKYxGM6Cx30MhS91njm3dyG7H6YpL7307yP8s63MjV/IVNGJ?=
 =?us-ascii?Q?PmlmZKInmYCn7XN7aJPxGFuP2f7/5qoiDmU0qnHT3Jlb4JcKPTZJsMPRWBfH?=
 =?us-ascii?Q?JfqAaK2CCwmh7tYCDmNsad98QCheeAtt/9SrdpG8093N5yPwmNiIIovo5Ywu?=
 =?us-ascii?Q?+ir7LJv3sGP+Df8tnqe51jUroJ+Tdv8JGu2kH5FlVNURjsG3Y8zsIm2A1Abn?=
 =?us-ascii?Q?2rq6znhYSfD1C9EsdnW+mSLADcWtky061RaxMmJ3BaOhhnaAzuN1dfA7V86V?=
 =?us-ascii?Q?cxtTXqCbXAQ59yFXo2CEKMNZq8MGBaKfPNr6FjNABzCkR550SrVQLTPH3TgH?=
 =?us-ascii?Q?+Oah3UxoNzdF7+7yNc5dTpIw7ZJuIsouKfZNUb7GwRPewfXlIFjIGVDuZTQ4?=
 =?us-ascii?Q?y3oEGQN9JaWpoUHphhFpGfcCvCicFpjER0C066BFqp58XbcV65M/92ttCYIe?=
 =?us-ascii?Q?vxdi61ZYEDD11VZl3cYstZpJ5RIs64EMAjH3VFRCpEeXXbzgI3cUtT+x2jaY?=
 =?us-ascii?Q?VUglxrsPd7jga8dz/hGxjuF7UYjUDlArSuvhFiNW1YIeZhzJQH3wBPQPHBbn?=
 =?us-ascii?Q?HZ0gUiKbhVeTN/RrmsLzXlnZn+MnnxIggehsPx+i8e3YRogOfhW039wfrsgD?=
 =?us-ascii?Q?FCq17xhopECpjGaemcaVRKGC1hns3kiBqrEEdEtn/FyWgFppW9XASXjEPRE6?=
 =?us-ascii?Q?w6HvfQ8EN9jrSkykWLkK5mGhTWpDq5GC3DnRJTReVzYMvtOK1GVEbLky8KZp?=
 =?us-ascii?Q?wdJLlkz6WSaZcVb1Em8uLq9jH4y1sCMktcekOEKnVL2I6HYJlMfpccN3CMAx?=
 =?us-ascii?Q?osUhe/WnaiJmy2B2r3Bq1zkZvHZGEpd+R5Ec9K5V3olYtxZGjZz3w5FKkgQY?=
 =?us-ascii?Q?7aZZUdd1E8APXrJGsUq3By+DolaQJSLxd1u3q5MQll0wXc9dBGu+uIxyVFfA?=
 =?us-ascii?Q?GPfqrU2wgFwlM5YvsvoMZjUftOCOhKOLUWz9wrnBxvTAJrFejRUNQiRw/LZU?=
 =?us-ascii?Q?S8WX7YIUT85iGJFGbK0Ts53lwQd1pLRlR7eFWvQOW2f06vTAJxcBwYKcDBcn?=
 =?us-ascii?Q?9IEchWQnIPnZrfFzRDl/q61m5koM/WhUuKIunz5B7n2v1q2PXrUtU2AksSRh?=
 =?us-ascii?Q?iPG2MHeYTnk/YYmctqfPofGhq0NWUs4UFaLAADguMPKWGF2dBLc1kxU1NdC3?=
 =?us-ascii?Q?HqYGfL/sjYnl9JAQdGD2ic/JCSXNRrLr2XFT4EmFwfwM1l7tSLSGmUepSlTZ?=
 =?us-ascii?Q?+Ts+tkDIkEjzU01BlTpcZY2qVXWc2W1+xk9Vbt4szZcGRMRu7t6AfQz05q1I?=
 =?us-ascii?Q?ZTn5hYnQ8Aii894/5J9EJ1Al1tgsdlUTUslEgfxGUtJnutzKPx49ogN/fdSE?=
 =?us-ascii?Q?jlUG8gSMZ7Xdio0q0n39N3Bgn1F5EOt9j/lRgueNHLN4YeFnFHGdfzdDmsp1?=
 =?us-ascii?Q?+R+OzVuJt1MqPWOOr2HFf9g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 997042c5-1080-4063-0614-08dc86a86c45
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 04:15:10.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wxvjQW+uBlvC0N2R4j/TfMuxyxsTyoEZiKwjYLtN2tX96p6vcoVopaTAAz7it4ioF9JcnqEZtzr0iAQGr5swaXLtLNupCOxoJsyNe/ODvkMzy3tV6SC8uYkdQurhwe3/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8206
Message-ID-Hash: EXCRH23RPCZVMDMMXSA5RHZUSMBKUFA7
X-Message-ID-Hash: EXCRH23RPCZVMDMMXSA5RHZUSMBKUFA7
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXCRH23RPCZVMDMMXSA5RHZUSMBKUFA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Sound Card might need special trigger ordering which is based on
CPU/Codec connection. It is already supported on ASoC, but Simple Audio
Card / Audio Graph Card still not support it. Let's support it.

Cc: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/dt-bindings/sound/audio-graph.h | 21 ++++++++
 include/sound/simple_card_utils.h       |  4 ++
 sound/soc/generic/simple-card-utils.c   | 71 +++++++++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 include/dt-bindings/sound/audio-graph.h

diff --git a/include/dt-bindings/sound/audio-graph.h b/include/dt-bindings/sound/audio-graph.h
new file mode 100644
index 0000000000000..7679f1c1c12ae
--- /dev/null
+++ b/include/dt-bindings/sound/audio-graph.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * audio-graph.h
+ *
+ * Copyright (c) 2024 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+ */
+#ifndef __AUDIO_GRAPH_H
+#define __AUDIO_GRAPH_H
+
+/*
+ * used in
+ *	link-trigger-order
+ *	link-trigger-order-start
+ *	link-trigger-order-stop
+ */
+#define SND_SOC_TRIGGER_LINK		0
+#define SND_SOC_TRIGGER_COMPONENT	1
+#define SND_SOC_TRIGGER_DAI		2
+#define SND_SOC_TRIGGER_SIZE		3	/* shoud be last */
+
+#endif /* __AUDIO_GRAPH_H */
diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 0a6435ac5c5fe..3360d9eab068d 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -199,6 +199,10 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 
 void graph_util_parse_link_direction(struct device_node *np,
 				    bool *is_playback_only, bool *is_capture_only);
+void graph_util_parse_trigger_order(struct simple_util_priv *priv,
+				    struct device_node *np,
+				    enum snd_soc_trigger_order *trigger_start,
+				    enum snd_soc_trigger_order *trigger_stop);
 
 #ifdef DEBUG
 static inline void simple_util_debug_dai(struct simple_util_priv *priv,
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index dcd0569157cef..a18de86b3c882 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -4,6 +4,7 @@
 //
 // Copyright (c) 2016 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+#include <dt-bindings/sound/audio-graph.h>
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -1156,6 +1157,76 @@ void graph_util_parse_link_direction(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_link_direction);
 
+static enum snd_soc_trigger_order
+__graph_util_parse_trigger_order(struct simple_util_priv *priv,
+				 struct device_node *np,
+				 const char *prop)
+{
+	u32 val[SND_SOC_TRIGGER_SIZE];
+	int ret;
+
+	ret = of_property_read_u32_array(np, prop, val, SND_SOC_TRIGGER_SIZE);
+	if (ret == 0) {
+		struct device *dev = simple_priv_to_dev(priv);
+		u32 order =	(val[0] << 8) +
+			(val[1] << 4) +
+			(val[2]);
+
+		switch (order) {
+		case	(SND_SOC_TRIGGER_LINK		<< 8) +
+			(SND_SOC_TRIGGER_COMPONENT	<< 4) +
+			(SND_SOC_TRIGGER_DAI):
+			return SND_SOC_TRIGGER_ORDER_DEFAULT;
+
+		case	(SND_SOC_TRIGGER_LINK		<< 8) +
+			(SND_SOC_TRIGGER_DAI		<< 4) +
+			(SND_SOC_TRIGGER_COMPONENT):
+			return SND_SOC_TRIGGER_ORDER_LDC;
+
+		default:
+			dev_err(dev, "unsupported trigger order [0x%x]\n", order);
+		}
+	}
+
+	/* SND_SOC_TRIGGER_ORDER_MAX means error */
+	return SND_SOC_TRIGGER_ORDER_MAX;
+}
+
+void graph_util_parse_trigger_order(struct simple_util_priv *priv,
+				    struct device_node *np,
+				    enum snd_soc_trigger_order *trigger_start,
+				    enum snd_soc_trigger_order *trigger_stop)
+{
+	static enum snd_soc_trigger_order order;
+
+	/*
+	 * We can use it like below
+	 *
+	 * #include <dt-bindings/sound/audio-graph.h>
+	 *
+	 * link-trigger-order = <SND_SOC_TRIGGER_LINK
+	 *			 SND_SOC_TRIGGER_COMPONENT
+	 *			 SND_SOC_TRIGGER_DAI>;
+	 */
+
+	order = __graph_util_parse_trigger_order(priv, np, "link-trigger-order");
+	if (order < SND_SOC_TRIGGER_ORDER_MAX) {
+		*trigger_start = order;
+		*trigger_stop  = order;
+	}
+
+	order = __graph_util_parse_trigger_order(priv, np, "link-trigger-order-start");
+	if (order < SND_SOC_TRIGGER_ORDER_MAX)
+		*trigger_start = order;
+
+	order = __graph_util_parse_trigger_order(priv, np, "link-trigger-order-stop");
+	if (order < SND_SOC_TRIGGER_ORDER_MAX)
+		*trigger_stop  = order;
+
+	return;
+}
+EXPORT_SYMBOL_GPL(graph_util_parse_trigger_order);
+
 /* Module information */
 MODULE_AUTHOR("Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>");
 MODULE_DESCRIPTION("ALSA SoC Simple Card Utils");
-- 
2.43.0

