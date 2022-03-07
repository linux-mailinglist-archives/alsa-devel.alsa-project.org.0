Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEEA4D04CB
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 18:00:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AAFC1728;
	Mon,  7 Mar 2022 17:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AAFC1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646672416;
	bh=Pm0H3CRI0rU87Di08zueHZCaNaXZ8GVNiJCEjIwIQbs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBOh7YlsrAaD5SfnPW7WJ2ese8GcZD6YfOojHqQChuAtwnqAov2Z5wgPeVHOPakCJ
	 D3U9Bd1GbI5Ccqq3QI+/Al1R9lFOyWFg8l5lBghTHU7tSVuN0k8jUVqfULlXiHt+el
	 2SZiQzDP0UvZdCVy3A7KrFKPw3bqanAjnMooJ18M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0026F800E9;
	Mon,  7 Mar 2022 17:59:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1316F8013F; Mon,  7 Mar 2022 17:59:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13CFEF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 17:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13CFEF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g+t4GAEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646672345; x=1678208345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pm0H3CRI0rU87Di08zueHZCaNaXZ8GVNiJCEjIwIQbs=;
 b=g+t4GAEKQyUcfkEudk29MKUbe1043E0FfnoAQDWStPP2t8DBga774LDr
 aEFgZ5kbGS+0Vzmx/lClhqCABdkUocieWuHGcVbb7jymfpKu0Z7OQMPUp
 Xh+BpGuZr1KwtbGD1/cCE/yFpla3a05BPGag6m0e432a9gKqjP3+g1Coa
 6pUwIg2yE6Cjyylk3+0glwbPFnIOzh0I1FNQquq8zihGkK7Qb+ebSDab7
 lPbIGgMu+CHzp76TwI58m7ZFpzA7IKgF5M6w7XIy0v9ZU1bZ6nWb17omM
 R/4L/q1XHSQcHdDKvQe9UzO51kX9rraLROxwxD8YsJlY97WAeO2D8a2TF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="340878196"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="340878196"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="546953372"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 07 Mar 2022 08:58:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 08:58:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 08:58:58 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 08:58:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7qaJv/4W0KYvIDH+ZbevoSW6UphafMvOwWkipbqGYed2exla2nXarJImo6IdojDRVfDLLXB223XTAA7If2GgJ4FyQIuyvLFUwTgU/rgHX1q09SnCWgJrfR3d3AYCCuAVH7igEpiFxWfjLDoVByqzgsW48yVA7dLWBvogriLxh23/8qgN9WrbcVPkjcYCUp6Rmjs4cL3+dky8ABRl5LbwYfNR+rbqsk3SdyzkItoCUduxhUZX2wRS3qEIe7gB4bv44vZSHJt+K5/mDxpwtFWUOSeBtoCmUc7HOI4997nn/P+Wv47DFjqfsVJLokdV0J/hACsyWS5GqBr3pD6PTAoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSbGXlZQszpaVXq4d9xD3vg0TCYozxXnFcV3o2ro/+s=;
 b=POK80ruWkcJ9qnSdf8JFTwxOFDufHb8p7UwyQyik9szY+IX+2q7pTNwOG5T6xToyq2W7gXerah/5D0/q23P1kJcqpy+WAqGUIoRQhUpDwQ5J2UrqqXOLQmULi2nyqR+q2XQBSk3XQjjL0Lh3tNGaJaq9qB1tDSMh8JCqN3Gfjrkh9fXlgK7kVgpmK4cKtONzP8khrXRlGbxZ2CBt8KCulerum97g9vrF8XZKu4rJAzdj9gBCAFkzLs5kkZORxcL8OE3W9w/Gxxt4tYNgncL2S5jWBI/LdBt3aCFpeyiGrbAr+oNlT/5OsRr2NnffQ0dtl0arvSJvZjpglmtTHSjvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM5PR11MB1786.namprd11.prod.outlook.com
 (2603:10b6:3:113::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:58:55 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 16:58:55 +0000
Message-ID: <818cb84e-44c2-ab4f-03b5-5b72b598c6e6@intel.com>
Date: Mon, 7 Mar 2022 17:58:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v3 07/17] ASoC: Intel: avs: Add module management requests
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-8-cezary.rojewski@intel.com>
 <0e7e51e94157c6ca43957b27a13fd4cf058bfc33.camel@linux.intel.com>
 <e463df51-a0a5-b863-0cd6-80b1d60dc09b@intel.com>
 <886dacf8fdffb08af26cea6e754d09d4ed7811ea.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <886dacf8fdffb08af26cea6e754d09d4ed7811ea.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0015.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::20) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5812186c-271d-4812-da12-08da005bc39b
X-MS-TrafficTypeDiagnostic: DM5PR11MB1786:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB17860F51F0EE6DD99CE4AC92E3089@DM5PR11MB1786.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vxBA9XnUQj3kZCzIjv9knn1EGWlxZTYwJr0T2IAQiiWdPbo4XkWLqB0d2ktqOsMOcc/kM/NZrXCsOzqn+vWBQ1fbIUJi17xuuI8blCt6i5EdxFC/nhlcAoXxEV9BlspDJOnjw0shdglSg8Yxwc4+ObUujtZPoy9o4KM4MY02HsTqTxeP8kwQiiExWQPt7ULwRlG4zOYTOuphkS+dqD5QkzrqkRu+tDVTdA0r/pXqQogUI+w4yoaBK5v9osgiDzSsKxEn4f+8c0MESoHaOSNk5iIFWBkRrfnEczvIOF55kYnkhvKt4DlZkfAR1opYwjt6cFnC+vHKF/FzND24YSWazKDsC5qBBOBnuYfIu1FtgczUR1YY2ZMWdL09keiN+7y/sNAZdpAqfwX7cxc04gwjJMz5RPrASYm1Gf0cPKUGKQYYvPrDZkz9UjOaYvx2P0OmL33RCf0rQErJKbafyxBV3V6loquwHSrmaaMCAZ6rPv1K8ZZZ7zSrIaYqXcF2R6TyXD+xpd/x2fpKK5XYifj2rPVeKpWnI/e+NeLGOTMnHV0rZ/EvhsiZUBv6QLwGMZltD6pL3HeDwW/QFmr5pTJKWsM2V8yRZS5Uz05NLREEE4j4x/w4eHakHNTvJu9kh0aShNUa5pg1JJa+sCp33krfy4oYU9Cc7nVXE4ZzPxXhSxGgrFmg/2lYUm2/tVgZaZFoFA5nxSaNw2PU4bLX0+FsVkhmuxIbaPbbCF7V8EMXjF7MJr5hdhSfxYjlYXwW6eYk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(86362001)(31696002)(8936002)(36756003)(6506007)(5660300002)(2616005)(6486002)(6512007)(6666004)(53546011)(316002)(508600001)(66946007)(66556008)(66476007)(8676002)(4326008)(186003)(26005)(83380400001)(44832011)(7416002)(38100700002)(82960400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUZ3dGduWWZXZjZ4dVEyaVZuL1FzcjdKWWxibGRCMUMxUm05VHlXRi9zUUs0?=
 =?utf-8?B?WkpJaVo3dzBJMUFTMXU5RzlrbDgwMWFGUS90eGF4N3M5TzNBeUNzVFMyVkVu?=
 =?utf-8?B?K3R5ZCtadXp1UjMxNzY0b1BWbWJPWm9CR1lJa0RnSHAyZTdtdUc5NzQ4QnlG?=
 =?utf-8?B?NlJNcW9RUUhSM0owOWZab29PakxocHpLNUlyZHByZ2p5YjJyMmtPZEY3Znk5?=
 =?utf-8?B?UUs4TmR4R1liZ08rSUJNcFVadEZZeTRoamVQTVhZUEp5ZVBwL2RtS3g5cldR?=
 =?utf-8?B?NnBndnJDeGZmZ1pEdlhCYlVwdkFmTjUxSHYwdnQ4SGJTQ1FsK2FndGR6SXJr?=
 =?utf-8?B?NlNraHhQQTcrcVhRQ0FxaUZiOXVwU216N3ZPN2RRNXI5UW5BNmxldUJLVFgx?=
 =?utf-8?B?eG9ablVvZS9kNmZ2aEMyTS9ZV2RDenZXNG0xRnZ3K1RTNkVTSXAyY2F2VmM5?=
 =?utf-8?B?Z0IxOWJ1UkNLUHFCSC9sS05qSi9YMllpaW5Xd2NDeUVMWUhXWXdCdVNPdE0z?=
 =?utf-8?B?TDI2ZjlsaW4rZDR0UWVWajRzZkNXbjJYZGVaNTVJdmtYaThKeWJLM2ZISitC?=
 =?utf-8?B?dDgyTmtmeUZxTmhTSm1yTVZYN3J2TG80Rm1vVnUxSnJ5NnplRldKVVdDZkhq?=
 =?utf-8?B?Rm9Fczl5VXF4YVZrNE16VWRxSm1sNFJOTGJwN2V5UFNhakRsM1BoM3psbEdD?=
 =?utf-8?B?NjM0QnlSMWJua3ZYek9odWhWQmhjZHVNOGFkQkFjWWpaMm4vSTZZVDM5TDhX?=
 =?utf-8?B?WmViMlVySkhNdXJsTlo3bTkzdXl6SnhZYzVjdWlTZzlkZEtLVklzVlE4eDRI?=
 =?utf-8?B?dUFZM1ZWZ0JNek9ONTBaajZ2ejVRWFpkb0ZBY1pzVUp5WGowakJPMVFzM1Rh?=
 =?utf-8?B?Mm1LS1BZQ3BYR3U4UVVjaVNpeTJxNHlHWldWVmdqOER3MFdJNURFM21tMnZl?=
 =?utf-8?B?V0ltZGNMZHlaTDhLYjJrL2hWNVdIakw4T2JRQkJzc1hSenVhdThoUmxlRjJw?=
 =?utf-8?B?MWRDMFJzY1VXeU8yTGQ1UEdHWlRXOWRqcjB1aitaSGhsWkNJeDU1WXdFZVhQ?=
 =?utf-8?B?V093amhFUGh4c3c1YnREQWNwV0pIQzhLVWlUS0V5NmNxd05VNzJHSFFzcXRD?=
 =?utf-8?B?S0NqU1JKdzBLMmxubmRVSHQzM1NGL2R3VnNwYy8zck9YY2xVeEhkVVNDOVVP?=
 =?utf-8?B?RjYzSVY1a2lxRzhHVVJnRk8yenQyRHE2VkZ0Wjh2YU1QNnM4NU0vVHQvVlEr?=
 =?utf-8?B?dUt6QkJmR0wySjk5OC8rMFJvZ0dLemo2VnFVOS9xK0J5N1g2ZnlrU2F1NW45?=
 =?utf-8?B?SlZkT2dQeWtpd3dCZnZQbG85L0JrZ2JySnYxTXJnRG9oeDdIS3RzeFJPTHZj?=
 =?utf-8?B?M1ZOanJ3YXc0TnVqaWZHNVNBVWZMeVdtdkVUVFNpN0RLUlg5a1VJWko4ejRP?=
 =?utf-8?B?ajJzdCtmTGxQUTZ0amtnNVkzWkNoTUxHVmVKQ0tlbEV2ZWNQTWwvcG0wS0NG?=
 =?utf-8?B?VWkxR3pVcWs0QjM0NVFoV0RuMzJFMFg1Q2pDTXBpcGs0clAyaEN1M2NzZFhn?=
 =?utf-8?B?L3Nva0kxY04yUFBIT1VsQ3ZSUnpTbCsybExqbzZaVGJYVmtmZnNVV3JTYW9K?=
 =?utf-8?B?b3pZSnREUWI5S0xQMnFZd0RXNmdZdXNML01JVHFBN2RNZ0dvNnZWa2p3Mnpn?=
 =?utf-8?B?ck9hem1MZE1WT0h6bTljZlZHdjRERkRoZERPeWpyUzBWTlQrL0Rsc2oybzFl?=
 =?utf-8?B?Qmx2Q3F1OENRUVVMMVBrRktLdkljR0NKc2FrSG5uL3V1OHpKaWNFMmZKQlov?=
 =?utf-8?B?TDJwL2xYZHRYRDRQNVdZUHhiZm5VQi9ITU4vM2RhZlcwVytDcnIrRDJ5UjFp?=
 =?utf-8?B?WnFxcTJRdjhQb3JOb0tCOTl0T0lWQjdYY0ZEU1VhNXR2a1g4cGY2Rlc1V1Bt?=
 =?utf-8?B?OEp0VjBQcHJOQWlyaHk5M1oxQ3ZhTTNKTVgwU2VkSnhtV3VYQjFEb1czamht?=
 =?utf-8?B?Tk05amkraUpub045QkdaVjN5QmZTdjF0Szg2L2YxamZadVVRTGo0R3RxZ25Q?=
 =?utf-8?B?VEFVNUlzdkprZnByK2ViWm1MOXVoYmlSMGxNWndVeTVqdEt6QlJYV05YU1N3?=
 =?utf-8?B?dUtRbHkzYzBWaVcwYkE5N08yWm12ajV4TWozT2w3aVYxTVhLNHFPZ1RQZmFP?=
 =?utf-8?B?RTZJTFlKbjdTdW1RS0RhVThwVjY2cE9ib25MZk45MWNIMW1tN0NzK3JLbDZy?=
 =?utf-8?Q?YVbXbJLND5l0lisBMWT5bxL0eqDaMeLHKEAoJShufY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5812186c-271d-4812-da12-08da005bc39b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:58:55.3422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+Ycr1TJ2XexmYoqd/mJ2sEzcOtcGVyuwLwEXZZv2Nr2u6knRrYAVmIQ7H7hY1myerum0NAJWELleNKamaGrMefAoI31kGb/Ddo7T5yA/LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1786
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-03-07 5:39 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 18:21 +0100, Cezary Rojewski wrote:
>>> Are there any rules for unbinding? For example if you have 2
>>> modules
>>> connected to a mixer? Can you unbind the module belonging to the
>>> host
>>> pipeline that is getting stopped while the mixer is still active?
>>
>>
>>
>>
>> Here we have just a delegate. All the rules are defined and enforced
>> by
>>
>> the firmware.
> I'm not following this, Czarek. If there are rules defined by the FW,
> the driver has to follow it isnt it? What I am asking is how and where
> do you enforce this in the AVS driver?


How the stream looks is defined by the topology. Code that translates 
such patterns into runtime being is not part of this patchset. It's part 
of avs_path and its collaterals instead.

>>>>
>>> How come you dont have a loop here? What if the rec'd data size if
>>> larger than the max size of IP payload?
>>
>>
>>
>>
>> That's not how LARGE_CONFIG_GET message works. There is no looping
>>
>> involved or expected by the firmware and so we don't have it here.
> 
> So, are you saying that when retrieving data from the FW, the size of
> the retrieved data can never exceed max IPC payload size?


Precisely.

Regards,
Czarek
