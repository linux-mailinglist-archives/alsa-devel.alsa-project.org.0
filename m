Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB9A566EE8
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 15:06:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDBF616DC;
	Tue,  5 Jul 2022 15:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDBF616DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657026404;
	bh=1eRK/8jf+wmkx83ZPU0402J50vhaq/XsABq7wi+ze48=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AsddISntLhcLL2S/0/TnhbzeznoUQvAymD482MRVaYQNcHm1jzC4HtOzej7BmU74B
	 mY5N04Gj3Uyaox/ZV0xyz4xu7vUr5U32pAAjAsZ1VL6GzemunFfnrNIwUgY7JhoNqy
	 NK8g8FlUi1D+EgJHNUUA71icwhGl4EjSiKRe6RYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C990F80212;
	Tue,  5 Jul 2022 15:05:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B0E7F8015B; Tue,  5 Jul 2022 15:05:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C870F80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 15:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C870F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D2NnyI94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657026336; x=1688562336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1eRK/8jf+wmkx83ZPU0402J50vhaq/XsABq7wi+ze48=;
 b=D2NnyI94K8UukxadlvMCUhBPNmtlQkRhfuOl42UikgiruAVAdvjqfQ1j
 E1rHxcmPQGYwN+AHIQFzu8HHqblUnDv/n/abcRWMpCOPJKLTPcJbvOFQr
 qNspmeEXr8KjZL9VXit9uUapN8RKcMAqxwp01ESjst8XCEzNGw8HZZEuI
 W9DgCF6sPysdQqw8Rrvewg4nEVkkezb1t+jcy7Y2on9sagpNco5gQbYza
 pGRP9WfjkQ8a2BdQEqSyzvvLDLn2WNjYfG+6EZRZFJGb/gMJH93RGIiu8
 j0WHzid0CbDUn76IB4InYMw8U0GLkwkhQE+4YMm5/R+YQ8K99nQ2almMM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="308888133"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="308888133"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 06:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="619825083"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 05 Jul 2022 06:05:31 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 06:05:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 06:05:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 5 Jul 2022 06:05:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 5 Jul 2022 06:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GS5iZ+IirJzO66ZzCS5vYOL0609ptN60KjuhdkIcB6Xxv0Gk53sGp709OySjPh8vHzxywCnmo319xOqAY+xWPVA+8LaP02jzuiyjlxcmuFr8OsHmS7Y1Wu7Ko/GNrfqp86nWLvKg9XE4YST1Vq36qUA3SsuCvBLkuhdLTtYqtcDqvznBXqpZ1LlxHECu6c16TmZjLCnWDkLYAqH5Y4299NLbzvHE7eo4J8pTuDFLP6re61SBqWmVqYHv6RZ66rUOZkEgmGI56BkZKiSiTkQbYDccJLGsU5QBVM9ZSDbnra7GDWMHCOF0lxDGp3lTCqb3sHqWskrahoNwscAAfVVr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db+yeMA+cvL/8n9XGGQsdP+HCE63IeoxOiJ0L/RK478=;
 b=UNKLllAnPDn+lzMuuZ+XqidttNxugdtGa84gS8mosHtOcxSWnZ/ty4eOfMVdatvTxE6pQK+6jlwKwRc0VMqT4qonc7urdWHfBdCJh0SNu87OhM2YFRic7e1A6KHjTuAEhlxhIitTRli0jzkHRDmsOfkwtKsa8DcheaywuKMK+J0n2cAKGczUQXVPT5gzwfrrHBduXblOMGmfkNsbvYVD0tsOvI6Lat+0/hmqAHEFxn94SzUK0BqdmD7JQFxr7TAi2A05tG3FtUmL7S69SOsYacJzk+8S8ZSjpbb3zXgYhw2HXFvuygbS/p2l3RiikpdultL5rqUXfxRYOzQmEGKJsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA1PR11MB5897.namprd11.prod.outlook.com (2603:10b6:806:228::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 13:05:29 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 13:05:29 +0000
Message-ID: <2c52f392-c424-31f3-eff6-6eb6124ebeff@intel.com>
Date: Tue, 5 Jul 2022 15:05:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/2] ASoC: Intel: Skylake: Fixes for skl_get_ssp_clks()
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
References: <20220630065638.11183-1-peter.ujfalusi@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220630065638.11183-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a58ac66-5cb0-4817-9ee6-08da5e8708d2
X-MS-TrafficTypeDiagnostic: SA1PR11MB5897:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CiWZDuDWTIZCDYByfRfe3xwhNSvXzyGk0oBHFwx37VaS082alMGPmQ5UtJB1nxLcutIPmoFrhuYM716m39uxuCD7bH7PT4twGQa4NiLRCO8sJwVpPYBnHbwFQkiWYMU66ifsWhpej36SqqN4hOZTejZehj4Jb+xtyki4+ZZ4dviCndHpiJHNp54Lc3pYSkq+Ii7bCWsySvRNHo+GbZ+Pu9uECGx9Dy/WY2PKTD32h7FZWQWznOIpp42WeOj/T7ZtsKVvscZmdxnqNR0EFjv+Z+5zNCkvEAWFghJtLapqM3QzVzskhASk4UKZLmFUh2yijCyEuv6wumOKhuDOnQyp3jxs3R8bkIvRnboq8rOgjrd1Ak/TR+dQyY8SWObEkC84XoCDNnhK4bl0RaSWEF55aXrXszcJVKr70z3AzQ3JAtirS1DXJWLKgEqUrfRJjdZZs+QMqcHyCtyV00IEzGKrh4XXq61wlxxm71eiInYzDw1G3DaOuihksN/HCifQLsWeTXcsnMNtnXfRdiNg51nJBw6qShx0mZ2r6QJltFAHiPzItN7sT3BWnxI1YJhaqcIM0KGgUMgRf8Dxnvhr9G4I70GhvbA4WBBvKOC0PUZtlKUkXi75g+GP2RmwUsowk8S3OethHWeQ3lxQkwxchQ6RaCMUjWZ+/OLAOin6cCzbQGGZse+Z74CZNnuFPxZg/ZMfMXwOfbVpKKqp2VML4bVw1AP2Lc1P7GamcLyx+grdwqbTSWKtzfLtel+21I7LRd/YfuAkcxGIzhNWy6lU0XT+TwOALoOzdpJ3VyiiFx82y5C3SUk995w7bSc8wu1ABDw3XDUr7sUfQIOXGypAfqnKSTlxtVG47GgcK/Qvq/3mSFZOuwttzbg+B5yJe/dfZB6+ni117nOAXA2KIza2s6YQvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(376002)(396003)(136003)(39860400002)(44832011)(4744005)(478600001)(8936002)(5660300002)(6512007)(6506007)(31696002)(6666004)(86362001)(53546011)(26005)(2906002)(41300700001)(82960400001)(6486002)(38100700002)(2616005)(186003)(4326008)(83380400001)(31686004)(66476007)(36756003)(316002)(8676002)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3R2cFdOdlRPa3VwczV4M0RQWEFJdS9kWndsUHVJSmthTE5sN2p0RXJCMmMv?=
 =?utf-8?B?RmZVeXRTek9FRzRocUU1eVcxSG85R2gyTWV0d2VDUW5Xdm5qcVphenpMVlo5?=
 =?utf-8?B?NDhVN0xYcDdxNTRNRytLNHRsU0kvdTBxMzI5dS8xZEo1NVN0Szc3YUNOTmgv?=
 =?utf-8?B?MGFVQVo2TTBRZHB2UjVvaGhUQS9OL3lQeFpENFkwamc0M2o4VUloUmthT0Rv?=
 =?utf-8?B?OFZoM1BDNFJHTXdWNjRoQlNYdUthYTh0VU85TGdZZUZTa3V1RHFaRUw1S2h3?=
 =?utf-8?B?TTYyWlNQQkxMRU04dFZrenFlYjdPeEw4UEhWZGErcFBqelZJZkZnYVIzL2cw?=
 =?utf-8?B?M3RiTk1sU2N6UHdwelRMMXNGZnBFUjZ0RTRibFZONTlKY21HOTMyUC96OFNW?=
 =?utf-8?B?S3h2OWIxWC9UWTk3TkJveUltaXZYQjNMZnV5UUs3ZzEvQ2ZSU2h1ZmFoN2RY?=
 =?utf-8?B?dXF4aGtxL3o1TllPcnlzUXdwS215OHRsVTBvSktEa2Npa3dLU3pqWFRCa2Vl?=
 =?utf-8?B?dm5pMGN3UUlQNGx2YjJDOXJWQ0wrcVMyVGd1QkNCQXZhOFlxeVQrRnd5Sm1j?=
 =?utf-8?B?K1N0RlJpYVlDcW5XbS9pb0lDVDZ3NXFVVWxiTjlhYkhXMktKeFZSR1kxalZX?=
 =?utf-8?B?NjVoSUQwekl2ZWxqRkNaRmNyNENTbXd0ZE8zZi9hS3orYXFiYVlhckJjVWJS?=
 =?utf-8?B?OVVndW1vaWNjY1luenR4Y0FYK2NjSzFramJhWG4wbnl1ZGU2eWJETDdvQTEx?=
 =?utf-8?B?aEZhOXZLazUxTlNFOERGSVZ4cUJGY2l6bnNtUDZEdUxnQWZmOEZVcDYvamxW?=
 =?utf-8?B?d1BtYVZPMXBoYUw1VDc0SjZibGJ5c0ZMZ3Irc2NjZk4vdHFsTS9UZ1VkRDhS?=
 =?utf-8?B?bmtWdm1SNU9VZG03SUw3Wm1oNmt2NHFqaUNyaWVRd0xjZTB4a1dHNXhPdmNH?=
 =?utf-8?B?UkNGOUpxSGFXakcwYTZWS2o2TUNtc1RkOXo4T2hsSlBEbFNEaVJMSzlZVVp4?=
 =?utf-8?B?N1lxNEZ3cGZGbnZoelo2ZS9PditWbFp1RDJGTHBDUUhkd2w2UXpDTm9NNGNm?=
 =?utf-8?B?ZlRUcUFrU3hYUWkvVXZwRU5jRHRQM3NqdmxiZ1hha2JrbmJNNStoTVdDcFdG?=
 =?utf-8?B?OSsrdmZUMEV6REN3RjRjSmZkSDNwNlNUMkx4eUZhREVQa1pCM1IrMG93a0J6?=
 =?utf-8?B?Q2RXbFJ0YjRFY01NUGpwQzByMjVVeHZsVm9qL25mQVlYQi9FaVpwMzRNcmlh?=
 =?utf-8?B?SXFtUlgzQUlFYm1CYWRyb2ZXTVBzOGIyTU80Rm9xdUFqck1yLzQ2K09reHVm?=
 =?utf-8?B?a1J4R2lTYTAveEp2UklQUGtpWm5ETDZ1VXFqS2dhcXdMaG5leW0xcGVzNzFH?=
 =?utf-8?B?OGk3anNXNlllYzZuQU8zR05uYTg5Q2FHekFtZG96d2ZSNm1EWXNka0FZek9M?=
 =?utf-8?B?K1ZvenJCakZ3TTdud2RvL0E5T05RTmgxOXE4ZVN6R0Rha2ZJYUNBbDF1NnZI?=
 =?utf-8?B?bW1yMzh0Z0xIS0lmenR0bERqbVZmZFI4N0hqRWxpUmVYanZ1S1lNcXdPdEQ4?=
 =?utf-8?B?cWZmcWdnOHZQMlFoMVlNaG5HazQ4MG9ucS9qdDVycXpZa1AzTHNoLzB0aXUy?=
 =?utf-8?B?cG5hY1RBSU5ZQTVmdG4xOUFQVHBFbmR4Z09NSjlXV0phOHJuSEtKVlk0aWww?=
 =?utf-8?B?S0FublMzcWUzbnREand6cEFXdVhlYldIUVA0Y3VNbTg4ZVc3ZlJZV3lDUHQx?=
 =?utf-8?B?OTNUMzBSdThnZnl0eUk1UDA1ZkRmS3BoUzR1d1pPYnQrUE1UajBWR2paK2d3?=
 =?utf-8?B?L0pNcWdjMkNpenU0RElMaG8yZU5TSXNXVWFnd0djRm1RTHpScmFMczVxVjRh?=
 =?utf-8?B?ZzFhVWRwNTRSRUUzQytEMDJicGdtSTQzc0JYdUpmdnZTVnlhak5SRURoSm1T?=
 =?utf-8?B?dW1QbUdwcXlucFNSVzRlUG5RLytUZERHTzBKcmVrYUNjbkMyZWtsNTBBdXRp?=
 =?utf-8?B?YmdGbTVZRUR5YzlXdWZKSk5nSDZIVDJHUERpbEhRdEp4ci8wYkdCQTh2RVNF?=
 =?utf-8?B?dFNDQ2NmYUVyaVpSUGhjSFdOMXYrZjg1cC9DSFJoaDZwMElMUVVyVGZrRXdO?=
 =?utf-8?B?WVlwTFZQcFBtZVcvT3NZTHJtMWRUSzkvV0I4Z21qWWNhMk54REQxY0M0YThs?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a58ac66-5cb0-4817-9ee6-08da5e8708d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:05:29.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNEkus+eQMRqyhwfbhSn7nQH9joeCHnLDu9nob10HrJeIqH9j2h3lR4/e/Vm3RoIIfzVX5BbVedQmETrV8GHAOgN2YqrNHs34K7RYrT6tVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, kai.vehmanen@linux.intel.com
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

On 2022-06-30 8:56 AM, Peter Ujfalusi wrote:
> Hi,
> 
> Changes since v1:
> - drop reference to a might never happening patch from the commit message of
>    patch 2.
> 
> Cover letter:
> while looking at long standing sparse reports regarding to arrays of flexible
> structures (arrays of flexible arrays of flexible structures, really).
> 
> I came across these which did not looked right.
> The skl_get_ssp_clks() as some issues and can work under only strict single
> condition.


Thanks for addressing this issue. I reviewed the code and see no 
problems with it, so:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


Regards,
Czarek
