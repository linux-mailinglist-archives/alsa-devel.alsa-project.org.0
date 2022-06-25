Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 863EE55A811
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jun 2022 10:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C996F16AF;
	Sat, 25 Jun 2022 10:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C996F16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656145872;
	bh=itZ3kphB36xxgo0OlCccTCOeqRxyX3fyM8h48wTfSeo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tNelBS2b7y/wSXj+EV0QU2TIYa6A6crn2LZpcHW36JEecVkT5IvdEDttNv1/7rxpi
	 cN4N5bo9d681kYpbbuSAeS1w2HNlgp1ohKBcyr0eR4+1BwiOtZgg+dXAOoW+nV+R7I
	 t+YYzneX65QyC9aE9OYcnEFgU82ajpPcXDKHpVYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D58BF8016C;
	Sat, 25 Jun 2022 10:30:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56F0CF80162; Sat, 25 Jun 2022 10:30:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE596F80109
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 10:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE596F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VC7edkp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656145807; x=1687681807;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=itZ3kphB36xxgo0OlCccTCOeqRxyX3fyM8h48wTfSeo=;
 b=VC7edkp13tUCWIeIB5KhH5PboIBU2G93hR6qnULXRLCBE3Eb/HaLPPM8
 2pJZVqgXHyiX3JgcemakMH7ATwVoD+wO4LaMHjw75d7+FCC0PdBciDSpP
 aEw+9KIPshSEr4yfyRs/Q5rtWvLKERUW8OHbMFxPcTzzj/DN6Gz+x0KP3
 rB3F4NQ+z0UC+xA7KddstX0Vql1dJ/6nRZQzT9DDn0l1z167z48zqhAEM
 OEKmXUei+9Y2bPFZ4Ug+fyUakaQKujbXu/2C0ljo74L3SnNIARb35cdwE
 hqgFXt1EXPXxpIbWnFyCEHKH9Pwp7I3Wyuv6IlYxuHyH/10MYXK6kLA80 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="282255366"
X-IronPort-AV: E=Sophos;i="5.92,221,1650956400"; d="scan'208";a="282255366"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2022 01:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,221,1650956400"; d="scan'208";a="716474197"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 25 Jun 2022 01:30:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 25 Jun 2022 01:30:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 25 Jun 2022 01:30:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sat, 25 Jun 2022 01:30:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sat, 25 Jun 2022 01:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWG9ZC1BIc4u0iGb7Cj+qrJ6+lHOzb9bHN7mXQYJE2dMiiR1pd1mFOTGmqGO8lNfNk43D/6aOS/ckbnbHkq3yBfT4MXPeqN0EoTNq9KI70CQ1eqrG6g0zBAsfnYccctHiQ7o+uuGK63YAxbYktkUvOwEg3YLCgNNkd+qFMkuwdJiuMVAtDswrHAPiteyRbw7YqD1ZDBjCc5QDFSY0zO79ONGqWWfGw2qDgWTEx/YTJn/PtyqSvhTxPsbNYmH0JTNuYmdMPArShkbxJPA8F2317rjz/IDgFT59ysgPMjuWCf3opp4Jqdyren9yhOTPCdHlEi0db9ZaPyEOHwi/t5DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTLj5u/dCO6wsSMsLgjG4l0pvhsLlKpCY+bpsOMCqKQ=;
 b=OvYMuOrBUdF7L1Iv9Cf/e4m3NUzPImDCfw39k7f6luoy5FCJKMZjBNPVE7FYCa8yAMpRVlwbgxWfJ1FMq0u0FwyOSdrI1uNyMnd7/KeDb0TnLthb0IGQqBtLnCyiAk0G6WqTa6h8EiuDPvNG3lpc+rZ+AnmI9JLR0JlPUXLBzoFjGvxBrzWlW5ct53VU8wIYMlNjEzZ2ZyQgSasfylaXk5vudha4BkpNIxayvzYSJO586uVeg/iGWlOoMf4esFg9D0DlZb0x8Fa/8KwKRK7IuHJDCKjDNhw7uN3EcesbwL70m6xAiJMKMoNoE4ZGAeWx7ApZyWGUrZdnH7inCa2Gnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL0PR11MB3345.namprd11.prod.outlook.com (2603:10b6:208:6f::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Sat, 25 Jun 2022 08:29:54 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%8]) with mapi id 15.20.5373.017; Sat, 25 Jun 2022
 08:29:54 +0000
Message-ID: <3d9b45c0-b415-21d9-6af5-68fa1001ed17@intel.com>
Date: Sat, 25 Jun 2022 10:29:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
 <ac2b7d8b-a5be-4fac-169c-eaca185c9746@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ac2b7d8b-a5be-4fac-169c-eaca185c9746@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0490.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::16) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 397c183d-e1a8-4a73-16ba-08da5684e11e
X-MS-TrafficTypeDiagnostic: BL0PR11MB3345:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HHRQbeYohBs9OmFvj0Py6yFQlz785OhvGqLadHtMsJ2Pf0DzH39MKxOJN35kkC/aAEicDLPP6035/PcEbnoBSx1QnsJu3BqBfMQm0RPV6SDy83+e9AxFOocM0OU7gtTMdd/H0p0kVVrkLM7yVeNDl9eeiHIjE4HiTtCKMOJO8FS8CQ+fV5YZ7DcVEY22KYlTsf1qs4l1m0lJF5Topej/UjB9DnvXsxxkCAHncPOxUaAEFTKjh4ckq+P86yVBMgTH6J0vqYgA8Aqs2AvGhANV3AxfDupbOrov+wZdatZo/i7lmR4QBzqhohRmH4ymI8lWg4zJewnuQyT7EO6hRi0ro7gFH9JOLoQTDX28HH5S6U3XhRESeOoMZiCEU/XYWH8WiLCBknuRxNauSzEGcFhdLi+FsOUBYcanq5R7feSLXWfKOWmn7dio2e734dxt16Bg9yLxjdoUZs/kYKuviyUvdj5rK+eXeIDDGjSUnqmvXIOCke7ZGKpjXrhqMlrxUdeZhVCJk28YilUPuMO4a0ktzYaXnM6CHczUGU8pCUKLRQ1EeqZDNBgJXAJDN287Zjn+tO5XylLjf5lzhxqgdg3DLOMyqSl6xZbrQ1rgj0G590egvxd+i6LOmkDepqBFt2WBRQc1S6Q2bK/g4FRa8NmJb1U/LhXChG7n2uepxklHLEx6HeEKE2cJFrXmCga66LuvIRYilkOrjWSvB8K08/BIRt6/rhuM9FqegRgy+wfDiO98vimaYIdUxZZhB7WFOsMh9cKAq4/KlSHh03DUg9VjCUnaai+QlzOrN7U7py/qjZwdBbaxWhbLBCQSHdWfofza
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(366004)(376002)(346002)(136003)(31696002)(6512007)(36756003)(66556008)(26005)(41300700001)(66476007)(186003)(66946007)(53546011)(2616005)(6506007)(316002)(38100700002)(82960400001)(86362001)(31686004)(478600001)(44832011)(2906002)(83380400001)(8936002)(6666004)(6486002)(5660300002)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFBSSllkaG5Oc3RkY2oxVy9MYjRnbWYwbktoWGNLRWFiWnFxWlY3M1pRNHNh?=
 =?utf-8?B?YndRL09JMlVIOW50Uk5XUFArZVkrbWZ0TjJQSXJBbVI1WkJFODNmNEtUODhq?=
 =?utf-8?B?cWZubWsrblc3SVlXbkxOcTFuMXFTRnFDQ3VNSHJ3ZVhzbVdJS0xMdC9Ia3Ji?=
 =?utf-8?B?WXd0ZVVqNmM1UGJkTnZqejh1NTQzY0ozS09zNjZLcEhYb3lXaVg3UDJZVkJy?=
 =?utf-8?B?OC9DeWhtdlVwdll2d1dNaFd3Q0UvZVRHdjQyQk5sdWxrVGFWRk5xV0RBZHMx?=
 =?utf-8?B?UlJSTlFvVlV4Ukk4U3hlWnJJck84eFJjb1F1bFc0YWF3YXRyZkVsNjl5dmlo?=
 =?utf-8?B?QWtPbm4yVGNFeGdpTEsrNkI1SUlkdE1GRDRKSG5zaGxBa0JVTUdrSnVzeVBO?=
 =?utf-8?B?Zi95SnZHdHRhUTVCeDR3WGxwQytKTGdrZVF5VDRYWFZKZjZaOFV5WlFOWVpR?=
 =?utf-8?B?RHQ3d1dwQVdLazB5SGFwVTh0dFhpRkUrdWxqNExYYlZyd0dCYWdNb0lsRVVS?=
 =?utf-8?B?Z2l3K2RPVlVENmN0dVoxdXFOUDB5NTVxQXNia0tid3pGNlFWWFNUYzNGMEFO?=
 =?utf-8?B?TE9aQXVqNVgzLzAvS2thNHIvbUttbm1GdFJubGtRTEVXbzkwMGNtUmpRZU1P?=
 =?utf-8?B?cEkvWWVrVHN2RnAxUzdSMEdPWUhlVStqTUF1VG9UTHlNRFdFdWVUYTl3OFhl?=
 =?utf-8?B?bjJ6ZkpkY09USEwxWHRFaWtUR3hxcC9DVFBpcUpxUWJabEdva0hUekdFdDdH?=
 =?utf-8?B?OWt0YklidWxQWW95N0VuNVFvbzZPamJST2hlb296cmlGQ2JUQWtSSTlQMUQx?=
 =?utf-8?B?MGNWcW5hcXhrbTV3Q3pKZWh3WjBtUVhTZy9PK1VxdGU3VENlL3YxQWVuTFRW?=
 =?utf-8?B?Q25YUTdjb2FSeHZUSnZqWm5aeVozSWxiOXBCWEY4SFh6ZWJadC9BSE42SHdZ?=
 =?utf-8?B?bmM0NzRhaUdwVHJNY204a3dJMnpiL2RyUmpRWmVzOGFsdC9ad0pldDRCSmJy?=
 =?utf-8?B?U1pzS3J4OWxOOGcxNUN0cDZqSUUwdmMxT3J5NzkvOHNqc1U5NXFTaEYrOVNk?=
 =?utf-8?B?RUwwUUF6UkladENrY1Zia01EaDVXanRIcXdUTmhHeUVBZkZsU01QZndzUGVS?=
 =?utf-8?B?SXNqU0dNU3lFbEZZVGF0eEdvYWZiN0ZWaW9NUXlFZTFBOGlCZ0ZGU3FrNVZa?=
 =?utf-8?B?aHZaZnRtYW1uOE5yZDFpODN1aW1SMkcyK2lYK0s0Z1FIMmJGejB3WkRCS2pI?=
 =?utf-8?B?ZElZODcvWkJZYlRTcVNjMFBZL2RNV3h3Rjl1RFJqeDJRbGNYdlo4QWs4L0R1?=
 =?utf-8?B?MmkyNjc4THlhd25HZDNpYURTL1BhQmN2dmFuMzJZdGxzOHVUUVZYcUgvTDRD?=
 =?utf-8?B?U2ZUY0g2cHhHV0pNV3dCVXNhZkUyYytPb29KazVMMythemMvek9NbThrR2lN?=
 =?utf-8?B?MzE3SnpzMC9QUWtkdWVoSFVzZ2NHS2hGK2JWQW5xaHk4MVBxd2pldkkrL2gz?=
 =?utf-8?B?UFVJNk8ydmN6alVoYytPUkJFUzZMclZkcS9Jckx6SHVaM0hJWWlpenlyVm5r?=
 =?utf-8?B?MmR0aHNjVWRjVHpOek05cHJmZGl4L3NQSDhXdjZJQUIzOFlqaXE1NGZaclJv?=
 =?utf-8?B?K2sxZEF1TEFLSm1Mb1BreU9BSzNRT1Q5T2JEOEJ6Z0RlUHhMTFFRNy9IR2Z2?=
 =?utf-8?B?NWJNV3RSNm5URERMbStDZFFSRGRlRkZMMysyRnI2QnI4SjZMNS96WUE4UFFj?=
 =?utf-8?B?UG5kcUE4ZkNoMmRFR1pYbFNIMlFTR2tJdWtCQWRZRjg5dlZRTUhIQmEvYUh6?=
 =?utf-8?B?QXNjak1XT0h3N0JKOGRiNTJVdWkrVUxsL2c0Y2FKZHNiSTZmUVJGazZ3aldE?=
 =?utf-8?B?SkUyNFJuUnZzWFlyN2tnZ0M3ZWdKeEd6MlZjOVpkMTgzempjSnpOcFphOUlp?=
 =?utf-8?B?ZFdwdCtUTWlhcndzUGRmVHdtK25wY0htNWhSTS9OLzZIdWVrTVVmUVRrN1kw?=
 =?utf-8?B?UUkrY1ZQeVRRWDZ3enM2Y2pseEJ5MWR5T01FUHFkclZLcVRySG1RT3RRdS9J?=
 =?utf-8?B?Q1IxZ1ZXSWxJOHlHcDNwQmIvSnVQblB6czdRSW53TTV2OXh3UU5yV2NhNFg3?=
 =?utf-8?B?YkJsNHljcEZib1VURWhRMkc0U2Y1RENzYWlvQWJaU3ppSHFweUFNTEsvZzYz?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 397c183d-e1a8-4a73-16ba-08da5684e11e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2022 08:29:54.0751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0Iss2ZUfAGYBmMX6QO0yozs9VVO7+/M9r13frsG4LO2KNyy9mX0ti0WNP+0H0ciuZyVdcnMElv//YanQBAipifDOW20SoW8q1s4KuAnmyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3345
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2022-06-24 3:52 PM, Pierre-Louis Bossart wrote:
> On 6/24/22 08:43, Cezary Rojewski wrote:
>> Address the warning: "Codec: dpcm_be_connect: FE is nonatomic but BE is
>> not, forcing BE as nonatomic" by marking BE DAI as nonatomic. Aligns
>> with what is already done for FE DAIs.
>>
>> This patchset iterates the change over all HSW and BDW related machine
>> board drivers.
> 
> I don't think this is necessary, I was planning to demote this warning
> to a simple dev_dbg or possibly remove this message entirely.
> 
> The BE DAIs can perfectly be declared as non-atomic in all Intel machine
> drivers, except for SoundWire where there's a known delay during the
> .trigger.


Hmm.. that's a good feedback. Isn't ASoC's FE<->BE treated as a single 
PCM substream in sound/core/pcm_native.c though? If so, does it even 
make sense for card's BE DAI to be atomic, if it's FE counterpart is 
nonatomic already? Especially if it is specifying platform and cpu_dai 
that matches Intel's components which we know communicate using IPCs.

Warning is one thing, but will you be also getting rid of the 
if-statement in soc-pcm.c that actually forces nonatomic=1 on BE when FE 
is already declared as such? If the if-statement stays, I believe the 
declaring BE DAIs 'correctly' in the way to go.


Regards,
Czarek
