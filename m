Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB77B2291
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 18:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79DDFBC0;
	Thu, 28 Sep 2023 18:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79DDFBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695919104;
	bh=JM0RXhwaGYNcscLaIWsW6gQ7uv7yWUEdaaNZwtLXqPM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bP6dSKvcen3+v+gMfFz3uIaJhuqxkcGaB+o40uNWSS25aVTgJDCyz8K/AtG7zxlcW
	 FtN+ftDS884fWM2QmDe/13OIsp7Y2Hb2J+1k16brVNn8wbNPiqgxEyQgi14gkoUx87
	 +pr7iL6sFhbOrDb1SFw8hU2GMGP+IN9PUTZl/6k4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3154F80549; Thu, 28 Sep 2023 18:37:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA9ACF8016A;
	Thu, 28 Sep 2023 18:37:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A07F801D5; Thu, 28 Sep 2023 18:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB3CEF800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 18:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB3CEF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BQnu0jI1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695919042; x=1727455042;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JM0RXhwaGYNcscLaIWsW6gQ7uv7yWUEdaaNZwtLXqPM=;
  b=BQnu0jI1+3ZEB0kOfhVEaYVSLOKzGEMaINrPyM/U3kGzwP9S3Gu3tmI3
   CkOKu2lZh4++d8qPgg2Lbu1Rs9xe5qiqtTfakeGVesCzOwvWotYntNFk1
   YZ4GKlThY5R2lYb3HZcgE5pQW7JduN0w81SWpybHgsJCs4ETJN0Iim+H6
   Z+C16fRUP1HJbgphexed7qH+u5llRxz4HVf2zUaax6vaThMFSm35gkgTn
   DfvBN7VbdwhoGwJMe5hjaOGWkBSYxpG/GvEKcSSZ0aWKWHc1X0ugq+0JF
   4PC/nE3zc+/AfdFENfSFUIBFVW5fcxc4mxXUnnh99VCaxNXD/xQC7Zfe9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="382018713"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200";
   d="scan'208";a="382018713"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 09:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923297238"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200";
   d="scan'208";a="923297238"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 09:37:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 09:37:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 09:37:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 09:37:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 09:37:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yfrj8O3tXGDyKe2kFE5nC5Tm28fKyQH1VHJp1iGH7eglZebiz7z+UNN+HEf6+UvxDxi3c3o3VEJ2Ptg831BzwF8kJ+FMfRS2WqLECBuV/vL8nBiEOHPQICtgG0+/2qWac5LFRMsL+tS/k15uXKPHHdNV24IcH2ECbbGuATT/IWnoLR/jw/rXLhF07saaHpEX9qkulxzxPa7QTky0DBSjWiuqwRiMNTrvz6fhyrH2cCpSYazQThgJE98n/YF/1GwEOOFekYi7WXLFtzo7e7wLw25PepWL+QZ3N1n0qZWCURqYeVCAnBFPfjLFlE99nveOHY1EBu6lGDfMKGsxDlzc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3GUDp6Xz6G0VpI5xcc7bdgoiiCX5baqm1/jigxo8ro=;
 b=nogNqJgcoAOo47XFejP9Xm7dCq1FfOGTX9Gx8T/vA4iHnWrcJfv8NiiCUCueEodj903cuYAU9AmMHr6GihsUIWhoI6SpBBr/NnXZXMCorlS/W++vYQENILV+3dKFondwPlnpFy1XqXkiTjZ/Y56+ZnsdajSQEHo4vK9RgDQ1Whebmr6d+OTET3f1ReVOJ/6A/IDm+hDmTVNiMyqBNwWDXruUyAdrVAhcd8bO34cScdq167PUHPO3Yw16o3NsSNT48vjwo77OpGD4P0eemhaAJErvFJgsLyMnBsop3xwGTeNdfwxNpAGtnujbC5dvNZgRREgFYhzz+59A1nZa/TXzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.23; Thu, 28 Sep 2023 16:37:09 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6813.017; Thu, 28 Sep 2023
 16:37:08 +0000
Message-ID: <1393cae1-c811-5f8c-5b93-40255622ef92@intel.com>
Date: Thu, 28 Sep 2023 18:37:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/4] ALSA: hda: Poll SDxFIFOS after programming SDxFMT
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20230926080623.43927-1-cezary.rojewski@intel.com>
 <20230926080623.43927-2-cezary.rojewski@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20230926080623.43927-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW4PR11MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: b84bc1ad-0a36-4212-858f-08dbc0412821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 HHLLUgGsIsU8lWjT7YvVBds4lvOkKDUEGgsa07RHLp1YGrFaRfoBSuFgUh4/tpv6eZtCjTXqDO2cQz1+UjynsB0nMUqAuLYy6aQGkciBov+6DLNasZVHlvcKh1cFKMEXCDpCCbPCc+s+yqxS5vINccvzck/FvW5ilJg50gQNY1L6a0TKprfYt7gTpVCFKQW+pddn/l50PgmjUxOVWBhoPo0KqYVkcSMp0fsiasNnenTSHNn5IhLTt1QSrTW7ZNHUPHwa8+YTTafsDuqlRwKND7npQ+E8T4K6qCbLj093bjkIlwzk8wIWnCn8fnh+x9ECiJdfbxfm3uCxhbWsOI8leYuTpicPNAcE7FNDY7h7cH0lCMsc3MtGTT16n8khDwRCJ2HLQKRlmXGhinjSkTupcsq+dinPBzehc3c3irJxkl1F2V0Z8TvKHBfBxZRB45NX2HcvQO/hxoqJ3sSKWIomyB9S+f6R+vCQL0S4plTV5W5TZJCdzGpiLZoNeUmJiCTlqbIHDKquFzNotE+sgNmu4tNnsZNmdn4G5f2YFJdzzqvr3MbintUrWEnMZYT02HzQ5FCAIrdG/rnxWZKEdGzC1ZstZRSKMmtZCQ1W1hNNeyP5XTgxrB9u3xA57otVizEKYPINmw6pcd0AGtgBk0lrkBA0sdC+BXJnBeJdKdvlE0i+FUC02hrco6kUD6NqkMH2VuM7W5XsHjo+suM2WflVLQ==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(83380400001)(6666004)(38100700002)(478600001)(31686004)(2616005)(26005)(53546011)(6512007)(6486002)(6506007)(82960400001)(5660300002)(86362001)(4326008)(44832011)(2906002)(8676002)(8936002)(66946007)(36756003)(66556008)(41300700001)(66476007)(316002)(31696002)(17423001)(156123004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?dU9JZ2NRejVlZ0lQUU56RzhBSWg4cWsvYkY4RmVDTmJoTGZvMUplSGJFemU4?=
 =?utf-8?B?Z0ZjaVppNWtlaFNTUGRlWkJiR3FlZzNDUHhKYnF5RDBEdWZrcGo2VjB5WXRv?=
 =?utf-8?B?MXk0bERCM3JkQlBaaExiZFJtbVJCckliS2VFb0dPWkluOXV2Vk9pSEgvamk1?=
 =?utf-8?B?N3NiZGpITXowK2lIQklRQWNRY3BBY2I3RytneFZrek5CQms0aWhhdlZiUnZz?=
 =?utf-8?B?UWFLUmNZVGl0ejF1K1JrUW9JbExqSjZpQU5qVFQwYkY3WXNTZ284MjNkQVhq?=
 =?utf-8?B?OUREQk9yZlY2SDlIOEhqUzhMOTl2UjRmNDFjbkN1YUNlRVNSSTdGZ3pBV01J?=
 =?utf-8?B?bC9VRG40aUVrZlBZaDhaR0FQMzAvZEc1U3dnVXA2WlFNT3lWNDFhZzNlOUVK?=
 =?utf-8?B?aDJmcjdEeUFnelJMZjUySVV1dUc3akU4Qks4MTJUa3ArV0IvS2c3bHdYZXRz?=
 =?utf-8?B?QnRQRHJseHljQ0hPUytMbm8yMWRqQ3JkM1RSVEZRWnhIbEdQdnRHWmVGU29y?=
 =?utf-8?B?VWQweFdadHo2d0dRSnpnUHdvNUhZWllQaUVINTBXaVJpbnNsQ1pQWEVSTk9J?=
 =?utf-8?B?SHlLUDczUTlBN0NjaDVQZGdaeDlTTFlWaUZ0SXl5WjkzZHl2TnpMODgyM1ZV?=
 =?utf-8?B?SXNmSERFdkRnKzNaVzEvTW9BaUMzRFhzb0VhTnc5UFZSalNlTzkxL1FEckJa?=
 =?utf-8?B?VTBJNXdpRzBNZ0g4ckMxSzdXNzlXcnZFQjlDNXorU3kwSXBEMm83UE0rWmE1?=
 =?utf-8?B?WHpZR1g3eHJTUGNSTEpPbkFzR3dJVEVrbzQrMGkraSs0aGZvckNrc2xnOWkx?=
 =?utf-8?B?bEFYcG1FYzVpWmVWOGtWcWNmQkNuRmN2MVRYeGJBYzVYekdHU21lZkorTVNz?=
 =?utf-8?B?alBNb1M5NTF5QVBLcjJCUk12RzlIQmNnbmIxTVQ5MUtmenkxN1YzeXZndGxw?=
 =?utf-8?B?OG9XUkxqMlpqd1FQMVA3MXZVbWNBN2JTdzBYU3ZKcGd0VTBEcWdheElqVUk4?=
 =?utf-8?B?dERwQ2xOWkJpQk40OXNrSVBVa2xVYW1GY0JnRGxjRGNiTUJrQ3p4bis3NmNk?=
 =?utf-8?B?QS96RVNpTnh0ZHF5dGpidHpTMWtjR1htYllkNnduekFuRXZ5NUFPbTRKTUxK?=
 =?utf-8?B?dUUvNDJEbHVKcklFckNnSzlpcSsremlBVGtIYkVUZlhpbXRxeDdlLzdnNmlH?=
 =?utf-8?B?OWZXRldZaUJzekhUT2E5T1gvN3FRMzdxeUFaWWlYV09jUktTelZITHp6Y21h?=
 =?utf-8?B?b0RrT0hNM3BXdi9UOGxHSGs1TGJDaFArbHQ1TFQ1ZlhOLzkzSGpEMmZCL1lY?=
 =?utf-8?B?MmNuUlZCaklNd25Dc3FWZlozRlFMTThmNE5Yc3U1RTBLcU95TWFkWWRFTCtE?=
 =?utf-8?B?cnlkSkJId1NJaGMrMzhyMzFTcnp2MFBWR3poVVlQSDQzdkduQWtuMzZuTUd2?=
 =?utf-8?B?ckNydTBkN1JKUHFOSUlWR0Z0Y2djUnlScTM5RGNWQXEzQ3hYcHhjK0t1TEFE?=
 =?utf-8?B?UGd4allQV29rTzhweHBqbFBnVFoybkJJdlZLckJsZkxsRzNCbmYyZUV4NGp1?=
 =?utf-8?B?aHBaemFBUXQzdzBZeHRxR2RCL0hXQmZGekZZeUw5cEZORkF0MEZ3Qk9jMENQ?=
 =?utf-8?B?aTlaU2FxVndHSk5MZkpLZlhRcEZaTmdrby90bWxPMFNUUXoxU1RHd2tIOENz?=
 =?utf-8?B?TlRGc0lsZVdGdVdRdGJNOEkrdjRFRVR4cWJ0OUx6Lzl2NWlVa2tVdHROeVJn?=
 =?utf-8?B?TXZmUk4rWjIyc2RjN3J3K0J5OFdGNm5mRWdJWkFvMTRYa0pwTGxieUxRd1dy?=
 =?utf-8?B?UVIzYU83S01xL0RvNlVlMzdIay9TT3lkNHpsSHQ4UThsZFNibmE0OFJ1RkU4?=
 =?utf-8?B?akd6L0ozelpieVNzR0R2SkZqWXI1b3kzMWFNVk1iQlBOdHhJU3NuWGxrbmZ3?=
 =?utf-8?B?Mk5yWmoxcmI0akI0Sm9sbXpOTUhxaTlsMzhiNmNsMU1BWHB0SDN5UFdoWjUv?=
 =?utf-8?B?Z3RNUnoreEZKcWx2a1NyOU0wU2plZVkrVmhxZld6YmRPYTU3MGlLSUtJS3lK?=
 =?utf-8?B?cVJPbTJRcElRZFJPcFNwanY0OUxyTmtYcEZyb1BoVVdyZVlsb3FxOG94Mktv?=
 =?utf-8?B?ZVBtUllYT01GakhvWFNIMzlib1JJNGkvaHBCUkVtYXJNc2JpUXRHT0FUMnd0?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b84bc1ad-0a36-4212-858f-08dbc0412821
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 16:37:08.4557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZLgH7WXo7mdB1wHFiR2PFQ2prdFQNoPrTZfU2685Kf+7/YzNN5B34vw86kXysuUvJOatHX+x4JgD2O2OBjDAEoBdzp9OtO9mMpUmg1r2AfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
X-OriginatorOrg: intel.com
Message-ID-Hash: ICGK3HJ6SCIYN7FTD4H7WFZIQAX47RGX
X-Message-ID-Hash: ICGK3HJ6SCIYN7FTD4H7WFZIQAX47RGX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICGK3HJ6SCIYN7FTD4H7WFZIQAX47RGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-26 10:06 AM, Cezary Rojewski wrote:
> Software shall read SDxFIFOS calculated by the hardware and notify if
> invalid value is programmed before continuing the stream preparation.

...

> @@ -300,6 +302,12 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev)
>   	/* set the interrupt enable bits in the descriptor control register */
>   	snd_hdac_stream_updatel(azx_dev, SD_CTL, 0, SD_INT_MASK);
>   
> +	/* Once SDxFMT is set, the controller programs SDxFIFOS to non-zero value. */
> +	ret = snd_hdac_stream_readw_poll(azx_dev, SD_FIFOSIZE, reg, reg & AZX_SD_FIFOSIZE_MASK,
> +					 3, 300);
> +	if (ret)
> +		dev_dbg(bus->dev, "polling SD_FIFOSIZE 0x%04x failed: %d\n",
> +			AZX_REG_SD_FIFOSIZE, ret);

There is one (negligible?) side effect. AudioDSP firmware is the one who 
kicks SDxFIFOS calculation when a stream is decoupled mode. During 
firmware bring up procedure, there is no firmware running _and_ the 
code-loading stream is always a decoupled one. So, there is none to 
trigger the calculation and we end up with debug -110 messages. It looks 
like to do this in complete fashion some refactoring is needed in 
hdac_stream.c/hdac_ext_stream.c.

Czarek

>   	azx_dev->fifo_size = snd_hdac_stream_readw(azx_dev, SD_FIFOSIZE) + 1;
>   
>   	/* when LPIB delay correction gives a small negative value,
