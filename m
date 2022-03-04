Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2019A4CDBD9
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 19:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFDF61F38;
	Fri,  4 Mar 2022 19:11:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFDF61F38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646417517;
	bh=YDnPM+csk7i5X5wzmUlANXoFJWaRNfPeZWV1rn6okXQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TCLQirabczulcU1zyt5bd+woWAc9v9odCH51Y2yXsDzEiLS0eyoUuAss+ebJjk9Lm
	 MEz6JasftZNgQWD98oDOopdBb38vMLiX8fg0IlpNyl2zACudlyg537METZ8cAuv8dF
	 /pFaXGx3qCvONPD1URNKKPjYP55XnLGyV5Op0w1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21F93F801F5;
	Fri,  4 Mar 2022 19:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49D3BF801EC; Fri,  4 Mar 2022 19:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BB3CF800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 19:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BB3CF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XEyihpJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646417445; x=1677953445;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YDnPM+csk7i5X5wzmUlANXoFJWaRNfPeZWV1rn6okXQ=;
 b=XEyihpJOHLoNjM96w9p+l4khMSSyDv+VCnLN1wSMFUPNlFi1RiukxWIV
 snw+Vm0OkAy17HV4K4hadihxQUEPz7Lu4xuf6YiD0vDsRD/hPcO0Io5rr
 g38JpjTamesopD/wtnVSqL6v5saXvZ1nuoibYOXxhYaSHNBDWXYii6+8z
 w1kY/y3oAEJMzyuKNQeidtLCZATPY7FvSgO/j03wOUguoxGGEGyTFLyZH
 HtciONioujmoDNU7pQTzVtg4aQ3dLvpuELCnDC95OtHfe8Ecj7eLPrp6t
 5DuEar0zSOX3u0nru57LmAcnIH0i5SRCIHkAITrhlHUgbKHojs3SL2+9Z g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340461230"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="340461230"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 10:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="494403279"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 04 Mar 2022 10:10:36 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:10:36 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:10:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 10:10:35 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 10:10:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n49RQOm0Z6gjp1kg6XWa/BNnAWMmV2JpigjJVEz9MR6URXnr4jWsjIYIgYqZWRm509YkvgjDmpPS0E+oa/cipc8ZlZ3lnAYcExPPO/mAbQOfNrb1F3Hil5t0AmjBD0Wuvb+g70bzVl3VocfbDgmqGwc6npX1Bm/b5ebVhNczj3AUs/UmBwR5d+ujGzTj7hDZxSJwkaX+9HlYGQKzm0Lsf3i8VPXQ13NSuuGuji1+jeSUmvybbzxPVbE5hBaVQ3M7or9oDCxpqKVmtLYO6tXUHy1GCH/2/mZ++0PzXyhP2kDsgWUjskZalu+6zAeG8t2UQmWppRuCFeo0EKCJlH2OSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3b1eGmUua7mZXNRu4NC+AFiVKhFzZUqMzp7TaNKfsQ=;
 b=TSgwjzeki1WTq+No9tS0zjALXzTnHi4ckWi6ybZ/hTs1yZ/A+/KKWRnYxverAQJcqgQvWVHXbZ2pQ2zEpSlNhlZEL7agKftw11cpH7qkDu/R+ojIAcvXva7i9cDIBrWvL4Q5R1WWFe4kGoNoCfmYsgi0bUpp2YooyGSr4nihMOH8ljuaqESB74MGJjU3UsGORStHQfXlIuWEpR2KL9dC2JjoEeTQD6SAxc31rEwYdgISKvL2Js/BXEuevAaLuN7DQrsudEkP5+6O03cigDzGgbIM81VkmG1kTzuo/fu2Y6OaktiAxQ9UnqhrqeKuFhcd0o728lVm5Igx46AJUwFa/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MWHPR11MB1437.namprd11.prod.outlook.com
 (2603:10b6:301:a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 18:10:33 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 18:10:33 +0000
Message-ID: <0ec0cf47-d02a-db7f-c912-3ae97d7052c7@intel.com>
Date: Fri, 4 Mar 2022 19:10:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 12/17] ASoC: Intel: avs: Declare module configuration
 types
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-13-cezary.rojewski@intel.com>
 <8f7b174fc61797e7f229ac8d1e13631863bc3372.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <8f7b174fc61797e7f229ac8d1e13631863bc3372.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB3PR06CA0032.eurprd06.prod.outlook.com (2603:10a6:8:1::45)
 To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e86908f-e710-4f63-3f26-08d9fe0a4641
X-MS-TrafficTypeDiagnostic: MWHPR11MB1437:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB1437F99A44A4C5AFC3A9F9F0E3059@MWHPR11MB1437.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2IDyruQh1x7KbLJ5GqbK+gLj2iN9/20ti4jBZ78fv/TXoirqaL1wBGRUOPBxwZ4Q9Aosa5Fs2uThIVw9J/vl0iHX80IEndvx4E1amZ7EE1t7kklyexGZqoFZWogdx55JE14OMl864gLkljyymXkNBDV3n7IM63f3Yd+ttn93anjZswyjVrWwH1NI+Rqb2wBuuk1ONHrOv1WYR/V/2holpRqOvldsdZ2ioGIyDn9Z9Ts2C0SjSV5LqcrIDLT3C6+EP/pT3rEN1HRc0Vi5ikMN6/BuOxWz40FN1uYr5aycYFiTXYd5MaNt8/FIkpJ27nkIMjquPsrqiyNro+Pczst+609PpQ29khnn/fs7tS0bsN6ekISpP2k+DSv8vtiIFyi22ROBYWnaC+Fm1EdTDoUAxNOnEPYpLus9Onj5aPtUMaMpuYcmd5dQGBVsADoafs//AwprqAQagFMNH12YK5E0mbJ6B4j3Z8Kz3tFMvJpX33yfKWbk9v3WV5ORVHogpBegYYDac5TrdVSpXz3bbv8GTD9Bg3zme0xWYfNCEKgEWUUTQZB1xbhuZtlMlPampVTUQTlcGP1ISySsC8Kt+LzwCqXCl5limBqpVdul9/nvwxILSGYMmzgpCnN9JgcWxyVu9tYwhE9dGwoVn1NoWHM7bQEzGhHZC16Iz3RE7zYB3pQJsf6nH0p5IjOWkoj3JP4cwWSxV44zwvFJxNbqat4sNel1x1raimvO5ic89JEF7M4WSlFhgY3hKZdrme/JZU8r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(2906002)(26005)(186003)(8676002)(53546011)(6666004)(6506007)(31696002)(2616005)(508600001)(86362001)(6512007)(6486002)(82960400001)(66476007)(66556008)(66946007)(44832011)(38100700002)(36756003)(31686004)(316002)(5660300002)(4326008)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGh5MDdaQVg1dC9hV3dmREpnZk9DKzBaWG05Z3NEMy9IZFpXMUJKbmlpN1Zp?=
 =?utf-8?B?NVNCZVpCR2JJbWJtVFEyTDZVZEIrcjhHQ1ltVE8rTUd6TVpyYnpYN0ZhYXhH?=
 =?utf-8?B?UGgwVFJMc1FIYVk3VFQrbXNtL2hURUs0cytSSmMwbGhITlFDdWdHTmsvR2N6?=
 =?utf-8?B?b3RsVmdLMnU0MzVVbFUxN3dIYnBFS3V3Vmd0c0JZYVhTTFFjMGlhQmhtT3o2?=
 =?utf-8?B?OTg5Mkk2VmNkYnkxeGw4clB3VXRNcktHMUtKU0l1cmFjWDhzcEN0elZwbnFo?=
 =?utf-8?B?MTJyUEFnbTJxSzN1ZUNlYXExbGJ2d01RUXUzS2RJdEpQOVNzL0NKTkozTFoz?=
 =?utf-8?B?UWpXanVTSGJjWGhGMEszMTE3Vi9ubHpDUjNQV28zN3krM1lyN1RuUW4vQzg0?=
 =?utf-8?B?elpvYXhrekZ2N08wUWZmSWl2UzBUVWl1L05PaUtDNG1kQjkwT21aM1R2OU40?=
 =?utf-8?B?SnJxNGp1aCtFQzhsNUNGSFBianpCQllFWDRiQ09JUjJGM1hTNzdGYWpCaENF?=
 =?utf-8?B?eU4wMENuTHZhK1c3Q0hTQ2UwbVNKVHBUY2dEOGJseUdMbThYRjU5STd2ZE5X?=
 =?utf-8?B?NkFGYzQrS1l2aGtaVEF0L2Vzb2VDYVU1QlVZeWRnYVJ5TDNOSGlOUWpZbHFj?=
 =?utf-8?B?WDVTWVZJR0lYSjg4aFNYQ1dqeVU5M2xENWlaeSs2QXZaejlBMkxuOGF4MHNl?=
 =?utf-8?B?SzBRYUtlVU0yVUJxbEttdWUzUnEwaHYweWs5dmYyVUFlT1MzaWJuZGhnVDkz?=
 =?utf-8?B?MG1pZ2hwR0V5Y1VaaWwzaVRRN2NOeTAyYzZjemdKUkxKY1V5TWR2U2pjQ0V4?=
 =?utf-8?B?a3BzbTEzVTc0T3dPZ0l4eGk1cWVtNmQ0RXFkbVVVNklYaldGMkVQbVEvenlX?=
 =?utf-8?B?WEFRdk9VQVlwK2xGZW5LeGpkYW1tbkI1MHgwN25SZXRteTMyYk1uNUJTd0xR?=
 =?utf-8?B?R0oxRjcyM1g0MFBHdjQrUmxxNDA1TTQ4ZE9Nc3l5dG5IeTJlb2hIUGpmaDVT?=
 =?utf-8?B?eTFDczdTOWJBalV2OHZ3bnZ6OTEzcXNqSXk0aXBIS1ArbmZpSW8rcnFsOXBQ?=
 =?utf-8?B?c2tUelRMMWw1R3o1ZFE3OUVqSE5NY0xFQmlGMGpTK2NXK1QxVklXaEk5bEtn?=
 =?utf-8?B?dTdRVzFuVEFJUlBSeGlWWXUwS1FkNXh2VXAwYlBZclA3Z2pqOUMvRnAya2U4?=
 =?utf-8?B?UDhaRW5rdFRqQjloYmxTRnF0dmhpMk00R1RHZ1BocTZhaVMzSDVMQnhKb0x0?=
 =?utf-8?B?YmsxbFJhb1dZdVZsNDVEa21aSUh2NGFsR3RUTCt5K2M2Nmc5VE5ZeVlBSXdx?=
 =?utf-8?B?eTZjRXRxK0hHeEtzZ3pBeldEbk44eDNrVG1pQWhDKzZwQXBDakQyVnJDMU1D?=
 =?utf-8?B?S0lmbEdlMThLRGFEbjBCaU56R1lkbEJaaXg1RC9ZVmI3Ykh4K2lvKzliSzB1?=
 =?utf-8?B?aDF0Tmd2UXozWE5Rcjc5V1UrMytBVHkyRXJHOXhKYnM0LzlndS81RmMydlF2?=
 =?utf-8?B?cHpqSFVUVmNjT1ZiSGV0YTdWNnNRM2ZNRHhhbENVN1hrdVpuVWxUSDlrUEQv?=
 =?utf-8?B?ZlRDaDlLQ1ZCRCtqa3FVcWdVVzhHSmxKd2U3QXFFTktwVkxwa2VzQ09yY1g2?=
 =?utf-8?B?cm9rdXhkMW02Q1phVnh5S0xtclRaMUFTaEpNUytEeE5OSXFFRkFCN1ZkOEpu?=
 =?utf-8?B?YUdKNEdUNm02ZWt5dm0vZGFIaExNdDhNN1cyMlJNbWZ6QmZWMzZlUHhxWGFu?=
 =?utf-8?B?R1NPcktpdWFSeDF4U2tIV3RNZ2lUaEhDMGZrLzdOUHZSTGN6MHYzQmt2VEhZ?=
 =?utf-8?B?KzFlWDhMcWl1WXBZbCtKekxVYWs0ZDZFcDUyc09BZ3Rjb3ZtclRjbyt0M1BZ?=
 =?utf-8?B?TDBjZmlkamJ2eE5MSitobllaOFZTblBaZ1Q3eGJ6Tkx2dU1rbGpkdzNWeWg5?=
 =?utf-8?B?eHphSTk2aFh3ekFDR2tlSGNaMGk5bCtmeWtOdVJlcDBxNDRUWURwZmljRFRm?=
 =?utf-8?B?cWNNa05TWEsrS0VSRUVJTHlPREh5ZDlBcjg5SG9sYlkrS1dOdGF1S2taTFFX?=
 =?utf-8?B?WW44UHg0WFN1MFlodzVJVW9sV3ZEcWFpcEx4NUIyalg3MnNZeFgwa3JWc1hl?=
 =?utf-8?B?d1g3Y3ZzMkRJYzJENy91aGZzWTJVak5uZkZvTTZPWWdJU3dXNTF3QkNJVVVM?=
 =?utf-8?B?alBFREJBR0dtZmNncFhJeFpOWEh1bWFVY3c0QUJJWE53dWx1ejJpUnp3YlZ4?=
 =?utf-8?Q?qhvAUc2FE/1WqhXHqn3AcCc6a6rn0LkBWUcTYHTRsM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e86908f-e710-4f63-3f26-08d9fe0a4641
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 18:10:33.4257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/weqpxXPblpBYPCiahQY+gKRjoVpbytatE/G52yjJ17tr9469PGghiIEzUx96xmBXmRvXrCqS9xQIClT2r1zLF/zgeQ8QNtL4obgzbc9m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1437
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-03-04 5:43 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:

>> +#define AVS_INTELWOV_MOD_UUID \
>> +	GUID_INIT(0xEC774FA9, 0x28D3, 0x424A, 0x90, 0xE4, 0x69, 0xF9,
>> 0x84, 0xF1, 0xEE, 0xB7)
> Why do you need to hard-code this? DOes the fw config info that you
> retrieve using get_large_config or even the FW manifest have it
> already?

While I can't get into the details, the problem lies within the firmware 
binary itself e.g.: copier may have module ID of 3 in case of firmware 
generation X, but ID of 4 in generation Y. The only sane option are the 
GUIDs - these have never changed.

Even when reading manifest, driver has to have some kind of method to 
understand what is it reading. If one cannot trust any enum or constant, 
then one won't know it is reading copier anyway. GUID list is the 
necessary evil here as we have no options of repairing all the firmware 
generations.

We do make a snapshot of modules info data through LARGE_CONFIG_GET and 
store it within ->mods_info for later use, yes (stream runtime).


Regards,
Czarek
