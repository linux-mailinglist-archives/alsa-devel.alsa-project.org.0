Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 729856A9417
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 10:28:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D5A085D;
	Fri,  3 Mar 2023 10:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D5A085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677835730;
	bh=aC3g9/6XxO7/jjAdg6cBWte8194olw1/+hUIl6SvYV4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p2Eh/+LewwTuzh3ZwZwAC0b8aXUCu2zMJED2qGYQLUs4ilxLWrzDR8MOuJrFM79q7
	 mEKt6teNDquEqce3FK3e7BdIhytvtL1h0atPAL3mMra2nzhHNhhyNGjHIzhjV5EBTc
	 7GtE6tWSwv8nu50jZCNbYXLpzQjX204c0OSt24v0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AACA8F8025A;
	Fri,  3 Mar 2023 10:27:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F563F80266; Fri,  3 Mar 2023 10:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77252F800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 10:27:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77252F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jt/Km7YH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677835668; x=1709371668;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aC3g9/6XxO7/jjAdg6cBWte8194olw1/+hUIl6SvYV4=;
  b=Jt/Km7YH5XSB9IXIMbihTt3gHJBTeDBDk2oYqCSNYFK4rutVFOp2S6yy
   v3VbsMgyVnGR2ceKMMpQ0NeSWgZQekF8EtgtQOZVptoDIWD4IzIkdJ9eq
   uitcPECULyOg8oTZA91ssIDjbAUMUtYRByLZbHAen5DYo83Ai1q9UXcIr
   IkVj0Vjfk1O22aDCia0w1NQOFFtopfpAYrTzZxkN1ifri0A4yBAs9xSSE
   YknrQn2fER7zy7VjCKfuU49RqnQBRj5oyZ4MVbQ8UL/7w6/Z0bKfyDuHm
   zgt/WHORAv8YSFAl51z8eDbDm48Aa1ZILWlcCnR79Ck5Shi6QemBjNpXB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="335025199"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400";
   d="scan'208";a="335025199"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 01:27:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="625299004"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400";
   d="scan'208";a="625299004"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 03 Mar 2023 01:27:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 01:27:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 01:27:37 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 01:27:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8Oa7o5PnI6BnMHn85UnRLaKJZIEXQSX85jwoad5HyobtVaHDgCaykM6wdebmVjd6D6wtBRRi/fmllCiHDH53lugmtP1vpdv9G8q1qE4jlwPYJCecEl5R9woyjLJgUjJ+vBBrTB9Xy5/snaJPLhQrSYs326AF5k/Y4AVgxjzBpAVKt10Bi+Gf4HM8Fdqwb6o/5POtheaStysyVy9uzLqCZEm4Wa1CXAnGh41HPl7I4051/Acs/2qVmeYFcvruX6tbxWFBpzELivDeQnx6wC56WQz3tRFZ8BBUiPTHCw8/0yfm2y1dSNrPsLuH9Xr9A8b22m89iEtDMZZDYGpP87wbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpU5MtU4kPIvHZfs6vlm9xbWXQGM2elosmUTjICb8TQ=;
 b=HJnpB4SvU5nfWKW7xeQiv/MXU/merewYr8yWdfTxHKpIpttLFf5UPIwTilpT+E3sQkqLxlxY2rIg0mhk2M3XCyXng5rgvxl9N3WLlUo4yBA1pf2FYzc/jKOlb3V/3VyqMnehqxbPipF0CSBanrMc7PumSls+G8UuFNdqWEdmnnTlAYV+Z37RZ8EcsuynEMwt859SgKPI3cgIBNBGDCsjPb2NLkfH9aMbYVLk7uGJfnAv1e0gjj63Yd7cnu3pbklVQMb/oP1+ZbzeDdTrVKQzHkovKmjdS2RyD2L7LtazN9L1noN3dCMyoSOjMxHnm4usRJbbJKggQchiRZbFzr34+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CH0PR11MB8143.namprd11.prod.outlook.com (2603:10b6:610:193::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 09:27:35 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::d932:e7c3:5aaf:f0ec]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::d932:e7c3:5aaf:f0ec%6]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 09:27:35 +0000
Message-ID: <59212e65-d565-d5a2-9043-4f25f88f006a@intel.com>
Date: Fri, 3 Mar 2023 10:27:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: Intel: avs: Use struct_size for struct
 avs_modcfg_ext size
Content-Language: en-US
To: Jacob Keller <jacob.e.keller@intel.com>
References: <20230301204628.1073819-1-jacob.e.keller@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20230301204628.1073819-1-jacob.e.keller@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CH0PR11MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f8d448-40f5-4173-62eb-08db1bc985b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 11uCUfjKMHJ4900p3qcJkl5lZvDdpJBOaiE9lBf7wxjjXrv+Hjy3pxNhroPHet1wmnuMsSEejzGh7ZwUzkaqWzTzqaSIv24lCZcwzjqLs1W3Sa0oqVrOo4aHBgBGKgpKODkB6PDDX2Q/8Y4DMEz38Ue1gKoNRmrz+rKol+5sV5CRsg878zSdN4VYC38ITtsFebKEt7Z5pHghdrwjfZVPEYDAeqbCbGWDMz0v8t2H8OAjaKZQ9QnvLk8/3dyitLBRjLbjuwcxgaQuLKzwWZTb2qgycMmrQ25Wi5vDVBA5H4hOeE8B+kEh9FnS0SPwF7WShmtNhvSmoEL7mrXDY2y7MQP6AbrJ5D/LudSpkXqvBhBqjD4UAi78PRa0YE4JY+PHWFDfMXXE0bL/UWloeI9ttnw1aVq1LoBp2s7AVpcB5hMmNVXFG7uMfhhCnjDo4F/W3H/k6s2UhX8iSXs/tQOSxGoXfHWDmp49o0E9Rq8j1M+iITVILna5VqyjKVqBJ9YlGzJz67w+/1T0BKdZLn9a6HnuVRwwM/pofrAbDAZ+dQkmgR1Glt0tvPKNiFkVUJgVJUO2ZPAYYCa1yx94qHP73k4xv/1wu7rGsfAWZzKFmlTZSOfzndqfhXDYgr2Qhm0iQmtk4aqtJ9WisRygadffjWdrzZUFjbUJ+oTsN9X6LORiEQNCcxPfeRT2iE7I0FsskV2eWbIY7vfYisF7BsKWzumDwBwQVJPjk2cEM328Idk=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199018)(83380400001)(31686004)(6666004)(66574015)(36756003)(38100700002)(8936002)(478600001)(82960400001)(6862004)(5660300002)(31696002)(86362001)(44832011)(6506007)(2616005)(26005)(6512007)(53546011)(6486002)(186003)(66946007)(66556008)(66476007)(8676002)(2906002)(6636002)(37006003)(41300700001)(316002)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?YkRhbktud0JSU2ZHZ3pKSFQrWkNIRENDMzlLWG9Wd3J0WUhqd0dDYktSWXJM?=
 =?utf-8?B?SnZoZURtc3duUENmZ2I0eXQ5ZXYycnpLbzVUeFNHSThwbWlDU3d2Z2R4Nk5n?=
 =?utf-8?B?bGdGRjAwcmNEZEdsUWlscTlkcXNxVXpNMVZXVG1TaTl6aW5pSGVKNUhOQVhw?=
 =?utf-8?B?eHFOWEorVG1xRHNueGpQcTU4VEJkZ2hJVDBRUG03Ti9BSHRLM3hMYjF4c05G?=
 =?utf-8?B?a0N6bk1ka21HaE5HSGdRQ0luUWZvUTBiRXY4Mm1mWHFhRzJmVC9LQUE2ZWV2?=
 =?utf-8?B?aDczMkZ4MzNWL1Jwc2IxZGhBR1Q1cWRUSlh1cUl0Q3QzUmVoV0RWN0xHMW05?=
 =?utf-8?B?WS9vQ1ZnS3VFVjFLMnNWVlZpY2w1L1FMRHZMWWs4SEFEVWI4UHk5MUtERTA2?=
 =?utf-8?B?Y3hvS2hhWDZaTXFQSy9ybG83bjhpNmRwTzRRVUVuWi8vOG1QZzNyUjl2bmJW?=
 =?utf-8?B?VlVEZzBzMnJPTlNTTmFaOGloeXFxSHdQK01KTG5IVW8wMU14UkZxOUlTZ3lX?=
 =?utf-8?B?U3pzY0tvTU9GSm9QZVd4R0JtYm4ydGcxQy9Oa3FaclNuaUhveFRUNjBjdkhS?=
 =?utf-8?B?dE9zVE9JRzFySVIxbS9zaXVLV0p2emhySmFERE04SGxEQVBGTXJmc1p0R2U3?=
 =?utf-8?B?NXpVZ0NndDNqUm9vQTVWS2FvNTJnL01FbDViK0xuVHFGcmsvenk5a3ptWHZn?=
 =?utf-8?B?cmU0eEZLQ1dPZk9URHJIOFNpbWJ0bjgxUjl4ZjZpS1FWMXc5eEhVVERCV2Zt?=
 =?utf-8?B?WkFmYzdFSFIwbXYyZFNCdTJYbDh1TjRkdXVOb05NMEZXOVVHVTdJWS9jdmhh?=
 =?utf-8?B?Y1dOQm9MMUVoZEZDSHQra21ZZTJHdDRYOWRERDU5K3ZoREY5QmdEMy8wVkZX?=
 =?utf-8?B?ZnBWdG83RzQrbnRqcHMwazFtdnplVlFORFB6SzlYUXAza213alFWTVpOVzVF?=
 =?utf-8?B?YzFPMEY4aW9nQXozdHBLYlc1T3J2RytJbUVhVjlPSmUrUTZlV09jYWFjT2Z5?=
 =?utf-8?B?TDE5RTVkN1dTR0RHNVc1VlZ1VWFIS29MZSsxRWJidElBWG5lZm5KN2gwaTdo?=
 =?utf-8?B?Qi9rZFoxTGZRZlJobGZrbWM1WTVZc0RzNGlBNCt5b0lMdndiQjhQbkxuUmtu?=
 =?utf-8?B?UTIvQU9RMnBaTk9NWjZaRzY4MWVqWlhMellBd2wzZndNa0lYRkI4TTVxNDNK?=
 =?utf-8?B?aHJXVUVNVWZ3SldKZERoTGVWSHBNRkVlWmxZZnhIdWZvYlpIVUpydDE5emF2?=
 =?utf-8?B?NmEyaCsvL3Z4VzRxRWF5ZVlOeno1Y3ZGMklCeFNwVFR2dXJTbENXWlhaVSs1?=
 =?utf-8?B?SEl5MTZQdzN3MGhTWGVUK0dCbGh0Q0hjNXpKNDhlQWR4NTIyd3l2bXcyMlZ2?=
 =?utf-8?B?M3JuQUtoakpBUnk3SVdzYmR0b3hnZlFKbS9Nc0ZhVC9GK3JHNXk5ZlViYUs0?=
 =?utf-8?B?ZW5RLzhjSTZtVGwvUXh0VWNLU3JuOE1aNlZGRlBDRjJ2cFUrQjhvTXptQVF4?=
 =?utf-8?B?NHRxUVNFM05hTndyUzNqQk9UY3o4L0dVd1F1czRhVUhmcjAxcnRSSHRWZCt1?=
 =?utf-8?B?VWE1SVNsMWo5WnVlOHJYVzN6TSsydHRMSFRPZmwzcUREUXZpV0U0SERCOXZv?=
 =?utf-8?B?emk4YWtNNzJhZFNrU0txQnhIQm1BZG13dGFXMDZUaVFSY3VoV2ZPL1QwRHlH?=
 =?utf-8?B?MkxFOXhrNkI5NytycCt1MFlTK25IODFoVDJyM3J2dUFNUlZXZGxmMEZVd1Mx?=
 =?utf-8?B?cms3VUVwLyszbVRIQ2hCMEpoZHZVNzRMdWt2UkFjRGtZK1hrRE9XNXJDU3NW?=
 =?utf-8?B?STNhWVlBMVkxZmpPb3hneDVJL3ZOaWJYYjZYWlhjRU5vYmhYOUQ2OWxXbzhN?=
 =?utf-8?B?cG9MKzR3VitwcktUdks1YnhDbjE0clJOVzJmR25LTmx3Vjkxbm9KVjI0T0ZO?=
 =?utf-8?B?Ykc1T2hhV2wwSS9uVUxrbkphWjNLTUhWdUsyL2JnWDNuOEczdjZOVE14R05Z?=
 =?utf-8?B?K0svZW5haTBtWExVWlZXcmZUZ3Z5WHVVeFM1bWpsZnRLMUx4Um9YLzlWWW9y?=
 =?utf-8?B?VDVVVVZhTzVtTS9UR0I5N0pFVmdadU44K2hnODVBMi9xZ0NEM01yQU1GRSs5?=
 =?utf-8?B?bUxJRkliR1Y4QmtvTUR6SENXWEFYQjJqWGRyM1UvdFljeW1tZWtyUm5QM1k4?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 67f8d448-40f5-4173-62eb-08db1bc985b6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 09:27:35.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZuuKFTogpeKG7EQWlejX/uPGw0/kZqiTkoxADoKcuhYribGKeScfJa8qk4vPuCnllTzXeUJjB4HRFzD81foaL/1Rsp/+X3fn7xE1rsx7e7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8143
X-OriginatorOrg: intel.com
Message-ID-Hash: RNU7BOBIZAUDTLVWQARJH2CJN2QAU6RI
X-Message-ID-Hash: RNU7BOBIZAUDTLVWQARJH2CJN2QAU6RI
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNU7BOBIZAUDTLVWQARJH2CJN2QAU6RI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-03-01 9:46 PM, Jacob Keller wrote:
> The struct avs_modcfg_ext structure has a flexible array member for the
> pin_fmts array, and the size should be calculated using struct_size to
> prevent the potential for overflow with the allocation.
> 
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Reviewed-by: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org


I've explicitly asked for the Signed-off-by to be the last line in the 
tag area. Also, while I'm the author of the driver, nothing is being 
merged by me - Mark is the maintainer for the ASoC subsystem, so you 
should send messages to him and keep appropriate people/list in Cc 
(email's Cc list, no need for every entry to be represented by an 
equivalent 'Cc:' tag within a commit message simultaneously).

TLDR:

Drop both CC tags, not needed. Have both Reviewed-by _before_ Signed-off-by.
Then update the email's --cc/--to so that it reflects the actual 
structure of the subsystem.

> ---
>   sound/soc/intel/avs/path.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
> index 05302ab705ae..adbe23a47847 100644
> --- a/sound/soc/intel/avs/path.c
> +++ b/sound/soc/intel/avs/path.c
> @@ -478,7 +478,7 @@ static int avs_modext_create(struct avs_dev *adev, struct avs_path_module *mod)
>   	int ret, i;
>   
>   	num_pins = tcfg->generic.num_input_pins + tcfg->generic.num_output_pins;
> -	cfg_size = sizeof(*cfg) + sizeof(*cfg->pin_fmts) * num_pins;
> +	cfg_size = struct_size(cfg, pin_fmts, num_pins);
>   
>   	cfg = kzalloc(cfg_size, GFP_KERNEL);
>   	if (!cfg)
> 
> base-commit: ee3f96b164688dae21e2466a57f2e806b64e8a37
