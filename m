Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E2188D5AE
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 06:05:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2733E2BEA;
	Wed, 27 Mar 2024 06:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2733E2BEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711515936;
	bh=Qv5YXnyu1XLj8PaqfSAYexRJ1iJNALJfatNTu2ApyIs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nUWweVnU+DmymyoRQFdpBSal0ytn1YDPy18W6BvbLGBSZnzu9gJ5HjKja13T+LInQ
	 pQheEiHEO2JWY3H4EdWB6s2cZwDZnQt1C0rbxEGdUr73ljlH5YO40tb/00q1i8SoP1
	 sTruUJR1QB/xJ78uDcd7tfLN20bCvZBr167C+xU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26567F8055C; Wed, 27 Mar 2024 06:05:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B93A7F8055C;
	Wed, 27 Mar 2024 06:05:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB1BF8025F; Wed, 27 Mar 2024 06:04:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCDD9F80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 06:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCDD9F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p6Af8r5h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m++RfX8EmDdeLGjjgzRlD51MSt1/GPd75acSQc9l5p5gxcwERySfd7i6sOu9tmGMeQmCuPiTXOVTyU1h0vHY2KhTlqU0H/DECtuxDyK5QSVbvZQOYJoCoH664lBpoblb/NlYXK9VvonwV0nnSC1gUZCPvdxf6iYGL6yErh1JOANnvwGjNL0YX4aECjUfOOxMFjW+r1ZrHiNXUb8ZoIWHJKJ2HwZPRNnXwyOCuY3ErGJN+9qbmf1rfhBjV5CUS9sVd9eOwqwZ0BgIsYSEJHZrKrwrvXHkKAZaiV2HGIhW+ik2J9UaHT+JwM9Pnb1T8S+RZdwpPPz/YbwDBpH6RTuQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1b/tM1gGfG9ZkPn2KeaNHL8WTdc2otmrFfFIjST33k=;
 b=WpD+NmpymVgTqBTVV5JlsarYUr7SDyRcK5MZJyToXWyx5scqqj//LL6rVPCdc+ouEkGlGY/ItucnMNefM3igdEXCt/rZKMgWndfpOZ+9ns9s4II0rRUWdvHOM7H+08XOC2v1IFIG95dyEtavcOhSO8FC1B3MtiPNAc/Q9q5lWpF3TfsTcOgXyeuL6i/3XWT9s7IRy+pI34Al3ihlgH6KL4Cpu1QRbzmw6CgjrVDlWgVHqUkK+LsDWqMQ+0TijUl9du6rFCeM3Vpz2QidaZwvYGZnKTNAQykFaVjCN/nLprm4U4Qq5QP5PQnfzg+f+NYGOawdUQ1N6qbpQdqJmygipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1b/tM1gGfG9ZkPn2KeaNHL8WTdc2otmrFfFIjST33k=;
 b=p6Af8r5h4+lhNVtiDT/ZdlgfeL1dwSfXLascFR2ltm0I6WaDkwcy058phV5pP2Zslttj/nVIGL1Ud7ek21kgJTODdt1YeCACGjnYkV/ZlpfxKEKpaFYcXaQe2Lwnlx+mOxbUDoU3qCv3MO2w1cwJpEV3JqAxiXP6KMucs6zgb+k=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5746.jpnprd01.prod.outlook.com
 (2603:1096:604:be::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 05:04:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 27 Mar 2024
 05:04:37 +0000
Message-ID: <87le64clju.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Watts <contact@jookia.org>
Cc: alsa-devel@alsa-project.org
Subject: Re: How to add jack GPIOs to audio-graph-cards?
In-Reply-To: <ZgL8Cr1t5aUhrClM@titan>
References: <ZgL8Cr1t5aUhrClM@titan>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 27 Mar 2024 05:04:37 +0000
X-ClientProxiedBy: TY2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:404:a6::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5746:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	axYN83WgvkUOnHRLxGw6dVEiAEXUKj1oBBkVl24Bvc9I1YmNHDkh2kqkK+9aWT4SUPBXo7UrQa0kY0tuFRhslq4/WDqUk0ODnvjs4P/PEDXAA1evE9D4e7RGt0hg0ddghNEqKLp3YwA1HIqIDVhVbZCnpV9qw+msp3LKPMbtxLfZm7Q6PomwDcIwuZ0gobZCo5JsWFB/mYW+VFVy6Wa5yFkZlae+0hQVVh7jpm3PXvfVube/q4TESRSi2Z05Ldhp/++aV+DMEILdk25vDp6ou4zrmAHHDIAFSLJZsOJN4Bqr8ZIPOPdWhbdW9NpHtiny8iczEzusfgxtIXMufABoFtWKy8TWjGgPpurKaCSF0RNDFn9sd1FErEwPWzIgLRMg8FYLfPQo3tC7d5Pi9ownl2+32n+hlVTIA7wf0PIcnDumNPNPAsJmqyiD4mKJ7hBRGYCyrnVTlmN4cb/8GCOKDx6SEdMkO+YBuXJS5+BTe5LWGo3T7eaY6t2RBgpb1JVX8hUo7U8jiQd9eOLp04HL4RMva1YO1xXQUimFREhL1zMmZGpcSOMHXK122lkhV3Z4P1UFHAxwlW/q0BdTLivrs2JcSiopOL2dzV51quRqQoKSURKHcDIjtlESFL+57ztDLfvatgcsSegFVXVpGtFpmDJwPk+FDfzQ5QCDkuT+J9ryglXKQLqcgC+bXJy1XyxiIkhcTsSf9R9HI9mNXguxyF0XR2k475jhPLBlj2VyNz8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W++jmaVKGHvexi8pctXj9NA/IHd5/U5CItm5cX1+h0Zk5uYvKkKXd8iRtE0p?=
 =?us-ascii?Q?ZP2om6dqYBB1vLjQXPZzzlVhHsa1WGe5u2Li0DGLic9s3hCwm2pe0xRb8zfG?=
 =?us-ascii?Q?xJRVvi4ShoIYr9/mGXqDtVF+T0xeFJeDHa2DJbpn9m/63YaVuepdpKSJwimA?=
 =?us-ascii?Q?cMpt5EMSxIv1Bbw+Nv4X8DuXXDPDBk9wpOMu0cBl5i3cHgZbis7a8Zh7tnD+?=
 =?us-ascii?Q?Am/79ykPQ7OyDJQEbg0cBg8QMpIW87ulPIfPN2/ibQSkdUJkpTPbOMv71tz5?=
 =?us-ascii?Q?+Pi2l5HNwszaxdtpD0fM222xMCpu2gBY/V3alFjiMnifglD89kOpiIEs+kEp?=
 =?us-ascii?Q?7vBQSk9at9U/j25y7/inDsO7JkZkiTM8aVGF/vtPJClRJbjRGTDdwmzTzBKM?=
 =?us-ascii?Q?hqhJue/8yhtS1OmALBM4qjRAf9quknWldtBC+8tc27XmZ/H7QGJGiXl88WGq?=
 =?us-ascii?Q?IQATs2IMNlExj8/MpPjWPEdYQBxr3DH2rKTTUqSY9I/2qxz30Mwq7xqBPHo4?=
 =?us-ascii?Q?o2kUNAkubTFbShtuW0VTpRdTL0hmgq3C2AGy3LvWtRH+Ce9aRJoLcwgwkCUD?=
 =?us-ascii?Q?sGRKFe/27fC1KLeYMuKIF0HBBpaEF/EbqHrH1pAxeHqnI+OvkaUBv+tmfnaK?=
 =?us-ascii?Q?gbtyamefY9oMS9gCD/6WLGgkEZ2gO4KS3k1UXxXJguVNn+rkxQOT3x/2gkCH?=
 =?us-ascii?Q?dikc1xsea6fnvVo32JNqrUaKJY39hN21nVkXoW53HVZS51JOaHQOhjgp1tjx?=
 =?us-ascii?Q?C+eup/4USt0I+jr0jVSZ4gRvkvaozYz+Zk2myUHQbQiGwYt25LfADz/jCk6i?=
 =?us-ascii?Q?iF+qsGpkUyDx86vc4nqNMduko4Gf0q4k0ZFqbuKKa/tligtNdieXyJfxtJx1?=
 =?us-ascii?Q?QFoAJ7+s/OjYYm8rUC/2I9r778gB+a7wnXLuCMOudgHkBzmHaUMl15iaetDk?=
 =?us-ascii?Q?uK83V4q41BIt6yoMEO3LDlaTYqNK93bSx+zqiDTP44x+w3FoKeYlT52S7uyp?=
 =?us-ascii?Q?tawLXbEkSHU3MI//HMGQZDG7L78EfYe+mFMkEXPRbgBW2rYzuWc0ZLZgHcJ2?=
 =?us-ascii?Q?lR6FSiNLeF3H8K34ku+snSJM7poHv1XW0EKTXvCP/jhPGhzcVtVmim/ahnou?=
 =?us-ascii?Q?MI7dLh83NrtNqYBnqLvHUbScxrxtY7GgGjHbT3QhROOrI1VRy/gkb3LZfIgf?=
 =?us-ascii?Q?0Q4dDjgQolmc3rDeIGgGa+v/fFlYeFORHFAg66GjGlWk7OylXiptvX+uxXTQ?=
 =?us-ascii?Q?vSTzdEO/6P3whK5xESvg9pUFFhl3KWphXU0N2PNIWZNSZ3v6PqqTuacB1BGn?=
 =?us-ascii?Q?9YHy7SWKsafbIuaeXlQi58ZWoFlDi7wR3kNKjrah0BZFm6FKqdu+K/d6xkZs?=
 =?us-ascii?Q?+HM03V4hcHR+2B35pFyhMJ9gMWg/TDsnyzV2XOEWx+F9nMyh0gvXUJrfYcWA?=
 =?us-ascii?Q?4bo+HmLm/bun2crdmobwH6jSdwi2fJU+VvqsEXiVIOmGoyDwHc9IAU6+cerh?=
 =?us-ascii?Q?Ebf0purIDKPYxL06qsFHCNiQD1SbBKx+/MmWy6e3ExMbJJ2eDk8bsEPPoDBK?=
 =?us-ascii?Q?POtLqqCl/dj3Z7imsrTXeGAUbL1w5SuM3h3qNSTAS7EEkA/PqYm3QHpj2z/G?=
 =?us-ascii?Q?3sB38IdiK7JbRUtQhnL7BOo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a4f5c93-ccca-44bc-96f0-08dc4e1b66ca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 05:04:37.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MVbKJk8gy0uJj7xrGyNdbQhajOlpZDHhX++BTrzNwKSWDHL87mtUMfMo5edwlujam4q/ChxdtMmNNxkDo9M8/imcj7275p99PEHnTH5PpmESyxvSd3HaLBZNr1kmyzt9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5746
Message-ID-Hash: FO5M77DBRIAAO2NHNKN6EXMBSAKTQFKL
X-Message-ID-Hash: FO5M77DBRIAAO2NHNKN6EXMBSAKTQFKL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FO5M77DBRIAAO2NHNKN6EXMBSAKTQFKL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi John

> audio-graph-card's device tree schema indicates it supports the following:
> 
> - pa-gpios
> - hp-det-gpio
> - mic-det-gpio
> 
> But only implements pa-gpios.

I have never use x-gpio, but it seems below function handling hp-det / mic-det,
and ${LINUX}/sound/soc/fsl/fsl-asoc-card.c is only user of it.

	${LINUX}/sound/soc/generic/simple-card-utils.c :: simple_util_init_jack()


> audio-graph-card2 doesn't implement any of these but will still attempts to
> grab pa-gpios but never use it (possibly a bug?)
>
> When using audio graph cards, how are you intended to add detection GPIOs?
> Are there future plans to add a jacks { } section of some sort for this?

simple-card / audio-graph-card / audio-graph-card2 are similar,
and sharing data setting. But not all features are cross implemented.
No special rule exist, but if someone want to use it on, 1st user need to
implement it. But he/you can re-use existing function (on -utils.c), or just
copy-and-paste is enough (?)

# it seems card2 has "pa-gpios" implement on audio_graph2_parse_of() ?


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
