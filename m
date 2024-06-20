Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF790FA52
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 02:33:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7D9EDEC;
	Thu, 20 Jun 2024 02:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7D9EDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718843631;
	bh=bd6dMAZVBVhSKcD8U+jEXPJtJXCvfCgqpSj0Ig+6AVs=;
	h=To:Cc:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KMzfQDWy7NzgwoRIyBLD5LBILHYK93pmhiFvHGnAtOfihJsOPXCHqVwHEblAayi52
	 zu0PKZq0BvsVgA1iS0QIWG/yRPJM1dZJrR37cyUQkZBeRIa3HYuHVwCXLmR3cD/rCa
	 EfgGnZqFzqXkUydHLiZNaAFQqmcVZ+5tc8sutmWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 034EDF800ED; Thu, 20 Jun 2024 02:33:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 741EAF80589;
	Thu, 20 Jun 2024 02:33:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D714F8023A; Thu, 20 Jun 2024 02:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DE70F801EB
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 02:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DE70F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Y4S7rcRx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pl6RmmZR3j1O//fFQb10G8/JU30dEVoQHDaAvgrWuY8RtyCsa6yg4/UoMpriOG6P913jm7oGB/hqRGFVoO1k3lyrenrkNAVz6az255BCz0sCPfCySb868s8PQuC51XE5RXYybxkJ91tDVVahHBNY5iUnqeeb0jkggfLt/KUaa+/rB6XLNrUpU80bUQs3BtzGwt6DX0/D7Lj0f0q8pdTiuD1vLRNNP93gVBtTfTRvfF7dSirzhmSZ6oaK3HtANZueVzTjgeeSQ8e6VHhRRRq2jc6eXVU1rWkNmnMRnOG7aOsbYtRCGXdolTJlN1mxgGwEezZ+8uLTvH9YeNcL1J/gMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWHZKh45LxpyU0ruWqQaeTwFGNlrm9AoIsSWTI8f6fk=;
 b=iMrlE3Z3HdtELBToYjp1mCsNngkeRzFkXLINrkaHJAC7EFr86gfM8ezFN8TI6foHEq737GVbAja1nQ7fZ65DU2ovN7wwCKU/HNEJwoa8RZL/lFE0bB3DnxrYig5mATyO+2viJoEjXn/Z93ZLqfN5TK8p6672YhFzsccARf9BKYlJAfaW52GHFI8qbHwYZP8uPzzdraJGaxW0EkFZCoZ1XVG5Vm+trm2SMVdgPjjx/q+KraWDEkdTVUEfbw++VQUQ+wSVcFcAX90I5stZEflpknPgq5qng1JYvSgdbU+r77pAMQKhz04NdMudxlWVFvUrMHkP+dz9gnFnlkjiYPug9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWHZKh45LxpyU0ruWqQaeTwFGNlrm9AoIsSWTI8f6fk=;
 b=Y4S7rcRxATq7/BRlJYutb1lA0BGopP7l8uXr9meRPCcXeqThwPEFWePC6sqSD1rKzutRx2vsbdvXApstTHezY4lgKhbjJ//qfpT7SJ/5uMc+P3MopZusddc6U2bJv5U9j/cFy7Z048BTpvFhvu9YayI++n5UA6LRL2r2w5DLLQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7731.jpnprd01.prod.outlook.com
 (2603:1096:604:17a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 00:32:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 00:32:40 +0000
Message-ID: <87wmmkpi6w.wl-kuninori.morimoto.gx@renesas.com>
To: Andrew Davis <afd@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Beer <daniel.beer@igorinstitute.com>,
 Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Kevin Lu <kevin-lu@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>, Takashi Iwai <tiwai@suse.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: add missing vender prefix on filename
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 20 Jun 2024 00:32:39 +0000
X-ClientProxiedBy: TYAPR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:404:15::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 843501e1-a677-4e45-963e-08dc90c07e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|376011|7416011|52116011|366013|38350700011|921017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HwNdabZScXoHJLnzSZDxNnmZr+D0o+0OSVO4wl0+GKIx1OxpCkNmReYAyAk+?=
 =?us-ascii?Q?4sxYR143D/ilp79qHSudvY3vZuHlVj7Y/oee8EgA46h7pfmSZjMe42M3ZwHw?=
 =?us-ascii?Q?6vlTOkF6Nx4IhY2WoFrMJsQ/eKQ5cKW3u2azBW/c9cJqqgXGYa0iQCklilWF?=
 =?us-ascii?Q?tEJeqpx2S1N7wyHD5zpi1XSdeGQfePDAlMgOF0LP6H1jaQ6LTHOC+ZRAk4NU?=
 =?us-ascii?Q?xFJ+UvwYjbekq47vcByS5AEBZPAANjO38AqsWiCt0u8Hcv9UOxm1VVV3uHKE?=
 =?us-ascii?Q?f7SDz0V39MXoxD9Q0UEFreKUDKyKdA0DdvrdRJpP1AlHkQktfqhYYJKhu23x?=
 =?us-ascii?Q?ns6ZjljfPEetqhvz8zY1liaEusluYbbr2FU7SIvy2UZACWeR1dSjYReooYY1?=
 =?us-ascii?Q?ryNqVGwTJN6BSclZ5VBubOrbPDK4INMrMk4BtwrrLGKwSSCH+ibqjYWwpF4V?=
 =?us-ascii?Q?anqXw4s6b1sytBINZsnbGh71mKTQnbW2Ym8yVlrHcP1axHT0EG6fKX7PbxiL?=
 =?us-ascii?Q?/l86vWEMOtw/JKE1ZoNQbQKeRjixdvi/zkTWNf+/wqKdkbXvh19zpYEBjf9c?=
 =?us-ascii?Q?pqIyv6TXG7R30X8sa/OoPcl9w4SWdEPCKVZoDNiHg0EaKDo5dsxv2+KZ/gCO?=
 =?us-ascii?Q?ZTu02wW0eFWv2sHbwFOakUDSBfU2Q5LmmAssv2exgVplDgs/nbz65cZL99yu?=
 =?us-ascii?Q?d3XMswI4PFAHxeKOG+pwAJu14YCbIk3I0m9GQOAwK0zMk8/pwZOb1sn19FYf?=
 =?us-ascii?Q?gLfZvWvYAkScVha/htY4bPR8PqvOTx0EbZe53tXmIHu+BIhDNUUNvxZPCk72?=
 =?us-ascii?Q?V7IlrrGw+0E5xLKUFHXNs+7WvM3ByLrE6vyPxJPOcFRUr8QDvG9L0U5LGyuT?=
 =?us-ascii?Q?6nDNoIcdOjRO03zYGbGNNXPPd8D7rGbxIlLXtnFJttWC4vVXbKJiAKi+L9Js?=
 =?us-ascii?Q?S2VflbN70s1n8QgrkmuEAOnUMFLKoNCzQja4ND6UIOiJQEpYXm9yahLF/fCG?=
 =?us-ascii?Q?gFBXh0G8umsfUll0v6iEGbrT9pKYF2U1q2k9jTCBrxDh7KL5B6o5qRBfFszp?=
 =?us-ascii?Q?ipmM99wJdAq7R/aJ35qVVEg0lG9MnyBDl0HrpySgJjo3YUU0i7KbSvct4bGR?=
 =?us-ascii?Q?rtnG8dIVqXa18ulv6RjO2ysGZjZ/0f4niPLxgXUsthnfLPnu0ueVO71Ns1v2?=
 =?us-ascii?Q?OTQ/xUCUURkqbcNrCM8MzAoesafhmH428nGYaRrMxoUYAeUMvT/vQvWbRei+?=
 =?us-ascii?Q?hjWwAGBHQleIMtiZL07Lpb2zs1Uz20smWoVkOxvSGGNj9jaLN2cfEtBJ+pR+?=
 =?us-ascii?Q?Y1837wor537+a6mnQhZQM2p+2ls8BjCaYZQVooZ9BnpliA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(7416011)(52116011)(366013)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GtyjOGrthQVRLPpwNDg2oZggncanp8+fYsV9xCCoQ4jGcqRdM6PN3L7DEeJN?=
 =?us-ascii?Q?4by/5KpamtFCMDFs+i/Z4n5qs6COYIOqUaoxdzc5Fblozapd5FN5u/kWSl23?=
 =?us-ascii?Q?2xQxuWVLBksX3mD+BClSaQRt/zZuadbZ1v0VTqzNI53HTLwMczW6weCTrrdY?=
 =?us-ascii?Q?9sSackkqzseXizdU5V+R1kLA4wOEp2UvWEuj7nd8KXQHPHdeZVb5lQl8EUjL?=
 =?us-ascii?Q?qXWaXj05sXiCvSECrBqqHlm4B+UeD9/kfKkF24+qXN1TeUuENk+KT91Hroqi?=
 =?us-ascii?Q?dEgi/zIqM5YKpZhKbPB57y/jKr/X6BDx6okW75wpyUeTF864muNgjNLCFIbt?=
 =?us-ascii?Q?ZKSIpYcMhFHFUyvj2/n5HdOrX5tlLPC+1nwy7lMMD1Guut+wFTtSCnfSqGfL?=
 =?us-ascii?Q?5M0F+P2+XiOqWzkxtTD/KqVno8AurXOO2jqWfSQNcP5TEztk1vUtHtn/S/Em?=
 =?us-ascii?Q?qzx9MXF6xuttXFHrO4T0BUYduBaxN8Ldz7r/0VKvw5C+d11g0UNjakMheJdM?=
 =?us-ascii?Q?aXeZZeuuWknh8riZ223R4405OFGWgyIWlRIoouGYLKx/1s4PxZnE+Dwn3mmh?=
 =?us-ascii?Q?U2L6L8g+GVGaKQJQWWFFOjWyeDpmd5mJnrhKy9LMskJG3MABxs/6Dip4HVND?=
 =?us-ascii?Q?EgLs/cmh/g5Oy5v7xlocUd9qbp1UBVUPVGTvqHpuwgqyrEpWADKky/8Q9N0X?=
 =?us-ascii?Q?mk/GRJuT7aQ0aLU6BjnVlXP2GNmxerPhtFsfv08FLt3hjcaz7sXvorcJUJvC?=
 =?us-ascii?Q?och8cvfGFIprDJlMf+djfoLF4L3zdhVDnl/lXzCRby5Qikmap44tTbaqpT7q?=
 =?us-ascii?Q?tph3Ic5XBYSvREINgyF7V1Kq2wr03Vx/J18RUiuvgylu5lGVzAmxWJuA8bUl?=
 =?us-ascii?Q?Tg+QkJK8pmP7jxTvL1j2Nkq/UAcxLK3s6ozp5Rd8odJV6VMDzJwcWG/DI48O?=
 =?us-ascii?Q?JpEnrP/GGqoLnR/EKzTbniY+ZuAXJ2cx1aEAxrXQfo8XPcyXFHR9SdDHg911?=
 =?us-ascii?Q?f54LL+mXgt6hNtWHnCNEvd1QryVrhqNZy9vWRMPmNZ7x4F8Xlmcyfokmbmtn?=
 =?us-ascii?Q?5Pa0MGak2xYoF501p6y0O+lh3ED9XA1oBFijOcbhsX20j7gHZSmi5wMFcpPr?=
 =?us-ascii?Q?iJaOESsIl+hfQ00vrskRnMA+McxVtaRTWPdlRRc/CZH1CnernLDqKpyYJs3l?=
 =?us-ascii?Q?b9nY6keeQ1iAQ9Fie3KkyXjbOLbFAkYmxCZUOlqqL6i7qJXmiTsRFRihjG5v?=
 =?us-ascii?Q?aW589mOAb7jb8cj+qaMo+9c1z/6YRJDyMgY2H8BVQNIMgbBQGsd/A5vlIe2G?=
 =?us-ascii?Q?iWpjM+ia+o2vRmtwk7bpJ18GJUAnpL2SRdRe6dR4ChfObe6T6K7jbzgiOdZQ?=
 =?us-ascii?Q?2/sGDCOPyNjseoVVWWHMEDoC5BmlKOtXXrPWvKPeHw18haqWTNkLv0Rp6VSK?=
 =?us-ascii?Q?kY8BenVruick7O5na6igJw8xap1vBpGF2raY9mWsEIBadiMqLDGRS+66h/KE?=
 =?us-ascii?Q?ghbw3ldUFs2J/sye/wvcH1R2YXqF6t7CQKX7+W0U/RnfJPDaq3wV94GzH/9e?=
 =?us-ascii?Q?SlwuXURttauBP07aKO/7zN3UduI175WAn507Vm6gxNCNEBvuiGQrMfFpIDcT?=
 =?us-ascii?Q?X1DcUPJIzICZdLcd9LGyzVo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 843501e1-a677-4e45-963e-08dc90c07e0d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 00:32:40.4490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +EWD85u2MocYG9jpIaaQBqzyvB7pcRCtx0a8Ix5u0oKxIcg7ilcVVYE0HVuWm3xa0PapgMEk2K7vukZZDaI89UZzJpr89I60DhrQgSs0tidGMo/JvX4QfKD5o89lje1U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7731
Message-ID-Hash: 7I6UJRSHL4DTSZYPUBRAYKPOYD4MWGHL
X-Message-ID-Hash: 7I6UJRSHL4DTSZYPUBRAYKPOYD4MWGHL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7I6UJRSHL4DTSZYPUBRAYKPOYD4MWGHL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many Sound yaml files doesn't have vender prefix on filename.
Add missing vender prefix for these files.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/{ak4375.yaml => asahi-kasei,ak4375.yaml}     | 2 +-
 .../bindings/sound/{ak4613.yaml => asahi-kasei,ak4613.yaml}     | 2 +-
 .../bindings/sound/{ak4642.yaml => asahi-kasei,ak4642.yaml}     | 2 +-
 .../bindings/sound/{sgtl5000.yaml => fsl,sgtl5000.yaml}         | 2 +-
 .../bindings/sound/{zl38060.yaml => mscc,zl38060.yaml}          | 2 +-
 .../bindings/sound/{rt1019.yaml => realtek,rt1019.yaml}         | 2 +-
 .../devicetree/bindings/sound/{tas2562.yaml => ti,tas2562.yaml} | 2 +-
 .../devicetree/bindings/sound/{tas2770.yaml => ti,tas2770.yaml} | 2 +-
 .../devicetree/bindings/sound/{tas27xx.yaml => ti,tas27xx.yaml} | 2 +-
 .../bindings/sound/{tas5805m.yaml => ti,tas5805m.yaml}          | 2 +-
 .../sound/{tlv320adcx140.yaml => ti,tlv320adcx140.yaml}         | 2 +-
 .../devicetree/bindings/sound/{wm8750.yaml => wlf,wm8750.yaml}  | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)
 rename Documentation/devicetree/bindings/sound/{ak4375.yaml => asahi-kasei,ak4375.yaml} (94%)
 rename Documentation/devicetree/bindings/sound/{ak4613.yaml => asahi-kasei,ak4613.yaml} (94%)
 rename Documentation/devicetree/bindings/sound/{ak4642.yaml => asahi-kasei,ak4642.yaml} (94%)
 rename Documentation/devicetree/bindings/sound/{sgtl5000.yaml => fsl,sgtl5000.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{zl38060.yaml => mscc,zl38060.yaml} (96%)
 rename Documentation/devicetree/bindings/sound/{rt1019.yaml => realtek,rt1019.yaml} (90%)
 rename Documentation/devicetree/bindings/sound/{tas2562.yaml => ti,tas2562.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{tas2770.yaml => ti,tas2770.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{tas27xx.yaml => ti,tas27xx.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{tas5805m.yaml => ti,tas5805m.yaml} (95%)
 rename Documentation/devicetree/bindings/sound/{tlv320adcx140.yaml => ti,tlv320adcx140.yaml} (99%)
 rename Documentation/devicetree/bindings/sound/{wm8750.yaml => wlf,wm8750.yaml} (92%)

diff --git a/Documentation/devicetree/bindings/sound/ak4375.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4375.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/sound/ak4375.yaml
rename to Documentation/devicetree/bindings/sound/asahi-kasei,ak4375.yaml
index 587598e122c6..bc07fcba535b 100644
--- a/Documentation/devicetree/bindings/sound/ak4375.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4375.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/ak4375.yaml#
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4375.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: AK4375 DAC and headphones amplifier
diff --git a/Documentation/devicetree/bindings/sound/ak4613.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4613.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/sound/ak4613.yaml
rename to Documentation/devicetree/bindings/sound/asahi-kasei,ak4613.yaml
index 75e13414d6eb..b49a6cff9f1f 100644
--- a/Documentation/devicetree/bindings/sound/ak4613.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4613.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/ak4613.yaml#
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4613.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: AK4613 I2C transmitter
diff --git a/Documentation/devicetree/bindings/sound/ak4642.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4642.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/sound/ak4642.yaml
rename to Documentation/devicetree/bindings/sound/asahi-kasei,ak4642.yaml
index 437fe5d7cae1..fc03f0373a1a 100644
--- a/Documentation/devicetree/bindings/sound/ak4642.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4642.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/ak4642.yaml#
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4642.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: AK4642 I2C transmitter
diff --git a/Documentation/devicetree/bindings/sound/sgtl5000.yaml b/Documentation/devicetree/bindings/sound/fsl,sgtl5000.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/sound/sgtl5000.yaml
rename to Documentation/devicetree/bindings/sound/fsl,sgtl5000.yaml
index 1353c051488f..c6ab1ca16763 100644
--- a/Documentation/devicetree/bindings/sound/sgtl5000.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sgtl5000.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/sgtl5000.yaml#
+$id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Freescale SGTL5000 Stereo Codec
diff --git a/Documentation/devicetree/bindings/sound/zl38060.yaml b/Documentation/devicetree/bindings/sound/mscc,zl38060.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/sound/zl38060.yaml
rename to Documentation/devicetree/bindings/sound/mscc,zl38060.yaml
index 8bd201e573aa..994313fd12b2 100644
--- a/Documentation/devicetree/bindings/sound/zl38060.yaml
+++ b/Documentation/devicetree/bindings/sound/mscc,zl38060.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/zl38060.yaml#
+$id: http://devicetree.org/schemas/sound/mscc,zl38060.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: ZL38060 Connected Home Audio Processor from Microsemi.
diff --git a/Documentation/devicetree/bindings/sound/rt1019.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1019.yaml
similarity index 90%
rename from Documentation/devicetree/bindings/sound/rt1019.yaml
rename to Documentation/devicetree/bindings/sound/realtek,rt1019.yaml
index 3d5a91a942f4..adf5e38f4dbc 100644
--- a/Documentation/devicetree/bindings/sound/rt1019.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1019.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/rt1019.yaml#
+$id: http://devicetree.org/schemas/sound/realtek,rt1019.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: RT1019 Mono Class-D Audio Amplifier
diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/ti,tas2562.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/sound/tas2562.yaml
rename to Documentation/devicetree/bindings/sound/ti,tas2562.yaml
index d28c102c0ce7..8bc3b0c7531e 100644
--- a/Documentation/devicetree/bindings/sound/tas2562.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2562.yaml
@@ -2,7 +2,7 @@
 # Copyright (C) 2019 Texas Instruments Incorporated
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/tas2562.yaml#
+$id: http://devicetree.org/schemas/sound/ti,tas2562.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments TAS2562 Smart PA
diff --git a/Documentation/devicetree/bindings/sound/tas2770.yaml b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/sound/tas2770.yaml
rename to Documentation/devicetree/bindings/sound/ti,tas2770.yaml
index be2536e8c440..362c2e6154f0 100644
--- a/Documentation/devicetree/bindings/sound/tas2770.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
@@ -2,7 +2,7 @@
 # Copyright (C) 2019-20 Texas Instruments Incorporated
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/tas2770.yaml#
+$id: http://devicetree.org/schemas/sound/ti,tas2770.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments TAS2770 Smart PA
diff --git a/Documentation/devicetree/bindings/sound/tas27xx.yaml b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/sound/tas27xx.yaml
rename to Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
index f2d878f6f495..530bc3937847 100644
--- a/Documentation/devicetree/bindings/sound/tas27xx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
@@ -2,7 +2,7 @@
 # Copyright (C) 2020-2022 Texas Instruments Incorporated
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/tas27xx.yaml#
+$id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments TAS2764/TAS2780 Smart PA
diff --git a/Documentation/devicetree/bindings/sound/tas5805m.yaml b/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/sound/tas5805m.yaml
rename to Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
index 12c41974274e..c2c2835a9e1d 100644
--- a/Documentation/devicetree/bindings/sound/tas5805m.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/tas5805m.yaml#
+$id: http://devicetree.org/schemas/sound/ti,tas5805m.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: TAS5805M audio amplifier
diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
rename to Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
index f3274bcc4c05..876fa97bfbcd 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
@@ -2,7 +2,7 @@
 # Copyright (C) 2019 Texas Instruments Incorporated
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/tlv320adcx140.yaml#
+$id: http://devicetree.org/schemas/sound/ti,tlv320adcx140.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments TLV320ADCX140 Quad Channel Analog-to-Digital Converter
diff --git a/Documentation/devicetree/bindings/sound/wm8750.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8750.yaml
similarity index 92%
rename from Documentation/devicetree/bindings/sound/wm8750.yaml
rename to Documentation/devicetree/bindings/sound/wlf,wm8750.yaml
index 24246ac7bbdf..96859e38315b 100644
--- a/Documentation/devicetree/bindings/sound/wm8750.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8750.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/wm8750.yaml#
+$id: http://devicetree.org/schemas/sound/wlf,wm8750.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: WM8750 and WM8987 audio CODECs
-- 
2.43.0

