Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ACB8C0EC1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 13:16:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA692E68;
	Thu,  9 May 2024 13:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA692E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715253373;
	bh=DBd9AEYEN/MfpG8IQtdMr/YaX9Z87PkpVZriflKZ1ck=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rYRM4541n8TP5wl862gP3Eqc6vnLMbE1YphW0LopFmjZUVX0b8AWTWRxeFC27+DWP
	 hQzbTa+KbC8UaduomDQBVM2GnB+P0QTI0mtvG7mc1atF4fEGodcrkFPdUTOnZh7ge4
	 7PGIpICeDpWFx8F1eXkupJA1xDHlA7BCew4szGiQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 013B2F80587; Thu,  9 May 2024 13:15:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6226BF80570;
	Thu,  9 May 2024 13:15:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 403FBF8049C; Thu,  9 May 2024 13:15:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F35C4F80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 13:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F35C4F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TPkF7F4p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715253330; x=1746789330;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DBd9AEYEN/MfpG8IQtdMr/YaX9Z87PkpVZriflKZ1ck=;
  b=TPkF7F4p0AxMab/869FLgM9/5/0nK4cot82m7atwHFMm2g2nfMe+YP/K
   HERspgSMfzU25IbjLjbE3oLobVLK0nL5fqiTLqFIw0az/9yVqkW5p4Z2p
   SnFUoR+mrL+YAYzEBOhJL+LZgkmwD9tqUQV8imAWcaG4e5RvFwjQ6xGg9
   sk1jDk+ORwC62CKgBYlYDDAIziuj4Yhtw4NRESXfL+RIzV9kkZgm6fPWX
   5b2ujnzg0DSU416F0zJCCJZVjz425oWnws2VJA4jiZ0otBS8a03HwVOtq
   8+TOL15IHWk1mJIWFuzgdj/Zpzyc5D3spliqsntpA1k+RGxHON78u/Xr6
   g==;
X-CSE-ConnectionGUID: /dZikOTkTsqO08Z/ncv9Uw==
X-CSE-MsgGUID: 07bInsC0SG2nO/eIwAa/2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14117931"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000";
   d="scan'208";a="14117931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 04:15:24 -0700
X-CSE-ConnectionGUID: K6eQ1vKRROK/oW3tv4hkvg==
X-CSE-MsgGUID: 6fkzuWoTQ/qdn/DnmthzpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000";
   d="scan'208";a="29317571"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 04:15:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 04:15:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 04:15:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 04:15:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 04:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2rTJfX6JliilXP9wszINe2AXsI4+e2fjPgf5SEXuaret/45UF0A5jX4Qxhr0tGqxMzbHyQcBbdE4MAhwuOddLe/q41D0rQRXcUfWD7MMfW/njyutio96U039+B7Mi2qKyehjEWBPVZdbExDPYOtjdcmZQqJzFJ3YwBQSmEhdsSwDHLWFJIPTtTiqea+CBVtG/50DdHqA028p8Y0/XXRy/+peclJD913fCvm4X+rTEKWfb+6HIQQgyg1rQNmPzfxRIc5CX8mWtMGY8VMxjcbuhuZ0T6aSVfdkUk2SKgF8jv3IwQxm5Rp9+AoULjMXaIYeyaNTNYVtWSfvswOzANfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wm2Q8O8MROZ58xc8O6v5jXd5ihb42H9ohTBc/fF8h4o=;
 b=A2Z981K+zCM1xYruscYP7GWUVVUv3hxZ7eOkITRxlCHrKhE9j8CiyKFGal8g4Y7+qRqvNdSi1PYa4qFYqed/kOu9Vuzg5TRGNsZm92KCSJY475AApzMVbKnNVFfvRKKNNxqn4Zy4UZuX6/NbDCeor4fYMhtaTPcvZPNSwLJrFuk2IhVCOSiLowFydaiCUxf3S79nAA+TfbptZ3DbYiDBzmHv1GglB3cZkeDzD+3qDc7zDyv6ym05xSPja0hFzqYl2lf8SQUA3SWplELkIO+EDwlaqUE2O7A5CfwmnEnLSAN9B7Uo6xCmn3UgWoqWMWq3H9WBdJPXSJrn1gBKQtBI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.47; Thu, 9 May 2024 11:15:21 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 11:15:21 +0000
Message-ID: <892ad456-cfe5-4ff1-ab67-7709677608cd@intel.com>
Date: Thu, 9 May 2024 13:15:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
To: <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>,
	<rafael@kernel.org>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
 <20240419084307.2718881-2-cezary.rojewski@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20240419084307.2718881-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 49896bae-fecd-4f1c-0b89-08dc701950f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?ZnoxVm1YWFFybHAvZG1qWTlZb0prMVFoNjRRY0ttYTV5YVVVWG1RNHVKempM?=
 =?utf-8?B?enBEbnRVSXkrSGVUazZwMmJ6aWZacVVLbFpyb0VTZjFTem93RDU0OWxRMWlF?=
 =?utf-8?B?M0pNSEc3TWM0OFpWU1QwSXA0a3BadnIrVGsxQnNBWVVMWEEvU3FwMmlJVVRC?=
 =?utf-8?B?T2hNTzR0OTlPSzE4Vnh5bTlQWDgzaUJjK3VPK2FXTUFnUkJmQUtWa0s4c0FH?=
 =?utf-8?B?N2ZRbWNOUW4xZnMrcW5JWUVYdm0zaW5BT2I1VndoMW9ML3pDeE1TVUhTaE1V?=
 =?utf-8?B?VDdZcFo0QVBFOGtFdGRsZDBqN3lLYzN6ZXhHV2c0eHczUnY0aDZ3Q01LRDNp?=
 =?utf-8?B?Z1JOQWIrL1NKZ1QwMS9aaTVqakx6SUNXZlJqWEorNGl4WVd5eUFIa0h1dXhU?=
 =?utf-8?B?SUZUU3J3TWVHcjdwTitpQUR3Y3lYWmZYNFptMlRoQnppVW5oZFhwRnAvTlJw?=
 =?utf-8?B?bC82UW5iS1JSd0V1MmtFNnhQYy81YzZpNmt6NjFsZDRoVEQrR3RHTU5TTzFD?=
 =?utf-8?B?TGJPQ1hURjMyQmg1UWN1VzJvVkpEMFEzZkdxMkZjRzNZZ0lKN0U3L2p6K2dU?=
 =?utf-8?B?dTZRVGl6Nm1oR2hmd0FmcXBldE5nV1QvQTU5Wll0anhvT3J0cG5IZzRBOUxW?=
 =?utf-8?B?bSs4bk1NRHBZK1AyNkg0aG0yak5KTlRFVDdmWVBEQWhTMVYvS0dnUktuME83?=
 =?utf-8?B?bVR6Z1FtV0hLOEthRzJpbFBJOGlIcXFRVWNzVTZySnE5dkk2REYxTUgxUUJq?=
 =?utf-8?B?RE5tRFk5MURjMis1RjVqZkhNM1dmcEtxNzgzQ0ljRmtnY2lPdmNOWFEwMUJM?=
 =?utf-8?B?UEpKS2V3SWtMZnVlYnZLUU16RnBVSFRuODl6NjkrTlRqQUJacXA2U2RCTWFB?=
 =?utf-8?B?MVk2MzRnemdPTjdMcmtkTFdYa2RqL2tkTlFTdkNQK3kzZC9MdlVKa3B0Mzds?=
 =?utf-8?B?YWxoVkVuaVdqbGE1Snp5U2VieWVYNDFWenRNRVlVSVJyYmZHM3NTTzU2b1Rh?=
 =?utf-8?B?d0g3Q0hFdktERjFJcmFtV2F4YTl4c3R1czdpU1JWTWR6UlJGK2dBd1lzRlpK?=
 =?utf-8?B?K1lDMnRFMUR4b0JOelpIS3pFZzNxUGdsOEc5aHkvYkRvR1lBazYvT1B1SUdQ?=
 =?utf-8?B?QmZocFBWYVl0elg5ZktQakQ4aXFrMmpXMHhUd2hhMTZBdTFkRWRpTXIwZTJm?=
 =?utf-8?B?T2ZzRVdwSDE4dDNGbWZQR1JlVExwTjg4MVc5elhrQ2I5Sy8rdUsyck8yY3NW?=
 =?utf-8?B?Sm1adDMrVVJIaGtwSnNQd2tQa2xLWDk1MHJYSVYwdTJuMkErTXU2MGI1RUx3?=
 =?utf-8?B?T3UyekZXNC9FZ0ZOVFBFTXdIM0pKTzFBTlluaE5KRUEvUWd6MnJLWVNITVV2?=
 =?utf-8?B?NGJvTk5xeGJuWU5rTlF4NUlockErbUF3djJtWG9MYjVPSzJQRnlyWkR3MEFM?=
 =?utf-8?B?WmpTRWFiaVF4dEtmQW52djJNM0VHUE8xRm53NHpOOGhvdUljM2JrZVQydEx1?=
 =?utf-8?B?eS9ZdDlZQUxrNUl0YmxjN3NEbnhjUW9ZUUJldUREZlN5S0ttUmt3VHhycG9F?=
 =?utf-8?B?Qm41TjNOa3dhZFBjZUZYZDFnMlRTMkJCenU2d3VCeDg5VDBSd0hQek9JMHgr?=
 =?utf-8?B?dkQ4UFVmMytBT1ltM1dMQlVqRCsrcnc9PQ==?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?V3QyZ0paRUNVS2JhdVp3aGpnTk9xTHFrcXhGTHVoS3JUVnBxTEpza2ZyVVBI?=
 =?utf-8?B?bjFodlVtVlBNNWZXWm1qVk0yWkJjeC9MZ21YamR5aklTajVaRnRvMk9iY3NF?=
 =?utf-8?B?QkFIcmZteDBvSmFyYzNCazlGRCt4c2w4bi9qSU1aeCtsRVQ1RXhQWHJiaFNx?=
 =?utf-8?B?UERmTGIwci9xRFQ3Z3l2UHJmeVZ3SGVmTitWclUrSEJDZTRCczhyVnJoNmJX?=
 =?utf-8?B?bXFVRisxMlJFcWpMUFZtU3pLMzhHSHJNMkFLUTg4RTJtelZINjcraG14M1pU?=
 =?utf-8?B?MDJvSmhWb3hTMTd3VkZ2ajd6VWhHVksvNjJRdWNvaHAySUNzTVZHRytIYUxi?=
 =?utf-8?B?SElXSE5XVUdlYWVOWUpaTWlqNkJvTGdkU2FXSTVESXB0M2FiczlMNlVFTy9N?=
 =?utf-8?B?dHZxMjZvWGlMN3FobUhTNS9OdHBKR094UVFiZk1WTisvSUlsWkJtRUpqVm9M?=
 =?utf-8?B?amR1SmE1dlhuVUdKOGVzamZmL1JXZnRYWFZYMDFHNVVoRmh6WjlHRVZUWE1t?=
 =?utf-8?B?Ujcrdm9NQXJXRlE1SzBLcGg1NW1xZUI2em5wU3UrdlVIdGwrTGlSZFpYMmxJ?=
 =?utf-8?B?VWwzRkNWWUk2aUs1VDZuYisxcGFWNVpVWSt5Z1BkVXBXQi9lL0haK2VtUHhN?=
 =?utf-8?B?WllacDc2NkxEYXZYdE9lejNVdDZQd0F4OThJNDM3RFRIMkUvblNKcENpQkow?=
 =?utf-8?B?bTgyUmxJbGp1Z1hMb2k3WnVXc1RWZE9UY3VHYjM5UFB5dEVnTXVhaXVMUnlx?=
 =?utf-8?B?R0NocGhVV1N4U2N2YU84THptK0phakd2NysydHpPdGlnTC9venBVa0c4YTJs?=
 =?utf-8?B?Z3AwSmRKcVVSYWNMNm5YUUd4eGtmZ1JyNk1YTUVhRnc0V0dPUUZUUFhZbEtt?=
 =?utf-8?B?OVQ1WTBsSUUybHVzR3A2VTg3ay9odisyMlBuaXF4dzdEOVBHTUwraU5ubktp?=
 =?utf-8?B?VmR5MXlTUGo3QUhpaG5mcm1ObFh3aTJhS2piZTdGQlVvNzZEWEdobnhXNmZP?=
 =?utf-8?B?MUdwWlJ0RkpHall3MXRwTGpkNHZLUWNwZEgrNGdFdG9vMzRiODZ6OUFFdDdl?=
 =?utf-8?B?WTJSSG9PVkpRWk9HMCs3cnVZQU9zTXh3Q3hJd1MwcGk5ZFpqMUc0YUtlMU1l?=
 =?utf-8?B?RFpoa1lZOEF0U3NqK09RbFJaaDZZcWU3YVQ0SUF1bmt1cDhiVjZGK3BaREtF?=
 =?utf-8?B?eE9xbkU2Z1M2eDZLYzcrU1l4OVdicndWV01PeVZuWjMxdU15MWFNSGJURGQ5?=
 =?utf-8?B?MEhTWWdQQmlRN25NaDc0TXNDNE82T0RDYkdvYnNmVEh2eU9PQWM1UFMxR1NY?=
 =?utf-8?B?aTZ3UUZkMXlQaDVaSzBOSitDczF2NWwwZGNGU0IvUFljcFl2aGVFUGNaMFFD?=
 =?utf-8?B?bHVOUUVZQmJ4blo3cTFadk1YakNxOUtFY3IzM1o1SkUzSG9zTmhEK0pSa0Fy?=
 =?utf-8?B?WEY3d3ptVU5mTm5DM3NQNExvLzZFdzRHQkpyVFZxVmV5Qzc5dUN5NmJpZ2Na?=
 =?utf-8?B?NDQzbTRLcjBleW1Wd05GZUZnTmZMeGtZeDlvc3c5akhjOEQwcDJzbGpHbVQ5?=
 =?utf-8?B?NG52Vm04UHpOQ0JOcUhESFpyRnpHNlBYWXdRcWZnSXB4eXd4UzR1bWloMG9V?=
 =?utf-8?B?UWNtNTltRHcwdHByYXd2dU05dGN4RzFuSDh1RFBOV2RqVHFOWmwwRTNEWSt5?=
 =?utf-8?B?ek56SG5YN2tPa3V0R0tEMlh0bm0ybXgvdHo1ODdLRmNnWEU1THY2ZDB3QWhk?=
 =?utf-8?B?NC9keGNzWHYrajI5dk52UWwxZWJUUlU4L2g5S3A5T0NtUnF3cGQ5Z2J4WHE3?=
 =?utf-8?B?T2tlY1N2SDdrVDljN1VQZXV0LzdiMjFYYmV6SWxXdUxpVEpIRDlTWFUvZU9H?=
 =?utf-8?B?aFQ2M25XakNsKy9IR054Znk5Z1VEcldSL3RpanE3V0lDVkF6dklrRk92SWNk?=
 =?utf-8?B?TGZ6TzVsUEw1NlUxWDBSTi81TEYvSmVYYXRCV1ZIV2lYS1FxZWpsSXJMVnNR?=
 =?utf-8?B?Skw2UElqa0JNNi9yd295OWtNQ3lUZkRaUVdOa1F5RmRONkk5NUtHY1p4cVcr?=
 =?utf-8?B?VWRiWGFQUUhvMmY5SFJVRWtTT0JHN2xPM25oT1dVeXF2SHZJTDJXU0VnY3J5?=
 =?utf-8?B?MUZ4TDhaRThTMGswdXgxWEVkM2RYY3JLcUhDNUZ6Wnc2NmwxMGsxRlBLVmhT?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 49896bae-fecd-4f1c-0b89-08dc701950f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 11:15:21.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BLS9x8Yb04RKZr38hygAnPYdfiSnwCtbyd9owvuwme/4YL6R1veDXhMw5OVZvnE9A7oHNY+ZX+9WrICO+MKTyXWKT6VoOtINeg5BmtJ/DbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
X-OriginatorOrg: intel.com
Message-ID-Hash: DAKRQFGNMSCHOD7HUKATGQH7MXGSCVZU
X-Message-ID-Hash: DAKRQFGNMSCHOD7HUKATGQH7MXGSCVZU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DAKRQFGNMSCHOD7HUKATGQH7MXGSCVZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-04-19 10:43 AM, Cezary Rojewski wrote:
> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> 
> Now that NHLT support in ACPI framework was introduced, migrate
> intel-dsp-config driver to new API.

Hello,

I see that this patch has not landed in Mark's for-next. Takashi, what's 
the verdict here? Should this go entirely (entire patchset) through Mark 
or should the NHLT changes [1] plus this patch alone be incorporated 
into for-next of yours separately?


[1]: 
https://lore.kernel.org/linux-acpi/20240319083018.3159716-1-cezary.rojewski@intel.com/


Kind regards,
Czarek
