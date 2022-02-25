Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690B4C4E86
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D84E1F25;
	Fri, 25 Feb 2022 20:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D84E1F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645816845;
	bh=FyK/1oun8lnkmJ5/mqtGzhNfUeeuh9ySJs6uvefFy+I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OOKX3yX5Zfa7E2LDfk0F+HJP86rtU9Opgda2Y/aXEYS6X0HHjYaC4T56AKjQTQdu/
	 tlOw3umhtwpwXqcqlyWZXKmwedVMqFgEVysoSnSyjorcsq1uMlb5TE10EWnwThhOol
	 ianbgZpmimewluA5PC/MPYlhkXDS6YgfcJVCMDyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B71F80159;
	Fri, 25 Feb 2022 20:19:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2A8AF80132; Fri, 25 Feb 2022 20:19:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8495F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8495F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="N6BBinQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645816776; x=1677352776;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FyK/1oun8lnkmJ5/mqtGzhNfUeeuh9ySJs6uvefFy+I=;
 b=N6BBinQTc5bp+lgIfPSC9Ox7AkU1IXUNHhWpm6nS7CN8C8/Aue3UzKsc
 E6rTqX9OjN3r5XwwnoSEp9uJULMTlwarmhUG+qLVXR6gOOBLME/5Uu+EX
 WAARhISdWo2Z9jHRhAT6aF9WbB331RbEBwRKU2RJVnRCQPA74XS/nQ2sc
 4LWVE1H5dJO8S8fn6921bce/xnqlKN6lQI6MDlDXdNrXq2kRKxiT8GQbB
 L4zp6LZDIHAysWNuJONtVZqcbsxbllD1msFhm7KcncJy7SxyKPNeRuXsK
 kHbnlB0wd3dbg1PgscoFlA4SOCIU2TidsUxy8LopjcnV89jehYciIPbIC w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="338999968"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="338999968"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 11:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="549388278"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2022 11:19:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:19:32 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:19:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 11:19:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 11:19:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/hUTC1Qysxjv/CrFSN7ZgP4U5m5TDDDDFWhif2sDJ4/LQ70X8BTGJDUpR32QIbMZmJqpC5qJXaFiSkzPSmCifoifDMF8bXkVsmKEfZsGzQE1mXCgOwDVx8BkGEAYcANu7XNcjTYS+5EDYynVzLUnShSiJilocD9nAuSxkOHD1keFcfiKl0+Z83QjRvY6bOPzYNW45L7zVcwl9q9UYjykawQqVPZGuSZvcb+gFu91Do5LQSJS297YgzEDnBu4Na2kdZJmB/ZudYZN3UhVCSRYqHCBMCMjE2LgkQeCWF0lkwrszvWc2gl3NVVJPRo78KHzYLuTzTHXNd7em2yPaeOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Xw6PccV1KJIG9X1Dr7qhA5cbuDg2q8M29s0jsJZ1lU=;
 b=Fh9vwgl+LYg8f2+8CxoRXXixkOToEHe2rKQ0RcvK20RFQ6j9n3nbYWC82sHQ1hnokaU1l6XqRoIQN/o+Sccku5Pj+XIv8GmTbpuq0YqpKz0PCOhZEjgYXhAjJOym3EOVvMhGfJ+dfIrh58Xii0WyB+3QWir/1X17OKhHnnRRpsJNH23+CUbi7sZ5PiAUM29LQpfTARg6y1skUjndiTSeVApQYQQdbQRpdmC2+fG0xBoOrc96hFReV8YGoRmIDRmatMxATvHkukX0Su9lJuI1ShWzHj8vCIZjup6yQ2w3+eUHVPmVWGHqspDIz032Y6gvU4fn5LB7TuGHguD/Vm2uVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by PH0PR11MB5157.namprd11.prod.outlook.com
 (2603:10b6:510:3d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 19:19:29 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 19:19:28 +0000
Message-ID: <a68589a8-c834-4e6c-d8ba-d021b96aaabc@intel.com>
Date: Fri, 25 Feb 2022 20:19:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 09/17] ASoC: Intel: avs: Add ROM requests
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-10-cezary.rojewski@intel.com>
 <377d6b88-33a9-ffab-9bfc-d1c836279b1d@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <377d6b88-33a9-ffab-9bfc-d1c836279b1d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0316.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::16) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2099ba9d-c344-4052-4721-08d9f893be35
X-MS-TrafficTypeDiagnostic: PH0PR11MB5157:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB515752647AFD3782ABBC74DAE33E9@PH0PR11MB5157.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pj5akBfg8mgyZTdhJIyS/bxWf6JXpoS1P+1szxoRQtUgBTb6vkVLKdUvYF7r9gnXRxeuKmw/eu3Jj8CGWngHii4Y8xAr7qdh6sILwahqJ9CdF9cxlupEc6IZ045VyHS/BeS6C6mKyKqQIJPsfFCnGm67okmiDcI3QEsTCw80MclStUecfydwoW95H13wjuNVHLjO7TUM4ce+o+FJ114PiU39KdHN3qL0fvb4J1SvYZbKX9j9/SYhhFWX85wlWqINsqRjRUXtYyTvP6um7TVlr55xaPUibYfLxMLSUdygNWO6ZMAF3X9yWYctl0f6RWWmdYdabO2wcZYP9zjGHm38+16WgyfXD/JErtVeCFhQsdtuyDByTOkDePAm/ofcKXb8a4himfV/Sf/tdXYsF5mO2hfS3v1+uX09v5iqT80t8GcrzRydFG1ev2+PxMPFvTO8FfrZ/pIiA2i/heR5HicKMJ7xwB4f+ZbakS/8b4S3/40SFWQqAonUgyN+kWKokyCwdzQ7z3kIPEqR35Zhe1b/qy8uLvlHpkFa5i7OD/mgzu0CiVJIykcLOK4D0TK7q6ZJxviK3Dbdgvkn2evkl9s/STZYy13+qj+NsHaopi+AAG9Z2KIQ6ZKKYige9sdIjrCDzgqu9PxdTSqOUlQRLk9pe5pxSb2Gg1VtsrRxVRTtWgEZBWqkZmiesIZ+1X0SrZVCpHpz4tAD4kjolXqa9PTMR+n/9RyhZclSOgAdpe1nAZPLHzQbnBbsiPnEelO6hd5q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(66476007)(66556008)(53546011)(7416002)(186003)(8936002)(8676002)(316002)(66946007)(4326008)(44832011)(5660300002)(2906002)(6486002)(6512007)(36756003)(82960400001)(508600001)(38100700002)(31696002)(31686004)(6506007)(26005)(6666004)(86362001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRPZUNkMlBGMWNuajRvaXI5QjhRVWlYWVV3YndXQ0ZCUzhzcUszMWpaOTFt?=
 =?utf-8?B?SVg5S2x0ZGNLUHBsNVo2M3Q2UG1KWURZNlVUQjdhb0NOK3FuZHE3Z1NEdm1S?=
 =?utf-8?B?WU9aY3ZROHU5N3RldUFLcDBkM3B1UkF4azlDSzZWaGxzazJDb2J5TFhpQ09W?=
 =?utf-8?B?dkFETGNTYVhyQ09WSFQrQUVRaE82bTBCY2hRakkwZDVlRy9SMVZ2OXBBcHVQ?=
 =?utf-8?B?QXNNM0Q3dFpyT3N2VVVxdGFzWU1XZG9MYTkzRVQ2TlVaTXRhMkNxYzE1UHFZ?=
 =?utf-8?B?N0o4QXFRWWVWZEU2b1RJdllUN0V0QmZhOXF5MzQ0SU40R3YrNThGMVJCWTJq?=
 =?utf-8?B?VlBHZlNXMzBsM1h6dTIyWUdESmN1TUQ4RTVTTkkrdnpQcWFVRHRvYmRnOWpp?=
 =?utf-8?B?OEh1NzFMRUtXS0pJZUdVYzFoVi9teUtaak1qU3JVbndPNFFOQ3JnamxqMFpp?=
 =?utf-8?B?ZGJ4SkViWmZUSWo4Q2NWeEdvM3I4M2MzdnJaZEJmTlNSR254aXNnRktsRFFt?=
 =?utf-8?B?YVVlR3pxV3luajc5dytSM0VmVTRvNGlOWlYzQncvWTUvdEx3eFAwaWhTN2x2?=
 =?utf-8?B?S3BoK2NlTGdaakdoRzZjMnhGMitWZjJiajRKTzhHMkdVSXRBQkgzS1VhOC9G?=
 =?utf-8?B?QWw1cGdnRGFrVDF0eXdMNU1jOUpvaDVldFJEQWNRTGxMKzJtR29nTDA1d1Nt?=
 =?utf-8?B?MWgyMGtXSVBUUW52bFFBcG9LLzdEek1vVHNQdUZudEUzb0NtZm9LUU1oNm4z?=
 =?utf-8?B?QnVCbU9Qc0ExOWk3NDZUS0ladWoxVFZkdkhIOUFQdG12emUyWWtrbGhqNTRS?=
 =?utf-8?B?OHVOOFRuV3c5akJPSXFPMmpjYzZNZmlYalNaT0IzQU1KTFp5dEc2amFSNDRV?=
 =?utf-8?B?Tmc5U1owRE9UM0J3YVdSMFhJRmFrdXA0Nnl6MUJIclFTTTNZeFV5bWJmeXo5?=
 =?utf-8?B?N0tORldlcjQwcWlVSGZXWlFnaE5aNXRvRElyTk95d3RaR2pvNEVSeFNxSU1t?=
 =?utf-8?B?RUErN0tWT29sQS91ZUhXU2ZONS90V25vUUxkVVFPczJSRjhiVTRVNktTL3ha?=
 =?utf-8?B?ZXZXdXRmczVDZEorYkZ4aUkvSHRZYjErb1FQaWlIaW5JbmUxZWJQQnFGbmlR?=
 =?utf-8?B?V0w0U3ZEamovZCtKamRrb05JZC9pQWdVcWo3cy9oWFUxRm5nR0IzK3k0ZnRo?=
 =?utf-8?B?UUNYYWtoQ04yS1B5TU9WS3BFcGRDUlNta0ZqQ0JPMUl3QzhYeGcrTnF5aExF?=
 =?utf-8?B?NGVKODhzMzd0Qk8wclhwU1YrR08zNzA4UkQwUUNmRzd1NGp5R1JiZmZON1Vh?=
 =?utf-8?B?Zkp1dGxPUlBWVlU5bXdtVDVMdnZXbm9EUWtOQms5bWtWblZJeWdTQk84cEVu?=
 =?utf-8?B?Y2ljSFc4U0ZpQithakxmZm9oWnNla002RUFLVGJ4S1RuKzdSaGNrYTZMREJq?=
 =?utf-8?B?RzZMcEt6LzVyalUrWktaMWdLUmFYOVJob3IvaVAzNERjdklxTk1qV1lCNzZV?=
 =?utf-8?B?YjZSZmQ0NFR4eUl2TlVuWXdzTWF0ZTlvSGFCMjBkL2hnNXpEMUlLR1VtUkZB?=
 =?utf-8?B?QWZJTmg1aUZ5Qi9Bd1Y2T2ZGdmROdkFMRnVXSktiM3RDTWxDS29qaWMrR2Jp?=
 =?utf-8?B?WDRaaHNPMmpWUjBqMHpzSVdvdlZKUkhVQkdrZ2pudDZMN2JkWHFta1F4SFM3?=
 =?utf-8?B?VW9LRlpMMXA0bFZxUHBvUFBWYUliOUJyVEJteVU4aE1QSG5iLytZQTJTd09J?=
 =?utf-8?B?ejdZcFc2TnBFYWMyNFREQkdsYTFnL2pmMUtaUE5QaHlOZnJuZEo5d2pqUWd4?=
 =?utf-8?B?Rk04cjB5cmVZYzhGc2JVU25LVytCMHpIVGNDRU1MWHRlZngxSEMzWnVaVVYy?=
 =?utf-8?B?UElCOGU4dGhJYXpHMi9pb3JTYyt2V0gzQlNTRDNTMXJjeFkvMEI2VDE3UzVX?=
 =?utf-8?B?NTNlYXpkR1hwQ3hsdHg3dTloV1owQ094UnFLamJRUStVRVR1Y0tzWmdwUXQ4?=
 =?utf-8?B?TGd5enBPRjZ5azBEUTRrRDJSaTd2MnJrSzNNK2l0ZjVZRkJNYUdHZE5WL1VS?=
 =?utf-8?B?N0k3Nmh4N3c2VzhQQmRxTmNnaTVVWUVzb1k4UHQ0Q2xEb2VQcVRnVW8zMG5o?=
 =?utf-8?B?SytTdkwrTXhzOUVsSTg2bWw0N3ZiM0UxUW94M2tyM0p4azh0WjM3QUNKVnow?=
 =?utf-8?B?ck9melNBWURndWpBeC9WWHN5RG9MeHlKc3dqN2M5RElRVzhRRWVHczAvOWo0?=
 =?utf-8?Q?6QllSy7z7ESYCAnZuDddMydpNz6fOLwUctxwie6r4c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2099ba9d-c344-4052-4721-08d9f893be35
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:19:28.8897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISeDjsT72ZpGi2hix1/s065S3EdtVY/DnBSezeyckAKAfMeL0dXiz9E9It7xSuiyAcCIXPFhX+lnj1iyr0D/nLKEY20x1XtGoHjLoafyDVM=
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

On 2022-02-25 2:42 AM, Pierre-Louis Bossart wrote:
> On 2/7/22 06:21, Cezary Rojewski wrote:
>> ROM requests are messages initiated by Host to alter firmware early boot
>> process. They specify whether the next boot should be a fresh start or if
>> IMR can be used to speed things up.
> 
> 'can' is an imprecise term in technical documentation.
> 
> did you mean 'shall' (requirement), 'may' (permission) or 'should'
> (recommendation)?
> 
> It's my understanding that it's legal to redo a complete reboot from a
> clean-slate.
> 
> It's also unclear if the firmware can use this mechanism to prevent the
> use of IMR, e.g. if in some firmware builds state save/restore was
> disabled for some reason.


This is a very good feedback, indeed I miss out on the 'can' vs 'shall' 
(and similar) quite often when speaking about hw/fw procedures. Thank 
you for paying attention, Pierre.

Yes, in this case driver has total control over the procedure and 
chooses which method to use when booting the DSP.

While I can't say the details, closed-source firmware (from APL and 
onwards) is built with IMR in mind. By that I mean that it assumes IMR 
is always present. So I believe such scenario - having save/restore 
disabled - is not possible here.
