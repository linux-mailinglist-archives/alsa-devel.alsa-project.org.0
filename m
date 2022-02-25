Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DE74C4F04
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:39:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE0F1F53;
	Fri, 25 Feb 2022 20:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE0F1F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645817966;
	bh=wUllvQxzFyUp02aEPi3WD+8e8HAFvkh5ixHeLkOwcPE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GFDue7C5lV9YuiTuaO7kTPfQAoN/NQy47C+he+ganux8FCserBdOGkZp1SgYT2LF9
	 AOk0LmwTvuI05m1jSF6XcHX1uHmGF5PQY89+oNvDDaZBJewFx0LdGOzgdEHCtFBljc
	 rf0/o/LP2hF9aHy46FHkb9ixTetxEWECkSondHns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C860F800E1;
	Fri, 25 Feb 2022 20:38:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04CEFF804FD; Fri, 25 Feb 2022 20:38:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C853F80271
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C853F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="E8tU3LD6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645817904; x=1677353904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wUllvQxzFyUp02aEPi3WD+8e8HAFvkh5ixHeLkOwcPE=;
 b=E8tU3LD66oirH7LyTTH3UUoy2geXzkxvrpQNhQovV76iPCpq7EY/YC87
 3v16YWWbNG6qE1MTGEEyHSgSDgu5yIcdCWzCi4R2fobQpGYsfcdfjIxzo
 JtLJmVM6OqQCLbLJAWGWMGoOWYUbe2BfzV7/TEV0+1Z08cZR1aEP7j7ei
 JzfDyVgmBA5XE5SrKqjtdjcZfaIdhitjW3uc9u94IZlWVsaMlQkMkSbhM
 3FV8v4g5DlRmQDOJ+0SC4qClCblcLfXSFYeDp9ItPW3FBC5UDBwZ6BAtF
 Y3yfyKp7cmcCEz+ifmobiHcidZWbAFn4R+yzw5QklTiBkmawu3LhFVOFh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252297992"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="252297992"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 11:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="549393882"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2022 11:38:17 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:38:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 11:38:17 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 11:38:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mf1Yn/GqAp5OaHOZXzcvNBndE/HPzlXhhMigmehveL3Ar13bIMPnAszYKoyeqk/cgNUtpKX2Bihk6MJkVLJseuoFzsIGGPDH+AhsHNiOPCX9jujURKjP9VffMPXGtYpEfQ3W151IfQJ+7gXMyJkmuSALwP3Qi7ME0QUleGKDvpSasmncbFkyv0PglMupJXwh2x+8c6RWKpZYlrKpgUlbNg4obFTYGEAYwXpriBvj5JDMOhfIyt4LH2AwZ8m0e4qrDruAVehANPW/NWXHtd57FG+y3nZRD1rRdpcZ15sGOLFeyrObE0mvxlhj5q/qPOZeFdhb9bNwc+iW/4Tpis8dkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glmNL8SKnAr4EsiDGnvf44Rv2NPvu04cTUte1SFoNPE=;
 b=EuJSVplLzBt74Qn6hyU7+vQoBrOEwER9Bm3xX1vW0/ATu+EiPRv3kM44ncKMxgRCXO5EouGAUozcAG6Kma75Juu5MSyvZRiG8V65PwU0bGS6MG5GZP3xG8qlJ5glucdDnWTv9Ly4Th+3h2yTi4c4v/qD05lY8ZjU1sCocoATlLB63VyFUGJYs8int6AVQhFoUyTOjjZ6xTR1bz1riRRAF8zNEfh8RM0TpTmCk/HO1eqEnO4HpL7N6T20rCJT47O98p2jOPqWk2zCqc4fOP7D/T/UcMPPyVnqL7rsaMDmFpmjqmttOI3ccZO5bueqG5hapyREtFMNh0aGOiEnSeO5kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN6PR11MB1747.namprd11.prod.outlook.com
 (2603:10b6:404:102::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 19:38:14 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 19:38:14 +0000
Message-ID: <1ca2293b-95f7-eb8c-6e59-ee314d4352fb@intel.com>
Date: Fri, 25 Feb 2022 20:38:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 15/17] ASoC: Intel: avs: Implement CLDMA transfer
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-16-cezary.rojewski@intel.com>
 <fdfe86e5-f44a-134f-c98d-a808b22032a1@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <fdfe86e5-f44a-134f-c98d-a808b22032a1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0263.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::35) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0facc43-eb11-41f7-b09f-08d9f8965d3f
X-MS-TrafficTypeDiagnostic: BN6PR11MB1747:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1747D29EAFE1BE7C0849784DE33E9@BN6PR11MB1747.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0b18Zhz8o6CnzA2Dr7wi2kH3x0haDr+PZxX7BipOL8B1B1kxhZbDTimmeXyV7Zyap7HuMC+6je8TPf9g7wJctV0QyQwZOqEMo1q8C63PPZgWQJb6xgSfSsIvNMXK0FnWNbQ8ARhrZr9r+BYmd47/ZManUVSr7INPO1Mwyj5ko4vJ1wKaOzTGfIlDxUXN6nh3Ggt0Lo1djE+U0TI1pkP/QkzjP5mwiv6KzHOBihdquuu7dZdOTaew3Stcr0oSTCY5AtuWxEaF0GrWCHhc1+QhmaeBn8YEb452ms6L8NkQvOnKE8cDsQZLZBL6sQhkzrh0yAdg+bQriwTVNBysCSGvWK8sAP4hV89ZevKD442qIaTJ+VbfmZKIZjd0EerWJTAe8ePlYSRCRWfPaoZbQ8E6lzifaxHUKnsWNcTSk3ewAigYE1/pw/FOlGJjlCIr63uRoIcsAeJrgaAm2ui7NFJaHj89k0c2MoSgWDeRUHCNL8gNQpDnAoCpUfa6z1FA4aU87vD9ENKSKILr/wBN1lu6QFalZRGacbHFfczLjhkUbttRxNwaJUl8yFSZeuVGzTe3L+apxaD6mHGMKY1GiDTlWfIa0LzWi+I2mVVMqq+yoUOrK4eUG3zRHJ3ukiBG3blTACUYm4pRbs//85BwDUxp72pSDUPkyzmbJE+kfuCYbL1MHx+wBJhnIiamEHlUqvo9GtPjioIQxU+unZrnXthuJK9sSrB8PYKz1mO40ZHoyss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(316002)(6512007)(66556008)(36756003)(8676002)(66476007)(31696002)(86362001)(6486002)(53546011)(6666004)(66946007)(6506007)(508600001)(8936002)(83380400001)(2906002)(186003)(44832011)(2616005)(26005)(4326008)(7416002)(4744005)(82960400001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1VxNTJxQ2lQanZETGZDSjdyVDFMNFF6NE1ORDU4ODhxQ01DSjF1VmFITTl4?=
 =?utf-8?B?UzlPVDdGZklBY3ZiZEhiSy91NWVkRTBGSEl3UmRIQVhDZlg1a3oybUUvYnNP?=
 =?utf-8?B?SFJQTFNmNmJvdTlabGliNUY0S1ZIUm1XSjNDUTlVSC9nSXZtZWtFbm50TUJu?=
 =?utf-8?B?eHJpMHJZekhjSGFURWozdkpsMDVYQjVTaDRpNTlzWDFGanlzUkJmaGRPQzgz?=
 =?utf-8?B?K2JBOEJLcWlmQ1pvZnFWS2FqV2dBeU1NelFkcVFEVXlmakgyTE92ajhtTlNE?=
 =?utf-8?B?Umx6ZHZnSmtkWWUwZGxhY2NvdWdLK1l4bHEyalAxNStnaXF5Z3J3S2daMGNX?=
 =?utf-8?B?N09HcVhoWHVDQTZBL2NpQlZRVE5DbWFKRkgzZUQ0emp6TGE3N2s5QVpaZzJ1?=
 =?utf-8?B?RlZDdWVZbmduRFoveHMvL2l0OG1DWXZwWVExMnoyaThwazZpSEpSbGptZ0RF?=
 =?utf-8?B?dWMrQXBCMTEvamFoaE9XZVdVbWFFQncydlcrNTZEVVJpM3pUZHJYUksvZHBU?=
 =?utf-8?B?czJRdDIwSmhvNm0xSG9BcUZycFJPcVlRTlcvSlN6K1oweEZVTFRQdUtYcHBK?=
 =?utf-8?B?YVM2S0YvTFNiK2h6QnVJVlJWSHJlN0s0Ymd4cWVlYUdnR3IrYit2WmRoQkpy?=
 =?utf-8?B?SXJ4dXA0Y0pVckpnWHhwczlSaSthWnQ1UHRtZmliQlNIR2ZNZnFUYWFWcXhm?=
 =?utf-8?B?Q1lzN0taWnJyNDYrdVRxa3hpb0E3TG90Q09VVnJDT3FENFlGdmxPZjdBMVIv?=
 =?utf-8?B?VVZqUFBnZnFaekRPV0pNNHRna0lUVmNaM0h2cHVMK0tXNTk2cDNDVUNhUVYx?=
 =?utf-8?B?OXV0eVRnc2owTFVLVnhFSThudEQ3bTM1WVVmOWozZU5FQXYvZ2lvMHN4b0k5?=
 =?utf-8?B?ZDREUmF4cXVxcE85SU5GaXBTWnlXMWtTVUZWanJ4S0VPSkNQSmRSdVkxc3Jy?=
 =?utf-8?B?UE1LOWR5Njd0bGw1UEZrYWMyUGdHaHRBcnpOZkdaNW1FMWZUVXdweC8vWEN0?=
 =?utf-8?B?NTBTdVpibWtvUVA1bkc2cnJhWnJ2amFrcGVDbElXWS9iL1FkT2NWRjBKZllo?=
 =?utf-8?B?TEoyMzhUdmhSMGR0NWI0bmNpUzJiRG1STHJla1A2NjVWMllJZ0ZadTBwUVJI?=
 =?utf-8?B?bVY2Tms1UHNjSmQwbkp5QlpjaXJZYU1uY1RCclQ1bDhDK1gzMnZMV2VrT3hN?=
 =?utf-8?B?NFR4U210cEtpUlk2cG9ZekdPdmh5WmsvMWNBK2V0cmthQmQwaGRaT0FoSnhJ?=
 =?utf-8?B?MGNBVm51ZUhHMmgrM2tETCs2VC9yeGxoL1lJTXdXQ3F0UzV2NTVodWxVS0N0?=
 =?utf-8?B?SDl1RWtnT29Yd3lNRVpSTzM4OUowR2EzZ1oxR09EREtROTJPYXd5ZS9Tc3Qv?=
 =?utf-8?B?aFkrb1ZFQmpKbXJ0eTBaMUcvS2pPaFU0a05GRnl3WW9WR1YybXdJWWJmb3Vy?=
 =?utf-8?B?dXp5dlhIbWFydksrL3RxdCtjZytpTzZLTlgyaXlSNjQ0ckNzWW5EZnhNNVlF?=
 =?utf-8?B?bEZrSndORU4xcEFnbjhubmFVWHZiV0JuSEhRYWl5N1ZtNzd4dlpvd2N0NDFN?=
 =?utf-8?B?QzBLalNWamVZbFFiNS8vUE9vcU15b2J6M3ZtVyt6MWF5SmZQcmRXRWw4TDFL?=
 =?utf-8?B?NmcxUUhCU3pYQnBXUDczUTE0THFYK1liNHFSUld6MzRZV05kekw4RldCK0NX?=
 =?utf-8?B?ZFlRc1djUmdFNnphNlJiTU1ScmlsWmx1SGZqMWNxWjZoeWNXQkFhSUFPTnBr?=
 =?utf-8?B?M2kvcU5oNGdwRmtiREhvb2ROVEdXT3ZWV1NDZno0K1dvbE9KSTZJakIrZzFU?=
 =?utf-8?B?b00vVUVMcjBES0pEQU4wUXJwTGltYVBOQUdEbVM3eGxaaHZWRE5pQnlhb1Br?=
 =?utf-8?B?Y1dMUXgvQWpFWXZZVWdtcmRaK04vaEZQcmUzNmVIa3pXTHZxa0dyWkJ0WllO?=
 =?utf-8?B?cHV0N1d0U1M2T3l0WHYzMTBqNzh3VDV1SjkxQlB6V0w1aVN4c3AzbUp2OExK?=
 =?utf-8?B?NnhZSmN0ZVZvdmVZVlRYcnVYc0UwTkJwdHBONWZRSFFqa2JkTS9NMFI2RnFF?=
 =?utf-8?B?alJSNW5GYk1iQmVnWkhYaHl6amhIUmhTZkU2YjlSZTVnNE02c3IrdTFWZzhJ?=
 =?utf-8?B?Tno3YUF4YlB2WEs3QmtuUlBzcE5IUC94d0VDaGt0RjE0U3l0clZwMkJxVkdW?=
 =?utf-8?B?QnovWjdSYVRuUFkxbG5RSUt5ZVlaZVMrR0VtTkdEa1hqR1BvVDJsM1VRd2Ey?=
 =?utf-8?B?dTIzTTQ5MEZpV0FNY3h4N09Ddnp3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0facc43-eb11-41f7-b09f-08d9f8965d3f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:38:14.5998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPPUMPGVmAc1cgAiQjjtjmyfpL4/vW/wX02l0lG5HwxGnYt9uPx7RTwGQua0jtAK9MsupaSqvWv+cZsDcw1y1L33jw0DA6VGuhVaKXwo1fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1747
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

On 2022-02-25 3:18 AM, Pierre-Louis Bossart wrote:
>> +int hda_cldma_stop(struct hda_cldma *cl)
>> +{
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	/* disable interrupts */
>> +	snd_hdac_adsp_updatel(cl, AVS_ADSP_REG_ADSPIC,
>> +			      AVS_ADSP_ADSPIC_CLDMA, 0);
> 
> single line?
> 
>> +	snd_hdac_stream_updateb(cl, SD_CTL, SD_INT_MASK | SD_CTL_DMA_START, 0);
>> +
>> +	/* await DMA engine stop */
>> +	ret = snd_hdac_stream_readb_poll(cl, SD_CTL, reg,
>> +					 !(reg & SD_CTL_DMA_START),
> 
> move to previous line? we can use 100 chars these days, and that's what
> you do below.
> 
>> +					  AVS_CL_OP_INTERVAL_US, AVS_CL_OP_TIMEOUT_US);
>> +	cancel_delayed_work_sync(&cl->memcpy_work);
>> +
>> +	return ret;
>> +}


Ack on both.
