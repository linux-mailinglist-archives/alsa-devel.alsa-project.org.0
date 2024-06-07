Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7D8FFA60
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 06:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 337A2741;
	Fri,  7 Jun 2024 06:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 337A2741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717733962;
	bh=3IYvdSIn1bHF3gTOaEkSDmfhEioBu+Cnzhxp+Hnz2Ig=;
	h=To:From:Date:Subject:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Tby0Jpp+N/FzEDDm06V8cIbEskbfsiIgDpOMW2jB3QCstfiJ5liTfOi1XyzQ7JZOe
	 VagHcMFS5K4DBzZZdKbMzEHrMB7INEKRNEoDSzFYDsaOqvan5EHdqagQAkll4/K84o
	 PGHc9Ss1F4oHwTaP4TOKUKN94kAT7AT/mBX4RZ98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F01DEF80580; Fri,  7 Jun 2024 06:18:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD9AF80588;
	Fri,  7 Jun 2024 06:18:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FACFF80564; Fri,  7 Jun 2024 06:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9565F80154
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 06:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9565F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=d7PRwJrR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyTwoQYr5Uu/pHwDuKahA83gCQzTEdP3LbXb+b0tgwGhxuEMEiSrbc9d5xYTVxChxOOyvFTrr2RahFGPCZCeuMicc2rL94gQaCz0iiYS5rKgJHVVnYkRRX74ERl6L5DRPgoguYyVV0e9p2kMy9tbQkW8ge3nPWS0doUYHV0VopWeieK4jRWbsPBK1rWgioMT+3N8wfUS9ozICUCZg7Tx0GAadGhNLrjvCAxcsmFK3O9ABT4jz3mMuNjA8zdeIhzsUH0EgwL3V2FaRRi6OdzWwIQ4uyve84cvxAmwVna4JtTxss5dqF/W566MBTpc80tvgaAKuR5NztaVNDZOcyEo2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTCZ3TMRaf284JWEV/XJPB+77eSVITJBLzf1HJSbVlM=;
 b=lURSePAE5t+8rHFCSf8lJeoB45vpne8rudnPF+911nP0V5sVxL1Jtr7eFuuwxjL63msuKC5Ryva4nrs1jGT5oITHEl7qpLEOTCh+eTrOQxP1R7k9DSt0iZa3TW6AM7nE2ustw1G8NuhbtOKNUK/NwUMKKOdhLPWxky6SW2buDJ46Mee92QA1+cEZHt87UgD91OQ7rYhxy4OvskDxDHW2OHYurZ2DwFtaVU46XvzdLog0VOX06OUwIkTFnIT24K2Iqo5Kd0UzWKVjci/dz2VAURKJHZJ6ksKhdC06uaMnzQXSaPzTyVWKUQR/uZo6pnM24RIwLzSa9IIMNQaUt4pyfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTCZ3TMRaf284JWEV/XJPB+77eSVITJBLzf1HJSbVlM=;
 b=d7PRwJrRJO1dEXRKPOybQdzf098HqXhe+iGyGUYKQjChNuVyMrNtdnwhbaSVtUg6WohLbQUI7dRCwpur0gWySbic9q4aylcfAIRcQJXpFjfSvokJo+apLbBM1rXjK+DAga5vslmWEh8XUd5TvZvhgVEVlnDovtRJCmmkORT4ajc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8206.jpnprd01.prod.outlook.com
 (2603:1096:400:103::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 04:14:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 04:14:34 +0000
Message-ID: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 7 Jun 2024 13:07:58 +0900
Subject: [PATCH 0/5] ASoC: simple-card / audio-graph: 
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org,
 Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP286CA0169.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b44895c-c844-4aae-976f-08dc86a85639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|1800799015|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BzMZTWJalPgMacHP5jDMGlodbQGu6T1fM8hIQBSbfZSSkOHNnpeKwabpKmZc?=
 =?us-ascii?Q?CsKJ6AIVcaa+R0rxrSar0YAY6h1W6hruh0m+T69NFyO4GtvlSdYvm7A+4r+n?=
 =?us-ascii?Q?oL5uagEsSGv0T9YDla9agIjMqBiE/Yg4sxKgFRmSl9YdFFSicS0/u5NlSAh5?=
 =?us-ascii?Q?ioVwaVl8Ck/9HuKiUEc5uPZrTtKDIMaK3tDzNyPqVM4X4v/9DAQ6rdRQyudE?=
 =?us-ascii?Q?iYtqQB2nIypzfKaUwd6WvTRchXhOnJOfzNbVypCQergl+GCC4YwE8xeyEou5?=
 =?us-ascii?Q?+yRIWYZ7zR3/k2RWMfKcfnwEkECFqSWZ5ZEqnpIrJK8cD7f7T/WoapXSigfF?=
 =?us-ascii?Q?GtbGXtqaDLTd6Nv4Gkh4dBtnPb6f1DNO8m7EIgjDnG12SpfYYkVRv17LXOny?=
 =?us-ascii?Q?Z/KSjus0Hot+fQWP83Lr1PoUrKOo5UYsB2YPanurnpHspXYS1vWmpC8q8ZXO?=
 =?us-ascii?Q?faDmv3Ccvd4N31CEo30X6d64Sg/nQ+ovwPIrio2gGupXcY9xNYvT06JUzVGm?=
 =?us-ascii?Q?idq8oUe4qs6DO9UFYkQbulgEVngpcgprjP+xRpRWV8SWdyFB9m8V+xS2tIc4?=
 =?us-ascii?Q?Qf5JgfOqIimXlpjgcDij1zorOckjiwFlPGQyizvqLZfVDE3NVr8DBx70fidi?=
 =?us-ascii?Q?aQG0ZKDU8KzwguDx1/+RDq0u9efHTvneILpmbMGvmMJGsIxIMzqVrWhJfPDF?=
 =?us-ascii?Q?nzzVVkNu8kdvZn+kH+wlaQvwOL5IHSx8zdct3A4S/9r0sDXkQGRhlDZRNkDQ?=
 =?us-ascii?Q?5rQPc/jRuHH883xBXXF55ZaXukfN0UhGkmTJwKnJNghSbTL9+7759Jedyjot?=
 =?us-ascii?Q?X8W90h9+t9r2bYrlx7qBGKtJlcPa+Yo356vYdOnRu/0Gtxpv/6a9pnxZiiHZ?=
 =?us-ascii?Q?Mznyi0k2362il5CUmnDdl06F3CU6Ni5D/FbrWIAePwxAlgPZA42FuNCLMm7F?=
 =?us-ascii?Q?gwuNOE8vf9ZWKa0E7p0AM7tvbAZZ9iw9WGO4RwGREStk/rbe1zA91NKZoUJy?=
 =?us-ascii?Q?BKwQZGPQJTK8al7upWSBrI3XFu0qSgDUHK16sqUst7uTwmofrKqc9tT1iBHq?=
 =?us-ascii?Q?JlusZdRssWRRIVEFMqMABf3vlaN0UJ0PjVK9yLpe6QHQppfH2oxi2K363b/G?=
 =?us-ascii?Q?cmkKzJoAfK8tpJEAuz7RaEjYGjCNOv53Eulk9e5s1a21idu/JhJ5aafI3IlO?=
 =?us-ascii?Q?pbRgsNy/dzA3ran5Ty84DP3XFyf4ywOQefh0QITImuMGvslTjQn+zasPhlhU?=
 =?us-ascii?Q?Kq8fOkN8f+fQ3t+pPYI9poobKhu/6Bd/t+LUN9NDcIHNYXaTR32h0ez8OKLB?=
 =?us-ascii?Q?1sUi1Xi+cH/0N8OAsFuFX9BvI3kns73QT9jjzXRCB2EgdXYKej3jgSNBbux2?=
 =?us-ascii?Q?z/NaUj8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B5Pa5RuoNa4aVVx7qveWedJVKMdqUPe5JULMoEB9KYBnG633E9yb3vOgtDV1?=
 =?us-ascii?Q?pU8kiwwfp/ZFiBK9ebKVaGJSQpBSpG+uOv/NITyTSjAmPLnAA2sr47YT37OH?=
 =?us-ascii?Q?IsEJoqOKeRA610U3GFoPmX8kTw4Qj01natiDF6a5+X1sdELVEClJZhSRkLvZ?=
 =?us-ascii?Q?AeL2vscCiPAGqONsJ16cKT/mCEJGIWNx6QzwFsLpcbUBLy941mhUAP4FEjJj?=
 =?us-ascii?Q?rZ9H+3OU7uTvUU9958APrP3wbviyduCNQyIutvPQ/IeGAeP/tJ2RyjvQ5ROL?=
 =?us-ascii?Q?4KTbhAgiX6mMw0SOPzTvg+ypvZ2JJoQKzQm+y63Wq7MxyUBNJRXtlRXkSSdw?=
 =?us-ascii?Q?5rLamTxWin6M/xVFw06BSdpN0//CtylEGMwlam9XR+FncS2F76r3kgw6AfTA?=
 =?us-ascii?Q?vQc0pQoz6sg2Aqrad6p+IqEzn7cu0fh/BeIRu+aalnSbUJUmsPRKTF67mkH/?=
 =?us-ascii?Q?2uptzuLGYPnB9xi0XZKJbx8/VMAFtauDzuMxtc7LqtqckBrKWVRsfmHsjNxb?=
 =?us-ascii?Q?JOvX9juNV2AxB58boAghyI++ISZOVEUVW2YoJ6bu3kGcCUj3yMy6z4p8FeQN?=
 =?us-ascii?Q?alSN0y+fxCLyZO5ZNWKjum/CSWO5roHz3PfGBn6xy8ZGgRLn5NGPrAPBNb1b?=
 =?us-ascii?Q?+MXeRHAgOabLEcmIeup9pwuoyJuy3+8TEK9Os968YIMR77naSbBBHSR0tZTF?=
 =?us-ascii?Q?1JF8jU89oe0sI5NbJoAjPpZdtktd0mJ3obqfd7DL/7OusHFLI5D6ieb3wmcB?=
 =?us-ascii?Q?gnn5zk1VISSn4x4Wy6U33WcBGLCsi4UMGCXMov+ixUgJ2y9ItG67heKorZI/?=
 =?us-ascii?Q?M1e0vqqie9u+ziIKrh0R9FNEjBraCX+DFDngnF9CnWGxNCzJ0E7raAd8CLMq?=
 =?us-ascii?Q?pW/viYifkWZhAg06vHyAZGTv5bIfuSgijn85ZQnFqnlZx9vdlYH7KJ6hUFbY?=
 =?us-ascii?Q?o8swhnAjS9VPmbjB7XHC2l0kaVggEROxf2beznsZmsAKK+6oHum+EIYzp8Iq?=
 =?us-ascii?Q?72HmlOSItsK2J75vAi8AkobOg2KMFjAumsJ3vP0LYB7ho8MPelFZolZKhPyW?=
 =?us-ascii?Q?P8aMTC7PRRzx39GQ84kHRX+cURl646YwS47+tGd7oA14Xcus74c2peimQfPu?=
 =?us-ascii?Q?9eaJ76T3ekaRiBDwdeuQVFL28soqMLlrEtU8sShv9m4jVjn0fny5aEJJnesE?=
 =?us-ascii?Q?hVDWRxHuBfeezsQ5x3Z8jhj0GyIMnFpBDhWQcYObb57HRYxg8AYrimMWdT8O?=
 =?us-ascii?Q?AFGCF/wGMVSMxZ6R4ZNWwvUigqCSNa+3cvW0bSwtil0JIMGQZzrglkHAIpjq?=
 =?us-ascii?Q?tRuwbtBrHSXZ1rIMhGsbECKu4boFEj7UCw3FUWl1lwgBtUQi0oUG/GCSpu2a?=
 =?us-ascii?Q?7AvAyO7icVLa7tC8UwcC6Ua4RdRvVsDJB8/39tFLJpafEYwHANeiBRzNXMVc?=
 =?us-ascii?Q?sVXsPVk5sRLdEV4EhFr+NWMAcL9WfwFXLIbkdXFAVSdYDmyBNgng7iA/6vys?=
 =?us-ascii?Q?ZCBfcfVNhfBeQEXWC04yxAfjizw/14D1AwFEnXw+HAymb4LBAJRAPgwzA4zj?=
 =?us-ascii?Q?9sFV/DABFzgbh10FHaNm7OxGE+SSo/k9utjYCK6C95Zx1gNPIza/XEKE78+/?=
 =?us-ascii?Q?9RJkNpLYyzfK/VBrfsgzKqA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b44895c-c844-4aae-976f-08dc86a85639
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 04:14:33.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EZSmbBCfVaZZta9gTEVBgsNL1+h44Xk3ZdhN55E0aB4GY8Yv3DqZ17VU3CYaMyRWwt0CWD/x2Vc4HhRQab7oyGl6K4+vo+e7eJT85+nkNQOdDX03Ie3u0hSp9BBQUJoI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8206
Message-ID-Hash: 37DBUS73XMCTKVBENTA6JPW7PUBBLCPL
X-Message-ID-Hash: 37DBUS73XMCTKVBENTA6JPW7PUBBLCPL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37DBUS73XMCTKVBENTA6JPW7PUBBLCPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Rob, Krzysztof
Cc Kochetkov

This patch-set adds link-trigger-order to Simple-Card / Audio-Graph-Card.

Kuninori Morimoto (5):
  ASoC: audio-graph-port: add link-trigger-order
  ASoC: simple-card-utils: add link-trigger-order support
  ASoC: simple-audio-card: add link-trigger-order support
  ASoC: audio-graph-card: add link-trigger-order support
  ASoC: audio-graph-card2: add link-trigger-order support

 .../bindings/sound/audio-graph-port.yaml      |  9 +++
 include/dt-bindings/sound/audio-graph.h       | 21 ++++++
 include/sound/simple_card_utils.h             |  4 ++
 sound/soc/generic/audio-graph-card.c          | 13 ++++
 sound/soc/generic/audio-graph-card2.c         | 13 ++++
 sound/soc/generic/simple-card-utils.c         | 71 +++++++++++++++++++
 sound/soc/generic/simple-card.c               | 10 +++
 7 files changed, 141 insertions(+)
 create mode 100644 include/dt-bindings/sound/audio-graph.h

-- 
2.43.0

