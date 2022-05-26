Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35169534D24
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 12:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBC2616A5;
	Thu, 26 May 2022 12:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBC2616A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653560125;
	bh=A4STUgBdFR0rHAv/NFdRPireNcjO3JdLN1I30G/ZGL0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=anXuv9r4Y7ef3Yua4/nWh/fnQNlOnS+BMZWwVYWXepwrYY+1md1JrrpTk87jy3leK
	 XaINcmBb2vsSkM9TsHfMABo1ZsHqkqqX+JpyXYeP+stJGNnJRjU7UM6uELWxQoLO8j
	 x4TjY1h1uBP+XOYBt2nIfjmotXIlP8rX3ihyzYR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24ED3F80100;
	Thu, 26 May 2022 12:14:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82870F80171; Thu, 26 May 2022 12:14:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E45FF8007E
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 12:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E45FF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ml5Fylli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653560064; x=1685096064;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A4STUgBdFR0rHAv/NFdRPireNcjO3JdLN1I30G/ZGL0=;
 b=Ml5FyllijZXLPJ7P98AcwgTjDhjsopjYzxPaQoBHBVGe8L59W0iSjt6O
 W9e8K08ar22Nl314q1YyMWj13EWbd3DjqjWxOp5FV+9wOD4rDPgOH12dm
 nrJsMZjCt1khxm1uDyrnMgVGH57cy3WPOex82eTmdK/NiT7RhHKQ5E4Aw
 KBFE+Y1CkTMjffFhibxG8+kRqWXmU0zjIUE9mhf5tq0rBv5W3Colw7qvW
 bKWpu3G8zkDJ9klLcNRIUOKSPKpLbrWzfpCj5iy98TIsmCjtuk0QCf1Yq
 xXvYGBr/Grn7Rp45Jbj8MDCBg4CZvI8F0rjrqNVR4zN9Jg8JAud+arYka Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="253982527"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="253982527"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 03:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="573806670"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 26 May 2022 03:14:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 26 May 2022 03:14:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 26 May 2022 03:14:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 26 May 2022 03:14:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 26 May 2022 03:14:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIWwyIw+KXbe6vZShssAPPfRZARZn0K352zmjhwImmrLi6MASnl3UP71TKjgA2aaX2JLOk6PWib8K5pG7+D8bd5CYQqVEG6KwhcUhwWFXZj+0xl3zJKy8YWkpKK7RFPJD7LY3oQ0XtnyRDgWjVe6SAnnU0eZHbQwJJACCJ9cVv47nnABXGt3O+HXqwIYd4iD0vI6Z3PbILTvWQC5gxWSOqzL1bq+PZbqIFQwYqOrCfZt7krmHAP5m0CKk1gxjPI1O2z1FXuh/+EFJPtei9OFv21N8teMcuobsEXypceZBMiyLoD36vZMfKVw9YYR1JkVyhAvSVCi9AbpYBdSWLhMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJHHn332C7Htye+Uim9Z5qv/CH5Ui849gtX+kkZW3JU=;
 b=TSG2E5ZcuHZW7Hk2mB5gSTtfjKH0Bh2sFjH9nQ3vGpnzGB5GCUW0ntfCaDvRbCE3rrzXzWn/upysJ1x3XbI7hqhxeEXgXNi+B5Z8u2c8wyjDD6S1c74SGl733PiBxvafcaKOFUtqWxPGVyqfYmBd+DBp6Fh/tJmnazwrcA+lpyBLXU+DUT6ipp4pkZpM0OAzYDPRL9DW+n5T45+BnNSCQnuvPRUv2Ou2D+Domc3v5VOD7OzXRHQELi40ME06926zkNuy/cUoJxGJ2K82Mro5YLLYwjPVOhfjSdvjpQxyejo9Xyto0FOpmPiELLJIhTyW91kvW2jWgI9wfrETXaqmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY4PR1101MB2088.namprd11.prod.outlook.com (2603:10b6:910:17::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Thu, 26 May
 2022 10:14:16 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 10:14:16 +0000
Message-ID: <8d2bba16-8b07-45ac-b990-714967fab9aa@intel.com>
Date: Thu, 26 May 2022 12:14:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/14] ASoC: Intel: avs: Machine boards and HDA codec
 support
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220511162403.3987658-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220511162403.3987658-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0137.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::22) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66209fae-9694-4a51-a003-08da3f007d67
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2088:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1101MB20882B5B31E2069817A4FF26E3D99@CY4PR1101MB2088.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /sDz+Tw3VmgXM1aabwHm0vygy3RMzPTC4MA1TFZLtd08lp8Hdqv8me6jps+mDcDlfLYReKgbaoGnDqHW5pz4JW3oX/5wDfRoN6IsQQmzXRL1b4asC/wZhuxIizwNDr7n3gioDaDTN/zGY7NPFh4cXUL5V4queVFDBTFFYg0eD288l8d4sJr2na6I/u1CW2x7M8ea+ohoueaZm8TgPqL8GUKE7S+5p6zp34yvSGjRmRMqTy38vAjnk9jccJUcKIXYKmkcH1MYXAtsh6lrXmB+rKUgCTRlf6lvqsnVDp8i+e4Kmjio3v1K248EzepSF4inq4VDQXrBNK0k51LID2QKtQq5sR8ZQH6UQLMBo2wJW8pUja07Up0nBaRb/oEgd+yG1dmrSPW790k/+AfGLovm8Kik8O9/f09A+KpINfGd24sR3iMiN6D9x6gxrSlkLF8oeSMsNJ16vNiyELBxOvwTu5e3/EMU3RVk1xva/b5C6JPTqLW2sMwSAFUI79RXacoyLWHgYGx9mb2vgbbVeGsjl0mkrP5kKYjZthCv5mWOi/Ld1G3UY+Z+/Yd4NKILtScLs7M9/8GCn840zyfDhQUMKY5BEZnugXzQmJBHpoRT7rnJtiBie820jT+G8XnWw6nqb0w3k1+I2Cn4yqsmvU06TMC9xOpjMk7ExmWPlMZWyo1IPC+jwwcrlVOVDafxG5MvEdjtS6hRTMdHcDMs1B0S+ymWD/8PZAmE6i5WL4NPffGqF2S3XRmJkjqTh7U9KeJgzUOCfDmU2u1KlhNJHpvIAPVjGqOrK8H15R8lFXkNcqZ5gwJV8xvzBddzjBAWsmv2vpOlza5Bq9/HqxIZvcx+0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(4326008)(66556008)(66946007)(66476007)(31686004)(83380400001)(186003)(5660300002)(36756003)(8936002)(6486002)(6666004)(38100700002)(2616005)(86362001)(31696002)(7416002)(53546011)(2906002)(6512007)(316002)(508600001)(4744005)(44832011)(966005)(6506007)(82960400001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVVuNWcyZ3pqRmFVOHJhZi9mVkRPYTFMZUhOeFZEc1lXc1pUN1NZcm9UakRR?=
 =?utf-8?B?czRoSlNQOC90RHFRT3lHVHp6eHZZdm0rdm1UdVN6RzRIZVE2MlJZU0g3M3Zp?=
 =?utf-8?B?azZjK3BCL2NUTEdOdWtiOGJCKzdPYnFmUzFMMlMyZURKMDB3ZVRCY29sQmxx?=
 =?utf-8?B?dHpWcXRETCtEeEtYTTNaSEFvMENUaXg4bWZHUEVNVHNZRkNib3VCS3J3MGhl?=
 =?utf-8?B?QitnQ2JNaUlrQkhWNDFUcTdnZVJINHYwVUlNb2VLL1V2TUNDRytGZGlodGpp?=
 =?utf-8?B?M3JBRVFsOVVhQzhiZE9qTk16aGJ4T3lVUWE1SkZBcXdyTG1GZWhObUdqeU0y?=
 =?utf-8?B?UEdzT1h6UkYvZ0V5clJkNlRaSnNxTVo5T1BxdG5ka3VCZk8raEFHQlQ3Wmkw?=
 =?utf-8?B?U1JpWitSLzVwS01QNktyUEoyazFQSjFsM1R2c1pZcnNVczZxUkZmdWsyeVlN?=
 =?utf-8?B?Nk1GWWorZzgyZWpJWXdaaFMzd0F3UXlPME44L3JRYkJZMzdiMlBEZzV1N0xn?=
 =?utf-8?B?ODFlS0ZOQ1JwWEhnaVdFMnY4b1pQRWgwc2tUZ0tDQmRJUHFvWUR6dUxUUlFr?=
 =?utf-8?B?MkhOYzhNRm9HYVNaWklVYmZSNGNlY1l6WjZPcW1xbXEzYUFVU2ZpYzNuSHNz?=
 =?utf-8?B?NzBnY0tRam5hd21kZ1UyaXZZVEdTZGxnazluaTR5bWZQOTNvU2pTT0dSRnU4?=
 =?utf-8?B?MUtDQTZtbG5GSTlkUkVIWEVDRnNJeGhjSDJTNHBUdkdyMGFhcGh6NElQUmtB?=
 =?utf-8?B?TkR2cWcrbnI1bEhUL0pNUSs0TmlsZmR3ODh2TVBoZFo5eEhzSUFFSmN4dG9H?=
 =?utf-8?B?Zm9hZWlvUWRPU1ZEV0VOWDlaZHZHODlBNllycWNhMjBXRDRSL1RjUDBseEdE?=
 =?utf-8?B?MjgvSFVTZ1g4RDY1ZW5PMzdvSHJXcHZCc0NDcXdYRklsRU91VDlzYnRoODVP?=
 =?utf-8?B?M240akgxQTNmVGpwa1QxeWdkSTUvZXlJVHpJMzltOWU2MnJhOGl5THQxTW0z?=
 =?utf-8?B?MTBTWVBVNDlaakxoWVVlWldhN3JnZVlBOUFvNWdwU01rSlJLZ1dYK0xoZkdh?=
 =?utf-8?B?VHcxZ3ptOEpHUXlGc21UdE51V2RqdlJWZFdQN2JqaGYwQnNHcEY0QS9SUzZ0?=
 =?utf-8?B?TlczdW1xdlBZMGIvclVCM05maTFjR0tBUURqazVJWFdnYlBkaDZ3dlhBdzhW?=
 =?utf-8?B?K1JLOHNEYjY0VEd5UEFZUkhsVWJvYzUzQ3FoSDhKRWZ4eEtiY0pLQmUwVjJt?=
 =?utf-8?B?N0hmZ3R0ODY4Ylk2TWg4b2U0eXFndVo5RG1SbW5NNGhuQys5VGt5NnRVT2dn?=
 =?utf-8?B?VXV6RGJ0REgrOUVIb1ZtVEJjOUlWSEl0UEQ0REhiVEdUdk5OWHlLdjh2SWZl?=
 =?utf-8?B?ME10d3dOMG04RWVvdHF6akxGem9hc2lYakJxdHY4WTBCMU5SSVZVVnd5MllQ?=
 =?utf-8?B?UHRIWGNyMzhkMTlJNXk3b1o4TFBydHY1Y09ySEh1UGF5M3V4SHVVakRISm1L?=
 =?utf-8?B?UmVCalJaTlM1dWVFVytka2w3NzU4R3pCd3FvNHpWVHdSL01VRzlnWHMvdEpH?=
 =?utf-8?B?SVE5OWVIU2NZR0M0blJHWXdpSXNhOTJ2WUdhQnpzMzRHbkl6amFPQzhMOTJJ?=
 =?utf-8?B?elV6ZFJISy9FZ1dDblFKb1lPb0hkRU15dUxRTkpPOFNrNDIwRmduRGVHNUpF?=
 =?utf-8?B?VldtVU5ibFhmNU1WSi9OV0NZVXllNUxpb1E2STJDN21UbEpzVnU2SHVjYk9u?=
 =?utf-8?B?WUNYK1dRMThSNy9NV1FscWRWRHFFNXV1M0dmeERKeG16NUU5bk1mU284T051?=
 =?utf-8?B?WlhFejVoK29SYXdMcmx0TTdTZVhRMi9PcWlNYnVnVWRuMkFhZkk4QzNRcWFD?=
 =?utf-8?B?VWZFK205MVFDdzNwMVpZTU1DYi9WcXF4MnVROXNreDYwWVlDTnRnMFpWTmw0?=
 =?utf-8?B?L3hwN0lMU1hsNFI1ZFNabHlxb2xnd045bERYUkh1amlTWHZxQ0NReVZaTjRP?=
 =?utf-8?B?MnZjUS9DTDlHYnFVckRVbzNvbitkV1VPYzM5YTd3cmd6OWVWalp3aU94OWVO?=
 =?utf-8?B?Zng0Unl2MG13SlJvYkZZUWM4SUQ1aDF5eU9JS3JNdDVaWnhCY0daZzFaV3Jj?=
 =?utf-8?B?dEZJVkFyMXExbjYxUU12elQ3dXdMZHdmeFErVEFZZVZKbWZTOFBMOHZBamJO?=
 =?utf-8?B?SFU2NU9yV05TUzJjR0hGL2VNaEdRRmNGVW9TK3hjQ0N2ajU4NVZId0xwN2Nh?=
 =?utf-8?B?YlZJOCtoc0pUSUJKcnFDUkYrem9qZnMySG9WT045Q0NES2Y0Mkw2djlvOUdV?=
 =?utf-8?B?bU5lQWhpMjB6bkYrRUZDcm9pYjZ5NVhUeHZTYWZ5eVh6dld2dXBDRFZ0bUZS?=
 =?utf-8?Q?V011eOLgp+aK/NMI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66209fae-9694-4a51-a003-08da3f007d67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 10:14:16.5495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7MvToyqi4oIRtA5u1wTa4iKvmBr3NfiWc06z9w18d8lJlf8m+9Em3N63vAQoKg14kUiIMzLX3XobenUcuctonNsrjGTZRKecuOVROksNas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2088
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, kai.vehmanen@linux.intel.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-05-11 6:23 PM, Cezary Rojewski wrote:
> This series focuses on populating boards/ subdirectory with supported
> configurations by the avs-driver. Note: it is independent of recently
> provided "Driver code and PCM operations" series [1], that is, code
> found here should not collide with it.


Hello,

Friendly ping as PCM series got merged but this one looks orphaned :( 
Patches addressing fls() issues reported by bots have been sent as 
separate series [1].


[1]: 
https://lore.kernel.org/lkml/20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com/

Regards,
Czarek
