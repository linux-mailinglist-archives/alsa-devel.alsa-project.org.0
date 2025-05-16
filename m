Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDCAB9B34
	for <lists+alsa-devel@lfdr.de>; Fri, 16 May 2025 13:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 193BB601CB;
	Fri, 16 May 2025 13:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 193BB601CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747395487;
	bh=snjXLNFJR07/5fPcveokxjGvb8NcQYJ6neFpmq6drS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ueVoqx/f5heH6OhEtDFuE+w3EB4iMBeUqeKAAhGhUOwVgxJAoHaCq9q1rvypZA7pp
	 W3vMB5BUqFT7WwqR8QFj+CbWC7iw8tF9c10wYhSCoN6IIilGk15NNK3rNVHmYk6qRp
	 de8Lm/bcUuWwbL4YmlEboB2/lDb9g4O6gNQJJn14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D49AFF80185; Fri, 16 May 2025 13:37:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 660ADF8047D;
	Fri, 16 May 2025 13:37:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEB03F80134; Fri, 16 May 2025 13:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::622])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0C22F80038
	for <alsa-devel@alsa-project.org>; Fri, 16 May 2025 13:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0C22F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=SmtzPwr9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcAWVYjJTipVHZZ8EjpAiEjsEG1xKTESxm1OrSYdqN+w3OF36hVmg4Hgz49+AeUgtpEnIEUNmZebDQg93YrwmKcfb4RH8rTZT5nmT2HE59WNZCqWxUKvLpuJYNTSGnDzCER8Pxr4YXSlEIYPM0MeWCC5UfaltQI0F+iLAdX94bWo2SDEnWnXNWoC3BuE5qb06yQII9uSR1Ic/r5RF2BCSueZ1SG2S/UM6Z1Eo4HzBXVV+2L5c7n+iLjiuiRFZIg/U6WmiuV6tFFWxePsr9T1kmGvP53IUk4akKxQzagN09/oUi8JFVTaXaeddz4j6KRj8T+UclcBbFioluZ0XTMZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uulM/32YP0DyGm5vEMIBeRIHbm426Kg+NKl4WxXzrlI=;
 b=Frp7UcJU+J8BulviDntWR3QMVmlODlssDk9k9IhElSmV+9PII/KOERxAh50FOdvm34t04gpIOMByEGR5semclLDOB/6gTIukAiXj7ea+dqHXd51lhY4X8EF5SycWNMn6Js5FgN4EipTJ4vUe1A0hmqlTXZTR4lVb8KVHVce7AUWuRnUZMvmnI9WlvYPnp/aVuiIOXE+MLQe8tMgU24n6udIIOZazPfOp2oQ4+ephtXCrBpjXijFU8kOVaFKqU1neI4sllFU4iDs3TdnwNqz2+EzSU1XH07dV7HNc7t/cAngC2PnO2sa5hb4sdBPFAqt/R+8Hdda7CJLa1B8RAoW7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uulM/32YP0DyGm5vEMIBeRIHbm426Kg+NKl4WxXzrlI=;
 b=SmtzPwr9e8nuGgAKVmvgAq/1bYkzJKnXwgJ0uiCJanqs/HryB19MKydJ4mHH4caOFRoNbBNXd751uFaj2ExDli9koAL8+FjCf0Tm2cvlrRa9+h3Dc8gpHl94TiZxE5VDzNYv9mH0/M7oK157GJR9jV7sB6BsSKS4/12aFuk/zfpP/ibDyybhDsmjtTBGEnRVvph/ICYPob9/F0RM2qYudzUn/dRCdq3yP4H96ET9ZyxbWhz3SzLGh6fR8khVKILRSiVlTnS29CCg7PWYXQYRVm7wTOMvhyYCt6Xr0fKc3O6hL8xg1Ag0OYaGLlteZfZQW6ydLEa5i6dz9wDuWK4Q1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 11:37:21 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 11:37:21 +0000
Date: Fri, 16 May 2025 06:37:18 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda - Add new driver for HDA controllers listed
 via ACPI
Message-ID: <aCcjbp717oux8hA6@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
 <87r00qx78f.wl-tiwai@suse.de>
 <aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
 <87zffdvvj6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zffdvvj6.wl-tiwai@suse.de>
X-ClientProxiedBy: DM6PR02CA0168.namprd02.prod.outlook.com
 (2603:10b6:5:332::35) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|DS0PR12MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: cda43d4d-714e-4c18-bb65-08dd946e0557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d12YGtqopxPe8AMptIp292zWXqn6YdH5NoX5L92LEBK+p4jtonkp+M9G/qpP?=
 =?us-ascii?Q?+busqqTnP8u8lzAtuQF6UeUSGIURlpQ6EgadutwilwInSGHbZcP2v5nh3xbo?=
 =?us-ascii?Q?nhLL6j0ZICgv1O2F5xairmNvgC4AZjyGwOWAjpQUVpwJXSj6Ac6gh5OJlNlS?=
 =?us-ascii?Q?kwwTBaqo+6h4UqmQ4W53lBbTs3onNuPRk3hSFajmCrgx03dc8w3EywKYkxB/?=
 =?us-ascii?Q?jHimibGK+0qP0VIxm3skAtDJXCuJe0TlkD9M+Gj6xOOjWP0kNVg/BxHZnQsN?=
 =?us-ascii?Q?s7iGz5Qkxu+Yx2UiI+GSJ2JenUcihxRQBYo5LIeB5PCzeQ5M27akZuoef4vA?=
 =?us-ascii?Q?Akp68OfnBVN8Zrvr9zIT8e+n0JN7rzFSd3sZMvn4U0VW0sQBBfc1usZCiVin?=
 =?us-ascii?Q?8Teuos0NpWGrs/gJlpbt5Gg9MYvg7Vkqi0LkzQSx+oEcingEoZAp3VFjBhuc?=
 =?us-ascii?Q?vfflfUSymyl6SPoc7dY/ui56BrsSiYlI+nNtFFNhe0TBrns3w2e9SXTwLP/J?=
 =?us-ascii?Q?KE+K/V+J+D4wztQfTBuuk0kWnhN7GyignahpSjRHhYZrq1EsYmSWRJ/T2iS3?=
 =?us-ascii?Q?KmpfAf/NpcI4owYMpWpgj0yZ82KuCA5X6us1c6ko2tFyAFkMP9imcHJAdNzJ?=
 =?us-ascii?Q?uAcr5TW2t1yKQ8yyazOI7BHLO+sWJnf5GkwuUtw4gWqwzXSnraZfSiEaiPd0?=
 =?us-ascii?Q?OGtTYQiiIrp9fF1hbsz7wSWYwL6Th6qoR8w7sshB9b87kOv7YuF2skLahOK0?=
 =?us-ascii?Q?AKF+Rour+LyQA953giz1z4rzbLQE5Uje4Pd09jg324SyDLk7uLUuydYL7aAs?=
 =?us-ascii?Q?IbwTOLbdp52NyU3nlomOr4/LCb/tDlSCA4Fdy2hszG+psBs0cFvj5O3wDzfa?=
 =?us-ascii?Q?GdKcG9/tZy4S72GwJnmjciV3in3HKM+VTgKZujhrlUuiyN7HnK9Iwq9Hz43Y?=
 =?us-ascii?Q?nwhKyg+YcrlD7IGwwqisOJxcXrkfKqX8P9F0SovkN7WiXiKsRZuD1CWGyOoB?=
 =?us-ascii?Q?7Y99L26rZ09RvpJyJgCl8UmynsYVPljg2xPC7MKWNbPHmjkmK4oAxqj0bgnU?=
 =?us-ascii?Q?Q+Ttgf5gC2Ipomu4OBHK9AAyPk/2s6EdBA5SpsRahh/NL8o2xJkMVBuszr4R?=
 =?us-ascii?Q?XiJa7++D4V/jhtH3y4MTffVMGr9tOet+hsFhK7Oi2QgDGcvf22innc8nPkUp?=
 =?us-ascii?Q?B6zbIp1SCx3+l5ZyuZPbM2mP6Cp94R2Z+VOPI2aCpSxK2j/Q84x0u6zxD4oh?=
 =?us-ascii?Q?dhYrPgJqX+TB4SCOpQW2c/PYNAN+wq7dzT5kgjbCbJmJDme8A286Mf7Ga706?=
 =?us-ascii?Q?xwSG2rtkytYzU2pFR3hX/dhsUFgV5+Of6yUIxUSTgDjStifmE88FAl5qtVm+?=
 =?us-ascii?Q?qv+nxHysRKAQDdtK4j8j9j+mTzIRBB/ckxw4+SewCyPl1tehtZTyolWor4qz?=
 =?us-ascii?Q?6dK7vKvXMDc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rGsbgjHfQ3cDgmVCb9NuVAAgvuyO9IkPIYX2er21rm8/8P7ilJ/fgpL4SY9p?=
 =?us-ascii?Q?KRAN4Jw/SsaC/DSUsouePUTDCjEmaJd49ve/N1wxzuVhjkSTFP5slSW0bYaF?=
 =?us-ascii?Q?0+SvufUpZeAS8q3UmQbaBFI1mZhsZiT/4HvBChw0oEP2bJHPRyNBCxJSoWX/?=
 =?us-ascii?Q?5cHUKrLiBrS3BQNonKyOo6ED3XaahAkJmUU4VDZywAenb1BhV/Vbp383Y5ZD?=
 =?us-ascii?Q?0jjtgeB7eLqLfEdTP9J6KsPIFHB8nhh3EjdxBlIfF1QYJvPN0yPAtCFE7CZL?=
 =?us-ascii?Q?kg5aBhM1e8rKTLP/7cnQWwXfzICPwmsif+E7p032oINWGZU/+597PGf1qD9s?=
 =?us-ascii?Q?rs5iDcPxrzJ5C6n68nrgaf9m3zxbb9+WqN2G37DCxz3zC79iLCfVEuDE4ahg?=
 =?us-ascii?Q?cmTLSdWr0ANgovUAaVwD1cswvQ1KpSUL+ijTqnL3zdG1kY0II9UR52iVw6UW?=
 =?us-ascii?Q?ZUrMtufI/8DcrwakX1m/NbBI/5JRQe7N8Al3kQcFITLr2eAN2VEHwZQmEClV?=
 =?us-ascii?Q?V9E/9zTXFeg4bJUxmXF5oPoZgwSfGtYSQLLeuE5PWG3fblP896ZaKV2X/egY?=
 =?us-ascii?Q?LQulsJufIwOY3+K8Pn65PbMVJYf+1mkspsHLqy4ugVKiNVdvZfY/unzsxx3+?=
 =?us-ascii?Q?ZLTsneMZZbAZKFpkhep12a6iT/YaDsn3cJcThFZ3b6rQoP2j2cDuuEOjJhOV?=
 =?us-ascii?Q?aOqqciXylJdQTA6Doio0Agh3ZGTsBuH7NBieHoNVQsSNCS6YFa7LELYa6X7p?=
 =?us-ascii?Q?Eed+dRC82zKs6wz3uZRHFhc8qnjqEHduNmXRKDZ12E7h6WG4gLimhcXp23ku?=
 =?us-ascii?Q?IYHWx29BPv3nWM/9SkdjC91N1y4f3ntcqlbhjDWtXlCdn4Ic5vsZNwElyzQ6?=
 =?us-ascii?Q?knjtvWQnAzHpH96TYGaOlnv2C3nPXAfMqaC3jhj2F8MdmGYUBAVorlWhT9ZH?=
 =?us-ascii?Q?clW0HjjhguEhPwwUzRg0hXwA1cqxXTOy+XHq3+GVIXNTos5g5fBpDTVpzRUn?=
 =?us-ascii?Q?gFx1iLfyQxNO5yfOKDnsD/GSLwiQ5AN18wLUAFdDC8X5LhXPnzHsEYEguzrG?=
 =?us-ascii?Q?SG5j9VgyGNQGQYU8YLIJjxJCvGSXUhyO6ArE93XFaDQTVB9bqaHp3POAakeP?=
 =?us-ascii?Q?p7iOqrjWovX8r2pk+ymceqGzBlTPLqKz2yECzRo6Dq12f3WIVTjqU5Evlar+?=
 =?us-ascii?Q?vbbUgxulmJF2yVFxIVIWrqWx4GmH89cRtJWZxcmJ8wZy5nCrRPbXnxbJGE1D?=
 =?us-ascii?Q?Jk+vsVTxPvgBuTQNgXPLYW4DJlJkXl60+Bntw68OSIc3gTnN4OD3r+B+gtlZ?=
 =?us-ascii?Q?/hfl25SG15dWXmKpNy6CGnaZ5KhypU3hkhcU6RjnSGfk0hTPoAH3rYISInq4?=
 =?us-ascii?Q?wKa39bpg+UuUh5dnHo3BIoGTFU1VgkuKeFTNndQfPkG4+4ylDSfRo9vdeJ92?=
 =?us-ascii?Q?CQgCjpRX//Dx/H50aUcvlIx+wIeqJD0VZdtM2y2uOC5sevv+Poa2D2OYyR9H?=
 =?us-ascii?Q?kIWqINdSewcV6Zs1qWfDUfmvHwV7QA/eiPZerBfYO9R/bwoIZ2wFkNfgn1PJ?=
 =?us-ascii?Q?Z+xWOC8v8GsBkEvWuusHBo9mySeSX/HMsLEsohkH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cda43d4d-714e-4c18-bb65-08dd946e0557
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 11:37:21.5275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f/FLVsb62nAfSme+xIJNtU+0+9BQ0Pitx56xMySBOfbBsWCfZ8e1BkcFXJDQmT7gczyRl0uS3cUV8MhY+xBE8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8044
Message-ID-Hash: RC3R6KZUEHBMWHZQQLAKQL74JCLAJ7LH
X-Message-ID-Hash: RC3R6KZUEHBMWHZQQLAKQL74JCLAJ7LH
X-MailFrom: ddadap@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RC3R6KZUEHBMWHZQQLAKQL74JCLAJ7LH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 16, 2025 at 09:56:13AM +0200, Takashi Iwai wrote:
> On Thu, 15 May 2025 17:47:25 +0200,
> Daniel Dadap wrote:
> > 
> > Some systems expose HD-Audio controllers via objects in the ACPI tables
> > which encapsulate the controller's interrupt and the base address for the
> > HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
> > table dump excerpt:
> > 
> >         Device (HDA0)
> >         {
> >             Name (_HID, "NVDA2014")  // _HID: Hardware ID
> >             ...
> >             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> >             {
> >                 Memory32Fixed (ReadWrite,
> >                     0x36078000,         // Address Base
> >                     0x00008000,         // Address Length
> >                     )
> >                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
> >                 {
> >                     0x0000021E,
> >                 }
> >             })
> >         }
> > 
> > Add support for HDA controllers discovered through ACPI, including support
> > for some platforms which expose such HDA controllers on NVIDIA SoCs. This
> > is done with a new driver which uses existing infrastructure for extracting
> > resource information from _CRS objects and plumbs the parsed resource
> > information through to the existing HDA infrastructure to enable HD-Audio
> > functionality on such devices.
> > 
> > Although this driver is in the sound/pci/hda/ directory, it targets devices
> > which are not actually enumerated on the PCI bus. This is because it depends
> > upon the Intel "Azalia" infrastructure which has traditionally been used for
> > PCI-based devices.
> > 
> > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> 
> Thanks.  Now I checked with checkpatch, and it complained a few
> things:
>

Thanks, Takashi. I forgot to ran checkpatch. I addressed the ones you called
out, and a few more that you ignored (I think on purpose), except for this:

> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

I can add myself as maintainer for this file if you like, but figured it
could also just fall into the default maintainership of the directory (you).
Let me know if you think it's worth changing it.

> WARNING: Block comments use a trailing */ on a separate line
> #168: FILE: sound/pci/hda/hda_acpi.c:79:
> +	 * devm_platform_get_and_ioremap_resource() */
> 
> ERROR: code indent should use tabs where possible
> #182: FILE: sound/pci/hda/hda_acpi.c:93:
> +^I                       IRQF_SHARED, KBUILD_MODNAME, azx);$
> 
> ERROR: code indent should use tabs where possible
> #308: FILE: sound/pci/hda/hda_acpi.c:219:
> +^I                   THIS_MODULE, 0, &hda->card);$

I disagree with the above two, but I changed it anyway because it's easier
to do that than to argue with checkpatch. These are both continuations of
long lines, and the single hard tab matches the actual indentation level of
the code itself, with the subsequent spaces serving to aesthetically align
the continuation. If someone is viewing the file with the tabstop set to
anything other than 8, using hard tabs for the alignment portion will break
the intended alignment, whereas using spaces will keep things aligned well
regardless of the tabstop size, since the single initial tab will resize
consistently with the tabstop.

Perhaps this style point has been discussed before, and the policy that is
enforced by checkpatch is intentional for reasons I don't understand (I did
not check), but if this behavior is unintentional, and using spaces for
aligning continuations of long lines is supposed to be okay, I can look at
updating checkpatch to allow it. But for now I'll go with the recommended
indentation since that seems to be the style followed by other files here.

> 
> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure th)
> #405: FILE: sound/pci/hda/hda_acpi.c:316:
> +MODULE_LICENSE("GPL v2");
> 
> Care to address those and resubmit?
> 

Sure, I'll send a v4 shortly. I also took the opportunity to address an
issue I noticed while cleaning up, by adding the following:

        hda->data = acpi_device_get_match_data(&pdev->dev);
+
+       /* Fall back to defaults if the table didn't have a *struct hda_data */
+       if (!hda->data)
+               hda->data = devm_kzalloc(&pdev->dev, sizeof(*hda->data),
+                                        GFP_KERNEL);
+       if (!hda->data)
+               return -ENOMEM;
+
        err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,

My intention was to allow entries in the match table to omit supplying the
pointer to a struct hda_data if they were fine with the defaults (hence use
of the language "may be stored" in the comment describing the struct), but
without the above the driver will dereference NULL if this is actually done.

> 
> thanks,
> 
> Takashi
