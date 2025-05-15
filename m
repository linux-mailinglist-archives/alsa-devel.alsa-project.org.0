Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFAAAB8B5B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 17:50:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC2CA6019F;
	Thu, 15 May 2025 17:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC2CA6019F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747324198;
	bh=MQeoYo5SOB0t2/sPz4F4IoE3AvaflAyLGWcyP828dc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hZYJvq5j9zwG5CN6dXF5v2Hj2rOyg6Id4+PAsZZZKJxi13YugreFeNI6/+gvMJ09u
	 ZvigKnyUB35JZNjrb2n/cAoBtFOfgNterSqkhX+FlxqdzcexsRCf0uspvF5iGvzDJC
	 bxBrR1KmI+mjg3rlQ3Vxh5XHUVvipASwCT6TbI2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F08DAF80217; Thu, 15 May 2025 17:49:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF3DF80171;
	Thu, 15 May 2025 17:49:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 397D5F80075; Thu, 15 May 2025 17:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 521B9F80027
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 17:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 521B9F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=iyW5K9sx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbY7ramUbhFFR/rSx55hhE6XtmeSNdrvwpXGJcHRlKurkN+kiW4sKKZGg4rHdg0cJjBbj4BlyndBrOxvCmKYvGelMCgnqLilUqhy6yM9VO7Cnc1q/KHJ6l2xpIHnrbakhyNChDuiQZXaeE7dCiZx/RQDn9UY/YN7hyz+aVntMF/T4A3/9+lu1jyzo5gsBwjVgCwZqKqs/RvDN4T/lMMg7TyN2O90pC0ZkhMyRQ6Wc0G60WnoH7WPGKHkJG4thTf/UX1pluD9SNNZweSkpx0kZ3geef/vyoN7PTO2IZik05zHyhMS8zCfHhT7MWmrZjx9vfRTWSBX/dpgx4jbl/oJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PywgyqH5w7nqo92vpfbMkNN8tjuf7ctTnWH9GkIRbmM=;
 b=vLTtm0/P42HtgB55QXCqAbfSGEtxWsvCBhoKrtErwDIgR65YziNyE75C0ql++bc/LKMynJ1nD8sRIyF1MTF+YGsqjmrZRSb8K9s9cMfcHml2NffdyxIrnWliSfU41VNLRF1lMjXvmCB/J/WRaDMcctxS6ybtNTgvMh4koN7qFsZaKjfY8ljOMQl8BPoNdd4vrV0nDOUinEewtG3uSy81t/Re0jSZV1nZjpdMWHB0fcESeWxUuBCHeVc/E4P064yiX/b0jvnyN1m2UPsW6WxSGJpjWRVUSCwyZwQPU7R94xNhKH3PT8RmS0vp4CMCTTcbywu/M0ypjW0nIY3kK71r+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PywgyqH5w7nqo92vpfbMkNN8tjuf7ctTnWH9GkIRbmM=;
 b=iyW5K9sxBLXecpyRcYBYfL911HLVVpakCS+5z74dgDNjKOTWnoYCPDk59cBCWP6HrsrvzjNdFgfI/qKeRgHePXk8DWOGGFjctBePAJtYkv4G37b+iDE26Prik6NIP22fiwV5Vhk2O85iV9sc7Ph9SizAv2MAOgrQtqbC8FcPn94USepuw+fNxlLxKFXGcGv8FiDaB8ZgN+xd/Jv5uOJNtrsIcCSJF2eD4cPUAnqanfBaSUcI9HlE+DsgizvKQS9e/1rwaztxLkh987dnwi6h8yd3n9EfG1X8XhK82DIZf7hiVfVnlpjn+Sv+vr9YP/8MA9oCGL6ccOGc+oPL27YmdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by PH8PR12MB6724.namprd12.prod.outlook.com (2603:10b6:510:1cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 15:49:13 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:49:13 +0000
Date: Thu, 15 May 2025 10:49:10 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda - Add new driver for HDA controllers listed
 via ACPI
Message-ID: <aCYM9v7QP8IwLj5Q@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
 <87r00qx78f.wl-tiwai@suse.de>
 <87o6vtylem.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6vtylem.wl-tiwai@suse.de>
X-ClientProxiedBy: BYAPR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:a03:80::27) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|PH8PR12MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: c983fb17-60ff-4605-0a70-08dd93c80a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pNEoXl7eLUb91j2EXNvn9YWwfYbeybERizdmSFlq8jtQnZLRgoeNwjIdQmBv?=
 =?us-ascii?Q?GWY0PNB6/4WPC/W8pyZcEvhPJ3pn8C8KgH89nvmg2M/eLvV1AqpiR/5XrIXX?=
 =?us-ascii?Q?BTPKD3qEL5pTItqkCH/Z87o+x8901mYASRM8iUJva3PpyguNzuJS7AfXrrSA?=
 =?us-ascii?Q?UCoXZSBCseFIZ9UrRcl8Hotowu5o9gHcrA+63j2kRRTuESNmrT6Cdo8bOzCm?=
 =?us-ascii?Q?8O0rRJajSFeeq71UbPVh5lbYiWbnYgKwf8B3NrKZblk12o/uhaCeUf6ynaIJ?=
 =?us-ascii?Q?+UFVmPXfWgbbXbY0rNpf1i+eOV+RW6S1gh9Hu2uKWaCiYIfT0vlXggra+7Qf?=
 =?us-ascii?Q?HyQ0rxdmyhNxMqeokBt/A07R3xVcIPocAozXI0gzcRFmj/Lq6UXTScD1xxHk?=
 =?us-ascii?Q?gOD2zXkHb6D/+ANWItEWuo/GC2Ef78fONnkmupcdlGEryAbH46/4jYTkMAHG?=
 =?us-ascii?Q?osYVeRt9s9xXwy9V/xCJhTj/Lu9grFMPpe5aZA8v1+lyFZAcLF/I+fiJvyZ8?=
 =?us-ascii?Q?GhEW8UwpSnGGgBZOAJZVaALOyciKleLv7lFqm/V30lrJvuHzCcxMfvV3kK5Y?=
 =?us-ascii?Q?6KXcndCA+TOICaG+ae9vSdzSURfs7GEjzJ9XFqVcYOXNYfa0qLLzKU5bYuMe?=
 =?us-ascii?Q?fdtkRyr+GWhs1u0sdjTNWtJ4XDdILxpj5H0cpVxAnPIrzJlOaWm/eJ7gkda6?=
 =?us-ascii?Q?K85U9h8Oz5gpPXjGztG46zpjatAJ/Zaeq1KRwUSM4W6RDOPPSepqcrUdnRU+?=
 =?us-ascii?Q?x0DTfkucvwFRLDrADtsxt0YAwcmQCdm9sMr0ApQJbJW2mdvecLG/ey8psn3U?=
 =?us-ascii?Q?lxLdEbwkeQzu3Ux9/+vnlii0wQmx8MKXT+FSV2jL68jaqycYcLoUZJZSFA4e?=
 =?us-ascii?Q?apmfLD+CsE9yfGAXXQ8xRzW9Qx3lnwq0wZAhBkHYquxSHTBssBfj4+U0ZFfH?=
 =?us-ascii?Q?IsoCxtvScCEW9KnqdLsXZpd7WxE6XJpI2Q8ZX02WZ/q8SF0z0SjthAbojGim?=
 =?us-ascii?Q?SmXs5sAyOfRYLaEEYcHpytC4FT+nokKmUKFuZ8jdVTxA1mN/LMgEUsUMZdLM?=
 =?us-ascii?Q?l2slFOtEir27tEKtEAX5b/TKGcgfmO0Ud1Tj9jbuBOQt9/t861ObzVb9ddI6?=
 =?us-ascii?Q?+vdypnZCyt62aZSTFP7/NzhEbRS0vfrPlS3YWHwE2XeDrL7XHFqDrp4oQR9+?=
 =?us-ascii?Q?608NaR6VLMkrvatip+O1S0O3ZUoIRcdK214otad/RPysR4lo715xl8tH/Dtx?=
 =?us-ascii?Q?UyRWwW/vBeWaCxqzED62ze7Z3KX2tZceipOED/N9uX52gUAwbXUFmit4UNxK?=
 =?us-ascii?Q?ClG6RRnr0aj8s/+1Ac9kA79tu6ulw8Yc9RowT1/i/NE2QnX2ARcl82RZlmIZ?=
 =?us-ascii?Q?xx20jR7vaBEKvgCBf64D8doM404S+TQVpOunQSR3VIcQDmwSQKyUI7GFFAGm?=
 =?us-ascii?Q?JXSm6jlb0TA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Y4j6+NOaIAOP+oIbG7b6bhrpfZSQS/u+tdxOj+WxFwKPxrSlP/6XqUZwges?=
 =?us-ascii?Q?a7+69W79/Yxu6uhM4+3XsIErQLoM8x4qNQY5RVtloXdS9RrQJKbG/HFxWLV/?=
 =?us-ascii?Q?CIKU15PntEVq/4QOX+QQVx+yNmT+KbRT9d9nNIw351cefUrBiqVzZaBDJxHR?=
 =?us-ascii?Q?YN6IDvvfEpGaNBlBsy0SFh4WNnxeXptiVoWCGhoNF4X7otSll/Cb6b+rc7nD?=
 =?us-ascii?Q?l2J4r8omSioK2y9XTJueBPS1DuPcBW41wgpI96QsFHlFsEOHSwT7BXFbXwtL?=
 =?us-ascii?Q?Rn9thf2laIvBgVnauF+V0v0U1s7lR2KefTHPZLwzqHZ3htzffpKqnubhUAxk?=
 =?us-ascii?Q?/K/E6PgHX+5w+ZcQskSqbD19Rzxx9Ba2e2oML+z16Lpanv8b0FaDX1y7Z+w1?=
 =?us-ascii?Q?XHKbufllEODT8+3wOQNV6RydO0rywJ/7QG5LnTkVN1vTSkEw3WWbSQPYhpml?=
 =?us-ascii?Q?FGB28RN4f1h8FUPZde5r9Rqpy9GDE1tAv85udn+qIyRmi6P4BxfMwUScrsSH?=
 =?us-ascii?Q?Je3tc1lHuAezJCcbO19cJJHFOo1G8tqF0GQJvWJSs+Gyt4ibn++jswkzTy2W?=
 =?us-ascii?Q?+Mi0EuwAlqIh1NJB0tFnEPXlrmudv1Qb4MPjrqQSJPerEwNeeOZXkGJSDuE5?=
 =?us-ascii?Q?4e6ihau5sWis0NI1yEfxca7ZBE+7gowdQLL/9y6ZfWhpp4MO1HvG2+cRU/Me?=
 =?us-ascii?Q?AyiEAlkKc72LxnE+qpyeRz2b6r+AMbtyFgU41tma/dY/wpxzd58jvqRaYiaR?=
 =?us-ascii?Q?LwnXcHDbEmKyE549LObLReQYA1RDmVCfqr/x9NUHcxihF0N+G6CY4HZU0XR4?=
 =?us-ascii?Q?h1MZHc0AQQ4G06Shz1F4gxprjtDUgIxfSRfeKbmj/B4ywKjurCY+Y722YGwV?=
 =?us-ascii?Q?nCObs2P7nuW0Ia17Ged8bZ+RVnh4GkiMY+kJigtToT7nDMEQSTuAOUcJ2tR5?=
 =?us-ascii?Q?el8oxMIn0eUGA95jqhABkn+aChSjxatnADoIT4/7L6s7GCq809/VjEVJmOfq?=
 =?us-ascii?Q?cgU+Zs6Gl9+kpRLIqHhXHC1LVIiNvPC5uSX3/awC/Yk8yisurfhDuQaz8ENy?=
 =?us-ascii?Q?gbAwRH3B4Veo4CMIinUazccZMQnt8GZBxzDq1bOBMOV3O1dwi6gSRh8KrKU4?=
 =?us-ascii?Q?/TAm4+HuSlhznaUbDHR9biNqxPmV4xUG1MLUeh4EvcDS8WZH3rgl84vc5ck9?=
 =?us-ascii?Q?ejzrirQn6FIBfDK6ByDRG2YaXkC3LyGwmjLlug3y2Nfoj3yrW+yHK4qBav5P?=
 =?us-ascii?Q?Rl/m1JeHhn/PR0Na9YiAKpOqxhrbl8ITp4qu5GJhwIjMaAA+oFCFOXqO2QIy?=
 =?us-ascii?Q?4b71nnO4nEs7HDWLfHtd/tGutJZT8VXVej8yF/GGB6ek0IuA8HS8imvFQq2J?=
 =?us-ascii?Q?gLiznuSl+HEStK4dF1HnZ5o2e15m8XKAl8j+LkvdpF7FXzLifqTRtwQS6QXk?=
 =?us-ascii?Q?6M7GG6k75gCw6IQ37TXuzn+2w8Ugi/iuJ+x5vDri3j6kKb1esfjUoa0WRM3T?=
 =?us-ascii?Q?dp8qWEpwKOVEB1TMLKKggKjjNkJZS/o8O6j5NtoXOnc/YdWAXobpyLgNJoBy?=
 =?us-ascii?Q?xyE3il+0wt9Saeib0aJWs/qiuI67r9e+hSETaFrb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c983fb17-60ff-4605-0a70-08dd93c80a2b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:49:13.0936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zQkNifzo8grE9VkA54AbRPvBmAfIjT5BbC9A2K/YGyO9OFYnddJPTqlAJ5LKtcOibVQ43Zma1/OuT6cGVf/umQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6724
Message-ID-Hash: ID7I2ROKM53LJKWEFTKK4YOYMVSOOY2D
X-Message-ID-Hash: ID7I2ROKM53LJKWEFTKK4YOYMVSOOY2D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ID7I2ROKM53LJKWEFTKK4YOYMVSOOY2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 15, 2025 at 04:54:25PM +0200, Takashi Iwai wrote:
> On Thu, 15 May 2025 16:45:52 +0200,
> Takashi Iwai wrote:
> > 
> > On Thu, 15 May 2025 15:31:46 +0200,
> > Daniel Dadap wrote:
> > > 
> > > Some systems expose HD-Audio controllers via objects in the ACPI tables
> > > which encapsulate the controller's interrupt and the base address for the
> > > HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
> > > table dump excerpt:
> > > 
> > >         Device (HDA0)
> > >         {
> > >             Name (_HID, "NVDA2014")  // _HID: Hardware ID
> > >             ...
> > >             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > >             {
> > >                 Memory32Fixed (ReadWrite,
> > >                     0x36078000,         // Address Base
> > >                     0x00008000,         // Address Length
> > >                     )
> > >                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
> > >                 {
> > >                     0x0000021E,
> > >                 }
> > >             })
> > >         }
> > > 
> > > Add support for HDA controllers discovered through ACPI, including support
> > > for some platforms which expose such HDA controllers on NVIDIA SoCs. This
> > > is done with a new driver which uses existing infrastructure for extracting
> > > resource information from _CRS objects and plumbs the parsed resource
> > > information through to the existing HDA infrastructure to enable HD-Audio
> > > functionality on such devices.
> > > 
> > > Although this driver is in the sound/pci/hda/ directory, it targets devices
> > > which are not actually enumerated on the PCI bus. This is because it depends
> > > upon the Intel "Azalia" infrastructure which has traditionally been used for
> > > PCI-based devices.
> > > 
> > > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> > 
> > Thanks for the patch.
> > The code looks fine.  Just a nitpicking:
> > 
> > > +static int __maybe_unused hda_acpi_suspend(struct device *dev)
> > ....
> > > +static int __maybe_unused hda_acpi_resume(struct device *dev)
> > 
> > The __maybe_unused is superfluous when you set up
> > SYSTEM_SLEEP_PM_OPS() macro instead in the below:
> > 
> > > +static const struct dev_pm_ops hda_acpi_pm = {
> > > +	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
> 
> Also, at the next time, please put the maintainer (me) to Cc.
>

Sure, already sent it with you on To: as a reply to the last message. I was
wrong about hda_tegra having __maybe_unused, you already cleaned that up.
 
> 
> thanks,
> 
> Takashi
