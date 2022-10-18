Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC560317B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 19:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64890A11C;
	Tue, 18 Oct 2022 19:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64890A11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666113591;
	bh=L5rjUgmmbGWuc8XI0P0F41eye0q3Ab3O6Z0D3vWeg/k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mepp0JLN8YeGvryZKw8lZtBcHmJCHf6KeYTvcQ0g34FYdO+BcIvT4T0vnoPA0N3vn
	 Xg1tUdLg6jSSLdJR1XXAnRO/Rsss2gRUPZIvdxiSwkRwO08ICdJhsJTsGmIPFNSYHU
	 pHga3eqk+E5ZJtPKWf2Fo7tdlZXiYKIAsK2Qq+3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6CDAF800AA;
	Tue, 18 Oct 2022 19:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80AC9F800AA; Tue, 18 Oct 2022 19:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABB92F800AA
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 19:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB92F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="myUgGm5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666113532; x=1697649532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L5rjUgmmbGWuc8XI0P0F41eye0q3Ab3O6Z0D3vWeg/k=;
 b=myUgGm5x0kNa0uQcolH20q0GJqXNi3W4r6ugqC8sTmtpGcKsJ01UqGoC
 EsI2emuBPEhjMVDDxi9VS3II8ae8rGXBEZ/XJv4l3wFeN9umTwIf9YxWE
 mpzx5FduWrmLlxUzSgjLYKAVfe42pk8CdyNUSQqtYoVOJ1iT7cfLYa1KF
 MoQdz9P0l35JbG5inc8emURyQ3iaZixOkBpiDP+CC1+tFjt88a8L211wa
 GDr0AjQk16j5b7YXKvSPygITRI/X/PqK8h2nRSmmJ/dS6WJibwPUHuFYj
 JwhvsZ3zmO9HKsOMP/T7B0RmePTRb/lTNMgfWTd7xLGWV31e08pfRMvgC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="289469400"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="289469400"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 10:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="606645091"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="606645091"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 18 Oct 2022 10:18:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 10:18:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 10:18:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 10:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPGHW+BNiPzGluwaOZBvgwuHHbSASWlsX2sIoZOl6NF4lA5WqK4icu+JXSokwI+n4jFUXWV3RdRSCFBQWSPUk++jubsZwG9KvF+zkNwhwp5JGqBnr/Xjv/qS6uXab+GypGoeanue8CyLPqpvtNUPeq14gUFpaR1B6/zbzdrvFjFA3XJtAohbaR7ZlyEkxiRSItoecJl8xhim/O3GCyOQMr1uMxi6rQZSiL+j9JMLSSdQ00J1th6wP+yI1HT5xpPzuv15E1Jn4Z+ouEwgAHlxshx6DOTaHNgYOKPyE0msuXDPKpGbmtIL88lfcq7YIjHFJG6DHM+1uKs/Diz7xPCRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHcQ+rvAPQm6dvvZJnScyFNkNaVuZUe8tQ9yj8zE3ng=;
 b=WiY6sK/H6pwjvEGZZi5QJLrpq10l579sa8XYD/u6/AWF1r3eXB35OC8xD8y/UgVCnNM5UCLWOXU37bDuG5AR7AUfEB6kEIOkqdwgFW7R9tPAlDrmmocdFV+tgQt1dIFVxN252qIm8pIxJ01vBR86tlQED84ksGgj1c4tSstsfO0hoQCAZ310/T5LMm8EcIeL9QuuRxIHkAAf4QhUDZMQhHG6LW71TVqy6hxxq+s60ROqhDodAl9myZr7xhzioFWuk6Nm9BLrv7wTU/3U48D4UyfMv1uLVFEokb5D+9ubUA5Gbc6733PTkdPAw3saUkhM0CV67duZ4Qi1PSFH2xylxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 17:18:41 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Tue, 18 Oct 2022
 17:18:41 +0000
Message-ID: <7a524ae2-7e0f-8a58-bfcb-77d084285cdb@intel.com>
Date: Tue, 18 Oct 2022 19:18:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library
 path for IPC4
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
 <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
 <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
 <b9e10ec7-1c4f-a2bf-7471-26b92616ce14@linux.intel.com>
 <06f141c4-cf3b-f227-2f94-625ffcda79f6@intel.com>
 <522cf594-a56a-6649-9bce-b616bf8f47ca@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <522cf594-a56a-6649-9bce-b616bf8f47ca@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc04f82-6777-4085-6da8-08dab12ccd88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YAgJrI5OXTToQgEmzBiDknKO73G+70OH5gfa6dv8Hbdwu8AeGEScGj3E9SZoPX7OLzbl3MDOOszOSWoPYwkRJBXGxrcN0kmB+T7JQxrzh4RaUxNu2kD2m8DenzYIf4MYsRKbdLTkyb0c2bT06nW7mbmmQHUCI2eS71CknC85dtTP3p112mqrIdkTtCLOONBKQN7h6hZwla1tU7L6qcp+hnNyYhEw6jyJoVUxze0jhTV2p6ikwTX0lQnhGnDaG0FmooxdBTA/fC/hjOhXwF5SzNaHmWN0LymUA2ipW/XwG0uFm4zchBzbBLBMbxx2Kdol4kaqnBrR0gAPC03ufmEo8quKEliOocl03EaIGlAwWGFjGXHdmuBcSESxW0LEyaQfcGeAzBzKqmrZ15OPdUfymhseD4X3OQEF/PmjTfIBsH+cwh7LkeIBaklMiRC4FPLUoLGPkkn6HrJu4B3i6OqCnUL2bkgJ7OnvBLdvZGaZHGCJtI5ie0UA8IjLEFn7LkbGh3VK8aJ9pUzYq/mQdRcLOfquqh3+K66hMO/+ElPW4mb2GVqy5ttDy+rfCUpdanDXLdc9Y8fgd8rZfd41mUG6zbxqZNSwZxCyGi3A8G5vVN0ABqULPzJRiA8qS7TFhUNQejphew2gfya23uJC8YzxuHmDy8dgycBld1BbvzZ990e1oKb6xJ3VTODcZ+KTVL/dVDFhtw+58uzpmnaCSVJmzYSl3s4A1yKwai0bqVJQmI8macCU2qO+sCxPpd3wn/BRSHmQJszV5aHYsIPXFmJIaGWeOTdjngvDGX32UdONa0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199015)(31686004)(82960400001)(6486002)(478600001)(38100700002)(8936002)(6512007)(110136005)(316002)(31696002)(41300700001)(53546011)(186003)(36756003)(6506007)(26005)(4326008)(6666004)(2616005)(2906002)(5660300002)(66476007)(66556008)(66946007)(8676002)(86362001)(4001150100001)(4744005)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXBmVG1JdFZSM1RxNG9OdEpmcDlWK3JaUTltY3RZNy9GREJNMURaUjJOWmpW?=
 =?utf-8?B?ajVqZ3RMZFRkTkRGMDFaZWZNOENZMDBjYlNsVk94YUZvN2NLbFhkN2k0VjVP?=
 =?utf-8?B?VVJKdlJtWnJuMXFBclZsL1dCQi94aEt4bi9aN0ZQZVFDN3l1RjlGbTBtYXd0?=
 =?utf-8?B?dXhVcm5TNGdFQ0lvZEx4ZlYzWU90enhSa0E5Sm1pOFpxdTlta0x5TURJZVBl?=
 =?utf-8?B?NFhJYkhHdm5wRWhCd0ZtekI5UGVwcVN0eUVxZ3lScjdQMjl5aEUxNWN4Qnlr?=
 =?utf-8?B?aWRMRFNhRHUvSzBBTURxVW5aZlZYejBnOGRrdTFZbnhSQXNHL2x5Yk1nZzV4?=
 =?utf-8?B?N21pdXVsbjJTWlBMbGZUSGdlWVJXbnRFbUtvbVp5QmRvTDhjS0tTT3h4Smxy?=
 =?utf-8?B?eUpSZ0lrMnMwUXREekkyK25qOWRIdUc0S0ZhVXBxdU91QjNxRGErSXNydjZN?=
 =?utf-8?B?aFZHQWI1bkF0cE1aMUNTbFdYeTY4N2hoK2tDVzBEbkkxV2tzY3JrNnc4TzV1?=
 =?utf-8?B?YjZKcmpuc09MbGJtZm1lQ2tsZnVHQy9DSUlmRjMvL1FzWFRiVFloRzlJR1g2?=
 =?utf-8?B?bzlRd1Jwak1Odm5wZ1BlT0dnd1BMNE4rOTFsdE9RdGVmbTFLWmtoMnlWRTBU?=
 =?utf-8?B?ZnJtZmNGTWdpaityZzg2ZnNqUFBuRUoxM3kyWDZZejZnc0dOUEZZeHhDK1Jp?=
 =?utf-8?B?UmJnN250disyME1ZbDZvODU0VjhxTW1aRnA3dEtwK2VrM1hVK2Q2VDZxc3Vq?=
 =?utf-8?B?TjBVdWk4YWVtK256YVpuVld2KzlKOHh5bFhmS2Fob1VBbGJhOXg3OUFmaUZF?=
 =?utf-8?B?WlhMcEdNQjBseXAxemc5VmhsWFovelkrUEIzYW9rakkwMCthSTVQQThlem9B?=
 =?utf-8?B?WFl1aDU4cUQrUHNXdmNYcG5kcmRMMERJZjBqc2dTMXl1M21uUklHQllscWJk?=
 =?utf-8?B?YXVCZGIzUnhyWm92a0xJczdGbXNFUkVJdzhEcjk0cTV5UG9BNFB4ekQzSXFN?=
 =?utf-8?B?SjNQbENqaXZ3T2JLckkreWhEa0EzOW9JaWsxN0VJY2JrSTd6V2dYdGpyQmtk?=
 =?utf-8?B?bXhKZ1FyTWhiSThkdWMwaWhBSFZ2czdWYUY4cTNhZXVLeWN4U2VyRDZtSk85?=
 =?utf-8?B?VTVzZmJrckszRFRFenhLR2VsZ1p1dXVJTThYTWF0ZUVlRWdub2o0K0dXZmJ6?=
 =?utf-8?B?dVRBcTMyek1velgxbHJHc2JhUW42K211QVNXaWdtdWFqUDMwMjZmWTBtN1U3?=
 =?utf-8?B?c2tWcFhxZXptS1hHQTAyZ3d3Nnd6R293dUR4dnEvU1J1U2hzamdrWHVrSDZu?=
 =?utf-8?B?Q25pM0tkdGp0cGY4RFZhdXJPMmJURWdyZ1YrblZBTzJHdDgrNWNWaXhqVE9h?=
 =?utf-8?B?dHpBVDNydU4rUlVDdFF1ZGtxMUF0by9rTkdIbU5wSlIzbnZ0MytNeGhVMGhJ?=
 =?utf-8?B?a0RPeE9wWkp4WnhUTU8xVzRIMXhtRHI0NDJFVXEvZ3h3ZTQ1OGF0cS9BVkZF?=
 =?utf-8?B?SFJkU0t2NmRZbzh1ZEczaHpIRDUvdklBS2ZuVTdPYkN1NWNvNlIzTTV6Q0J6?=
 =?utf-8?B?WTI1S25tMW9OWms3ZVltTzBQbUdnLzVIdzR3eC91VHlZOHZPZUp1aTI1VHU3?=
 =?utf-8?B?RnRuOWNhU2VFUDVMMUZTblJrcFN1aDQrQVc2ZXgyWEVhcHoyM0RwZmQ5UEhy?=
 =?utf-8?B?VVpRQ0hMbXMxMmJXMUMzNmlKaWRHb2grT1dSR3dmNnNOQTlYS1BhRTlEWnpO?=
 =?utf-8?B?NW91M3h5a3NETU1vZEJ3UGhjMUlieXhPZ3Ftb1RkdVRzemphL2F5TWY2dG5w?=
 =?utf-8?B?cS9RV2tKb3dSL2JwR0Zkdjc2Uk1WQ2g0MjRiMUpBV3RINVFJWlkxVTFuWjFt?=
 =?utf-8?B?bWpSZ05JQ21MWFMyVi9DMVZ6SG8zZVJaejFqNGl3eXFjOGE0YXVJcGM0NEY4?=
 =?utf-8?B?ZzYrc2NaeE1RTTRYbkRpNlFuSjVLbVFxMXZwdVZQUUVhejNiOG9CT3pyZXp3?=
 =?utf-8?B?VmR1bmhjSnB1MEZEQ3RJTzE5bjlobmROaFNTSDJTVWRRRS8zMFRLQnpqN0tV?=
 =?utf-8?B?dHpnUjc1dHRZcWt6amsvSGRvcFN3NDd1Tkw1UG5KMnZxQkRCRWJ6VXZGSzJD?=
 =?utf-8?B?MXpxSFpnQWN4Y05kbnhhK01Ma0JrWG44MytLVCtYc1pLUjhUTUk2ZzNQbXpx?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc04f82-6777-4085-6da8-08dab12ccd88
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 17:18:41.2075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3h5PvFm/cO4uWqxGuo6ilZakKvQ0D63IHqeigmgrJJ2qOpVBB4Kge+BAdB/yxRK169+eLeGI3Vh3gMDJgFh+Tv3/ADkKR6jA4VkD8YTGI98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
X-OriginatorOrg: intel.com
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On 2022-10-18 6:37 PM, Pierre-Louis Bossart wrote:
> On 10/18/22 10:46, Cezary Rojewski wrote:
>> On 2022-10-18 3:49 PM, Péter Ujfalusi wrote:

...

>>> My initial approach was this as well, but after a long debate it got
>>> revised.
>>
>> Amadeo: have my bow..
>> Czarek: ..and my axe..
> 
> I don't understand what bow and axe have to do with this discussion.
> Let's say civil, shall we?

That's a common LOTR reference :-)


I'll address the rest of the feedback tomorrow. Thanks for the input though!

Czarek
