Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F13290F9EB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 01:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2424DFA;
	Thu, 20 Jun 2024 01:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2424DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718841473;
	bh=eSSIrUdVhHzV4EszI7vuCiXk4qXtV3I1+l8147KA6nw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qzJIh0Q/BCO0pST1CPT+SOWb7GH2dDdt/WJdII5Z8a0YJsPDKWLUK0SD7ArtkSpyS
	 +u/7eITncNZbnyqby6r6/icPfkGWzLAtq92irXY2oczzsURelJobEupPMx6PN8ygti
	 JKCEVGFUzF3/38FWuCa5tRoQJNiwoblvd9gmESNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EE35F805AC; Thu, 20 Jun 2024 01:57:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68D8EF805B3;
	Thu, 20 Jun 2024 01:57:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42E44F8023A; Thu, 20 Jun 2024 01:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B465F800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 01:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B465F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hyGeumgs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDzDbqhTOeZ+DG3iXGZyRSePHSgcB16nF95uDIkRt5ec0w3+05V/+xJpVTcPPAdd+x5cTDpIA2dKreo1OvK0jbQYW3peyDAeW1y2dV++sIh2Wz3XqsDgFRy7nxmrUIwdE9c1HIg47jFzW7jg99fMEujDra3umjJIHIuec0+TDh6ekf+edSR7LeqMGtVfGZ3wTIi9TOSZqLEE/y+WNbhXGAyYQphRn52cqC2yiCWt82+bWPsf18ncy0k6LZYqdsYcNNi/3WW7C5yIcM5IR3+Tvv9W86Q6BmozVxTYk1irYpBAo6Yq6aa3CgK+fx5b4r3w5WaQYlolnI/Lup/jcNbp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pJqKHT0noCUcUFgqmK5KfDxeaXAYxHuyvwIja3Mwvk=;
 b=ICxJhAqY+AQKroYb+YRkLQlxNlatqfjJHpE7RN1+YHk2GLRbrYnA8ljuSGv3etNZRKiDz6MmjsohbmFUY/XQTepj2yFE+8uMEqKtycmsxF/mlYWMVMtRbfhKlBT3QV02PbDuDFLFUKGmHqB3HbOaVfEUylHHujPU0AYQ6d7fkiqMWIZzUP0rY403jXDBPndAk0xaUEmNQVDPtHA9VzcYgYps+JjKSd+7qz5N4erDyPP0BkMG/UwAWFNWEJC3MqVfAD+seFbqYcKiiJ0RKoFFnkQPgtj1FxQco1HelwzpsHOEACE9+e258XJJxvqmcB7o9z8mB1cEawEPPPemsj3qzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pJqKHT0noCUcUFgqmK5KfDxeaXAYxHuyvwIja3Mwvk=;
 b=hyGeumgs3PiG3h4XEJi/dlzJOmAgIWbpSOifhjSwQcp06cnXAAxufZhl+saC6yCwYe29yk/FuFCj+hNmIj0qvsVU2CKx3q3ODOZD7H+GfRt6sFnnM3mb4hh0HYXfPbf/1YqfdqE3fCWA7JML56y5p3gFp9T1Bj198TJl/wvemFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5909.jpnprd01.prod.outlook.com
 (2603:1096:604:c5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 23:55:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.020; Wed, 19 Jun 2024
 23:55:04 +0000
Message-ID: <87y170pjxk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
 imx@lists.linux.dev,linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 0/4] ASoC: grace time for DPCM cleanup
In-Reply-To: <71a31778-5709-4342-b813-75899ed4e90f@sirena.org.uk>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
	<6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
	<877celwmvh.wl-kuninori.morimoto.gx@renesas.com>
	<71a31778-5709-4342-b813-75899ed4e90f@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 23:55:03 +0000
X-ClientProxiedBy: TYCPR01CA0153.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: b41565bc-844d-487e-c52e-08dc90bb3d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|366013|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IZmKS3XlziqAYna2Ih4y4fbaUijRKFQ5h30JcEnNgpQAy9CzaJAv+j8/mOFQ?=
 =?us-ascii?Q?AhNe5563Q5kXDTZ3C9YN7G4wh2cMaN18+InWlHpWzysbXRs+DwE3Nj7hoVNy?=
 =?us-ascii?Q?zCerEtnKM/If1dkgcXxMzGGsAFTO7pcufSO9qltgbrcYvmWAPZpj3h3lPyuB?=
 =?us-ascii?Q?pJPhW0BdFR8/RFoJpl16Qs64+37WMESaebZvf3YkhUGiLEJB+xWLkv1oJhwr?=
 =?us-ascii?Q?vlVf9KnodYKFZ9t4LjHvXlrWgKo4XiVgfh1KN30xkimYBiE1gTLpJEoQH4Ns?=
 =?us-ascii?Q?WYDWTtd93/BEd5jAfI5sdSlmGQ2+9+ATOjI6haMBFUcJJRHRWVtAywDTWSYU?=
 =?us-ascii?Q?WGmEdW5xulklfU9DnKLhPQpZjvdDUYpLJlPPa6fONI9mGZ5tCIJmQ7yv3oj6?=
 =?us-ascii?Q?/Yk9pp/afilxSG8QJ/KCXdN/5fqvTy2lcZjF8hN2RuwnKqIh/yT48/oM3jiK?=
 =?us-ascii?Q?Pab77vGVxUPDnIBboPqpiH7ukOHRrLKr8L2rhNLELPNUBogb2/7s/f+KV3gr?=
 =?us-ascii?Q?BCY94so47BWxQwLIx1EA2OmFELdDKDNwSvrzSxeGFNbMBhJAVlifdw/piU2P?=
 =?us-ascii?Q?VSK+DbfJJtqhTatlGv3mMKl4J88VXVMOD1KBFaF0UmxKNZEhmwSjjFDjzbIG?=
 =?us-ascii?Q?dzpM/8KOyyd/jyW72NhocJPCdlPlOz8GvILD59SB7v76alTtYHBKBv2hpfom?=
 =?us-ascii?Q?PUUA7WiL3DQdx6KsM5moLnzUWGCzFYGgofEleCG5GExlSYm4ivyq+b6jNmTt?=
 =?us-ascii?Q?UDEL2/J71zmVg2WVeFt2HRpACNhXO+X4H7lM1pAT5pp2sWeeCIe+ppLbQzSS?=
 =?us-ascii?Q?x9kizxtvw+NyRXpCHXjT2yW9aRLaQk5EVmEXqBAChsxD+FZr1kKMYanGQv7p?=
 =?us-ascii?Q?6/+Gs8AeUQHejBj/0DqLYMCnaGE+eFiH/29H0J9gjFHl14FMF51irgA5WXnX?=
 =?us-ascii?Q?4KhHRL26mfi/j9TXLdZ2UgkbU3qonLWuST6yukycalcRkbQLfG4ETo1HFD0b?=
 =?us-ascii?Q?gHZjAM08GV5uE6HnxbOP7Q7n/gJ19dITYe+VDXqWpaGmDEyFXHWfKELA46bH?=
 =?us-ascii?Q?LdR7LOokJTRB5hPuOFDwEa+jmpbJpza1u81OJXeJ4HxhqIU2xyducgzARXhs?=
 =?us-ascii?Q?mmwq4O+7Dz4bsSRCmUKkAhg3xYaVOj/IKzFpk4VTkN8UyZTqNjPT9UzJoolH?=
 =?us-ascii?Q?UxIAR9AINk+5PDxCGcm37J2pDcKTbZpDPwgPhRHocU7ggNowxXOnw6OhAgQ0?=
 =?us-ascii?Q?3pbbjLOtqsAc8mzaGlhsZLJ5ZjTvL1+1JWdr3HgCJmvT+lmzMkebWSqjGSjY?=
 =?us-ascii?Q?v1enGtSWgsGxZDuwiCUnHaibCdaGidWyrFPi2INScZ/WXOmX+XEdI3FIdW8k?=
 =?us-ascii?Q?NCLQibY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?36AFCmJ+zAvw8ZdHMS73OjQOHXM/v9fchbD9M9FF62RHYUDmeHisbxvxj+Wd?=
 =?us-ascii?Q?RQgfzsppuLFn0rqxAsLqbDEnoo1HXjFPeUaTsTZdokoOKmuAqusNPQeueTOp?=
 =?us-ascii?Q?hjZAeQyBi4ZI/u7p+9HDDk+aHW3qnZZlFfZUqRoRkaGHa6IgoDfJWKFRqkZ2?=
 =?us-ascii?Q?x+Stv/y2QxgkobSA0zhfZEf5SP62td/NpTkFcG6ay23oiKqevuQV/lWMWijM?=
 =?us-ascii?Q?hf+980ClkyBg9h5sACPB9k/GJrIUfp0i+3Yv3qqj41a4ZmlPUWkhvTWE58ui?=
 =?us-ascii?Q?rzKNyXpRrbSXtzVrrunwTYecwX5uuICtxmbGSoZuXPzRks9QgXuiAO6Bz9oK?=
 =?us-ascii?Q?KIJaYhx4HAtnIkfgRp7qrUxtWQ+T1RackPrJhRK6Oz08yF9b32Mqyq6RZXTc?=
 =?us-ascii?Q?o2Mg1F2Obus/iOq13RvJFRhDz14ZqJxYrrSvaGpWfwNNK7ultoZTR+pXSJf4?=
 =?us-ascii?Q?pqBm0mc+95mv5JfVJLe6ZkDXTWG56jPIgE7WNYw7TM+EX0x3UaOG6hOKVzpn?=
 =?us-ascii?Q?fZwYP8/um3cKQJDPIen2hEqpl4RuOu+iDRXaAMMEtQpiPWHKC63Dd63GHv1V?=
 =?us-ascii?Q?7yMpI/8aykzS2lwCcpsZZfOy2jhbJgcOl8wMmWXmWTZmFCCTrGaY9EU7YNIP?=
 =?us-ascii?Q?iSxF+T4+LdnPW17xTaCeLH9KcGRsvRdAT7pl8U0SA0ArY4lxdr2HucmKAhaW?=
 =?us-ascii?Q?09T0r8paHhWVorG+yYCyingzUGZmWPqpJfJaLwz+i3MjRgc6q86RV/Fc6q7i?=
 =?us-ascii?Q?0V2Pk2vACy8GQoLaYU3zsKcZphzbJQ3mUiWssr2+C0v+K3DQBn49pnAb/hwl?=
 =?us-ascii?Q?2ECsF6NMoKe5ybD9eWnQIXVkDbxC2JC80QerBnfONeTjUF43mpT60S2ELsnA?=
 =?us-ascii?Q?HGU4wIsorZEh2EgoXE1mbkQZu1GorK4CfQDZguROYz+GtnDT+z4o0osvrurG?=
 =?us-ascii?Q?gzHGMlwLFGQGB5d+MlnjpyQoV+wNbPFn5Nw9DuhOMICGG2swtXSjRmVEqunc?=
 =?us-ascii?Q?itKZCV2Oh7sg2TM+J1t+gyqPDI9allu2xudAi5LxTI/qkkE9XFZmECd1gdnn?=
 =?us-ascii?Q?sFj5Hk5zVBRmetrIEUrqgurJF7Pp5q6SWaNQAjMiMlhLbrR0QyR9Gszmhkhz?=
 =?us-ascii?Q?hRnjIHynY+PlcSRm+2dzq+Gl5Xoo4kJ/KW5ZIeZpfE/hrEBTPuRAGU9LIOT0?=
 =?us-ascii?Q?snAKaRHrDBY764bG28/4qNWXbfxF6tKE2qFGYGZCPp1oqhlwl+SBsfJBvkD2?=
 =?us-ascii?Q?sUzvuOhQGHz9sQ0keXM2CIJ04kzjn/wHGhwo2np0ahvO0ZTPjD/BFWSwZ4xJ?=
 =?us-ascii?Q?llIgztVJKgWFBqI53E0MTaN5DuWafjyYTd+i1MQZYlThR7NNZ0wCO4iy4PXy?=
 =?us-ascii?Q?nIGTT9UkEVIHo33cbqjfCCGYddDJYNYybZISUXAeFrBsXiDb1AKXhxR7GyYa?=
 =?us-ascii?Q?vBslQsV8p0psxMoqnImABQ9/D1+Z1ERlqFgOQ+T8ZGMkpcuorusEruPvNpdC?=
 =?us-ascii?Q?SQSppSORigTjWsbf80XcPCw6qsa9gc137bl9dRJ7/Sdk6Eqm8oOq0ImUhu8I?=
 =?us-ascii?Q?eLxs70Fhe1aSoa8YFBe3lu9ckFCAk8ley0b5jIDgiKmCsfPXKTb2rd9cjAq5?=
 =?us-ascii?Q?TYeHe4gbpPAZlX2C5//fzvc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b41565bc-844d-487e-c52e-08dc90bb3d33
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 23:55:04.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EqAjbFVmcAg6wfyoBXelqdNUVlgnqIhZopy1j6kX8GKkoT+ZI7Br6h8E9LPXE6XaylRubUNzKxJZAuOH5sT1xzAKqePfmPMI7okD01zlgqmoon1RBY1MkdZtTuiooACC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5909
Message-ID-Hash: P3ESF6PM6Q2CVUJMXYPBVSYKEE3YDIRJ
X-Message-ID-Hash: P3ESF6PM6Q2CVUJMXYPBVSYKEE3YDIRJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3ESF6PM6Q2CVUJMXYPBVSYKEE3YDIRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > > This doesn't apply against current code, please check and resend (it's
> > > simple-card and audio-graph-card2 that conflict).
> 
> > Ah, I guess you used "v5 original" patch-set.
> > "v5 resend" patch-set or today's "v6" patch-set should be OK.
> 
> Oh, if you mark something as a resend then it sounds like it should be
> exactly the same as it was before, if you've rebased you should increase
> the version number.

Thanks, I learned it this time. Will do since next time.
And now I could understand the reason that sometime maintainer get strange
conflict which I don't have :)


Thank you for your help !!
Best regards
---
Kuninori Morimoto
