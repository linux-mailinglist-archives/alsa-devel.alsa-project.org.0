Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1F4D053E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 18:29:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A370172E;
	Mon,  7 Mar 2022 18:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A370172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646674172;
	bh=B2Kfy1d02XqCFkPIjbikakpSUmQpnr2g761okH1jq3c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzpeS+fg+gUjoH2ENwZcbCQKwzfBvqiWiyFInahxaUYtS6SLtL8Oxf/GbxczKsZjt
	 sYMtqK36sBbxUpnGXwbE5TbUaQhxI4FKB31OS8Zg4otH5igLevsDShKMFDFHkAW15E
	 Et/3+6zwrUF6FmZoR38XvYj4BzdzspjCnAJNTB80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE9E6F800D1;
	Mon,  7 Mar 2022 18:28:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E0AF8013F; Mon,  7 Mar 2022 18:28:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91D53F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 18:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91D53F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n++wLrRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646674099; x=1678210099;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B2Kfy1d02XqCFkPIjbikakpSUmQpnr2g761okH1jq3c=;
 b=n++wLrRuI74J0fOjbS2cZ9IukwugAEZWGRMraHUgdZQDf+LBSNpHFqb5
 oVQRZ2msgjeE4RNBY+jHHpqq3FbUvW03Tv5KbQmtd67Vbxi6jFkizXstW
 xKTKwjnd4IT8cPBlImPzdRvSMddlaZt2ppib7tKSatntp+ErpEMx2iy02
 UN/k/6qJse0txuE2Iq2IT2aJMB7VTv338sAwqSkeZHykd5xazbY0P3tPq
 6sNgIy1P4cQZoVj3Q+VRSQbmgHiki/lgKG1VNm0xqQRMhwy+edJ3AZvFL
 HfGvZPbj/GomtBvxkQ+SNzRjIdK4OSO/ZGstsQdFyyw826A0wmvM1mOD1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254643320"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254643320"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="553244907"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 07 Mar 2022 09:28:13 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 09:28:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 09:28:13 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 09:28:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBls0hmTsMYDJcqHOTPReZbCqI4EeJKe8DcxvWZ6AsNNkMMx6KBIGPu1khD1y1fy17OYSYnvyzaE28gk2pXtHWcuV4ow0Ik2Nw4Rq47oPQw/K4Od0SqR/zWVD3y+fsgOtz4X1N2zIb9mQvwarZ2i/reRAle1whfc/XonxNhf+fMVcqPDgYYlsgS9pmsegWW9StlIy9llGjXWMl1k9rP9ymoBBvTvGHJoNVmCeLaAb7V/fsWSPVUoSrks8r8QsJB1/RMW5fm4EQ0FBcpAT1fJdGBuZ2jDZm4RRRJkqQ9KMWOavlE/+dYaCJrgQZgOX3bDfMSc3rBu66tAOeQq52O1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIonL4xKTHSt+lNZONMNZwk5nXn8vXd2aNDqWrQ6GXg=;
 b=NHN6D1X1CUnmmMKbG4pe0/4+qo/XmYeEPDr4bIG31w5JwWZyrdcQdjuS14Gnd7uOmBtd0rQfHVeu/0scyX3CVs3sPws2w3dC92aSrh+Q+aINs28dIPJpmWiqh8NtmoS8z4WYHyQKio2kxGinUGakbPlCr3ZsbCG2X5aB6TyW9mR44TY3fK5hN0QHawimh/YVGd2enNwx3aLOs/B27mVsxaPaEcyfdMLQSLdFufq2Wq3631Hz+qK+a9/HrJCDbMOvNITGSAfgEc4Oq7x5CqGEXEzljdxkWIpl/ezNxSNqSw3uCFAEVIrCUXkc44G3dfhcI8TDqdSM1VvPerlgZ1wuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN6PR11MB0033.namprd11.prod.outlook.com
 (2603:10b6:405:63::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.20; Mon, 7 Mar
 2022 17:28:09 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 17:28:09 +0000
Message-ID: <9bea7c9a-0e99-b1b1-9d98-da6797c93a87@intel.com>
Date: Mon, 7 Mar 2022 18:27:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v3 07/17] ASoC: Intel: avs: Add module management requests
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-8-cezary.rojewski@intel.com>
 <0e7e51e94157c6ca43957b27a13fd4cf058bfc33.camel@linux.intel.com>
 <e463df51-a0a5-b863-0cd6-80b1d60dc09b@intel.com>
 <886dacf8fdffb08af26cea6e754d09d4ed7811ea.camel@linux.intel.com>
 <818cb84e-44c2-ab4f-03b5-5b72b598c6e6@intel.com>
 <a281e2885720f83cb95615dd4d6a04ba55ab1521.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <a281e2885720f83cb95615dd4d6a04ba55ab1521.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::6) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f5c87fc-4766-477b-d763-08da005fd8d5
X-MS-TrafficTypeDiagnostic: BN6PR11MB0033:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB003300BACCA468BC9524AAE2E3089@BN6PR11MB0033.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IaYW1vS5etwrC2ARjjXq60/9m2ggyPqd/UIlmyovQJy/xVpC6CCiwDW1GpoVBBEIG+MJP8M+qTeY2sb0vkb+h09CSpGkvzhb4OD4SjLm+FIqgnL8oN9VmAYhGgk6c4af2JWTPpTf2Il7hWcTvgFzPaVxhv9DJ71rx+7l6Sa65DISipQD6xaXmBmlziT7shSvYJwc9qdGum04bWi7rwdY/obQYBZoB+nDs94z0maJ+e9s78fhx9D5S2hzn34WW52TqIJMNALkWSWatkHs1/J92S7f93XFeZ3YvHYACKOtgoRmAzqxhfYva3RVdt9aFFdS+zBqGsmBZ6YNd5TpYA97/qYq8M8a2ie61JykQMLbUCxfEJUsIPv9pClBqxzZKUHg1Ny7OUmwokx/p2asl/s8aHl05mYXV9wrOfXMee134dTxs4SWkPrhy2uedja7JjIQiclRe4mLHMWRnLFLPZbTLOs/6yEukjoxQ3nd/iLYY0fRUIbKoF4yy20yi5rbI0tUn3GMARmYwd0j84MioEc660siXrNx8BrT5LwO97DtTJxU4uYqCkWploNGz4/9e8RAdqt8QIc/vq6t7FWu14ximG0Dcspko3NqzfWIhIgVCFKV35CVI5MYilrTfdlGixdxjf2dQ3RPegsU/kV8BSAwqVlDc9FDmID+7Z4PCJBg59xmWeBox1oDczpmpCINqaCSHc8O+HEIHaZvwPx3/CreQLr2Iu/PX+coNbQqewp3Mxh3L/378x7lkGYy7SRMHPu8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(38100700002)(2906002)(7416002)(2616005)(86362001)(186003)(26005)(316002)(44832011)(83380400001)(31696002)(66556008)(66476007)(4326008)(8676002)(82960400001)(31686004)(53546011)(36756003)(8936002)(6486002)(6666004)(6506007)(508600001)(5660300002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2xheFdMRzlFaWVBOE1adzNQK0N2TXhJRCtRRU51TzFEc3RkOG9IVjhsSFdW?=
 =?utf-8?B?cVFMMlk4RHB2YVlibmdCOGFhTkZ6RUtNSWRObTM5Q29LcE1Kenk4SDZiL0lv?=
 =?utf-8?B?YmdXbnRqZ1BodkhpaUpRdndpQ05IUmJSMktyVnp3eEltRkY0b2VEQ0tVWGcz?=
 =?utf-8?B?RTZRRjgzNk1iRVNiMThEUjJwNlo5Z0w5bkpSWTJlQUlGdVV0d0FkYnFDV2p0?=
 =?utf-8?B?anV3ekFsNUFYWnMwekNPQ0REajZvYnRrMHBTczFCWTYzZUYzRHVvaU9GdDA3?=
 =?utf-8?B?YitIQ2d4WnBhUlZ5SmFOK2ZBeTBXTit3bk5CcEVmSkJnYXQySHVMNy93SDV6?=
 =?utf-8?B?RVhaY3IxSDUrVFNOVVRiWDAveVcycU0yZFhJZlcyMnRlVHNaaXA3amZqamNw?=
 =?utf-8?B?Tm9qclZZNFNHbXc0ZmpmYXdTbk9icXlDUENLSFZ5VUdIeFY0eEtlbk1pb3Fz?=
 =?utf-8?B?RGppbXZ2YlhrNVBjV1RKS2VEOThPREphZ0F4YkZtS3FSUW1BSUUvVW16SHVt?=
 =?utf-8?B?NklGUThmWUhZWVFYQ2JZdXRqQnJ3bCt5VWcvWjVhQS9uUWtOQXdwMnc0Rlcr?=
 =?utf-8?B?ZllNbVJTbnQzSVlUMlBWenJCVFcwemNsVXowZVNqVDhxNmpYSW1kT1JsQXQ2?=
 =?utf-8?B?Tzcva0RRRjh2cTdiZFFxdHJoREM4M3RlUS9YY1VmOG1kUWVTNDZYRER2c3Nl?=
 =?utf-8?B?VTZjaHF5QzdHRmxvSm9CaWhVUEtQSUw1V3NhdGZhYUMvaGlIN3BXQVF5ZUxa?=
 =?utf-8?B?K3pCUjg5MVpIVXJMVUs4NmNnSUltb0dsMWY1QlBpdGJSditOUWN0QU9oVDQx?=
 =?utf-8?B?bXErYm9wWGZIS3FCa2hPK1piVituYzV2V0RoTVFnTzhiWVVRTHEwUENmU1M4?=
 =?utf-8?B?dXJkaHMzQm80MTZYeFNUTzdLWmlNRjhLWGxTNzVHMnNwbVV0dnZnTGlid2E4?=
 =?utf-8?B?RUh6dEFEV25KME1URWx1N1pHQmYrUlFWd1g2YjJ5cVpPQkZKSFdkRDJYQVpl?=
 =?utf-8?B?cm5IVkNGVC9leFNiTkFTYkpLMDJ0Q2cwYS9GcUZzSTJtSWY0ZWo4WVA0TnRR?=
 =?utf-8?B?OXBSY1VrRHNBQ2ZBd0dEYlhiMjJhRGZXN1g5bG9abkx4MU13cGxsVi9PMmhz?=
 =?utf-8?B?NEtlcGY3L09MU0psSFNGWEdUUFMzd3lzMTVTTUFpeSticE1LSUM1cUUyT3lU?=
 =?utf-8?B?WGcvWDBUd1R1Yk13LzRXTk9XRUxGYlVKQVVkWGtNcGJTSk9JZCtVSnIwenhS?=
 =?utf-8?B?OURiRFZqL0ZJb1RZNyt4SU9hQzV4UE15a2YwN3RQNU5BN1dUMHJKMTB0c2RV?=
 =?utf-8?B?YU9mTHVCaDRJc3E2cUpqd3lzNXJPTWt6SEhlbW5RaFBUSmNzN2loOERURHJT?=
 =?utf-8?B?NG5mMnAvUU8wSkpCaG1EbWN0NXcrNndjWkVhLzNIZVVOR1VIUk5RajF3NFJv?=
 =?utf-8?B?TUJEWkpQQnFObStrNndZTURqenFTQ2I1WEF3ZEdJZ1QxUHM4ZnZWMTR0VVZs?=
 =?utf-8?B?MjYweG5BT2RtaVhuVE5ValhsWkU5ODN2YlVKYzZjZVpYWlhhV2RqV2gyZGZs?=
 =?utf-8?B?dG9vSVJ1M2xmOXlFR2lzamlRVlpidHZqQmNPcWxiVVZYVTM0MXkyaWZKUTNa?=
 =?utf-8?B?OVRlbkVQMjMyZmFyamQzT1JPN1g5REMrSVJJRjNUbU9PSEw1a1R6QUpJMUI0?=
 =?utf-8?B?Smx0UFFQSXorNlJJbWo1VFVoVWpKUlpESVNYaVVEKzg5RHNJQjZjNDUvNm5R?=
 =?utf-8?B?Z1dCYmtOUVVvRVBQZkFncE5YTUpVZEprZ3c1Z0NxNUhqVVphbkNRUmIySnc0?=
 =?utf-8?B?ZisyVml4b01UTm5sQXR3TFlZelR0MUFEeUlPVzVrbnJUcWxYV2JISndsOTNG?=
 =?utf-8?B?ZDJ2cCtwbkVWTG54eG5rVTlSQmlzVENsVzdTdW81VGM5ZE5Hd2w1MGFaY3RH?=
 =?utf-8?B?NUNpNlExNzZ4SEFwa1l5YVZESDIyWjJPbk1vanB1STBNNG56SDQzOWdiQjNz?=
 =?utf-8?B?Q05JTGlYNnFNL0dGS0VIY0NjK3RReVFid1RYWDliTkZXSWprMWZwZmhYWUlw?=
 =?utf-8?B?TFBROU56ZmVuUnU1TnNqejhtd0dKMzJVcHNMd25XK21tRG5ueWF1OCtxcTlC?=
 =?utf-8?B?aG9XcUxNYUVFNUh1VTI0UmRVYzBmT0xTN2ZWcE81b1hQSzdhZk10YWpzNENU?=
 =?utf-8?B?SjB1aDAzTGovZ2I5amtnYjlUQlRQL1Y4SXFoOFhhUFBNTDZiRDkzY0c0U3Ix?=
 =?utf-8?Q?WDH9Kc/FHPKUUgFdlU7WxAFlSY7UaEXUw/IGqK7jrM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5c87fc-4766-477b-d763-08da005fd8d5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 17:28:08.9101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhzI5QDkZaGL/Ehz0i/UgbblckDrO6y8rSZGee6A+fgiLkEfCCTOfEpewnHWGAoCkaoYER5vZJ4wmf3M3STMqhfwTXqkloBebLPKZCukOCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0033
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-03-07 6:05 PM, Ranjani Sridharan wrote:
> On Mon, 2022-03-07 at 17:58 +0100, Cezary Rojewski wrote:
>>> I'm not following this, Czarek. If there are rules defined by the
>>> FW,
>>> the driver has to follow it isnt it? What I am asking is how and
>>> where
>>> do you enforce this in the AVS driver?
>>
>>
>>
>>
>> How the stream looks is defined by the topology. Code that
>> translates
>>
>> such patterns into runtime being is not part of this patchset. It's
>> part
>>
>> of avs_path and its collaterals instead.
> Alright, I'll wait for the next patchset for the explanation.
> 
>>
>>
>>
>>>>> How come you dont have a loop here? What if the rec'd data size
>>>>> if
>>>>> larger than the max size of IP payload?
>>>> That's not how LARGE_CONFIG_GET message works. There is no
>>>> looping
>>>> involved or expected by the firmware and so we don't have it
>>>> here.
>>> So, are you saying that when retrieving data from the FW, the size
>>> of
>>> the retrieved data can never exceed max IPC payload size?
>>
>>
>>
>>
>> Precisely.
> This is fundmentally flawed isnt it? If set_large_config() sets a
> config that can exceed max IPC size, get_large_config() has to be able
> to support it.

I could ask people on the list to "not look for a second" then there 
would be no problem explaining all the *recommended flows*.

Simple, honest answer is: Yes, that's fundamentally flawed.
Now, as older firmware generations do not expect nor support larger 
payload sizes, adding such code here is essentially adding dead code so 
we have decided to add none of it.


Regards,
Czarek
