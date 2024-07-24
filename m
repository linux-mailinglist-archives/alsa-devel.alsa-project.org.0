Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA3D93AB06
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 04:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18A10DFA;
	Wed, 24 Jul 2024 04:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18A10DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721787370;
	bh=cLWMZRDqE+Q/R/djT3tCoHzvylIUnJIs5l8JXbWNQgg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=avMe8qdD6L3bVDABqyzDp+uuzHEChLD/uxZtEY7vGceldOpzeHu7b+MzxAFJIsCtt
	 21zyBx4xKPedKcSChONoEwvR2x9gMn46U9BD3vwC6047kjE6pE+vkBw4S4dJd9qFFl
	 kL4THXmzVjAEj9dI6Acd20KmweM0Ux/2FZl46rzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 606BFF805C1; Wed, 24 Jul 2024 04:15:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C2FBF805AE;
	Wed, 24 Jul 2024 04:15:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 344EBF800C9; Wed, 24 Jul 2024 04:05:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 008A5F800C9
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 03:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 008A5F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YYdw87Si
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgupBMKO3rGUzIiRm3axedhdNZZ5LbBcTg5MzPyVpnuZ0hH81ha69X8x1A9yXT6Qf8z2x6B4NQn6Gru3E9bAmPi2BL5fH1GzhPYUzsvtiTmXG4m3Sz4830HoVzFFZcAvSfOniXL0aalfaHs2uTVVKABK7OHLkfnuPFi73wC/mZjUqnof5w1KyYEg1WR1VhoosddT/TQIZq7XX0ijyguFC4xlkpeXBvW07wr+ErSRj/sTirfD40lpfYACyRBRDo3HkwUySzz71JTU1EAvnjRk1/y7PHXLfPgknO3njaP3fORVCpuZ6lzlt8JCtmi2a0zsFX+UL4xS3Tx6xuFvT0Iz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLWMZRDqE+Q/R/djT3tCoHzvylIUnJIs5l8JXbWNQgg=;
 b=WyJBohtfIdYgPg2D1XFguSBo34AQHOjIEtp1/5NDglW5Q+ez/KDMp21LSgWBQtp7pj+S3CG3bgN+Nvx5VpFlJidD7ZltOR5bKm09+tdDbmObbjLaEpdLkTde1cNeMLqvkGd5Xnyb4OXENUgZ9YyqeEo8NsqDF/Q16YYmgWoz2FTBLaCFAFezaNgmDmDNZQ08WT53MMxzBTnPgjyQwjn3oOl61Kh1cQgXpohubSmsBWLB+k5hQ9AIIWS/Loqi2FrcOer5mFraQb3r9Vli1podPdUXqKnKQ0j0+yqh4DZ8dEOFEBmaTPwjCFTiqlO1z/0hxzxn8ngCDnwmbzRb6yOh+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLWMZRDqE+Q/R/djT3tCoHzvylIUnJIs5l8JXbWNQgg=;
 b=YYdw87Si/mHauIAagFfePeEOgAFFJFWzsAda5Azd3RahO/Ofwl0LFR+O/8IBNyA3+yPkgf3v9N0Sts19+kGY9DAdELWbyyG9bOGUPoUSC0ICUNpz8CJNTpUW6fC0/PP7rW9Z5VT1UdnjZ5DtVbf+hSySLum+77J/0sMNXodzuqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10388.jpnprd01.prod.outlook.com
 (2603:1096:604:1f8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 24 Jul
 2024 01:59:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 01:59:06 +0000
Message-ID: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: [RFC v2 00/xx] ALSA: ALSA: add snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Jul 2024 01:59:06 +0000
X-ClientProxiedBy: OS0PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:604:24::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10388:EE_
X-MS-Office365-Filtering-Correlation-Id: 984615de-222a-4534-dcc6-08dcab843334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8c1hma8RQoIOvhmQf3jdYFTlzdeZvB/ClEZJG6rAEdH3E/iQmg/BCFlqac+r?=
 =?us-ascii?Q?+3LYPbbsNTB61PpY9fGwYsUI6XOTIiSgeJpKGogKFQZ9uD+MVVQ1c/0hDfJP?=
 =?us-ascii?Q?SDTskQD7P/2g2RbSQRve5x5GAAeT/oCX9abs6QH+cOuVguZ/AX7dZbKHqIyq?=
 =?us-ascii?Q?5SSTkwy19mUFUIe6MsddHj8G3USHiUMXoanD2EmuqunWA0TcCh1CbXxUirlS?=
 =?us-ascii?Q?wBHNTCZ6r1Q6eTwi+zCtyat5cA7qdokbqyqR/TdZy2ONxgn7GQc3z2x0rFXY?=
 =?us-ascii?Q?549vezIbZmwI7rA3J/HbfPlSTbsXpFcfptrI781vZcqf23hlCCKzUfrjNN8e?=
 =?us-ascii?Q?fgiIAuJSDeMtxFVWK9As0+F/3xDYzSGlN+Ts8lzrExKhUN8EATSUVgHkkIRI?=
 =?us-ascii?Q?2QmjUNtYBllyiiudfLux9G6iD2SVb1Nrd6Bk0inDU5iagXokFVxG4tKbAgYW?=
 =?us-ascii?Q?taTOxE2qVj3vHPoBdJOagDnfcNtyHhQ92EzaQtzki5pYGUp3Vil9XsO+hwi7?=
 =?us-ascii?Q?Uu6jYyywyQ9MGQOb1lqPZrahoh9wo1fer5DzET5KNWFFFdXkCQtiy1YLELv+?=
 =?us-ascii?Q?iZdZy4mpzreERT14VS9Ti+H19v75hS/bIPIa+LPP1SKJ9NUaqQzFS3NTNZ5E?=
 =?us-ascii?Q?ojCje2sFYuR6UjVirjF8kZv2vnDeT8TXQqhmeoXpl7agY3pe1Z2SsUd3jVdS?=
 =?us-ascii?Q?pnrCBRGd7mUkTEp6x6Ab7EgDtFbeFVK4HrKRslR9fF4jEZHWJWYOk5JslraC?=
 =?us-ascii?Q?NKqW1SXoeIYCwUdnHB13Z1oDkHQL8RvEZpekuDSMQA4D9jE7Zr1GHAq0kgQV?=
 =?us-ascii?Q?DWIHTc1OBLDRKZTenji31VNYk2FB2ctoiflxK7/h5zP4uquOq0fjoC0ICYxx?=
 =?us-ascii?Q?7Yqzgz720Uic++M8px/YgFtnf+5oWfCWJ4jeT6KAXhZ4cvTAZDX8eZThnpFV?=
 =?us-ascii?Q?aNEdI2tkhykI+jdMKY0vlunhze5hioXDkkTbF+1xdH1V5gvpaU6+CSlZlW+I?=
 =?us-ascii?Q?orH7HLz7He0E7SpdVdv7hGpICPnI559FAR7p35OrKQSMKhDDbotFzl34O2Hi?=
 =?us-ascii?Q?KbWt8CQvtGVJ/UbpFtAi8IdFz4bkIt9tuc1OmXfq3Hri13UMlhfpVgOgEywB?=
 =?us-ascii?Q?OmcHBUBZ5z6UqYHxemX97P9LDQ04CxEcHDqC0ZzXqGPiCb1V2BHpq/dk3OKR?=
 =?us-ascii?Q?39hLJEkE07ldc7wsGjgukhzQBYw+3WPyOT7p406izJvhD5ZjIuGg7fziQ2QZ?=
 =?us-ascii?Q?yigwbOiS4cLXwSBd2ST7nu4UhrtON26R/ml9lCJ5f1MIB2A/t1jCgt3qHs32?=
 =?us-ascii?Q?zuIJmbEOhOO2uL7ZxZsi1MWjjYrfO5ZbWNhnhh9oOA3IZbAb7kfvgVrZqoDw?=
 =?us-ascii?Q?VwlMtMA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?THEJoDaevdpGFTMyVXslmAjfhP73FC1Na9GRIgNnHo417SU0yNTqhtMEIfIh?=
 =?us-ascii?Q?mnaanKvnJyWx43TcJtHrosyrHz8575mZIKmyKFL/43FoA/IWJ+f5qeG9K3Hb?=
 =?us-ascii?Q?H0VNirklMU6lRARosSsAnOQZORySJIc9REFpESljWZNoDR/kxaB6a5q7CaYz?=
 =?us-ascii?Q?lP5QqfAbo2AEgfRLx0BcJjXcOVPAHh0iYt5USTYEooH+g+az1iLcEHPpP5S/?=
 =?us-ascii?Q?XrSO27hPqkpinkXd2eMHedRxfWmYTiHY7eoqGlBGdYVBxzLAHs6taP0R2oaD?=
 =?us-ascii?Q?i21RF/MadrF5yokiGKSs8H4kFb0dXVZnPtq05YZUPUY6Y5MMz50hWlSBpMzS?=
 =?us-ascii?Q?3++ToAML7kUy30+sRg6fWYg3R/GP7OIdCvKbjpFuIvDCmV0XPKJxXP3SwBDw?=
 =?us-ascii?Q?yIuAYxB6A/Qk5R2qVb/dczzacvvenWOkT8e6WGv0Rc1Asq7WavKKcd14Ie3J?=
 =?us-ascii?Q?opqopC/FddxOjwEQC8tKdlOh5hIfk/pXGbf2ffzbBC0+wVE+OshjkZGiDKXj?=
 =?us-ascii?Q?EnVKY7O3WwqUXD7hGb6IV+mh2y553mapzr5Z66C1bmpCAA1s5nTU6M5JfsnG?=
 =?us-ascii?Q?zc5n6fp9xHbcAAP9lYzf3ftC8G4SSgAaOG26fFXrkESFO+ECJ7xc/0yZMXUd?=
 =?us-ascii?Q?sBZPjL/pY6/Oq1+MtQfZymZsYjdgZKxiqIL6f/Zc+snDQW4hz/8xUITkD8+g?=
 =?us-ascii?Q?kAa6LMhWUcnxRn8PhQxaAKl3EAkZ9uH6oJ+uWOWnm5/WBAqcT46uv+QrNv8f?=
 =?us-ascii?Q?K0613K2IOO3YektRDekreYlfrl+T4vbT7HrxVqtEJH19ovyeVtCy8F+KPx6O?=
 =?us-ascii?Q?JcQBZfUxt3UIB7XzFV2SrA+S86uA1QYmwgRv581Ycg4OJ2aBGcVgDRzKLFfS?=
 =?us-ascii?Q?6HEeweJxv+DRo7Q+jH2ur8Vn+4XoX3Iu3w/9cXT6dCXyMo2QBBBDl823pOO/?=
 =?us-ascii?Q?xRj6fuw2KtHwsFVs6A65Uoz+ZSf6e4rvNgx+MSwtdsWz9pXOAIqOk3Jq1oci?=
 =?us-ascii?Q?Zq5DBbpTXt5G3ImQ0lgplaP0/u3czIFXTNs0MzhLYyfMHRImmxVvsyFcrKsE?=
 =?us-ascii?Q?Qg4mFjxdXzOLXyMVQZKn/l1Nh3DHXhtI0klE+GCulDZH/jTwNU/OlY8Ab5ER?=
 =?us-ascii?Q?TW+zkVGp7t9CmpnTzT+EHtI1620O86VUTO+3cMPXZWRtjXbXs3B3alyEN15i?=
 =?us-ascii?Q?yO/EE1vboJh3x8LKzbMPAOwwd18z3SKFtdilQDkA2Cg5CWYYC/bCHeKGhuxN?=
 =?us-ascii?Q?sOKlKgBwfjl7DD/Y20DavJiyoDlqxCuEcqeAVk8cyxWjjr9WrxfB85pNUYxx?=
 =?us-ascii?Q?iLU7Xm0p6/NK1cehbl1UzNIj47ha6ZL97PLuiTMISZ1Flqsis9ZaVnPpQMw6?=
 =?us-ascii?Q?WpWcrySyE2lgk5Qz5CTSNNQJM/fw4JXu/anTZ7Gt7Uvo36qwp2PZ3Y7AX1vn?=
 =?us-ascii?Q?GdBODzKXL5wdcgvR1VsVpmwduGtg6GP2Qp4M9ZcrtYi8Ay/oSfuJB0uQeZMZ?=
 =?us-ascii?Q?myXYt5895n6kjd2K6QFPXLvfePZnHBx2hdvTa3BUn1mQDR+OsK/+qVCgg1eG?=
 =?us-ascii?Q?PbYqJZb/Ux/r05K11Oiln2q6hocgeAnHVrTLOZChj77kp9LAdKP/RJHeS1Ds?=
 =?us-ascii?Q?3434bY0vqrfOYJcW+U9gTJI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 984615de-222a-4534-dcc6-08dcab843334
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 01:59:06.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GBW05zTZBvecFSiq6mOp9l9hQnUxF8M4GXRBG//yd0F3jKEhQHXz4taHKdVF5vLA5wnZauYuWLZfOeTftIFf94SUA6krzEklh7YkksTVQXIaGffGDSq590+DgeAeOfxE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10388
Message-ID-Hash: AH6A5MZDVYSKS4O4SZIZRYFJBLEAMHN2
X-Message-ID-Hash: AH6A5MZDVYSKS4O4SZIZRYFJBLEAMHN2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AH6A5MZDVYSKS4O4SZIZRYFJBLEAMHN2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Iwai-san, Mark
Cc Sakamoto-san, Amadeusz, Pierre-Louis

It seems we can use _Generic() more simply, v2 RFC is using it.
I'm not 100% sure but unfortunately we can't use bit-field with _Generic()
in gcc (clang seems possible to handle it ?).
pci/ac97 is the only user of bit-field direction.

To avoid posting patch-bomb, I will post main patch and some sample patches
as RFC. Please review it.

Link: https://lore.kernel.org/r/87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com

Thank you for your help !!

Best regards
---
Kuninori Morimoto
