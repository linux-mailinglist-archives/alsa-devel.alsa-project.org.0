Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B76AFB5187B
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Sep 2025 15:57:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1733E60208;
	Wed, 10 Sep 2025 15:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1733E60208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757512636;
	bh=4HwJcW6qrfvOe1AaRHiKEbtqUpQSFuoYgq3grEr+/JU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=imtKfNcQRrVfAMGfCzATvlNLyLUoX0B6QU8EBphwYc8ZgojA6BTQ5qVCsLKvYQys+
	 3iSvKrdEg4kH3xcMpJaXTAryV9n81xlINz+kz5z3zEArMFv8snfATOeCWfXigUyYE/
	 2eYhFp7zWbhYPUL1Wu9JaZK82vFu1n2JiBLWZHGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFD9FF805BF; Wed, 10 Sep 2025 15:56:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63175F80580;
	Wed, 10 Sep 2025 15:56:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA3A5F800F8; Wed, 10 Sep 2025 15:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB3B2F800F8
	for <alsa-devel@alsa-project.org>; Wed, 10 Sep 2025 15:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB3B2F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dEvErqHr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757512575; x=1789048575;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4HwJcW6qrfvOe1AaRHiKEbtqUpQSFuoYgq3grEr+/JU=;
  b=dEvErqHrK0w9HRQ7a4KmMm95N3irA3D6x0H0AVKx3LjYwntruW/jQZlb
   ubdp4WBfL4iZPAACwK4x1J1arysfLyBKgbxGVY5sjig5ZDVKlxcAN10LT
   abIL9B32w/yHRNe6XRaIjsGQEIGS8dv2b8LpvsQRwDLKwSiV8S5MoBhsr
   BVNTbopsfRvJbpOevIFhKYFFrn884V4KAMn2zsg1cFEM9ybI0pxIGYPzi
   VRUQx2ngroXE2ESjJdO/z/71NBgVWRbsH382bGzL3GQwT64M7eHaSUzgP
   1dREeaFTG2jTfZHUQ5RWvjLS70B7zCTVZesWCQLSl6YzdTa+6hHPDuMK2
   g==;
X-CSE-ConnectionGUID: ZDXQ7V1SR0OV6eecV4SVug==
X-CSE-MsgGUID: glbOCXPWTUukhlrSlyv1FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59897912"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800";
   d="scan'208";a="59897912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 06:53:41 -0700
X-CSE-ConnectionGUID: prdKfRt8Tc+Jv8YUsRObiQ==
X-CSE-MsgGUID: jZXAMeBnQVOOKbJHv8UkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800";
   d="scan'208";a="197077657"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 06:53:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 06:53:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 06:53:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 06:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0iHZRIgOaipUy1yLw8pA6eeJBDAxTCiaqkyN+fsk3Z8UpuaGKKounBofwSBIZEyBMwkUtFgUDaKKd8G3rmms9s53lgB3A6hc3AVUHihBjJGsL7pnYJiKM2/i9Ejfp8NWtHuJbqNKo9ijaEru6V8d3zyYJ8YiPwL8FN49rQbBPCTKSRLETiOTojaPojL5frlO/cNwtPzHGbC+BNYl99BW3WbLY216Q1UbFWIhQcEYPlZy0et4zVz7Ug7qHS84KU+V/B0b/44nJSM5OG4kqvtys7dnT0h/x0zOkSNEN/Ckch8qy/XDqkrSW1jW2sfHYv2+RZfmAkP4EzvyIYVAauBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUJf+AR1921bFghy00DGZpuHqvqwdjiobaqJFI/fLc0=;
 b=rB2i1N+j1gxyhoS1wxcQT1bMqSWDCgqCp7P+OgTyrWDS6cZ9U54DeYQ/yucud+dJkLAsN+k7LFC6N4yJDVdSZUPKbRT04qhXBwuZuGGKexeX56ijLAWyi4l5pR5+pra+BjR68g+ZoqnF/jcMASYwD4jgT8muyphsdMlXknIga7I5Vc5uY2dXaIAj/ZV3tpYViMtiKWPiVxaluK+xt/+huhfgeZEIjb0y4P/onRv+yjNmYRoWiKdupiHWgfx0lb7F9+UIK46G4d2GMF6xMc95GpBG9uLMgxL/w9WVQj1bi4v53zlC1Fw4m+eFLZ0Sy2RtEju9QzeimnbyqlMGLooMpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ0PR11MB8272.namprd11.prod.outlook.com (2603:10b6:a03:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Wed, 10 Sep
 2025 13:53:36 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 13:53:36 +0000
Message-ID: <d2f8e45e-c289-4649-b764-8ded15f0bb16@intel.com>
Date: Wed, 10 Sep 2025 15:53:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Fix incorrect retrival of acp_chip_info
To: "Prasad, Prasad" <venkataprasad.potturu@amd.com>
CC: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "Hiregoudar, Basavaraj"
	<Basavaraj.Hiregoudar@amd.com>, "Dommati, Sunil-kumar"
	<Sunil-kumar.Dommati@amd.com>, "Saba Kareem, Syed" <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20250909061959.2881158-1-venkataprasad.potturu@amd.com>
 <0f631a47-d487-4770-a046-af2c33ad670a@intel.com>
 <PH7PR12MB5951638E3C707F3B97B46567E90EA@PH7PR12MB5951.namprd12.prod.outlook.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: 
 <PH7PR12MB5951638E3C707F3B97B46567E90EA@PH7PR12MB5951.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ0PR11MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 275a99aa-9046-44b4-70e4-08ddf0717076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?YUFFVlRuTEpQMEhQdFY0V2JMZ09BUG9RYlJhTXZyV2tlSllCUDFXY0paQTJk?=
 =?utf-8?B?YnVFTnROdUNYSWtZa3N5UndQVTE3MGxreDBET0duRjlNS2JXclJDSjJIbVNn?=
 =?utf-8?B?WjJqM0lWaE8yUHZxZldqLzlnRkQ1OFlsN3FXdFpCMFp6OXQ1eDF3TklDNzEy?=
 =?utf-8?B?YUJjMTZZVUZSU21WV05aZ0JVUzZzR1dnOGRKZCtZdFRjNytacDdLVDZkVjk4?=
 =?utf-8?B?V3ByajZWdFVwWUNsbUQxZFdKc0RiMFdBcFNuTGc1U3FmUEZPT0E1dXlCZ0kz?=
 =?utf-8?B?MHBVc09yZGd5SFd6VkJsaG1vMC9uM2pucE5ENHBFTjhMalV3cmFYRDJ2U3di?=
 =?utf-8?B?MXRnUlFFNmVqSzRqNGhoamVYR1FUSmJNeElJT3hwKzF3MjZYU29oUnhLcG9i?=
 =?utf-8?B?akdYNVBST0FaSGlZWStIZCt4bFNPV2ZPdzVoZm93WDhqc29MSHFiMzZlUjF3?=
 =?utf-8?B?SVBmRTgycUhPeVc3eVMwM29LRXpWam0wZFN0L3BGMENJUXdoUFBIbmNPazFO?=
 =?utf-8?B?bWErZUFyOXVzQUpiZkh1NUNlVVBRMGprU3pjamxIYXU1NVlGZjRyQi9Vd1BU?=
 =?utf-8?B?VTJhbU5lSDhMVEg5YS9ZdGlLTFh4d1Zna0hIQjVmUGVrSnNyRHZrbFpodnRa?=
 =?utf-8?B?ZFVvWVhFalhScldtWFk1eGwxQzlSU0pRSjllUjJYU1h1T2RLb20xbHE4RlJm?=
 =?utf-8?B?THZ3Mjc2blFlZnBqMHc3MzFIT3BXdkhPVUt6bWE4OEEyM0cyTTVXaUg5MXli?=
 =?utf-8?B?M20rY0NHOFlQd0FiS1hiWmpRa09WWExHVnBwK3NrdEdGbWp3ZG80Qkg4MEli?=
 =?utf-8?B?WlR6K0FLWWR2cHI1ZXE0THRZV0hOczA5ZUFPZlFjVG1IVmNHRUpzNUJqbEkr?=
 =?utf-8?B?cFVUSGVhT2RwaWZxQ21RaVRtNEgydnpSVWZFSnNxZWN6OTkvUnB0TEhYZlg0?=
 =?utf-8?B?MmxRNVRKZlFiMWpPd0d5WnJzZGc0RXpjY2F4aXp6a0dibDVjTUx1VnJvcERq?=
 =?utf-8?B?dTJxanN3T1pMbjgya1pkeStMRmxUZm5SeUJObzR3ZG5DdTdkUjN6bHowRGk0?=
 =?utf-8?B?Mkk2RWVoL2xZRTEvNWd3SFpISFhDaGdzRGxkYllaY0lxTjMxKzg2NkdIRUd4?=
 =?utf-8?B?VS9Cd0t0SnVwRWRKUVpaMThzdnNpemxOemZpWUF4NHZJMm1HcmhNVWdQL3FD?=
 =?utf-8?B?Vko4OHhKek12NytpRG1ZWlFlU1BOL2I5NllpK1I3cUF4SC9KMndQRGF0Q2xu?=
 =?utf-8?B?ZTExUjg4NTh1dXBabjl2L0NyU3kxWDJ0Ty96MSttYXltUG55aXJ3endXeUc2?=
 =?utf-8?B?YlMxL2NvZHlrMmdBbmV0NWRHdVJIT2RGYlFYOVBObFp4dXgzWE1SWk4rMEYw?=
 =?utf-8?B?cTM3SDhKZENWaWU0SjQxZmN3TzlsbXQyM0hkelVFcGNqVHZjOFdiV24zc2tJ?=
 =?utf-8?B?RWJmVXArNy85cW95T2lBTk04eFlEZDdZOUxQNjAyajUza2tCSjJFdjI0dGhZ?=
 =?utf-8?B?WTRwMlZyWjZobStMbFBZc2dHNmViL0dIUUE0L2F5aEF2Q01zbmwvQnBtaVMv?=
 =?utf-8?B?YjVIYnpmcU5ONkUrUzlTQ3B6Ynd1OVBsMkVaUEdDQmxnYTNHUFpFc09xY0Rs?=
 =?utf-8?B?SVZCTi8yVmtUNDZURTlqWVR0SmEveVZtbEdVc0JyZU42aW42RDhPU3c4czdC?=
 =?utf-8?B?bmZxOExXNFhaMlF0NU5xM0VSa3N2NVh2MWlkdjhLWUt6NlBjQk9RckNHRHYx?=
 =?utf-8?B?SThtL0UvYXNnS1czYnBpZDJVY1hKSGYvRytVY2hwRnByVHA5TVAvVm9OQnBa?=
 =?utf-8?B?NWErQXJDMnlyWGRkVDlubGZ6dDVzeThaTjFUUFQ1WFE3c3oxd3ZiVHVvVStw?=
 =?utf-8?B?VEZPSEd5dFlVbWpFMERMVmJFcDlwalRlMFcrZ2JTUmNNaW9zbWJXWHJwWTRT?=
 =?utf-8?Q?JtnB8LpltTs=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?dmwxZDhHV05ZMHNNV0dNU2NWTVlPc0t6Wi9XQUtUVWY5K1JxcVpYbjFqTS9R?=
 =?utf-8?B?bXFwdm9xS0wxLzZ6YWZLYkZITmd6TDZ6UDZ0b29KOXlpRkxYYUFtZWxjU0Fr?=
 =?utf-8?B?aXlLQzJQTFRoeXVOK1ZKQWhxUjJzb24zSGM2a3Fxc1Q1YkUvU0dqeXJvTHhm?=
 =?utf-8?B?dUIvNmcyd0RKSmFEWWJIUXZzQzcybEFTSmxISFQwT2lReWVpNjM1Sk8wdmNt?=
 =?utf-8?B?eUJobUdZYnQ2a3U3VFNyT2cwN2x4SkNLVFFIak51RDFRRGc2VU5hSHJBQnlr?=
 =?utf-8?B?cllyWGlkQko2d3JDWHpWaFVWUlpDbjdJMXlIREZuQXJwQUZRMm04a3ZaditT?=
 =?utf-8?B?dWdqYlZvOXJqbmxOaWh5MlcvZm9ZanVNbk5ZeW5pcFhtTG1pbVF6TTlHS0FR?=
 =?utf-8?B?STBiMnBHZURodG9veWxIY3FIa3VXcmY5NjJ2Q09LOHhKbTkwbG1BVW53OG1T?=
 =?utf-8?B?dDJBN2dGT0JzR1lITzdJMFp5cjBMbWJPbitoYkVDVE54YUhxWElmT3BBY3RI?=
 =?utf-8?B?QUtWQ2I1bWNKaTUzVFFRNEtGQzlRVldhR0FrSndmSC8vNHIzdi9jRysyRm9t?=
 =?utf-8?B?eHdsWkU0VHdKVHRKaDhnYk5BVGIrRHZHWFBSSnNDNFowdDh4cHo1dXpBcW1X?=
 =?utf-8?B?RWVCVnhRY0lNb2xKaHkvQkhmeDMyVkViQVhYY2ZEQ2Z1ZEl6T0Y3cDdxL0RK?=
 =?utf-8?B?bWtEZWRCYlFaazVJQkJKVkV0WlBCYlYvZmNsK2xmY2l5bUgvM21rR1dVYi9i?=
 =?utf-8?B?bHdJdTVWQURvcjFzeGhZc1kra1A0aDBGb3FHZWhmM1czVWk3dlZIUUtoaWpP?=
 =?utf-8?B?S0Y2K3ZoYjdhNlpPUDFXUnY3SDJyZ3dJaFhIY3FwR2k2aUFVM2VnczNITlhJ?=
 =?utf-8?B?VUV3YnE2dm0vZS9JdHpwOTlHcS9WUkZYeVZtbHo1MUx6MUxGOTU4MkhPV3Zp?=
 =?utf-8?B?V05XbFd6R2g1OGJWUzhSNTRpVmFqcHg0YVJtczZqdkhtVU5Zd0Vab2V5cmU3?=
 =?utf-8?B?Q0hEa2hRN3hNN21RNUtlejVmTS9sWnNjOU93SDRJeVFKZGdocy9XUFV6N2ZM?=
 =?utf-8?B?dTE3dkduaVlNRytXN2Y4akJNUFpodmdjVFRWK0xCdEsvdHJaZkRhL0pmMWIz?=
 =?utf-8?B?K0o5ekduWVVnWXVqSk9MeXNlTjJyRE9XQkRhbzdxTFRmQXhocCt1LzdYeisx?=
 =?utf-8?B?Tkx5QU1iZVVxeHRjTzFOWVFUWkR0bFd6MkpWMzRqSC9LMVFFTjBKRSt4L0xH?=
 =?utf-8?B?M3EyN2I1ZytMcmF5eWpPS09lcGpmTzM2akFIOW9uTXFkNmIyL01TeTl2R01B?=
 =?utf-8?B?RksxYlVTbk1SYVppcGFDY29scjA0ZldxbVFjNExMWUkxcFU5QzZ3WmEyZnlB?=
 =?utf-8?B?dlgybEV1aXpWU1BtWEQvUWJGSkw3cFYvenl0ZkNTamw2RnFITHp5V3cxKzhO?=
 =?utf-8?B?ejUxZXNTSG5vMlpoaWtzcXNtSEZlSkk0eVpJbVdyenRlTytLd0owaWw3YU01?=
 =?utf-8?B?SW9jdnA2YWpNV0FUN1FXeVA5SUl6bU5LYkNmMlRRclhBRUExc2pFL0JRS1Fh?=
 =?utf-8?B?NExzUEhOUllWUjVLYStxemlYd0s2cERZbENrOExUR3kxUE03eVNQTFUwcXBv?=
 =?utf-8?B?WE5Eb01mK0FzNGZVUk9BZWRKUmdrTjg1YkVkeGVIQWdqOVdLcXlZUWM1eE94?=
 =?utf-8?B?Q3JjMzdDYWVmUkk0Q2prbEx4TThiT0d2UUxGZUpyd3hmRUpJRWxQVjMxVVl0?=
 =?utf-8?B?L0FMR2E5ckhTQWpQeWxpVXpwb05ObUhMNm93RjBRNnBJdTVCSWU3WERRNEZY?=
 =?utf-8?B?dDFtcTlUbWI2WSs5ekRiUk1lTXNaVS9RVW9JY04wVk5JOFhoaHBEZ21IZ1dw?=
 =?utf-8?B?dlVFaEFwRHdLS0dUcDJDdko5QXBDUnRXOFV0TG9WUkhDSS90aXI0NmhoOGdO?=
 =?utf-8?B?WlVHaXFUVUhFUDRRVzE1bktXWnlvL3ltQnpOOWNER2doUHFXZ2g3S3J6TE5Z?=
 =?utf-8?B?MDBqOEtnNUlKRUI4djZIb2QwNlUwTmNUanRRZGpjT3ZnZlNxbW9hTEczamJG?=
 =?utf-8?B?M0tJaU53S1BTZzJiR0lyU2dDYkxJQUg0MHJSVmpld0ZhWlYwSXNyMTdVUTFJ?=
 =?utf-8?B?U1J1WUs4U3RpdTJmTnRuZlU1YVFLak1BeXRReXdFY0lTeW45d2ZVTlAxNzU2?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 275a99aa-9046-44b4-70e4-08ddf0717076
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:53:36.6924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rruguyQIeLDhaLAug0JlENaKC25dWxFsbcoriokXLKk9Q3D9wzQQ547JRo1yLecUV8kVIYoIyUsaZgz0oGkAs66res3cFQ300fFduRrTQ7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8272
X-OriginatorOrg: intel.com
Message-ID-Hash: 36REQJOYPUSC45N67567HKPDUEDL4H3M
X-Message-ID-Hash: 36REQJOYPUSC45N67567HKPDUEDL4H3M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36REQJOYPUSC45N67567HKPDUEDL4H3M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2025-09-10 3:39 PM, Prasad, Prasad wrote:
> 
> On 9/10/2025 2:41 PM, Cezary Rojewski wrote:
>> On 2025-09-09 8:19 AM, Venkata Prasad Potturu wrote:
>>> Use dev_get_drvdata(dev->parent) instead of dev_get_platdata(dev)
>>> to correctly get acp_chip_info members in acp I2S driver.
>>> This resolves issues where some members were zero due to incorrect
>>> data access.
>>
>> Hi,
>>
>> 'some members were zero' meaning null-ptr-deref? If so, please reword
>> to make it more explicit.
> It's not a null-ptr-deref, members were not updated properly, will
> rephrase the commit description
>>
>> Given the history of this file, mainly Commit 6d9b64156d84 ("ASoC:
>> amd: acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot") it's kind
>> of surprising that the issue is addressed in staggered fashion. Why
>> was set_tdm_slot() fixed separately?
> This fix was missed earlier at the time of this commit 6d9b64156d84.

Let's mention that in the commit message then. It's clear now that the 
earlier fix is insufficient and null-ptr-derefs may still occur.

>>
>>> Fixes: e3933683b25e ("ASoC: amd: acp: Remove redundant acp_dev_data
>>> structure")
>>>
>>> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
>>
>> No newline between the tags, please.
> Okay, will send v2 patch.
