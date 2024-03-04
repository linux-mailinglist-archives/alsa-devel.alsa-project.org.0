Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B365B86FA39
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 07:48:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58B3E832;
	Mon,  4 Mar 2024 07:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58B3E832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709534931;
	bh=X/gpqO9RrkFoC0iaNsnIUkn8RcbsGfVVHGOD8JuQk5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nB4r4So/tqzfC+OvF56qYh8Y0RxrjjESXKzKo0SiUO/YnnK8GSHAJmV/OLOA8wMTz
	 1Fr8VTdkCXql8LVHX8sRntacvoBuI1Mczms8oIIGi3mxIxypkujm1Pd47n83F6Xvl4
	 89z6y2gyQRjraXFyiAvVCZUT7UW+oqlvvzcf2vvU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 055B7F805A1; Mon,  4 Mar 2024 07:48:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B11B6F802E8;
	Mon,  4 Mar 2024 07:48:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AEF5F8024E; Mon,  4 Mar 2024 07:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EACD4F80088
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 07:47:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EACD4F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RY40CU/c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8a1qkR7flZQonIUl4SHIsxkl1lFAKuCYbXObuXTlkUq8AfbCgigjsm0usBMWumFl+6R7fRPNnBXTO/jaDwjWiA+92tIPzzcIXHV5R9bsPR2d79y9toKweZeqlrdQCPaj2XAQU5cJt/E6hsvyZTlbxKsiNBtWGQ8wtyekyilH90XO1j1PzyqXCy/pbdHTYhDZWRbnAceOtQvsEAX8jUZ6NugwkBc4ZzK2q78EJjfhEf6qu10K1rvSYvS7kzozWgWOovUQjLVHwnLTdw2s/C4uZcYrNLjB+NwHQiUvVeqyQ4U9N/Uq/j3kS3XmIbn+y9jN7b5JOVj1IZlRMgunRTE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QITdAznjhi8pHxngDL+7/Eh/3BDJ2IK+0kp5NWC/7Y=;
 b=WG1/Tmp4mPO2SwbwZYKUeaP4GYUBi4/4qit9j5fayUUvvz1HsGy/1zLEITyy0xAF4BE/gpvHvxGnGCPb64/VBxRH80lF0rLsiFqHaS/AF612gWOmvthRE479Dszh6DZmUhPCnJc4e10P7oGU5VLmrk2QgKZ05CzSJsJ6OXSMEW6p8S4JFp3GPlZWa2JA96ina5rcXv62C3bl+7H2XBr+lPPbeXFr0dMHpZXJ67XM+mord+X4RCh0mcN27DUPrKsxfszFT1BKb1HEoPnHkDspdkFaAP7sUgxDUP9/ZvSaQ4h0xxSHAu8DqDszmh5yuRYnDBwVwtwYgv72yHWMNtn9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QITdAznjhi8pHxngDL+7/Eh/3BDJ2IK+0kp5NWC/7Y=;
 b=RY40CU/crs8ICQjE5mfg4k7YHlUq0LCWopAZrPlrq6IamoYSKLklJgV8Dmll5hK3AxpBWIAeqF6Js+5VdpFMQ2S921A3r0KFOvETqVRzV3g4E6Aa8omi+k3uPksd8MC34BIhT4YHGmKtiRqFeurhB2wKqNrpWw76PKYV6uCkinU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 06:47:48 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3%3]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 06:47:48 +0000
Message-ID: <581a81f4-e540-4de2-b17d-51bc192ae6ec@amd.com>
Date: Mon, 4 Mar 2024 12:17:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 00/13] soundwire/SOF: add SoundWire Interface support
 for AMD SOF stack
Content-Language: en-US
To: "vkoul@kernel.org" <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
 venkataprasad.potturu@amd.com, Mark Brown <broonie@kernel.org>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <565b9a1d-a074-4bb6-b4c5-2b9be9095a3f@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <565b9a1d-a074-4bb6-b4c5-2b9be9095a3f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::9) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|DM6PR12MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: da1f25c9-5a65-4ed7-f968-08dc3c170111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ji7FrsocHyzDf7Q2HjqNk7J+0/WNTscoGSd/hP8l8sA15kR1XXvhIzMu2sTS7YpmutEiJ3AZSGk/Pz9m6n5ThzZfrU9JsKWKl8MANQUpwbd9nIBqG6mVEpe1UzJWKqv5S0B+U3vZZCsd974lMz1Ck3QpBSGInS9bEm/+qwbhONxYfG5FpSIadMXEn0OfYPSb/aKsNUuk+Ei5iDzDPl+/3rX9TZyDEkL5iRtbp48DFLuNhcr1qgucj+IjNdpYjJ6n5rJqgsmTAwBlnd4+TScQV3qxlhxmurZaMVjte9YIqmpMUHOVZi49NmhczjZ3OZXzQNFBaPkffkNQNYgrvSAYwJDv8igoSGnS2XuEJmq1RPBzZdQZCzV7Myz+RE3EMbb/1ydIoHv7o2HDdy4xSpCSNDs78NqTKKHR0rv4PiVQR8GBVsIw4xuwnc4HR4tmJoo92sLXjcSBw8oieiaIQcuiNAJCXxXexwKMe2NozOzfTP6sRHg2NiDMyL82ehL5HUcFugnxVNtQL2S2CjipwFp+GvzgLsfV11TfXwcBuWRbWXC6oxVAXpNQOcamfHP5pDDW0W5IYuBIpOfbcQN49esWoNd1g7IAWkHlhOJxRxr0oog=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0pGZDdWelBNZThCQ3pKMDMrTnhodjBJVkR4UmNxNnlJTTd5U28rMk1vRnkv?=
 =?utf-8?B?UWxpcjhJNVBSN0tPQXdOeE50MnBiZzBVYytUbzdTTE1sbGZkQlBWdVZpMmFO?=
 =?utf-8?B?QnlTRk5SVTdrdk95S3ZSSE1LQXZnWTdTL0N3Q0oxWVVOT0Jsb2JPdnVxaGRQ?=
 =?utf-8?B?OGFic0c2SXJycUhmQVZvWnJYWWpXV01vbmhxQkcvVk01VStLV09Ub05sRGZW?=
 =?utf-8?B?SlZVV0FvbHAxTXN2VTZJb0d5YnVTeXMwcGc0MktqMjZuUno3VS9qOTVDbm43?=
 =?utf-8?B?TGhoc0NtVnRJQytJQ3NIa3ZLYmF2TWlmM2xTZklqcDZVQUJ0NmFnU2FoUGNs?=
 =?utf-8?B?OFFYdDdHbHkzWStYUExnWGhkNVdUVWtESThJR05qUjFHR2d2THVWbXk4OTJ3?=
 =?utf-8?B?bkhScnEvN2ZrZEtLLzUvN214MHlLMVZDTDFFZHU1V1hUSWxlYW5oRENHOHlD?=
 =?utf-8?B?STlEZ3VyV3NIV0NVZ1p5RjRIdkZlR0NCWDRDUDNBUzNoYWp6bzBpamNTS1FS?=
 =?utf-8?B?VHhUcC93V29hemVzZTZreC91am4raTVIOXNvVGM2MUo2WStOWjlxZ1pleWU4?=
 =?utf-8?B?ckJ6UkQ2a2cwQk9adW02SFZldG5SWVFWeDJZSGNuOW10WExSMThBSUk5ZDBE?=
 =?utf-8?B?YjJKZ0V2eE1zNXdlZ1c1SHZvOXhUWG1TakVOaDlpVC82ajRaeC9jZHJOMFQ0?=
 =?utf-8?B?YmpCR1NJQTYrdEovSG1oTFk2bncvZzlxVU5PUGJ2OHlDOEdQNmxQNDRTZ2xR?=
 =?utf-8?B?dVE2ZXpMcHRHU3BqYjhtZVZrY2JHaHhaTGo0ZGU5L3JldWhiK2UzK2pnVmww?=
 =?utf-8?B?WTg2ZEx3Yll4bFpLWHQrdjNXQzI5VnlmTWNFYXdIZ3A4MEo4MXZ4QnN4Z3Jp?=
 =?utf-8?B?TTU5b01MUnhQSlVnSTY3ZEdrSTg4Y3dBa0Y0Y2UxQ0V5SXFkUkRNc09GMTBa?=
 =?utf-8?B?dGE0MWh3dTVIdzRRekM4OXJUZzJJb1pXbGlJdExzem93SVBPZWUvQ1NLZ0tw?=
 =?utf-8?B?QmMxQk1tc0ZuZnUzdFpmWkIyMnpRL1F5M0hWamFMbUdmblZwZ2hvakNzSHdr?=
 =?utf-8?B?SjF2K0dpMHRYRFduZ1laTlJGSXJ0dFVsWmkxZTViYk5hV0Yva3NORUVtTVlY?=
 =?utf-8?B?clRyZy9sK09CRnpuVmdRaVJ4M3ZRV2FtMUxzN2c0ZHcrM0FzcWNTWWNJTzlk?=
 =?utf-8?B?OHJlMm40U1dMQ3RBSlBrdTBJVVRvUXdWQWJJL0kyVUQwUExVck4zKzQyQ1RR?=
 =?utf-8?B?L3VOOUFNRzJsWm1STmNEM3JkOTJwT2lZQ1N3N3BZbjhCS2lKWGFyaUcvMmM0?=
 =?utf-8?B?RmU3MzVHRFplVjRkeXpaVjZremlYV1VBOHRtblZUR20rdkd4RHJ6VVFSRVBn?=
 =?utf-8?B?bUZqM1k3QXprL0x2d1Z0OXBNeDVSbUJlZ2Nod1oxNHg3eFJoTDM3eW40enpy?=
 =?utf-8?B?RFY1MGZwSmprY2d5TnpvaVMrMFNta3NGV2Z2Q2JoekQ0akVEV1JaN2ZoUEVS?=
 =?utf-8?B?aHoreE93Tlo0VWFGSnBKV0wrQy9MWG1BVnF6ajNnNHFqNXorWmpJVUc0RDNR?=
 =?utf-8?B?QmVTNVZXenNqVExKZVJYenVOVzU5djFCSVExNVY3cUVoWDBFdHdwQU85Mit6?=
 =?utf-8?B?eDFYL3d5eXdZV0ttL0hiVkM0Vm05K2ZVSGxnWkpNU0hQb0MwZ3M1T1BzaFc2?=
 =?utf-8?B?SVZtVkdLYkpSd0FqcTdsZHlGVGNFYU5jT3N4S2M2NUQ4eWtzT3VsM0RLb1c0?=
 =?utf-8?B?R3pLVmJKZjlPTHdsZjIvS0RLSStHUGpFWTJuRzlJU3hkaDFqdlF6cXNUWTJn?=
 =?utf-8?B?Z0xCTGNzQVpuWjE2a05uZTFwNnZBaE0yQmR5VENIZWxGMkh4THpFWTNFMGtF?=
 =?utf-8?B?U1pSUWM4V1NOMUYyMzJwajMzOEhjY2ViYUVtVS8wdVdwbkpON2lKaEVwY2VS?=
 =?utf-8?B?VEdqMklXVDAwQ2xkU1BWSGRITS9wMVlwd011WUJ4MUplNUJXRGtLcTBhRlJV?=
 =?utf-8?B?OENTSWRCZ0dhbk9taHA0cVJkUkxsVmE4UEJRRGRtanB3d3BFb014dFNBdk9n?=
 =?utf-8?B?RmE2K1oyeXJ0NDh4QWJPNUxwTUxwbTRwR09TVFFOdjBqcDNORkF3M1d6OUt3?=
 =?utf-8?Q?yZhvP+KMzgO7dFcONuKJEA3Rx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da1f25c9-5a65-4ed7-f968-08dc3c170111
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 06:47:48.1562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gnfsi4dc+7266Dt3bR5R43RKXFFWtqnL9IbEkCmJ9lP5S9QjgmdcpU/g8ApNdG8xDrWj8r16u230CTSIOumz4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282
Message-ID-Hash: 3JS2C4HVNS4AYEUQ5HOTPMCPNZSGMUMG
X-Message-ID-Hash: 3JS2C4HVNS4AYEUQ5HOTPMCPNZSGMUMG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JS2C4HVNS4AYEUQ5HOTPMCPNZSGMUMG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/01/24 23:21, Mark Brown wrote:
> On Mon, Jan 29, 2024 at 11:21:34AM +0530, Vijendar Mukunda wrote:
>> This patch series is to redesign existing platform device creation logic
>> for SoundWire managers and Implement generic functions for SoundWire
>> manager probe, start and exit sequence which are common for both Legacy
>> (NO DSP enabled) and SOF stack, and add SoundWire Interface support for
>> AMD SOF stack (ACP 6.3 based platform).
> The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:
>
>   Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-soundwire-amd-v6.9

Hi Vinod,

As this patch series is merged in to sound git, Could you please let us know
when this soundwire patch series will be picked in to Soundwire git.

We need to send few fixes on top of this patch series.

-
Vijendar
>
> for you to fetch changes up to c1263c75294cc8178ca964e0220b35518d6fb38d:
>
>   soundwire: amd: refactor register mask structure (2024-01-30 16:06:36 +0000)
>
> ----------------------------------------------------------------
> soundwire: Shared branch with ASoC for AMD driver updates
>
> This branch contains the soundwire portion of a refactoring of the AMD
> soundwire controller and audio drivers which allows for better code
> sharing between DSP and non DSP case, as well as support for SOF.
>
> ----------------------------------------------------------------
> Vijendar Mukunda (6):
>       ASoC/soundwire: implement generic api for scanning amd soundwire controller
>       soundwire: amd: update license
>       soundwire: amd: refactor amd soundwire manager device node creation
>       soundwire: amd: implement function to extract slave information
>       soundwire: amd: refactor soundwire pads enable
>       soundwire: amd: refactor register mask structure
>
>  drivers/soundwire/Makefile        |   2 +-
>  drivers/soundwire/amd_init.c      | 235 ++++++++++++++++++++++++++++++++++++++
>  drivers/soundwire/amd_init.h      |  13 +++
>  drivers/soundwire/amd_manager.c   |  47 ++------
>  drivers/soundwire/amd_manager.h   |  16 +--
>  include/linux/soundwire/sdw_amd.h |  83 ++++++++++++--
>  sound/soc/amd/acp/Kconfig         |   7 ++
>  sound/soc/amd/acp/Makefile        |   2 +
>  sound/soc/amd/acp/amd-sdw-acpi.c  |  62 ++++++++++
>  9 files changed, 405 insertions(+), 62 deletions(-)
>  create mode 100644 drivers/soundwire/amd_init.c
>  create mode 100644 drivers/soundwire/amd_init.h
>  create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c

