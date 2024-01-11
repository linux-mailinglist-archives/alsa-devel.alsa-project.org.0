Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA81A82A7E4
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 07:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A851FE9F;
	Thu, 11 Jan 2024 07:52:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A851FE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704955960;
	bh=zX556AOLsGj+qP0tN7HB8A4TiwEpXlRM2YAO5qFfmPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C6OJ6H6GDig7h1EKe/GS9lLJm9Xm6gFHAi/EbF2inY2/pI++l9n93SCpndbvEA072
	 rbsF2JMe9R8aZYoFEmOfO6u3FeI7/cZpYCR7rhRufll2989sCtfSsa39DHvy/PCQxe
	 APEgdNdJzS4Jpv56N6LFY6BtmqBgYAl8nIjZsG8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40164F8003A; Thu, 11 Jan 2024 07:52:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47BDBF8057F;
	Thu, 11 Jan 2024 07:52:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A5D2F80254; Thu, 11 Jan 2024 07:49:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B074F8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 07:49:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B074F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=YgalyzK3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY78V+NpNGx5DauoLeE8ApqmaK9xpyxX0Qs6OioEKpOx5rimf2Pb7SIUEqpJL0iq12GYUs38+aDF1TF9UCLCEFrSRPsp4kzfS3Y70iLmomhnexBGA2tyvH5VyWYLeprfNgV+HRsSLCS+MBmBlIexug0n+EjOR3+/2jD1q4APpok+l65Mzr0/PlNFdjU7+RioLW9luIFy+2mhsPrgEEZRzGKn7lYgupUGw1fp8GE7wGEz7oGD+ckkqKVI25gNQIruTy48iGb77wI+w+uMvq9WKucq6B/fiW9sIt8YGTzYONiywRDPLirx76uKpeEReibHqZ6gVrJLYmni763p52QQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDqwxY638hDR9E/ZSHwfhsL3Q27/l+Ankxkr0oOujOY=;
 b=mCkojwpcrS9L4xIuSlODaAIOhUsI/nTnfUzjp1u7JQ/dFXo/H1lcEIpqGII9d0lpKU24R4FKbYL+jVu9JzYt3Ix7T3wGUGgN4C+dghc68B7n311Syvfy0XOdqa+3T6Mj18RMkNoAORN3Y3rW6oVvwTbqjNqNL6ZYKP1+s5GpuEG2KPj8KpaxTctsQvaDEJrVZHalkWTBIWYy0tWynyzwiHhZzxcpNjKzY2qb3k2g9y7+WsbeHfLx+EPE1Ij9V2RAmrRb1otzrqSFFQtJSFFcsd6ZHXeVMwRMNHFOp0BJc47axwJzXFaHKLui0icQodNPNR1sKYyTZcZmdktSf4p8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDqwxY638hDR9E/ZSHwfhsL3Q27/l+Ankxkr0oOujOY=;
 b=YgalyzK3AybdaSOe4sIznDfbyIJZwlv2mXIwIji/jrxecI2HVrYEOxpsqu3fKELIJXBMriiYKnQ7YaZYRrThBuBqAi5xOJREOMvPaPPOitbhnypChURVfQtLpWtB7F6BC3lV+Y7FkaQDrK2UPkSbqZTVhHl9AxOEElW7uKtLRFn92eEDJjpTRs0RyJBprq9z+olUdy4mMMMMp43yatBosEFAulrWrLUvjgJykhIO0oxDju8d0GhiXsFlpxX0x+PUM0WavpZ29/jdtM8lafZ7nJmcKWT2dVYVZcc0CIJqdX6khr8Z/bdmSJftzJeV8YFCuZ7OQHWO7lhu+2D94uQ8ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Thu, 11 Jan
 2024 06:49:23 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 06:49:23 +0000
Message-ID: <d10f9857-4259-4dff-a7f3-764086ac5a8b@nvidia.com>
Date: Thu, 11 Jan 2024 12:19:04 +0530
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
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <87le8wwi2u.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|CO6PR12MB5473:EE_
X-MS-Office365-Filtering-Correlation-Id: 993cb912-beec-4a03-b419-08dc127171bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6Ip1/Zpm9UTBMaqKMgRH33lClWjllXs0F7bF2+1cm7A8f4irQ4Pmz6e/9C92o72tyEYYxHuPVlEMmlbnddeGjk900Yr/Yds32Ori5cUFadxlhKm0iCq8lXiEUPtcefqX/2Mr2k2vT55HkCCkhtYGiGFWkbAHPcyW0QUSJA8v7pwFuUMj5P4uXdjDSve70ziDcTiPLwv/KpXfxL3o6LV9dl8pl++lvwOY2k5NxBsLncq7LLyExQneQKyowZ4PQEQr6KD9rkPATqxMcDQCDfVYeVcITUct3fljEHzaFjd5VxXBni3wXqeKoRCchkhuztZL8e2r1guVE7x59oO+CSSABSOla2YMqZf6X1wQd8t8y4rp3yaURG5+YZaIiTbHNy2Xd24G5MuGF/NvggYFB7SAs8i6CRvWJ7jTxJyqz/9m+nG6MAajkjRVBTPB+cJRwgDmVpcpatkJ+psTxMth0K0HafXg6ndLloEh0NmwiFp1eRyO+/9QgbjI8uy0qBV2HhH+n98u7zWow4Pa0Ep9TLyHw6dJTMr2A5VXb2CSduzBWasPl3HhY9On/x+E3pDXNZWGBDkvpSm413BiwKQqSIC98cIby8+FwxZNDzVV+RITuES9JgU7ZqvoV6QAFfTtT8p5MNg/8h8ftpekduAW6JBRjfiOHhFZeEeN3Bz/4X6PvMcAdTWftbfDFkGoqSC95rFo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(83380400001)(36756003)(31696002)(86362001)(41300700001)(2013699003)(38100700002)(6486002)(2616005)(26005)(4326008)(6512007)(66556008)(478600001)(6666004)(66476007)(2906002)(316002)(66946007)(8936002)(6506007)(54906003)(6916009)(53546011)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QThhVmw2T3Z3OE1YMmxQNTdUajZEdHhtOUxncE5ETndVVjlmWjJFUHJmNURx?=
 =?utf-8?B?L2poWWJCdUJZNThoZGY3VGN0NElQa1g4K2Y3TUQ3eG5nWTV1dmxhbk40UGhB?=
 =?utf-8?B?ZlBYTVh2L2dJWXVSZkxlQVdCb3hUMTNCdkpHTGtOR0xVTWwvY2FCc2xRc1Jt?=
 =?utf-8?B?QzhZSnZjSHdxM0JaNVBIOGNsOEZWSzdwdjh4cHIyNVZCYUtWWFAxdkV4aTZ4?=
 =?utf-8?B?TWJWVTJNVmd4ZDNKSEVZaTJMZENrSVJGWFE3eG1pQy9oc0dwaTE1QnUxLzJr?=
 =?utf-8?B?ZkVwWUlZNlRmekVEbmZxdWJLenpRcjNRVFloL3A5cGhpSHhPQmNRSEFsYmJv?=
 =?utf-8?B?K2lsQy9zR1dhNERodnhZUEkrWitOZG54TGNoWitSV29xMGRYWncyU2RZYzJn?=
 =?utf-8?B?VFVHSGRKK05LekowUS9pVkxVaDlFMUNEMUR3T2UzV1ZnWDZrQWZoVVVlOGxC?=
 =?utf-8?B?TzJIU3NQTGUrSCtYOW9CQVFMUHJjSWFVZGJXYmpZOEtkRGZ5QjRuMUxzUDJX?=
 =?utf-8?B?QVZYdEQ1K1FRU3JhTzFhSFVyNDBTLzZZalJZMlJNTS93OUtvOHRtV0NzRlJQ?=
 =?utf-8?B?aGFRaFY1SlVXZzdzSXpHdkdEdGJkSnE3UGttZWdNVnBTWFIwdmtOaHhKTnp5?=
 =?utf-8?B?UEdFRkJmUTB6ck1mR0dZdFIySCtyN0R1UE9VSG1CZm9kRlZMWUZPQlhZdGNU?=
 =?utf-8?B?THl1eVM5VXozTEROWHZ6WnNlTUFHSXdqT2NhcXRrcmw3emRxd1dGZ2NwaUla?=
 =?utf-8?B?N0VPRGpmZmpUZXFwa3V5eTdwNmo1NlNlYzRqbi9wVWZtLy9nbStWTlF6bXNT?=
 =?utf-8?B?VndEVzMzak0yaVhuOEwyTnRsTmRaT3BWZEJQUVZ3eGtYUlp6MXhZWE5EUkRD?=
 =?utf-8?B?VlZrZ1UydFhKUWM4bmdxVlRHWllOdmJHV1RzbllibXlSM3ZudG9pMUpFcHFH?=
 =?utf-8?B?UzJnOVFXQUpTNWZmNkJKUlFXTkxJNEUwekhNcUlsYXQraGhUbTZZS2lqRktz?=
 =?utf-8?B?d0UvaGREamFIRXBwRGFNMlFVYzNibFZnUWNNT3FIKys3Wktqb3V4L0dkNnJM?=
 =?utf-8?B?U0YySFl2dXZ6ajQ1dXpSdXFJZjBEZW12OXIxaVJCK0p2WTZnRHJvM1NkbmRt?=
 =?utf-8?B?QmVsN2hqOVhwVmJQcFU2SXZ5aWRJUTlxOGpxWWVubEFWRkJCVzdBRUJLTDJO?=
 =?utf-8?B?VkxtZnJIbldYMnhUN3dqM2lvOGNUK0VzWEEyS2tXSDBlbVVkUzNJU0UzaXk2?=
 =?utf-8?B?dW5VN1lMMHZkdlVqcG9RRkhiOTFsYkJUV2dxZmpuamdWUmY5eTdXS3pyTGRn?=
 =?utf-8?B?MnMrZ3RTZ3RCdEdUbTM5NDRxQ1QwNkZuVmg1a3pHYkMrcXpua3JnTGdhZXhW?=
 =?utf-8?B?RnY4cnNWTndsMUxjVVdrc2ZFKy9xdlpLamV0OHRLclYyQWRBc3UxUzBmM25a?=
 =?utf-8?B?WVJvb3g0OE4xSXdLTFoxTHFvV2xoM1JFY1p2SG1XNkR3aXN5eDZnUmRlVGNC?=
 =?utf-8?B?Y0hFUWRZOURLMC9icE4zWStoL0phZUdiOHhvVFRsVkQra1dQbmFwUW5BOElm?=
 =?utf-8?B?K3AyQ3hYSFg2WC9ZMUhCMktsbjdYSXlRTDArMlNFTHN3Sk10MS9qbWZhTjdF?=
 =?utf-8?B?QkcySjdBVk96S2UxOTVZcWtwbDkxNkpFeW1YM3ZhaEZNcElKOStsN1V3amg2?=
 =?utf-8?B?cDhWSEdQajd3ZzVoVnZyekZ3cDV4anJXUzlJQUt2ZFFYYURRYVJpYWtBeFFk?=
 =?utf-8?B?dC9wOTRvVmw3SVRZKzJFdXZEZlpZUGE4OG50K2ZlbHJidGdHOEdBSVZjd0N1?=
 =?utf-8?B?NHVWSFV3VXQxUXRkNWMrbVRkNGFEdE1mRTJKRlBmSm5SOEdLdUhIclVFRWNj?=
 =?utf-8?B?OEo1UnpZNk44L0tFOUIvcUE3UWQvRjFHd1RPdVg1NW9vMmZZZktUcjhpWXBn?=
 =?utf-8?B?dHJzelgxNnBWMS92anAyTmxyanh1bW00eVEzSFRGM1VBejlkamtZK0RqN01D?=
 =?utf-8?B?UFFOZGpTZE56N1RmTzg4UHgwbjd1R0txZWtRcktBN3l5OVZwMUF2QTZ4aTBw?=
 =?utf-8?B?Zkw4cCtYTGZiUHZxRHNWZDdHY0luYlNJT0k1UjRFTlozMWNGZXlKODFnby9P?=
 =?utf-8?Q?LKPDUOlHWqen2Gpmokuk8kvpl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 993cb912-beec-4a03-b419-08dc127171bd
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 06:49:23.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HWTqkYNBf798X/o9CRmILctCSPEydGtWzakwzD/r4oApe5vQiSDHKPCWKQBBZdU7kGiSakQLdCoIa+tdb6eN4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
Message-ID-Hash: 4NOB6G4XXJMFQUDUQYWYTURBKHZ7QNFP
X-Message-ID-Hash: 4NOB6G4XXJMFQUDUQYWYTURBKHZ7QNFP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4NOB6G4XXJMFQUDUQYWYTURBKHZ7QNFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11-01-2024 11:02, Kuninori Morimoto wrote:
>>>>>>>             port {
>>>>>>>                     cpu_endpoint0: endpoint@0 { remote-endpoint = <&codec1_endpoint>; };
>>>>>>>                     cpu_endpoint1: endpoint@1 { remote-endpoint = <&codec2_endpoint>; };
> (snip)
>> Is it possible to have similar behavior with audio-graph-card?
> Unfortunately, N:M connection is supported only Card2.
>
>>>> For 1:N connection, how many DAI links audio-graph-card2 driver creates?
> (snip)
>> No, that is not what I am looking for. Let me please try to rephrase this.
>> Does audio-graph-card2 driver creates N+1 DAI links or a single DAI link?
> Oh, I see. It can handle many DAI links. see [1].
> One note here is some link is comment-outed here,
> because it handles too many DAI links, it reached to the upper size limit.

What I am asking is, with audio-graph-card2, when you declare 1:N 
connection in DT bindings, how many DAI links you create in the driver.
Is it like the audio-graph-card2 driver parses the whole 1:N connection 
and creates only one DAI link in ASoC core or it breaks them into 
multiple links and create N+1 DAI links in ASoC core?

In other words,

1:N connection in DT == 1 DAI link in ASoC core?
Or
1:N connection in DT == N+1 DAI links in ASoC core?
