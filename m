Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C89439DB804
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2024 13:56:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D37E2C50;
	Thu, 28 Nov 2024 13:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D37E2C50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732798579;
	bh=7/spGAbXY3hynlc1w9SK5syV2lp+Vcdiadsi9tjJS9w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e+cTg+xwaBr1Z0yWR3QiTwLPPai3lwYPlniAeKyipK/bsK/xHlO2+CiyveTR2pYjo
	 14NJWPU/Nnz9MIgttvfqxX4qmKR2DWaiDqo8ejzD8XRqHMlC6CEtoh+FdC1R05bwxn
	 PwpWK8bs22XEy5WIm1PE8bCkcHu97fb7okZ3GzyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DE2CF805C1; Thu, 28 Nov 2024 13:55:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC84FF805AE;
	Thu, 28 Nov 2024 13:55:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C44CFF80236; Thu, 28 Nov 2024 13:55:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 529A5F80116
	for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2024 13:55:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 529A5F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G5pxbReG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732798537; x=1764334537;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7/spGAbXY3hynlc1w9SK5syV2lp+Vcdiadsi9tjJS9w=;
  b=G5pxbReGuihM/Ya8Q7pi3VZaogJ/wsD72FtvyLTaaCpopKRcX9UqjHE7
   TUXhpmcNmXByIBDsJ0eWA4S8WqBfvrGTJzmePod8qC3puxlGZEnV5DJ+N
   IkLg437dOKQAATykc9D7nA9E27qxbh0Paah7bYy8RnEtz3cWEzth0YbL0
   qAaq0qps688TbdvsaUi2uOZ5/txvo7DkFYt8IWDaARYqZmNGSkHc/0Oia
   +Vo6SqPuubzMxGyWz7z4+KTZ3kDSW6dsss9dOURpSKwNWFaymEqxUZGhh
   F8BRu5fnTaluwHvxGH9OMz4c2BDzKxx0iJBZt1teshLD4sf/rvj314YLU
   A==;
X-CSE-ConnectionGUID: dJMhQKECREmHedK+ABudYA==
X-CSE-MsgGUID: BO7X7XLMSACY4tMxw4lxUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44407365"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600";
   d="scan'208";a="44407365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:55:31 -0800
X-CSE-ConnectionGUID: LmLX0IP4RHmq1GWlGGPJaQ==
X-CSE-MsgGUID: PS3qXBSsSNactUvMxRD+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600";
   d="scan'208";a="97321634"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 04:55:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 04:55:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 04:55:27 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 04:55:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWEyHMVf1he9p9ZeQnsKNT+JZmX6icQDLV7KJvvFJ1NjlNnDJDRXhs5JFmo0Y7kK8AVDwzm6W2gJrBPogDarTdwEnk+qBKWgJHLCaWjLem7dyLe9IBYIrJE5AE2jDp8qX2+P7rK4/bL0hcA91Gl9e0eESDwaC2QqcoJioubJwOrG9iWfa/zava+SoTqAd7Ty8PA2khKT5fmDzqZEg+oI0fi0wW+SzXkQxHQjG+ZUksyQgPhO7hKaa0CYBbuoWNSJUcQG33kAsTF68Fl20it4YkGVY7IPOpyVXhiOp6voblwrBjU4nUrLfopMMr/U8w7P2bn7buoQM/VTH3C4osBneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDGeNAD2eTcsPxqdOx+gK1e5947CyfR1XDPlIA7hRoo=;
 b=ivu6vFb15JyQWCmzuFBDOCVVonIbjOvSHJ1cvfO/PmUW6CWbKCmcJWG1N2saZvL8COHb5K1BT7tfopS3DTAPPpJ6Oc197m1s7WiuVwtGzSRbpJOAwMgUNVl6ydV+TjUqqJXBUSxxrAipkM+ovcbg2SFXpnNLd3Zdd/VUzt+BHst/nrsJw1KYARQiHyzkR4KiICvs5SsbvtGSblK9fAB+r4KG+5VfkxGUUPBosCQi/eoD1OamIaWAbcpNHnd3horFTudWTNoG4O72w7LIUsUugn9GITj4j4Pyh4eDe+vB/87j5zmxoYKtb9k5LYJmLEOdL9VMHT/1XWNiH6IgL05eXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 12:55:23 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 12:55:23 +0000
Message-ID: <10062d09-34c8-4e53-b5d7-f96a5b19f6f8@intel.com>
Date: Thu, 28 Nov 2024 13:55:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: Remove component->set_jack() on
 suspend/resume
To: Marek Maslanka <mmaslanka@google.com>, LKML <linux-kernel@vger.kernel.org>
CC: Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>
References: <20241128122732.1205732-1-mmaslanka@google.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20241128122732.1205732-1-mmaslanka@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BL3PR11MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a1c32f-2e04-4789-21d9-08dd0fabec4b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?S2MvTDRmekdtUEoraXVmUmJVcVRHNmswOFhUdUt4amV3TVBlaDZ0UUtKRENl?=
 =?utf-8?B?OTZ5SnM5VEZZTVRBSU5OWXZKTENJSEF2UzZYWnN1YThEd2IwK2FhSjY1NzhS?=
 =?utf-8?B?ekZkbVk0clNZbzJYNlBJU3MwWllINnF0cldPWFdGZ3BGK3ljN3N1aCtub3dE?=
 =?utf-8?B?b0dJc0NrQlFpUHlhaVRKaUNicFM4RnUvbjRDUTJxNUhKdUJvT3l6YTY2d2R6?=
 =?utf-8?B?cmF0K0NRdURFelhTazYwdUlFdE4yaHNGR3FoY003VTd4Y3JGck9PbERucHFI?=
 =?utf-8?B?dVNCZjNYdDhqdzUvTzVWZ2NHY25tbzFqcWoveHR4bjNDZFRwcGw5S2ZzY1hH?=
 =?utf-8?B?ekxPUGg2SUx4TnVySkJiamY3UHVBUDBpWEsrUktiVlRNWDNuYXZrRWp5UWgz?=
 =?utf-8?B?a3hqMDh0YXRKejhZa2I0eGgwRjFjQzVCbDc1TUl6T1czMHU5QkFUU2Q0N0VO?=
 =?utf-8?B?MkQyeE5nUjVoTURtVGVsWFFvN0xpL2JaV2ZtL0hxWVBnaSt4Q3JpVSs5SElS?=
 =?utf-8?B?U1pEYjhBQTRyazh4Q3grZ3Ezem5KUUt3Y05DcmVLekRDT2NrdkVCR255S3V6?=
 =?utf-8?B?L2tvZjVEcWxSTkprdHM1YTlPY0lNaEpXUlBORUg5c1AzaUZCTUlmZ2RoUVRa?=
 =?utf-8?B?VDl2VHFpVVM3V2RTQ1J0ZmVZZzRQTTJWZWhJMXFhZ3p4eG14elplM1RpQTNu?=
 =?utf-8?B?RWJvVTdzdjIwaUkxU2NCNTZEM0NvMVdsM2RlY1lIT212L2s5bG5LSTZtalNN?=
 =?utf-8?B?MEFLOUxzSHlWd2NleEwyLy9nT04rRzkyNUtxdnFpQnRMSVlzV2NYb1lPRDIv?=
 =?utf-8?B?ZkdXVHh0WitkZjdsQmtycHh5R3FKQVdkWmJjTVlaWlNFN3RaRVQzOWJkSHI1?=
 =?utf-8?B?d1ArNXVnVk5qMTdlVmpPK001cVJRanJidXdFZTdtTjNQbUNyeW9Ud2lRVTdk?=
 =?utf-8?B?TFNqOVV5OXNINnJ4M3B5RHMwZU1ldE9BbkN5S3dhbkZhbnhSdnBjN1hEQkpX?=
 =?utf-8?B?OG1ETVFjS0pKY3ZYQ2cvNHU2MGZ4b3BpVEFGRU1zUU5jU1RxV2VBVjViRmg3?=
 =?utf-8?B?N3c0aTJhWUl5bGVjUUVZMy9yTHpZMWRMM2c5T2I5UWJjSjJ6ajc0ZXpacmJ3?=
 =?utf-8?B?OGhaV1ZVRFQ5Z3Z6MGJHZ3B3K2NRRUtKK08xSXorak9CWGdsamRaVWh3UTNG?=
 =?utf-8?B?MlF0b01FQkxUL1VTRnVIb2dWYWVUcm1QeThiVjJKb2ZabnpaMWJUeFpTYTJK?=
 =?utf-8?B?RGZVYUdaa09GNUxtYXQ2YnRKMjJwUTNqV1drSnB4ZlZ3eUVUVG1rYU9PZDZ0?=
 =?utf-8?B?VTJsMDl3eU1yRGpVdkIxMnUzbWxSTVRiTnpCMCtybkF1R3pHZHo2dHpybHZh?=
 =?utf-8?B?eCs5emdzd09Ub0JvTmpRZFd5SUNsOTA1RkV3dmpFLzZ2YVJHUFFUeXBSaGI4?=
 =?utf-8?B?RmkvdndoNXU5QmN3K240WEgremR6aXhWVjZvSDFRekhXendHSndQVDkwNm15?=
 =?utf-8?B?WFkybC9QUkFlOGhpRFdpckt5c29uRThjblNYZEFuNzFHajE5MlN5bnlTZXh2?=
 =?utf-8?B?a3NBS09NWnU3YTlmLzRZV2daQnd4dGwxeVRHZC9hSGlSVlNYSWM5SXczVzQz?=
 =?utf-8?B?c0JCcXo3RGJueGMvSHdSbTAycmR1S1BOVlFFSmNIR2lweElScTVWdGRIelBN?=
 =?utf-8?B?L1RkdThiRmYvdnFaOTNpU2pXbHJGMWlKaTZhSXRmeklPNllFanNtRldkTzRx?=
 =?utf-8?B?b3BhUHhDbXZYQUY3K2s3WjYrb3l5ZU1uUmF4N2dvZlNvZXJWNkd0NEpxYmoy?=
 =?utf-8?B?aTR1MjFHZ1V4c1M3Q0lTQT09?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?WGNid3hVTnBWclR3RUlibDJYQm9wOWVTU3lUMDRLZi9jV2ZTV3plZWZOTmxM?=
 =?utf-8?B?Z1FoajlxUHBleXJvbEZnTXJ1cFMwc1MvWmM3UW54OEJXdWcycy9wL2xwTjRV?=
 =?utf-8?B?RS9XYkdrZVl1eno1M2xPMGNhb1J1bkpWK3BmMXdGYXI4RjNUSnBaMjJMemI5?=
 =?utf-8?B?b2NOM3o4NG9UaU9yZ0tyUm5PRlY0UVZSWmJnT0l2ajZhcFhOYUtqM3JVWlhv?=
 =?utf-8?B?ZWpXeGlzdW9VRzRSZmRxVnBKL1lkUVB1bk1Va3VyWTJnRUhrUG9SQ2xVbGR0?=
 =?utf-8?B?bnVydjl3MERGbXBRWGw5U3RpMkpOa29QbHkxV0cva1hyTnlqc0FxU3Vyd0k2?=
 =?utf-8?B?SXUvTTFXaVdVVVI2NVRDblArbXdQUVlLd0tpTXl0TXZLSEFJYnlxdnpSNXlv?=
 =?utf-8?B?MUVzSUdGUElWWllqQ2dTbzVDdlN5cTY2NkwxMkU2bEpMV2tnNVhwWFNSY2Vx?=
 =?utf-8?B?ZFNRb0Q0bW81RzF1MGVGdWMyVHNPeU1Ja201aW0ya0VrTnJ1S1QveFRMRm04?=
 =?utf-8?B?TnRiaEozL3VSNWdna0p6Nmxya3BXajNYdmtvRkN4aFR4emF1aEdQaUxhVjI3?=
 =?utf-8?B?WE45a0hGSzFLb3ByNytiWXFnOXdvNTFtL0lSbmpDTjlnakR6N1NIZ0E4M3Nv?=
 =?utf-8?B?YWI2dnhOSUlRcVFXTGpvckRyaitHMGpEQTVXcVl3c2p2S3U0NFI3MmY1VkJV?=
 =?utf-8?B?YnVzVlF3REkwS1FYWExvS2NIMnZkaFo3M3RzUnpzZStrNURXL0dNaFdWTzVq?=
 =?utf-8?B?MW1TM3ZNWnozc2htRXYyVHpzWWVEK2NYMWEzc0lyL2NlRmtjblFvWjdvMFhY?=
 =?utf-8?B?SkFGc0N6eHdLYTNmZG5zQURCWTRnNVdvWm1md1JkSDhESm0zSmEvSDgzbTFI?=
 =?utf-8?B?Mmg4Z3U1UktHQ2djSXZ5REduckt1VzFrL0RYaEtyN1Q1Z2JxWWNhbEZvaGF6?=
 =?utf-8?B?bzBGY1FsQU1BUkJNSXRSMlFmVFB0TnBlVElWeDJxSmVLdnRRWTdhU0k5S2pU?=
 =?utf-8?B?TEZLaHRIS3NtSnVlaDVsSzJha2ZwT1lpVzk2dkFjN09RL0pUVHUwbkFoNmV2?=
 =?utf-8?B?OU1ucWRud1BUM3ljUzQ1Z2p1TnBHTzI4Ylk4TmdsVnZvdDhLTWVQa0FWcHdJ?=
 =?utf-8?B?YmtnRDh4SWowd0lrY2hoOGh5QTdYY2o1OW9OQ0NVNEtCOERNSU4zM0grQjJa?=
 =?utf-8?B?Z3p2WW9hZndjd2lSTEVFbm96a0NsMGlzUE9SZHF4WmgxZUIrWHJ3ZVZDZU9o?=
 =?utf-8?B?NmVRTmdnOVpuTGYyektzUC9ZS2NlOTlvWnJkT1YzMmU0TkZpNk9kd0tuc3lE?=
 =?utf-8?B?Vi94UXhVa0xlczBLbkp0U0VHQmpnYTVWQmM2VDhTQVVrcmtkZXFvK0pWd2Y2?=
 =?utf-8?B?bi9jM29uUUF1N1cwSlBIT01QcFI3bjFTdEdXNllibEFJYjNGNjR2dWI2MGxy?=
 =?utf-8?B?OTlGMk8xdUJ2YnRmYU5QL01FUkVQclBjTTNvNmxPM0M5VHZZYU01WmdwVW9r?=
 =?utf-8?B?NWVWMXlUS2tOTUJ3VVZIM1dLMkJib1dsL01ySmEwMUdHQUY1MlRnL21majJV?=
 =?utf-8?B?dmdmdkZheGVjNmQybWdHdjBSNzJiRUsxSEJlNDhEQVJuS2J2Qk91SVFadmdz?=
 =?utf-8?B?WFh4WHY4R2ZmalJHWWtwM1FZdUplb3JIRnFnNWc0SVV1NDl2SmtKZm9yVCtH?=
 =?utf-8?B?UWNBeHdrRlRGYlZuMDlpQU51UlpjVlVsZzYweWg5czliRDAzRlJ3bjEzV1Rt?=
 =?utf-8?B?OTBsclVrLzJta0pxWEduNjVwKy9lYlNzeFZrQ3V3QjZuVTd2ZGhOUVJhY2JE?=
 =?utf-8?B?cFkvVEdzMUtGY2NoWDk2UEd3RTBHd2Y5OUp0aHlqbVN1Rm5Oelc5by9pUVpB?=
 =?utf-8?B?L1JHbEwrd051NmFsYUFhRFRWWjNBcWlDbmZuWVZQTFZZVEo4d3RCVjNiYzU1?=
 =?utf-8?B?VEtRV0pVUzUxMFYvbjNqTmlZODZMeXVxOUlzVzUxbzkzUGROb1YzSWNaZ1o1?=
 =?utf-8?B?L1ZCQkZET2pUdDNrZ1hibWw2SW9KaEdyYStJVWQ1eWUyWFJkZE9wdno2UjdW?=
 =?utf-8?B?R1h0SUZNYmF2N3VCZm1aS2VQTEx5UkVzakRYbUpxTGl2UFpFU3R3aHFzcUJy?=
 =?utf-8?B?cFlkV21rSEZiaWI1aldwVVZLNmdNYnZyTHRYNjhiajZ1TzNCME8zSG5FNHh6?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b0a1c32f-2e04-4789-21d9-08dd0fabec4b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 12:55:23.6894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HquBXYoBC71OzzgCrDBCG2cqzixBawcoSN08LUzHduY9TSjyp3MFuMOIMVIwLdjmyqBRAB+eK0tFcwKm93+w2n6Mo/U+V7VgN4+GAcDlnKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
X-OriginatorOrg: intel.com
Message-ID-Hash: 54BK3PKCIWDQA4Y57QQ7WN4B3B7MJ6SI
X-Message-ID-Hash: 54BK3PKCIWDQA4Y57QQ7WN4B3B7MJ6SI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54BK3PKCIWDQA4Y57QQ7WN4B3B7MJ6SI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-11-28 1:27 PM, Marek Maslanka wrote:
> Removed calls to component->set_jack() during suspend/resume to fix an issue where an inserted jack
> is not detected after resuming from suspend if the jack was inserted before suspend. This problem is
> caused by calls to the sound/soc/codecs/da7219-aad.c:da7219_aad_jack_det() function during resume,
> which forces the jack insertion state to be unplugged.

The code looks good, let's work on title and message a bit. Note, I'd 
suggest the message to meet 72chars-per-line so it's cohesive with the 
rest of the avs-driver log.

Title, I'd suggest:
ASoC: Intel: avs: da7219: Remove suspend_pre() and resume_post()

Message, please note that any [PATCH] is only a suggestion, "Removed" 
implies something has already been done. That is certainly not the case 
until the subsystem maintainer, here, Mark, merges the change.

What I'd so is: shortly state the problem, remove "what", leave "why". 
The rest is answered by title while the code tells the rest of the story.


Kind regards,
Czarek

> Signed-off-by: Marek Maslanka <mmaslanka@google.com>
> 
> ---
>   sound/soc/intel/avs/boards/da7219.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
> index 80c0a1a956542..daf53ca490a14 100644
> --- a/sound/soc/intel/avs/boards/da7219.c
> +++ b/sound/soc/intel/avs/boards/da7219.c
> @@ -211,21 +211,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
>   	return 0;
>   }
>   
> -static int avs_card_suspend_pre(struct snd_soc_card *card)
> -{
> -	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, DA7219_DAI_NAME);
> -
> -	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
> -}
> -
> -static int avs_card_resume_post(struct snd_soc_card *card)
> -{
> -	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, DA7219_DAI_NAME);
> -	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
> -
> -	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
> -}
> -
>   static int avs_da7219_probe(struct platform_device *pdev)
>   {
>   	struct snd_soc_dai_link *dai_link;
> @@ -257,8 +242,6 @@ static int avs_da7219_probe(struct platform_device *pdev)
>   	card->name = "avs_da7219";
>   	card->dev = dev;
>   	card->owner = THIS_MODULE;
> -	card->suspend_pre = avs_card_suspend_pre;
> -	card->resume_post = avs_card_resume_post;
>   	card->dai_link = dai_link;
>   	card->num_links = 1;
>   	card->controls = card_controls;

