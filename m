Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DFF8AF763
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 21:31:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCE59211E;
	Tue, 23 Apr 2024 21:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCE59211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713900702;
	bh=QvM4sjk+cpRh/ulitrC4JFMC7Bs/qOyuLuUFQqc+oMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=coex1ia+lF8hPXX3J+XhS/HgkqEyA+3tugra0lBvVU4CNidTxzmasP/btG+/wrBOG
	 ThLZMVvzVxAlG3HhF9xWqOwQqrujh86Xa88f29Nj25/LDtQ23n7fmptnEGHFzPCXj9
	 WX2gqM0J8Fp5MPm9n7n7KZWsDr4ZgSBr0ofvSO34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B30AF806D7; Tue, 23 Apr 2024 21:29:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C9B9F806D8;
	Tue, 23 Apr 2024 21:29:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6851F80423; Tue, 23 Apr 2024 12:08:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B4B8F8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 12:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B4B8F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=wolfvision.net header.i=@wolfvision.net
 header.a=rsa-sha256 header.s=selector2 header.b=Q5y2ztsA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SffKbzu4LWBxHnKYmr7/c8WZlTd0b2tdwgj9LLtp8/sZupZrdRlCHOKkZ5CoYdkGU8T8eap4R9VAKJybFJDFcbQNBh68ZxeYJYKfrZrzHwBUmK/63zV4I7Hk23nB4Y2e9brF5wVW18wGzp7UBUgQmG+4sYqdx7X51tF9jUoRACJs1n7M30ZcLvJtI/PvOjBzD0ayMbSPvgEFn6DwnFyUNckVvKQWXekJ9aQ4SI2faX0uRSaL7pgaQsC0qNmEZ013GHcTaOFdX4GoCtTCH0uGTAeuDgaATyfBl56yFzfUT5Bjw57Z9cGBUAA60IkAGtp1AujpqJh2cu4PzGR/BtBIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMyGNQzVOmIMIqTB23ckJ2irVpgFmkVsX7BKdDR7s0Q=;
 b=B2BwM89Q5TznDJ68SCKEMWiexZXwALj9ypzl8VNMlLHJ1zXFT3S8g+1LEom9EpmJ50tIXJf9Fdw3tMiLoE0lgvPHtklDB63hcvAeUct7QDZhSAeIsxl6BBvHm4qA1Jgl8/Wj+7Btu0Jptmbysyg2ZOGzY7t+9F69uA4hIQ1K+krhL1M0QiY37NdBBif0YtIsNuGxinhi1pOiSQZTY7Bl+z2HW1JM4T2tZC+2XPExeUUtg4JVDxCLmpZdyo9r59tPISIb8Gjz6mN/SD2MnDvVOfBAaX8lFbmKsAutpJ0G+MtxPIqWscFZzHIZqGrFJYL3ie5Wa/KA18LnV6wBOIio7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMyGNQzVOmIMIqTB23ckJ2irVpgFmkVsX7BKdDR7s0Q=;
 b=Q5y2ztsAYXqzodQuMRB/xB82KSUBSyeHtGMW68U1qvNWsGYrXqKVU7IY1EWyccfFYSMHce1nMUUc2QVgUoPgNwjd3WCXQitkJ10I0hC2BMukBEAM51DNYURXEVl1kuJYMFUftSN5nWV7VuHBjuBMqtMmd7T0Tu1MgEFptaXJ6ZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB9048.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 10:07:55 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::224e:39b5:5107:43de]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::224e:39b5:5107:43de%3]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 10:07:55 +0000
Message-ID: <d7938a36-6607-46c4-9934-895fe268358a@wolfvision.net>
Date: Tue, 23 Apr 2024 12:07:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] ASoC: rockchip: Add support for rv1126 pdm
Content-Language: en-US
To: Sugar Zhang <sugar.zhang@rock-chips.com>, broonie@kernel.org,
 heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <1630675357-3286-1-git-send-email-sugar.zhang@rock-chips.com>
 <1630675410-3354-1-git-send-email-sugar.zhang@rock-chips.com>
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <1630675410-3354-1-git-send-email-sugar.zhang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0179.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::36) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: e8906b31-e9f8-4e6d-7eec-08dc637d3eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWxRdC81M1VTbzRteElJOUhHTHhmc2NiNVJSUjFmSXlBYkpVNkNyVkdhTHhN?=
 =?utf-8?B?U1RaOGs0dUJUZzJheEh0bDFId1M3V2k3U2ZUeGdsdE9iZFk3QVlWYzU3R3RT?=
 =?utf-8?B?ZC9XckszS2xPYVUwWkdabXBQOUUwRUtSOW91UmgzeVhJRjNLcWxZc3hWR1F1?=
 =?utf-8?B?cXlydjZLUDB3T2NxUWk1MnM2MlVlVW5vRVM0VFJieG5aY3FkTEdPWUV2dUo0?=
 =?utf-8?B?a0w2TWNFY0Jta3J2WTJ3ZU9SQUFWaDMyWkc0eXdhbUNyc210c2FYTVY2eENH?=
 =?utf-8?B?L3B4dG5hZGlicURrZTJhM3FMbEhBNU5zK1JYck1ZcCtmY08vamloYzdBWDFL?=
 =?utf-8?B?VTExdThvTzVLWlRiOUpWVzZJVEZXaS9yRFpYcTVBZDE2YkQ0cHJqM0FqOWlw?=
 =?utf-8?B?b3NJZ0R4cER1TStoaWd0V0ZMQWp6ajhjYXpYaHIyR3B6TW9ISTZPUTNiSG5S?=
 =?utf-8?B?UENxNFV1STY2RXhOU0ZBS0hNMnI2RkQ2eHdrY0NTT2VhOVJqQnB1MWEzcHYz?=
 =?utf-8?B?OFJXVkJNYUo1RnZ0ODRIRUVsekdLUGhObDFaZjBsQ1BvR0xOSlhydWZXVC9t?=
 =?utf-8?B?WlpKbUdQQVYzNHdoRWIzTFdEZFE5YllGWnNJSHI5eS94ckhOdDNHV2NubVJu?=
 =?utf-8?B?NHh3ME50dVViS0hxUllNUHlJUWozSCtNUERXMVVJQ016cHBVMktQWXFKNXVY?=
 =?utf-8?B?YU1aV1p5MHNmZWRneXk4ZmFqZHRMNzJpeTBFdjdDQ29mcjR4QzhTdUZOM0kr?=
 =?utf-8?B?Y0hZYmg2WmltaXBlTzRJbVkvUXhnSzZGWHA5ZXRDN3pZb09BU2ZOOXVtelB2?=
 =?utf-8?B?bWZnVHJ3OG1nMnJGMkJMRTlMVWxmMmt2T0pJSkFjb0FOUjVXc0psYkhlck9M?=
 =?utf-8?B?UE9PdEdkQ2I0OGFXZFl2ZFhWd2EyMXRRWFJwY3dDR09zaFpicTFCbm95TWph?=
 =?utf-8?B?YXNpRy9GbVN3cDBlUnpXczdmRmpma3NSSUNuRzFnaW95U2xQaFU0VHdnQ0hT?=
 =?utf-8?B?aGJtd0p0enhtL3BuTG83MDlKbDlocVZiNW5valBTU0VRa3FHS3ZxTmNUanVh?=
 =?utf-8?B?b1MyUGJ1R1NsZlhFbVRReG9oRGkrb0lXNkxYdHBuRDdHcmZMb0p2S3FNV1ha?=
 =?utf-8?B?NElpalNBV2NrVHd6SE5WRURQbG9MYU9vOVVTa2dkaXRPbHhJckRHcXdJM2JE?=
 =?utf-8?B?MFdTM0dDYnV6TDd5bkVucGg3SlZGWWw5RVNEWW0zN2FwVTVyelByNlZXdmVh?=
 =?utf-8?B?M294OFN3QkRHSkI5ME1sRFJpWFU0SUdOeEF0MHZ0djJHM1orZVUyTVpyT21O?=
 =?utf-8?B?NnVVZWJtakdzWm5Gdlo3Ny9EVC83T2dQby9tU0JXWTk3eFord1g3MlFFTWZr?=
 =?utf-8?B?ZFJtZTRtUmZ6R0hVaVRUYWlNYms5NkFSdGRCQzZXNSs5SjBHSDh4c091dTB6?=
 =?utf-8?B?TUNSaFU4ZDdraEIzOEVZNXB0YlUxZHlHL3JKbXNDT2tmaHBUaytHek5RMXFv?=
 =?utf-8?B?bkJ6VVRWUHgvdFhqZDFSNkVRTTZ1emh6Nk1JQUZDYTRodThNMitPeUh6THFL?=
 =?utf-8?B?djRrL2c5NFZzS3hrWStQQ2lNUVNuaEhHSHZyYzZTZkRsSGhJQkczcHFIMkZ2?=
 =?utf-8?B?cUtBN3BVdU85aUIzblU5cDBCSTMzT1hSU3B5SkJJL3F1Y1ZkdCtySERyY2Fo?=
 =?utf-8?B?MWtUeVlPcFk0cWVUZDFDM0RNS1YrU0NuajhySVBFUVdKbVkvMVlqY2VBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHdLQ1NwYUhXWkxhNHljNW1Xbmh0YzJSTW1jSTFDSUgrNHN4UW8rVm5xS3pr?=
 =?utf-8?B?aEhaUmVjTmJtOTJ4YktKWlpZMEdTdXdNd0tGQ0orTWVLeTYyM0RwditLZHlN?=
 =?utf-8?B?QzlWdzVhUGpLR0xwb0dHeTFLU1hZV2hhMUdFSkc1b1dsN2Z0YktnV1laNlFB?=
 =?utf-8?B?ZDF5TVZFSHVzRHpVa0FNWUhIREQ5UUxIMTdIT2tBQ1dyMVJEZHVhMmlOWE9X?=
 =?utf-8?B?NVJkWHVIVGxuOEdybFVFanFMQ2ZGbWRlNTFKcm5ud1AyT3BEVjcvVUJPQ2NE?=
 =?utf-8?B?SmJidnAxZVVPWVZScnZ5NWY2Q0Z3cU1aNFNiQkk2K3d2bkw0UG12V0Z3OXVa?=
 =?utf-8?B?NVYxdmpYWlp2UCtYU0pXdDZTWWdHeDlydGVJbUZaT0hqVDZacVRCeUlyemMz?=
 =?utf-8?B?REhCTjV2RGxFZjVoMnYwTWllVHU1TFhBK0tTUlZlMDArdkY2VlF2K3F6WmFq?=
 =?utf-8?B?SnZFQUtXcUhNdDl6VWVTK3RZQ2dJakZCQ3lRNmJXV1lLcXVzQXE0VU1VMUhL?=
 =?utf-8?B?Z00va0RSM0h1MjQrMUM0UTZyYURlY1FMR1VkQUxySHVJNGl2ZTNoa050MkZh?=
 =?utf-8?B?WHpkMjgzVE5MUmJWR2JOTTh0Z3EvOGhjUW50UTd3a05hc3FYdVQ2dCswdDlt?=
 =?utf-8?B?YWpGQnd2TTVrcG9uVkZzTzZtZnFkSUptQWZQVUI1bkZBdWpQTVo3bkYrc0h4?=
 =?utf-8?B?Q1I2L1pkR1lVSldaZzNkdlpsTkcrTzNmc0c0a0ZNQXpKcnhXTGx3dTZDQjhV?=
 =?utf-8?B?SnpWTVVLSENQRGhmUjRrcWRCM0IvZzRwbFNRenlPbElGUWxSSC9adTNZL29Q?=
 =?utf-8?B?K3o0alg2RFdoRWZ5b09TQXBYWFg3Nmh6dGlxbHRRK1ZLZVVyWFVidmtlZjZH?=
 =?utf-8?B?S0pBL0VEK0VseFViN1BxZjFFU0hHMWdPQlhKZEhZRUJNZHRPcGc2Q0E1cUlt?=
 =?utf-8?B?UFp5ZzQzbDhvZGVBL1ByYndzZkswb1k3Yi9Za292Z0ZDZzhScDZPQnBpbG9u?=
 =?utf-8?B?Z3BVOEptaHl5Q0hUV2pKU0JwUW8wMUtvMkYwT29tQTdMOE5mRGlxNTllblJI?=
 =?utf-8?B?b1lQK283WUp6RVYwMTE0SWJpRWlrcnNUUSs3ZEhac2dhejVFdWZ6NGVvUSty?=
 =?utf-8?B?eGMxWWx3cWMxRE5teG1ra0tSbCs1cDRlWWdDbmRHSzNsTVVSNU5wQXkwKzJy?=
 =?utf-8?B?T3ZCTDFNeTNUU1E5eUlHNURrU1E1alViSDYwNDFNT2pkNThibmdFNnpEUXYw?=
 =?utf-8?B?VFI0Q1I1bmdKaVhqY3JXWjYrS1lQVk52emdsaCt2eVdTVjZZYk1qV0pvZXZz?=
 =?utf-8?B?RSthclpjbi94bnhxYVFpbk45c2k0KzUyR3YzZTVQL0VUNEtxaUwranh5eWxY?=
 =?utf-8?B?azNEMllWOEwyS0JyK2RjelRvOFVJOEQ0QURNdVFJcTJhcXlyelFsL21HYUZm?=
 =?utf-8?B?YXUzZExLSHQ5S3pxNXA3UXhGSXRLelNIYW56TnRiUUFPbDhxKzlDUXhtM1Vq?=
 =?utf-8?B?ek5HM2RtR2JMQ3hubkplV1c3V2VxZE1Ld1lzQzRZa3I1RzV4Yy9oa08zNmd1?=
 =?utf-8?B?K0tqandFOW5sWUI0SWwvdGZObUdTRmtVSjRFbjdLRG5CalhvSWRrbHM3UE9O?=
 =?utf-8?B?ckUwRWtINDZSdmV1QTBMY0dzbGxOWHpFV3pTV2lVK1Z6Uk50VUlUOE1NV0ov?=
 =?utf-8?B?UjFYVHI5VWJtb252QnJyOXpKSWh1dkYwcHR1WnVxazZLZnp5bHVJVGNSSjhk?=
 =?utf-8?B?SHJkZFA1K1AwY2dRTE9hZWl4U1R1ZkEzWCtXSjFUK25LMEVwdEpveGRubkVm?=
 =?utf-8?B?a0UwOGhxWXpGRXdOQlpVd1paYkNUYzRPWFhabnZDMi9XL2YyY0pZKzNCVmtV?=
 =?utf-8?B?QkJGY0cwbjNmVEpHWWhhQlppNDFneWtRNU81QU5mdCt2WTJyMm9mcVhkSWha?=
 =?utf-8?B?d1JZcFFpUzJRZllTbGtHSHlEbnFJUFFLZklreTFvK0ZwVFZWb3M5L3FaN25R?=
 =?utf-8?B?THo0VDdqcGI1ZHJ2SDA0VHRJUGRxSXBnWmpzandIbkJKdVovV3NBVWhxTVpt?=
 =?utf-8?B?S0NaN1ZYZ0dtTk9yTWNPSkgzSTAvSzhlQkttckVqMnJITHcyRzNGemRqR3cy?=
 =?utf-8?B?amZQVWQyY2Z6VDcwZkovT1hDY0xSeGQyazZTNFM0UjFQc2lkNzZtZ0p1b3RZ?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e8906b31-e9f8-4e6d-7eec-08dc637d3eba
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 10:07:55.6396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vqori3FSWHSeI7tpDkdCL9aGLMd30AwB/VPPJ8Rt0Y39dE9RtcHBijRUe0EZFAkR1HZoywvpAbks6kxHOOcntqd9onr2XIMGK7Fn7rsj/ZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9048
X-MailFrom: Michael.Riesch@wolfvision.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XOY73PTYEPIIDBW75IVRE6M72XMGHTGH
X-Message-ID-Hash: XOY73PTYEPIIDBW75IVRE6M72XMGHTGH
X-Mailman-Approved-At: Tue, 23 Apr 2024 19:29:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XOY73PTYEPIIDBW75IVRE6M72XMGHTGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Sugar Zhang,

Sorry to dig out this old thread, but I have two questions. Please see
below:

On 9/3/21 15:23, Sugar Zhang wrote:
> This patch adds support for rv1126 pdm controller which
> redesign cic filiter for better performance.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  sound/soc/rockchip/rockchip_pdm.c | 76 +++++++++++++++++++++++++++++++++++----
>  sound/soc/rockchip/rockchip_pdm.h |  3 ++
>  2 files changed, 73 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
> index 38bd603..67634d1 100644
> --- a/sound/soc/rockchip/rockchip_pdm.c
> +++ b/sound/soc/rockchip/rockchip_pdm.c
> @@ -24,6 +24,7 @@
>  enum rk_pdm_version {
>  	RK_PDM_RK3229,
>  	RK_PDM_RK3308,
> +	RK_PDM_RV1126,
>  };
>  
>  struct rk_pdm_dev {
> @@ -121,6 +122,55 @@ static unsigned int get_pdm_ds_ratio(unsigned int sr)
>  	return ratio;
>  }
>  
> +static unsigned int get_pdm_cic_ratio(unsigned int clk)
> +{
> +	switch (clk) {
> +	case 4096000:
> +	case 5644800:
> +	case 6144000:
> +		return 0;
> +	case 2048000:
> +	case 2822400:
> +	case 3072000:
> +		return 1;
> +	case 1024000:
> +	case 1411200:
> +	case 1536000:
> +		return 2;
> +	default:
> +		return 1;
> +	}
> +}
> +
> +static unsigned int samplerate_to_bit(unsigned int samplerate)
> +{
> +	switch (samplerate) {
> +	case 8000:
> +	case 11025:
> +	case 12000:
> +		return 0;
> +	case 16000:
> +	case 22050:
> +	case 24000:
> +		return 1;
> +	case 32000:
> +		return 2;
> +	case 44100:
> +	case 48000:
> +		return 3;
> +	case 64000:
> +	case 88200:
> +	case 96000:
> +		return 4;
> +	case 128000:
> +	case 176400:
> +	case 192000:
> +		return 5;
> +	default:
> +		return 1;
> +	}
> +}
> +
>  static inline struct rk_pdm_dev *to_info(struct snd_soc_dai *dai)
>  {
>  	return snd_soc_dai_get_drvdata(dai);
> @@ -166,7 +216,8 @@ static int rockchip_pdm_hw_params(struct snd_pcm_substream *substream,
>  	if (ret)
>  		return -EINVAL;
>  
> -	if (pdm->version == RK_PDM_RK3308) {
> +	if (pdm->version == RK_PDM_RK3308 ||
> +	    pdm->version == RK_PDM_RV1126) {
>  		rational_best_approximation(clk_out, clk_src,
>  					    GENMASK(16 - 1, 0),
>  					    GENMASK(16 - 1, 0),
> @@ -194,8 +245,18 @@ static int rockchip_pdm_hw_params(struct snd_pcm_substream *substream,
>  				   PDM_CLK_FD_RATIO_MSK,
>  				   val);
>  	}
> -	val = get_pdm_ds_ratio(samplerate);
> -	regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, PDM_DS_RATIO_MSK, val);
> +
> +	if (pdm->version == RK_PDM_RV1126) {
> +		val = get_pdm_cic_ratio(clk_out);
> +		regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, PDM_CIC_RATIO_MSK, val);
> +		val = samplerate_to_bit(samplerate);
> +		regmap_update_bits(pdm->regmap, PDM_CTRL0,
> +				   PDM_SAMPLERATE_MSK, PDM_SAMPLERATE(val));
> +	} else {
> +		val = get_pdm_ds_ratio(samplerate);
> +		regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, PDM_DS_RATIO_MSK, val);
> +	}
> +
>  	regmap_update_bits(pdm->regmap, PDM_HPF_CTRL,
>  			   PDM_HPF_CF_MSK, PDM_HPF_60HZ);
>  	regmap_update_bits(pdm->regmap, PDM_HPF_CTRL,
> @@ -441,9 +502,10 @@ static bool rockchip_pdm_precious_reg(struct device *dev, unsigned int reg)
>  }
>  
>  static const struct reg_default rockchip_pdm_reg_defaults[] = {
> -	{0x04, 0x78000017},
> -	{0x08, 0x0bb8ea60},
> -	{0x18, 0x0000001f},
> +	{ PDM_CTRL0, 0x78000017 },
> +	{ PDM_CTRL1, 0x0bb8ea60 },
> +	{ PDM_CLK_CTRL, 0x0000e401 },
> +	{ PDM_DMA_CTRL, 0x0000001f },
>  };
>  
>  static const struct regmap_config rockchip_pdm_regmap_config = {
> @@ -469,6 +531,8 @@ static const struct of_device_id rockchip_pdm_match[] __maybe_unused = {
>  	  .data = (void *)RK_PDM_RK3308 },
>  	{ .compatible = "rockchip,rk3308-pdm",
>  	  .data = (void *)RK_PDM_RK3308 },
> +	{ .compatible = "rockchip,rv1126-pdm",
> +	  .data = (void *)RK_PDM_RV1126 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, rockchip_pdm_match);
> diff --git a/sound/soc/rockchip/rockchip_pdm.h b/sound/soc/rockchip/rockchip_pdm.h
> index 8e5bbaf..13bfbc2 100644
> --- a/sound/soc/rockchip/rockchip_pdm.h
> +++ b/sound/soc/rockchip/rockchip_pdm.h
> @@ -41,6 +41,8 @@
>  #define PDM_PATH1_EN		BIT(28)
>  #define PDM_PATH0_EN		BIT(27)
>  #define PDM_HWT_EN		BIT(26)
> +#define PDM_SAMPLERATE_MSK	GENMASK(7, 5)
> +#define PDM_SAMPLERATE(x)	((x) << 5)
>  #define PDM_VDW_MSK		(0x1f << 0)
>  #define PDM_VDW(X)		((X - 1) << 0)

The TRM of RV1126 and RK3568 both state that sample resolutions from 16
up to 24 bits are supported. However, I don't see anything in this patch
that restricts the capture formats accordingly. In fact, the driver
offers SNDRV_PCM_FMTBIT_S32_LE in my setup and via this PDM_VDW macro 31
is written to PDM_CTRL0, which is undefined behavior according to the TRM.

Are 32 bit samples supported by the RK3568/RV1126 PDM block?

> @@ -66,6 +68,7 @@
>  #define PDM_CLK_1280FS		(0x2 << 0)
>  #define PDM_CLK_2560FS		(0x3 << 0)
>  #define PDM_CLK_5120FS		(0x4 << 0)
> +#define PDM_CIC_RATIO_MSK	(0x3 << 0)
>  
>  /* PDM HPF CTRL */
>  #define PDM_HPF_LE		BIT(3)

Also, I noticed that the number of channels must be an even number.
Shouldn't it be possible to use a single mono PDM microphone with this
PDM block (i.e., having one channel)?

Thanks a lot and best regards,
Michael
