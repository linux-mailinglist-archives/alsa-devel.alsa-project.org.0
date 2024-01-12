Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E282BC37
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 09:10:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B21AEC0;
	Fri, 12 Jan 2024 09:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B21AEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705047032;
	bh=RmKdGr7UEIUzi/KHNj/0sM69hxUV8iH/Lj8tAvMIvOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pJVcnC+cZruf/U9fJcRzxRSzCnsXkPIv3EnR6+cUXdD6KP6/mGocISwsIY3nbJ/NR
	 SKIerRWw8mVM8E2o3AcAgRqHFz07Gd71qvfp3HxEtE4QJwJuc/1PdX5nUi/AGVUleY
	 Oo1FE4EQ3kguFE5S+DS26DCLYlkHIsQK/pl7BXX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63135F80564; Fri, 12 Jan 2024 09:10:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84AD3F8057F;
	Fri, 12 Jan 2024 09:09:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D535AF80254; Fri, 12 Jan 2024 09:09:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31140F80086
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 09:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31140F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=L/mWY4Ri
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VS0vwW8WpeYIloZH7tfwPz4g7WNGQv2MV9HakEVUhvhZR3EnSKY+Ar43S3EMlI3/qloOBiqFWBFfacLCtqzl2u70Z3Fzo+8LOvM/Fw62Fi4cqzPeBKJjxMKpSKv8eKNCNX9wT9/aDLAO3s4zyjN5hECFJwH9HEEwfr9eVCXrNmoSpJGVIR3DdfSIGj6Z7Lyx82V+jREAnceaSAVpr3g/OnO529XzRETg2iO/xycGKjwpm9WrqZxSU0/1x47MPhtDOE3Ux5aTtLA9NeUhhFs/5bxIw51KQi9jfXqT3fzpLm2eM1Mv3LCUYrVetgRFxW+SCwskPGMQW0npeylg6D8fvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hdiNfQMJnxYWZr5GKBHKHiqLo24H5jmEouAHpdpVuw=;
 b=DyeEbgD6zEtd38ibj6TiryZs1QFIeXTK33oAWUrfpQZrtraTZL5pZlB72+EoV5IPJyj+IWSTUIFlEzlsZdn/xqLs8YnagzmqLEi6ZawFSFb2qbZkOPnsdeBLuapA3pykFwd88Ws62ifGL5DoePltLoyJRmbhyl5RGoRmWmY3jvCaT06MH7HWGhIGTLp2yG23H5u9Cx/BL2lWFJkSQ0RPguE5AGoK9lFneoqxWvGLtiq4a9CHmSTm27vY+SGFwQE5V346vS5otwU0hkdeGe+wK8lGR8tbgh1GabhBDtgjgfIoqRlfMl1H7E3liEuG5SSZeud/95wkac67oPUXrIsocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hdiNfQMJnxYWZr5GKBHKHiqLo24H5jmEouAHpdpVuw=;
 b=L/mWY4RiEtpBINLo1RnvqpB30lpe001rF7XmlhzCVCVkKVqCbuTr8gklgUuHe3KtAh4hZXBmBmK6CjMtdmtLjUb5aCfLqDleGWIqYC1u4QTV5HIGXhqrcV4b4u0wVz2BFgqWP7a7uKqer9TzXzN9Vb+NQ4tw/kKRr5XQ2+epMfF2v2yEI7n+MPiehduVGPF727PpDEMMDHMuvazQKSvdistEkD2BV3mVXeONR2HnagQjm7DAPdSYR33mOg4Xh+/xLuamW78qvo5jukSb2C1EiSqG6iFUVPXWyIRVDx/lqwoTGCCJpSIkbB1IFqtAQtyJxqd8rVcotbDCqy3/u0+3mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by DM4PR12MB6231.namprd12.prod.outlook.com (2603:10b6:8:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 08:09:40 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 08:09:40 +0000
Message-ID: <dc984f84-6877-497e-9b47-d116c8f3c42b@nvidia.com>
Date: Fri, 12 Jan 2024 13:39:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
Content-Language: en-US
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
 <cde6d5d5-b6ab-4c64-93f8-78d721a492bb@nvidia.com>
 <8734v4y9yu.wl-kuninori.morimoto.gx@renesas.com>
 <eeb61f8a-697c-425a-9873-b7b60c0a5558@nvidia.com>
 <87o7dswjry.wl-kuninori.morimoto.gx@renesas.com>
 <c868bce1-9a99-49d9-97cd-ead8d0295504@nvidia.com>
 <87le8wwi2u.wl-kuninori.morimoto.gx@renesas.com>
 <d10f9857-4259-4dff-a7f3-764086ac5a8b@nvidia.com>
 <87v87zeasq.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <87v87zeasq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|DM4PR12MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b93d12-0f4f-4f2d-d972-08dc1345d33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5w4SrbOuRLJCBiGBnSrzN6lWYmeADFgLjrKRFCANmWxEVGKvWgSwSDIC5tmRO2zarwLgJ+BuRHZVLySVwBL6pFhQNv+P+kGSKC6ZJnBlXXbWH/Gd6GX2+GLrs3F1ITIIAwfq2g9knoAZROqyEBuoMbbJGsVTHINWLuiLlsvRvBC+0HQb+tSIb6GJ8sySCi0GZ8duQp3Z79C/bhGysNKj0hTSZ2zpB6wG85ru2EIf21Ak8tFL1b0IhTJ0nOF1AvKX/ImHFkEVPvOuKGjgyuPGlMqGgQrZOYb5DiLNzP14CHg0PdFIar58lSWpPIyhk5wcv/aG2G1A0+Qclm748Uz6mXWThy/+5s2ZdiK2FV6t2TuVb+Ef9AGToW09qQ+OpFJixSPN8zuSyFpSqGq4P8GTJcBAkxO60FhX9GwHgZMaTm2zorRmTP9dkP8INWpRvv76yCqbEqfAXNwEunXJ0Owrlzscv4r6v+6uraCEafp9SC/JNRarznr06xSzZo5T+wwOsZgQ/+XnrTQix4GOY+a93y7hR7u6s9xPTMiMG8gthbr3LZVOtm0rplsVJkcBFT9iROYDxaawVz8M/D2AJ8Cd0M9dwXJQgDy3wW7p9y081nscC6rqAwUpbyJHIk5KG5rmMx5NEt5BHSsalQBRDXEBvRM3WhTNjupjzayGOj6e6GGiaxGQXuME7J4OWzfIxMfuCWagpIRyAgo7jJYYf2EeFnCahXC5WTcqGdW2jp6ly7Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(478600001)(966005)(2013699003)(2616005)(6486002)(8936002)(4326008)(66946007)(8676002)(316002)(36756003)(66476007)(54906003)(66556008)(86362001)(6916009)(53546011)(31696002)(38100700002)(6512007)(26005)(6666004)(31686004)(6506007)(5660300002)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TThURW5PTmlSQUUzL1Y3YVhTVUgrQmNvOUU0ZkhPb042MkhmdkorZFhNMG16?=
 =?utf-8?B?dGpPT3UyREtXNkkwYkV1cmZjbG9UMmtMekxrZkEwTnBSMkIxaCtUaTFYS3VZ?=
 =?utf-8?B?MEtFOCs2bVRhQmNkbHdQRFVOWVdnNlJ2ZEZDcE5uL1dISGNxYmhRYnhDUS9L?=
 =?utf-8?B?VUs4bWg2bGZNbVdnV3doRWVLZVkxTXE2ZGRXQ1dEMGFBc2FhT3JIZHNoMVhp?=
 =?utf-8?B?QmM4SnNNSEZ6U1ZEazVLbWw3Sm5iMjlFdWNpbXFuT2Y5aXhpYjd4RnpQQ00v?=
 =?utf-8?B?Q2FwcGt1cVV3aGlXcjlvRjl1WEhsN25mWjBMN1RsWTFGODI2eU5HMmVyUVpU?=
 =?utf-8?B?ZGovT25lQjd0TTRIci9rdjZOM09iQmNCeUorVi9valZvMjdzY1NDanI0Nzd0?=
 =?utf-8?B?WlpmUjNZUEZmaGpabTlsWjhQTHZYcldtNHFhMG42M29adzM0dWRybFZmeW53?=
 =?utf-8?B?QVdoS3EvN2NCZWRNa0xYVmdVNXNmRU9kSXNqK1N0Mmc5NFZaTE5BRCt3ei9k?=
 =?utf-8?B?UndjS3M5UWRwMm9hUnRUbVpqY0xYTHBZcGZ5bjk0eW5CVmVLakFhYktmTFNF?=
 =?utf-8?B?cWI4amx3cFZWWnFIamh0Z3FNUDZOemxIWG5rSGc4S2pFS0RTYThuR29GNGRa?=
 =?utf-8?B?SVpncm5iZEt2NE90em92eEM4cTE5WHVYNFZiRTgvdzNwZWkrdUpkVDU3K2x6?=
 =?utf-8?B?clRabWt0MzZYSlk4cDY4azgwbmNCank4TXNGNXUzeFVzNGc3MHE1aVArNWtJ?=
 =?utf-8?B?akRXSnhLRXg1dU9sekcrT2pONnYwTXJrSGRJd1JEcUU3MndOd3kxRVkzKzg2?=
 =?utf-8?B?Z0FwWXpLNE5EaHg2Y3JJajIvcGY4UlJ0Uk9SQTFJcXgzNTNjcmFISFpianVI?=
 =?utf-8?B?SmUwU2tUVzRMYm1sbWRDZ0kweUZJSzB1bEhUL051cXBaR3UvVWZMN0hUQmtV?=
 =?utf-8?B?SXNHTzQ2c29RZW9xSXNNdzFlNXd5UTlGaWdLUks0emRCNmtvY0tUbUswQTdk?=
 =?utf-8?B?VlRhMjI3bVdmNWdpZkNORE5oVUNQbUxLNElEVXlQS2hoaG1mSnZHbTVKcHhm?=
 =?utf-8?B?Nnh3STNBcDhyY2tObVRNV3hHK21wNzcwVC9kYmhCSjgxSkE5VldWTjV4T2t6?=
 =?utf-8?B?VVo0eTNiK0RIeGRNS3Y3enRTT0MrMEhWbkRkYksrd0lGT25BT1ZFM2xuYnAv?=
 =?utf-8?B?QVZJMkI5ekRlVHorSXRQUUx1a0t1eHZmUFdCNDk0Y090NDNERHgvckFOT0RP?=
 =?utf-8?B?ZWVtdDhVeGdGQVRlWDltWGZxKy9oS2ovbm4xc1p1azZFSWVBMTNRSm8vcWdH?=
 =?utf-8?B?OXdiTCtaaytmVGFNblFtRWVVeFBlM015SHlqcUNLdi9VaHJDVTNXdi9wdjJW?=
 =?utf-8?B?OS9ZWTRvTUw0b1JKVmlaUUI1OTZWVXlhRUNCeXdnOWZYMnpwMCtSVDZ2YnU0?=
 =?utf-8?B?b3Z5aGZTYmNTNzQ4WVdmT3luaVF5OWVxRXRYVjAwNVJRS3BuSzZVSi9OQWtl?=
 =?utf-8?B?OFlodjJkb1l6UjhZb2w3bmk1Mzd4UFhKMk5NcFphSFV6OU1BNnlUOGR5Uzlp?=
 =?utf-8?B?Q1N6dzBwS1dZMk1sbzZmSExyQndCTUFvSmg5am54WklrcTR2Rk9yWmJSN3Zr?=
 =?utf-8?B?WWkyajlUdlNkTTVrQk95WVczNkZHVmY4MWdsUVV1YnFYUzgxR2J5QlROa0cw?=
 =?utf-8?B?TnI0eS91VTM2Smo0UkJhN05rUnJNRi91a1pJamdxa2dsZDFoTGxEMTk2cDBa?=
 =?utf-8?B?OW5FMHFFMXVCZGFsS2kzVHVvMWJ5VGxUQ0piWkFpOW9ablNrZUMwdFlUMnVC?=
 =?utf-8?B?WGRVdTlnK05aL3Izd2JWODVOak9KVS9Tbkh3TGY2ODNielR2K25DL3Bkb0tC?=
 =?utf-8?B?N0pFZ3JSRVZZUEZQVnl4L3JQaXZ3RzV1ZGVSaXIvL3gwd2prM2dLQ3JvRVVz?=
 =?utf-8?B?bnlYNC9DcEMwQW85WkhLK2lDRERITzNUTHZxTm9Yam9LYUxNQkJiQlJiMVh6?=
 =?utf-8?B?UGgzQkpla3YyT0h6ZVUxUkFmWm5CN2xKUkVrODY4MEpqNit1VlROeG9FTXFZ?=
 =?utf-8?B?YnNYMHc2cDAzcVpTQmw3V3pXbE9XNlBwajMxSURnYVYxclpBZkhsbGJsaFNH?=
 =?utf-8?Q?Z94KEzlW+TBV/DmjPe/3Px/iF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 76b93d12-0f4f-4f2d-d972-08dc1345d33c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 08:09:40.0785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QOLQDMOKXjd6sRa0oMj0Q0AUDlBULNDtt4/p/HrAnuw9RQXdT0iNHOGRw+QfPM4QNhfh4Zp9hD2GOQiI1FNHpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6231
Message-ID-Hash: EUSUTJ6DSSHBOCL4ENDZHEKF3CWE4FZI
X-Message-ID-Hash: EUSUTJ6DSSHBOCL4ENDZHEKF3CWE4FZI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUSUTJ6DSSHBOCL4ENDZHEKF3CWE4FZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12-01-2024 04:29, Kuninori Morimoto wrote:
>> What I am asking is, with audio-graph-card2, when you declare 1:N
>> connection in DT bindings, how many DAI links you create in the driver.
>> Is it like the audio-graph-card2 driver parses the whole 1:N connection
>> and creates only one DAI link in ASoC core or it breaks them into
>> multiple links and create N+1 DAI links in ASoC core?
>>
>> In other words,
>>
>> 1:N connection in DT == 1 DAI link in ASoC core?
>> Or
>> 1:N connection in DT == N+1 DAI links in ASoC core?
> If you create it as Multi-CPU/Codec connection,
> 1:N connection will be 1 DAI link [1]. I think your case is this.
> But if you create it as DPCM connection, 1:N connection will be
> N+1 DAI links [2].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/generic/audio-graph-card2-custom-sample.dtsi?h=for-6.8#n179
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/generic/audio-graph-card2-custom-sample.dtsi?h=for-6.8#n199

Thanks Morimoto-san for references. I need a lot more understanding on 
"card2" before commenting anything further. Right now I look to continue 
using "card" driver and have an easy DT extension, if possible, without 
disturbing existing Tegra users. I hope it would be fine to push changes 
to "card" without affecting existing users.
