Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7FD489D7E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 17:26:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EE1C839;
	Mon, 10 Jan 2022 17:25:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EE1C839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641832003;
	bh=0PV54isHppwDXhcO35zTnWPc6yREwW0gEcWYdTr5f5Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IeB42X4YIwFoQ/MflL/e/DB4P6fzZl73JUhO/o3w/vqA9LQRvGA2Ft2Dr+zOsecQ6
	 cEnvZDv3yu8b/hbS4lN7c5h33D1nsNF+I8/Ypc70Joln6ifoSRQrqKjes49yweBOkC
	 LEQKHd2LHq04haybfIQP0sxTfQWUvZzpRnvDw8yM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A17CF800B6;
	Mon, 10 Jan 2022 17:25:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADCF2F8012E; Mon, 10 Jan 2022 17:25:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20DF2F800B6
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 17:25:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20DF2F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y4JKYA8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641831931; x=1673367931;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0PV54isHppwDXhcO35zTnWPc6yREwW0gEcWYdTr5f5Q=;
 b=Y4JKYA8ylqTtQX9Zsa6bsmTkv9o/0f2zPGpx9aBEwIfvm9uA3EvdRiWg
 wUSHEzTqzS4hYaylAaUMR5/Ocrmhqz5T8WWpb4kzqgoufJoUuICj95z/h
 5bRgneJNaYgvE/SzvolNyLlN9hQkEbDkr+ukCH5eW+30h+9VTLSg7ARV/
 1ly+drtNf/z+S7b9JRcPYITRQgtVwxiWkPzHvoxzCd8SP77ZCzUYS4q/i
 2/dvyQXI7nYpsh/jcHajymNMFi4KAgeivPM7e+vSyRpWHrD67xGEbzo1r
 24bO7mDCSO62RrpQPry+/ES96f2IayC80fli3OitNQLp32BuwaU018/SA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243212715"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="243212715"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 08:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="612896723"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2022 08:25:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 08:25:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 10 Jan 2022 08:25:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 10 Jan 2022 08:25:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqRkjTA73pgybsHd2T1ec01f1MMj0vIiYeVonY/tghOHaqAYXBhDtB0u0CQriqHvJG4JbQenUI+mymOT3+5W1aGYdjDaCmR8h5dmmhPIhgLwVKDfqw1emDXbXw2iZvoi2IENr28aaVFTV8JpKQwbLoXRmM0qPA4+tUEpU/d6dhHWpYbS6tZL40W6EgX/ymxCW02bcgPFSKV9/zVirLm1Bmrl2roS1phNNEfNneBdzpsqUZirNlNdAP0fHUOXxbhklMvjMcM9lPcTfPIefRRVX6j17/VHdYquXOaSZ8/v2QsEqrbqThv3DPyBC9nddc4/8e7L3/xP7i4oBcCLx9hO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3O7/Y6yZgQPaVJqfCNFqtyJ+7ft8r3xEE8svXnHgOdc=;
 b=oC9wLdmvgRz+9tgcWRhCPOoSunQ9tmJAwlkcin834+f034A8x693EbiLN3aeyAdN/WRndykpGsVLy25EJyvyNIBdU4AM1nOAMC3EG2c5HO/QMVzkmKi6BFL0JxwupLY2lANjpX7lrmIgDbNI0sKBYTLsKcZWvHXZ49Qmcp1J2C1CBvSYmA+roPf28+hfBxDc0K4+WjbSFORleBMls7vR4gP+n9RYLs0J9eOHRgDiky3wJCy5Vm6Ki6y6E1rPnMrppF6ckQXYYGXGTR0ueNxvupBEVokg7OCXJI5z2+AJTpP6aafnbCe8I4434+r6lE5o3YvlpzaRAG7GObS4iOw1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR1101MB2241.namprd11.prod.outlook.com (2603:10b6:405:51::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 16:25:20 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 16:25:20 +0000
Message-ID: <8f62aa37-c2a6-1a74-6e6f-5208b10b96ec@intel.com>
Date: Mon, 10 Jan 2022 17:25:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH v3] ASoC: adds component driver for TAS575xM digital
 amplifiers
Content-Language: en-US
To: Joerg Schambacher <joerg@hifiberry.com>, <alsa-devel@alsa-project.org>
References: <20211029095414.29131-1-joerg@hifiberry.com>
 <20220110084554.2228-1-joerg@hifiberry.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220110084554.2228-1-joerg@hifiberry.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0005.eurprd05.prod.outlook.com
 (2603:10a6:203:91::15) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc32b284-3de9-4d61-a78f-08d9d455cb77
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2241:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1101MB2241BCE27239C89E8E269657E3509@BN6PR1101MB2241.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IG4gKqyyeDmNID6OiN5FHzxAVdDnpUQC92NYjKkHU5ySnd/oCqEyLC0HBNEQbXOBvGSHnKyXtgwAdPinsrd/wFj+wtNfCUtPknz4IdrV4oqlAPAXRBfGzDZWv5h3shQmDhyKROtDvjwqp8WgAGdGVyZbA2LTZ5DBSpCl52cc3Fc+8u+lahM8gBLWyKyc+qz9ILljoO3sqMVsFSWVUx2BSyUfSO6v0+LoZtjN/4BlwMXk3DL9sqjMCBXldbhcB/AQHwLLghY6n1QWgnj3rDePb3PQSuyAdZdnKcIUe5PmzAsxH6OAgXDVz5OEm2BdyeWYiajA0RsxqyqBdI/SPSSKt5na9Pp4bGlcrwGPVdbbpcxERFbG6e4oE3A5BpjmczfZ91Wr/kiAH7tipYR+XLHBz49lpbiO40hSIkVqpED1LM9alkf5ABP/sK8Q/Kb93Aqb06xCNMfC4T3eXklRD1kdDBVxz8bPYb7G6+exdt7ojbF/+zNvu/+/Y4d7NNW9RajH2C2S0ptF0vBhzK8VkxtzrCZ26iLNOOmSk7YVrnX3BqoAzHiwNh/fNkNpldkiLvgKDNu8qtN+EoxI6Hj2dwJ2kbC1oTSL+NloLTK7sLrheHwsslEYQOPb9AyclN92Nhfo8QlicyYZXgrqIqDzb5Ae2shWYGdeug1geksaVB00m1AxOFvAo7VGoznDoMtvSXVNNgEz8Zy6fYZArbSYw0fFODmxs39oDdHXjwnhWCQ3AbWTKKm/yCYiC7NqfNY6FvvuPwHzkfRHOICCziUsmavwcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(83380400001)(6666004)(508600001)(36756003)(316002)(86362001)(8936002)(8676002)(6512007)(82960400001)(2906002)(26005)(66946007)(5660300002)(66476007)(66556008)(186003)(2616005)(31696002)(6506007)(31686004)(6486002)(53546011)(4326008)(44832011)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZaM2lLWEdQczBNR2JtSWVja25KMTUxcHJZNS80UllRbFg5SUhtOWgzVkRE?=
 =?utf-8?B?SG9XcVlIbEorZnB3QU5KTVJCV3V3QmhOZCtLTE1CQmdXazRGMjRTNHRnaEky?=
 =?utf-8?B?SWRncS84dGJlQ2VheDVRUmQwcXA1OFYrSVpIUi9ZK1MzWGY0TjRXcXU3YVJ5?=
 =?utf-8?B?T2c5eGpqYlA3MW44alB3WlRtZGcrcEVVOW1sVUEvdzR5YmsvRFB2aVF5SWRz?=
 =?utf-8?B?cGVFeVpsbVVVSjJJWGZKSFFlcGlnVFk1OWx3OG0veHVpZERGM1VONGN0RjNN?=
 =?utf-8?B?V2hiakZHRGZScEErTzhpL3hOT3A5a1djWVBDcDBFUnFrVTgwTWhBVzU5a1FF?=
 =?utf-8?B?aERNbk1qT2JvWDFGdmpHbXBtZDlqd0R6TElDQXc0N3h5SlcyMjNpUnYxNjRR?=
 =?utf-8?B?Q1QrejkxeXNwRnNSbzNuZzhmK0k2TkYxOElnM09CMjNIRTllTmJieURveGZz?=
 =?utf-8?B?MGdqSHZlbTE5Uzh0VmxLSEk5cEhXTlppa2FvSjNJV1pCSy9VUXlWb2tVMmQ3?=
 =?utf-8?B?Mk1MWml4ZG8xN2NnclovclpWSmlGY3ZPVHM2ZlRxazJSeUsrVFN3eFcrOEVs?=
 =?utf-8?B?M050L3RvT05pZDJnTzZpQ21peWdqR1VSYUwzK1BGL0FrSU1PTzVMeno5NmVE?=
 =?utf-8?B?Mnphak81NVB6TDh3YXVXT0NYejNCVjFYZVZtUE8yaUVGLzBpWjF1WWRIMk1w?=
 =?utf-8?B?UVdxTzVDdktZNDdqb3lUUld4aU92WlJIenFhWlk1N0IwSTlkVHg1T2RaU0R6?=
 =?utf-8?B?NzFiRm5na28rZk9vMUQzQzN1L2RCczRKdzRRY2grL2I2M3JpbWhQa3BFVHpW?=
 =?utf-8?B?YkYvaWozQ3Y5NVlsb3NQaFdWWmdMeXc1ZXhUY0JvT0V2TndUelB4RkdOeGVR?=
 =?utf-8?B?SDd1dC9IYjlOVzdmOG00ZHo1bzdWQ2diN1NVazRHbjRUckdQMmczc3Q3WVNr?=
 =?utf-8?B?OTAxN243WDdwUmdDMFVKbFZQNi92QitvNUVaeDRKOFJLMXR2b25LVHdYcXNG?=
 =?utf-8?B?RXFuSXJTOTdLN3NYV2kzellZeVVKRTQ2RTV0ZE5ibTVNbGY2RnY1b2MyWFEz?=
 =?utf-8?B?ZHVxOUtDdWxhc3Rid2pHdUtqY2ZZdXNJRHp0NW1zaVQvUU1QZ1N3VFcyRDlZ?=
 =?utf-8?B?bnZWOG1KUG5nbUJkTmVUcHJkemRPM3RyTjJJaCtHMHNQMWZpNTFpeUlnOUNl?=
 =?utf-8?B?NENjQ0JZQ3dzWTNFSFdRbXFOb2RTa3FBUTlCWWQvcFlrVHkzWHlEb3ZEbWJn?=
 =?utf-8?B?dGVPYnlHcG5DMTdjL3U1Zys0eENwTUNuYUkzaG90Zlk2Z3JyZ1VoQ3U4NXlM?=
 =?utf-8?B?dS81SVQ4T09pUklyUGFHUEM5WTNGVzZzSWdpUnlORE5LQjd4UmVDb1BIZDhS?=
 =?utf-8?B?d2FTTE01UGwwdlJpWkdkOTZDTEplOUdaSDZuQU82SjZkWnFLZnZybUFoN1J5?=
 =?utf-8?B?cCt0aTdCMm95Rm1lRnpTRWVIaHBnRFpIOXdLa013VkpHczkyYUFNT3dnNUVl?=
 =?utf-8?B?WnpyTmNpd1NwaiszZTNkaGNxamJzaUI5N09kK0VlbU1HeWpIcXJNN2JTeUw0?=
 =?utf-8?B?VVh4L2p5a1JxaS82dTJJNXZ1YlVFQSthaGo0Q0plY05WQmxFaENNWDdVUEFJ?=
 =?utf-8?B?L2dtQlhES0MyeDhWOENjZ2xLUnJsRWhxTTFLZmlyc201eVZrOWxYUU1IMXUv?=
 =?utf-8?B?OFpVU1dZajArdjFobnFrSklXWDZoUGNkMmlBZnZwSms4RWpQUWRqM2NlL3RM?=
 =?utf-8?B?cDRWLzRRVkRJTFNqd1lsQmlERnEzTlVkUGVVMzVIOTFhYmY2RE5ieWlWSkww?=
 =?utf-8?B?K1luVDlPNWxEa1dGY0tXRzF1R3EwZ1IrWHJ3RFRPOHNVVEhKVXR2bGtFVUs0?=
 =?utf-8?B?UytvNzB3YmpEV1pGNkdldkdVZFdScWZ0eFBwc1gxZDNYVkhjYTdsVnYrTStP?=
 =?utf-8?B?dDh6UzdjdjRkeDhhdHZQemQ4M3ZTWEQvbGt4K2kycDVMT2ZLc211eFFGRHA5?=
 =?utf-8?B?NEltdHY2MmlCWklWdEZaZS9DcEhhaXZ5VGVGNTdwcHZkUHNCL0tFdXJJSzB2?=
 =?utf-8?B?L3dKOW5zL2hrKzhWRytjM3U3TVU2Q1hQMmYwcElSQzNOcnM3M2ZXN1J0Z1ZL?=
 =?utf-8?B?Yy9kUjJTMzVlSHRtM3FENlRsem5ueUQrN1VLWUFhZ3l0a2tZL0dEb29hdCtD?=
 =?utf-8?B?VWYvVmpQZnRMZTkySS9pVk44Mzh2eFZCcklFZ2hLWXJPSnFWdjM1aUc3b1hP?=
 =?utf-8?B?eXZ2Y29rcFhtRUp1aW44cXBNOTlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc32b284-3de9-4d61-a78f-08d9d455cb77
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:25:20.4268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8tm92qPpZWLr7iVizlVM/ZhWpfuUA61cl9CF8zX5K/ex+yvcwRn2blz43mNfp/h/Rj645YwwYTI68MiCg3jkSYcAcS8RAgXO+rhnzNrHwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2241
X-OriginatorOrg: intel.com
Cc: broonie@kernel.org, kbuild-all@lists.01.org
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

On 2022-01-10 9:45 AM, Joerg Schambacher wrote:
> Adds a minimum component driver to run the amplifier in I2S master
> mode only from standard audio clocks. Therefore, it only allows
> 44.1, 88.2, 176.4, 48, 96 and 192ksps with 16, 20, 24 and 32 bits
> sample size. Digital volume control and the -6dB and +0.8dB switches
> are supported.

Couple nitpicks and suggestions below.

(...)

> +static int tas5754m_set_bias_level(struct snd_soc_component *component,
> +					enum snd_soc_bias_level level)
> +{
> +	struct tas5754m_priv *tas5754m =
> +				snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	switch (level) {
> +	case SND_SOC_BIAS_ON:
> +	case SND_SOC_BIAS_PREPARE:
> +		break;
> +
> +	case SND_SOC_BIAS_STANDBY:
> +		ret = regmap_update_bits(tas5754m->regmap,
> +				TAS5754M_POWER, TAS5754M_RQST, 0);
> +		if (ret != 0) {

I believe we are dealing here with standard API function i.e. 0 on 
success and negative value on error. And thus, 'if (ret)' suffices.

> +			dev_err(component->dev,
> +				"Failed to remove standby: %d\n", ret);
> +			return ret;
> +		}
> +		break;
> +
> +	case SND_SOC_BIAS_OFF:
> +		ret = regmap_update_bits(tas5754m->regmap,
> +				TAS5754M_POWER, TAS5754M_RQST, TAS5754M_RQST);
> +		if (ret != 0) {

Ditto. This also goes for every single usage of regmap_xxx() in this file.

> +			dev_err(component->dev,
> +				"Failed to request standby: %d\n", ret);
> +			return ret;
> +		}
> +		break;
> +	}
> +
> +	return 0;

You could also drop the 'return ret' from the if-statements above - 
granting you also ability to drop the brackets - and instead return 
'ret' instead of '0' here. Of course that means 'ret' needs to be 
initialized appropriately at the top of the function.

> +}
> +
> +int tas5754m_set_clock_tree_master(struct snd_soc_dai *dai,
> +					struct snd_pcm_hw_params *params)

Indentation seems off.

> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tas5754m_priv *tas5754m =
> +			snd_soc_component_get_drvdata(component);
> +	static const struct reg_sequence pll_settings[] = {
> +		{ TAS5754M_PLL_COEFF_P,		0x01 },	// P=2
> +		{ TAS5754M_PLL_COEFF_J,		0x08 },	// J=8
> +		{ TAS5754M_PLL_COEFF_DL,	0x00 },	// D12-8 = 0
> +		{ TAS5754M_PLL_COEFF_DH,	0x00 },	// D7-0 = 0
> +		{ TAS5754M_PLL_COEFF_R,		0x00 },	// R=1
> +	};
> +	int ret;
> +
> +	/* disable PLL before any clock tree change */
> +	ret = regmap_update_bits(tas5754m->regmap, TAS5754M_PLL_EN,
> +				 TAS5754M_PLLE, 0);
> +	if (ret != 0) {
> +		dev_err(component->dev, "Failed to disable PLL: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* set DAC clock source to MCLK */
> +	ret = regmap_write(tas5754m->regmap, TAS5754M_DAC_REF, 0x30);
> +	if (ret != 0) {
> +		dev_err(component->dev, "Failed to set DAC ref\n");
> +		return ret;
> +	}
> +
> +	/* run PLL at fixed ratio to MCLK */
> +	ret = regmap_multi_reg_write(tas5754m->regmap, pll_settings,
> +					ARRAY_SIZE(pll_settings));
> +	if (ret != 0) {
> +		dev_err(component->dev, "Failed to set PLL ratio\n");
> +		return ret;
> +	}
> +
> +	/* set DSP divider to 2 => reg 0x01 */
> +	ret = regmap_write(tas5754m->regmap, TAS5754M_DSP_CLKDIV, 1);
> +	if (ret != 0) {
> +		dev_err(component->dev, "Failed to set DSP divider\n");
> +		return ret;
> +	}
> +	/* set DAC divider to 4 => reg 0x03*/
> +	ret = regmap_write(tas5754m->regmap, TAS5754M_DAC_CLKDIV, 3);
> +	if (ret != 0) {
> +		dev_err(component->dev, "Failed to set OSDACR divider\n");
> +		return ret;
> +	}
> +	/* set OSR divider to 1 */
> +	ret = regmap_write(tas5754m->regmap, TAS5754M_OSR_CLKDIV, 0);
> +	if (ret != 0) {
> +		dev_err(component->dev, "Failed to set OSR divider\n");
> +		return ret;
> +	}
> +	/* set CP divider to 4 => reg 0x03*/
> +	ret = regmap_write(tas5754m->regmap, TAS5754M_NCP_CLKDIV, 3);
> +	if (ret != 0) {
> +		dev_err(component->dev, "Failed to set CP divider\n");
> +		return ret;
> +	}
> +	/* finally enable PLL */
> +	ret = regmap_update_bits(tas5754m->regmap, TAS5754M_PLL_EN,
> +				 TAS5754M_PLLE, 1);
> +	if (ret != 0) {
> +		dev_err(component->dev, "Failed to enable PLL: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

I'd suggest to keep the logical block organization cohesive. Especially 
if there are several of them all located within a single function. Some 
of the do/check/error-out blocks above are separated by a newline from 
the following ones, and some are not.

Another point is the cohesiveness of the error-message format. Some of 
the above print value of 'ret' i.e. carry additional value whereas other 
skip that part. Is this intentional?

> +
> +int tas5754m_set_dai_mode(struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tas5754m_priv *tas5754m =
> +			snd_soc_component_get_drvdata(component);
> +	int fmt = tas5754m->fmt;
> +
> +	/* only I2S MASTER mode implemented */
> +	if (((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_I2S)) {

Maybe I'm missing something but the most outter pair of brackets is 
redundant.

> +		dev_err(component->dev,
> +			"DAI format not supported (I2S master only)\n");
> +		return -EINVAL;
> +	}
> +	/* TAS5754/6m do not support inverted clocks in MASTER mode */

A newline before the comment would make this more readabile - that's a 
new logical block afterall.

> +	if (((fmt & SND_SOC_DAIFMT_CLOCK_MASK) != SND_SOC_DAIFMT_NB_NF)) {

Again, I may be missing something, but this looks like outter brackets 
are redundant.

> +		dev_err(component->dev,	"Inverted clocks not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		regmap_update_bits(tas5754m->regmap,
> +				TAS5754M_BCLK_LRCLK_CFG,
> +				TAS5754M_LRKO | TAS5754M_BCKO,
> +				TAS5754M_LRKO | TAS5754M_BCKO);
> +		/* reset CLK dividers */
> +		regmap_update_bits(tas5754m->regmap,
> +				TAS5754M_MASTER_MODE,
> +				0x00,
> +				TAS5754M_RLRK | TAS5754M_RBCK);
> +		/* ignore all clock error detection but MCLK */
> +		regmap_update_bits(tas5754m->regmap,
> +				TAS5754M_ERROR_DETECT,
> +				TAS5754M_IPLK | TAS5754M_DCAS |
> +				TAS5754M_IDCM | TAS5754M_IDSK |
> +				TAS5754M_IDBK | TAS5754M_IDFS,
> +				TAS5754M_IPLK | TAS5754M_DCAS |
> +				TAS5754M_IDCM | TAS5754M_IDSK |
> +				TAS5754M_IDBK | TAS5754M_IDFS);
> +		break;
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +	case SND_SOC_DAIFMT_CBM_CFS:
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int tas5754m_set_dividers_master(struct snd_soc_dai *dai,
> +				struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tas5754m_priv *tas5754m =
> +			snd_soc_component_get_drvdata(component);
> +	unsigned long bclk;
> +	unsigned long mclk;
> +	int bclk_div;
> +	int lrclk_div;
> +	int osr;
> +	int ret;
> +
> +	mclk = clk_get_rate(tas5754m->sclk);
> +	bclk = tas5754m->sample_len * 2 * params_rate(params);
> +	bclk_div = mclk / bclk;
> +	lrclk_div = tas5754m->sample_len * 2;
> +	osr = mclk / 4 / params_rate(params) / 16;

Is there a specific reason as to why these magic numbers aren't 
defines/constants?

> +
> +	// stop LR / SCLK clocks

Formatting of this comment looks odd. Please align with the recommended one.


(...)


Regards,
Czarek
