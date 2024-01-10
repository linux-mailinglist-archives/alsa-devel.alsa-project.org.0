Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DBD829329
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 06:08:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082CFF52;
	Wed, 10 Jan 2024 06:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082CFF52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704863286;
	bh=6P0r7h6gxwSmlQVD6zOLm4xEifnw83NpTG8a2LMCBHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D1mtNUAkJ9CaZBXrTxofwxkhx+xzi+wmrsmem/W971cHYE8WDezCsahPWLxHrsTdp
	 q1I5LJNlrDSG8of56t6ZO11+0YlcoVicTOK4wp2g0osdHU/04ZZLwSOE0Z0B0x/w0a
	 WSu00bj2TpSJBVfyHH3eX0TfdXVxMnqCU4UVIT3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF52EF805A1; Wed, 10 Jan 2024 06:07:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44466F8057F;
	Wed, 10 Jan 2024 06:07:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1B23F80254; Wed, 10 Jan 2024 06:02:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2B67F8014B
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 06:01:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2B67F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=tWjNCSp3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fo1rNBWEYuHWYOUmh6BsjrYIvXiY61R0LnTmt37wqx7C/FLuFNXltXWjoJCFsI4Q1MDhdRJy626u+9+f3K27TsIEllHG7azsYv15rxouAv5e6hSUhpXNOeNP8aF0YoPJEyviBNUAW5z+QfFmYyofxcEwZaJ16+xoEAebaY6vy7B+8N5q3k4wpiSQ7bPh45PU3sDWcbZXtFmWSG6hbJ9gsq+cKozGAGKJ28nBYiSnaAHHosbpYnmEO+lwiCTFW7R/Q15Ctc/Zh9IR6RTqIbKWR7UvsyK3H7qbG5oZifzZkRcANG6HYWWDVpSXou/XviF3DLXk/hMc8lhflKGKPZ7fcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTLfd+s/mmZ3625zMaf5ARN+IRhX49JxpvtAOZOYhOA=;
 b=U9mybs5KXVlCJW6wbRUjxxWZgSzce099zxzgCTAH/oFB78ZDAd2JaSRjVIcuvDhYLlwkD/aumqmWvUys+UoGiS0R+9hliLZQltCPoN/J0/VUjyf1cMqO/BuRn274wQLZ7wIAfJfABmwTBG7Gq4mYIIiCwvRj7hlF9CjiPbOo2Cg8t78jZ8pljyg8rR9ZkIahXoc5UDh8qZpgpjUhyUj7DgikVnAAzWeA9N0VB7/zmsYhxB5NDJgx+9OSusu9ee1iGKLFxtWfVZrkM75wKW7UVPcrQtzQXTl67qAzTLlYUePBHHxN26RH7eX5BEQpGJWyEhd5AHe+I8WSoSYGmYSXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTLfd+s/mmZ3625zMaf5ARN+IRhX49JxpvtAOZOYhOA=;
 b=tWjNCSp3gAC8dt/nrEjiEpna2y5D+16ghYv3Tjbw3Bq/fkeT4idihnVjcSbQvlIzdhQOVr9iyfhi5MlyE86tnQYp58YVoKGOpe9R2K9qWz8MijQmJOh8kYOMOorzRsmCDETPoyBqo/jlQKJuDS/Tq3Tcfu/OScHTWMEDx5oJcJZ2+3z1GVC5yUCKhiLSdj7UHMVgs90ggedOxVAPZ/hlijnzSxwYwWE88pHoAac+XKQ98+9RDJA1FFsTUXfAellNiLY5qX0197uF+MAO9Vr5RG+W1rv/QVXsWgtEnZbrcleTfDNpo3Ldh/LmtmEh+Ju5HCMSUTFHDBQEtjCt5WZWvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 05:01:40 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 05:01:40 +0000
Message-ID: <cde6d5d5-b6ab-4c64-93f8-78d721a492bb@nvidia.com>
Date: Wed, 10 Jan 2024 10:31:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
 <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
 <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
 <ZZe5sTNz005Tt4jk@orome.fritz.box>
 <8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
 <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
 <e7f9085d-9db1-4c5e-9940-e461835b20aa@nvidia.com>
 <87il42gkua.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <87il42gkua.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd49dca-ae40-4ff8-7927-08dc11993b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hm1gPplRvhSGeLCf6PEBdkvTJs9br8+lVdhpcA2gks7u1kntC9vFYi2LhOXs0xEgnkg2xqDW5EOwiW5LKh1gPCgXfEIFBatISg05Ub2Dg6VmY1yaf22MgmbTjUpgvCTg1mU3e4vhE339srOGIwGrZ/lJmVrWoVM/0IeJQrVJsO25fr6kJQJyGIokS3/YJJ5NVOjkCM/i7K+QsG2C145S+/Jd5R1FHwFRkkxrgOfLMkoUTGBbV5tHzDE05nov8jATIulQLzR3HStW+bp0gurDgcqP/f0Iku7ez714JvogEa/QF/aFYzMBds+0p+caPB+jLSgTHOaAiyfltfULnCtj9+IvfgDyTAg/3gQPvIHRSWMGw/AAc/7Pr26hqIAfhiIvX8jPcV56ng71dyayYgvSIFZjCkRHJx7yPzl458oo3CWaFksxkk41rndgA6DC/3F/1V7qTU7MdCZRVfQGvgSCaFrp2/9bYm1TYGSXgqwBtgOUyrjUnnle2QHKm3GIPU9s1xaoj8y8AJZKkA67Ta2rvcpl83qaKr9LPxgvaPROp4BzYRQObBN5RnefcMa7u/n1ShU9+Dqk7ObyfRn+EeiM6gL9dW7Tq8izt9B7Y4Dgms5HWNKsoP9spIAurxn9swU+QwLbsvbix74tn0zV+LCLrkcEnf5CmMfd5C717tjBpz/9JZFy4MjKcrF6If572BE/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(6512007)(6506007)(53546011)(2616005)(6666004)(5660300002)(4326008)(2906002)(41300700001)(478600001)(6486002)(66476007)(316002)(54906003)(8676002)(8936002)(6916009)(66556008)(66946007)(2013699003)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0xzQjNCK0RDYVRSQUpDY3R5bUtFSnVnd1hBbEJJeS9yM1dkODdyY3ZXS2d6?=
 =?utf-8?B?Skc5RUFLb0VBQUlkYkVwUUs0YktSUm5JalpvRVlzMStTK21xUVFVbVU4QzJO?=
 =?utf-8?B?blZYN2c2b3BwNWtRSUtuVVZFZk42NUszY0NQRjlRZUxQNHU4M2o4bFIydFNa?=
 =?utf-8?B?RXpwbzBKQndrelF2dGF6RWJXVUhkSG04REE1enpkNmJPK3ZBRzcyZHJ4VDRw?=
 =?utf-8?B?Q1ZTRlh0a0h6ZTJLY3hwNkhqUm1ZL2o3UmdLc09zbWdqclpBZUpQOWprN2I3?=
 =?utf-8?B?WmFLNXNMb04rdllOVlNKTWhCZWNuWnZtVlFxTnZLa3ZEV0wraTBENm1LWmhQ?=
 =?utf-8?B?cGt5MFFxanZHMXhxeTlVVkFZaW9vZ2JRcVRIR0NNV1ozUkJ2djJrcEpCQVg5?=
 =?utf-8?B?OWRmaW40d3RlQ2t0QXZQR0JYZmxPWUljMmNnS0ZtdnUzb0lmbkZTSU1zOHJC?=
 =?utf-8?B?b2U0Q1BTQ0JodG11T0t0b2NlemkzeEh4Uks2WVhOZUFqc0d1TjNVT1R6c2JB?=
 =?utf-8?B?a3ZabW42clJGRllselYzQ01Mc2ltKy9vdDZPU0xGcDIwVS9VaXlyemVKRU9i?=
 =?utf-8?B?Tmd6TjJ1amNGMEZZVzVDWXV1NDhWaHhWMlJmVXNmUmROM2xzbzBkNkNMRmFR?=
 =?utf-8?B?SEVBTG9DZzF6eTE3RXRUbUNZSW41TzgxN0xtQzVqQ3F5bWV5RlU2N0U0MXd0?=
 =?utf-8?B?N1IxRTZWVWZEWTJubUdaeU9aUTNHWDIrTXZoMlp3OENiTE5lbXd3dXQvNXhU?=
 =?utf-8?B?Snk5YXYzZW45S0hva1pEL3UzOTNOZ0xJaUFLS2JYSGJFdTArL0tLdkcxMGJu?=
 =?utf-8?B?UHZrZTJGQWFWdFcwY0dtcWx5SUI4ak9hYXdYeXp5SnNNajMrdnlJT0g3SW9u?=
 =?utf-8?B?eGhETytlYXB4Tmt3SjFrUkJubDQ0SVNvZjRmcXBXeThzQVpLUm5Qa0xoZ0ta?=
 =?utf-8?B?M29OeTd2QXZkNXdwNmg5bW1KMUYraHhDNHdXVHJvOE5jZkxTbGpyYVFTWUF5?=
 =?utf-8?B?cDZISkJ5YW5HMWhRelpoMk9obzR5MmE0Y3lzRjdUa0g3Z25Qb1ZJQVVYMk4x?=
 =?utf-8?B?TVNWaFNJSC9XZytqRzRYSkpNb3dsUUZFdHVMcVdWSFN1R3pzOVpLcFZOeDZI?=
 =?utf-8?B?dGxNQWtra2owSlFlYkR4cGtqakgwNisyYVZ4OEF6U0pFSUFJYzFuOFNSVys0?=
 =?utf-8?B?RUF2N3pBWklpUDZCU1krUjY0WWdteXFGcEVrbnRldWFKQnlBR3Q2aFJEemts?=
 =?utf-8?B?aGgrZGphanptaU5KNm1XT0t0QVJwWnlsZjY4U0JDbys1ZzB6Rm5GcnhpczYv?=
 =?utf-8?B?OWJFdWk1enNUQTdxamFuemxDZGxJd0RPdWJGdm1VUnM1aWwyalhvR2QwTVFL?=
 =?utf-8?B?UW5GZHh1Sk9SRXI0OXFXZlpjdEFRY2ZBeVJ4UnFFUWIzNzFERWpFM2ROcGd1?=
 =?utf-8?B?dUZqd2dDa3k3OEhHNENYSVFWQkM0VmNTUE5IZTR2UWU3UFl2eEYxWndWaCty?=
 =?utf-8?B?cHJYVzQzZmZOa2FYMlpSViswdklKZk5NNGxuRUxCaFhVQXB4WGRsMHk1d2U0?=
 =?utf-8?B?dHBiWTEybExJQ3kyZi91ZjIwQ0t1eVFkNTZ0T0pqZWZGQ0lmRnRBZ2JZaE1W?=
 =?utf-8?B?QUNkbVhzdEhkTktjZHd6NkJXSmd4alp3ejB1T0R6bUoyVjNnNHVTTExLTFZl?=
 =?utf-8?B?VHhIbytEVjhwTjcrakFRVEhPb2t2L3hvZ212eDUvMzduMlVCaG51MzAxejF5?=
 =?utf-8?B?eTBkdHp2L0xkWFB0c3FOdFpyWnhEaVdhZnZJMGt0dnllNVVxN28rakN0V1l0?=
 =?utf-8?B?SHBMMUFFMTVxdmJQTXEwY01yTUgxWnRZRXEyNWxXKzRldW9oa2RpTVlYVVRQ?=
 =?utf-8?B?UkhXakYza25UN0huOXl3eHVCVEVaUjIzaGRPamR1dnRCZys0b1A3OWtjd0hj?=
 =?utf-8?B?L2NPbFZiUEg5WGRwZ0JmTDBQbnBsVlhLZlZoL0xtWTRRNnNucVkxTUE5d200?=
 =?utf-8?B?ZzNQWlFUTW5KZG5IN3ZHYytPZDdPRE5nS2R5SjNZaVVvZCtFb2tOcjBwamNM?=
 =?utf-8?B?Ym5SNEVpWW5EZDE4REJKZzIyT3hZM2NRRzhKVnJ1ekRPUytkZHNzMC96WEww?=
 =?utf-8?Q?g/jpfRixZEhG+0DRyZ7ofTQHY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8dd49dca-ae40-4ff8-7927-08dc11993b54
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 05:01:40.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CQeQhvWVoEDp3O7AUYZV/Kz5HJ+HcRZVMeDxnf2YKancnObmQ1UeQ9DGpg/OuyGv9U8qEv5OOiydMFiGIwNU9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103
Message-ID-Hash: VOX6LVVMWWHHXMAH6OW6DL6HNWDA3GMU
X-Message-ID-Hash: VOX6LVVMWWHHXMAH6OW6DL6HNWDA3GMU
X-MailFrom: spujar@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOX6LVVMWWHHXMAH6OW6DL6HNWDA3GMU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10-01-2024 04:45, Kuninori Morimoto wrote:
>>>>                 /-----> codec1 endpoint
>>>>                /
>>>> CPU endpoint \
>>>>                 \-----> codec2 endpoint
>>> It sounds "Single CPU - Mult Codec" connection, and if my understanding
>>> was correct, current ASoC is not supporting it so far.
>> Yes, this is a typical TDM use case.
>> __soc_pcm_hw_params() call in soc-pcm.c loops over all CODECs for a
>> given rtd. So is there something else you are referring to which makes
>> ASoC core doesn't support it?
> Oops sorry, I was confused. asymmetry Multi CPU/Codec is supported on
> ASoC / Card2 on for-6.8 branch.
>> Also the binding properties of "audio-graph-card2" seem to be different
>> from "audio-graph-card". I am looking at a simpler extension of existing
>> bindings for Tegra audio without having to re-write the whole bindings.
>> If "remote-endpoint" can take phandle array it would be simpler from DT
>> point of view.
> Yes, "card2" and "card" are similar but different.
> I'm not DT-man, but I think remote-endpoint phandle array is not allowed ?

Yes, it is not allowed and there is DTC error. Exploring if there is an 
extension possible to allow phandle array.

> If my understanding was correct, you need to use multi endpoint in such
> case instead of phandle array.
>
> CPU
>          port {
>                  cpu_endpoint0: endpoint@0 { remote-endpoint = <&codec1_endpoint>; };
>                  cpu_endpoint1: endpoint@1 { remote-endpoint = <&codec2_endpoint>; };
>          };
>
> Codec1
>          port {
>                  codec1_endpoint: endpoint { remote-endpoint = <&cpu_endpoint0>; };
>          };
>
> Codec2
>          port {
>                  codec2_endpoint: endpoint { remote-endpoint = <&cpu_endpoint1>; };
>          };
>

This is a workaround. Note that CPU endpoint@1 doesn't exist and a dummy 
endpoint needs to be created. Like I mentioned in previous replies, the 
number of dummy endpoints that need to be created depends on how many 
CODECs user want to connect and it doesn't look scalable.
