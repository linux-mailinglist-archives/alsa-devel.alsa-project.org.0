Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5CD602FFE
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 17:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD1842F28;
	Tue, 18 Oct 2022 17:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD1842F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666108092;
	bh=pJvIS1aLYBKM+xct9t5qz9m162HSR7AA0nbNqvLTBrg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HXKXeNR2+My9TJqfz/lcx3zUUvu0VrjWyHClyiRfKtX2T1u3XIC1lVTHaR4iE/XRi
	 rJbe14hOoVQreApKRcAlbym6xPe+TdSyUWfRzoXHAjz/iQ4L9+NTHVQil459t4nehg
	 RCjpeDMdqqGI8FFFvl7WuOsa4zlNR0Oxx+aIKlwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A206F804BD;
	Tue, 18 Oct 2022 17:47:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CBE9F800E5; Tue, 18 Oct 2022 17:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DFD6F800E5
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 17:47:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DFD6F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kudwN4g1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666108034; x=1697644034;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pJvIS1aLYBKM+xct9t5qz9m162HSR7AA0nbNqvLTBrg=;
 b=kudwN4g1vG17FKDQ9koMSojG+YKtOW/H1COqCYGKL51KHPpZT1gWuISB
 1aGwu+V/RkorJ3ss83hziE6L4gX57k9liXh4hslB3uUkJJ/KBMbw77JyA
 oGsWjlZcmESMBS4L/eyXAsj9XRqN9u/OReDFVCADpINcsj17C6Lwst9FV
 Bd/0feDeJ9T661fHgKAAIZ5q6bIEdVX6Yp1lXtvzOEULAeekmSpJeV1gn
 psIhlAch5HPBxFAiqU0lYNaljNeDwOuOV4Mjmch+6iACr+TBWCIr93U6t
 DroCu+9AEJG9ZeSL9RxMzdDYYQhXCfZqhKInIJgeZ+gQb1hfLZ8TDGLMw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="285867446"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="285867446"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 08:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="733695828"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="733695828"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2022 08:47:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 08:47:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 08:47:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 08:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbYzXDKwfp+v6JBeNDFiUe/Tht8Vr7TlPU4pSL6AqLVAGIoS1KsyC17Eiz7ldOxLnVweSA78BW1qq/fK5xxkbqkWOkyWDpGfTXZIgmFDrPb4gkB7tosf3+R5bNQ14pFsnXwmFU9bs3hOeDj1zI/fULfvLW4ukwXdvx3jS4x9b+HA/WbU+X9oz4FytsaSr5pLFh/i4IZHNr1+2NBylAcgE8ZGwyBKeHzaGfUtuXlkID2v7/bHtV92BarZ5VhM8h7U9dKwXTXxL5IW/wtcPoIzufrc8fxx8wsXZ0iYOlNbmHAIZYvr3rgpkonvNAkfLWqXLveIzwpqEmse96RM4c8SDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJ81VD8mPgx44C+VYuP/V91KbHfgnDabjI9rmHVofkA=;
 b=BfXoSJadXv+HgDqkyuv72bfuyTpU3paywxrG+yeAr0o1Lt6X7lNH3tq7zLapnta0YqtxgnwoTH7uneBtLUIhMT8tk09Bpm1FqHH0wvGPSt4FAXDPlmOIINoNUEaOdkpivUDgWLqWdE9I36Cme4CSP9cMY+STLNK44CoNkwdp9i9gPgV+2JSUGVNAchvScYi2xZ3SFOlXVwlLAsbB9oaGFb2jx2ZzG3br2gsQ6EnsbPlB9e92iUJguAbGLvT78WpdehSxgaFowblxmF/tLSrtTdo6aTgT69VEQf/AGt1uLalb++Xe8LxFUUnhLHQIVTIN86gSEps/T5I86E3PRUtapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.33; Tue, 18 Oct 2022 15:46:59 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Tue, 18 Oct 2022
 15:46:59 +0000
Message-ID: <06f141c4-cf3b-f227-2f94-625ffcda79f6@intel.com>
Date: Tue, 18 Oct 2022 17:46:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library
 path for IPC4
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
 <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
 <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
 <b9e10ec7-1c4f-a2bf-7471-26b92616ce14@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <b9e10ec7-1c4f-a2bf-7471-26b92616ce14@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0601.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::21) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ce13b4-ffa4-4f56-2322-08dab11ffe32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVRWqr+KDGl6Nb7S9pejEdBnLclEZsu2tObRARGJM/PolzDdpmQzZ4GFdqkzpZWmggfzwHug+vrbcnlvJnTCT2S8RKoFPld7sfKGdEzIfm6+mrlN1m1JVKtY4zRUkZpscxuUIApTunGFfGwjvbfpQP0KtLz6GHQj+dX8VjXDn76CrF7XE1ZwNat+8tKdUtS4iueSpDj+M3Ekxd0xSHrjc/AO3oKXkMGtFOao0mJkKIAY/gevrJ6dXoNC0n4YzyBvF1C6VvoNJbP5x9jiySVNmORePOpf9nFGj8Tw0IKmayyHvkJxvSLgqKkn3iLYo47nLZA5lCAHAQYjmr10htVAh9BUQ3Eryj4FEL5f+yR9PeqACpMQ2pApSIGzAYi4xo2jOzzhtISZk4oL29f3Z1FaA98J3xQYbKaLpECtSNAxefMc1N/wzgH13wF8fL/SNx/VfbgHkrBmd9vzpltY2bzRiyuvvJxNskqJeQ5AEJ/dFDOQZ4UFfuarWqlHeZAcB+xSXLKo2UCD94hL26swETKebh2f8fXKMpHGBbdZEkRzBGTAHYBuWaegaGEXOxBXRHwO18NQNBaTwpc3ErXiy7EyhP1GVZyMpvbGz5IkFvVQgJpQGKmgmNkFs/71cWI1NZwlA203LBpuAMDX/CypYdtSr8xjV023a3sgLhJLwSRGIi8d5lidRPW0fEl9UwYG2W1oVaatUKZs7QFdaE5hmlUAvnKbdld25/ayiY8KMRaM0Jic8vBWJ1FFJoYjOJ8LBuIjA5XdnZuLEphcKGOq7x6+OCMirJBCVYBAF1eNS5rJaTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199015)(83380400001)(6486002)(478600001)(66574015)(82960400001)(110136005)(38100700002)(86362001)(2616005)(26005)(8936002)(316002)(31696002)(4001150100001)(2906002)(6506007)(41300700001)(186003)(53546011)(31686004)(36756003)(6512007)(44832011)(5660300002)(6666004)(66556008)(8676002)(4326008)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eklzUDhET0I5eHJoQldoSENjSWIvWTU0eWdwMXhiUU9pWjNFUlordTA5QzJT?=
 =?utf-8?B?TFBoekdlOVgvWWFnV1pobm4zUFJhNG1LcEwvVUhMMTNSekUxNm5aYmxTV1Jn?=
 =?utf-8?B?ZTRhN051cXNkMmJIOXJHelh2TWJpazlIcjY3eFE5azJ1cTZ3MFBNN0hBV1M2?=
 =?utf-8?B?QnpkOGo2bTJJWUp1YktoOFJLZFFka2tsUWRSaG9jeXRtQ3dqaFdYVER3eWo1?=
 =?utf-8?B?cHpCM2ZBczlUK2Zia3ZINW1RZUQwOEF1OExoVmpqRW9neEN6TWZnWTJDLzlU?=
 =?utf-8?B?OW8yNThzVksvbUljQXRXZlcvOWN4VDRRS2N5SElJWTRFNFZoMkEzZU1UaCtV?=
 =?utf-8?B?WmhKdGMybWNaVWNXNHdxQnVoREhOZWpTbGtiMTZNY3lRZWZYcGhsR1hKdFVx?=
 =?utf-8?B?ejdwb1AyT0dITHVMeEw5WW1MOURWMnRzNEUwK3JKOGdqWml0QWFLWUhiSXlo?=
 =?utf-8?B?Q09odnJsKzhKOUF4RE1VL3M5emM3TDZSL2l0TW1hNTk2MTlEbjE0MWEyOERB?=
 =?utf-8?B?RWpIOFRQTUlyaEUrOUNNS3RyZ3FoNmR1LzZtaDM3cTBNemgyTGpvclYwMVEx?=
 =?utf-8?B?MDUyekNBMUNMWU5QVC9IeTNWcnNzcmdLRGxCQmZsM3ZYL2VzN2Qza2xsUjRq?=
 =?utf-8?B?SWtkNXNmeFQ0MHdzTzBwU2xDZ3FaMDVNbWtuT01GM3R3TkJDbUsxYmtWNC94?=
 =?utf-8?B?ZTF1QVNaWVlrTlU3dFBSdFBiODE5VmFPWko0a2g2K3ExMW13UXFpWUhOMkZE?=
 =?utf-8?B?SWNwYjhvcUh3WmpBTjFOSEd6T0RUZmFOSzY0N01IY3o2Wm04Tm1BVWRkYVdY?=
 =?utf-8?B?V0ZjWE5iQ1Y2WWdFeitMcVpXKzJhR0ZscHl0R1ZnQmJNVlVYM0dGbzIxVEdE?=
 =?utf-8?B?Wm9vL0ZySTN0SVpvcmtJWVhqTmIrOWgyV083M3JBV3duNk5uWVZvV2hVTW9V?=
 =?utf-8?B?NjJ2QjhlN2lHVFkvYzFGTTFKZzJnL2xWZE9mZnR3RkRHVW1iYjJqajFRN0dm?=
 =?utf-8?B?bWRuNlNhL0JtaXExYjZZYkJTY0VRelc3WWZIZ3dMUWsrMGhDVFdhNG9xWkRi?=
 =?utf-8?B?ZUJxRklOUXpUS21SRUNqZ29vQUd1TTVkZUtFc3pMOHVSYXV2UW1MQkdRYWJE?=
 =?utf-8?B?R2J1ZTR6djBBTTNWSWJhREJhVmgrQ2FKbnhhdE5LMWcraUo5Snk0dDI3dEhY?=
 =?utf-8?B?UXh1WW5kQno2SHgwL0RkUXdxK2NNSkZWRW5QYkttOWFleEs4Um51eWx2VGJV?=
 =?utf-8?B?OVIyVlJ3cnhQbTJPSjNCQVdDS3JWVDhDR0RIK0NrMmJncUZ1dXNtbVdlR3Ex?=
 =?utf-8?B?bGhpUFl4MEdWOTV6Nm0rYUlUSW15bktWRHUxNUlXa2tua0MvUmI5L2YyMmtG?=
 =?utf-8?B?UHBGZHoxdXYwZjdURWhjcjRSQVJXYUV3T1drQndkUFRwM3ZxMGRIaTNmUEpq?=
 =?utf-8?B?MGQzNHdabGt4ck5nZ1lJVVlyNmdsbEtDUDZINlI5TUkzeUJCZk9ud0FiMWtW?=
 =?utf-8?B?cXAySmRMRXNlVEh1Rng1OWJ0KzRiZThIR2greTB2UlNJQXB0WEFxUThzbXUr?=
 =?utf-8?B?UStRQ3BNNTJSYk5tbkxtczVxUStRSm1penBhOVNoenF3WFJJaDI4Q1VnUUkz?=
 =?utf-8?B?QUl2QmllNktCOGxhcTVtSHFuaCtOeXlRaG1Jc2pMbGFMQS9Ib0lsMklqM2pH?=
 =?utf-8?B?aFkvTWZLTk5wOHFDNDJiTVhqM0tudU0wdTlNc0FLVzdzM3ZQUlFhWGZyNVF5?=
 =?utf-8?B?Nm80dExtMzBySjdxVkZnWnd1VW1xNGJ1Rjg2SUJ2ZUVJV3BRQ2JzS0Ivc3Ay?=
 =?utf-8?B?NTdsVi9XVkMrNE11ZFV2eUt3ZE9idk93SkUxY0J2S0J5bTZvcm8wbHpLS1VR?=
 =?utf-8?B?N0NLYVpKSi9EUFVmbUJpOXNEMlJ4elBvZC9UMk15dStXcnIrRzNvS2JRVWdu?=
 =?utf-8?B?ekYxMHVLNVFNdUhmemg0djRzdlFqbXBaRHdKa1o3eSsrRkRuRFU2UEh5MGd0?=
 =?utf-8?B?VEtVYXVYY0MyUm5vZ3pSc0kxYTEwQ2RORHV0aW83amt4ZDJFbThSYmlHSW4r?=
 =?utf-8?B?ZWFOWVV2VmI2d1dvZmQyTEkzc1BSYXpPS2R4aGlFc24rMXNob004dGhkWElj?=
 =?utf-8?B?cGRLdHdrbVlxOFRVSHhlTDZUemtuWjBuZ1pjb04xa3czdkZlMmNVRE83QjFD?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ce13b4-ffa4-4f56-2322-08dab11ffe32
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 15:46:59.4397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+6K/AZEqKDARSlXw1SIi20Sl8kDphHqiHRmba0jMlW3kV3aYg2ThoaQFk50X592BKWz4AM5zyOJqwvxj9KEW0b+8ZI2M1mA7im9PUeQC9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
X-OriginatorOrg: intel.com
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On 2022-10-18 3:49 PM, Péter Ujfalusi wrote:
> On 18/10/2022 15:38, Amadeusz Sławiński wrote:

...

>> I'm not sure that I understand the rationale here, can't libraries be
>> kept in the same directory as FW, as far as I know they are version
>> locked to FW anyway.
> 
> During the internal review we arrived to this setup, to keep the
> libraries separate from the basefw binary.
> One of the reason is that SOF project is not likely not going to release
> external libraries, they are mostly vendor/product locked.
> To make the life easier for the vendors (and distributions, packagers)
> we concluded that it is better to keep them separate.
> 
> The option is there to specify custom path as well in case it is needed.

Thanks for detailed answer, Peter. My two cents:

I'd say the origin of the library has a saying in that. If it's 
implemented by a vendor then it's simply not our decision. If it's made 
by us (Intel), it's highly probable that there's no problem with sharing 
the library. Library alone is often not enough - to process data as 
expected on the specific hardware, additional configuration is needed. 
We share that information over SRAM between the driver and the firmware. 
And that's the key bit that should not be shared here.

As the basefw makes use of different prefixes when compared to the 
libraries, I believe it's fine to leave as is. If an error is made when 
differentiating between dsp_fw_* and dsp_lib_* then introducing avs-lib/ 
is not going to help here. It's also much less hassle with matching the 
basefw and lib versions if you have them both within single folder, 
granted both target same AudioDSP generation (SKL-based, APL-based etc.).

>> In avs driver when we decided on intel/avs/platform
>> path we planned to keep FW related libaries there...
> 
> My initial approach was this as well, but after a long debate it got
> revised.

Amadeo: have my bow..
Czarek: ..and my axe..


Regards,
Czarek
