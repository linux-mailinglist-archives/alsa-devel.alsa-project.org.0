Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E00666D65
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 10:06:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FFA72F36;
	Thu, 12 Jan 2023 10:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FFA72F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673514374;
	bh=FnRr3C1FQwaAKpSbIg79RbvJmeYNSKZRaubMXnw7ZxI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TrNKWGttdprvXXQNI4/kMi5p+2wZLTd7rAOvvdJZhP/WbzzWs+SFiPrOWT1jZXRXt
	 Louwv7KWozBKEjHBDnsbQIys7/OUwlr4p57NlNHNjuZsrN5AkpZSVGhoqubb2j4ac9
	 0XPE8B1X8JIfV8rNqNRQG5XrOp4SReNRyFPwnsFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5684EF804CA;
	Thu, 12 Jan 2023 10:05:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08B19F804C1; Thu, 12 Jan 2023 10:05:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE3C8F8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 10:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE3C8F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hWb/lG4a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7UKf6XLwJbyIE4QkDPcIJq/W0D4ET0eGie7c1/yTbUUOQI35TWIPfEWxj2nPXR3BbOZToSTUFxNeLGalYjgjnVTQsnJiGtyM0BbgJbx3/OPBmo4S1P2rrsz0SNtg1bcJLzIa6QQKDEXVnkeuzONHNK/w/M5bCfIjba19lOnB9OSgC1YWqBE18H6a0gBPQs4xNWhFk9b7UtPh1lDg4/FWnchKfIn8BWfoKJZFe/h+rm5KLo92jrpZOAPZix1d9Yqdp7rASShEQ0c/7xk9a/TY+7F9Q+6FodRLQmVdlpTew8oG7H7ynkvhXpmXMx5g4x24z49KKtc1/DkPe9aQx9e+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoqrzJK+052bCq8e6C6orI7YmTmIVSOeTKLnlvKfzpE=;
 b=R/4dZJkb7pUGbiwYFq+z3frWu1l8QJrCGpmZ1IStUv8aop2yJjK3tPUo4S+SNtFujwMM/aEsz3dU2ibRq4RbHKKSFmccYPIIiA0ztzGMWHG0qy4/u4MNMMlaSvY8Lzjy1PSQNM9Ob2VAcBvruAnsZU9Tc/mxcqTqDpcfLOGmdMhCurViRjscJFdxQDNIb0/3sB+59iq83VztKYyg0WRD+5LGk/+teog6xO6IxR9zIpvCW2z3fo07eVfmo0o7eV+sDVqxJ769CUoZY4f1Rp3vmATlxqwfjetuvKUS0gfcgvHu9v9sTJs+g4f0KI9ELHqJia07fQ1h9JlVOSz98jEYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoqrzJK+052bCq8e6C6orI7YmTmIVSOeTKLnlvKfzpE=;
 b=hWb/lG4aWXNFASTq/QvY3bWNK3wTC4QOKJJXaklGwFJwCKAoNyYVudExnh4fOTfyOyvhvpwLeXkiFHg+zWDw+g1GMgGRxH58i7MDak/8s5xyseE/EfZc3qAdQftuKBJQuK2n7aTE6hAryztc4tds5OttFrZV5OYhgQonKv6w/iI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CY8PR12MB7588.namprd12.prod.outlook.com (2603:10b6:930:9b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 09:05:02 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::fc88:7080:445e:6866]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::fc88:7080:445e:6866%5]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 09:05:02 +0000
Message-ID: <650618c9-6832-d86f-05ca-e7968b245021@amd.com>
Date: Thu, 12 Jan 2023 14:38:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/19] Add soundwire support for Pink Sardine platform
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <7ad57c38-7ccd-46a3-b4d9-d10f41547757@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <7ad57c38-7ccd-46a3-b4d9-d10f41547757@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::7) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CY8PR12MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 30353322-e1f8-40c0-e6fa-08daf47c16ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RnrdSZyruTTtc8C9kyWDVbMO6x033FE+I2Z0SfTH3JwFZQ4U15urxg+sUP+KjKqaPTcPFP9n6SWxPSiTkzTobwteuwPmWIWXkEglO4iP7ZS8fnqdr4S2Fo61Gio1sRSKIQZVKqNRN0Yyu5YncvFuguOCCuSqLTTyb771Em5zpue8AKfpryVZSH9EdeBAiu1yrqg+X44YpnXZHmGcbGSBAoOMdpuEFredgVESZ9ZSGSH8wdFFj+lORHh1Hr5JuIF8h7hzWhWBrOFGbx+h4HgyGU+t5ByB1aBNRfwPn1p/U7Bqw40PkjzAA/Iojzjzq39zBF0MlQq4Pq7MWhmWXlEvGP1grOhfsToCWrxpKyvDtabtPEhXarbtX56OiGxmvlVBN1UVt12V4s4gagaWCH4xhIIX4U68QTbc1IOZayPHawfa/cOZPD954I7tXBC2oUtQAtYHusFEGBrOrArpmSl0fyEhrDvW6foKnryAU1gBGhn9/oRn+TUcSVDnVsdw5VU5yoAeTpBoSkOp12F4q4lhotHgQi+QgeL85dwmBgBpLdEeIFxYtcakdn7136qm9xaiOBbSVIfXw/P3Gqt/E0/ZXDnq/gTRjhX+gTFSfLOztYbcYhOS9sCW7gRIZkXS/YFMwmFTejNm17Qmi2Ec6a5UVne18LkEHPVpb04Mt+h8Sh9s1JgyX4mUbDRr93oX6iJRN44Ty3bt6N/AsKqzmc84RL5uKmFB3CBzJqdttfp1OIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(53546011)(2906002)(6506007)(6486002)(26005)(478600001)(6512007)(186003)(31686004)(316002)(4326008)(36756003)(8676002)(66946007)(66476007)(66556008)(2616005)(41300700001)(8936002)(5660300002)(38100700002)(83380400001)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MksvTVkzbStlNTE1bUhZZXBJZGFqVHpQTTh3WWR1YUs0MUpvamxEdmZyRGd3?=
 =?utf-8?B?MVBrd1A3N3NTUDJNMkYvQ0hPMmlZQ3Jic0ZsSkNEbkV1eHhQNlNZUllvamE1?=
 =?utf-8?B?NnZ3TWYvMEpqRDFTSjNoSSszUWszODcwMDN3N1hCMGRHMTdnMEpKTGtsNER6?=
 =?utf-8?B?aWNPVHU4dTJpemJxNEtweTlzWllSbmV3UEVsTGJtb2taWEpmckNxUjZJWmZI?=
 =?utf-8?B?VlprNUVxTUxqNEpwVGdueHZuOW5EQVhhOC9pVlE0ZFJrV0ZhcFZpTjBKWEow?=
 =?utf-8?B?eGpQNXRVa0taanhRUHBjTXV0VHJkMmRwT2p6QWxZVkdaaFNnemNvTE5EOWFS?=
 =?utf-8?B?a3p0alhOVGIrcEVSQ2hKakpVM25URElFdHBvcTZFNDU1WWVpdkJ4ZFNmQWx1?=
 =?utf-8?B?c2lPRVNlbkNoUlBhZkV3YU1sVkxaVllNeDFMOFRrMUlVenVKSzE5aURCOGVq?=
 =?utf-8?B?N21Hb0cyMDZpTFY3V2R3QVIzaUJYZHVrQU9zVDJwTks4aDdGVlQ4YTRWcEV3?=
 =?utf-8?B?d2dnazNDSERIODZWekhRbmRidnVsMlhHQWVhNTFCWE9LY0Y0YlpzMVM3Tzl4?=
 =?utf-8?B?VGcwaGFFRnFxU2E4VnpWUmEweG9sdkJlK0FxOXNPbTJ6Z3IrTTNDNTl1Lzlp?=
 =?utf-8?B?N3dGMEo0V25ublAvTVJWM0pYVmxNdFJHNnhiaFgzM3RUS0R1L2F0MzdsT3pk?=
 =?utf-8?B?aXpBa0dzaEVvWVRDQTJHa2FsY1dsYnhac21tL0ZsVXYzb05oK3duOWViME9C?=
 =?utf-8?B?NXlXUVpacjVpeGFGY0N6YWlSMjBXTWUrMUIvRmpZUTRYdnJwNmhqVHFqVmY4?=
 =?utf-8?B?bXpiWW9FbXJrejJLNGR0Y0wzVTFSbzNMT2dhYjBhWEovMmljbjFoNHZaNmRH?=
 =?utf-8?B?WmI1OFBOdlZmYW10YTFXRldzdGQxMDhUc0Q2SldzZEIyQW52UkNvcFRQRnda?=
 =?utf-8?B?aU9idUZMYVRjZDVnMk1HdUVZTTNlMDRTL0ttNGMxN244R0x0QmxJb2g1a01k?=
 =?utf-8?B?WWxDVGRDL3JoQnptWUxMMnFSQU1iUnNPQXZpZHI1UW1XNXdoTEF3Tk1lYXds?=
 =?utf-8?B?Zy9Jd09yZ3dHakpPMjBxVS85eUJ4TGFCUEJJb0lVcUhTRjVyMkpBMm9LdlR6?=
 =?utf-8?B?clVtaFZxREsvQmd5T3FwY1RtWENrREVxT2pkaDFkQXJIOTZla3dvTk13VndX?=
 =?utf-8?B?WWZhMGdNVFZheGROdzFjZHdRRDhHYXROdkdBZXg5YnYvYmxMUWFUYnI4ODh6?=
 =?utf-8?B?bmtvdTFQSFdJbkRMQlE3L1hrd1cySE5tNEN4S3ErckdGNE5LRjR6VVFMa3k2?=
 =?utf-8?B?ZXRzUGgzVjJqNDgxV1FDY0x5OXAvaXl4NXBaa2o5UHRLa3Y3TlVpNjdOOVFj?=
 =?utf-8?B?Zmd6emF5a2tlREF0RlF4Nkd3TkVodUd6VHNVS3h5aFptcGY0cE9kOWtYMEFq?=
 =?utf-8?B?UUNWTmEzOEc5V2x2TzMvdE40S0lmUm1PeEg2S2t2WkJ5L0tTaXV0VU8rM1JY?=
 =?utf-8?B?NklpSEFRQXhvdFNqWTh0cnZmN0RwQURrRVpZeFl2RkI0bDdLd0xDbEFWOFNK?=
 =?utf-8?B?ZGN2ZVArNU9hYWpMclVKSTJMMzc5T01EZlBsMTU0aHRyRkEwckQ1S3dSYnB5?=
 =?utf-8?B?QmJIUFNhM1NWNUZiMW1Dc1JCVVpLTHhMU3hXSzdrSW1seXR5S0duTFhPaFBL?=
 =?utf-8?B?d0w0RXJNakVUbktYT1gvbTgwVjBMN0p2ZjRPVkdYNHBCbk5BUU5iZ3QxWWhB?=
 =?utf-8?B?a0NKVEZTdVB3NjlHNHVPUjhIRDFYM21YS1hod3J5Nmd2OTZYcytjRzYrZXFa?=
 =?utf-8?B?S01KdGlleThsbmFYY1RwaS9zWGxPejh4K0ljL2MyNFRGdWwzZEJaQ2NrU3lu?=
 =?utf-8?B?TktKbXRIUTg5cnU5ekFyYVZjMDZmQmwvR29CRGloR1FkTDJ1WXhDNlBIeFNT?=
 =?utf-8?B?RkVkMVpsYnRDMlp3cTZuaUd6Q0MrL1I0U2RkWnFjQ1ZVK3k4VUo5UWdoQU5D?=
 =?utf-8?B?NGJiNmVmWlZCaVgwZS9PcE01L2V6Y3h2ampRL3lXUkxabXVSTVBpMHljRVpo?=
 =?utf-8?B?VXFZWXNxUHprWWtod1pwaE9kK3Z2bitoWHBiVmlEdWgvbUF0bEZIQzd5V2hG?=
 =?utf-8?Q?Hr1US5PC4GjyS4id4UQ41Ylc8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30353322-e1f8-40c0-e6fa-08daf47c16ca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 09:05:02.5939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdoC0ZhjIMGbQ5F+dm2qp9rM90Z64G6LvlWyqeEJUF3dQljFvPzJSNcMvxMiGnyITYbf5UBGuNrayu5K5s9vHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7588
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: arungopal.kondaveeti@amd.com, Mastan.Katragadda@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mario.Limonciello@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11/01/23 19:06, Pierre-Louis Bossart wrote:
>
> On 1/11/23 03:02, Vijendar Mukunda wrote:
>> Pink Sardine(ps) platform is based on ACP6.3 Architecture.
>> ACP6.3 IP has two soundwire controller instance support.
> After reviewing patch1, it looks like there's a confusion between
> controller and manager? the use of the 'sdw-master-count' property is
> not for controller count, it's defined within the scope of an ACPI
> controller device (usually a companion device to the PCI device).
Sorry for confusion. We are meant to refer Master/Manager instance
in throughout the code. we will replace the "Controller" reference
with "Manager". We will correct the cover letter.
>> This patchset add support for Soundwire controller on Pink Sardine
>> platform.
> That's great, thanks for sharing.
>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> Vijendar Mukunda (19):
>>   ASoC: amd: ps: create platform devices based on acp config
>>   soundwire: amd: Add support for AMD Master driver
>>   soundwire: amd: register sdw controller dai ops
>>   soundwire: amd: enable build for AMD soundwire master driver
>>   soundwire: amd: add soundwire interrupt handling
>>   ASoC: amd: ps: add support for soundwire interrupts in acp pci driver
>>   ASoC: amd: ps: add soundwire dma driver for pink sardine platform
>>   ASoC: amd: ps: add soundwire dma driver dma ops
>>   ASoC: amd: ps: add support for Soundwire DMA interrupts
>>   ASoC: amd: ps: enable Soundwire DMA driver build
>>   ASoC: amd: update comments in Kconfig file
>>   ASoC: amd: ps: Add soundwire specific checks in pci driver in pm ops.
>>   ASoC: amd: ps: add support for runtime pm ops for soundwire dma driver
>>   soundwire: amd: add runtime pm ops for AMD master driver
>>   soundwire: amd: add startup and shutdown dai ops
>>   soundwire: amd: handle wake enable interrupt
>>   soundwire: amd: add pm_prepare callback and pm ops support
>>   ASoC: amd: ps: implement system level pm ops for soundwire dma driver
>>   ASoC: amd: ps: increase runtime suspend delay
>>
>>  drivers/soundwire/Kconfig         |    9 +
>>  drivers/soundwire/Makefile        |    4 +
>>  drivers/soundwire/amd_master.c    | 1734 +++++++++++++++++++++++++++++
>>  drivers/soundwire/amd_master.h    |  284 +++++
>>  include/linux/soundwire/sdw_amd.h |   65 ++
>>  sound/soc/amd/Kconfig             |    3 +-
>>  sound/soc/amd/ps/Makefile         |    2 +
>>  sound/soc/amd/ps/acp63.h          |   98 +-
>>  sound/soc/amd/ps/pci-ps.c         |  383 ++++++-
>>  sound/soc/amd/ps/ps-sdw-dma.c     |  728 ++++++++++++
>>  10 files changed, 3287 insertions(+), 23 deletions(-)
>>  create mode 100644 drivers/soundwire/amd_master.c
>>  create mode 100644 drivers/soundwire/amd_master.h
>>  create mode 100644 include/linux/soundwire/sdw_amd.h
>>  create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c
>>

