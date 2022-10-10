Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFAB5F9E33
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3140C2903;
	Mon, 10 Oct 2022 13:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3140C2903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403127;
	bh=TM4k2TIWoTiPGZcRGU3SYmPUERwH1Q25iRwtPhw1FCE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sC0U07tAZdXyKa2KohFoRaNUVGD98cmCngxLGbD7RI12nI1J3vm6UESnQhT+/ID1T
	 rMf1Zvmft9BUKfgQ5WcshHd71tLA8/2+HXuJISh1Vkz6U/TwhgeI0T8P/+8yeGeXPU
	 K1U8JV9Lu3Ms39MMayFeUgDmxmfcobAu2h+CdS9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B81BF8032B;
	Mon, 10 Oct 2022 13:57:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20A1FF800B8; Mon, 10 Oct 2022 13:57:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 862D4F800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 862D4F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FkW2oCm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403068; x=1696939068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TM4k2TIWoTiPGZcRGU3SYmPUERwH1Q25iRwtPhw1FCE=;
 b=FkW2oCm8xifsWHd4VaS/elNClzD5FbBtLLRnNppe7Xj8hFKrZYfITgta
 SKpIThZ1dGyjwre4kOj/1FiaxU8xBC+1VWEuyDnhHspvHvD3CMUpFALzi
 TNAGV5OjYIF/HCrlSGY0aEUExvQdMzOA6z1sfp0nxgLFKw1IabRCY+Pb7
 mSqJ8Dz+w/5yxU+E5EBoS1rnhdjuDnP/xK/sIVMV3lAC4aNk5ZdHiQwf/
 q2EgK9emYcjBCr90f0qoTwWFcbvFwnLZehFL7vbjpvMP+liW40G+50soQ
 zbcPGrt+nWcFpYl8Rvv+qdcONLs59BcXbt3XlptTvhPdfzIf80nTUKO+b w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="287444584"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="287444584"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871076585"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871076585"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 04:57:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 04:57:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 04:57:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 10 Oct 2022 04:57:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 10 Oct 2022 04:57:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGFbG29jwvwyTS/r4X+cbwPgh+n23tb9in5jK6IGHTsJ9uKJPaWBx6JgkmqzXvknCRaIqpJBg+8FHUQLN2Bd+xiv3ymbvcg3CNjfcQXaKGEXZRky1dWXVZCzjuOqGxe8/bzIwaGS86mVeh12jSgXuYjSaY3XiN4xjobsb7Zz9+/w4B92gwKaQVHaBPUwcND9Wl/w2M05Jbww9f8RowFD0HrM8yTt+CSNOpaP4Kg9R0GjlJ/ulz6U0WRewxFniNpaI7yqfIiuFPFqej2T/At0yxiLADMek3SIAGtkgKlXh3Evjh1FyhKU8EhhadFm1dy/E+/9XC1FazFeskF97DevDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdCS2EnnC+ewjw8rKRPcfAKhDutmHa0cXY2oYI/mQ7c=;
 b=ighJKCT3NeJZ389wLR6fN4jA17gOlr1yF+bJO2KnvmG1Ia2H2WRnyZ2WrvDTuM7f9J/zuuUsRqjfrtp5KDGVaOOO4cyXqbL7mIIHmN8fg54oJ0jS3GZtKoZHG9D+D2eRrYRZoyuBKURHP08feyP76zkS5wQQoJhmC+fLIbiCodfhCBl5hoWMVtQAvY0zk0xTqn5vlXH6zb1HfmxUdplEOrPVvC4smg2vCRACtc65kGLbK9JF/KiqYVMQcUgAhdxVbOHBRfdgxuBOmgFNwOt/Jobhg5uv9y+l74IfmI1+DgehScYbfMdbD1RsTQH1WVwgOQZkFqw8thZT9MWKpo7Ndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 IA1PR11MB6244.namprd11.prod.outlook.com (2603:10b6:208:3e6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.28; Mon, 10 Oct 2022 11:57:41 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::2504:e0e3:a688:52a4]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::2504:e0e3:a688:52a4%5]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 11:57:41 +0000
Message-ID: <c53cdc70-f620-9a14-f1fa-a55f18388ca1@intel.com>
Date: Mon, 10 Oct 2022 13:57:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 00/15] ASoC: Intel: avs: Fixes and new boards support
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20221010120749.716499-1-cezary.rojewski@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221010120749.716499-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0074.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|IA1PR11MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: 4659b14e-e288-49d4-45ff-08daaab6a240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: coCLLPPGqO8Jpjsq/qm+lHJpjGBLSbagS8+HPLzZTg0dBEqEsmldBpRVsyslAHf3oRulpJsnbdsL5ShiYNPhF8jyeoWxdAstAMvl1me31ZG0eDas1ruYTAlKSTmpqx2ytT0e2xiX1/8gUokIK+lA7LHJf0Prdb99KouGCoM/N/CZKT/TpgrR9lFN31WC27N4Oh45x/NrQGQLam1IiKmP4znzqIfOTOPFstDBicLe+Wqs0Q6VW7cZ/14TG6TY2zcdd+pSG/5836mWB2Q70aVKDT4zftDP4NgXAXmGDsDHwcvTh/rukzK0LZ5gV+b3WI4TXP+X8jZxGQHUsbTJjeK8x/dLNucLN8fAmNmf+l7C7ezgcjaKnzn5paQ/msEm0c4FqkIly1THvFteRU0GOtRarQE0mTHlhNjr1Nt9wyMd+4usd4RlYsTm8YsjrqfnSAe4GYnaHCx6YRZgyWp68Rb8kUtkKrsB9RTSYEMJHtF+gxYa5Q+xSHWRaBrODGjXLLti0hmDbw1MHGnifT3UzIscvzbKYSrfUAhZDjxI/Qq3R+0yxOCr/9GECITRtbg/O2g83FBpuYOmbha4ViSScCR0LnZmerHHlRiB3ImpgFM1aMEVxdivJZZdLlapmDxm98/KD65fCUYuuKqEsg3+H4PFkuZW98xbTPSCgbD9Bf8bJCo7Z3bvdKRH55CVaaER196bRj2b0uTtOZm1buScGh8Q7M70FT+Xs9YNVTZSGSWOhyAWzuFuTNgwLu1MKM8JJtH2q40wlFDg+zjr8uje1XeoLnw/5LW4naKRggRzwrAuWbU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199015)(36756003)(4326008)(4001150100001)(5660300002)(8676002)(4744005)(86362001)(186003)(316002)(66556008)(44832011)(66946007)(41300700001)(31696002)(8936002)(6666004)(38100700002)(478600001)(66476007)(82960400001)(26005)(6486002)(2616005)(6506007)(6512007)(2906002)(53546011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REs3bEtFTkpxd3ZJYzVKZHFPYmpiZEV4Q2l3Zk9CMkRWQlJkNnQxMlJpcUNG?=
 =?utf-8?B?eTdUWXl5ZUtJNWd4b2c3MW1iNEFjNXlUcEpNTlE1Q2VHVjVjY2ZueXlqcnlT?=
 =?utf-8?B?SXAwYStWNmUvOW05cmowWTFvZmliampsb0FRci9BL0U2SWU1TVpVd1R1QlNU?=
 =?utf-8?B?WTBBUlNCMFJ2REljYlIxTVYwQ2pjdG0xemRPN01SczVjK1IyeXVBMjRjZDIv?=
 =?utf-8?B?Z0JyQ3BDL0p0YWFwZ2t4b25MYmpkeTZDRTBsd3VuRnZGRldKNHFGRFR1U3NJ?=
 =?utf-8?B?dit5TzJtNE55N2NsL242UUN2dEZsSTZmN041VG1KaFJPM01GQklQaDNaeEF0?=
 =?utf-8?B?L2NHZFpXZDJpVWtWZmNDRm1GOWZLZjdyTTlmMFRXOHhxN1RNemFXcVNLVEV1?=
 =?utf-8?B?c0dlcXlaNGtkK3ZaM3FvQm5ocktqWUFyU3YwODBIQUgvbkJUODd2STgwUjA3?=
 =?utf-8?B?bHhucFZ5TDF3OE9aWTRYOEZMS3ozRVBqN3hRV0E4VnpKOGFpbDY2ZktYMTFR?=
 =?utf-8?B?SVVmaUNVQVdoK1JjWWd5R01acVRvMXpRVk9KZ3R5MGhPNEh5RGNaOVd0d1lU?=
 =?utf-8?B?anRHUXZKNzlvc1RWZ3FGMjBZWHVXTk5aUEVtejY4d1JiN3hJMG9pNGN5a1lo?=
 =?utf-8?B?UmVXb2dtdGxsdzJ0VFlDTVFCSmEwN1pwLytMTEhjSEJTYkpLNk1GN3Q0L1Jx?=
 =?utf-8?B?a3JlK2x5WkJ6V1hOT1JmMTNscE1CeVpHNmY3c3ZEcHVWS0ZKMG81NGtQNlpy?=
 =?utf-8?B?NjZJL09aaFRpcEg1eENmUS9sT21VS2o4M3RWOTg0WGdFbEFWQ0o5NWEwLzYr?=
 =?utf-8?B?YURjeWI2SXdRT1Jyb3UyZEhPcm94OFhZRUJVaWsxZGpraG5ZV3BNMytCWEVj?=
 =?utf-8?B?WllRMUFSMjRiaVZIVGw2Q2xyN21VdXRUbVJMSUhIaVhtYnZsSFdmcEFpOHRz?=
 =?utf-8?B?bzRycDJUSmliWnpsa3FBNVRmcC9ONDMycGhwaHovbzZadmZ2N2ppdE9CR3lz?=
 =?utf-8?B?R3FqblhqUElVTHFodzBYbHFzeFJId0FrN09hZVVXVDhxRFJod01MS1k2N1R4?=
 =?utf-8?B?TS82ZW04ZjJUZVMzdU54V2Y2K2hVRDBkcFBaQ3ZQQ3E2WkM5b25reEZnNitl?=
 =?utf-8?B?MUNQbUtJZERXSHlIYTU2cGYyZzFGOEF1Vi9lY2RsNUN4QmNKUWJPMXg2VDBa?=
 =?utf-8?B?ZHAvaEdFOTZHQ2g2OFhaWTFHVk5rSmhNdDFhYnVWQXFLNWJ3VFJJcHlBZGlk?=
 =?utf-8?B?bTVFQ28zTHNhclAzWUFRVEt6YUtZOGNnZEdBSlZWZ1pDbDFML2pSemFRNXph?=
 =?utf-8?B?cVJHZXhHcEd3NjRLLzZHL2pUL3MvcklEMUZKSmUwcENGSytmVUoyUlB3R0Uv?=
 =?utf-8?B?YjAzSzc5MzRqQjEvWTMzdmJ2dkJzQWNOWm95bis1U1IvVURvUUxVakJIc2Rr?=
 =?utf-8?B?cUZnVU9iT21oSHo0WTFHeWhMNXZWbUxjeENTTGRqdFZnc3JrUUYvR3V3SU5w?=
 =?utf-8?B?VkxRYkkzdytHVFVsbzh0SFYxZlBkdElJbmF6R0FxU2YxSk9MSG9lUVNBNlVs?=
 =?utf-8?B?aFdWdCt2V1cxaFNEdEJmODNCZWhCb1dwc3ExVkZza1JNLzc1QWJ1dWpveTMw?=
 =?utf-8?B?TEVKbTdLM2p5RnY5TVVqMTZGWTB2TGJ5cTlIRW54cUl4M2pMcmVIdHVWd2xl?=
 =?utf-8?B?ODJBVVlyUmJkWDBBRVdkVlplTXFBKzRxQjhUbzlRQzFRZjNKcUFzR013V3JG?=
 =?utf-8?B?amd6cjR6VXdoQURoWk1FNWsvVG1WUEZnaFNmS0ovT0lUVGN2WlpuRFBPemZs?=
 =?utf-8?B?RGg5MXhkTVE3V0FOTlMwa0FJbUFpckNBSGNxNEZtaysrcUZ1K1BtTmN5S1hh?=
 =?utf-8?B?c0g0ZEFONFpFdk1lZ2xIS2l1VTh4SHA3T0hEWGhJZXBpSTI2N0U3eHl0S0Y5?=
 =?utf-8?B?NlcvL0hWS0luUjExbW16Vk9uR2lPbDNuWVdibXRzZ3p0K21SamFWMWNaeHBR?=
 =?utf-8?B?TW9KSnFyaEJIc3hkc2tKbXJYNFlQK1NPdS9kWnMwWjdkcnY0NmFNRVRlL3A1?=
 =?utf-8?B?WWh4ZHdZM0Nzd0FDZ3ZXc2lZOTJMcXdsTi9RamlqTS9KMUVxMkZnNTlhVWg2?=
 =?utf-8?B?Z0tSeFVsbmRreFVmZ3dqc1RCTkMxVHVlQ3JjdEt5aXRiVzZyQ0N2OGoxcm9z?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4659b14e-e288-49d4-45ff-08daaab6a240
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 11:57:41.1736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBsjyDtFQw+LwYyBDXj0HTTMZ72Aw5Hzflu+VTulNZ9E0EUV/8z118uOdILBGvG7b38kI7EWh5TUVWWT8+FJDhhyejdW8aCkMOsGr/Qohms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6244
X-OriginatorOrg: intel.com
Cc: pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

On 2022-10-10 2:07 PM, Cezary Rojewski wrote:

...

> Amadeusz Sławiński (4):
>    ASoC: codecs: rt298: Add quirk for KBL-R RVP platform
>    ASoC: Intel: avs: Add quirk for KBL-R RVP platform
>    ASoC: Intel: avs: Support da7219 on both KBL and APL
>    ASoC: Intel: avs: Add missing include to HDA board

Forgotten to add my signed-off tag for Amadeo's patches. Sorry for that, 
resending.

Regards,
Czarek
