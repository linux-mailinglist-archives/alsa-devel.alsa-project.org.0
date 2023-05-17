Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9320706977
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 15:16:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4836E1F7;
	Wed, 17 May 2023 15:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4836E1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684329392;
	bh=AOD7fydj22lOZtx/FZoEUwKZWxVluciCVhpUjuTg3Es=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gbc4B+4RQqtqnnNnjJZFWSGoYQ2Wggb4uiYBhKjgtyz51bSRji+mUePRlBjM+b2vy
	 q1ksYUsIYck3Id0/OCFPTg4RrBIxOosvlIF5npx0V+7riHpvh5GxGtEqBxbwmZb6V0
	 my7RPjVVTp3+wGAzW4gLwwv93pkU73GPcXa0h2gU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8793CF80542; Wed, 17 May 2023 15:15:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13692F8025A;
	Wed, 17 May 2023 15:15:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C203F80272; Wed, 17 May 2023 15:15:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21690F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 15:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21690F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jgh/F9ME
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684329330; x=1715865330;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AOD7fydj22lOZtx/FZoEUwKZWxVluciCVhpUjuTg3Es=;
  b=jgh/F9MEMcmUe2YGAUxy+wIin1LKhLg1pZvDNoA05W3pYqO4zgICQ4CD
   NXsYi/1nT5IjNurBZnOgS2vzr1XYP89s4EJZfCogrkYe6jKyAeBm5NcYA
   ZQnwDUuSJsZIshMoCjiucP8Ls8CjSjuWpYPL57J6bcxGN0nGbIW3MzFcW
   AdoC2UJsriFW2T4rO/1E29SHp7s71DeGWqhVoyNV8+adUzXAOy5Q45zI2
   R8hJTHqrtjk3zgLmdqfbfO/deJFvmc7ETlDqwCibSs2UTAnbkJmpjTAia
   7IMM2tKW2NIrsXwm1iUYvBwte5qGJtIDHGs6vR7+dNp95Hodk6u7x6MXZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="332115462"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="332115462"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 06:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="732424262"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="732424262"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 17 May 2023 06:15:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 06:15:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 06:15:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 06:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guB6STp8MJaU4/aQxej9IiwI5sPocp+H/IVthaNzDFn0MutgLjRO/EIL8yutYev/2xZyddwFuYExDdk/cS0OUS5jYDr/knP1BCVMapcK4G6vnaL4THHE6mQez6uj5d05z46Yd+VaTKEZUP0ZPI9+jPumjD8RG53IMVWvSaiP8phGcicfMbHW+eAD59qJeaMdXoi8at/BY3EhH53ufsLu3oK9eCrlVgoM2fwFENoagI6CkTfyGDobQQSjW/Xg1BZIIdEFmHd8DYA/S9VGnDbd4BzyjrHPFWnFfVtYHy/ZszwEHsvkDlVb0AkFnoXYlYSPGW0VlwVvmpd/8FHCz0+YkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyhGoREedEdwfzjQ/zYAnRHlpY21jbA6v5AB+xqQ92s=;
 b=VU2s+Nz5oKZJM0+NdqmC72ki7OAa/bQek5Trik9BTm/OSOpkZfQ01xYjHsrifwV0echQmPQw6nzXoeSDcrKeF1nv3P7IWPnitG8dC/jOBeRBE8wEyZ0J3EPpLG8+HSXwAgppIb0XZlxsZE4DAxsBHtuDvy8biYX8nhbgzjzfIfu5cA0cK3SF5bo997oUM6Nn0BXneL8ibSyFEG/ne7Y8RLOqOeIl7xUhGWaWQAGY9/fRj5OrTS3ZzQOhnRXdKYCANuZ7ssqb1lixYE8QNqIOkV2IcbKKyl/2+SBhxhO3c7gwpkbfya5Z51RM54vWkJdFJo9iK5ZVA8cRpXUBY4BM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 13:15:21 +0000
Received: from CY5PR11MB6365.namprd11.prod.outlook.com
 ([fe80::cefd:40ac:3ad5:fada]) by CY5PR11MB6365.namprd11.prod.outlook.com
 ([fe80::cefd:40ac:3ad5:fada%3]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 13:15:21 +0000
Message-ID: <4cc5cd11-e1c4-1ff2-ec66-328a00b5703f@intel.com>
Date: Wed, 17 May 2023 15:15:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: HDA, power saving and recording
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <a7478636-af11-92ab-731c-9b13c582a70d@linux.intel.com>
 <878rdwjs1s.wl-tiwai@suse.de>
 <cceaeb53-06df-ced0-1f54-f5c0eb65f824@linux.intel.com>
 <87jzxe5084.wl-tiwai@suse.de>
 <41417b90-1881-0cbb-52e1-d63923dd8cd6@linux.intel.com>
 <87ilcxaj3u.wl-tiwai@suse.de> <87fs81ainl.wl-tiwai@suse.de>
 <7915b40e-a65a-479d-5a2b-062ee3cb432b@linux.intel.com>
 <87bkipag9z.wl-tiwai@suse.de>
 <98943bc1-c56c-45aa-06d2-80c618d0585c@linux.intel.com>
 <878rdplpci.wl-tiwai@suse.de>
 <63790c96-215b-bc8c-3ad6-7acbe487d85a@linux.intel.com>
 <87cz31pq2d.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87cz31pq2d.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To CY5PR11MB6365.namprd11.prod.outlook.com
 (2603:10b6:930:3b::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6365:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4807f1-689f-417b-6e84-08db56d8c412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 khO0YPHt939SSlnSS8w4dtIW2yYZg1+uOriUIfiOLCgV1TKOMHddS6+PEsnPUL1HGz3wIeX8orx1xkn22RfZiQHqJD5/5IvfOioJ3BBaHmX8kjYcvdTSOUHU1Q8fv0Gsnz+I5FWvvYbEdLv/KROcGnbPxoB8kLdQA8K9wjlh4ZMfLvDEHSIKmHrme+BZIk3CxPS2v3KIdDJgV9bH7aPQcJVWYlX52NPt1iU++R/KA2ADQg7Fl7TozY5T8mdse2JS1by594UuMw1wyd9HakvOuR6xSQLpIpe9uxD7+7MRyjTr8ielk63XoVBMFOYyycL3aAVkOij2QKGH6fyRvox/D3w2XyLdO26x3BpF354SSRrMRb3yiH0z97BAerFzeLrvOcrmRRSSy/MQ0M+xR4e6TEkQla2Sh6YfWkCs4/4wL/R8e4yVmPbecltwHrwmeTVV86k8xz8VUB0WyNEeI2sqlr7owHY+ArUnywfR97GYLLWKnPXkXEZIIjwaEdCgb6sUygTrAHVC3u2fIAAIP2wnv9H732azz/R0ea+IUk13aNtA11C+XGvK0PQeRVNuYgiWTozzdIerndL0clXtdQyd+6YshHKGnmlGILfCv4IpDE4ULa07QNl18/j7rij+x7jIstyzK4X4kD6Yfxx0wp4yB9cBde7fiN9otjbT2C6eDfmG5lqFbFjpMuICLzhBYH5U
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6365.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(31686004)(2906002)(110136005)(5660300002)(83380400001)(44832011)(8936002)(8676002)(66574015)(41300700001)(316002)(66556008)(66946007)(66476007)(478600001)(36756003)(4326008)(6666004)(6486002)(966005)(82960400001)(6506007)(6512007)(53546011)(26005)(2616005)(31696002)(86362001)(186003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?WHNUSXpJODRmbHBNa0lNYjBoOTlQT2k1ODlrWVloRjIyQ3JQR0w1Y043SUQ0?=
 =?utf-8?B?RTFNWlA5NkppNGJQcW1sQmpOQVUxWWxQZTdOaFhQZTE4ZGJkdDNsaWlsOGFZ?=
 =?utf-8?B?TU15WjZMV0N2TmRpWEcwOHBNMW5yeXhadE55aGVuaEJjM0lrS2VXcktxQmFO?=
 =?utf-8?B?SDNuR1F1MWxsRHY5eVhtYiswcjJTWStZQnF0T0ErRmNhZXNFcnFwYy84dHRn?=
 =?utf-8?B?OGVRNVQrTlI4dDFGbnZWTXY1M1cwYVFPRXgraE9iOEpKelorZmlSNFpUM0hZ?=
 =?utf-8?B?YmFkd01vTUZYeGxUZFRVckJaRWd0OVVVKzBVc3F3WnRIZDR1ZEFsd3hmTmN5?=
 =?utf-8?B?ME42bU1HSGx2ZmFWNElNREJsa1pRODZEOGIvM0YzaHJJY0UvNjFteHovdHpl?=
 =?utf-8?B?Q3ZJL2pDbkw2ektsYzNlMTVkelpra0pRM1I4UVpYUEQ3RFpIUmxyTTBLR1k1?=
 =?utf-8?B?NUhVdnVLbEZDN2NKaEVLT0lhQm1SZGovaUF2OUphZEU1L2t0L3JuOHN2UUUz?=
 =?utf-8?B?aENzZm5xYmY0ZG84SWR2TW9HV2krTkhXUTFmVzl2NnM4RURTcmh4ZnF5Rmds?=
 =?utf-8?B?WlFOMXY3Z1dqdlpNUDk1SGpLUnhrNGJVcGVCdnoweUFMNlJYMEh3eVJBMmZ1?=
 =?utf-8?B?ZkcydS96QWFCbWlWVE0yOXE4VnhFTnBudURRQjNwTElNQXhLUHpwNUpQN0R0?=
 =?utf-8?B?RFU3VXBiR1YyN1dPRkorSERMZnhuUmV5WTgzVnZ4TTlKMFd1cnhkOXpLeEMx?=
 =?utf-8?B?cW5wQTZGSFh6cnJlaVVDdnA5Vk1QWW8rVlFReG5JcVRPSzR4WVE3UGhqOEF5?=
 =?utf-8?B?MHVLYUswVU9BazhQcjlTMkR5Tlc3ejRQUnJNMGpMaDFueWczVGlUT1Y4OFZY?=
 =?utf-8?B?TUJJQmJOanplQTB4eWhSQmtWYjFkSW5sQUlrZXdrVERHQ0ZxZ2RrU1JVNkdU?=
 =?utf-8?B?VmgxZ1AzdEg4UDFzY2NHZGoxeng3a3E4N1E4MTRVYWNuMVpEeWlnSGhQWE1E?=
 =?utf-8?B?Y09xU3cxRmlCdkwvQkk1ZmFUT3JpWG00U3UyM1IxWEF1VnpjaGMxVEJTTVBG?=
 =?utf-8?B?ZHBkRGdlcC9ZbkFWN0lDMnJXNUxaaEJTWStsU1I5QmRiNGhCZDRmMWhaQkdP?=
 =?utf-8?B?SXF2WG1yVCthTVowbmtsUlBwWm8rdjk5bE1WME9WYVpCdXYvWnZSc29BUjFW?=
 =?utf-8?B?S0Y0VjFINkxBci9IYmtZd1k2a21QZkh1NTFYU29BdDc3OGg5NzV1b3VFUXdP?=
 =?utf-8?B?eU5BL2JlMEFRclFUbkdEV3BWbW9oai9iYytBbXFucDJDREVuYS96OEI0dDVH?=
 =?utf-8?B?VVBoQ1U4OW1SWUpxL1lVQkR2cDRTWU1XdnhrMmQrRzdDendZQ3gwWjhNVUZl?=
 =?utf-8?B?NzRDbUV1cjhmMUttQWgrakxKZVBXUzRhNk40MlJXN0cxZ1ZmOEdEdW43Wjdq?=
 =?utf-8?B?V0xQYlN5TWkxRE42UkhqVS94Y29Bd3JSNW5MazQvQ2o0T3Q1N2hwVlk5U3Bh?=
 =?utf-8?B?bXU3TEhHWGM4ay95K2lyVFhtSzRtOThNbktZWE50Y2RKMmJDRzdESWUrakdQ?=
 =?utf-8?B?cU4ydy9oc2dYQzBHQktvc25oY2QzOHRjMzM0aThZbVIyRzRxWmxqMDBYYWQ0?=
 =?utf-8?B?NHJKeUx2akZ3T21JNDF3b0h5ei8yc2Q0VDg3ZUpmamhEb2ppejN2RDhoVXNS?=
 =?utf-8?B?TGVmWW1KRzI2bXhNcVJLUUF5akZIbTRqd2g1MjBsTWltbTlOVkQ0STNYWGNx?=
 =?utf-8?B?MWpXcEhEQkhRcXFTcG5WM1hIUXZHODB2anhVQllJMjRKMjhNMEs0MXNLS0F6?=
 =?utf-8?B?a0laN1EwOHBEK1llTFJBZ3luOFYzNUJHTjdMOXpQZHV1Z09XWlRxbllyQ1Fa?=
 =?utf-8?B?NjdRMjZUMkpBb0VWTjQ3dkdFRTRnaXBMMUw1L3NuWCt2YlZ3b2lFZmpTelFW?=
 =?utf-8?B?OEx2LzBHVWF6UG1JSTBxT1U3T3RxNklaUlljc2YzMEd2WElMMUIyR1hDM0pr?=
 =?utf-8?B?MTc1TnVBWTl5VjcxRDh2WmdCOFM1N2c4SWt5Y2dhZTh4SFg2SHZOS1crTEZO?=
 =?utf-8?B?b2hWWjFaOUhDdDBlS3d0NUhEeUpUbnVUaFRPNURIVzZLUVhrSnZubmhCcEVh?=
 =?utf-8?B?OUNLODFWQWtlRm9ZOTJoeHFKdUpKRVRjOXdNMnFWSjJNQ01nY3FhQkFJR3Z0?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7b4807f1-689f-417b-6e84-08db56d8c412
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 13:15:20.8617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 d6Vr2VDjYAiPHRvAqE6G7Ze04VB9DcKM5rrrgs0ToMTyLMEpNrXVuNTrHt8gxwX0DHuGRo/VZeRAzRIWuYeqNj5MLhLZMxF9F0zloBlIvmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
X-OriginatorOrg: intel.com
Message-ID-Hash: YQEZQYATMUE7BEKFUWMNJ4I7346ILLZK
X-Message-ID-Hash: YQEZQYATMUE7BEKFUWMNJ4I7346ILLZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQEZQYATMUE7BEKFUWMNJ4I7346ILLZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-05-15 5:33 PM, Takashi Iwai wrote:
> On Mon, 15 May 2023 16:49:48 +0200,
> Amadeusz Sławiński wrote:

...

>> I think there are two problems:
>>
>> 1. After probe codec is powered down
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/pci/hda/hda_codec.c#n833),
>> even though according to power management it is still running
> 
> I guess it's in the auto-suspend state, so it's still not suspended
> but the device itself is active, while the usage count is 0.
> 
> That's fine, and I thought my second patch handling it.  That is, if
> the usage count is 0 and the device is not suspended, it should return
> -EAGAIN and make the caller retry with the full power up.
> The code path is with CALL_RUN_FUNC() macro in hdac_regmap.c, and with
> -EAGAIN return value, it tries snd_hdac_power_up_pm() and call the
> function again.
> 
>> 2. When stream is started before first suspend, resume function
>> doesn't run and it is a function which syncs cached registers. By
>> resume function I mean
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/pci/hda/hda_codec.c#n2899
>> which calls snd_hda_regmap_sync() or through in case of the platform I
>> test it on codec->patch_ops.resume(codec) -> alc269_resume, which also
>> calls snd_hda_regmap_sync().
> 
> It's also expected, per se.  Since it's been not suspended, it assumes
> that the value got already written, and no resume is needed.


After reading this conversation few times I came to conclusion that 
codec device should be kept up as long as its runtime_status=0 
(RPM_ACTIVE), regardless if usage_count is 0 or not. Basically, in 
autosuspend case usage_count and runtime_status for the device are both 
0 so, if we are not ignoring the former by calling 
pm_runtime_get_if_in_use() then we end up caching the writes during the 
autosuspend period - period when the device is no longer used but there 
is still some time left before it's suspended.


--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
  int snd_hdac_keep_power_up(struct hdac_device *codec)
  {
         if (!atomic_inc_not_zero(&codec->in_pm)) {
-               int ret = pm_runtime_get_if_in_use(&codec->dev);
+               int ret = pm_runtime_get_if_active(&codec->dev, true);
                 if (!ret)
                         return -1;
                 if (ret < 0)


Results for the above look good.

