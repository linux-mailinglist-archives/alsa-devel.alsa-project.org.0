Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C9B7E7B9
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Sep 2025 14:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E11601D3;
	Wed, 17 Sep 2025 14:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E11601D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758113398;
	bh=LwvgXFLHRMjUxYbmOaMHFmZc5JYMPQAbavZqXhMmLXM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ed4zqMc1cOz8/UFHOquIOWx5yOh+OOjL+c85ZCzY7VGZxn+yZPEyn5ji+kwGBggFR
	 XmaRDWz9Otv6fQAEb8QEnklXAZCFB1jeRYfrHGqi+42KL4idQvYydN/FzShULxBZE7
	 Z4ZrW8MGT93Mq7vcVJRIONIx0TkcFVnLJnXmzkTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 344E9F805C8; Wed, 17 Sep 2025 14:49:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 271D5F805CB;
	Wed, 17 Sep 2025 14:49:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D41C8F80510; Wed, 17 Sep 2025 14:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01D40F8003A
	for <alsa-devel@alsa-project.org>; Wed, 17 Sep 2025 14:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D40F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RgAQWmsW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113283; x=1789649283;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LwvgXFLHRMjUxYbmOaMHFmZc5JYMPQAbavZqXhMmLXM=;
  b=RgAQWmsWjbo+cAvSoZaJc4V4WE+ueR08g5+8YsLpLROSXAJCSjGhb+Uc
   MooDTFN3V3HhRQU6UZVdKf5ZZSuJ3iaWnE4qs4mRtEPauQv3SuqcO7ej1
   7SZFxyH0eg+Bf1UCXbh2zxLWDMNKMtO3xqaNnvZHemw6b0Hm5jvaONTYP
   dtYnbTvc0eMLTloQurbWUNDbDOc4VctDUKYnQ1HV0jQTTUgVngenld/TY
   M08bBzuF5xIMnjpRrJ2ZBxgm16ioBPzhOH/kFUVBEg1rCqTuyjfJf9lH9
   VKxKWju9JNl/GJ+zGUAPvJnvywFlRyQtx69Q2kY/z5pyWixorPvzbcHR7
   g==;
X-CSE-ConnectionGUID: kGn/nYw0Thmf3YMmRT2ejw==
X-CSE-MsgGUID: thRsad73QRu/KG1BujQFig==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71842413"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800";
   d="scan'208";a="71842413"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:47:59 -0700
X-CSE-ConnectionGUID: qrKHJWyITIeHeCSSzuCBUQ==
X-CSE-MsgGUID: QB0TcNZ/Q3S0K1w5b9Yq5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800";
   d="scan'208";a="174838089"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:47:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 05:47:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 05:47:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 05:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvgQTMBS8CC6qXvoGngiADKs5IJNNCQ8ePVN3ghiREr7iKQoI1otV6RkXsWDSNEEbabxmy32AZUxODvS2fjWT8UdFK+L7EyMtPmEyOFt7ouaV7W/T9l97knLO9t9hgg5Vrjwdr4XHCQd0ZEhgclmC/90yRzWMdjSa/0ukkIqUHeI8/gVnhPHiXwG28MWSlcqaAC8uuzpWGQm/kLnI2xGtH2uUqTGc2rwjfSvWLUECjQ0UTq3bNZvRm4LLi3yNhgRJE7d6wywLVeRfkSxopKNrbJirAvi+d9WtwLUyn93JIFLhvBVjnFsN+D2o57jef5nk1W9O7egTZwwVSCP9ib/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PTVQrrQTzFYQacmU1N0IW/FCCT8tKx9SS+kzAe1EJw=;
 b=wsQqSTA3KWyhRecRXXOIpPDwXgHp90yp4hKY0O4u2KSAtQJFxYJl/UxQ8YWes+hjButqrOzv2g0oNmKHzZdGyz2jioWxyNatk0yGeUUzdZhV5FEdRWzb2bLdzIDkDSyF4cY6q19Gu10l0oxdX00oj0oOmd1BSn2XqLTx1PWtj6/z2B8nxz0FjHaYa1RmiL3t7Ja4rqO4ad4H5taH9TtNvK+370kD3do0UYpwyXPq+NiDYAnPBjs7MmvcNX3vDfAH8iRZd55YkSg0qpXmy3Y6rKs4IvgYR4zcTDjeyl1OuzSBN+ZyjKzBEi0HU64PA73bGaeGcvYfBb8rwbnRwas59w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 12:47:45 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 12:47:45 +0000
Message-ID: <30f9defc-b919-4c96-8c2a-b3dc2982ad6e@intel.com>
Date: Wed, 17 Sep 2025 14:47:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt5682s: Adjust SAR ADC button mode to fix noise
 issue
To: Jack Yu <jack.yu@realtek.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
	<shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
	<derek.fang@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <766cd1d2dd7a403ba65bb4cc44845f71@realtek.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <766cd1d2dd7a403ba65bb4cc44845f71@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH8PR11MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 577ad3ef-8fd9-49c4-a942-08ddf5e86647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?QzhBWnBWampRL29CbkdjTURyai9yWnBJd2RYWXo4N3FkVEQxNHhaRTlBQS9x?=
 =?utf-8?B?bEdEckRjcHlpVlpGSGFQbXJqTXZGeGllUFE1NmRyR29FUzJiRzNnYzFaaG1q?=
 =?utf-8?B?bG5JaE1yYXJ3YldyUDRselNrdXdpSTFDS3o3cllGY3g3cERhQ1I0bXROVWxD?=
 =?utf-8?B?R0tBV21sdWdqTjlhUDRLMU5iV25VanE2NUhEc2NCRWx2MEx5azdhWWI5T1Y1?=
 =?utf-8?B?R2dOcjVjMWlyeGJpS0VLZnlJY0tKS3VQT3pnQmFSUnQwUEZYZ3U4c09mQzEx?=
 =?utf-8?B?LyttQkxVUHkyMmdhU1hzUVZKQ1MrWExRMVdJN1FScEllYTJVYVRzNUVubzdu?=
 =?utf-8?B?M09ERFVZekxFMWRBSWF3c2xMZURBZWd5eFpoQ29sTk96ZC9oWWRwVVJRZVlU?=
 =?utf-8?B?MnM4UGcxSE5mWGFOTjIzUG5CTjE5M3RQNzNhYXNNN0Y2c0xOODhndkZvN3RX?=
 =?utf-8?B?VFRIUHpjdWZ4VVZpR2VpOEVHTGdUd1N6YzF3NG1ZcmhiYzBEZUk3YzY0TDNn?=
 =?utf-8?B?MlZqdllZVGE3czJjbmxaL1A2bzd5ZHEvWUd6NTN6bkx5YUM2TE1GZmhxQXRo?=
 =?utf-8?B?VDVsdGNrcjRwMHVJSXZ6dVVoYU5XVTF6QkM3R0RiRFlJbDRzZkFLdkR2VExJ?=
 =?utf-8?B?SmQvM1d6L2M1RGFhYThCMkNhTU1wMDdEaUdNZEFuTXhzL2U3QlkwRmJNcEJi?=
 =?utf-8?B?YVpOSXhlZmZQVWh1WHhLL2NUVUxaVG9FOFdtbzJ5MW1QWFYyNjdLem9qblZL?=
 =?utf-8?B?L2UxWTRSMnBpQTEzV09TNTJ5L0ZpbjlXSnhHc1RCV0VtSk9JZXJnMVdkcFI1?=
 =?utf-8?B?QzA0OGx2MEtmSkVGK3ZuSlRCT3BKV0pRaXNoRVE4R3AxQVkrNFRkR0k3ZWU3?=
 =?utf-8?B?NGFqV0ZUZEN3RlNvNTZjRFlhUThMVE54bjVaYUZHVzNVa3hreXo0TlNHR01J?=
 =?utf-8?B?UlBiRnYrUkV2T2RIK2xPcXBEZEpUS0NoZ1FVcWZSZURqTXZZMVZqbEl3RHVP?=
 =?utf-8?B?b1E3Nk9vRGF6UUs2OEIwMlpSVXdEU09pQTdXVm44WVprb213bkxNdnk4T01V?=
 =?utf-8?B?N1Ywc1ROdldXV3lTSC9YdVhxZ3dzd1NqZm9rb0hjR2FydGtSbTgzVk1ZVEhL?=
 =?utf-8?B?Tk9xeGJiYkhRWjRpdThmL2NDc3ZoeXF3ZXNzb2cvMnNnUDRBWE42VEJTTFRR?=
 =?utf-8?B?QzhJNEdOZE1GR05tRzh3QjhndUtJV2VZcUVoa0FiRW8wYm9XRHorWXBvQVJm?=
 =?utf-8?B?cnlzeTE0VTIrUE93NC9mektJbFd1VzF5bG85TENmTHYrUWhJWTVBc3ZjbnQx?=
 =?utf-8?B?WnNEWWJVN1ZIZ0NlNlBXU3BwOGNwd3VtN0kzUisxQmxFdGRrVEs1SGdibkM4?=
 =?utf-8?B?WnA2UFJrUVNaaElmbUVnZVg3SnZ2OFFzMW5rOS9IT2dVbWc1c25Nam5TR1Bk?=
 =?utf-8?B?NDFuTnBtMHhHMU9kNDg3Nk9rQ3hka3dGS3B5QzE2aFJPT2h2a21ONlNTMVp3?=
 =?utf-8?B?Q25PalhOSGYxdUxua2huMXVTd2xCc3kyMFlSQm5QeHN2RTJxL25tOUlNNHNX?=
 =?utf-8?B?Q1VnVnJudysrYVlhemg3ZFUxRGgyUjl1aXhLUFJHbXRpYTIvTjFCVmh5SmNq?=
 =?utf-8?B?Nndkcm5xb2d0ZTFnV0Q1L0Fyb0Nhb282djB5ekxnY1FueUxxRWlwbnNKbGRU?=
 =?utf-8?B?aFZlNFJkY1JIRVpyVmVIWTFSTHh4TzIrVXliMUpxL2VTblA5UEF2UW5LbU5k?=
 =?utf-8?B?cjd2b24zRGpRLzBBLzcrbXhRaGF1WlpwTU9ubG9LOStxVTBqSVZuUzlqWTZv?=
 =?utf-8?B?YXQ0WmxQZk1GcnhTOEhtd2RJSTJFdXdpazFZelR3aGw4ZlpvTmR5bUNSSXlr?=
 =?utf-8?B?L3lxQlJUZWhuRk9kL2dvRlUxbHVVaVdGcGQ1bGtTblRtUE5lTHc4VDZ3dnBQ?=
 =?utf-8?Q?EfZaY5jt4h4=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?ZEM1K2l4NXluU2pMcHBGSVZQK01zMDZ0QWx0aU1DTmJEcXBIMHFsWWN6SUNw?=
 =?utf-8?B?TWRwYmxrenpBMjF2ZW5acDlEcm9WMzZHU2Z2SXJsQUhGZ3NMTjJHcjFBOFJJ?=
 =?utf-8?B?TWcwUkxlK0pPcGpuQlFvZ0cwV2FFcUtFY2lPdUJaS29mUFQwMGhmWmtrQktD?=
 =?utf-8?B?clhoZmZ0a2c0NVJpQlNJSkt4aEUwZnJOT29UQ3dldXNrMHFlK0RlZU8xNkNr?=
 =?utf-8?B?VStzbFQzQTIwQTVBd0ZkVFN6UDdaSU1NMDJaNjYxc3R6dDBMMnh6cVo5MGQ0?=
 =?utf-8?B?aklhWmppVHdOZ3VQNDNPZjRHWEt0UHdvQllURTZFZmxBUkNtS2xNRFVBZlJG?=
 =?utf-8?B?SWtGVHZxQTh2Y3B1eGt0Q2hyV1o0SzV0Y3E1aEFPRk1abk4rYjVRbU9RMURp?=
 =?utf-8?B?V0dwZ1ZFUXBGWjYzWWsvc0JLSjFEbXNLM3dsVTB5NGlLbXMvUUtUdVlyNER4?=
 =?utf-8?B?QkZrK3RjK3lJNXc3UWlWZURRNEpyRVh5ZEtIYW8wbER0anJ5Y0M5T2lhQzBK?=
 =?utf-8?B?WWovQUxESk5mRVhmR2F5Z2VSa0dlMWhQbUpjajVhOFV5Z255SSsxdjVhNk94?=
 =?utf-8?B?d1pRV1FSazl0dC9rT0VieUNndXpaOWtzMkNlalh5dkF1b2txZTdjVzU3Ukp6?=
 =?utf-8?B?dExhNFd6ZFg1S2FjZ0xhUmw5UGNEdjBLTEhCRExaUG1ScFpZd2tJS0JWTjdk?=
 =?utf-8?B?K1IvY2c3VGxNVU02dElzUUtKeDh5dFpCMDV3bWZJNHFPUWtUOGl5OUJEQmFK?=
 =?utf-8?B?OG9jSU1GV1d4OTNxZ0hSL0JuWEM3b1c4Z3dJYTVXOGhabStVa1pFM1dkRy8r?=
 =?utf-8?B?WVJGMjNyaGZjUGVwcmVnSjJVT01kbmlZV004KzhpRlcvQUxXVXVjekphU2ds?=
 =?utf-8?B?NUNHNTh1Um93K051RnFwZlJYcEpJSlhCWEMzWktvZ3UxMG9SRzNKTGZnWENt?=
 =?utf-8?B?UGJ6bCtJWmRyb1ZjQy8rcGVMcVM1ZXYyRUhUQVp2N1g1U1dTUlJNNzZURlZz?=
 =?utf-8?B?NDFDc1JwUE1aMHU1OExCbW81SzNzTDBUTFE1dDNEZ3J0WWNneUFKa3ZZaURn?=
 =?utf-8?B?NkpQNlpvalFUYjgyZm9jVC9YZWw2enFHOTIwN2pOSXRkc0ZMSXpEUHpMYTA3?=
 =?utf-8?B?SEtiNy9JUEhQZS9FajlBdEEwaFdXV1ltK2JKZFVTUTRYc2VRTGtCcXV3Nkty?=
 =?utf-8?B?U1NIbEtjcCtwMG1YYVUyMG9NcW15Rm1kendOMUFTVGNVWG1QYkN5MWxwNzdW?=
 =?utf-8?B?aUxhdGJyeGhZcE9ZdC9pdHBRTVk0S3ZFMEVxdlRpVzBwaE1ydU1WZW9sSnBN?=
 =?utf-8?B?amR4bVdRMytZdjk5dmRyZ1hUM2hNc0lMekMvVml3TTIrNlZITXVhVlowRTdI?=
 =?utf-8?B?S1JMT0RpVm1nTHAvRUhpR1dCOE92MDQzQWZTR2JHYVZaQXprblJMcHJIV3V0?=
 =?utf-8?B?QzJwRFJrc3RmUzdEMFlBcG03S2VYN1hLQXpLdGJuc2RyMXZRU2E2OC9NajRn?=
 =?utf-8?B?Q05UdFlUb25mYWhvaUFCd3ExNHpQdEtEYlFmbUw5UjZDMkFXNkI1c21DOG4r?=
 =?utf-8?B?aERQc2N5ZkZFSjZNU0o5SGZGY1hkUFJXS3pteVdVcTR3czVLY0NtL1JKaDFB?=
 =?utf-8?B?WCtzWWlHOUdrZ1pkaG05SStoUkJ5UWtJRDNuYWNuZUc5M2dqMU1UOTU4UEpW?=
 =?utf-8?B?WE03bzhOanJzdy9GWjA4QkIyYXgvRkZFZkdTRkZpd0RQalEvbVA4UXU2VGFN?=
 =?utf-8?B?UWh6a1NLdDhOLytSTGVCajR3blNJOUlUdExlaExCU1BrSE4yVEl6T0NFTmxz?=
 =?utf-8?B?bEtoTVFZeHU2WDVsWWhNYUxQWW5sZ1ZieS96UGFTTzFNWWZvQ1pkV1ZIcUxz?=
 =?utf-8?B?clBRREtqek84QUdxY094ais3Y3BZb0gvRnNzVVN4SE1zTnZGcDVYeENRYkha?=
 =?utf-8?B?eWJaVk81d0hNcDRmZ0RYZ1ZoMVl3a1l2Z0lZMElHUXJvQVR2Q25md2ZoU2dj?=
 =?utf-8?B?YkR0cU4ybFpydlJRS3JOQmorY0M1QVNUS2MyQkhUNVl2QjR5Q2JTbTBqQi8v?=
 =?utf-8?B?REN5Tm1tcGJmRytDMlVCTk1kZjdnbUk0MjBLSEJBSlRtVlljMzVKaW84ZEQr?=
 =?utf-8?B?emtnY0p2RkFJVnlFZzdTODRpTTc4VzlwZHZ1S2ViQ3FLcUxVeE5JYzJOTlBx?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 577ad3ef-8fd9-49c4-a942-08ddf5e86647
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 12:47:45.7134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zlkBEUpZkLzTqUpv66TRvgHFffvwPD5tXgKc9XelKYr4maIBdAxjLKGN/hDFLhuwN9d9XaqE4ZBUv2VLxf5c4p7+Ukelm410l9tWAXu78Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
X-OriginatorOrg: intel.com
Message-ID-Hash: CLXVP7NWCQ4DWI7GTKZS2UBXWPJD535Z
X-Message-ID-Hash: CLXVP7NWCQ4DWI7GTKZS2UBXWPJD535Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLXVP7NWCQ4DWI7GTKZS2UBXWPJD535Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2025-09-17 10:11 AM, Jack Yu wrote:
> Adjust register settings for SAR adc button detection mode
> to fix noise issue in headset.

Is there any kind of bugzilla or link where the problem was publicly 
reported?

