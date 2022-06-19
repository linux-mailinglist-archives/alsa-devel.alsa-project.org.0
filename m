Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BA0550B10
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jun 2022 16:00:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3AA619FF;
	Sun, 19 Jun 2022 15:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3AA619FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655647213;
	bh=qEINynFn7W89tpIGq5Ct3HBRPXbdwvueHK/U3+tGj00=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mTYcwiS+IfrCkKlLPyLBuLeyl/39gQNmuA5Gqqaelu2DLg6YzK6E1jCwkLFa2P3+5
	 bVCeT+Qq2Xf2GKslerqJimFh1OnFbfZdoHfILYrELOz/bh/LNMShqC8qOL1MLZ77Ds
	 7sqRD6ThXyCOv8YxodvP8XUaXrPRTUjcJ3fk0Nng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6264FF80245;
	Sun, 19 Jun 2022 15:59:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C849BF8020D; Sun, 19 Jun 2022 15:59:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD3F7F800CB
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 15:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD3F7F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cl05jz6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655647151; x=1687183151;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qEINynFn7W89tpIGq5Ct3HBRPXbdwvueHK/U3+tGj00=;
 b=cl05jz6AHxfMnTDt8AgUMgiknrGLN+D7qJDK3FxkdZvuQYqLM56V35jY
 UQ2gKwu3BDo0nN0rTdmi41bRAX6e1lpYA7NNa5VckKboW/6x4VyfhWFBN
 SFi+K17bPL++nz+bIKQfLMuY6f8wDO1Qrib3a8Kt0uSAWEpKPB4r8Gktq
 ZvInNf8M5VJnv206oWtU3PC8A97sxtde4YuV+d5zKBm3Yc7D8pa8oZlmF
 c9WabWJ+fitw+a0373IqImvMxQsXC9VJZRg+v4d25+T3PTibufsWtlTGr
 QZnxcjIIww/TcOp2/m5WldCAniwTtzI1ihWwL6BD/41X+F38je4QA/vi2 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341414365"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341414365"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2022 06:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="614098443"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 19 Jun 2022 06:59:06 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 19 Jun 2022 06:59:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 19 Jun 2022 06:59:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 19 Jun 2022 06:58:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNy8yzaVMQV0QweYE1EmKBhFDGvrqVpg2udW9Nx9Gih/dvuk+yCQdOz5o2mv4m57si5MIAwBWZKa59mn/ENOPIa0Fc60sqr3MRBREoZR8NCtTpsQsVFV3ZBZ93IqF+qdTPBPWRZpfetG03hopgfO6slNWiTdnNDrLdnLJ092Z5gX+dY88f+Jv/T5xzbBoCfiMRsWG0NMYcbrpOqZwYoV1VM3Vx/zl1ekUfVEBUQrtWYdVLiqpY6fOSNBrRXYWT93evv/28efc2SrrlPJ1tmyYAVTe1KEJ7Ud3cUelUwCeNh7EPFs1aILr3IpKxjYSfmybB0Kf2YBHHS65D3CH9X15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmeXHluB+O50OW5afY/Jqe+lCjyxpwwGIXnJ5c4X1K4=;
 b=V3B3el2bjHd9x8AA5P0dNRgM4a5EppjWtGuEObJyc+64SRcKMqA/i59lTTcSDOyGsf1zjUxggjCP3pGEth/cLHcE0PSRLAZNAdzT5re6KItqcXhQ6aKnhZuIvx8cQAPIGlltJCgR48JcSxPlmMYRHCoLjdVeZsNfUvdiVCIBMc5tpjklaZPQaYVdWulkJScGfNFF9pYXfoMha8HV18GR5Lx6ZzQqLmOITjaA0aZ+nccooU2ptO4ounQZHsx8yJohn4B4NrGRblnEFPCLS+4elz8o1nD5bcEv3t1aOcnb8utAd60xwphnyA/XgmZsxF+nhA1LinlNyevUysKdQmQQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN7PR11MB2753.namprd11.prod.outlook.com (2603:10b6:406:b0::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14; Sun, 19 Jun 2022 13:58:51 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%6]) with mapi id 15.20.5353.016; Sun, 19 Jun 2022
 13:58:51 +0000
Message-ID: <e8c89bff-9962-74f2-dc46-b9a859505274@intel.com>
Date: Sun, 19 Jun 2022 15:58:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2 16/17] ASoC: Intel: bdw_rt286: Refactor suspend/resume
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: <broonie@kernel.org>
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
 <20220613091546.1565167-17-cezary.rojewski@intel.com>
 <dd6633cb-9db5-ee61-fde1-32b4e8d0e086@linux.intel.com>
 <1391e54d-7b6f-7b43-d979-ce08febd2378@intel.com>
In-Reply-To: <1391e54d-7b6f-7b43-d979-ce08febd2378@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0546.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 460d023c-a1cb-4856-f373-08da51fbd6bd
X-MS-TrafficTypeDiagnostic: BN7PR11MB2753:EE_
X-Microsoft-Antispam-PRVS: <BN7PR11MB27539EE8352B798CEB8286FBE3B19@BN7PR11MB2753.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rXTdBs86jIlsvQEgPnI0Mm0DbL2HtJLdSdwIr70qaQcVfu1uxR3dTTdD0IiLLuHyR8oN1pzXElewDwMD2Dy5Ifnwh0o9bbDZacbRoZYMssNwJhJkUVgvZepJjrXrDPeH1CH8asuI1/Lvy6mMSuHjpEhUKhPNa34B/B/YB+YcnWDMMMebicwjkG++2a8fqavyXonjywp3Apiqe6svllwbW0qiuV4kvYbusaHEToAcscGHFfUsNdDseeNGfLtej9UeW+SMzasq/cQeJcdUTXBkL9ymQt245jImMo5c5BC724kq6FQ+kmH1C/Uxl0RSdLoP0olQDWSW4YVBjN+kIqWQKC3/MJWQmqkekGZz7P+VxkIWUKx4Bi8/MXB7j+1PJIsux6hfklA5lDzVynEk5AxQNEj1F8e/vl0XgoQItxuYYOKdgLfHsgnADDgYmsclGKUZKnrSdlQUMCYBJdLC9KFgrxzBhFovM/Mo6f7CF3afTNLIWdB8gBQXPvVpuauhlwV/QsLT7FC2r1l1w1yicBUoBEW6HyPVENh2+nkfHierGwpx3PEnwYzUIREi3QwO7yg5mg7hEibYrmxBC1GXBxYVzI7zscHdxXjEFWRTzYOmsAff6bij5ngYV48bUkl63BfljirLBpuAI43sWsxGmKEpBIRSzxS/5nzUz8Lu250Qb5oSL3j9duyHZDTv/ZGBXcRBwi1quuyNg3sO28ffZAgPrpPJz5SWC2vczUDzS3gm7KtSKPj1nUjpmMuogUTo8K+8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(4744005)(4326008)(66556008)(498600001)(44832011)(8936002)(82960400001)(6916009)(316002)(86362001)(31696002)(5660300002)(54906003)(66946007)(66476007)(6486002)(8676002)(53546011)(186003)(2616005)(6666004)(2906002)(31686004)(38100700002)(36756003)(6506007)(6512007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmVkTm5KWStoM1RRWHBvYmJab0hmMm5CYkNqYTV3TkRHUFRVT2F5dzV3TXpY?=
 =?utf-8?B?TWIyTUF0YzNITmlSMHZIS01WUkx3RGFRdldVSFd3VENhNE4reFpZOUJEeHlS?=
 =?utf-8?B?S1NrNTgrZEhHMVRqL2J4ZHNrcUQ3eXpkMzhuVER2VHZNWnBZWDhLVGFKWk45?=
 =?utf-8?B?WXh0WFI2NUFBOGQwWTF6aUZUY1VLQzM3RklxczNWdllkYmZOOE8xVHNYelBD?=
 =?utf-8?B?cmZibDJMa2pLdHRXalQzZFQvanYxWExLVnpKVzArZjZZaWdRQnFHUmo0NkpJ?=
 =?utf-8?B?NlJjM01UTXdRR1l6UERCMTB0bkJqZkNuTlVab1VWSHZNdlA4Z3VoNStvY204?=
 =?utf-8?B?Ni84OGoyYTUxVEthS00zSHViakVWcUJMNUtyRitBTGlmMDl6VXdJV1d1d3Fk?=
 =?utf-8?B?SHJab2JsN0NLT25HK0pxVEJWN2FBRXpaQS80RjgxZjBPOTlnbTVRZWdKUkYy?=
 =?utf-8?B?Vnp3NnU1emxBT1NYR1hnRXhvc1NrNWN6a0JTaGVua202dW15UlJFVmRDelpU?=
 =?utf-8?B?SUloRVRDQnlhZEZiZ0pZR0Z2ZkV3RlRyd05JNXIrbWJyQU54MG95ejl1blZu?=
 =?utf-8?B?YUlUY2NiZ0s1SW9KR0l0TlJTSHFVM2dCQlE3Q08vWFRDZFcvNk9zbGJ4Wm5T?=
 =?utf-8?B?M3dsRGtOeHNCb25MZFM1NVJueDFzbXZRT3UvakFaUjJoZHNJUkU2bm1IWlpY?=
 =?utf-8?B?M1RwODdYdmR3dkJLRjlzT2lmTXpkU1poQ3YremVzSFVMRmhyR3ZlbmQwQncx?=
 =?utf-8?B?bzIvVy9Lejh5NkpSRks3TmpKa0xvQUh3eWJLbVNGV3lhd1EzVHpNZUxISWFm?=
 =?utf-8?B?cEtLUm9KM3ZlWkxYR1BtSDhySDltdlhVZzFWOFNCTFBiMVNjTmxsSmNXZUpj?=
 =?utf-8?B?WHdIUXVjN3lYeW5zeTlzL0EwZkdkVFNDYjN2VjRGWHZpcFYrNGNoT2hTaGFD?=
 =?utf-8?B?UXdQYUFLbW1XdWpUMHNkdExodWkzc2puQ29aV1VYbmprekN4S245K2RleHVk?=
 =?utf-8?B?YlV4amVqOG5XWHU0YWhNOElaKzhSWkZONnIrbGVCeWtNVzdWZkE4d3pCalhv?=
 =?utf-8?B?L2RaUVNYdXlNQXB5eHQ4aVVrTTFFM0kxTnJkS3JQdVlCMGgzdjJYd21NRkNU?=
 =?utf-8?B?WFlZQzlwRHpqN3dBWGNaNjZvSVY0dzdibzlScVZFNWxFZG1GQ3dtOUdidXMv?=
 =?utf-8?B?WDVFcGNicU0wWGoydlBkdVVvOFBFa0tYekxGVHFacFpoY0VCQ3FvK0dyOTNx?=
 =?utf-8?B?QTU4dVVUTGdYSndaYzNqa21CL09wTys1d3paMGRMNTMyNThpU1I1dzU0Q3ZU?=
 =?utf-8?B?YzVvYTNaNHdCazJwUWtHTE8rVWwxRGxCV1RMa0EzOFpybnBKU1VMU3JlY1dV?=
 =?utf-8?B?bHhpUlQyZW5xV2RZUy9LZnZBcWdacGJGU0hQdVJPaXZvZGpPa2lEdm1Sdy9L?=
 =?utf-8?B?aXRKUXhGbDV4M2NtV1lyZGw1QlQwTTZDQStOdnNleVNpSUZZLzhKSGRtT1VF?=
 =?utf-8?B?c0VEQXVJSEJzV0k0Y1dtNlRKLzZQanU1TmdjanhxYTlIUmhzRzlYRzNQaEhZ?=
 =?utf-8?B?WkI4S3FSNkl3eVByUmhRcXVBUWZFRCtCQ25ISnY0T1B1VEw0TzdsOXRCdzRt?=
 =?utf-8?B?cG9BYVBJUlM2bFVia1J3SHJibGdCME9uLzdVYVNhd2NsQjl4b3NGb094eUZM?=
 =?utf-8?B?MjNKNWo2R2xveVFwSlVqaTA5R1hZczNQOENCZUNPWlFrZ1kxbG85eUE2K2Qw?=
 =?utf-8?B?VjgwbmI5b2o0VWZnS0szS1AxU3NMdFFnOGMrOGx0Q2VHR2c4L3NsMUFjb0JX?=
 =?utf-8?B?bmVIb25lVG1QTy9Rd29OZkNrQjM0Wk16UWVHWlNZZndDSnN4M25lUmxvVWFa?=
 =?utf-8?B?MlZLNFNQK1Zycng0VnQ4bHFEeGxVR055SnN1NWNIKzJnWmxNUXlaRmNVd3Yv?=
 =?utf-8?B?NlVUay83dG5mUVVOa3FuTy9zcjY4VWhyNjByZW5qWFhITUhiZUhrZTZzb1Rw?=
 =?utf-8?B?ZW1hdTJ2TFZoUjFZbmNHTmkvTEhlSithK09sMnBDTHQzNUcyL3ZDRmZoamQ5?=
 =?utf-8?B?cnhkRmFTYWVBdFh0T09KblpRS0VKSkJEOFYzM2RlYzd2Mng3ekl1Rnh0MVQ5?=
 =?utf-8?B?bnpvOE13TG1FT0l1MXVFbjRGODFzam1BVHQyZVc4TUVDZUZQSWhmRU54eFBu?=
 =?utf-8?B?R3BTcUVENU94Nklxa1JnZUZEcVFTS3ZuYXQ0bnJnSE9CdmQrV3ZZYm9rYnJn?=
 =?utf-8?B?VEg0MVRlUTM4dUF0SVdhLzFGaWh0UVZKR2d4TDB5OVA5R1A5c3RRZFUyWDhk?=
 =?utf-8?B?bEJZNzRWalkrRHRGS0tOM2FhTmhjRUtHUnBaVWxsRThRYmRKR3cxTnFuVWcw?=
 =?utf-8?Q?Mxb134S2Ohc3I26Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 460d023c-a1cb-4856-f373-08da51fbd6bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2022 13:58:50.9947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrmEBMEZ3/hza00q3KItHYVujI0F+9owFD+Q0GPXSr7nYwLfyanLSbVrbd93CdTVhtVD9AYeTpXJueit8y8cVor/uWz+H0xSGu9Haz6eYVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2753
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 amadeuszx.slawinski@linux.intel.com
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

On 2022-06-15 2:57 PM, Cezary Rojewski wrote:

> Mark,
> 
> Is it fine to leave v2 series as is, just ignoring this single 16/17 
> patch? Or should I resend entire series as v3 without this very patch? 
> I'd like to address the problem via a separate change.


Please ignore this question. I've opted to use link->exit() just like 
many other boards do and module reloads just fine. A separate thread 
will be opened for the card teardown flow discussion as mentioned by me 
earlier. link->exit() has its own problems too.

I'll send v3 tomorrow morning.


Regards,
Czarek
