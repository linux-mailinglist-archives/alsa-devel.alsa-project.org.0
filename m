Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5546624706
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 17:31:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 564FC1673;
	Thu, 10 Nov 2022 17:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 564FC1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668097876;
	bh=1rF2gwkAXi8U7Z8SgsIjCKhP+qmF2nuq4RsOxDaSnxw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+bgxeowzA2GlmlYi2coWGeDaaF2RK6X2wAb1R9+wau8xYzZ9cqJeNFg4rCHN3efF
	 RBw+DGxijSMdcKaywLs+D4oZdR5CEJWWUZwXuPQfHiUdP3tFNI+PKbQT4Ndgs90Ulk
	 qS2mHjZ8e1G/bQ8QVYrZEvblkPNUq3ml22llL/PM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F18F802E8;
	Thu, 10 Nov 2022 17:30:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD2A8F8021D; Thu, 10 Nov 2022 17:30:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D1CBF80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 17:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D1CBF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RReCOYIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668097816; x=1699633816;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1rF2gwkAXi8U7Z8SgsIjCKhP+qmF2nuq4RsOxDaSnxw=;
 b=RReCOYImIWVAf9GECuIZr4LiLXiSweSp1KvCNzd2m3Af0l5TYt+pU1UZ
 zcRY4CUEtYOOkw9N92i7IPhX9apCf0IYAz3UG8B8ukdK6PQ17wf4BvKY9
 CDg4UNDwJ9nyzdv90YxygDYTOzcyOhYLIuavTOPcTx8czianQYGHKtGo+
 jd34jZwJ7O5d2V9JADH4CFKjyviHZb14WQYeLGoB6WtAfLIIaajzlasTE
 6nSVc+wHUV5a3bh6pPsVizO8niZV12hf93tWDFxKd4echAKx9UuPNaKCB
 cwNdjqs273Os0nbJOeUO7zkyyCR1CX9NH/Mn61wzzCNoXgEaNqh8AZkMr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="375605836"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="375605836"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="700860540"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="700860540"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 10 Nov 2022 08:30:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 08:30:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 08:30:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 08:30:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 08:30:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIK7HF1iJv8vSA1+RyDu8XDHwL0POcFiIUouVXRt2EzfbBDnliBhpWg2yV4UMv3E7y84EMonU1QqqYkp7kehB/3Y4xdWFhDezdj1ECbawOLKIfXC8jLJmTMxUfrEo+uot/MVYCMJYvZybwjYzHSy+GmE7LX3a+ySHtBvDcPlUrvxSrFBdbrJxERSy3FMWk8ZnIUGqG9KQQiZy6GEsOwN6ncBHOmivpscOE/gP5xkrTaYSM4oBl+NsgX2BuCphzzD53hyuPnMBmv24K3hoeEvFnLRz8DlmuJyYZgwOyllms2tcgnXCqO/6aCu5Ny41UiNbRFgD3V4+mOSaJj5SVHbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9m1OR13V0shuxLwTxtuHk97L1MLuW1tTeXRipImzhA4=;
 b=DqSNEyWJgdvFi7V7aBo5PJWiVxPcrpZqATyG9AYX6OfTVl/cJ1bnQG9tKfYAcI/adfPvbtkAX0OuTcKFPCVc7QfTpDCnCPzxAZyYat6lNOIf6MgyUAvqCkQaiFZ9G90/rZin2UPJ4eWgmQCZ+z+ZOWraqKN69dGvmA31+K4Q7jpeM1gAG1wraEeq8FtJCT6HXDcOZxy7V/vlx5Bw2oaxkpfeCDcAvtvOA6OtPhuClBKz5neWxWLWG7zBLIW+LsmsHfQaMQ6m2guM9cPosBaTy/mYf/63UT19TfgNeeBiF9tWBvH7vDcQopAejTKeOpWfZirttldpGiikIYyIflXm1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 16:29:59 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%6]) with mapi id 15.20.5791.026; Thu, 10 Nov 2022
 16:29:59 +0000
Message-ID: <e4aabd6c-ac79-5e72-9012-2abfbc7515e8@intel.com>
Date: Thu, 10 Nov 2022 17:29:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] ASoC: Intel: avs: Disconnect substream if suspend or
 resume fails
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20221110141330.740916-1-cezary.rojewski@intel.com>
 <20221110141330.740916-3-cezary.rojewski@intel.com>
 <6f86718b-5d96-3e73-bfc0-321288e2232c@linux.intel.com>
 <8cc5ecbe-8112-2359-aa90-1d5d1b50d89c@intel.com>
 <d471658b-1c93-ad84-55fd-7c68257bf01e@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <d471658b-1c93-ad84-55fd-7c68257bf01e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 85759ef8-afda-44e8-e0cc-08dac338cf69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /TJKCPkyQSyTArAOpHSpoCsbmf3sQrkAWX3Q1+F7qE85px8SB67wCad8Qpi+wzcIRhZzZIMGZj7HcBNelf4FGrqU7svSF3K+FXqVdn17VqyvK2685uibiia0Khgk/UeLc4anPzHDk3ueD9Ai0QH3szTNgfFjx987EojVhOz+rHl7c6HjY6TOkIJjEkQQMJhTmD2z2xwNAMdwsYo+yD+JTtsT9y/1oM/lyzcE+NoyGPxrBtRHH/VRty8WofSbsOOtGRMb+3c+p+71xPkT0dl0ZZUNjSTFh1VG+9OWGZZItxdNYBWnu6V4W16lLImUthfJV28bEJdpno8E0jzAAFkM8Y8A/CPKiEO1SSd0WE7K5zNu4ncQoPvZWMRMUQTlL0E6acgq6PbtOUbC/ZtBKBMlduoEvDSZDJg1XKDNq0WH28/fjwwLWGgtL42lZBStYxeuB8E6V8WUk+1MauMN+WOXmtZWxxtupHB8bWSPNefL/5S1ythPuMsRACh0G0gOewuKQSjDy9gPyde5Hq6XQK5+yD0XR/Js0h/wbvLRzNGPBYZOI02IjgDGoWu8RQexzagSx1S4Iwzy5s00fsdsR/Rdcx5GMu3S0UVO28JUHQpPczy8oLrBQxmrPkS0mKO7nrzEGye/xyvio1EtYeRFsGA1Z3H5sC0RkPhycyCzvWC+9hza8JM5C7EV1hWFAfB/qadrJ9H9Dqbj2i90FvWpUU1P42l1TeusAvZx0l7qHaiJWPxiChYInBGIg/w9rlPDUn3jyEWmPWuEd5o8tkLz8R4ZToPXtHRZRPX1LdzpEZGuf20=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199015)(31696002)(66946007)(86362001)(41300700001)(8936002)(5660300002)(15650500001)(4001150100001)(2616005)(38100700002)(478600001)(82960400001)(6486002)(2906002)(44832011)(4744005)(6506007)(36756003)(6512007)(53546011)(4326008)(31686004)(26005)(8676002)(66556008)(66476007)(316002)(83380400001)(186003)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzdPV2l0WFYwWEVINjhqejVIeWI5TE01eWowb3p0VzhvYkZkaXZXMkVVSFRT?=
 =?utf-8?B?K3NQYUc3aFl2dnVJM2gzYWJQSG1HQ0F2SWhQUjRaaTdvZ3pObFJvWG9NWmVR?=
 =?utf-8?B?a1J4TUJkR1BxaVBVcDFINEZhVVJIbGc5bm5hZ3o2OFl2TklpNG1GNTFJVEVw?=
 =?utf-8?B?S3pRZkF2WDBDSzVubmZnU1dRVnhINGdaU0U2VHNzS3hrdUdvSzFGc2wza0dq?=
 =?utf-8?B?OXBEeGZjalBsQnh6SnVVOGMycExQSW44eDUzMklTZ2tZZTFXTjIvSmVxa21q?=
 =?utf-8?B?MnBOZSttU25GcjF0cGtjcmdwbms4R3A0OUgxWnN6SzNyOGxYdTQ5VHA1VWM1?=
 =?utf-8?B?RDV1UjhXVnNISk1Za3BPZFRqWXRJUkFta1NYNVRyWWZyUnI1ZldIMDJteHpu?=
 =?utf-8?B?bXRDTnI4b2NlSXNSRUs5WXQrWDRUQ0pKSEhsbjlLWlgreVlDZGZja3FmTjVU?=
 =?utf-8?B?QTJaSUlBZ0NhWWdDVEN4cmJRWTQvampmM0d3YTcrbkFSZDFHWFBDTXpjY1dI?=
 =?utf-8?B?blQvYkFtUVBmWlM3SzMydzVSbU0yRUVrRHJ0UmpqaUR2aEFQU1d4dmlFUFNT?=
 =?utf-8?B?bTc4L0l2Q3pkV2tyMEd4WDdsRUpOdjdJbWlHS05CTm1sT0xYcFNjZWdYS0t2?=
 =?utf-8?B?WkRMZ1J3OTBQK3B6emtZQWErSmtaT0pPUlV0L0pJeUR6NWYwWGRoTG5QWU5Y?=
 =?utf-8?B?M0hXdC9oT2VVdUY4SUZIczlRWnB3OURNL0pRM3VpWi95RkNqc2xTMm13KzZ6?=
 =?utf-8?B?UmNVM3N6ZjlYcXZ5eDRQbDI5YW11eXF0TmMzbDBTbkdEbkErS3VtMmxnazlh?=
 =?utf-8?B?Mk9QdXE3YmNZNUJCMExScFV2eXA1WE5vblcrMU52MUFsTkREN1ZIdkhXY2xp?=
 =?utf-8?B?WGF3VkR3MXFUeXZreDIzamJFa2h3NXlZcHU0QWZyM293Ymt0TDN1aUZwazl1?=
 =?utf-8?B?TEUyOTdpR2VTbGFDdHBuSU90aXdIVjc5WHJ0WS9NdDlVc2JRVkZtTHhlR0Ev?=
 =?utf-8?B?Y0MrR3BNZTgrVzVOL0YzdUtLcHZUV3lteWNrZGExMXpkd1ozemRTSkl4c2h1?=
 =?utf-8?B?NW9rODloUUNyOE9LbllnTU5hMm9TaEJ3SkJEMC9HMXR2NmNtUnJFMkw0Uit3?=
 =?utf-8?B?MzFVeFdaTFRXZURlbXFscXhDS3h3V2oxY0dQemZpc0lTNWZJRFFKZWN1czR2?=
 =?utf-8?B?T1dKRUE2Qjd4QUV4VWYydlh2RmdmYzA4ek1vZk5yWExta2xzWXJxdm9lMmdQ?=
 =?utf-8?B?U21yTnZ0eEx4UWtUb1BxV0FWZ2tmVEhJOXEvdUg4bUYyd0dlcUh1OW41ei9B?=
 =?utf-8?B?ZmYyK2Q2SnZUUHUrT2Zrc1h6eTBHYXN2ZjJhZkQyaUEwbHozZElFb095OVh3?=
 =?utf-8?B?T0xCRFd2VWRHYkxHcW4rT0V0eU1wOENNSEZTbEdqd1l6YWd3SS8wSndaWVJW?=
 =?utf-8?B?LzlTWDJsOE0raU9VdFlvYnZTUUlLWThtelJTSDhHSjJWZnFwTjVRTi9ZYlBM?=
 =?utf-8?B?VE0ydmEvOTRiNlJabjRvZ21uaHU0TnVKaTN6N3d0VkRFRmxPRm1CM3pyRHJm?=
 =?utf-8?B?U1Vsb2dWdWltWHo3UVk1R0x2a0F1TGxPOFR4MXR4bVFCTkdIdFlNSGFyRGtx?=
 =?utf-8?B?cjFTdHhQYlcybVQwYmlHNTIzTERUZU9PVTZxelhtRWRDRjNuVTc5dnpFc3ZY?=
 =?utf-8?B?b0hXZ0VkWjcwbGpKZ1NWb1c1c0ZKQlNtR0wwYzJBZXFGeUR2VzhPSzFWaWV0?=
 =?utf-8?B?RUlCVEZIbmVyRXFhdUw1YThFendBSGFpUFpqZ3lDb1lmeHV5MDVYQWFSRk9o?=
 =?utf-8?B?aEp0bFB6UnM4TFdBZDVLcmUyS0k1Z2tjL2pRSVRPaFhWenY2cW9oRmE0TmFL?=
 =?utf-8?B?YXBiN1U2S3FiV1Z0K3U4bU1iZWZPSjRrdVNaOXhZT2ZySEFqSUdILzdWekk0?=
 =?utf-8?B?c1BXazltdVpSRjZUemRpdnpFYSttZTRJM0VkWTdGSDE1Rk9uWUpkaExKdVJO?=
 =?utf-8?B?WDV0L0U2cFNZR3lVd01uU1dZNVBBTlZyYU8rc1RwZXBBV3FQSU1LZUl1U3dh?=
 =?utf-8?B?dFMzZTZ3ZEVrVks0azQxLzFId3ZocjJUNlAxWktkMlpqRjRWaVRsRDU3VVQz?=
 =?utf-8?B?YjJLRzFZK0VOem1vREdzZVN6V0hVUkVMdmVzY0N2WnRhZDQ3YlJFUzBua2JY?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85759ef8-afda-44e8-e0cc-08dac338cf69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 16:29:59.2847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLBS0GMiJoSxamRduIlfoeskkyQg2zB1hs1PSD7kULf/5bvhysTDCFvnqMhfcL/+V+O/AY0Sm61GF2EbzAt3da6HV/fmEbZvuyU/p9g6Vh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6521
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

On 2022-11-10 5:18 PM, Pierre-Louis Bossart wrote:
> On 11/10/22 10:06, Cezary Rojewski wrote:

>> Unless something new has been added/updated, there is no runtime->state
>> field available. All the PCM code works with runtime->status->state.
> 
> cd sound/
> 
> git grep -c 'runtime->state'
> core/compress_offload.c:27

...

> git grep -c 'status->state'
> core/pcm_compat.c:2
> core/pcm_native.c:4

I see now, thanks. Commit from late September "ALSA: pcm: Avoid 
reference to status->state" add a new field. Will update the code to use 
__snd_pcm_set_state() instead.

My base did not have it yet.
