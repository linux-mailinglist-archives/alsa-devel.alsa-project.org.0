Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE24C4E8C
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E6B1F25;
	Fri, 25 Feb 2022 20:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E6B1F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645816917;
	bh=S6dnl2F/CexOc49q+pAN3HLGwiDc8c+pncsSh6cKlDk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ArhqB/46qSFDlsc0sfNp8so1JrJMnRWGEBkeg5KC3zDoeWRVkhv2tVBn/g1Be0vGa
	 ht5EpErFdt9l83TYYlC1P3+Yvfx5+OcBbODzfz5PvrNDrS5ESgHGzm49aO3jHrNKGm
	 A5FYGIUU2X1Xgp5a3EaaalzShKYkwmpExLQ55cPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F9ACF800E1;
	Fri, 25 Feb 2022 20:20:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67FD4F80132; Fri, 25 Feb 2022 20:20:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94215F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:20:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94215F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ai86+5Np"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645816847; x=1677352847;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S6dnl2F/CexOc49q+pAN3HLGwiDc8c+pncsSh6cKlDk=;
 b=ai86+5NpQ3H7SMMdxYhVTUFBA51cQUoTqliszRa6+tflWbzq3XadIHPD
 NHev0FvbmkEn1tr+SWYQ1mZ9AGXdtOs1ktkQ+/+2TLcVVv8/2IX1ap6v5
 7Y2Zm1nj8scj1wCXKDcg2gpHJBhH09Mxdnw1bMRkp7SoW3lzlNDbo4GJV
 bgwvlMd4VG4651BlqEjEa1B877cYUSOrq8QpT5EtPaz6u0zMiRGp3Yhgv
 moMK/dKo59XWmH4SNjSEBdG7E+N0PHtCRMbCrtjANt8s3u7lDN9K8OuHx
 4QBQG59i6PDm7HoBfwycsgpYtK+O7c2+RLjYWhwFPbtk9fyZgrtJNB/yF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="251394537"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="251394537"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 11:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="533681950"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 25 Feb 2022 11:20:43 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:20:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:20:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 11:20:42 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 11:20:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faB1RebF889D3THX8f66kKuNSdU3SrX9Dn6TaiOEdB8eMZAAXZ4kvl0UR2PheE1UNePKHXfcKsPOeR1sWutaJyaHJonU83/kfW/8KkNXGm/beWmVRD4IJ4XuIR5rFEQIiqxUk2B5BRw+PzrJW3GIRiliQ2hXt0iYvRm+BnDClMcyRPvOwAZKwSWa9dqiEYXrTZ0616n3SMbNif25Ln3xx60c6omaaXyvAle+Kt4QU6wqBs5a5ALBhUqE53RBkI98fQbmgBVUeeAEj4UkV2bFEGNd8jz2GELZwrjrLNmfx+GR8qbGiwakz3VQg1V1eeHAiq6NOeFeOQXFVaxg8prLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZSJntdN/javkmgr0SAqZH0nz47DsRfTkmqlhIouTFk=;
 b=Y9jQwXAyjBHURqRtVPI2y/ZMcjC/ZU+Rr6MOBnXL7nOtQaHBR2ybkd4i+OrYbuN973YTgF9GfXvihLupVDoOoXaCaOLxBA3CjNdqfhksQnwuF9YGgNdLrvhxffz86WheiD+f+X/+Lclto3yws6oGi2AF3a5mtxbQTomP/5ikfhAyR9swrG+s+8q5vY/041JZUx27pOzoItIQ1YVQ5t0wFMbXgCrQrRE56lYjNCucKlwtRlsGUg0RQkYyjHnQgoNWRGEqhJbwEhhLOOit44XN5BmJ6mPa0Q9sWuU9Efj1Rtpdfalx747DyHSo96OeIE8QuGIRY9nKAMTveqSM/4Jl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by PH0PR11MB5157.namprd11.prod.outlook.com
 (2603:10b6:510:3d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 19:20:40 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 19:20:40 +0000
Message-ID: <c8cf79ba-e1f7-54a5-45f5-0bdae0d23f39@intel.com>
Date: Fri, 25 Feb 2022 20:20:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-12-cezary.rojewski@intel.com>
 <dc117645-7a4b-09be-bfe8-befcc4a9bc17@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <dc117645-7a4b-09be-bfe8-befcc4a9bc17@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af8ddf3c-1f0c-4712-2b18-08d9f893e8c4
X-MS-TrafficTypeDiagnostic: PH0PR11MB5157:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB5157F4DFC3E3437BA0886D32E33E9@PH0PR11MB5157.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfWvvLiWs52xNUtM/083yZL3PvMDUY7xiW4lbzbZ58lJzmeRF52cLO3TmR6yTQH9RpJFYtphwDDSBdHxd5+DbvhLzlGrpD2WdW9QWPdtDz/DicG7/iJT/Vh9ZgJk6J852QbKlFjXte0tPgaoIfO2mTqE1EsY3P0A+C9+a1pz+vE++GE2lXyAz2zPTi9Ah1zKzsZZK/4N+74ofD5cGbr99BQToPZpgHkTZdVK+ZuBYCerkC1z8F5/VkKO1arGVnojIH55rX3Hs81zJ/S5waR9ogg8UZdMGeP/1avroRXZ1Da+THw+wMBmjJnyCy4dzJk1UdY655dh7ZEVcagIEQwlK5zwZwcz4xFaS+apNI1zCW61PgsMS+Yu+tA3/+EHIr3SFty3UlTzmvRA6t836thkTlwgY9jceZTJws58PFr+Evu/2bcT9814mG+WvBLb8T+pdH3twVnww7FT4Ep+62sCwI0vmkg3Z0AFwNn+RB1D5dkzzAKITSFwoXIutJMv8mfsOs8djDS0xNdtt0YtCBQqEiOaFLjfZeVwLL1J5BmPwwBztyBYk9DdQ8LHCFEldNC9bhe3+g037BC/tnaVf/EfRPBGZW+WqSpMc75Qz6iCe27NYDVRNplkMfzdeZnIIZS+58qB1R7+ZPoxz/rX8GqI5Uqy0uIfycVnsA5KQDSh3yBm3jG0W+WEgwtHwqJAEESY++i7LUwHZY6jd19GJInOxdiImj8ytYWoE9Xed6sxoXwz+eEgBsH7WxYHTdWPvDtF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(66476007)(66556008)(4744005)(53546011)(7416002)(186003)(8936002)(8676002)(316002)(66946007)(4326008)(44832011)(5660300002)(2906002)(6486002)(6512007)(36756003)(82960400001)(508600001)(38100700002)(31696002)(31686004)(6506007)(26005)(6666004)(86362001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVhtU2Y4OXEzUzltR2R5TG8rU1lDWFk1SThid1VlcnhHVUlaS0NVRDVMenV0?=
 =?utf-8?B?UG91VGV5NHNuaXhIeTlYaE5STHl4Nk1neTAybXh3UTBFSnduSGVORSsrS3Vr?=
 =?utf-8?B?dHI0ekpBYjhDUW1RT3UvVEZaYzR3dXpqSk5wLzd4L2VLZWFVcEZxdjdiYVp6?=
 =?utf-8?B?aUFSRVVQelB1VmpRL2ZTQlh0eDFBdjEyZmQvWWt5YlhaRm1ZN2ZOSGFUWm15?=
 =?utf-8?B?MDdJN09uNXFtK0tkTC91NFpwbUJzcXBQdzl3UkdHS2lRRlRQeEI2elJaelgw?=
 =?utf-8?B?VnlQWVV5NUNOcWRxbGZBZjlkdHIvaDZyR1VId0hYeEJtTnFkeXRPZ2RuczZy?=
 =?utf-8?B?VXVvQXcvZmo1MDE3T0ovNzNvREpIcDV4dm4zRGdsZ2NvSjV4QTZzWU9kK0pt?=
 =?utf-8?B?MHVYKzJ0dHlCTUtKSVRwM3JzSk41b0xIQm1BVllONFAxcjh5cVUrOThWTEtp?=
 =?utf-8?B?WTVVc01SU2R0NUdIamF6N0sxUE80cFc4a1lGaVQ0dEl0NEJONHlvL2VPK2Fs?=
 =?utf-8?B?L00xM2Fybis4MHJvNmJqeHgrUXBob2JCMjdoeEZCVkwrV1Z3aDBySnJra1NK?=
 =?utf-8?B?SjN0cGVrRHEvVVE1bm5SUzNEUnBvWDdNY0h1OXJ2ZTMrQ29aMll5ODM1a0pP?=
 =?utf-8?B?bEFlWEhkRjJXRDVNWnNVN1JId1NXR2dIN1pqNUNmQVBKZlJzQVVJTnZaRTU0?=
 =?utf-8?B?SytYbDJjWVFQVmphdWxtWTRqNWhvdGlkLzVlcmVrN29lMDdqLzBhWWhlZ1Zw?=
 =?utf-8?B?aWVXU0Jua05BSHkvdjFRMm0rbGducis0bTNTbzhtNk5jNVBmYmZ6ZWVGMkdB?=
 =?utf-8?B?SVdGWGJ2TnhGRjhib0pTUkVOZHU2L3hHaEdWeTloMTRhaXJLeWd5TEcvaWta?=
 =?utf-8?B?bUN6OW9wRUNOby9xL1BaRUZOUnRYVExwSnRnRnlmNHNoOTNRdUVSN1FvR1FI?=
 =?utf-8?B?NnpxYk9FRmwxYjNlZlZaOFAzaGFHMVFDak5DcnZhT3QzL3NSMXhYNmdwUlNH?=
 =?utf-8?B?M3VKZjQyRmtUK01uQkJBZmJWeEN1TjYyQXBqMnk3MkFibzdDS3UxUGlyS09u?=
 =?utf-8?B?Q1Juc3hFUnlTM3VHcXdLWjVMOE5VbzRvQjZSWkx1ODZRUjdCdWpKY0pLb2s5?=
 =?utf-8?B?dDVDcC8zYmJEMExoUWJ6TjFHck5Fd2ZXWU0rWGlmYmdOc3Jad2RuZXMwWVFt?=
 =?utf-8?B?VGszYUF6R2czQ3BKZllnZjNkUWV2TnJVRHZtd0x0b2xGM2NzUkdNU1hnR2Jv?=
 =?utf-8?B?azNzN3dtVm9jYXNqSkdRQlVOb1hGcDZPKzBKUUtsK2pXWXVhaEdMR0tpSEJQ?=
 =?utf-8?B?VWdXMGRTMkkwZ0tZbWZuL3d5akNDcmxoUnl5L01ha3J3a3FXRXJKeGdIZ3Np?=
 =?utf-8?B?cU1aNmtVc1JacklUbENWcHhZZTgyL2JoYUdhSTNianoxcDhZWDVpUy9MSHNs?=
 =?utf-8?B?VWZtNkVXNEZIbVYrbm1ZblRZQnluRGt1cnZETGxlN0xkMnhUakM2d2o3dUR1?=
 =?utf-8?B?SFJzRTVjc1l0UGFFNXR1dzJ3dlFjbDZqZlc1T3NYQjBuSUpHdGlUZEtsVlRm?=
 =?utf-8?B?b2xzOHk3QnZLRDhibFprTnZyc0Y4L1FqelNMUlJSeDFZSkZFd2NMNFlvYjdy?=
 =?utf-8?B?dVlVZU11akd5REc0SU5YYWFJUlJOeHl3UkVLbDFDSEVGTVA2VkF2YUN2Qk56?=
 =?utf-8?B?VDlzSHFNdDNyd0R1UzlHTjdpdmwyR3Z1RHdpN2RzamJqcGw4ZzdLSjBFeVlY?=
 =?utf-8?B?RUlKaEgxd0h0ZGI3Yzh5UE9qM1d4WEJ2b3hUYnVkOU1PaHdZQzRGNlVqRzJL?=
 =?utf-8?B?b2VSUnBWd2FheFhiOEhFWGp5eE5JdjgvVkVtMmt2a01MNXR6dVA2Qkh5VUxI?=
 =?utf-8?B?WTRZcnBBOWRtRUMrWFBtNG9tVXpwQk9LL2VSTDQ2ZEVva0crbWEzVFpSakdn?=
 =?utf-8?B?cUV5MkNvZjJHdjcvcnoyd2w4VUlUS09CL2tHTThzajZZZXU0V3FXRE5FYVhI?=
 =?utf-8?B?cGRvS2FaR2hkdjN3ZVFhY2pudDJWU20wdm11Rk1CMnNNUjFEL29MQWRTeHhW?=
 =?utf-8?B?OVBFV21IUm5lVm9nMHlidVpkc2NLZUx5K2dGVlhZK0dteGdxbWF2WU90ZXpu?=
 =?utf-8?B?dVRKZUpWOEgzTnJwZzZRMCs1dWp1bldrRmlSWEZzOStJMGZUY2dnMzhYVjU5?=
 =?utf-8?B?c1FsMzZHR21VbCtvTzJGSE1xT0Yya3RqMjlhY29ESTZZeTlWMVJXbmVHbzFG?=
 =?utf-8?Q?vpi8dMrXNrEJ+IFhLShDj8vBW0we9kRMoyhmn1czLs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af8ddf3c-1f0c-4712-2b18-08d9f893e8c4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:20:40.1499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nd7PU9p42e2D7VL1MHvkMZn0PFxiBLsLbdohxyQtry2cfLNdtDloyInhSMl5GYlew33rtLgioIp5+r6u33P70QM+diIh8CIeDT33hLXjuss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5157
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-02-25 2:53 AM, Pierre-Louis Bossart wrote:
> On 2/7/22 06:21, Cezary Rojewski wrote:
>> With basefw runtime parameter handlers added, implement utility
>> functions to ease pipeline and module allocation. IDA is enlisted to
>> help with that. Also, as firmware is modular and multiple binaries can
>> be loaded throughout the lifetime of a driver, custom firmware caching
>> mechanism is added.
> 
> It's not clear what the 'lifetime' refers to. Did you mean that the
> binaries can be loaded/unloaded on-demand depending on use cases without
> having to reboot the DSP, or that at each reboot a different set of
> binaries can be used.

Ack on improving the commit's message. Thanks for feedback!
