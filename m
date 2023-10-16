Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 045677C9CBA
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 02:47:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995A8850;
	Mon, 16 Oct 2023 02:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995A8850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697417264;
	bh=FxzCqK0+UB3pcWGfMsGzsVG3nu8bnZCOiMgyI3tw0H0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y9LgUxvMBQZLIoh7Y5eWHB4hzaZg7hhqmX85e8as9yVeNYDffVMQZmQ4sPZUZ5j38
	 H5TxSrZI0AKazkxgGLdxtF6B6pUrzwyuWBtXlftHleZoKt+MUsaA3kgxIfoXN0wRWR
	 5jg535cc7gcQEQU51LCd8C/YwSRrfEVdTe7ujZAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB473F800C9; Mon, 16 Oct 2023 02:46:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A6E7F8024E;
	Mon, 16 Oct 2023 02:46:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 959BCF8025F; Mon, 16 Oct 2023 02:46:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 506C6F800C9
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 02:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 506C6F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QKGxU1Oa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3NxZny5a5Jdvwd04jNjK4x3agw+8BTPc4H8LLqxliOs3iw5eNKZCJC7lVi+VQrCEOGukiZrt9yAS+G/YQxRduO4JryJRKvMa5fGrhfwaomZMWo6K0zXb3Cl7C9ChEV7D3rb8skjKFW9dc+EoFlLyf5zuYk8Hkkw31eYvAMUoCifnELRGC015ns9sJ3nrGu1sVVSaVsXW4bQMHJC1k8zSYZ9M5ZDeWtemjp+s+BV26Hz3J5sd5Z1SlqmnzGzcf39TacrHGuzqlHxo5eai9GVOfw8/nfR/n+4qalO2RRpEO5CFOlnBWPg41VvgCpbjDaDyQVWOD0d7QSfGa1BazkzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSEH7pA+S663yS9IDdsCJXQswfhpnqSP+5Vt0uYx7c8=;
 b=AF8qlo7aR7WpNZAZp8B80Lb5ZA6X66Gejz2bji5AtrP0+5o5K3eyI5MNAcgVSYrbngHTPhfPE9ViZfM/bfTMhex0jneUnN4LOHIWmpB+6ZhMCR5+iwo7fM8MizGeQ6m7hyovUbXfQ5s2lxAzIRqYjHPOGnl3hzNL0b0D4gDSegfM+yQzIta8HUVB2aFt32D4erIdWA7KFzVJUlZ5Egd5dKiJ4PrxmIlzOvT2yQaSwRiHFLw1uH7vTB8E4X1Vvsxg3E7EFCTaZzMRo+ZwTLfrUvcCUbqY/t9XOSw1k4C+EpiSFlJ72Ntwme1W98maaaQkk5bgKVvcGh4fdRdG/UiQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSEH7pA+S663yS9IDdsCJXQswfhpnqSP+5Vt0uYx7c8=;
 b=QKGxU1OaPvf734tnzntxxIrX2ZHfYqDs3OcIq7oLROwr0HEG9aGptRgQzVZOSaZOjkwzEfg7dh0XAYGC09uk7W+Nz1emgdYuLdk37dhbyYX/HF5wQoT7WMkI19xQncgUTRLjzGtQV5k8xLqEXFnzf0XBeD2auzA2pJuPRH+IWoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11837.jpnprd01.prod.outlook.com (2603:1096:604:23a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 00:46:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 00:46:29 +0000
Message-ID: <874jirxul6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
In-Reply-To: <20231013-planner-irate-8e411cc54a48@spud>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
	<871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
	<20231012-storage-directory-548905001d10@spud>
	<87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
	<ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
	<20231013-planner-irate-8e411cc54a48@spud>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Oct 2023 00:46:29 +0000
X-ClientProxiedBy: TYCP301CA0068.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11837:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1f1dbe-ca5f-45ec-3498-08dbcde155fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kpwKO2vpcWQ6viZPdVXN1jBomcQZKbiHAS02N0OWs4hKTsEvt2oerBEdUeMmhJ4MK7iz6+I+MEIX4lHVUXU/g40M7kxhXWJwWi30sJy+Ot5nz5MhjhihGPJJCAZJaQ1fxeCLRBIouKHwybO5yb76jgCcGs2rezMt/HwFNmjWgBq/uaE2UyIbVN73qQJJwaQT4M1EX2B/wK4hGv9czraaB0sLt9GMMECU8KEultAq2oX6xreA+Kj+HyjzADL8oFfRKxDpgkWWIZRfC1gxpc7kwY8xDz/yt/ga7GEm6OLIH3vHbNJ7zONIE59N8FGwbJQxkqs2dZaH9UKeCSYuI69pGW9o0/rNw3CGSxis/219YNe+9lMCODk1tgqe4vyulzO5w/emEHJnMiLV1j1b7TEyCA1IXXmqtWkwC3tssKfu5l4I4h6GbxjljMhDTa74DX3MsSn+y1unRMdwhRaXWXK6jtqSjKlmKpQK5hClvBROhvCNbTqzQMOIP8/Bt4yfDO5q0J2IkDkeTg/gSIoN/UyGVSKLQw6v6DFDYw5FW07ErJXMbZdDxTrZ+BB8KOXf9VMAp/8MbtYDPDFTw6UfYBdgM0faK4WhyeIxZmEojWmXnXowrlINIqXlp8nMnnyvb6XOp/5c+N/gTAv+lNP60DfKMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6512007)(2616005)(26005)(6506007)(52116002)(41300700001)(7416002)(5660300002)(4326008)(8676002)(4744005)(2906002)(478600001)(6486002)(8936002)(316002)(66946007)(66556008)(54906003)(6916009)(66476007)(2013699003)(38100700002)(86362001)(36756003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0EcNMdrMJ8Ih3pYYZbuQQcay3VluG24FwF//bqEVwevgblpl6guLP2elD5Kj?=
 =?us-ascii?Q?HUsHLSAJq6OVXz+tC3IZCr1krViRMtTE5EV5jSymhW3W/w/4fLQVp2GfD8gQ?=
 =?us-ascii?Q?79C3Ut0MUMkwMu6d5cYsl1I/5Zrr92nxZsues4lv2zl7TB9GcGnv+Zjaj9ph?=
 =?us-ascii?Q?9Sdt7HTYUAFTSEQYnAJi3AlQVBtKCm4kXpe3UqkrAo2W42hgQ2Tftqyz99T5?=
 =?us-ascii?Q?CG52QRl1/0HF6A03QjOVafrZIwlTsPdsuY4cbRc5lqQZL6IaL5iTj9ApeNXN?=
 =?us-ascii?Q?JRxbDK8O2FRuTHx6fdE7j2jZiPmns4RsSI+F1SZfQHBiYS2DOJZcxnfeMlXS?=
 =?us-ascii?Q?wypkw+VhBSlQ4SN2A+BPHBjNFaNTAhX5uV0U2gZLFjuT8iHuuuGUNDqkLX/Q?=
 =?us-ascii?Q?IL+OWJZbtGL6r97WEWdL16qaPALlHNxdLDNIn5Ysc1yFLmRfmigV3xu40EnF?=
 =?us-ascii?Q?03Z/K1pCwhX0dbGozpOgemay15jhx1m5VEr2xM4aZoOD97etXKEV6/poC5yF?=
 =?us-ascii?Q?jZnX5B8sVD0jqp6yW68LDnCflYRi9vIHYjEF6SKPBoJKIxolSq75uBuQE3WK?=
 =?us-ascii?Q?QQjx5+YpzWWdbSEzcuey3YD7vTwvbiLi8R4V6YigeHXXH1DlnjOWOFK/hxBY?=
 =?us-ascii?Q?xsLhWVOnRePAQs8zTfG5tkpYCxv/+URxMHU7jj1yTfLJ9EECK43X8aYiR2rA?=
 =?us-ascii?Q?I7xPb0qhhspEB1a0ZzgnXKUvyR4Tt0qlqEu0jYmwHaJAeRAKweFMJ5hygEH7?=
 =?us-ascii?Q?04V7i7wwfjZTTa6ka4GFAY3YJeSOMWmPKZUOIJS439bBiS4mbst62U6xOela?=
 =?us-ascii?Q?KK7TDWXS/D89IuhC2SwhK1uPEHDnZZFQw4gCzZhx0+ZWYitj1Yr4ixVAicpP?=
 =?us-ascii?Q?MkNP3wpw8F3WrnI9hqGObTCAH59ilit7fy7GGhrQeX2ilHtRoC+eo6Lool7u?=
 =?us-ascii?Q?DZ1Moje0ipXCX4/dg0zGpoTvtnalfCZbbrS1V+c9P3NzoUhujm/A1H9bpegP?=
 =?us-ascii?Q?KcsqXX3SmdsEVNJaRToGBbrCLfv1SLtC8PQC7K7fmptL+SO5NCyQ4SnzZRQP?=
 =?us-ascii?Q?apCpwGxMIQGL3iJh+Ptj/Iy+Amfz/ZzRvG8TV+HnlxA7wQCIti0t8bmRQZYg?=
 =?us-ascii?Q?IZ5eYJVfhI4IZJvZXE7RVGJtLrhcCu1JpnegXvvfKByrReu5P7aT+CVN6/R6?=
 =?us-ascii?Q?UcjltB2uKnWoZuxtPPWn9ext6wHDEhIupkKmgI4QGydms7sbnXlIf/TSNxPl?=
 =?us-ascii?Q?/06lcM+FpEKgFkSW8TUASzEXfqC6oP5yVXf+ajeN0l8w8LlLlPsEWOM/7k1y?=
 =?us-ascii?Q?3CsDVdsf7Eo03ubyVZugKM/vmvgMu+2VZNX57Rw1k1akbUC0q3o/ReTCmyeW?=
 =?us-ascii?Q?TRav8s60eHN7SrXLO6EVOOfjMeUPNlVqvcNr+DoQCj/vUm3KWjvJ8X2/M8Hc?=
 =?us-ascii?Q?966M+Cb8C64gr9MW+33x0q2YAUmMRo2cBpupgo9nhy00s4wZ9cUup/BI6QZw?=
 =?us-ascii?Q?cvT+1Bb0UZvcX8c9RL6NMMVzXZNrn2EWdYPvjweZgkFX2WhcA/IKN16S28N3?=
 =?us-ascii?Q?SrQJlRu+hsT0i2mbFUgLI5uXxhHownvaroKgG+Rd/OWrnio8LDvxFifX/Ol6?=
 =?us-ascii?Q?z4+ZG/AHKsw2fnE2v54hKgw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc1f1dbe-ca5f-45ec-3498-08dbcde155fa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 00:46:29.8394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CTl9Q+1a2J9q/hkVrcL+Y53mMfAdn7RSE6FbZfKrMdigLZdyBPzRPpMmD7qHXCJ+OiqSkmszJzbF2mkZmKihX1CgH5xA5iB3EyC2X8O+9AfKQ8rrh1/98796qs15s9sq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11837
Message-ID-Hash: DET4BM5PNNMW4LU3K724QZQYBYOA4YET
X-Message-ID-Hash: DET4BM5PNNMW4LU3K724QZQYBYOA4YET
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DET4BM5PNNMW4LU3K724QZQYBYOA4YET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Conor

> > Some of this explanation needs to go into the binding - someone reading
> > the binding should really be able to figure out what numbers to put in
> > there without looking at the code.
> 
> Absolutely :)

Indeed :) will do in v4

> > > ch-maps = <0 0 1> means, 
> > > 	cpu0 <-> codec0
> > > 	cpu1 <-> codec0
> > > 	cpu2 <-> codec1
> 
> What happens when you want to convey that codec0 & codec1 are both
> connected to cpu0 & codec2 is connected to cpu1?
> How would that be described in a DT?
> Or is that not something anyone would even want to do?

In such case, ch-maps is from codec. it will be like below.
It is judged by number of cpu vs codec. [PATCH 3/4] has both case sample.

	cpu >= codec : CPU   base
	cpu <  codec : Codec base

	ch-maps = <0 0 1>
	codec0 <-> cpu0
	codec1 <-> cpu0
	codec2 <-> cpu1

Thank you for your help !!

Best regards
---
Kuninori Morimoto
