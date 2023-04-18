Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C486E6FEA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 01:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69208E97;
	Wed, 19 Apr 2023 01:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69208E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681860276;
	bh=oXBCbjDhyYSUlyqqdBfHTXOVCaorT76HGcI2UA+YVLc=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HnkOxouXpt52HMlr8pPotqCr7wcxhv3M6gnQUQNtF1MZlOlqZzgv1S2t2wIJxcZjg
	 SMEOThze/gc1gyHqtOTHXHsg9f91Rmo9NwD5j4I5x+Y6FUqZMInbrWcKFbIvDnNNKH
	 Eag7rMmUTT1L4QWEaEnZfqWirwH4WW+0AsmHo9P0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7779F80053;
	Wed, 19 Apr 2023 01:23:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA6C1F80155; Wed, 19 Apr 2023 01:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E20CCF800F8
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 01:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E20CCF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ILUtTWad
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHQ+j6hWB0qfLz9NWXcznzXd0/QVsnqvdfQpycC2vMk3dMViFmmdqA3hnjE2ksGT38sKQiiWo9+dnFzBRhnnpn4pvYnZp1b8zXFYEdZMKEy1ZbWNAi+ZFD9Wb+VkFiglx7Y2fDAYG0hTsi/7R3O9qa2xkwVr1vi3e+D/v0YC+WzQxXkGPNfXZUJX5OYvffbFv9bQxrppH1+XiWQsk6T2XJlWmMTo0o7JbgpAh+pgt6AFj3S7hPvVqyDiBp4oGTJNeiUBoMGa9csYs4Y0bUUH/O2MsMP0HmVRwmukJk6he16w/ZWHe2mk9dTmZl0PBU3nrITW83lrOTgZsmfvErObIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHpsFbix67xUUHOX9AhfeXP+q5+TKfRBOFfCaNg0Lvc=;
 b=BKpnRlqvHvqt4KWYzRTC8TF2kyf+ycUIsQcn+uO0rYXRFVxcqOlYCnveYfEVwBhdo+BzDdW0t6bV9U3G1JpOa2NKEJ/uXW55C+8rlleG1S9/3PZlEVfShqrc0jz9I/3x8HGIHVgbXUxFcVZzQq7nA8HVIgrm1VdMF9RnZ5I3ZUi6c3DLVGzUXHv+CaYI26xmzAFREyjVilg41+WZBDgHyWMFQK3CLE9P0omALjUF4hX8A7rijuJC4lT3hqaPjlsZdDw3Gox9tBL1k8s3oEU6zljN7C/HPYyFy11v7PQHkibpCh+ufZhvcPGI3N4cRCXHkd12A2Ur0GTDEu4HXzalbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHpsFbix67xUUHOX9AhfeXP+q5+TKfRBOFfCaNg0Lvc=;
 b=ILUtTWadmuchmscI0rrTHUpskLCMdY6DSqr/m5CnT4Plw5eAvDatfchodv/o+nYZ8C7+LF6cmjAJGecAOuR9AsO1QXBgJtLRFINoEiYxyH/5Ua0rHVF6Xn5/VhIVtIXS5eDbTtNG6hhmvAwVsHg+KpJeWuMIcmSkx5c8bSLiiEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB10509.jpnprd01.prod.outlook.com (2603:1096:400:306::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Tue, 18 Apr
 2023 23:23:26 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%8]) with mapi id 15.20.6319.020; Tue, 18 Apr 2023
 23:23:26 +0000
Message-ID: <87ttxcsrkz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 11/11] ASoC: soc-topology.c: use asoc_dummy_dlc
In-Reply-To: <76fb9246-db98-35e1-7ded-40340b2a39bb@linux.intel.com>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
	<87o7nm2fvf.wl-kuninori.morimoto.gx@renesas.com>
	<76fb9246-db98-35e1-7ded-40340b2a39bb@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 23:23:09 +0000
X-ClientProxiedBy: TYCP286CA0318.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::6) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB10509:EE_
X-MS-Office365-Filtering-Correlation-Id: a50a6fee-db55-44fc-8fe6-08db4063df86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vVNSmkvytlDqEHJy8HJHOOnC819+hox1XpcoEoZ7REqr5JmhJWWjEnjzeKnnF3ONowYOEqWyYbuuszpVtQaep9mtusA29DB79TEddkfyFmCC+isF+r4qg6U88yOwev42GvF/1AA9VdRTcrHPNUKCh7Vx4+XChMMxfABufWFoDNMjZsiqYSMZsGR13x8l1V/cvGBqRbKfZgogb6GeUzyBvjn3RY5N5BPUIYqz9LuJolVKNERBOEcdEI/36hnrVN/JlDC0Gd1etH8HCX5qfDsZ1HX/b5RI0WjQ7Fpkhgwt9G/Wd1aBuHVUt97I6aYKcXpv1sVidDpk9Q1hgWUvnwDP5EYfEO3FJMyaF5onsvE09nMet8aEZxKP/bp6KOpbar2sfSRJpB9n9t1ydBxFrE0NC4+zXJoIyHkZb7k3SPlDnM/3hYqUPs9zN/fNYepPTT/bkh12pVyZAPDCWN3+pAhfIeKWXBaElnz7HQL/IcbYhCCd7PPezVLbqHG2ujvxHsyy66E8WvrArepp+OuYvjFTneKiM6aa8DGWBTHIvhp5eYMwHfd75zma4X0jNZTQyfSn9L1TZlMs/vm1p1P7TvfHn41AWHuKAz7BHoOrJLNx6x1RqwjL4saSfL5oyF4l7Xyn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(6916009)(316002)(54906003)(66556008)(66476007)(66946007)(4326008)(186003)(6506007)(6512007)(26005)(38350700002)(38100700002)(2616005)(41300700001)(8676002)(5660300002)(8936002)(6666004)(52116002)(6486002)(478600001)(36756003)(86362001)(2906002)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eL6dG0AnCJyLk0bPA+L/IcMwsj/R7BZ8HOSwE9tCoDezWWYNLXjDLboE+Bf6?=
 =?us-ascii?Q?i2EIoBXELTDxW4YnZuiM+3UUkyLPG9X6DnyQ9HFmG7c7z8IB/81oeHWjPOcv?=
 =?us-ascii?Q?OcsEUNBRnzXFXcybjfigQpESsCeGM8PIaUo1MCsuZMyZ3/SRN5cxnZC5Z+LM?=
 =?us-ascii?Q?lDkucnjtFbVm/q9jcnubgnYP66yNKP1sQ97PYJPLWZbwjvL2zqd33buBKYS2?=
 =?us-ascii?Q?PxTAQ3GHyTNYR+E8MsfR84fsdDx9HOWe0cbVMoIf2vNrTYdQBzfFnDrLEP5C?=
 =?us-ascii?Q?e7NQDZYkp/fON9QcANTCsp5gwJRIUa3ajGW8r46BO45rAh7RVbAEnuJjZx0A?=
 =?us-ascii?Q?mUWe18LNug9vx9S6PBeDyluC7ygpdvvij10eFIlnhD57eNMTarVqM1dw5W38?=
 =?us-ascii?Q?fVq6cX9bYwFHHriIQb2GmmBWuaawUIr/ZeQEUJYH5OMoJXLvC1SQS5kHOK7v?=
 =?us-ascii?Q?9DRuTCZNEtH6BSrRHzyPGMD5x5zFX8W6eLeW0gMffkL7McmqofP+l5ZX+5eD?=
 =?us-ascii?Q?R8rxjavPj9BRaf4T96zt/T9+HXFTE2M0D9rJEBRg7dfC9oYMFvx0Dl1kcRjI?=
 =?us-ascii?Q?Eae9pPUwHWCgE7Ga71bIOUfFyK/sXGAMc0MjEvOHCHVAzU8z/FPRk+NVkOz4?=
 =?us-ascii?Q?PRBIkT5xUT3/V2erhW8IU53A5KCDAGe1X5fP/BHksxeFMQ5+J3pnC4kVjngD?=
 =?us-ascii?Q?eMzbRtMqzjgIdoUNgN9ibxDHmLo2r+N1Ntr8DcOgdYbgBinSfbA7pQyxM5Le?=
 =?us-ascii?Q?/wiloIhLhFuvZUfrqLd+rJCnIF1Mp4W07gBYRa066PsoG/FlZocmJ4Sy1+xG?=
 =?us-ascii?Q?StFnALhX26ihdJ2b6g3Oo6nkzrFgWGpFuV8QOilNQcxhTd+8A/JFvyWI43ou?=
 =?us-ascii?Q?amMHaAbKvWTgr7v1DNA8W01CSVcYs6fsIlmdYb4wmv/pc/Jv4GyAKDYGFS4Q?=
 =?us-ascii?Q?lRDIz7toAa2BeS61o8lH9tNQfWuAw/zZnsQiEUam41COOAIyyUCLE0Dtb16g?=
 =?us-ascii?Q?p6kBxtwlvwKbvvsacFGenms1XcX1m7obPcxGvepOZkHSd/1t7HCG9qAMVhQI?=
 =?us-ascii?Q?4FwJHcWny/E5pkHVjlj0iE1VsNwFp7CT93rd6dNCaBKcqajlWfmjUu519xcq?=
 =?us-ascii?Q?L+nl8G6oEf9Z31UAgQKoAmA9NcgMJez8pgSqqjeVpfv9dp0+yXu8n5JuD72P?=
 =?us-ascii?Q?F9ElYlm7TWw6+A42zOgFnMk7sFkWbtraEUxWbC1U3/7TWgHGHbftkWQRD1l4?=
 =?us-ascii?Q?uevOg0u5bt5x6GkqmJns0Za9tiIDm6LOUZcbXjnPyVFjtYXmMx1jG8pDCHKC?=
 =?us-ascii?Q?mpuF9RDDIknyyjZA4icGP2iSdh1wX/16pfUqua2fHWLZazya9SG73252Mlby?=
 =?us-ascii?Q?ueFBVelMoswcKZvZ4ONaj1QnGWwfyNSW7Tw258jE4ZVGDKZlQs8w+iTVFWJS?=
 =?us-ascii?Q?n8WTkcteeWNvRvsY+pSd7qr7RueZ55teAnhJ6YZmE9Ljf4RslnIHFFYWQN9Y?=
 =?us-ascii?Q?qQimhl15fSL/svvK7O2KpDbAY/CrqeCKRlyAKIsYP23cQ+hOAn/igcQQdNKi?=
 =?us-ascii?Q?TsxtGMs/YYQ6dZ0ADwVGFlmxOI5+OheUqa6ClwfWagELiwovNAQeiIcfD+hU?=
 =?us-ascii?Q?Bj+FN24o9dc0091XB4JLwqI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a50a6fee-db55-44fc-8fe6-08db4063df86
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 23:23:26.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 n9ptq1cIJundsBwej0/fz5G+Jd/NtoR8gdrJ3wzz+D2y4zH0oAU2aWZUXZw4iLs+li/rznUPVglrUT1U/vIZik0esmcQ2fuCeT8/N5D1R8c5iKBJe5ROZWL4hQe68YSA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10509
Message-ID-Hash: YKFQBWSH3E7URRJ4ZRH224HMJGEAVBS7
X-Message-ID-Hash: YKFQBWSH3E7URRJ4ZRH224HMJGEAVBS7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 peter.ujfalusi@linux.intel.com, Cezary Rojewski <cezary.rojewski@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKFQBWSH3E7URRJ4ZRH224HMJGEAVBS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

> In case of topology I'm not convinced that it is a good idea. You set 
> link->codecs to point at global object, but if any of link modifies its 
> link->codecs, which for example can happen in soc_tplg_dai_link_load() 
> then all other link objects will point at modified value.

Thank you for pointing it.
I see. Not only "platform" but "codecs" also might be modified on topology...
I think we want to have such comment/note on the code.
I will modify it on v2 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
