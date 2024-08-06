Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2594875B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 04:10:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDADA4DDC;
	Tue,  6 Aug 2024 04:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDADA4DDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722910210;
	bh=8kv1J0QjJMJqINW72PpUbdUzKIMA0xLJAy6NsfHIuXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VKiXpdPjqrkOo6CYKJ56EPaGsLSBa3GTH01KmcE5hAb+v/N6oz6Ry0de5N6fU7rID
	 UthO1TKT4j3h0YiWJOtw1djG4+sKOy6I8QLfP9U9iBA5fMYrl7GgbcsA1z1dfxPRRu
	 hZ8qgVP3g58E7A2Tn6bKAmYhtyytDgbtixJRVlfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D30F2F805B1; Tue,  6 Aug 2024 04:09:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12853F805AF;
	Tue,  6 Aug 2024 04:09:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCDC3F802DB; Tue,  6 Aug 2024 03:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E74F3F800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 03:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E74F3F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iyprtXOC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFAn4t/ZFRZvJ3K7DSzZQjZmxfpDubs0WqJKcOQkzRdRz3E7iSB8lqVg5KHvVVDn8bBeDWZ2TyR64+l7k7qlRBe38GjTuUeGAFtujDMXM1Tba0Ccm1rJqMays/gAJ7ZfZATHKWLbJAnF1h8qKWZnIz+KDgvvX+V5sCj6a87CaKnog0YI/yDJK4gpVEF+RG0D8Ui0FKt9DdRV/2HsLV6rfqkxe6D3BcrwTTgT1l5C9nHGNkmJ/fMuODau8bmhpoZqU5X5W60qgy4kVFOOn9diCtAsOo/nLv+UboWMis0Z4URarbBzubhOXJ/fc9YEBkf8vlnbF/WhEhF9E9RVlqv93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxxE1Z81tIvu6JPGbhYv080NU0zRLRcF7hSqGld+e+o=;
 b=Y0H5SN7yocqnpB/P7KIGHAacSu/rirhj+kLDm2RAbo2bs1/v5ea3ZHwM/tJ2TcrLlL8ngxhbSxB7pT68BDGhYyHA/b8c6TrUFoI3mg9ZdluyeflL6WlaW/MRx+foWc3whUrPc6BVECSLawlyZbbhqj0xdxQXWNXri+s2wWnPDowXdTY8AFg+oBXZtvK776YLUn0U8o9EG0THiMrtvfbVKrDurL0/jbYzVVkyAjcIhbWhp8Wf9wOnNH8RfXp3lIuV73Z4fsTDbcmwElvv7VY12j1CQtgj95M75cFdnf8lWvNOlRkitMYMoR62IOL6ncHpViuyZw2xN5tFMMBzJRtSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxxE1Z81tIvu6JPGbhYv080NU0zRLRcF7hSqGld+e+o=;
 b=iyprtXOC1o0Zi4JBpK+r+xdrkluj1CAEQI0f+zNh5sGY2DU4jVcNt5dEw8WjeRTYmmBnC3wpl+vhuBoZ15sR9U3mN57nTSCbrNl0QCnVlaIw+h8g3fYFee826vyIgOn/d+vLzIAnE26EWjBqSZDiXYNSiDIAcVcJBj9aSiKjMuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9759.jpnprd01.prod.outlook.com
 (2603:1096:400:235::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 01:55:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 01:55:53 +0000
Message-ID: <87seviwh1z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: remove bespoke trigger support
In-Reply-To: <4f85d952-7468-4b4f-9b33-d82474e7461e@sirena.org.uk>
References: <8734nrll6x.wl-kuninori.morimoto.gx@renesas.com>
	<4f85d952-7468-4b4f-9b33-d82474e7461e@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 6 Aug 2024 01:55:53 +0000
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: e7653fc3-3cee-40e8-0770-08dcb5bae76a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jz6cedEi2yK7HCgW9JMxCotwkCVE0KrsBGNZZCw+LLbpqW4vINkVaVcIMIa0?=
 =?us-ascii?Q?WaubyDY+9EztRl5neL/M7cADLywIqMZH1pVN3k6WC+P9kL3TtKozO/Ivo15l?=
 =?us-ascii?Q?rd/LmLgHmkuJ2KccInEn0FL9hfdRwG6ZYjti3QofL9IXNpzzf4RR3sxXdGBa?=
 =?us-ascii?Q?mieKjjN49j3AFYaBIMgLc4wFUaewYTwyFesG0Yqt7qUI4GyuWRtL+fFPcwEl?=
 =?us-ascii?Q?2HbFAt8zDH+zBzNAXYwFci00IRak/47PwDfuAgzEJenULjEqGdG6oNiSqhIu?=
 =?us-ascii?Q?Sz9tVUvWiRy7tN3Wh9+0UnFw/ehE57ZLGBY1Cfew0x/cXM16iw5G4gJj4R2B?=
 =?us-ascii?Q?ab9mRr9Hwuzv+97Az4kjZNTFPWysS2aqFs+YNHWTI7lmnnWUIJQuzWI5Eb1Y?=
 =?us-ascii?Q?a/fX/v9rMP9TgMok6CMXF5bsHHg99qK7FyR4W3ids/tDJhTD4PWH9oA5EWcv?=
 =?us-ascii?Q?P17eQMaQlIf8Jui6pQjRecB/u2M6eqB//yK04tLE8VpGU9AOsEpFdZRXLVqj?=
 =?us-ascii?Q?FYHfu8ep1HgRcK7St1x6RwJkwYRm5nofTizLYW9b/0vvQtz1oVdjHutoSbEm?=
 =?us-ascii?Q?X9LZZWkvcDAhS08Lfw0+LnGXLOdd162m+DWK13Sd2SmLyrjFGiGJCTG56rxG?=
 =?us-ascii?Q?SNhMAm6bDc9AZNwVCoLeu9+LIQQeN2m6445uI2kpYb2ytszO8lPzJRawLam/?=
 =?us-ascii?Q?htqthjxbFlXXvahzemo0e+QKw+gOdrA9tFSff8wzRh5QVgKemZ+sc+fKhunJ?=
 =?us-ascii?Q?JDJoYSapGOmnrMoum+S+wlxeDpt5rJJDTAsY2EPwUC6R2KV1quJ/+XEVLuJa?=
 =?us-ascii?Q?j+766O78YroPtvTxFx+8NFH7GqwXoeIe4yr2USRsB8qNgYp/ig3gsMiu48Kt?=
 =?us-ascii?Q?uf/wHMNAMwBfVo7LscKVWo5ep+50kBVcqKdB4LpgRtEad5hcobjnqd/o941K?=
 =?us-ascii?Q?HhYMYYAuEY1fLAkFfvVY03NUt/aDnUnEt8qxlxL5yMNMYpDShUteLICraExh?=
 =?us-ascii?Q?2QF10Or51K6AHvFcSG2qE9EC2nwsznW1bjNJh0cyztdj3oP0ghahCPSZd7gn?=
 =?us-ascii?Q?TJYty7JDKhrfFIkUzEuUWicbebIxVGYpgjZfwbZj1+Sk4FOwV+m84qrtkxRl?=
 =?us-ascii?Q?7n2JMBpx8f86z8mEoZjl8VmdL5DqM7Gs9nok1w1DniZGgck8TYf78s9A50u1?=
 =?us-ascii?Q?sg44sEJW5DqxciL2Q3rT4Fvvh1C15SpgmvaE+v+ADr0KmDtgVD6lWoF4LgPw?=
 =?us-ascii?Q?PpqP0JxdJuQrZ1+4FPOFddNc5zdYQg9m3UyQ5R48+7mmwt2yTCDhvhTt3Dfl?=
 =?us-ascii?Q?phoaLd2j03AcrY9Cb6Pv7i56R4PpFGp3/jZnS0pDw04XiK6fzHvB8p6vSmHi?=
 =?us-ascii?Q?b/5K3rd1uBm4U8k1efNyOz3tuWkkeXzWGwU175VaYVp9Q/e3Fw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PXcwshOv5Y+2rA1TenGltqae3YIrTP5f6cFB2DWr1nGbJtA6Yqf/PP1GRl8w?=
 =?us-ascii?Q?mx9ny2sottJ6xlGNTMplD4fVnpNgkcUBcxH/tAjncke1G2aoBLb7lBt/yTH9?=
 =?us-ascii?Q?SsSiQfKyBI5fcKH9xoKbJmns2uZjptW/6+j8TJbFTmjCqQFFN5KNtP0O5jI7?=
 =?us-ascii?Q?TLOyfPVKEBN9Db0l1PrINHVr1JWw8b/CK+1A1FsxnA0OTD7DQzpVcYrgxoZb?=
 =?us-ascii?Q?OS9pvxu+KzQg1orpbm0chkn1LhAamD+k7N8o6VxuMqBEhESnqfii0/ULKlGB?=
 =?us-ascii?Q?ow1QG0FPZyMWOG1vYArXG6LAqygaZU8CkLc0RCyMZ3gmYvCwkc5I8HTW9N/K?=
 =?us-ascii?Q?9JwpBdsl41jBHpyzwWe1RHaqBmkSjuR1i3um3crVB/UNUiX/YNb0u0z1Xji2?=
 =?us-ascii?Q?g6IUeUHLN8FOFF221gVmF+JtoPgjcwa/DEfYdcJN9dFdHcYqyco8rRLNBnhh?=
 =?us-ascii?Q?FaPZz0hDY6Lexk+941EbR3xfedMgGmOSjeX0NBIO60c9F+nDwMOwxZI0/CZT?=
 =?us-ascii?Q?tAGIn2gcpUhM1wS10B47nyM6IzWNqkpH2fSW1ltNESHIglO20ywoOnD8DE/f?=
 =?us-ascii?Q?bX/dHvVXmDQtKsyHbdENE5a6gk6emRSKfDeUYOVlNxfhqnDiXRz1T488AfaP?=
 =?us-ascii?Q?xvEZI+2YKap4TzqWO4S7RbFUZE6RkNMuPXJWH4W6NQ55O8bfWovVTeyDX2zq?=
 =?us-ascii?Q?Ya9ACIv4MZPow+y/bTJT78/yqmSXRBLrhIjf/Cko+qLt5nn+J8t9/W4y85a/?=
 =?us-ascii?Q?BgkVGlnrDCK4koV8YXlqLmQDuiIILKt5yOa6uSfFHYuiuRl0VYnARSs6LBb7?=
 =?us-ascii?Q?tTkDB9480zITtTDomcJosHyexGGj3Sfm8HoypinEs4gfPcdrkoNpbDDZ2on4?=
 =?us-ascii?Q?pGB9b2LnvLot8Z8Clnvx/QDovgKOmytXQHaHXUpV0FjpR64/9PdfZJDxrhhy?=
 =?us-ascii?Q?DDrF1kV726rE+v06s2t2OzMIxCYPIa+Djzjt58TejmpNVWG3xnZ8DG1nUJ1Q?=
 =?us-ascii?Q?Tr0VYWn99z18bmQsEmXDfQtsk8xKDGCWBMVSrkcLd6MV3GgtbDeJv0ggSEeq?=
 =?us-ascii?Q?x6qPRo5Q6mJIzTOODGZj7DC06lY2naQdMr5U/2krxbAEyJosqjYYxgg7d9SE?=
 =?us-ascii?Q?HVSxZhiWP1goHaP55mSmC+uXg/hqetz2eKS+S0HOGSWx1Mik+zmKmsBd7Cso?=
 =?us-ascii?Q?COWPllonzMrKWhlrQVgqLLPraw9CZkVw/PWnmJBaj+CtW9wahF3+kjK/lbTA?=
 =?us-ascii?Q?gm4udhWV5X6S8xca7htS1BXAf8mEOLHfIISMZMIOshZb53jQ2KQmQG3ioTGX?=
 =?us-ascii?Q?uuzwB4J+o6D9rtPcsQugGeiC1q282OhnfOGctKTRJqaklXwlEFr+d1lVnEWK?=
 =?us-ascii?Q?kPBYvY8+GuiPqTahZEqwxXY16BjXbTMupSxBS4DcstpNV6nSITkDJbPeT4S2?=
 =?us-ascii?Q?/YPCJvrKPBt3u1v0N/Akw32/tQwZSiRCHfI9xMsWS2b9bQNMiJbxceKRn5lW?=
 =?us-ascii?Q?xPHAaA4Ha0Gv/1ievrJVkYqvrg6H2HADn0witIHCBsWzui+xQLZxOqqQOYHs?=
 =?us-ascii?Q?9g8oNXBOcwZSWXXIArf26EnoLM8ioIuPqr8Lr7TT5/Mb7vaQZrS4nSNXpYb5?=
 =?us-ascii?Q?8Ga4194G5pSVzRxQ18tJ57M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e7653fc3-3cee-40e8-0770-08dcb5bae76a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 01:55:53.2155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zSOJuxRIgYxZ9Q754WmZy1qPmxS347x6uPvwa8pI8/FXt0MHol/+XbLXWZOAcIIfT9BBA51kItPXi118n0tX9IByjDLcGhZqyIxepKpO6l0fXiMjJKn7ypW3IDL3Xfzm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9759
Message-ID-Hash: IFOC45PNI4DXYMI5NDFXJO4HD766F5WM
X-Message-ID-Hash: IFOC45PNI4DXYMI5NDFXJO4HD766F5WM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFOC45PNI4DXYMI5NDFXJO4HD766F5WM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > Bespoke trigger support was added when Linux v3.5 by this patch.
> > 
> > 	commit 07bf84aaf736781a283b1bd36eaa911453b14574
> > 	("ASoC: dpcm: Add bespoke trigger()")
> > 
> > test-component driver is using it, but this is because it indicates used
> > function for debug/trace purpose. Except test-component driver, bespoke
> > trigger has never been used over 10 years in upstream.
> 
> This doesn't apply against current code, please check and resend.

OK, I have sent v2 patch which is based on your for-6.12 branch


Thank you for your help !!

Best regards
---
Kuninori Morimoto
