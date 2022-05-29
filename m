Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB25537133
	for <lists+alsa-devel@lfdr.de>; Sun, 29 May 2022 15:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED741751;
	Sun, 29 May 2022 15:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED741751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653832684;
	bh=I2y3xbTp+Gi5ORhPtW90NX20UViTdRwm4vha3RPCFFk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETKXZNoZHEu2Bw7Fam08jFkHkhkTGomjBOM/XctHdw2Z3jniWvuN9H2CMmERKFg9h
	 IujpYfFElc/X7I8OdS+/0Y6HFX2o76jufkkvas2nsu0J/OJmEQV3AtvnLoBsQE4SH7
	 jOXQ3N2BxCJrl3TC7G4Dp0/l/xGfgA/HN7zasNeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A66A5F800DE;
	Sun, 29 May 2022 15:57:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26029F8024C; Sun, 29 May 2022 15:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE859F800DE
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 15:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE859F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CXzNIcdi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653832619; x=1685368619;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I2y3xbTp+Gi5ORhPtW90NX20UViTdRwm4vha3RPCFFk=;
 b=CXzNIcdiBpMulzj2+VGjBPg23CYE/Ua9K3GwT9UZcMvPI4rYGtSUIqwS
 alX19fnRFEvJSmGXoo9l2eys15NorJQMqlJ//69ysj2Q9J6zDwSI7SpDV
 dqV5sSZM0dHa6mw/rcIMgUx8W62ae8IAYicyb/CSeb86KjVnadF0L6xoh
 jgzpM24CYmYKxL95KNsRbektvFFx+YBTh8Le6A2BTr8rIVoSwRzU3s/Q3
 RToMgshRh/mJX57U64O/hIImOKrlTC7tIi2DYlGSLoQIZOaGDGJbsnK/r
 wSLP2erMU6PIXYfCQUeCwTvKnwt6F/jPtciECiDsA3bnB+kxD3GrgiiM2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10361"; a="255290762"
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; d="scan'208";a="255290762"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 06:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; d="scan'208";a="632286961"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 29 May 2022 06:56:49 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 29 May 2022 06:56:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 29 May 2022 06:56:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 29 May 2022 06:56:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 29 May 2022 06:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdMmbj9uUeH/P2aZHuYAD2j4uhWtrtJGsXGIMcZOW/dCEv/utFs9rrTcqAWqOV6ugJ+mEC3kft8qVUfl1LXRfujzk8ZTsZSNpJup3XyXZOKuarz99dykNQ5BizDCRv27Vd1KMdktr7Xh8arFCwmupkFYCqUu7tQIHgzz3htmR0lziiHLAgnNEbcnkdLYOT8nevKDj23nCC/gqxGw53++3Ed+1qWWg/xY2MZmEURkfoQgLG6a8WEec6N7rnCWcpUzqK6I+qfoS9PWM+OaiAv/k3vdD8Y12OT0nnbxTdxYjqFiufiM2HL/moShm1nkSzJ5aAc39VYaxKXZe0hiU7zG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bB7pANBudTFFYs0L1Rjq8ANtRT3hv/sTZB5c9elWagc=;
 b=fByXHilBnIi0oOb/V2DLNYdln5hw/NsaG6M3tm0SFNEkelIAUXGO16uyqbGRfu2rnjfHHu0P3a2TL0tjRuJcyS0UvBE25gKe09IFF7xbt2CrLKwbwsXkX3B5yyeujMl3DG1PeLfd0WmbtLgQDhnvsTRb2LhOkRoxRmF2W+zRm/4wfhf5yse8KD3AStJsakmT+cgrg7UaygOsjGZh2xzm+Zo1C91LzGXVL7ZNzH6TMtM5Vx3OovMeYQn26U+HdBAO1d04W51v/9cwfi0rMJ9plMFBPE8Z+Gmcx5JE/1Lp07RPNg0Us2qCsEA63qbjGMq5Ud+Pqq2dcgd2MmgMDvx2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN6PR11MB3874.namprd11.prod.outlook.com (2603:10b6:405:81::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Sun, 29 May 2022 13:56:45 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5293.018; Sun, 29 May 2022
 13:56:44 +0000
Message-ID: <70daa951-4f77-3336-0567-e72e9e5e36c6@intel.com>
Date: Sun, 29 May 2022 15:56:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v3 11/15] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
 <20220526162443.GA60418@roeck-us.net> <Yo+8hvwhvdx7tNGI@sirena.org.uk>
 <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
 <550c53c2-b638-d087-58af-4a1f30131237@intel.com>
 <20220529135039.dvw6kbffxqju452p@pengutronix.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220529135039.dvw6kbffxqju452p@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::30) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77d7c21d-0f8f-4340-339b-08da417b10ee
X-MS-TrafficTypeDiagnostic: BN6PR11MB3874:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB3874FB8651591227C21E77C2E3DA9@BN6PR11MB3874.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PITcAsRIuluy8IQ7gp6uj8HaIdTdLHfV5rOTL+cogfcs4k63jp5b6tlBUsRW4Bv7Whf0qsNvR40RY6kT0Eg3kGpJYNqOXjGV26GWSfxDSnoCIYtd2ipLYdN3tz2NUDQkXHmyFcRBsSzEz5zmANwSu1//DVS+qDhMdWpMvEc9S+/S5Fe0SOxrwHEgTbS1jcUMk+DE9q+gwLI4S1yyHBtrbcIMZkYXXmKyks1Du1LPy7u+b08u+eaf5gcL7+hKBWbPyjglnZDuh7B7spj10Nz1Oa394pGH9H51t5Chuino6PdBfw8WehcMd89ReDvjJC8e+P6MwIXgVBHzCvRhqMS+7rthd+wJEQMQO17+p8cwP2/BQiCZZ5XWAWWs2uDfJEeNKGExYtJarB/v402G8SNVKzVNSdlNsrYihqGyigzCnsvbfNxchogrpuNhzlQHVGQw4yn8LBb4VvFm7JsWbGcxe021rHEeZ8cvhnX2LPrX+C9NvSM8WIboVmEbaYSsfz6c9LmJ8tGNG16kWKgKlzyP42VdzHxgBYs3IPdDiL0Db/1cj3WUOoIqHpzG7orcMRfyQnx7kDoJSWiOwXxmWmpV12kpUvdG+hvNu3oSxp4oVUfQjVsA5hWPEO9IgZVTl+AXO0eqr9nUxDP7GK1v7wC2TesvWpC+c5h1jxUIXVdJEyGAg/OdNZM7582WXE9/xTSGlUKKkXpODsDkQElDeqbf55IGHKPomDSs2Z+xE9GR7LIfsqx2GwAX3CvprtiUzngN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(2616005)(82960400001)(6486002)(6512007)(26005)(6916009)(5660300002)(508600001)(66946007)(4326008)(66556008)(66476007)(8676002)(7416002)(316002)(44832011)(186003)(31696002)(86362001)(38100700002)(6666004)(2906002)(6506007)(54906003)(36756003)(53546011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THNPSDM3Sktwc242cEhlSnF2R0NkNWthV3MwUksyWEV4RnAvZSt3S1V6VCt6?=
 =?utf-8?B?MUkwYmVMTzBZR2RidTM4bzhjR29xTS9hanBxOGJYaTZXTkNaNFErVHV6OVJK?=
 =?utf-8?B?d2k5OFg3dEhyVldkeW5OOGpDeCtVN015MXRHSmdCczFaTTI5MkpONEFVaVVU?=
 =?utf-8?B?MGl5OEQrM28zc05TbmNEOVhkZEJndmhjWVlWWk5INWQyVDVWWHQ5VVUrUkFQ?=
 =?utf-8?B?K3lIYXpsbFd4Y01YY0VNRXEvSkRRL1lPcXVYKzhCalRrUjZybk9CRU9HcFRk?=
 =?utf-8?B?Qjh6N0JmZ3VGZktZVjlNd1JDK2xYN2xVL2xsNHNpUkFsNlVWVmkrZ1l0T0Q1?=
 =?utf-8?B?aFhhM2JwdTJDNktmWXNSbWtmeXNaSEdtaXU3S1NDa1ZlS1A5bkx0VGJMVkxB?=
 =?utf-8?B?a1NEMmd4N0N4N015U2IwbTY5WnVLUHhET2hUYkd5bWNtQkxUS2hjTjdOTjFG?=
 =?utf-8?B?WTRuMnhxZldmUVJvYnRHRkNHa2UzVDdoNUI4N3U5amVET1BXb0VKSnhVU3lw?=
 =?utf-8?B?NC9vdmJlT3BNRTFwM2VsbVYrd2l3REh1Z0d4SDU4YTJHaDh5bnltNVBGd2lk?=
 =?utf-8?B?QlFNc3prNndwNUZkOW05Y0V2ZVhXWndTckxYb2haTGE1WGtlVVFhSDIwa21B?=
 =?utf-8?B?dUx5UjVYNEdBRTN4WWd3YjNyaWlYZHBrN2VkRUhKUE9ZbDFvQXJ3N01Balp0?=
 =?utf-8?B?alplRmpVaDdHT2tZVnpKbDI2SDdZeU5zNXVyUzZrUHR0dVJWcG03QjdpRkF3?=
 =?utf-8?B?aG8zamFnbks2WjFOYXNFOVB6RWJkSmdwb0VDMHVBNEtNZ2NxaStpYVhGeU1j?=
 =?utf-8?B?d3lTOXlzQkJKVUNMSE0vMGhTOUUwcGMvOHl0ZFF2THYwbjJiMndJcVFVWkg2?=
 =?utf-8?B?M2FPZVh4TmxlakQ5UFhhZU9HRHFhMkhQaTQwTFhvNWkvbEJTelhLZXNzKysz?=
 =?utf-8?B?ejBsODJLUjh6eFo1WU9XaVZwcGRBWncvRlgzWks3VjhOdUJQMko2N3FvelpF?=
 =?utf-8?B?cmFZQ0FydjRUQ3kzUUlDQTgwbDFsblpJM21LVFRKeWNQZjFHdlFjcmsxbldQ?=
 =?utf-8?B?MzlYblJlWGQ4cWVhOHlKN0tzNi9QaTlKY2VTVzE4UEhWc0haZmQ0VE5aRlkw?=
 =?utf-8?B?TWlQVmpWRzhHMUJkREhweExlUGptRWRGMGwxZG90RGJDOFpNcXZybmlwVFlD?=
 =?utf-8?B?YmRzTnVMZTBnZnBPaVB0cHVSSjJWUDNQakhxWGFxdVpLQjBKeFlXN1F0STFp?=
 =?utf-8?B?SkE5aG9mcnhUR3YvODBPREhtL0RtdVhGdWR0a0N3N1FUM0dFbHBTZ2Z6Y1Ar?=
 =?utf-8?B?QjNIMG0rbTlMdFpGMFFNdHY4dzhqeE5Uc0tqc0VaeklxWVFibElGQWNYbmlE?=
 =?utf-8?B?aUxwSFBaaHR2aGhaR2tXcktMTGs1dy9ZM1FyZVJQeUNmZjVTZnFmWTR1NlND?=
 =?utf-8?B?ZVRSbU5oZGhVVjF0S3VMRWFWWTh6UVRXS29kVFljQTZQM2pLZUp3QjAvbXQz?=
 =?utf-8?B?ZVBzRVBIT3ZiTHB3UTZhN1BuU2hxYXFHUUVvY2hzVFdvQzdwaVE3TDRMdWlD?=
 =?utf-8?B?Nk5SclJHWTZUZDlVN3hnT2JTVTB5NmF2QTdYcS8rc3J4c1MrdWNIaTBTMHE0?=
 =?utf-8?B?TjR0WC83dlE5N1V3TU0yRVhmNWhkbE5neVJRTXI4MThsTG9zS0s1ZklYMkdZ?=
 =?utf-8?B?Mk1PWkxMeU1VMDZOY3RFc1ZlY0tmQ3JJUmM4VlRSQnRNTUo4akl6UXEwRFNn?=
 =?utf-8?B?bC9uZlpTZUdIT2d5MGV3dUd5ZGIzdGF2M0xsNE5Cc3pkWjNKbnA3M0NwTUJs?=
 =?utf-8?B?WGRQclJEWUNxT3ZvNndLb1hWNE9JWFFjeE90YnZVejEwTmhsR052dFJqSC91?=
 =?utf-8?B?WFYxQ1NFdUhjV1ozQ3BtQ3c5aXZGRDE1TzF6TzhUVzZOd1JsU281UVZTaWRT?=
 =?utf-8?B?OHZNVWtUWnZUZmpWb3BUSk1IM0FVeHRNMXJ4d01lWmVLRngxSG1SMWFEVjdl?=
 =?utf-8?B?OVBlMzIwZTU0NEY0UndBVlY2QVdIUmJ6Z01abldadktadE5hQ2ViQlRTN05u?=
 =?utf-8?B?Y3pKVFVqSkhnRFNyQnJGWHkrdFp6ZTVsWXgweldIOXpYVlpKZGFNWm1SbHV5?=
 =?utf-8?B?RWhqc01NS0lLbXUvQUxOcnE4T05PTUg2a0RNWXpQU3RoZzlOZStJTmluMUhM?=
 =?utf-8?B?UGFJWGZ3aGJhNlFvMUdaVmlnR3BCS3hxeTh3a2dJZER1ekpaQ3BOTFdnVFRV?=
 =?utf-8?B?dWU3NG1UUitqcWdQRDZIZzRScDR4c0VXUXhGRktNeC9MRjVydENqa2RBdlpa?=
 =?utf-8?B?a1I1TVNvbElXY0x1bUFqKzFwUldoc29Ed01yeWpkM0Jqb0dxenc1dTlHRVph?=
 =?utf-8?Q?yMBUQOjdqbkWV9QQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d7c21d-0f8f-4340-339b-08da417b10ee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2022 13:56:44.8269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpA9DvIqRHnAGaCpqd3ogilQFiU55hoAoB8TdVk3zST+yCyqN/5g5EpeoemNeALvQK90n1xynMq8qQq5yaygmJEl6/oHe3tiILX9wC5/2sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3874
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 Mark Brown <broonie@kernel.org>, lma@semihalf.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 Guenter Roeck <linux@roeck-us.net>
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

On 2022-05-29 3:50 PM, Uwe Kleine-König wrote:

> A more short-term fix would be:
> 
> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
> --- a/sound/soc/intel/avs/board_selection.c
> +++ b/sound/soc/intel/avs/board_selection.c
> @@ -325,8 +325,8 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
>    	num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
>    	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
>   		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
> -			num_ssps, mach->drv_name, __fls(mach->mach_params.i2s_link_mask));
> +			num_ssps, mach->drv_name, (unsigned long)__fls(mach->mach_params.i2s_link_mask));
>    		return -ENODEV;
>    	}
> 
> i.e. explicitly cast the return value of __fls to unsigned long.

This looks very good indeed. Will you be updating the patch you had sent 
earlier today or would you like me to send it instead?

If you choose the former, feel free to append:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


Regards,
Czarek
