Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E83989925
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 824381667;
	Mon, 30 Sep 2024 04:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 824381667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662535;
	bh=t1oZFar5gexZhHEda3sj7dtfzjQIQuke3UIXtKqTauc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hga5CJXGg8u1/Fu4QdaiC7pk5nlSfVrf0xeK6hPEa87a7HbTHJw7AV6vpCc8uUk6d
	 U0wTIK9Ob3gCYmL6CdZblcDW3KztxUtfQuNUgktNkPeroFQT/3ZgMTWplxSpAuQq0U
	 gT4BpzzpUJeqak52NqQxRXYGnf7KvEVC01qfPjhY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E95FFF8063B; Mon, 30 Sep 2024 04:14:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D3ACF80637;
	Mon, 30 Sep 2024 04:14:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A402F80637; Mon, 30 Sep 2024 04:14:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A88FF80518
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A88FF80518
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JQ5Ye06Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPDXthWqtdWMkuWAN2nwtb4znJxLPg/if9fB4PvIMnZlbQVBYfiW0WxB4tZvepf562wgFq7CvcJdcUprEtP+kpgiDWykVER7oBGXPvb2gTnMUzY+Aq7yk9KjUFEUOz32JBSsVRkm5YuDhGyb4Gfv/1lVwhpowYnNwS7YmZlSO8U5S4yBFnmCn8uoF3YFYX+a1ogxluqzrsRANSMVyWk8QhMQZcbDdvB7nwmPYwxFYdUerO4lpDVKmvbaEKCP0sgp1JCClnRvgCxKmiiIXiU1/d0gRwinaNHXadIXdVL0NhHJmsyDhPqmbkApwOLJp9VDr8rxs8tHjDvV3i1bXn1LWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3qang2WhH3LXg9um+rVOUh0Yh3YMZZyQNp3750xo7E=;
 b=g3uvjOvapwBf6UyVdk8wenkSzsxhAzV5vfm7WZ7yPbag9qJVdUgX0eKhXw8KuO1fxGKzi/hfTsHdcOJ0R0bHX4woxzVyNr8wZKi1YRKTFPUby0qoYEoODtUrc8Dy3cEgXI0hD7qvwo3JgNxNPuK+5R/UKk2gCo0oanUe+hEIuwpU37y9KQZQfCzCuZIQollZFKxB6DS+Bm1Wi2Qk8sCyguhm6pr8koR5K3K4rmAtuRhfHIVG1JaEG42KMk1602j3nFERvJL41dJqRiX3auM4Kl9uJz//eu238cGBiwaRC3EDZEMiWw+U/X040NmiHPF/rbPGJ305sKHGsNx0r8MV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3qang2WhH3LXg9um+rVOUh0Yh3YMZZyQNp3750xo7E=;
 b=JQ5Ye06YnpoKFUcfImj00HwJmkYgebnK7Rvc8eKiNIT0XX850QeCsRNplwJdMaVjd5i7T/1yrjloIIlIGZ6FyglygzgJf0Yzy2Xwj/URCQq3ZPHthB4KCspGbD/alsdAE66VMt2SQloMZk8m4jlcERuKhw6p7a/hVNqRXsD8I8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8143.jpnprd01.prod.outlook.com
 (2603:1096:400:104::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:14:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:14:03 +0000
Message-ID: <87ldz9lwgl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/13] ASoC: intel: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:14:03 +0000
X-ClientProxiedBy: TYAPR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:404:14::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 492a6c38-799c-4794-2b67-08dce0f58dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?buYwt/NmKNoeopOOwxw26vsFxQdth/j5Qjd/3xOcsWAYPnYdFz7jXmIl7jZu?=
 =?us-ascii?Q?3+oYgZd4H7ItUA48IQrnT0yQrpYHLTEmq/8WK8awapm3u+wPqEaSvV4T1t7w?=
 =?us-ascii?Q?p2SOAiu27/VE69KCSzF8JVgmc+viTpg7Vu7QRA+0IPyytHSfx86NFmnCzx9Y?=
 =?us-ascii?Q?NH9xQc5eQh3ho479hKwsNSIPd8Fplos+qvelT952nZkoSIwNHrk/VqpwL3v4?=
 =?us-ascii?Q?Zyw/zx5j9mxutYUcof4ha4HiSH52BV+R8c2dNFvKfBQk5GgTfjvlz6OYMgpT?=
 =?us-ascii?Q?SwRizVQPkusdUkKjuGX+HCU61ftqXogapEXLFbatz60K7xyp9g2XHLRhxHTr?=
 =?us-ascii?Q?gYeNz/zmeC0GevyfCri+rtljWs/ASko/4eb0uyeTUcz90eTVH9U16NdX8Qwn?=
 =?us-ascii?Q?8q7No7TGDzuq1KQ2faMRBtqtdmgEdu7mDqXRpTwHCU/oswvMpGJ2RL1jtSFj?=
 =?us-ascii?Q?8vdcYCaP+cuCcK4qMgJbo3HWaFNw3PL+EZjhP0uROcmj1ec6sFX0zLDQKTUg?=
 =?us-ascii?Q?b9JcRMc1lt4PBfydpRSQnWDITe/GVf0DbiiQfkLc2/cUt77b8YEI66cseFRZ?=
 =?us-ascii?Q?sSxM2p6zwXaGj1HOi6T9rK00iKgIC8PXQmdCMYgDg3hMfx4fxDMXo4v6OzPY?=
 =?us-ascii?Q?7k+ZK9bE46tJHDelExZniysLIf1LuRw00gkc9jHhJhkat/dYxgJ5gMX1A1tV?=
 =?us-ascii?Q?l3wlfZVwwdpv6hDw/wT4n/Mzez8veDqv+xkRt9q7asq+DwUND8NJUlKYGcAY?=
 =?us-ascii?Q?5eumMZ0VEp82fDAfYqnmUYGnYbADGjb8qJ19DYCyOia730FQ9fbhep129at+?=
 =?us-ascii?Q?W4zSPlbSjnm0M809I8qml9ASLf7VnAfT53tB1omDHQgYbVSqP9Gq5JG6JKGH?=
 =?us-ascii?Q?eZYF/N/X/bz+6Uf9MSylzsg2tcAoLz1LpWDRMkxiTH0tRRzts91+ZfwGOsi5?=
 =?us-ascii?Q?k6c3Sxlzo8GQ3qhIsQG6TQ9RyC56kU+O0DB6ze7G3At3I7vR8pM7Qvz/IOCh?=
 =?us-ascii?Q?QnUxh219UqY3se6RfoLsMjtqOr6CIEkeZwrF+hDpIaHw1MiUbTr6ubiCLHqc?=
 =?us-ascii?Q?bwFRIijMUdvK6pnffR96WS1b9cVmgwzSVcWT45zD8YMgC8YwLXHlBSzuGs8s?=
 =?us-ascii?Q?qKLQsHkY0YZagmZh7knWtCv9mDFZsQEEt93pGH6UPNJ0/5cmEtFwd5W3SwIi?=
 =?us-ascii?Q?f+x1ogwoJmqdUovDnI5MujQ9CYiDkpZg+L7gCdhOoXStb432GToLPdNkp0s4?=
 =?us-ascii?Q?/Ry20Xv4zCN8F0W3hGtTepp3icVsrzfmmUHhfuqBHK2opwmQU+UMGLL6Lqf3?=
 =?us-ascii?Q?cVFMJrZ3bHTsJv44NXeHTGKRWsvHgp3/sMen6kanZTT+j0dfQRrKmhlV4uO+?=
 =?us-ascii?Q?UyCQDkGyI4uZxulEItCu/eppRDest68jvSmLo5ic00PZMK85PA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zMTDZG8a/CxPteh7Pe1heVJgeHf495Czqh2nCyvmIdjh3c4A0/d9gG+gbXv7?=
 =?us-ascii?Q?Vsk6BhhFYtwoiav/qZx6E9hV49BtJ0Xj2vQA0GWIjm7dp0/1qnx+09AMPvG+?=
 =?us-ascii?Q?n/LcyDtXClUcqsGIqM8X178R5pHYLTnIMTH34mpXNlyYbXLEgJAfiI7IRqw7?=
 =?us-ascii?Q?exgIyusj9bWsd8kJQQWYVPGnym6NwLKxIdSgTRoWHf5DYRF8RUXQsy2wrbFF?=
 =?us-ascii?Q?v09Qz2RH1N9oWVr0fmEJut4Gp2owU40YNyvO2jrROiuqIvR6dkplT2bK7Ws+?=
 =?us-ascii?Q?uco7+WL7ppZMjOW8IMVzmwyPgcWw0tQEzS03Ft/10lhfK8lwoBOK1H48p08N?=
 =?us-ascii?Q?Eu+Bx8cVtxtv3eLMT5Lyb0b5WEd1EJJvmf5bChr/TvrdNedRUZzdkz6d8kc0?=
 =?us-ascii?Q?qW7aeUyunb7/x1DiwPnqZABsR+jrP0tJv6OVzbYJu/0TS96hh26RLYxAm8r3?=
 =?us-ascii?Q?qR4h8cgMs7omXKSzHVfIN0HEP67xwDsG++5sHJj+Q5TrkeAsdwU2kPhnPaBz?=
 =?us-ascii?Q?iGB9DZ1E7xFkDN3WeLxGjPMOKIG8eN9ac2k49iqAn7QrbO2PvtgbbJv4iCk+?=
 =?us-ascii?Q?KxnVARR7rREp1fwc0N5//XRA4+ONDeZjwGslvS4v27HRhmO/YwuyeAjm+3c4?=
 =?us-ascii?Q?WURaEfzFY/jsQvqWLiJd+C7OhkqUOFd5o88pvabzw0GDqLPq2/yJxo/S+ZXv?=
 =?us-ascii?Q?nQS9qYcWjfu3HZ7pVlNLbecQQsCWZ0Zb5ZTsTd8FBCx4dTrw8tvAWRaiPNVi?=
 =?us-ascii?Q?H+uqILa5ZPcBuw45uboeNFUVLr20GYqtMgJ8RH4wNbjNEvot+MUyLxSF4p+t?=
 =?us-ascii?Q?nfcPh7HTZV9SJZQIPf04oFAu8FW6VPmkf3AnkhspsoTRmGjLs7REMXKVTYL/?=
 =?us-ascii?Q?HlJH8ZmZbmJeLQDH0BQ0G2UZHx2Qcs7HMqz5dBvmO1Kx5Y/E1A4+J2lgdjo8?=
 =?us-ascii?Q?S7PnPX/CF34zPUE8L1bjuNLqsZmha1aCmTH88s/sBoaFv3vCWHqw42m+mkba?=
 =?us-ascii?Q?NuHuQZ6U24Vhy4fOJU3mMoHWBHEToe3p/6KL5XRenNwiQT4jlnwgWtiWHKQS?=
 =?us-ascii?Q?aZNw1JumOAgL1embcFbqnY6i/WrX4xPDEyVHp5xQekU1JoSYr86jNUzsO8Dl?=
 =?us-ascii?Q?f5QwUlmNWPgXn/yQyEESYcsZObBdwo3TM+mN+gHDP4ZTC1dYq8rHUfKqhNbU?=
 =?us-ascii?Q?Ld0n15QrfLLzTkzIicRItQO+r4F5RADvMgqPUeJjWh48oCK2xJuToeHGg/9h?=
 =?us-ascii?Q?JtISy/sMgiv/+HG74HcseB7Thd8g+EDGzqHmNjeOMUJiV5OKUG0Ffkwxfhol?=
 =?us-ascii?Q?1OLQGOl27WfeybtFsLDS8Ktw/ZGRESExi8DdLAfKgwMIB2VwdMN0f/BS+I6Q?=
 =?us-ascii?Q?V24RfY02cIFRgXkNI1iHuQn6u8x2n5rv3uniWh8bMvP4gnCxVcaG2zOgOCQD?=
 =?us-ascii?Q?QuFNUVP+vcSf4rt/Rc5SUuNQ8mgvzvh88HZ7A0Z4u3hpsgIZsgMkaWHpr+Ca?=
 =?us-ascii?Q?CkuhDZMy3O5kSTTVBb+WM9M3REHMyxunY6lQz3y3ciWqu0xDswO6MrICBoQv?=
 =?us-ascii?Q?84NOttMOnOtNxdeJmzl8IuYfvTqRBgtlbz0rjQd1rBwy0kVZPBAyzGjgcuCJ?=
 =?us-ascii?Q?uFroa3TgDKsFNTg3//ciCwY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 492a6c38-799c-4794-2b67-08dce0f58dd9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:14:03.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 huCww+Rop8CrWybXQalZnhsRymp1QaSlamvqUiwtPsb0kynOB6SruEwyUkie8TwvReF1WH+UpH+sM1l7xncZZpTD6wr0cuZ2x56JmWcbJxNFunYuKJ2ArIgVfuBArzdu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8143
Message-ID-Hash: H4Y255VGCWGDVQAJCBGYDV6OYETM5CVO
X-Message-ID-Hash: H4Y255VGCWGDVQAJCBGYDV6OYETM5CVO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4Y255VGCWGDVQAJCBGYDV6OYETM5CVO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/da7219.c        | 2 --
 sound/soc/intel/avs/boards/dmic.c          | 4 ++--
 sound/soc/intel/avs/boards/es8336.c        | 2 --
 sound/soc/intel/avs/boards/hdaudio.c       | 4 ----
 sound/soc/intel/avs/boards/i2s_test.c      | 2 --
 sound/soc/intel/avs/boards/max98357a.c     | 2 +-
 sound/soc/intel/avs/boards/max98373.c      | 2 --
 sound/soc/intel/avs/boards/max98927.c      | 2 --
 sound/soc/intel/avs/boards/nau8825.c       | 2 --
 sound/soc/intel/avs/boards/rt274.c         | 2 --
 sound/soc/intel/avs/boards/rt286.c         | 2 --
 sound/soc/intel/avs/boards/rt298.c         | 2 --
 sound/soc/intel/avs/boards/rt5514.c        | 2 +-
 sound/soc/intel/avs/boards/rt5663.c        | 2 --
 sound/soc/intel/avs/boards/rt5682.c        | 2 --
 sound/soc/intel/avs/boards/ssm4567.c       | 2 --
 sound/soc/intel/boards/sof_board_helpers.c | 2 --
 17 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 80c0a1a956542..93eba4fd27710 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -203,8 +203,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index a31aa471a1c21..4dd9591ee98b7 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index c8522e2430f8a..426ce37105aeb 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -233,8 +233,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_es8336_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 430c070a1a0ee..cb6d54db71892 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -160,8 +158,6 @@ static const struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
 	.cpus = &snd_soc_dummy_dlc,
 	.num_cpus = 1,
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 7e6c8d9c900bd..4556f105c793e 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -46,8 +46,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 8d550e82b46a8..6570209c1a63e 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -82,7 +82,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_only = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index fdef5a008daff..6f25e66344b7a 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -134,8 +134,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 082f311d8b840..ad18c4e9a6704 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -131,8 +131,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 6ea9058fdb2a7..bf902540744c5 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -210,8 +210,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 9fcce86c6eb48..4b6c02a402047 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -184,8 +184,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index f157f2d19efb4..e40563ca99fd5 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -153,8 +153,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 1e85242c8dd2b..94fce07c83f9e 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -173,8 +173,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index cfa146b6cf087..30588d9e9ba3b 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -121,7 +121,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
+	dl->capture_only = 1;
 	dl->ops = &avs_rt5514_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 44f857e909691..b456b9d146654 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -171,8 +171,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5663_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ops = &avs_rt5663_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 0dcc6392a0cc8..335960cfd7ba1 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -242,8 +242,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 63bbfc30f35e9..cfef00462f661 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -121,8 +121,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 24f716e42d6a3..ddbfdc6f88e47 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -496,8 +496,6 @@ static int set_hda_codec_link(struct device *dev, struct snd_soc_dai_link *link,
 	if (be_type == SOF_HDA_ANALOG)
 		link->init = hda_init;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
-- 
2.43.0

