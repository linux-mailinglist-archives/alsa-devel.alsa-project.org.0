Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A9D54C94E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 14:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3676B18CD;
	Wed, 15 Jun 2022 14:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3676B18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655297952;
	bh=e/ne+I23t1osDRPbQEblJcGkdKrldYlTdH89gEznt2I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PZghP4xKPlXz/iGSu5dhZ4UpWLZBwqwCsttwPcbo8+k2eXhDgD/lppCat9F9pV5oJ
	 zUZruoChJYucIFbr3pH35uqm5z4Wt/xJ27xj3pCKI7098XDzqv9eGe4C7vFSbV1PjD
	 A1T0qHZ0XElSTExhjvJvzCQI/KSdXCSqCU2tJlcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E344F8016C;
	Wed, 15 Jun 2022 14:58:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BB79F80162; Wed, 15 Jun 2022 14:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F4159F800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 14:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4159F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AcbH+l24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655297883; x=1686833883;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e/ne+I23t1osDRPbQEblJcGkdKrldYlTdH89gEznt2I=;
 b=AcbH+l24QuxXhrQwTf3ulbYL46/bsXwfh5SeqEgHa8Gzb8q0XSjYJQ4h
 4dhpOtGNHRdA4Pnj2xzymQJC9tQxuugIKUjQTjUF+obCmWzlKZVONxHDb
 T5NCmpFq10WbJEnfcZIyIBRgzCY21WlnSjJ9QOCZ3xVbsBwOSOQ06k28W
 7D1UunhACCDckHwG6PYgzdbswufHd2T1w1vtgay+EstCBozWuU3aUjuU7
 LtiKH2I5fgXoskyZNb15R3rlUFM7nRfr9z75ZUwHhKaefE6IATPZUTvYi
 j96wBVLfYpnVkRRmrFVE+oa7V1uBngXXlb5YI8D5ytWm05bLpm1CU3fsr w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="342911016"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="342911016"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 05:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="652649184"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2022 05:57:56 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 15 Jun 2022 05:57:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 15 Jun 2022 05:57:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 15 Jun 2022 05:57:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wz9H4wm5t35c4KkWHE848C8XvetUL1Bgutai4KGjlpSufPf5KXBZsM+IFWYICz2xc6qGd2uGzz+5KiQJGLLLLfIO+Zd1pv71fe+aOaC+awSxxLOjWn6epRxaDNqmOwxXigb7HyRwdO8SPCC1461fioxC5+y3sv+eGvqRAx39WJuwZDurQmKABZIdKD9PZDHhXzio1ZijpJwhJNbCnnJIlNRKRig4WRMqM/PiS2lKEIOQkSkDWoDtM5HtvMUKBvBuTt+edjmlBbjd12bGqwBt2B8dkEvAAM+9PFope6l1Sqh2JKhI3ZtEFV/J9JEeqNNSdwRjTVvKpXEjQOkYmjIJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r31hyASXkYmVSQBUGzCoOHFPjaag9/ygH+txbyYBOhI=;
 b=Ekj54Fzxta6XCsFyFKi5qTKVpMAdtJ82Laz+eNbGvCpWt9sZExVeKELoJeHxFWWBTd+WwKAeP1EnVKsE7Z79ufFsRnRPvFSt+KGfkOneMhKsBTSr8TQLMC5F3IBsj5VaZ6cUQBJgLhlWaNfWv0LFc2UFDGgsXNL7RqaV24YJkTwvLRb8G3BvI2JwSxPlfkEPoAeJRw4gbpc+7sbnHOJYJ6VM0bX/EL782tw3HZlkHs8u7Spo7Lj3dxFbS0xn7Wyad6WUIeUMqiLHNO3UakPJwSwR0LC6w2/m6UtS0ow79tvLspQeCYAcWVdr52I0eVl60/PxxYbT6ISp1j/XrO0TXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Wed, 15 Jun
 2022 12:57:47 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c%9]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 12:57:47 +0000
Message-ID: <1391e54d-7b6f-7b43-d979-ce08febd2378@intel.com>
Date: Wed, 15 Jun 2022 14:57:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v2 16/17] ASoC: Intel: bdw_rt286: Refactor suspend/resume
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
 <20220613091546.1565167-17-cezary.rojewski@intel.com>
 <dd6633cb-9db5-ee61-fde1-32b4e8d0e086@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <dd6633cb-9db5-ee61-fde1-32b4e8d0e086@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::23) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7dac685-98a9-485c-5654-08da4ecea5a0
X-MS-TrafficTypeDiagnostic: SA2PR11MB4969:EE_
X-Microsoft-Antispam-PRVS: <SA2PR11MB496953369C733243115FFF59E3AD9@SA2PR11MB4969.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36E2/rw3AL7/F5pELMFoY5VPoPhzaNK12d+x/1TOiWK39IZPMdphFzEnY36B4Yc4lyyUMFc/R6c2jOzSHoP7MEtolts1K/OGD+tSazZQCxRvoddqROi16u4a6PIvDg+2MxbXsP/yeQWpKAngrQ6Te3YMmphYydvkIYpzxlsTwZ9I4fz7mCAO8K0ndhhaD3I7lTZzYj07slMbigFLUgPHwME6KizP95Hqamh6pYqDVnweJXgTDgrhKQiOlTIaBuk2yWDur49u/wfoM8tUbDQr4wPkLyNygZvsiuAZlhwIFMnOkmBpdDlUedumP+PpugbFZDXc2rzswSvvSAmKg6vvTGFauGV3sGfuJtLJbvuiEkmYn++Z6eRFczQkXd0RJuz7l2hwmESMbbLatV3+5XB2+2bwM7GJJZlU6WzSR0h65XlA4n+tdLA0fVSMNO6KH+KY4z88fGvbZdrPiDatVUIMMiodFl2GIX+GaZRNVKzVmTR+ZinvkEzDrqMljqCqmMF9vC6czw4038g8wkEVY3u+6bVvwgCW7KzJOeiULI0Km7u+F1cChtQ5im3Qs6zQgD1rxdAUtL4kEO6xxO9MDgQ1ei2MZNmOjT+XzW2C61HPoMR9ltbe7MUC71xA61/TTx05BZgIPyIwkgr7ahC9N6e3HgqkeOPNQscG4YAb8PSOZIHRIQOyzOBMcuXkl/J82kARiKAKs2Jl0NekN7K9Xirxs7Hprze1YSk2bRZg1zzsQpdJWAQ4B1cdCswwpNMZ49Op5olWFtuk/2QyRfPs2WDFOYAQMBHm58+z5gwE6eU2AjpH0EWP6UsUjEp0ni33Es/f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(186003)(6666004)(38100700002)(6512007)(508600001)(2906002)(15650500001)(44832011)(53546011)(66574015)(31696002)(26005)(2616005)(966005)(36756003)(8676002)(4326008)(31686004)(316002)(66476007)(8936002)(66556008)(6486002)(83380400001)(6506007)(5660300002)(82960400001)(66946007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVZTRDFvUUJmSURpRG1mdG9hVVdLSENab1kvb3BjcG5mR2orb3RwcWhTd3Q0?=
 =?utf-8?B?K3RQYmFVd3RmL3pDRTVRL2h0ckhUNDdOczkxSmFodDdkWEVqd1l3a3BUOEta?=
 =?utf-8?B?Vm9HZ1ZzdTdsZ0dBUkRvZWtqMjNFM2dJYjFyTzBhMk9UcTZhdTdxbW8waTFV?=
 =?utf-8?B?RHQ2em9LTHZFcHRKVEVkMzFvWDBEZ1U4YkJjMFZRcEFTL1NndXVyckl5d2dh?=
 =?utf-8?B?NUNtMlZnU3prLzZSSEJlcHE3cmJhWUhWdmlCU09lM2xJbXh5c3RZQk04T29s?=
 =?utf-8?B?NGY0T09waGI0RVZMc2NtQSs4QXR6OXlZSU5OYkpMRVNCZlZ2NncvcU1yYmpY?=
 =?utf-8?B?VmFicmNld3VpNUFxbzd2a2IzTXBFckhRMGNaTE1xZTl5SUlJRVdtV0s2Szcx?=
 =?utf-8?B?RXBXZlN3N2RQK0FDRUxXdWtsK0Frd1M4MjhjYkFxNEVoZnVhbm1JbUEzM0xJ?=
 =?utf-8?B?UVMxbkl3Qm5uL2cwbVdWNjRaQk0rMU8vRUs1WGxXcS9xTVhJWE1lYUhVZExU?=
 =?utf-8?B?RU11N1dibHpHRlU0dGhtVGNYQWZTTmV1Z1cycXlwbmwyeE1MajM5MHJueXdN?=
 =?utf-8?B?YU8wTmJRL3BQT0Y5cGlsU2RhQ241SE1taWl4eHZ5ODRCNTZibGZWemdIeUcr?=
 =?utf-8?B?REVoMHkzcTU1S1VTVUZxSHVvUVROQXczZkpnRnBOK0JnZnVRVXlIbEViNEZu?=
 =?utf-8?B?MlBLdGQwNms2c3NHOVo4RDA3VVc2QWZRc1F6SVljaGdBSFZ4YVlMUWlnc3Nj?=
 =?utf-8?B?UmVMM01NT3Vja3FrU0RYWE5zSjNXWDd5dU5KVFBMU1hlb2d6ancvRmo4RXpG?=
 =?utf-8?B?LzhINDk3Rzk2VnNCVm52R2FwcmtJRVBTRTQ3QklNRlhXM040ckloL1BkNmFr?=
 =?utf-8?B?QnVuVE5jS2hyYTZvSkN1N1liRWd5eTB4THZENm5tUTJCMktGQTRISEVTYVcy?=
 =?utf-8?B?WHpwOXZTSFZtc1owYisvQjRPRmlZMGM3YlNWODFtbFhmTDk0QUh1Y20ydDdP?=
 =?utf-8?B?QzdKVmMwYmR4ZXd5dUU2Zzgydjl6dW11WmdiSDF4ZEh5WVk2RWdBaGp0bXVx?=
 =?utf-8?B?VXBCWWtYVlRtMTU5b0h5RFdNTldQV0lmbDRobHlyN0IxMnhXaDZxVU1OWG9Z?=
 =?utf-8?B?b3haK2JlVFVPUDZzMHRBUjhPam1DRFM5WmpGVjBpN0d5VGoxdjJ5SmxzQ0oy?=
 =?utf-8?B?K0c2NVNBOGg0TGxFR0RyU2NEYzRhZFp3cG85dys5UElrL2JTc3Z6U2Uvd25N?=
 =?utf-8?B?dFN1Rk5hRk5rLzV2VjdIMitNclZJSC93b1JkL2pISzJCckhqdUp6MXB3S003?=
 =?utf-8?B?Y2lCL2xaempYSkhmNnEwTDNRK1BtNkZ2UWdKUFRKei9HUFdwTDRLMTVCbm1H?=
 =?utf-8?B?c09qUzBWVXRTSFhxZFhzd3FJU0lxU29DTUJ0QnlsN1FPdFZrQmQ2N05JSkl4?=
 =?utf-8?B?SStXbHpDTjA0VmpybjR1VDNLZTNnWExiZHVLTEQ3MDZFbWM5WXFmazdTaUNp?=
 =?utf-8?B?d2hWWkJmRXc3SE91R2dVRzQvamtCbDUvSDV6ckJzVDh3TjRIUW1NdGc5WXh4?=
 =?utf-8?B?WG92ZmRSWmFaKzEzOGt5eEE5MVM5dHZqQlA5M3ZyZWV5T3ltdWw5QkR4YmY5?=
 =?utf-8?B?UWIwdkdXb3BTZXZDY1RYbGZCUWJ4UVJ5bFZ0TTFmdGxuWXkyc1p4RnV1RzBZ?=
 =?utf-8?B?cFJBaVJKM3oyeXhFd01QSFUrRTlGNDJKemU5RG0zc2dlcmpxaWx6cmlMRjhS?=
 =?utf-8?B?clJuZTBaeElrNEJwdWZibFlld1l5dEk5WXBxN0tXeWZ6SmlVaUljellYVHNY?=
 =?utf-8?B?bTB3SE0vSlRzUHhkVDJmWUNaVjR6MG8wL0pNek50K3ZwTE1sd2Nld1NwOEU5?=
 =?utf-8?B?NFBvZHBSYUF1Ky9SMTNBR2Z1OVVVbks2MGVIdGRtZVNBSy9oOGpXd1FuNlE1?=
 =?utf-8?B?L1Z4S2x3a1pyZkFubnBxRjhrOS9rT1dsdFdlWmtqbWpiMVp2QUFjZEVJUFEw?=
 =?utf-8?B?OUpkZVdGSHlpemx1azdJVm4reXBEbWkxUFpBVXRGQ3A0aUFraGJQdkEzS3BU?=
 =?utf-8?B?L21EOEpLV2xYUG9vZjkyeFhBUmxzVWhMbVc3aG1DK2FwU1VicVo2bzNtSkUx?=
 =?utf-8?B?Wk9CWjNVWUhFZlVMcDQ3dWcrcHdSNzZsc0ZNKzJmQ28yL01aRzJCb0hWeEhz?=
 =?utf-8?B?UjZ0dFB1MzlpYkJ1QkgrUnppQjFiUnhFWDBxSy83N3RMSDFmbW45cXpOQmRS?=
 =?utf-8?B?ZGw2blo4MW9qc1BxWVVFRkJXYmJlOUxDUUhzRG12QW1mMlZKcGZ1RFZSSm5l?=
 =?utf-8?B?OUZ1d0JQdXdHd3dIM2J6TTI5ZFdmbERwaTNoSWpGekp6SFMvb0VZNTZMYWVh?=
 =?utf-8?Q?ZwES2q5SZN/trgg0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dac685-98a9-485c-5654-08da4ecea5a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 12:57:47.6261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlrM647CysdKUE4YEv9UzcGywkHF9u62D1QO5fLR17NSgcYWs4f4WDH81Gy2hmv8YEEiBqQeNd7IMduqEaQ7fz/G+KBq1qxzysTo4Pj+wYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

On 2022-06-15 3:27 AM, Pierre-Louis Bossart wrote:

> On 6/13/22 04:15, Cezary Rojewski wrote:
>> Make use of card->remove() rather than pdev->remove() to unassign jack
>> during card unbind procedure.
>>
>> To reduce code size, define unified jack setter in form of
>> bdw_rt286_set_jack() and invoke it during remove(), suspend_pre() and
>> resume_port().
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> 
> This seems to have rather negative side effects in our modprobe/modprobe
> -r tests?
> 
> The pattern of disabling the jack in the platform device .remove is
> fairly common, I don't recall having seen a machine driver doing this in
> the card .remove step. Are you sure this is equivalent?
> 
> Reverting this patch removes the kernel oops.
> 
> I don't have time to debug further - but this adds to my point of
> minimizing risk on legacy code, doesn't it? suspend-resume is difficult
> to get right, and easy to break. I have done the latter more often that
> the former.
> 
> if you want to reproduce the issue, see
> https://github.com/thesofproject/linux/pull/3696
> 
> and use sof-test:
> /root/sof-test/test-case/check-kmod-load-unload.sh -l 1


Thanks for the report. Indeed, the latest "optimization" broke the 
card->remove() path.

Jacks are often initialized during dai_link initialization which is 
completely out of platform_device area. This report made me think 
further - if we assign jack in dai_link->init(), we should be able to 
drop it in dai_link->exit().

Not exactly! ->init() is done once card components are already accounted 
for (available for use) but snd_soc_link_exit() is called during 
snd_soc_remove_pcm_runtime() when card components are available no 
longer - soc_remove_link_components().

TLDR: teardown path is not symmetric with its counterpart, perhaps a 
problem yet to be addressed. I'll see if moving the jack-NULLing to 
codec's DAI ->remove() won't be a better temporary (?) solution than 
reverting to platform_device->remove() usage.


Mark,

Is it fine to leave v2 series as is, just ignoring this single 16/17 
patch? Or should I resend entire series as v3 without this very patch? 
I'd like to address the problem via a separate change.


Regards,
Czarek
