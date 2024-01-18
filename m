Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9698312E9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 08:01:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B14F820;
	Thu, 18 Jan 2024 08:01:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B14F820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705561291;
	bh=ZojMRLSgtg4lBfioyls77nYAm62J6g6590jRkJFxWrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EyjxHcfS31Fq6f7xk2Htq0oIqFe5CQ5LKVcb46+qpLfo0iR+9PNppCvYkRVwwqim9
	 4xAaW2oxUI9C9ZZz2t9blbI6QX1IO79VI28/1vgLb2kdLIL2SMRX/nAWq9NW7Tsnbk
	 cxj87ioD40of7zNbJqlNM3QEoWHBht+2//QZxVxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E489F80579; Thu, 18 Jan 2024 08:00:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52D8CF80236;
	Thu, 18 Jan 2024 08:00:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9591F801F5; Thu, 18 Jan 2024 08:00:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4705BF800F5
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 08:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4705BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hWpnKvhr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcLE63NH1LGvNkiuEUWh4j1ysa5SXwmwt14/83geCRjtgx8ryXVOPgzpdwYUztUCtCF1lXSfaIQCUM47J6IapnvERBSztVAvK+A/DxE5jI2hFsuQeKmS4p/CzovaPawwmj1403eOoQBQ1oViOdFcYteaQXw6ile5lT/yLzxH7cHau/2ecrhP1remQIiEgsVYqbeYwiJ9tH5l9XmHCjTdM/F2hYxSPrdjuJ4+ORspxQk23xTdMSTUU/Izj/2vdN778MmxDykkWB39DvBIRP2YJcCG0CsKJjLpU2DjK2rdjP6+TMKZoNiD9Czb+GDTWo0KYyNx6IgXZnNJPJeOlDI5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWvf6RTC/CUx+egSILkPzv4a5ktM+HqykOeqEnNStnU=;
 b=OzrHVRp0CymvX013nlVQJUAvAIpBoxllcuOfSo9Ug7toxSeL6hxSosMSFmC/eha47NfH9ahHcDgADJkEoJxU4NpbYWXEI5yeuDKAiTEPxMv0wOrCZ3EhdnSeSIH+rfo9QCccgHFOv5jOMmSm4fdQmh/EkV7WiErHYfodPwmCxvNSu7B/ypR3B9IyAbKI50ZclceqZ/lpxBPCEo0NcoX9GBSHkfETRfKV4FvO7rkQVXkvdYDY26HXCyf4fUByzo8WCwqReYDSt+kgXh3XwE79w6xLE3SEJAB0RkNgTDj0BK8TbPiI99nazMyHkfNSZLj2CSCkA9AoJnG/7VJWdFs65g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWvf6RTC/CUx+egSILkPzv4a5ktM+HqykOeqEnNStnU=;
 b=hWpnKvhrIv5qDSkdpHWGJbTRn4Hn9yd13yybyznUM7CQvh4jqrluBQY505URUFtUBCVFjzWGfuAEyZgyR4+AXRtmWccmLtZBVRUu3aN2A7XFatpUHkmSo4x3Q+bYy6T7qKbp1Lbm+KBu5fZ4/YTSKZEAcjSEebqHWHPVAuUYLwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 07:00:28 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6755:ec77:7e30:bcc6]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6755:ec77:7e30:bcc6%3]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 07:00:28 +0000
Message-ID: <2df75741-6dab-4365-81ff-7fc14f5d02c3@amd.com>
Date: Thu, 18 Jan 2024 12:30:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 00/13] soundwire/SOF: add SoundWire Interface support
 for AMD SOF stack
Content-Language: en-US
To: broonie@kernel.org, vkoul@kernel.org
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
 venkataprasad.potturu@amd.com
References: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::11) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SJ2PR12MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: b64456c9-4c86-4aed-02d1-08dc17f3273d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/uMJFvSj9AlgxqBm+uqSXEokcQFCYaIpgtGxFIEqI+fBUFBRJB7G9HBCA3NYmHxIfTXhiQ6C84vX7MTYI43i9rftnJK2eS1yVrf7tc3tiWBwcxA2X9h0TQ3JwPePZQDI09ii8QWHEKOFB++QImIUyEK+15WggGdrshoF9xKLF6OOo8gspFdHoRbCUdowC8Dv6diUvZlYBaugenPbJou0n0PvLmwtPJnDBgtof0KQxF6kyOolBf3bngYSoufDehXhCa3ifrbJ8MCJJiii5mPodzFISJBDdXp8Tut3A7GyZLdSmJcxG8Mwbw56fYhRvizovQcHNSPMWGtbRe/JqIk7SIt+tlYqIIeN4Xx8LV9jZzhFTEOjSc//df3W3egBOK8pCjC6YUZoCnHnmmtHNboE6YaARxXKlZ4qkq/xW2pWsHZs9PcdKs0Dnm1xz2p9IQmhGP/KtEs8Zp0fF7R6loHGugPjd9Ynw9U2ltXpnPsDwsqCOwL9hiIJvn/qUrc1L05z30aevCfi52vs7djq8B6T4D4MaPFpy5+H8V9RUUXJCGY2WZUyurGRaDPLRX2P8PONH55AC75/+47Z9JKFacIWp2/Y8FZA4TIJHl2JTk3l6TxNEKk6Rb3alZSNI6ji9p35
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(136003)(346002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(6666004)(53546011)(83380400001)(26005)(86362001)(31696002)(36756003)(6506007)(4326008)(8676002)(2616005)(6512007)(38100700002)(66556008)(66946007)(316002)(66476007)(5660300002)(8936002)(966005)(2906002)(478600001)(6486002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEowSWFGT3RIYk94ZWllemV5Yml0UDVHOWlMNVg0WlZ6aU56VGV0QmJOVkd5?=
 =?utf-8?B?Z2hUUkg4REFHRllVQkJSS2dLeHBBWGZMSmc1M1ZWOFl5cHFieXBxYVJDdHB3?=
 =?utf-8?B?elp6eElXaVl4dW1SdGEvYXJzQTlSdEVPM2c2NmdtK1hoYWdxL1BGTmJucERX?=
 =?utf-8?B?OWQxUzNJalFwajhjbElXK1pHeFo4YVpDSmtMdXEvSGpJeXFkMkN5SmlzMm9J?=
 =?utf-8?B?WG9mUG4xcmJNU1crSWF4L1pCbmdVUmRBK3RFUy9DeHRLeGhuOXNVcXNpK1pX?=
 =?utf-8?B?cWdacXBuaUhlU0d5VkpRRFppTmJGaGtZVHA5M2ZWbEpPZXZyQVJucjdTekhr?=
 =?utf-8?B?UjZrSi9zWllSQTZHT3JtcVdLZ21acHptZmVjd1VnZG9wVUk0QlRMVXJ1TmNj?=
 =?utf-8?B?WFFFNlU2cVVqZzFVc0cxbnBCU3dCU1FBK3pkQUJISVRFN0V0QnJnUUNZeWRo?=
 =?utf-8?B?ekZYWjE0Zm1ZNjlNSVZmaDM4ZVNYVzVpdFRIbWN5UU9wVHl3eDNoTUlXemh3?=
 =?utf-8?B?WDNCNm03Z2RqTEpRS1hQSjVCdnI5aW5jZ1dLT3BRTlZTSHE3VzlERVUwazFi?=
 =?utf-8?B?SjBmbC9JbFRMVGhvUjU0d2V5Uk9vLzRNOFdEa2l4K1lLbUY4N0I1cXJnamJI?=
 =?utf-8?B?U2IyZVJFeUtLSTdUaERWRkZLSDhMaHhtS0JyS2F3MktXUmRjOFpmTmJDK2Vh?=
 =?utf-8?B?QzJYc09xVmYvd0pkSEcyV2Q1RnFPZkZ5VjRWWlczQThWa1VGcDcvZ1FRVnEz?=
 =?utf-8?B?S0JpMnVxV0JaU3FsVU8rbXJ5SDZQc2NTbnlQUURWUWpSSWVaSHF1dWNsdHVs?=
 =?utf-8?B?KzgzakpFMWlVSFJOR0pCWXFtSkZudUQ2ejRCd2xUeU9Ic05rZ1N1UktCWDhL?=
 =?utf-8?B?QlNGR2FzZVZoTkNNV3J0cXI0V0hnRHFHd3lXWEVOWjBzTTUzS3l4cmxtYlY0?=
 =?utf-8?B?YXBQdDZGOHhQY2t6NlVWNGpzelpVay9rUDlmdyttU2Zhdm9JTFdYWHQ1YmtJ?=
 =?utf-8?B?THk4VkVXU2txOVJzeGJlRjkxMS9rSDF6YnJOOE5veXY0eEN3SktzVW5xNW10?=
 =?utf-8?B?Uy9PUEc1QlpHaHM3Q0gwZFphdmxNQTBkZk5LSlh5QVVwbW1BNWd3eUpUeXpE?=
 =?utf-8?B?TFA5eVJFOHB6KzJPZUhRVENKcy9wT1ZpQzBUUmZTREdqM2o2b3VqYm5YVUdE?=
 =?utf-8?B?aVpLREZMV3dFTjhtL0hPbkx3Zmw4QXhxdVlra0dWaHRycS90K0xzalViSVNF?=
 =?utf-8?B?SkF3eDdldEt1R1lNZzlSNGF2RjVnd3M1bmxKVkF0elphTmxGdXRDbFg5b3dq?=
 =?utf-8?B?SHJLZzhveDdzeE9sdm9VSkVKZW9abjg1Z2IzakhhNnZYc1QvTVIxZUQ2S21C?=
 =?utf-8?B?WGt6aXVTWGhqK0NldWpzMGpLOUZVK1dpZngwMmJRcG5sUWx0S0tFMmhiWDZD?=
 =?utf-8?B?THVSSjB1eHhOVmlUZlJSVFYvNTZSK3FlSlBFd0czTkhiT3dOQlpXQjk1aXZX?=
 =?utf-8?B?MEh0L2tFS0RvMU5zallvZi91TGd3UWlLMjJZSHRuK2drcnBXL0xaYmJNZmNF?=
 =?utf-8?B?NEhZOUI0Q05LOE1sWHNnb1Q3cHZpWVlBQVhhMFVPVUJMOWlJOEx2REw0NVVw?=
 =?utf-8?B?NmV1QVJKTGs1WlNMaG9RTi9aNzh4YzFhVnA1Ynl6MDZYenl2ZzJsOStxalY0?=
 =?utf-8?B?MWhjcUJOU2VtVlYyR0Y4TmgvdWNvcnhmOGhvc0k2dnVVaXJ3cU96c0NZVEJs?=
 =?utf-8?B?ajRZK0UxRmczbEJPUWdhb283OWs3b3U2cmpVakNxMFZSa3ZIUmxmVWV2YXFr?=
 =?utf-8?B?alppaVIrZWlwY0drbHhVcmY5QXFGUkhWQ2hJZlNsTWUzNldWQTQzTGlWZkZV?=
 =?utf-8?B?eldxNzYzNVZyc3FMUkx0RWtQdVNmcHYwWXBLNVc1NlM0QllEODI3R1NwRThE?=
 =?utf-8?B?NVZPV1BHWlk5NnZpaHpVWmxhekZYWUNlY2RSYmxaTzB0cUNmTks4NjlEQkNT?=
 =?utf-8?B?UTgydVVvTHlHVkdzNXdYK1g2c0x3aW1NRTNCclZnSWRaK0hvR0FhRUpielB4?=
 =?utf-8?B?a2MwREczSFdNNlo2cG1yQi9jZWh6WmFwc21kdFpUWktJM2FkbnBCVkUyNnBj?=
 =?utf-8?Q?yOOXuiCIUMd066IG/wbZIlaPH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b64456c9-4c86-4aed-02d1-08dc17f3273d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 07:00:28.7092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5THWMpLEqU3IiB5P8v9NMqCD5yFHJEsUg8LcI5zyijxvrmNCZkLnck+9FECUudvyeQVP9Q8N3lQndQYnIHXw9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781
Message-ID-Hash: MGZNTX5EYYTVRWGBESYFK3RC52UGUO3C
X-Message-ID-Hash: MGZNTX5EYYTVRWGBESYFK3RC52UGUO3C
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGZNTX5EYYTVRWGBESYFK3RC52UGUO3C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/01/24 15:14, Vijendar Mukunda wrote:
> This patch series is to redesign existing platform device creation logic
> for SoundWire managers and Implement generic functions for SoundWire
> manager probe, start and exit sequence which are common for both Legacy
> (NO DSP enabled) and SOF stack, and add SoundWire Interface support for AMD
> SOF stack (ACP 6.3 based platform).
>
> Below patch series is reviewed in
> https://github.com/thesofproject/linux/pull/4699
>
> Changes since V1:
> 	- add new commit to update license for amd soundwire manager
> 	  driver files.
> 	- wrap the commit message with in 75 characters.
> 	- add amd tag in commit title for soundwire patches
>
> This patch series has dependencies.
>
> "drivers: soundwire: amd: refactor amd soundwire manager device node
> creation" patch has dependency on below patch.
>
> "ASoC/soundwire: implement generic api for scanning amd soundwire
> controller"
>
> Similarly SOF patches has dependency on Soundwire tree patches.
> This patch series has to be reviewed and merged in one go.
>
Hi Vinod,

Could you please review SoundWire patches?

-
Vijendar
> Vijendar Mukunda (13):
>   ASoC/soundwire: implement generic api for scanning amd soundwire
>     controller
>   drivers: soundwire: amd: update license
>   drivers: soundwire: amd: refactor amd soundwire manager device node
>     creation
>   drivers: soundwire: amd: implement function to extract slave
>     information
>   drivers: soundwire: amd: refactor soundwire pads enable
>   drivers: soundwire: amd: refactor register mask structure
>   ASoC: SOF: amd: add code for invoking soundwire manager helper
>     functions
>   ASoC: SOF: amd: add interrupt handling for SoundWire manager devices
>   ASoC: SOF: amd: Add Soundwire DAI configuration support for AMD
>     platforms
>   ASoC: SOF: amd: add machine select logic for soundwire based platforms
>   ASoC: SOF: amd: update descriptor fields for acp6.3 based platform
>   ASoC: SOF: amd: select soundwire dependency flag for acp6.3 based
>     platform
>   ASoC: SOF: amd: refactor acp driver pm ops
>
>  drivers/soundwire/Makefile         |   2 +-
>  drivers/soundwire/amd_init.c       | 235 +++++++++++++++++++++++++++++
>  drivers/soundwire/amd_init.h       |  13 ++
>  drivers/soundwire/amd_manager.c    |  45 ++----
>  drivers/soundwire/amd_manager.h    |  14 +-
>  include/linux/soundwire/sdw_amd.h  |  81 ++++++++--
>  include/sound/sof/dai-amd.h        |   7 +
>  include/sound/sof/dai.h            |   2 +
>  include/uapi/sound/sof/tokens.h    |   4 +
>  sound/soc/amd/acp/Kconfig          |   7 +
>  sound/soc/amd/acp/Makefile         |   2 +
>  sound/soc/amd/acp/amd-sdw-acpi.c   |  62 ++++++++
>  sound/soc/sof/amd/Kconfig          |  18 +++
>  sound/soc/sof/amd/acp-common.c     |  65 +++++++-
>  sound/soc/sof/amd/acp-dsp-offset.h |  10 ++
>  sound/soc/sof/amd/acp.c            | 202 ++++++++++++++++++++++++-
>  sound/soc/sof/amd/acp.h            |  26 +++-
>  sound/soc/sof/amd/pci-acp63.c      |   7 +
>  sound/soc/sof/ipc3-pcm.c           |  25 +++
>  sound/soc/sof/ipc3-topology.c      |  40 +++++
>  sound/soc/sof/sof-audio.h          |   1 +
>  sound/soc/sof/topology.c           |   5 +
>  22 files changed, 802 insertions(+), 71 deletions(-)
>  create mode 100644 drivers/soundwire/amd_init.c
>  create mode 100644 drivers/soundwire/amd_init.h
>  create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c
>

