Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0F4977E1F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21AF9DE5;
	Fri, 13 Sep 2024 13:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21AF9DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225254;
	bh=3CRIJDTgyU+3v/d4mQ+7b31NEEvqZf8d6pbCC9Jxo8w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iand+GRfg9azD8VBAVaTehkJ+uOges60XM/2TEj2Yi4yDZseQkcPHpcRXs4v997kB
	 HXEqG9hkUjcjxjq5qVhLR43WMkdpkwb8DQ9/HbxZX7ybieYYNkPttRyauNhIOxwZh6
	 8opTKYCLmDHVw2Yp+0WNfy4IgdHM8X6w+bVVYXKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B31EF805B1; Fri, 13 Sep 2024 13:00:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA1FFF80536;
	Fri, 13 Sep 2024 13:00:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 732A3F801F5; Fri, 13 Sep 2024 13:00:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B80E3F800E9
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 13:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B80E3F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O/n59POH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726225213; x=1757761213;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3CRIJDTgyU+3v/d4mQ+7b31NEEvqZf8d6pbCC9Jxo8w=;
  b=O/n59POHR522lQCJ8HMxuZyDpQjM2OBNrgaMHG1i+iFG4beL8Ji+88Ay
   GxHhXDo7EGpn0sl+1IG4ZWddmpB1GDviotX78LSRR/mHnSqQt9f9lqmjO
   i2dOOTR1LpBKDVKjYFiduWtlzrw6TZD87THFz6N0RkJmGTmG6ZJZbBOTh
   sBQBVebySt521o3iMFmDkou8djRUH0rl3HqUtSg9KWN4paGHTD68hWoFX
   ogg4/yua3M7aJGNaUmr4+ILrdeVcOToR6nT9ilc/jxc81Jjb1qTkYk8en
   sHk6YLWV4tX6+s5nFVOl+JZY9orcVro7343XIiAygcULRUcgiMZHw7tmQ
   Q==;
X-CSE-ConnectionGUID: 8ofV11y+QVqESCqKVfeiyg==
X-CSE-MsgGUID: /y8oBtRiRv23uD+QE60GNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="13510992"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600";
   d="scan'208";a="13510992"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:00:08 -0700
X-CSE-ConnectionGUID: 4+lMMQXwRcuyexdQutPvMg==
X-CSE-MsgGUID: b8lhNUtcTNyaI4EjalC7YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600";
   d="scan'208";a="68106451"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 04:00:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 04:00:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 04:00:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 04:00:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/G9FodqzNXYDxsEhwMGqt8ZguYcRlJ9Dz7YoUQNSg7lVo8njsuAWo632b8Wql52uZ9yEEGjLERAo4RTCsTNccBrk7lJk3MqWt32mgw7gPu3/GaFlIK2YJReEYKI7KRDv93VlqyQ7I9LMrgMkXflMTMdRAu1jxIDhnPQ73etf4nsWppzzGU7f7BOUEr58LIQnIf1QqxaSUpE3IQ2lHn320G4AUvuX5a5TQoqr0f2ztLifEw6XQVnJMz+HwOAhonuAfVkisUeoc3Eh3Wb+igBUpp8qIzUPT3gjkfOcUH1zRLsM/B4sTA070DkSkzZ9q2/4uYbcfUzuCJ/w/r70Wzpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aixGQQh0oILfy2JLfVKiHKgPIcVTyt9+yY5+EGWzWC8=;
 b=Xbef6VvlM1K/5U70GvlJ/aHnAdgzMrheFVBchNsa5u3/wzTtxZzn4Dq1yJWPTAGLZaNbIsq4PB87EHTFVdNd6NyV4MZU6mIfZvhrilxBtbmP0RUr3WL/jjgIIIPr0DRUSLalaOYfVuWMZc7hjeVKCJNeEyQRhlM7TSq6XlEjKFbU/A9ziTVPCVkoMwPeJwV9Rr2d3w2wTu3DJVp6e7UahHPrDCn2glZtbxopbdsADs1ZbR/BOqeqV+s8t1kc4+mE/9TUxl7Z76izMTX076R3dfUsfL9RUMovYWNBGeHGu+Q/KQO+i4tc8QdZjI8bbqqtwrCZTNQOFTWGqDsbdrLWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.19; Fri, 13 Sep 2024 11:00:04 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 11:00:04 +0000
Message-ID: <b95e8c62-db61-4678-8c2d-2224dfb1dd60@intel.com>
Date: Fri, 13 Sep 2024 12:59:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
To: Mark Brown <broonie@kernel.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<hdegoede@redhat.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
 <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
 <2ac45376-5df6-44e9-83d6-cdea49eea916@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2ac45376-5df6-44e9-83d6-cdea49eea916@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0045.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::19) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: 284f8730-f069-4b1a-ffc0-08dcd3e3386a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?ZGhVSG5EZy9COTJJaVBMTXJPUUw3UVRrd0hJR2FEckM2SGtVWjU3WkVvbjBl?=
 =?utf-8?B?Nm9CMUlaSk9JdTZYTG03MDVvTEdmd1VjVGFTa05vcVBDZ3hCOU1tay96cEZI?=
 =?utf-8?B?MnViSm9ReEh5alJOdDdkQTN4blg1am52OTBIWUY3UGdoM1JTc1QwUm1BVXdG?=
 =?utf-8?B?a0VSR2dJY2M2WjVneit6aVdYTVV5c3NmcXNNdlNVUXVEOWdTQXlRclVvWkFw?=
 =?utf-8?B?QXE4YURLbC9kYS9sTDNPMG11czdVaEROdklTSFlaM0lNU3R0blE1U21HS1lt?=
 =?utf-8?B?YkFDcU1Ua3BleThqQ0lsRDkvMER6UXhyNWZSZDlraDZJRC8xNWNIdlEvK1VF?=
 =?utf-8?B?d0ZkbmNPdUZqTGo1Qkx1S29TWDljaTByY3M3ZEFPd1E5NVJNRFE0K08wYXk4?=
 =?utf-8?B?akhuUkpKZ1BZMnlxY1gvTnJzRTN4Y3F1L001K05KeWxZL2RTLzdKcUR1dks4?=
 =?utf-8?B?RzlBQTl2RlI0WnQwdHl4cHR2WlBvVGR6N29pWjhhVFdvNkl0NEdnNE5YeitD?=
 =?utf-8?B?TWhZWWZjaklrK2VGMnk5M3pGK1pJMi9jVXVwUnczOGF1c1YxRmppbWt1MW1s?=
 =?utf-8?B?NVhNcC9pR2JlenRCOGZJU2ZoZXFFVVRnWnpxbDdTOTFWUDBrT21GcStxMmI3?=
 =?utf-8?B?L1lFNlJDOUMwbEt6YllJMllMeGl5SFBuTURGaTl3YjM4Uzlnc3c5VjdiS0t5?=
 =?utf-8?B?K3NGMkJVOVk1S3RRak1tUXJ0SjR1SXJReEU1OXFBM3pOZ09MK0JXRUJRMjBO?=
 =?utf-8?B?M1Y2M1lxQU8xZlFMc1htajh2YXQrQjdHYVRWekE4Q2NMT2RvZ0NJb2RZc3Bu?=
 =?utf-8?B?UzdxbUs0Q0JSVkR2VVYvMHEzUld5ci9ma1poc0xzVmdhZFpUT1gyQ1lod0c5?=
 =?utf-8?B?aTZWRzlIdXBabEJ1aFYwK0RIcnhvWWt0SFErNnVqQTNHYWZnSEhRUWRIbWJU?=
 =?utf-8?B?NGFwbk5Ob2JjVTczYTBuOUxpTTQ2OERQdVk1K0VyQTlvQ3Vzei91SXo4SWFT?=
 =?utf-8?B?SUFjYi9hYUpmQVkwMjJ3ejd1NDdFVzlsOWNlVm90UnJRZGdyS0l3Ym9lcXVW?=
 =?utf-8?B?UnE1ZXUvQ2FJMnQ1dkRteTdpSmpWQ0U2QS8rZStSSElsTlJMTnFFK2E1RnQx?=
 =?utf-8?B?RGxzUzVGRHZsV0dNeHd5a0ZLYStOaUViMFJpNnZ1dGRhMjFyU3RMS3dPYy9z?=
 =?utf-8?B?TkE1N0pmaWVXSTNzKzg4dUV4SjZ6WFoweTY3ckp4K1IwUGlRNDdGMU9zdElM?=
 =?utf-8?B?b2s4aWlaNnpjRFJTVHZJTlV1WTJrVUlGc1JzS1VONm1vVXQrMi9BMU4rbXFu?=
 =?utf-8?B?UzdMTzlid084eHV2RGtkcFljZEF5SDJXbEVZNDdMbUhCYm9RS2swK2VqSVhK?=
 =?utf-8?B?R29oK1dqdzFjU2VxOW0xL2xwRC81TVBLYm42S28vNytESVFua2VIQVI3M2w4?=
 =?utf-8?B?ZGRFQWhqd3VjcTl6S0lSWk5BZzI0bTJWZmFKTDBiMkhFano0eUwzd0ZHM1gx?=
 =?utf-8?B?V2FjSDNmMEcxWDU4NTNETUV0SFZMeEh6VEV4ZlAyQytkK3JWSkNjRm5hRHRJ?=
 =?utf-8?B?UnY5Qmx5aWViQ1lDbVp5eU9PWDBKdTlFNEozVHc2WXg0Y1VKSk9BMWI3cFdw?=
 =?utf-8?B?Yk56MlQzZ0JIMHc3cVpzU3pzY0dVOExwSVVCQksxSStDK1RHK1BLbGRxWFhm?=
 =?utf-8?B?N2x5RkNEUGU2aXRsdkRSZlhnaTlUWXZzOUJEdlZoVFE4YnUxTEZQT0hZQUo4?=
 =?utf-8?B?M0Vqa2RxUm5LNDZ6UW1nSyt1THg1TjJ5TnVFdHZ1bHdIa3pJeWdYRzU5N1RV?=
 =?utf-8?B?S1I5UTZNaCtKMjZZVXR4dz09?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?L1JjakZta2NvMnl3am1YTDkzc2ZCVTdtbGtLQW9DbXpXczE2aldkYmtwRUFO?=
 =?utf-8?B?RDA2d3lvY1Y0aTQ4VHp2dFlQNEp2YjVuank1eGtQS2w5d3dSaUR2WkxQNk5u?=
 =?utf-8?B?K2pFQ0JWTTZkZnk5RmRiNUF6SDRlcEluYy9UaG0waHBKQThSNW03bitwRUJS?=
 =?utf-8?B?SVBKVTBOOHphaU1KYXY0OFRHZ2RGNGJnRUo1WkZCTEJSTEtBU1JHNkpNOVMy?=
 =?utf-8?B?WDkvcFoyYXEycG1RSDA1Qi9oR3Z6bk5HK2RlaCtZZTVpL2h4NzIyd2ZLY3Jj?=
 =?utf-8?B?SGJuTW5xVys0K1JuRmxjOGI3ZFU2WTYrMkFOUjhqZ1NkUnVYMDVnVjhTdHZy?=
 =?utf-8?B?aUpsUXNkRjJ6WTY1VmQyTEZQb0RLR0VTaVhTOWtoc0s1aDZudTlFVDUzVFJn?=
 =?utf-8?B?VWpIOG1WaFlJSkxnbnRLR2s1SGYreEdRV1ZCYmQwUzk2TzdRcDZVTGpIZHBh?=
 =?utf-8?B?U3c5bmFTb1FnWFRIZEt6SGlvR1VrSW1vdU53VkloamFtcnlMelVGaXZxdnIy?=
 =?utf-8?B?YXNpM1dzb1lMNHVDN0gyTnBGMml3STFBVmhzc1g1SGgxOGFMVERJaG9aMWhq?=
 =?utf-8?B?QVpsL0pISC82MzZPaWxJRTlEdm5oQlhvRlpqaWlQb3NQYTdUMisrSHpiSlgv?=
 =?utf-8?B?Ti9mL2tHQTF5djFIUUpIQUZkMlZpR3hLaE9wYThpMDFMYXJzeUNtRENXWE1Q?=
 =?utf-8?B?NUludGNaZGVmWGw0SnNETUx4cUZhMTJDMmFLOExPMi8xbDdSR3JqMDhDbzRC?=
 =?utf-8?B?OTh4WHJtYW5MYW14L3lldFNLRnUyTFNqT1dqVVFBdHlOODNPT3dPM0crNzNi?=
 =?utf-8?B?T1VZYW5LMzByM29PWGt2TXBycm84TDBPR2xFMVFRM3dyV0dJbTl3SzhVaUVx?=
 =?utf-8?B?b2ZtVU5SZ2cvdXNTYllEWWUzNE5FK2kwQlJXMGtBSlkzMUR1cERxK0NzcEsy?=
 =?utf-8?B?UVFoUUc1OEw4QW04bDJJV2JjSGl1UW5wS3dqakNTMEVQNFA2K3dubzlWWjlQ?=
 =?utf-8?B?eVhHUU5jZHF4N2ZkNHYvRzBrcGRXR2w5N3RoQ3p2U3VySy9lM0RncktnR1Q4?=
 =?utf-8?B?OWJnUnF1MWhGRGVzei9Zb2NSdTdzS05iVmxXYTdUZzBGV2ZYK1cvdlFvTGdz?=
 =?utf-8?B?cXZQcVRhcStBRks3TG5MS1RpZWJBTklGV0ZSbWlHcFRPOGtWUHIyREZkSDM2?=
 =?utf-8?B?dStmMWhvLzNXV29yOUk5amVYRWFNOERlcmhBdHVuTWV6eTV3TGgyWTZ3QWFN?=
 =?utf-8?B?TytJK002VzJDMWIvUUVxY3JNRWtOWW5odWdoaXg5V21DUitkV1NwWWtrd1Zm?=
 =?utf-8?B?U3JtRnJieGJrcWtUQ3RDd1J3MmVJdmEwZEIzTWlyRzFiQ3ViNVQyMi9PcHNF?=
 =?utf-8?B?YlQwdFlkMDBtcXI1dE4xdHVuZ3NCQWlwRk9vM1N0dDhtT3hKV1RPQ0UybXo1?=
 =?utf-8?B?cTJLNE9ZbkZOLzNQdlRLaTBhT05Cemo5YmlaakdXU0VYdTZlYlhKb0xYQnpC?=
 =?utf-8?B?bVBmRnVoMml0bWxUSjloeldWVTRHenlvMHZwM1YrOGtYL2dkZVVBOTY4a2gv?=
 =?utf-8?B?WjFGVk5UQ0V1dENCaGw0ZkxZcnc0WEFQRXRVVDJhR3E5eUpNVmRoazB2dXZC?=
 =?utf-8?B?Qit2U3BUekdNZ2ZCcnlvZEErbk8xQUFGVzdZdWFqUnErZmMybllMbkNGQlVO?=
 =?utf-8?B?TmIzVHNHaFlySkQ0ZlNCVjhnajJPTW9mVTczazlhS2JKcktGc3BrdUNEYnBn?=
 =?utf-8?B?N0k0S2pqU3o0Y2RXSk1rN1d4YjR4bTMxSllta0plVTBQUU5iekQ5UFhhRkZT?=
 =?utf-8?B?K2xxVVErRW5kK2d5RG81QjJFNDV3OTVIWWJwTXNMMGZHR29sZG4wZjI5NkdV?=
 =?utf-8?B?SlorUkF0eE1CdkF6ZC8vZ09sNUp4R2dGZ05yVDVXb015ZnFINi9GWHozNE5Z?=
 =?utf-8?B?RE9YNmJjMmxxblV6MXhNcFR1NU92aGQrWGorOHdrclZKbXNubXV3T0I3OUpI?=
 =?utf-8?B?c1A3bUZJYmp3c2lYZ0l4K255Sm5Ka3NtU3ZzQnhCNStzSWRJWC83c2NjckxF?=
 =?utf-8?B?UzloVUYxcVU3QXgwK1hoeGswUHhac1l6K092cm1Zc1lyOUJPT2tDWjFod1hL?=
 =?utf-8?B?RDcyUW0wUWx0UkIybXJ2NEcvdWQ1YnJ1WHIxQ3hvZUpMV3hsR0I1UXJEQm1F?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 284f8730-f069-4b1a-ffc0-08dcd3e3386a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 11:00:03.9962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kdmDohQUps0iT/dwd4sK7zO3YkNCx32cjvC/DDy5LrMz3uJUYjrOG0E752ypRbxQOtlP/GYsapDRS9IIkYdlceMtsT46S0Iqx+7XsFQo+kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
X-OriginatorOrg: intel.com
Message-ID-Hash: S5QYCKHDR7R4VT27JGHXXVKIJZNGJEAK
X-Message-ID-Hash: S5QYCKHDR7R4VT27JGHXXVKIJZNGJEAK
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5QYCKHDR7R4VT27JGHXXVKIJZNGJEAK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-09-10 10:14 PM, Mark Brown wrote:
> On Thu, Aug 22, 2024 at 03:57:22PM +0200, Cezary Rojewski wrote:
> 
>> You've shared many scenarios, I do not think we can cover all of them here
>> and while I could agree that current FE/BE (DPCM?) design did not age well,
>> we're entering "rewrite how-to-pcm-in-linux" area.
>> If general opinion is:
>> 	it's too much, we have to rewrite for the framework to scale
>> 	into the next 20 years of audio in Linux
> 
>> then my thoughts regarding current review are:
>> 	if the avs-driver needs sideband interface, so be it, but do it
>> 	locally rather than polluting entire framework. Switch to the
>> 	framework-solution once its rewritten.
> 
> On this bit as I mentioned in the prior reply there's been ideas for
> redesigning how we tackle digital audio which I think there's general
> agreement would be the best way forwards.  DPCM is very fragile and
> creaking at the seams, it can't really represent scenarios like the
> sideband case you've mentioned well.  OTOH a redesign is a very big lift
> and there's never really a point where it seems constructive to actually
> block things on it so long as everyone involved is OK with what's going
> on.
> 
> The upshot is that while I'd be *really* happy to see investment in the
> framework side of things I probably wouldn't block a driver specific or
> DPCM solution simply on the grounds that it's messy.  DPCM would need
> buy in from other people using DPCM of course, and hopefully at some
> point someone with one of these issues will find that the cost of
> maintaining a bodge is going to be enough to push them to do the work
> (or someone will have free time to just work on the issue).

 From my experience when it comes to redesigning/rewriting entire 
project, the "upgrade an already running train" strategy does not work, 
so I'd not recommend that.

Instead, I'd suggest to have a second, separate DPCM implementation 
present next to the existing one and have users opt in during a 
so-called deprecation period of the existing one. Once certain amount of 
time passes, switch all of them. Clean slide also makes it easier for a 
developer to be creative.

Do you view the second option as viable?
