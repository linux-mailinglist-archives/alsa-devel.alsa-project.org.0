Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F487545E
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 17:42:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0041B6A;
	Thu,  7 Mar 2024 17:42:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0041B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709829768;
	bh=oj4eQjfr7ynoCQcr/ZPt5qXx/9QRMyQDWYVWye0OcQ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vHN3yrM6GkWJJzy0DiOhe9e8zVmqEMYi64lx5vXJq/+G/K/JLR3zcW8QElqFmvSom
	 EAqtPEf91rZUizii4O/WbomvL436ALMUTd+TvzOqgjmT0T/ri/YIFqRmfv3xt4gVcA
	 u19f5+qM05Jk6Lnp+q8Ozt0dJ5MixKGW3iMmETHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 679F0F805AA; Thu,  7 Mar 2024 17:42:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB1B1F805A1;
	Thu,  7 Mar 2024 17:42:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF88EF8024E; Thu,  7 Mar 2024 17:42:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69E4DF80088
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 17:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69E4DF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i5tOBEhi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709829729; x=1741365729;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oj4eQjfr7ynoCQcr/ZPt5qXx/9QRMyQDWYVWye0OcQ0=;
  b=i5tOBEhiVj16nV/jJtwUfzPgBPNzh1SzAKZJuuaWH/B9BgbpuTHtK0Se
   pE0DcUcMPcUGg6e/+vvHnk0PzNN3WVeyPU7xKQi/PUabQxQ2cN4blFBCb
   3fQz7KJV5oV981ioYBXWy1jkVBJXSUP8niA95mm8zs0X32WfNbjYAzNEp
   WfdLFW6YyTwD6fGnAp9kGWW3Rh7YC1WE+cEnfvW1Ys/ZPdcmzh9500lNi
   chkKJSDdF5b7jsL+Jv3qxYyr03jOXU+iJOmf/aTHIK9irBmrDOX2MvHMs
   2wKj6S/2+fT4Tzq2O1RSDVZiHCnROkDtOQJPWoE/q3s/P+CmdURCcudLw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4650939"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000";
   d="scan'208";a="4650939"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 08:42:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000";
   d="scan'208";a="14857694"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 08:42:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 08:42:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 08:42:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 08:42:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpE4UUrLXalzbSgjWq8ZXbw33SXb423sbWyMjQjpXHVRr4ONXZ8QY0gFDJ+A1r70kIaHckpN5Cd/cTOf1uH8Hw9oANcXkV7c0Y3QC6qAJbJZk4RzyIfhGjwiJdCPOQWmpPMfkVe+zoeKWBLnstPuAC7a5V1xesoHo7wYcD9sesdXmYBxDD2Rf0ZcoQHhzEyuYTC6adBexoCkb43ucjv3kPbOJsD6wOlB7YZF1Haplf/GdufYH+Jci9/9EijVbCk2diPav0LOJriQmGiS+MJRlAf0XlssccWBdVO6Nm3Ox4bNjo2SnOWSBfo/2VhsxESC7S81+dFcTbrz97m5hN8+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuiEUE40DjWPpDCsqkrw9IDs5bTbsb4qGNKDBN7Uo1I=;
 b=Idkfv066swNFuNOjnEmJx1mssIoHJ5LLFwyeQAFMcLxglTjTVX3adhfT1InKx/gJasLKcEGGOwP9Ng9Hp7uJF7Z7eWf+8Ph4Jpn3PY9ahqC7OQVBiCqGIB721vsZdIUlV9fG7ObN+w48hZOEuR0EvdtgDCNmKjckQuDLbRzaFjsdJiA1Xau6yLsNRcFzYuzIOdYNqUCVVdc1QMdsjPxr0jb+UMrxtOnh+woziFpEXM/Zmqiqw5eNrukMm4zQmIsJm36vjIXK+ihQxC02kj5dhVEObbH+LtVh5q1M50aUuPn5ieGmy2/YmCHBWq22SlHWZYFLQIO4pCah5FpIaWWU5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.24; Thu, 7 Mar 2024 16:41:59 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5%7]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 16:41:59 +0000
Message-ID: <439695e8-d94a-4057-84b9-0bd86f7ec84c@intel.com>
Date: Thu, 7 Mar 2024 17:41:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoC: Intel: catpt: Carefully use PCI bitwise
 constants
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20240307163734.3852754-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20240307163734.3852754-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0421.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::6) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CY8PR11MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3a3734-b374-4790-eb7a-08dc3ec581e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 eAnFEDPhUtlgYECfg2+rm/M/x+2zWHxWegLLv1RWgM+AI3RE+D3s3HfjtaXXF1xxCot1MWHDHcQ20G0pRI9IYdQJ7Dt+8ZufZeZapD/iOgavfTvXFe35QZxb4PtrFzHGjZfBW0XmrEteHZnbOSrq+Y1fkYbduVUrlwatlQxTmLVDNNQvVP46neLs+bmY2Ni5NXAWNsXU4VE17hXB2rnRX1gbphwG5zlDcGJ6Rusg99W/921k7em8Xm5R4hCd5igng9iT7ETakECA8Sccyc0AfEXl6MgZTl26yxT6nw552kg0yEU8GUtAbd78wW8Z7+DzKaNI+fN7wnlYqHMIRX6iggcLNJM4aFoXP3E3iaQ8ISlk0E9v7+09A7RLzMIMDEy83AQUVyr6fnDupS+H/+4QxF6k3f9gMgFj5cpneZ8z3UsXIf/gshT4C6+3e+FChpso1x5fIoKHZQyi23MX8qRXdyDcIpal2XROtmFHgENANJETcxSn0yG5VGcVHaL/OLpWM59uDAzM1iS9Sy5Luvo0PGsD0wibOZ7byPpNi4+wDNbEgakY5w9z5C2flfA2wca+dGa+yIAqj8bVnFW9iq68OrnYV+HO2quQQha0p2aW6Ujkc62tdug9RlgD6Bl+Fyyy3zR99rycP/Mx8Z+fTpAfRR/6ifp7j8oUoo4iOdLzdnU=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?Sk9Nb256Y2RtTWYwWWk2T3VxNEs3UTVjTG03TThLYnMxaVVydzNaSDF3aFho?=
 =?utf-8?B?d255RXRvMXdCSEgrcU94cGx2NmFBN0wzTlRTTDUxRzcwSkhxVnFhbFVnNE42?=
 =?utf-8?B?TGlrNVB0cUlRdEdsOXhhSzVUMVlvSGhVR1F1N05SdkRGRlNJREJoVHZndFNz?=
 =?utf-8?B?V09NdkM1cEpjRTRMOGZKZ0tSN0VPNVFrRTU3Vm5BMDZhRWpHQTZMZTNnMTBt?=
 =?utf-8?B?U29vallXYk5vOGVMcjdBcnZWU1ZSRXUyeEJxY0JhUUkrcGxjMnJSRmVMWWhX?=
 =?utf-8?B?Q2UyOUorZ0hOUG1kdkVtdlJLbndJRk1QM0pHMjFuWlR1TTVjSUU2dUl3RmJ6?=
 =?utf-8?B?MW52TVNpMlhOK0VoTFBmNG9SVEpHZ3NxU21BMmg2NmhoUTBnZmdYOURScWhE?=
 =?utf-8?B?bnVNR1BtRGZOREd0K3BBTk00NjBlWXVXYlBYei8vUHdKRklFV295WjV3NHlK?=
 =?utf-8?B?NExkZmRBd2NZZkRnZXhUd3YzOW9JdDNTaklEVmZKamo0RSs4bkpmUGRmdzRQ?=
 =?utf-8?B?UTFtQlRwemc2K0ZGZThST25FWkRsMnNQVTN3SnlURVd6d1JLSlgyZ1dLT1pE?=
 =?utf-8?B?N1ZJNE83VmlyNXdMYnE4YzcrZThoTldUM2tUUSt4akZXU21hcXVjYjVEd2dM?=
 =?utf-8?B?MUFkck52K21ZKzN2YjVhRHNwaTVvMSs0YmMvRnY4dXR0YldUeGl6TldUaktW?=
 =?utf-8?B?ZGY0dGFIVlNleDEwcTErR2RVTmFDOXRyb3dEMFVhSGZzaVVRblNNM3lyM2tx?=
 =?utf-8?B?eGhIY2xXZmREWW5YQndOT0RMWjB0Y29jaThqVWlsTDErOGVVN1JjV3FUbmlQ?=
 =?utf-8?B?UkhXY01qZnErM1d0cGwwTW9BKzhTU0twUmhOK09kbXNyMEVoOEFOQ2R2eXFr?=
 =?utf-8?B?ZFNZUkZ3bzBqbDhDbE9aZ0pvRjlueE5BWDNtbGxXM0dCZTU1VTNRT1Q0VDRU?=
 =?utf-8?B?Ry9CVHJVK0E0SjJuaVhhVEt6cXg5dThrVkZMN3lNelF5STNCcVIzMHZDYUpo?=
 =?utf-8?B?YWp6WVdCL1YveS9rTlJoUElxRmtRZS9LYldIckJlZHdCY2JnZzFuUVhXS2x0?=
 =?utf-8?B?QW4xbHVkNUtMbysrVExhNEFFVVR2TzVHTDNEdDNWNG5lRk8yZUh2MVBNVmdN?=
 =?utf-8?B?UjNwdy82TVV1WkhwUkJtMFp6WHVURzJJMXRWcGtyVm44L1ZocktORUZDUWJw?=
 =?utf-8?B?SDZOTGJpOTJVaXFubWhoaGRUTHkxNFpJd0NwdzhLYkc3eXF3RjBIR1EvQk4x?=
 =?utf-8?B?cEd2dmhGcUNmNTJVTmpYTXQwS2lSak1ndExXeU8vZFNnUWV2WWhSM0s5VTlR?=
 =?utf-8?B?a243RTE2K0UzSWtYN1JwcXZWOTgzdmgzdDV5Q3UzVWZnZk1Jdmxvbm1uRmU3?=
 =?utf-8?B?ZThib3p5YTN0NEdKSHNhTWNCOXJxTkkvWFh3ZHhBdTYzd01Pc3FteFRld0U5?=
 =?utf-8?B?eWlPV1pUcHE5S0pINUhhWG1wQ0VHTkJ1RktWbUhwWXZ3cnpKdTJtY1MyVk1l?=
 =?utf-8?B?RlFQa0xBMzZMdFlENWFSdllwOERPeXF2SmVqcGtaTmFqUWlJdEYzbHAxMDFD?=
 =?utf-8?B?aEFxLys5Y0FoYk9vTit1akVSeEYxOUl1aFhja0YwVWlwVXU1dGhWdVhrek9z?=
 =?utf-8?B?aGJuZzRzZDdRdnN2QTZwczBxNEY2OUNySGlXSUFWeWsvUGRGMjltUGhBeFg0?=
 =?utf-8?B?Mzd1M0tvbEducFFhU0Q0RFhHTG1oanFjSExGa0U2U1hZWkZJd2JkbGRTUTRX?=
 =?utf-8?B?NkFoQVhKZE9XZnkzZUpvQWpVaUsxZHg4MDhVWDNhdmhFd0wyaXlNY1E3TUov?=
 =?utf-8?B?cmFzM0tWcERlQ3hjeUtNRHlmcXU4SE5pWlZacDNCTlBqVVhheW5ZTVZ4L080?=
 =?utf-8?B?R3FoUXp4dkFiYmJVbHQ5VG5hcHRRNXBuT0ZDREpGejQyeHhyQk83aEJDLzZy?=
 =?utf-8?B?NzZVUUdqbWhEbktBT3h1TG9RM1Vxdmc0ckt1YmJPSUxPdFVxTXgzNUovMGYr?=
 =?utf-8?B?WjdOTlMyZGVCZzUvc2M0UW9Kb0JnTTkxbUsyRzErTUFIWnJGVVNiRHlkdk1C?=
 =?utf-8?B?Wm42b250V2MydUJkUlhhQWJZN2ZKWHVVSjg2T1Z6cGNtNStMTkp5b1hDaEtn?=
 =?utf-8?B?SHUxSjdGWjNmUXNqN3hEWDRRSmszeVUyTXdTN1ErS1B2OUw4aEsrbzZYS01I?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c3a3734-b374-4790-eb7a-08dc3ec581e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 16:41:58.9862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ka2VIrarRFX6bfJWao0+ax0NcZblT2QT6qyF1hel3jh20no0brg2SkzDbKj7t559hqlfw0gOgSp/3wRBOPBAQ0am4Bxz7PHGmxfy+bsQUnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
X-OriginatorOrg: intel.com
Message-ID-Hash: YDBQUG6OHSKQC5NSCKUC44SY4EGZDJKS
X-Message-ID-Hash: YDBQUG6OHSKQC5NSCKUC44SY4EGZDJKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDBQUG6OHSKQC5NSCKUC44SY4EGZDJKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-03-07 5:37 PM, Andy Shevchenko wrote:
> PM constants for PCI devices are defined with bitwise annotation.
> When used as is, sparse complains about that:
> 
>    .../catpt/dsp.c:390:9: warning: restricted pci_power_t degrades to integer
>    .../catpt/dsp.c:414:9: warning: restricted pci_power_t degrades to integer
> 
> Force them to be u32 in the driver.

Thank you for this input, Andy.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   sound/soc/intel/catpt/dsp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
> index 346bec000306..5454c6d9ab5b 100644
> --- a/sound/soc/intel/catpt/dsp.c
> +++ b/sound/soc/intel/catpt/dsp.c
> @@ -387,7 +387,7 @@ int catpt_dsp_power_down(struct catpt_dev *cdev)
>   	mask = cdev->spec->d3srampgd_bit | cdev->spec->d3pgd_bit;
>   	catpt_updatel_pci(cdev, VDRTCTL0, mask, cdev->spec->d3pgd_bit);
>   
> -	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
> +	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
>   	/* give hw time to drop off */
>   	udelay(50);
>   
> @@ -411,7 +411,7 @@ int catpt_dsp_power_up(struct catpt_dev *cdev)
>   	val = mask & (~CATPT_VDRTCTL2_DTCGE);
>   	catpt_updatel_pci(cdev, VDRTCTL2, mask, val);
>   
> -	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D0);
> +	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D0);
>   
>   	/* SRAM power gating none */
>   	mask = cdev->spec->d3srampgd_bit | cdev->spec->d3pgd_bit;
