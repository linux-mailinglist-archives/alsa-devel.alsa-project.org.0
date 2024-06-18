Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9769A90C04A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 02:16:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA93D93A;
	Tue, 18 Jun 2024 02:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA93D93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718669787;
	bh=dJH6/30mLkZq2KNcKS4pM+E8NRciAJleNXjEwMSojJY=;
	h=To:Cc:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jzGVDxWoKuyA4iVKW2qvvzU1Xmfk+ptKJ8u50f5+frFIgX3vyUDFZTj4k4mpwLyBD
	 HDLAfhiTeYiCPjLEebxQMgHmYWTTP/tCdtPy4SMT7ecovM+iMEtKlfnYYVYW+/nIwn
	 Z1KRgcmD6KytEyconRkT58XjP+xlyjjLH8kO0VXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ED44F80686; Tue, 18 Jun 2024 02:14:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C80F80687;
	Tue, 18 Jun 2024 02:14:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96855F80587; Tue, 18 Jun 2024 02:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 526EEF8016E
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 02:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 526EEF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fm8B+FUZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzPWm2k1upBaEHd2QM2M5Ltk5yW5l9B+uTIUCwuiZ/EG0BahHBgyUJcm6pdQJuO3ssFD2tcZSanYFcyhgriGzK0mdKHbPXhzHmXXIQYsMnZhcC+sWuLBlelGTjvITTcW5hRnm1ZjI791GskDeHScyzntK4XeNQvlRZzV3+O3SzCJ6WmkK04I86KnjPAFPYJls8jFVvp8wJNRVMVizs2sO/49dpUrGrCfcT12TUGm7EY6HNasvMSmHMcFq+CLtciqYf+JcCEydz2oV2qyVspyZoI5f3SaWuWA6sE8k/2L9A9e1/NbI6ddMzikcVSaFrZMNQWos1Fet2Fm+IqyMitxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj6Pj1UF5drDNi21/4FtmB6b43c7Z1RbYdAZDB5iqu4=;
 b=bqTX+7PSmf8LazOwbLFAwvW2r/o0aD+lPJPcsWrm0ss+Z10lGzxddhdCIxTkDZSHps/XA1JEX1FISp+sVOMsqjXk+XrW93nUQIwXhyJAiCYBkOGtyTB1XVlH9tWqkvOGJgZggTBamltcPsNi3YjGJ+76ijNL1vyFp5qLNY/2ns3+fm6dWjkj45TNtk2/mZujMgcF/UXR3ASZ35kyQ2SIy/780KNt/qJhQuxDRK1n45I2ixlRFUC/zRPB3l0iwldDrbKMgbxDwfIgSB+DWwaHCYbN+ttP0yCVA2pRkaBzt/0Rsqm0LiQGbcJZADziuOOohOjuqG4vXvCp+uYci99D+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj6Pj1UF5drDNi21/4FtmB6b43c7Z1RbYdAZDB5iqu4=;
 b=fm8B+FUZvzXLrKHSMEJW9U/RZC/6VF/PU2t7UTuqNSB27DunJ4CMDTGChJB0tjcuCOys27pmsjDxZmP8S+fRvhEkf+or/LsjlKsGe8AcAuFPDGdVA4w81wRPfm6A8WL201X3XxPKI8B9H8en6LLmH38f8UOSg55wu9uwbyvUdX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5821.jpnprd01.prod.outlook.com
 (2603:1096:400:40::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 00:10:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:10:15 +0000
Message-ID: <87jzin3yc8.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: audio-graph-card2: add support for aux
 devices
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Jun 2024 00:10:15 +0000
X-ClientProxiedBy: TYCP286CA0217.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d748f6-97ca-44b0-6451-08dc8f2b0786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HbLA0CqXCDFGUZZPzFL+NSmrjESBqHDIjcSPPnWaptyeVWp7gP3lrmSM0tYS?=
 =?us-ascii?Q?3ER2lwyz1mGkSIhvAdDvC8sZtWmNOYjiBuQcFpvPJ0zbGcNY/0+OC2vn77qK?=
 =?us-ascii?Q?TKwo8ZlPsGrlbKsqkBMkJgr8KQyNoUnXcXq4K30cr5KuUrBUz2DBrIewXiNx?=
 =?us-ascii?Q?4FSB0O4A1pTctquumq/GpSEocwVJxsTq9GJFglZsj2pSRAMCjqjOv6xICU5J?=
 =?us-ascii?Q?FwFFpUlNhjgX5MFITLCdFoI3S1h+Mfq6JUazUIxXCPELDKvC+j8hpwbpbieQ?=
 =?us-ascii?Q?6Zom+mlsKaCR67CHzAzBYafbcdeVmOQzjXbr7DD17y7iVXfOo2Kh2ROAuwDB?=
 =?us-ascii?Q?HIELkBlfMf+/g4HFUDv2mEyHN/zvAip49OpVzYzyaoxPeLwm89SJ/+MmY+nh?=
 =?us-ascii?Q?cdidVOQGyOpIEaaMlCHli0pnhquafFSll+qIL+HBbBNIje6jb5PMG4b3OsiP?=
 =?us-ascii?Q?CJVWt5b4emZT4L0mXFqO6rLq33WghKQ8BU87T5xkvzI9W6XDRBF+f5wN5K9p?=
 =?us-ascii?Q?IIL9UiKrtXgZOW98krI9UkjK0Z/t0Qsk7AXhjx3wh8SDYnEXcAm8nhtVBWR0?=
 =?us-ascii?Q?z2Ge05uG+9OQkNoqqqDy6wDM/qYWNEDbdFGY1585zDfUAdeXMsr3D63ijkN/?=
 =?us-ascii?Q?JSOh8CQ43+j8I+Il2Ys/WxGvd7ZX9Ses9HAoPdyAQlfBpDJ2LePxrUkupcZv?=
 =?us-ascii?Q?GW5nYGdG2xLLtRA7D1GzScb2Kedfgqlkl54vGsoFtqgCqx/O+8sE2xg5ft94?=
 =?us-ascii?Q?yfOIDGVzhwGHb9KiHQa3iDyvhrwpI1E7ZVECeluusLAeviL3Tt0P29XtQXHL?=
 =?us-ascii?Q?E9O/MrEgRBpJmE5UBXwPZfEk0P2gmemq0otASniPbJRy13uM3FWIm+0JkZp3?=
 =?us-ascii?Q?5Dz+jwagndqKZ2W488PkNHF9Sar1ViDJh8EttAoBhdAYVPChzrpcrsS7rNTO?=
 =?us-ascii?Q?rZJq0MyBhdJpJ3H0tjAWhoQJxOnjmyVYmFUpAptLvhHIRAVa4eQNl7YM1tbL?=
 =?us-ascii?Q?OluAua13ENzS9ZxX3TxMHeQHfssHnnPKSp+PvwPi5nJGOhNkXFoF6KZsaHBB?=
 =?us-ascii?Q?TZDvEuiPrsC5iS06we6uD6wGCeCenY0n17/mWr18ZC917QML03itTAmrzP5u?=
 =?us-ascii?Q?RzLKiRBHV+xOgKpe2MrRs8OaYHutkvEjXWezMLoRFOgfl6N9gQlRbHQLRS/+?=
 =?us-ascii?Q?migETa7D6PU95GM0GaNTbofvkmKh4gIwYOGBZMdh07ZTK/IzGeQg+cpEtxGA?=
 =?us-ascii?Q?zDqesHD5vJLH9fctv6Z7Yy/GScU7eA86hiaUNhYupI+3thNjYrNgKDV+NTjQ?=
 =?us-ascii?Q?2O4u3H2tzujstNYUZVjvs5ieDvD293S3W1TCtZEfPNGg3bDR0rVUCuqHBD9w?=
 =?us-ascii?Q?ZmVOjD4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N0JY6sjqF9Czvs7zBJkT5WOYB+8VW+8xhYW3pRhfVCD4R5nzv3ePBbWoDcHz?=
 =?us-ascii?Q?PI79vZBDtK+cDNiBvFgVKjJBgnMCXkReH27RrSQfqxEJ8hvFKgDPF7JEDYi6?=
 =?us-ascii?Q?f3gQNI1ZuNqer83rGdJRXqBeu7Seeb0/Tr9wgUeYcJcbRxPZ2jP7b9rz3ARX?=
 =?us-ascii?Q?VqBBQ4U1mRt2a2gvuN1qFiYvR/QvD8theVQXG09SmQV3Ug1Tp1QDEJJ++11o?=
 =?us-ascii?Q?wQcgu5Jyvb/EG6JrHmd8tSYEdPT8yQQs5DjL4OyChIgxqqeGSjcUcNDrBr1L?=
 =?us-ascii?Q?uHsF5PGMhxl8s4Dl2c8y83fQHWarNsfp7y4x+mIM2oysKjjIPQxfyJNt9RuS?=
 =?us-ascii?Q?i0Ky6NfJ/xU/JQinmgneBVoL+bQJ4mZSjwLZoi+L0RM2XY6qsODJAsaQiM19?=
 =?us-ascii?Q?wHh7AxeTge7m9k0zjoqjg1LGUxveoUUbVaNdg93NhXQw3RsOC1HshKsIPij3?=
 =?us-ascii?Q?8jDRPW8XseziOH5f8/Cq+6ehSFUjmrz8sW1qHvd+O4wXukvG/GPLfOP1sg2z?=
 =?us-ascii?Q?L9F/T4/9SJEEsf6vduuRzQaOxpq5qv8F97bWkX3IkQy77qqCvYr6Yf4xwvOI?=
 =?us-ascii?Q?104HwI6FUWZoxxE75Pu5AfYPzIlL/2cjT7khEb2432HgQV8DnQLeoL/Mghs4?=
 =?us-ascii?Q?/THZCyUjH8FPGR2gQBlsSpnlZDSRVErlg5UWFy+cwbZQIzzU4Qcsc5pxtjrf?=
 =?us-ascii?Q?CYNjAEqDdM4yFXYitjxhVCKLic3V9ocgePxluebpNaXE+Iv2OPw2HpqhEuTs?=
 =?us-ascii?Q?LPo/Mb07MFHMMi/QVSdGGbfYmysfLFf3iNav3Wu0ZE48auMxPcmqxj+YbCXu?=
 =?us-ascii?Q?CifmBmIA1Y6yPFn2e8+RR8M1fvhsoSVH7+q6C32ETXO0+duWg+TFiuoRU38P?=
 =?us-ascii?Q?KCtyv58QGHkpuri6mvrSV4XQcrVVwcXjN1fVLkm1EFBDcUxBmxYCHUIxKWKU?=
 =?us-ascii?Q?TO6ouV7TzUfxMd103Xtjz6oSjwSNoOoqXseKh0g6TFiX4e1uy6tDJ42nC16p?=
 =?us-ascii?Q?YBiyBAO6o+RcdeL8XsiUBp05YJgIYagD4PUw0txmAp5wKxQbbSVOjyKZuY7v?=
 =?us-ascii?Q?k+okqiJsdlG1C452v9UvyAuebyc2UA7KcniL+XCrmXUWk/bLLYd+Oh1DVx+4?=
 =?us-ascii?Q?lZXRL68x1A7YtYIQsj0+aMW9WZoEsbjB1ibV9ojldx2J4QWhyxTiluMmajeS?=
 =?us-ascii?Q?iOb8UBlBDjqw8iqecvv+WAIoEN6JFgmlIMY2c9VAl3Nhs8ngciHWsTuRrJbG?=
 =?us-ascii?Q?If8gCxf3HEGSFumeaxMhX7yCuAFo6r28hROzTW9HA/kVubA5LrFozxrW8v6N?=
 =?us-ascii?Q?NK5W5XEmPqHZf8XqyCkrFNSF9MFfJowZGNz0fuHASX3UHQ3fkBRia9e47P38?=
 =?us-ascii?Q?layoB+WYCybe2JG8tGT2kYJbEMhnDZPwsnZh1/SVKIr39KRX6yRHsY13bQro?=
 =?us-ascii?Q?59rccrnnvXbuYYAAhq9eyS4+erWTUFm+g7J8usGNRROV9jUL07iq7wZCF6SJ?=
 =?us-ascii?Q?wX3ukXDjkGbpFXM1+rFjjtYoKgEx3Jb9EIg/YTKiZ4HJ9N5HwPlhgKLiTbKV?=
 =?us-ascii?Q?4MNyM7SMkVLv3ci6DGBEGWBmlO1tQ/pwhGOlUqD7MzsRyfDm36Sa5CPRS4is?=
 =?us-ascii?Q?g/AFN6MUFikRk9LdWRRb+ps=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 26d748f6-97ca-44b0-6451-08dc8f2b0786
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:10:15.3376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NshHVC9b07Vi38E7bFWLZdKC+WP/enRCs98k8D9RMSOFMXxkBgpYhufD7BNQ6KGsuj7+ItxI093KVRUBEjvlm1ZkEXlDKjL20/f7XbRDxWtDMSDoBJ5st9z1cAvSCjVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5821
Message-ID-Hash: RTNLKS5D2MMNVCNFPXRDLMZ2K6A43ORT
X-Message-ID-Hash: RTNLKS5D2MMNVCNFPXRDLMZ2K6A43ORT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTNLKS5D2MMNVCNFPXRDLMZ2K6A43ORT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree property to define auxiliary devices to be added to
Audio Graph Card which is already supported on Simle Card.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index d3ce4de449d5..f943f90d8b15 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -23,6 +23,11 @@ properties:
       Each entry is a pair of strings, the first being the
       connection's sink, the second being the connection's source.
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+  aux-devs:
+    description: |
+      List of phandles pointing to auxiliary devices, such
+      as amplifiers, to be added to the sound card.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
   multi:
     type: object
     description: Multi-CPU/Codec node
-- 
2.43.0

