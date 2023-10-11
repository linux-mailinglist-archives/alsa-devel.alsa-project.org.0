Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910937C49AB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 08:11:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C304BED9;
	Wed, 11 Oct 2023 08:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C304BED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697004706;
	bh=BOLdIJ/Fip/PEJJJvOlFNNyBsje+s9TibGBPzOy42hk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YK/LqmLfUT1G7RzD8rqGYY0ZtiOLzIekhjUTJkEdPB5JwIAhZHCgcjmC8gScCntX3
	 pRjE/k4fcWrZIxihJbQe51nnl87EdXCj5qPKgjActja2og2nz186ajsTrGsADGhNdC
	 c6rtATymUM+laoR4nanJmx4meSGW3xHOAp7JpUUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7A50F80587; Wed, 11 Oct 2023 08:10:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55A79F80587;
	Wed, 11 Oct 2023 08:10:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B10F8027B; Wed, 11 Oct 2023 08:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A5E7F802BE
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 08:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A5E7F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=b3FYrrdF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFsfdb0W2Y8es2WkevtlzfKZTbDrGAfobEeLazwjjAPK0W9tR2DjG6k+o0nOPcvUnG8wRu/NOCv+v5ESjdI3P2evL6/VE09NY0LIZ3lgV/FcWAQGZSUdTVCWIJEgclPHrmnzH6L/HW0iNr/hsYvPycGhH59KW01zGDHhIGtkJ1oJ6FM+KjhYsSRa6oXWea+cVTPDGG3uROm+I5SHb9JA2IncR7+RBIOJD1Do45J/Bj4POF0O6yNlRM/fBlk0nQ3szggL820ElLQfTshDCSdl3atXlm9l0N+WJOMcGBGocturV9S4+q6PCI55rosC8W3Dko9MxXAVt/5qD1mnrlUYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16eRbcEEF4Pv62QIAJanjPk/HuWs6btyR8KiEUjXu+0=;
 b=VV4TMC1FtCbHs0Job/e1R59hPkLJqM+bBr/KRUcIwahKJyIxqs4QPn6tFmlBdV6nDubRRy0Dz6vjVtkcpchfvBnvfOrSea+luWrEdpeETCJ8ZWP8/3ZCboFkHS1HvPLjWusCMy8qt4KQ0nCWA3Fx8927SsNp3VMB/rjA1q0O7MtEhAOgV3xDyM2V//U+WFTX81uCX4uSAT/SaAMqK43LEsl7mYhS81IHIb4zKQDQR8vbKEGODTNKuyIBRM73CAkVZPy53M83LE/LEV5Ov7KrCjP2+TAt4T2JXW5QFeMlP/QBrAK/JGXvz2gzFU0SD96y8t+z1M/lt/25B8MAqCoNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16eRbcEEF4Pv62QIAJanjPk/HuWs6btyR8KiEUjXu+0=;
 b=b3FYrrdFsf72y6gQh2QmMDpl5msKJAjBsxhK356bI+a3GSyCFnLwcpRN8ZrFrgC1RfG+J4O9wpRjPx4qwmzHKiQqhTnt4MIolAUnb4p4OL69MbdjXEVUAFZbRTVz2UXgmyJ7H9tr/hPUWzTrKYYfEK9TagU7IaPhUzHm3ikW0FU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11514.jpnprd01.prod.outlook.com (2603:1096:400:377::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.40; Wed, 11 Oct
 2023 06:03:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 06:03:39 +0000
Message-ID: <87h6mx1yrp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
In-Reply-To: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
References: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/4] dt-bindings: audio-graph-port: ch_maps property
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Oct 2023 06:03:38 +0000
X-ClientProxiedBy: TYCP286CA0211.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11514:EE_
X-MS-Office365-Filtering-Correlation-Id: fe62a808-55af-42e7-1186-08dbca1fd053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wdtQ3py4BEx7KlXaj3wzcqbDzdOEfxvVIWpEIhtMYsLOiLP7wpEHnXGHbDdU2hYVTbuEj/bB9mbxStK0V66gN0+zKP6q5chkN9RwxM8a58h0p17yWHJT5TASd59x7lso9T6NfLsDp+OkavgX9kdUaHqBURC1AToFbt8h5bjOaYdSgKOpcWFQt05lYcIG84XJHbqGAcKIMV1UByqbtPT+1ffJOKD6ZQiHC1WCYxTi50/7U8FRBpjp3FdNw9OwTPt7Eo00/I0yhoU1i9GgVE7IhhZvi+Sh9gt6JV8d3WTJwLQ5azQxbTIVTLHOtkqL7RpZOpQMQM63usCjn6FqyL59ULsWtW7hwNzWeDc4DDVa4GijY5Qt3scChsaXkhRTvkN6C3g4CkMEOv1KkMYVBa7qT+ZNUuzzlGm05R6tayYNmNlGiVFVbrpPotX7PCp5BR1V945GAq/6CNTX3zz+mbXom4mpXo3Kmz/z8M6dgweB/zrK2ARK1diw9ZTRISN95MW/NRP4mFz63bwJBTfUHOLMauHQ8u0QvzQOPzaY1MaQK8vbajX2npbNIk6IvFoU9JT+7jrWR2wr0x9Kwo2VQudOm6w+b5190XTspI/x8c6f0jAPPeIzdErUnib5ffL4F0nMyzkQxJDxm4+QREPA3rOp1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(52116002)(6512007)(478600001)(2013699003)(86362001)(38350700002)(36756003)(38100700002)(2616005)(4744005)(2906002)(6506007)(26005)(6486002)(8676002)(4326008)(8936002)(316002)(41300700001)(66476007)(66946007)(110136005)(66556008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K4nQBwcIYkobZr+SNTK5sxGOlESUtgS36OCE+chS8ZXwFVjf66t7xK5JD/iM?=
 =?us-ascii?Q?Gndl6OxaoePNMgGyXIXIjTrrnaoPsqiBsMdgXtOq4GIWTQNLbIOWJihrVTJe?=
 =?us-ascii?Q?IEJlj4bjYckVjc3moa5Tn1IvND8zTu4hF1CN09MzzKu/YZQeZpVgSh3AZEjG?=
 =?us-ascii?Q?rGLo4IVeqtRGQbbJLGQA/m3gJpjZZbLnbcbEvlOKwmukHTMVRYZCJbGnLDdR?=
 =?us-ascii?Q?gvjT/nfveFY7l6cJ0dE0+8Jr4ZE4aQ2SaRiKO65Yk2fhDYvZ/21vQCu0SBvS?=
 =?us-ascii?Q?ziXQOv8kV2YY7nbZoPRw/mSN5tUXaTt2n3rfBfqzWBZoGeHx9/+OPIywKdlc?=
 =?us-ascii?Q?Zv8ZDPdfehROlsgCRhpLxDDlf6UrwyWMOUV8FF0N5B9ovQN7+gQQEC/YTK/c?=
 =?us-ascii?Q?2iF0fWN9unjWkZv4TsX2EcHrBaV2zgnXhAWQ723XBRWN0U2niXLS6ntrFel2?=
 =?us-ascii?Q?X7Y9Z+uSUnHVhPMDcxuaiZNbfZZBxknbBXvgrIs5IHNlKN9CRp9Jg9epRPrv?=
 =?us-ascii?Q?ZoCb3zRCMj9DHCYOBY9XjzvzUl1/6YCXO/1exrz/iMKP/uiFFRM+Qk+ABbEw?=
 =?us-ascii?Q?Y0nmaKjWUtiILyLOrE3HB10/58QrisCCt30bJGxE4CHK9qWyYtq8nmRSITPQ?=
 =?us-ascii?Q?ijeA4JgcaboueoyFjG2K46oj2blEm5P4xB8a55Kz16fwkvqxQevtET00WilZ?=
 =?us-ascii?Q?OFyYeTIzYBvtQ9/cykF6hH1Nrge/rttesqt3OY2m6YorTm4EDcjK3V/9CMmX?=
 =?us-ascii?Q?B0Llfr3hJr+0EwA4u27nLp39DftaLVdlcFu/8J3P20fcoqerEiioVfgzFcWj?=
 =?us-ascii?Q?DgOdt0XUY3Hh5SZD+gn/oSfqlurcXozBirloOM3nBmZ33/XNHEfTb1r/kINj?=
 =?us-ascii?Q?aNRSCBHZV/i3hJLnt8V99KoJiWuHdAUYteTWZ+4U9uDjHQwXHK6u+QeXCYQI?=
 =?us-ascii?Q?L64kyimKoWSfrO7yz3IY4TwEIQ0wE9wixl61LCQRgZMs27FyvBTUC8Bo7pgD?=
 =?us-ascii?Q?J5jL8gpSFCGS1EjFj3Y2EIOizNLiNe64rUyUgcKUXCjn0DUnNZHYtCBAzHB7?=
 =?us-ascii?Q?Dv7DXHCCoo5bLf1+SAoz/A5Ra8rNaBI/axmVw2PkkiOLlphEc/JA0l2GIoQa?=
 =?us-ascii?Q?NzFuJ0DIyppNrNfRrPaCPx+emmIlkgN1R6UBUXxhTvngx80cke79VP67Ky4A?=
 =?us-ascii?Q?n99f23D9UCJHOvKyPJWUCdwCVUAk+c/2P+l8yyOSYbMXzkF+s4VLk1SRWJYs?=
 =?us-ascii?Q?tvy+vkZAsQoDlSZpe80i5P5I1UhRkyJeDdEDx/Ax52LR4RaAZYnrXqcZVV1m?=
 =?us-ascii?Q?vVb9gRqSRdAAl+7ismUeuIiD8URcrt2rnjdFPu/c6P9/SxNcEvzFzmJ7OlPu?=
 =?us-ascii?Q?k5Sbc0F28rN13IAJSqGsEnUQc2z9sygELPMxNrvmPxHFhPA/89Kyck9W3L+a?=
 =?us-ascii?Q?m3Zs22YDnW0KffsSRYUJAorwCRQhS7mApeYCcBL7qeOMWLCVu5juIhmYpSCx?=
 =?us-ascii?Q?xNoP+9nygX9YXGkbbSqNppi1xm7fXsoMlLuxnrJiQKscnmKQX8CBxPLC+TSw?=
 =?us-ascii?Q?4Eg0QGr9AgQ5R31XzEaz4BDP3+3L1cuI5OoF93lfSijuFtftJ19j/EYxeTTW?=
 =?us-ascii?Q?hLOmwod0YyUVAueiGwNNVHE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe62a808-55af-42e7-1186-08dbca1fd053
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:03:39.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GO6rK6tNCGbhfYHj55SecNb3Gh1/80A6xsJYlMvoakPYeD6f0HZYWB+sSqBO3vd/cv/LBMuvT4uJT+03giJdYbFzuR/D8t6I61pbQVLSC2VdvX6Mn21t7TAMViCbtSfr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11514
Message-ID-Hash: NUV2PBXQX2T3PDI3R27UTJVFQOO6LREZ
X-Message-ID-Hash: NUV2PBXQX2T3PDI3R27UTJVFQOO6LREZ
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NUV2PBXQX2T3PDI3R27UTJVFQOO6LREZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds ch_maps property to enable handling CPU:Codec = N:M
connection.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 60b5e3fd1115..dc663af784fd 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -19,6 +19,8 @@ definitions:
     properties:
       mclk-fs:
         $ref: simple-card.yaml#/definitions/mclk-fs
+      ch_maps:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
 
   endpoint-base:
     allOf:
-- 
2.25.1

