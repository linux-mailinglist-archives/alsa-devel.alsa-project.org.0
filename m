Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 908927A6167
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 13:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1998BC0;
	Tue, 19 Sep 2023 13:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1998BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695123357;
	bh=DQZcq9CtREDYPQXCWjajJqajjPy5kyP7IXOB7ENhbGk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NuLH8tpXqgpdbA3xu54BEmVz0CJco8e5xVm+egpHhmbCAxYkjsJvgkY1Mwq2vG6Sx
	 /LhtAPR0X+5qD0AX+ZkNKQC4iaTPHl+es6WmA7uywLcH/ojmZeMz6v9KKewNNnW9PD
	 O6wXLUQSGNja9a3qLV94lCuwUBJ9YEMCmICYm3WQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A48F80564; Tue, 19 Sep 2023 13:35:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE93BF801F5;
	Tue, 19 Sep 2023 13:35:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82F28F8025A; Tue, 19 Sep 2023 13:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BF16F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 13:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BF16F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jgGKf3vl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695123293; x=1726659293;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DQZcq9CtREDYPQXCWjajJqajjPy5kyP7IXOB7ENhbGk=;
  b=jgGKf3vlSNI72xzbpnRvlHOycBZeG4v0VBq4BXVXcC9FTF4y5vmhc2iS
   Sh+8u54gJ9w7OJh2zH4nOi3QZ5cUEMVUsEb5UEIMurFPNwBrH+kJM11xw
   fHxHNgc436nyEfioz+84bvRHBMgA1N7/YtQeqkAlxwOlxDdA8yiLzokqf
   iHZCb5F0++NYSwoLKucRofxkIgZolgtnArE7YHfWdF8eXBCavmvCGu7mj
   sMFII6mQDlhVN8sNA5xVH4y1fHv6RahWWTi4GBzIuthHeE3/+0jDIJVy/
   mb3L4+55VmbXXqDpEr6K6jstl2bRX06J8g0Ynuu86tjUlVpMOVhKxsAYX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378811159"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="378811159"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 04:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="695872116"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="695872116"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 04:34:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 04:34:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 04:34:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 04:34:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+/SuHESzvOUp1YNJEJhz/mlIO8aSiTeK1DSA1Mw2WUTmrTyCJBB7a/twchNhIJESXuP6l3SojeQMO7bGOF02PwBqL5es+y9S85EZoWAIutXa0a3Zei+MMaI+Ox7D6O0qUCkPb7lVw/+89aJZvDhvJcTt7hu4iGhiF3Uk8QflSghZPecyRPXT3ooj4WfeSzQPbuserEr4ZnOfu+dpz7nvfGmAs9f2XYwXFiRRuNfbWpTJKYV4/fC9c7tvjj5PUM7IvELdCmluELpCbO3wC18hgYMw1/ic3h6NUCluM2VgSDDm/yr3dPsuWsdzg1h8EwNa9lhPm/oxIZH+Ai1H93IFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQ8PtYI/qih8ZaAIA+koSfksqMlbf7ttv/EKoiVnhME=;
 b=mrlGg1z0ft+Q3/+gYzN0m7vy3f2bN1pX44aP5mU3p2cEu+Oga3auVI5m8KKXHJR+xXMRZORJwVVfzCqnKxb5s/SAf5VdNw9bIZJAvUDN9t336Qbb4kPtfYyqdmpg44+qFv1xcZiET5yCl+s1vfPa6ai4B001cWO98tKehETxCmDeAy2qCFz2Z50yNBVSVSLG/CucwymDER0PNM3hhZWFQDqym0N3IIGHX5jZYHvH5VtmGMG5rdPM8FvlvAUJSTJP5YLFgN5Ne6/v8u1zHkUEpQmfCvdd2E9lmYHGzC9vl+nF5dZE0UCFIc1q5gJFSP1BCZ5cHeWs+KFXMTOQbD6Opg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Tue, 19 Sep 2023 11:34:40 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 11:34:40 +0000
Message-ID: <462e2121-526e-e3b5-a80a-048a2bf893d8@intel.com>
Date: Tue, 19 Sep 2023 13:34:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.de>, ALSA development
	<alsa-devel@alsa-project.org>
References: <20230912162526.7138-1-perex@perex.cz>
 <fd153436-d128-c1b9-dee0-ba03224fa013@intel.com>
 <f7dfdbd9-b8c0-fd65-1280-256e9a82fca2@perex.cz>
 <63b3eb26-3a76-5993-bd65-c3461a264b95@intel.com>
 <de412997-627d-9ad2-b9c2-cbdb78b70f5d@perex.cz>
 <89b0c3e8-2834-ba69-831b-51ea0621edb6@intel.com>
 <0e6aac35-eb1f-311d-b246-cec5aefab62c@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <0e6aac35-eb1f-311d-b246-cec5aefab62c@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::8) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1933a8-5322-4500-6343-08dbb9046909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 GLzN1bXp9LneGZvJoqqIcXnHcumipr+izy0oAaF+TCegGZjuEQsFuPNMB1x/LoIl1Qt5ciXePfASMGYrKYrMjNNIEmgIqZSBAYLe6GGMbqrcy1EweZeHn/USh2ccBKLFoAxfbklktl+W0wzUfAv2OxfAHxnqK1YTDMm4xdYkGNL2EvPvA28PfM63qiSmdmkfp6spAFepl0DUuSciajPh8XrP9zBZP2w9LKZr9jc5Mh6S0gNqIn800IFy+7+eIOGUZ7vwgq1J3QWowZ2z/KCMA5V1MAGZs4/QiqJEP+FNAgA0O24JXtV9Vgo2OfZYtMLlH3/HgOeMUYo2rzvhSXHasup6/6AJGUABq0s0io4undqhGx+vqQ7hByJoy6TQ/iFPgi8YRaSdjIzMhiw/ZtIx1sc2RmopSxM7AglCpZHAqbNBzvhwhxvPyhecCW3/0kEMn9uh+N7e8mlscu1Yo5wzbeRkJbLwcgaM7PFpeAPv81avLzic2x9p3URRMWFht9QgTnFQt0C25D/b81rH8GryiHCpCb2cfmU/cuuG7IRrkzbWTG87Xo/55yMH9uVZCYBW7DAiMmrxfx1GLFS7d5FhSME6e6RKTCnbRijJYKQyYesZTCjzQkCSUzlZ6fNhKsrwCZuQSaHTaDR34uajEOW82oAE+XVnkGA7kWTIdxnq17OIdXCXkPboROFF9XlW+6fn
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199024)(186009)(1800799009)(6512007)(966005)(4326008)(53546011)(6486002)(6506007)(26005)(2616005)(8936002)(8676002)(82960400001)(2906002)(38100700002)(36756003)(41300700001)(66476007)(86362001)(66556008)(66946007)(54906003)(6916009)(316002)(31686004)(44832011)(31696002)(6666004)(5660300002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?VUVBQU9MUTU3K056Y0d1YUtxanFyWkxyejdCdGtRRTNKRFAyQ29vNjFLMmMz?=
 =?utf-8?B?RFFUbFZuVzZUNzdGcHdDVVZLayt5bi9MQzh2aTAxR3R1bXM0cEcwR2d2YldQ?=
 =?utf-8?B?UzYzYnJGRHZtKzNiK2tOZ0ZWaG9rQ1BLSmhnc3JqTG5jMWtVSmY3SlpHV0dH?=
 =?utf-8?B?RzJJMktFV2h4YXhKajd4OHpJRzdrK3N3SUMvMnFjc2trN2FBVVk2TGFEdWVH?=
 =?utf-8?B?RFVDRUx1UGtnQzQwMkVncmt6UXA5a0h3Vm55UHdmSmdqNUlMVVFWNFR0aCsz?=
 =?utf-8?B?by9tOW1XZ0RWeGxvY2lkdkhVcXZTR2VkL1V6TEdIY1dqekJOSjdqUmdqWjFS?=
 =?utf-8?B?Vmd2UFREdHhieXBreFhVeWN1K2V3VCtuTUl1N1pYWnB2a2FTUTlmRHhpcnZx?=
 =?utf-8?B?bmpFSWZqMXRQa2VZbkMxeUtYbzNCR3JnZTdmVXAvNEVrZjFDVzMremlkejA2?=
 =?utf-8?B?b3JuZGl4em90YkN1Q2cwUnRhZGxjdkE4Tm1RWXZyOWlnTjNFa0VlZ3RLT0wr?=
 =?utf-8?B?dkhUYkl0eTlSNk5ObVR6enREUGp2TGRyR3gzdWtKMDVxRW1jRTdBRDlHZXFE?=
 =?utf-8?B?TUhORTZjYWNhM1VGTWNYekZ4U29wT2dZbnUrajVlbXRCWEN1SzZQdjhhcTh3?=
 =?utf-8?B?RFFHWXNSa2JKUDBJZzk0endQNkRtTlJmcGhYUjRxck0vNXlKTWVRdjZLNTFl?=
 =?utf-8?B?UHgzZko1Tmg3YVg0Smo2ZWFwRjNZaStCOEk1Tm82YkNJN1ZUSXJ5NFdaTEFZ?=
 =?utf-8?B?L3NqWE5SNlUvcEIzZERxaWY4eHdidHRpa0pLdnNMWDhBazlBczkwQ2g5OGhn?=
 =?utf-8?B?OElOMllJRVVWSFBhNEJjeU1rc1ozdm5DQUhLRFRlSFlrZitnS08wVlA2Yjdt?=
 =?utf-8?B?cE9rWFp5cDVtdUZQKzNuLzVMcVducU9qVkZab3dTZjFZV0E2VVFIMmFiWity?=
 =?utf-8?B?WVBBRmlWekZTaFM2UEczek01Zzl5YkdKeGIxeHBzT1ZjNFJlaldMOThPV1o4?=
 =?utf-8?B?WnhPRUxlNlRDVWZiYysyL2l4eGN0bjBwb2JldWw5YnU0ZEYwaENVNXZ4RUVK?=
 =?utf-8?B?ZGZrbUZUSlNhYXRKMVFUSWtnK2VTY3ZMRUozZWxxQ1R6U1hpK2o2TGMrc2pz?=
 =?utf-8?B?b1A1bTVNeHF3d2J2aGRIcW9sRnZjZEJWckNYOVRJM2dCODdKc1BjOGplYTg5?=
 =?utf-8?B?OW82MEJSUjE1M3I5TklkUjRFUmN1NXF0SDdhVWtvUXV0RE5nYnRXVVpQMUox?=
 =?utf-8?B?ZVNkNUJhTEhtZHNjdGV3SjJFcGVBMmhaVHpONkUwWWxucU1QTlhDUXVYbUVR?=
 =?utf-8?B?OFVMdHJCS24rYnp2VGgrWjJRd3pEWjVvbkJ5MXA5OXAxVk5vOHgva3NSQlNx?=
 =?utf-8?B?emZSMEFGQm9BVzE4WWV1Y3pmaHFMcDRDUEtJTDJ4M0EwZTBuS05FS1BzU0RX?=
 =?utf-8?B?R0p1OEtrampMK213WW02N1BuMXZLY1dySXIwaHNDallxMlIvZjRpeDlNN0pi?=
 =?utf-8?B?aGhVUU44M056SkJWT1dEdTdXaHQ5SGhaZzlSSHNUVkRreUdjd0ZWaUpwN1o5?=
 =?utf-8?B?SENxL2UvSHpRV0dhR01qV1J1MDVIOHJYS05NbE8yeUtBSVpRL1RHeHo1SUN5?=
 =?utf-8?B?NGRjQWRKRUZNVmpoR0RQczNrK0hGdDl0UDJaMlhXbWM5TVpZTGlzSGt5NDB6?=
 =?utf-8?B?U2pDNEpaa0Fxa05jOW9qTTdwc1dSMVM2aWhhVmZHeHdPSFRoWGd2bnJnaEVv?=
 =?utf-8?B?NCs5QTVxalYxSWk0emRaaFQ1M3ZFS2ZyTGFlNEtzTzBsOGhqanUra3N0bDUy?=
 =?utf-8?B?YS8ybGJJL0hVRHZ2REJIbXJDNkh5Nmdodk9tZGl6K0Nqdm4wNTFQYm1HUHpK?=
 =?utf-8?B?aWtkVFFJZ3crM2ZPVkJ5bVp4a1RWT2VJOEpFUUdMQjh4aDkxK3BvdDQ4WjdD?=
 =?utf-8?B?YUlzdHZjNHZXaXp1UTlDUWduZWM4c0l6ek1pTVBaWEZXZk9SdE9lUkQvS2FG?=
 =?utf-8?B?UDJUN1JOL1dZNFZqSStvUG15dG1RSEFBNmE3TXYyUlNxTk9OTjdhQlp4dUow?=
 =?utf-8?B?RVRVcDZBekRtbWMrYWlSZWl3WSt6aUkzTFVnUUM1WDVQYlNaSHdTZk5ZV29p?=
 =?utf-8?B?Um5PUiswTU5IUnU1WnAyN3ZHaXBGdjBjLzhRcnIyTVpFTUZ1UWlwMmdpdWo2?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c1933a8-5322-4500-6343-08dbb9046909
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 11:34:39.7360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nTTzHpffWNuRBKG0pjX1wXLK/9xo009PWljXrfoQCrhRyCuQCMoTqvduRIh1glh5xtwb2+L/SpTz7S3PU1Y7gHvXq5dTmR1zsbq4Ez8t94U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com
Message-ID-Hash: UWX7QZFA5YKCEMICIY56ZKGLO27U25Q2
X-Message-ID-Hash: UWX7QZFA5YKCEMICIY56ZKGLO27U25Q2
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWX7QZFA5YKCEMICIY56ZKGLO27U25Q2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-19 12:07 PM, Jaroslav Kysela wrote:
> On 19. 09. 23 11:28, Cezary Rojewski wrote:

...

>>> 2) if you copy 90% of my code, I don't think that Suggested-by: tag 
>>> is fine
>>>
>>> Could you do your work on top of my patch?
>>
>> I'm afraid this isn't a fair claim. The feature is driven by validation
>> and this has been conducted be me or my folks entirely. Given the scarce
>> guidance provided in [1] I still provided a valid WIP in [2] and
>> expected to iterate over it given the feedback. Closing the discussion
>> by taking a single patch away from the series and re-authoring it is not
>> a welcoming way to do a review. Perhaps Co-developed-by: then?
> 
> I don't follow you. My patch can be also changed - I've not heard any 
> review except cosmetic changes. I am just telling you that the patch is 
> a good base for all other changes. I think that the best way is to 
> finish the base extension in sound/core at first without any helpers and 
> so on and then work on other parts.

(save)

>> Please note that the code differs. I do believe that splitting the API
>> and the constrains into separate patches is a better approach from
>> maintenance point of view.
> 
> It does not make sense to extend API without constraints. The splitting 
> does not help here.
> 
>> Proposed readability improvements have also
>> been applied in v2. For reasons provided in previous paragraphs, I 
>> chose > to avoid the chicken-bit and treat subformat constraints in 
>> generic
>> fashion. Also, validation shows that without updating
>> snd_pcm_subformat_names[] in pcm.c the code ends with UBSAN during
> 
> Yes, I missed that. I can put it to my v3 when we agree on the constraints.
> 
>> runtime. I've already addressed that, even in v1.
>>
>> I'm happy to continue the technical discussion as there are still points
>> to discuss. Let's do so in v2 of the series [3].
> 
> Unfortunately, you are not working with the technical discussion anyway. 
> Changing comments adding empty lines, renaming variables to make you 
> happy is not a nice way to co-operate with others and then act as the 
> author of the CODE (not comments) is really bad. Everyone has own coding 
> style and you're forcing your opinion.

We have a different view on the subject. Readability shall be treated on 
the same level as performance is. It should not be marginalized.

When taking a look at RFC series [1] and the WIP [2] there's a clear 
resemblance to the code here. I believe the differences between this and 
v2 [3] are also being skipped over. And as stated previously, closing 
the review by separating a patch from the series and sending it without 
any references to the original series and modifying the CC list is not nice.

What I propose is: leave the MSBITS-introduction and MSBITS-constraints 
patches split. Have my authorship for the former and yours for the 
latter with relevant Co-developed-by: tags added in both of them. Is 
this proposal acceptable from your perspective?


Kind regards,
Czarek


[1]: 
https://lore.kernel.org/alsa-devel/20230811164853.1797547-1-cezary.rojewski@intel.com/
[2]: 
https://lore.kernel.org/alsa-devel/8d76a1d8-e85c-b699-34a0-ecea6edc2fe1@intel.com/
[3]: 
https://lore.kernel.org/alsa-devel/20230918133940.3676091-1-cezary.rojewski@intel.com/

> Also, I though about {} end-of-array mark (remove 
> SNDRV_PCM_FORMAT_CONSTRAINT_END), but I found that I prefer to have the 
> possibility to skip the MSBITS_MAX settings for the given format. It may 
> make sense in a situation when the MSBITS configuration is too rare to 
> be added as the API bit.
