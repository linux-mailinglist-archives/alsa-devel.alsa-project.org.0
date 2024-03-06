Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A15873BB9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:09:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 312F985D;
	Wed,  6 Mar 2024 17:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 312F985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709741351;
	bh=YPgAnF9QeIILrMakOT8QONTAUCieOzfffpR37E8cn3c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=juYSSPGYBlOfN1BM0yqFrV1YJ9UI+KijqTtKpY4Tc4t8sel8mQ8QbeVi9RTbQ6Qg5
	 XiJzFfwckBBFS7125HyQVUvvj8ZQjcpF6jIdlTDSNe8vqKZ+G+9xaAReDzBdg0zYkM
	 JLhxEESqRkcnBdKFBOc9Bi8dXEGBg3Uks5hBJXfU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15918F80587; Wed,  6 Mar 2024 17:08:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BBFFF80579;
	Wed,  6 Mar 2024 17:08:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA457F8024E; Wed,  6 Mar 2024 17:08:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 409B5F80087
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 409B5F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K4BLsQNA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709741304; x=1741277304;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YPgAnF9QeIILrMakOT8QONTAUCieOzfffpR37E8cn3c=;
  b=K4BLsQNA7Gr5kKOEzE7XMYbVABwcmUOYjzajbqTVr1Olw1NDPMUOV0oQ
   DjDZtMt3sdYn1WbeKQ5kLYbOLnJTjAL28xApkbr91Gdzrx0N6ySeeQFsG
   9UY3ed2VrsHtS+vE0d2hXceIE7T6nxW0DxAa03sI7NGbAABkqlshBJWYg
   PV+ExWEzUU7/BwKEhcxQ1nMP8jZv5UbwqmfpnYHiXZFeSpziylpL3Qi2q
   26EEBx3KdCOgbNF9Nr7Oko7fHm6frFkDLIh5Bv93m6Ot9H507CxVatXlX
   6TAGHcVpUbAsjPWq1PkY4pgofd3iC8H5oobLqxxx9KcTvebHVwzIoxUoS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4514349"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000";
   d="scan'208";a="4514349"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 08:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000";
   d="scan'208";a="14365906"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 08:08:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 08:08:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 08:08:12 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 08:08:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYY1jUjyZpRWfgIp/jQ8Y5S9VKfkwpKaL3bW4L9YREhtqDvok/kWCyfBQ9qSGvQYHiaJNmzHDJIDWwYq0beefy0SMXivL/sWmjHhfJOz25bzDVHd2qubaP2dKr2OhyZ8nJkRLwQKI2nctMQI74AUPDz8OMOxYJ6WtVsmruuc1iqS3FVUSSmwUBkmS8kOhxduqgCfIkR/f9j33C/nF75wGvN4Wid4qbBuK9dqb/AhBI+/NOO+asSRUSvmgcuECTrvFKlGaELdNdMNYHgpifLM3uW24qT0ClZDF775VIpzCJdZ6Z8cH+iD4OaxafJhbLGZzqStob9/y1SNzBysQ24+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jeQ9paNMHjZlHKN0gsj0KYMj8ftje1fH25F2jDauX0=;
 b=B9u0fYjUq+AYBClbnFQ/XqEH6IIP1p4UKL1lUKLQ8wcSSg7TKVSiUPaAl7MD1WNGS+3jxEwEe59xNEIjxDNnIecUCjBGtqLo723rhSC9hQptUz/y9o4/IzMdINnaephd9vh4ivPgpuPqmAwNxLq1kHGo/0md4wUzqYJcQorH/YQbImnEIqrmHVL0hv5NVv5DSpKw6K+9ukaP3fAVOB7z9o3/7UZnaNRGT+qI3pSB+85Bsdja9au2Ezmue0q1cvvXB9Rx1RHsYaHf/nLcGSjRQevuA5fKjNEuZWwYLktsmBa1U+0BlfYJWWVMTt/ugqsPbGx2PZsr4kiqpoCz9ibdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CH3PR11MB8750.namprd11.prod.outlook.com (2603:10b6:610:1c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Wed, 6 Mar
 2024 16:08:10 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5%7]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 16:08:09 +0000
Message-ID: <a89f8c9e-2e11-4db5-9ab6-f2d600989fed@intel.com>
Date: Wed, 6 Mar 2024 17:08:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: Intel: Disable route checks for Skylake boards
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	<broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<hdegoede@redhat.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-2-cezary.rojewski@intel.com>
 <ff674cfa-19d4-4de4-80ec-9be88f8cb4a4@linux.intel.com>
 <87c39d2f-fac0-4414-9c9f-53e45de70e79@intel.com>
 <eca552eb-9d5b-4990-a98f-85dc1da3a96c@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <eca552eb-9d5b-4990-a98f-85dc1da3a96c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CH3PR11MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: b405cd9a-d586-431b-c02d-08dc3df79e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 /C3Fx6vGSbLZwnWijUeJ0ofVETpfOKzONxh151BdVtOP5Qy2HItaL3btyO9yk9Wojj0QnG5hXYcey2MLMrm1sEEisgovCRsJnBF//A+VuQ6W447Z/XZm6TIebOTonf0OjFOqpwt7vl21U+XMstCzkPtPhCldrTwIACfvLjg+ijZrltvyoI7gDzeZt5KK6R08ZgGpx4ZWF5b4NfWNN7yFeqZC9WtVKT4vAm5u7x/UoBV5kIU+WUetIFPNUzN0zazi5h1+VUh5IcTOhFl5+wOh+X/8hCf4QjeZb4AsQHfGJBUvI8u7A32vB+dVBtcMQ0gck55y4Tp2Pq+n6CasYn+GYrqRr6kBt55pfeHC0U25WVKJezMBiXd9V+QVfFW4BuHvWRdoQGBpOHyIElG3LIAl7g0bz25OrKSIzhj5VAQysWRzc0y6EhgNHcg19nd6/9BauA5hqkQQ2SRJhXXhhgrgIlcH2QCFAFNKexpdBaOsgtbc8eYwMz8Edmy3dVIqbO804Y0iKn1ygv++LvOgBDW/1hx9mIl27BIc5P50nKFKfcfrNiJoD9YjYOZkIi3ho0DZWy28xsB3oj0b+mIc5NP1Klr+Ua5qUc0aRb9i31jYmC8=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?TlFwZjhkeHRCWDZqNkF6YVE2YjlSNFhrQ3NQVVFRdlMwcU03NEp1OC9XK2Js?=
 =?utf-8?B?SEdmdWk4WmtlanI4aXNNeXpJT2NnUm4zUHl5QTlkSTl1MGtvVmtsR1NCZE9i?=
 =?utf-8?B?V2lXTzNNNlBwQWJXaXRpeHlrTHNhdXJva09qRjkzSmZKdTFtcFdYZFcwUHQ1?=
 =?utf-8?B?cGJKdUx4S0FFZUV6aExMbmZOaGl3MnhMVmV1T1NsTkJIdlllQncxQkFCcTlN?=
 =?utf-8?B?SDRyTUxidHZvb3JLQnh2d0tVdnhKVWt4d0ducWh4VklVdzkvR3p2bEJSU2ZV?=
 =?utf-8?B?OTBxZEFraUNlUlF3Rzh1YjczRFJhSnBKSXdqWkg4ZklMQlkwTU1uNGk1K0hu?=
 =?utf-8?B?YWpGOEJ4bDR4NVQwbjVtYTRkUDFGMWZpUU83RkN3UGFXQTdPOUcwUWV2N2lS?=
 =?utf-8?B?bGFiUW9Ha3R0cmQ3WnA5TmNsNHJlaC9SS0p6MkE0L29sOXprQlFGcTNibXRz?=
 =?utf-8?B?Yk1kN2plSGloaFJ4YW9YVFIyRWJMNU41MXNjeXBXU0U2c2lHcVhZV3pDQTlE?=
 =?utf-8?B?ZHlKOFVYSlRMVk5pYVV6YngvdkdyNFJLUk1EcXZYMENnRm5NRTdaVjdCVHlI?=
 =?utf-8?B?OVJkWDhPY0kwUjJSWFRJMVpkTDZEazk0dlYxa3pVM0RJVjRyZE1EOFMxek1J?=
 =?utf-8?B?VkFJd0NUcTh1VlVDd1BlS2NRQWlUTnNjY2RETkU3MnNNQ0w1QWI0dEN5ck9s?=
 =?utf-8?B?Zkd3YllhWkd3YXlMNmM2cmRkUWluUWo2SkJIVjZjc0FFRW5yeHZNQktWMVQ4?=
 =?utf-8?B?M0xhRHFmYnlIMmxqQkNmcmJJTVBEVWNlQ21DNUNkbmQ0TkNYUmZ6VTludU9P?=
 =?utf-8?B?RllmcktLaDdKYzlQMkgyTjJleldKaUd4MzZHUEZaVXRUMmpjb0syL0ovckR4?=
 =?utf-8?B?OXdiVjV5Z2p4MGwxL1VzZnUrekdhYy9YRmlSUVpjaGFGcU5tTzluL2RudGUw?=
 =?utf-8?B?MHBOaG5pQUk2d0ZQZzNmMytHR0JISWRrM3pjZE9KTm5ncGk4SlR4VXJWOVp3?=
 =?utf-8?B?UzR2aU9pQmFraWl1MnRHNFYvVXBvOEZLQWl5blVQeEZheStrYlZ1eitiT0tR?=
 =?utf-8?B?MHRVN1dQWkxrU3Z5dzRPR3BzZXE1SHU3M28zTFBhbUlKeWptUzNxOEI1dEFL?=
 =?utf-8?B?cTgySEh6aUhIZlJESi9HSk9lelJJTzRMY1NGS1dEU2NEWXorNUhGM3pSYm0x?=
 =?utf-8?B?b2JnWE1pdlhlcUcreFVXT2ozMisvTjZtZGE3UXBZY0NHNXAxZm1leTFQWHhx?=
 =?utf-8?B?SVUweE1qQ1NJbDB5a3JCSk5kZlVOQUNCQmJ2YkJlQkhPU3dWRzBCNUhBV093?=
 =?utf-8?B?UFhLODdvdzkzaWg4NlZLQzVCblB1MU92dmh0WEpmTUJyTnVyeTc4UU44NDUv?=
 =?utf-8?B?bmFlYVNGOVdyZ1hhNFVRWlp0RWN3Snh4ZTJ1SkYyOE1jd0x1UCtybFlTTWhZ?=
 =?utf-8?B?S3d5QW1YNXg1Rlg3VW9mR2NsOGJDeUxDaE0xK1VHVEorK0hMNWNqcVFoNTNm?=
 =?utf-8?B?ZUFvc3UwZ01BanJFTjFIeERZVS9jZ2R4L3JHTTJ2RzJmK0xOT3BaTFIrNDcy?=
 =?utf-8?B?SEErQjBjejY2Uk5wcVJDeVA5K1ZSdWZjbXdoN0Qzb1R0eE52aWlGa0J6U1ht?=
 =?utf-8?B?b2dUTHdvbmhRTFlIS2dObDc5eTczUnVVQ2ZQU2ZsckVCUFpIUWdXNUhCVjJx?=
 =?utf-8?B?Uyt5MlRYVWN0T2FoUm1sWEF2c2kyNUFBMnhaRzRsQm4yelRJMWZWdXdRTnFx?=
 =?utf-8?B?azFuQndiZWxCdENLcC9NOVF5LytHQUZ1Sno2ZllNOHc5R3c2bW91OW1rU0lH?=
 =?utf-8?B?RmM0V1RPbCttNlcxTnZnRzdBeUIzbWFwOFpMSlJXcXJBSEh5M29zOS9LWlJp?=
 =?utf-8?B?RUhtaStWc3FSQllxRXpBQzJxS0hYYWpEU2JVeitia204K2JUdW9uV0JIaFRX?=
 =?utf-8?B?Q3EvczlWdmE0NEFJc2RBNGVacWJmb3cxdVFzaVNjdko1U2h3SU9mVklKV2Nn?=
 =?utf-8?B?YmROZXdjaENnOUpSZ2FVaWlzaDRrWFk1RWtqTFN1ZzYxbGVJRS9rTVhWSXFk?=
 =?utf-8?B?QmJ4VWVIOTBxK21YRUFOSk9IM29OT1B6TVRPSzBrbXlaUG1ycFllVDNRS3pC?=
 =?utf-8?B?WFBVZU1jQ1NkTk45eEcyNEU0Qk5Ec3hlelpkSnZadUNMdnF2Wi93djVGcGtR?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b405cd9a-d586-431b-c02d-08dc3df79e03
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:08:09.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mvslDwFOBuUBMVGuXmrg4FewUNm3C4bLtNDxgBihNzSNZ24yvm1i7uUe68hFpb+zV9mmYnYWSwKg32mlLhmvKd44dHJpzcX8vVUo8kEx5vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8750
X-OriginatorOrg: intel.com
Message-ID-Hash: HBAVCHTZRGKNTD2RNNXB2YU6JTN2J4FK
X-Message-ID-Hash: HBAVCHTZRGKNTD2RNNXB2YU6JTN2J4FK
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBAVCHTZRGKNTD2RNNXB2YU6JTN2J4FK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2024-03-04 10:02 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 3/4/24 14:40, Cezary Rojewski wrote:
>> On 2024-03-04 8:28 PM, Pierre-Louis Bossart wrote:
>>> On 3/4/24 13:05, Cezary Rojewski wrote:
>>>> Topology files that are propagated to the world and utilized by the
>>>> skylake-driver carry shortcomings in their SectionGraphs.
>>>>
>>>> Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
>>>> snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
>>>> failures for Intel boards have been partially addressed by commit
>>>> a22ae72b86a4 ("ASoC: soc-core: disable route checks for legacy devices")
>>>> and its follow up but only skl_nau88l25_ssm4567.c is patched. Fix the
>>>> problem for the rest of the boards.
>>>>
>>>> Link:
>>>> https://lore.kernel.org/all/20200309192744.18380-1-pierre-louis.bossart@linux.intel.com/
>>>> Fixes: daa480bde6b3 ("ASoC: soc-core: tidyup for
>>>> snd_soc_dapm_add_routes()")
>>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>>> ---
>>>>    sound/soc/intel/boards/bxt_da7219_max98357a.c       | 1 +
>>>>    sound/soc/intel/boards/bxt_rt298.c                  | 1 +
>>>>    sound/soc/intel/boards/glk_rt5682_max98357a.c       | 1 +
>>>>    sound/soc/intel/boards/kbl_da7219_max98357a.c       | 1 +
>>>>    sound/soc/intel/boards/kbl_da7219_max98927.c        | 4 ++++
>>>>    sound/soc/intel/boards/kbl_rt5660.c                 | 1 +
>>>>    sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 ++
>>>>    sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 1 +
>>>>    sound/soc/intel/boards/skl_hda_dsp_generic.c        | 1 +
>>>
>>> This HDAudio machine driver is shared with the SOF-based solutions and I
>>> see no reason to change the route checking...
>>>
>>> I don't agree with this change. Why can't you fix the broken topologies
>>> instead, if indeed they 'carry shortcomings'?
>>>
>>> Same for glk, this an SOF-based solution.
>>
>> Perhaps the flag could be set conditionally for those two?
>>
>> Even when you address the problem in the topology file, you do not get
>> any confirmation user replaced the invalid file. skylake-driver topology
>> were not part of any firmware-alike package. Please note that I actually
>> did all that I believe could be done to repair those topologies and
>> provided valid references at avs-topology/for-skylake-driver [1].
> 
> Humm, the commit daa480bde6b3 ("ASoC: soc-core: tidyup for
> snd_soc_dapm_add_routes()") dates from August 2019 and was included in
> kernel 5.4.
> 
> Why are we seeing issues on route checks with the Skylake driver in
> 2024? Are we saying that the card creation failed for the last 5 years?
> 
> I must be missing something here.

Nah, no customer would allow that kind of delay :D

Unfortunately, nothing out of ordinary. In 2018/19/20 we had to fix 
everything "immediately" and not everything got pushed to upstream-users.
