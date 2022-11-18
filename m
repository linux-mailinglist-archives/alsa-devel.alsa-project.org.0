Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D13CA62F315
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 11:57:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8AAF16A3;
	Fri, 18 Nov 2022 11:57:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8AAF16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668769074;
	bh=x/nMP0nP407sSslQ79utUvyl+v4WLzgt3akECta9M5M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ckI3znzCC3eRkfCGBxSpu976sjA2PKdwOMaQ5CUSPrIFz4lPz/LOK0Xdj4J2v1npC
	 q23qZaDZgF8wQVfE/G1muAIEtT74s6ZrletmUOP9EZTBR27E46Vt4ISFvZcwmiU/fK
	 P/vpa38iCCEZSoyVsW7Gd3WwmBBnz5U1xCQOiGos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 810FEF8020D;
	Fri, 18 Nov 2022 11:56:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80DC2F801D8; Fri, 18 Nov 2022 11:56:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77A76F800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 11:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A76F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hAQy/lJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668769015; x=1700305015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x/nMP0nP407sSslQ79utUvyl+v4WLzgt3akECta9M5M=;
 b=hAQy/lJuHKVWZCkqP1Jx7QP5TI3Sz7bjgwRdf6FsCYhzvSCT208oPHEN
 MS7uFjkmSMpQIuSL6t2MxT2u6jqBy5ZNW+OMkvvGMpGsDkpjLLtW3pN8A
 c9Cb9IoGv1ZcdsXLLOZqMSAts8WGW1Jlino1FG8+c37cC/7LLVRpycAA2
 doOteOsZcM2470KdKWb2ugXv0P+e3de7NkQlXXPRGQRhW2hCl7BagZRR7
 DqHfofnPoElYl3QjYUSUCUtvW+uFLrhizKul3blvYfJJqLPClK6bZG3WO
 izZjRhOj+MEKaKxhOj5m2nVvZlLzenQSau1ws5vHyjdzIvn3Cm/sDg4X5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311814702"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="311814702"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 02:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="640172343"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="640172343"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 18 Nov 2022 02:56:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 02:56:49 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 02:56:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 02:56:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 02:56:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMz7Qi8ZoUm3R2vVplHvWkWHgzBOymQ9Bc550lopYznAHb8MOWuvpI09vC+EkLf0oYWcF07UhsEczKkrqYyLk5FmZFEk58A95xWaYxujXUE1Gq7F42+hajRTH4mBh0U6Y5oRcGUuCrM3hq+q4TQZaK0vVvO5PCpAMWCIfmrcMzA4zwwu8ygMrSOP3QbURvcAcyAVxD0UQSaAuwNV2ffMg8cKD0jLoeJuRHsJPiPfS5j7Zj+Gh+vqdeq3TxzG/FlaYoBBZcq+N2/fneYknvAKpZEaAEAfOJnaY9Jlzf50GdN7fBUP7hLj8il4HPHN/G4+mLz6MfIw0FWakJm8G6l2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06kTUSwrWRsSHOvt4Oob7jY3RZ811CmeqeG9JQbbSrc=;
 b=lXQaeEldmtQNoo+ko2xxoqj+NmTfgBQZjE9w63abivaGg5SAR9dgBmNSeLXY3fndlOfZyfYOuc6HxmJ8w3Hko69UceutivEYu32MXkp23vrfQg/sPvZuS2pSGIc7W4+n9H33lzkTSMdnK5Ole/AeH+6EDhLzUCe8b3nHoLgwig5yVcoFSMxW77PHXYRWpjj81vI+GGjFVeJsWXbdaqzivzfJm1zYBu7J6bFAiLr6x/3IBqcN23onoQZi/bxKGnVaKlW3IeclBKsi6G2EeCK3H52ZABBq8Ifoh97a2pmLWkl7KikrpFBJ9S3dNFF8SQrupjB2qHEJL44jhpDDBT20eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 10:56:46 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7%4]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 10:56:46 +0000
Message-ID: <60b4801c-7339-f785-aeb2-3a4871511c3e@intel.com>
Date: Fri, 18 Nov 2022 11:56:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RESEND PATCH] ASoC: core: Exit all links before removing their
 components
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20221027085840.1562698-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221027085840.1562698-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ0PR11MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 46944d3a-2ef4-4532-304e-08dac95395f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RF33EDisveSe8T2BeFNf8gdi5CScGJ0GAVVXMYoEfucj3zCHXw+QX3yZ+ZwFvZw7uI8esZeKc+qKXH0VxlMlK6HzpN7waKlzvauPnKmlqBW3lq4M9iAuyHMocs4MX8OimovCq3qxZPX6m+XjnbjJBPIXH00NybihnUCIWEkLUclI/SNHRlmlMVmSWz/3/YRF7LatDVV3EkBtIjy/zAESjuylPGjjNJdhUx0qmwelN2UlcfnXEeDDuIttn841znWUav2onBrCsvOmob3lOpl+hZz+wXu830hjNgdRaui4YfTNrGBTOQHz3N793BoDDZTmDb4RYFAJP9dx437B68lkMZ3Z+aeEpM8pzXWE2R2MnUQBBNrqa5g3IXztn3kKZ3+XnND9M9pTgdW+XhcUqRL3GVENy0crfSLV97knTFpf6bKk0BdAfPWTXC1WCqknqMiqNjDweGHNd7ajmevlAlWvBsS09jN8TAjecSxzbtJHq8+LrDSpnWGqItls6aXKPAl549/4kXBeezSm/b7FP1BouOdavHlrLmDLWPZZ09SGo9CsWbrIdAEQ3yAcF9AcBNQXwzWT/t+vYTIq04RfmEHPuKuMYbx46A+JXyKvL3Bq0jIQM3gkDunxL/nt08DKaYZlZYDD8uPocob83blKikQ6xzRBDwzt5Z9FpHGgCb+aYWimvkpoTvwM4CvsELHdq8KQEEb2p5jFeJGYNAjvAkX7x+74SDvvPH58SdQzmd6EdMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199015)(31686004)(4001150100001)(2906002)(41300700001)(5660300002)(66476007)(8936002)(66946007)(4326008)(44832011)(31696002)(66556008)(8676002)(86362001)(316002)(6666004)(186003)(26005)(36756003)(82960400001)(2616005)(6512007)(38100700002)(478600001)(6486002)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b212eVdoOUdkQW1oODBVelU1RnNFdDhYK3dnS3pkazNnN2pQbjR1cFFwYis2?=
 =?utf-8?B?R2g5bGZqVmMwUmRXZ3VJL08wQ2pFUkw5VWRnL0kxdU1TOGd6K2lOclVuUTV2?=
 =?utf-8?B?WGw4aXhaaXVtSUZWREdvWXlQTmRCN1F2RzZ3dHNObk5TWDlRZmVRV2gxV2tM?=
 =?utf-8?B?Y3NPK0pLdUdvYUthSXlmRVRPbjZPMFJLRTJEOEhZRmM0eUFlRWZmT0l4VjhB?=
 =?utf-8?B?Ty81VkFLaTFYdkFWalZPWGRnZDZCVS81Z2RLa0FpY0xLVTh3Y25yT0xTQlBi?=
 =?utf-8?B?T3IwZ2QrNE4vTDd6RWYwMlFjSkU5enBON3hzck80TmQ0OURDcnVPbXYrZWY5?=
 =?utf-8?B?NlJWSTVWZS9LOThsU2RrUXN4QUhZaXJFYVZWZHI1YWl4YjlSUnBUdTRHekxa?=
 =?utf-8?B?dS9nT0xCVTNQb3ZyVjJ5SjNEWWR5RmJld1FrZkpnWmFhUmJPTkRWajB1aEFs?=
 =?utf-8?B?b0NwYTlVS1hObjVOTkkyR295czJvZ1pSdWN3Z3VjNDVmUy9OVVliWDdSQlR0?=
 =?utf-8?B?bUdLQXM4S1dQMGNCWElONkFOK2NYNllqcitMNzYrMnVlU05ISDFvbmVpVXlk?=
 =?utf-8?B?RWJzVkRQeWxuMlU0anBaRnRnVjUvYlZqalM0OW1Za2oxdklKand1aHp3ZWRz?=
 =?utf-8?B?dmJVaEwzRTlld2pVVzhwZUJkY2hkN2c2RUFRUllBcVpiT2JOUjBVeWFiZDBT?=
 =?utf-8?B?K3N3dVp2VU03bFVIREo5NExMSFRYb1hGVytnNEVHb3NQZHQ0N1pXTEdnTHZB?=
 =?utf-8?B?TW02azk2b05YWFRYc1hCU2NWS3hqbjBrem8xVXd5Rys4WWtUWk02SXY3Nzdj?=
 =?utf-8?B?ck85K2pEUVN1YlFENEZSbHo0ZXZZT2hLSUppcFQveWNOZW9CSU9SUHNtQjQ2?=
 =?utf-8?B?b3RFNVlKSTBMK1o3aVJ0eUIrMG9hcnlmb1Zia21OK2FOMWdUdVcwQ3JJb0Z0?=
 =?utf-8?B?QlpNZHJYNGd0Yy9qSitXZ0REUUZtTm5GUlk4TUJhWlNmbjc0ak5raG8rNFVJ?=
 =?utf-8?B?VlNTZ0NIUDVVRlJUcVIvS0t5YVEwVGxSajZ2SjNnMzZJb2tMalRXY2pFbWRE?=
 =?utf-8?B?dE1XcFgvc0l2akdrbzZDRTdZVm1OQ2ZoQlJEczkzWGpaYjBkTU16ZHJGSnBl?=
 =?utf-8?B?SVFLMmE0OFNYM2VKQ1hHMUZRdUpGUmsvcTk5Q1ZPdU4yR2JNcWYzcnEzN1dT?=
 =?utf-8?B?bUN3bXE5RkRMbElDa1d3TnordEVhSVNGekQ3ajVRM0UxV3duOE9tdlV0V1dZ?=
 =?utf-8?B?TW1UMXZYcUgzSjNRNnVWODdhYnl1Z2ZkSkZhV1ZZRU1SY3FtSXR1OTIrQ2dD?=
 =?utf-8?B?aWdKUW03aTNGYnZ1UEpJZDBRekZYWElwOWVQMEFHZmVjT2VHWUM2NGZDbng1?=
 =?utf-8?B?QUduaU1XQkM5UEt1dWQvcEZCVkJldmpVQ3ZPVHF6ZVFCM1JLVUV0R1RGQUhZ?=
 =?utf-8?B?RGtPM0ZpbENRZXFwcWdPQzBWYXIybmVSTHZVcTVjejdVejkzZ1RSTVlxQTFy?=
 =?utf-8?B?b3ltYzN3NHhVRGlTdXJVbXlrUWUvUU5tU2VzdmxUNlE0Y2J6Ym56aTkzMEFx?=
 =?utf-8?B?MmdWbngyR0lSbXFQUWJBUDJhMzdTNTFJNWVkTkxNS0hYc2xlY0RhR29SRHEx?=
 =?utf-8?B?VmphR3pEM2c2L2pUZUp1T004bVc0Mk5lRDFzZmxCTTRpTlJVUmFyNmdNT0xx?=
 =?utf-8?B?NWkrRUp2b3k1aTExQnNqcFdIS3A4QkIwdC9BblYwQmRDajNEOXhVd1YvVzNr?=
 =?utf-8?B?WTlRT3Z5N0pxcnNic2FsQ0o4QndIT1Y5UmQ5SVFDMEVwZ2JuTEJwc0F1QVZ0?=
 =?utf-8?B?bjlnRmszRGRoYzFkVkRXalk1bHNVYTArbks2Uk4vSXh2SVdxS1V0Y3FwSXpS?=
 =?utf-8?B?L2pSaU1xamtaWGthMFpoaktsWW1uR3V5UDlMVjg4bHU2bGZBdjZNTTkvcUor?=
 =?utf-8?B?MU5oVnNmUEhxVVVaV0V6TWdCdERtbmZubS9qVXVUZXo0RnpsRWttanlsTUdB?=
 =?utf-8?B?b0xiQmNkdHpGV2tLSEtteWdXS2dSWCtkWkk2OCtScDhqSkg5R2dTb2k2VUlT?=
 =?utf-8?B?OWxIdS9RWW9IRHQ2V0ptcGgvRGhCcTNlbTh5YnBJSUhvS2tWL3c2Yk52WFVr?=
 =?utf-8?B?a3JoRTkySHU3UkErUkZ5a3hRZVo3RzArWGp0WFBpK2IxWGNjZ1J5RGE2Mmdp?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46944d3a-2ef4-4532-304e-08dac95395f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:56:46.4163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1TTTyqQuCBgFC8WgaHpuCaRRW/AaWHuYLc/M0ucBKGOkjsMnoT2RoCbTEhnM8IyjQCDs6GiTbNEaOhfKBiVx1OIydPbeh1UkOs/Q2nBPOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
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

On 2022-10-27 10:58 AM, Cezary Rojewski wrote:
> Flows leading to link->init() and link->exit() are not symmetric.
> Currently the relevant part of card probe sequence goes as:
> 
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_components(rtd, i, component)
> 			component->probe()
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_dais(rtd, i, dai)
> 			dai->probe()
> 	for_each_card_rtds(card, rtd)
> 		rtd->init()
> 
> On the other side, equivalent remove sequence goes as:
> 
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_dais(rtd, i, dai)
> 			dai->remove()
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_components(rtd, i, component)
> 			component->remove()
> 	for_each_card_rtds(card, rtd)
> 		rtd->exit()
> 
> what can lead to errors as link->exit() may still operate on resources
> owned by its components despite the probability of them being freed
> during the component->remove().
> 
> This change modifies the remove sequence to:
> 
> 	for_each_card_rtds(card, rtd)
> 		rtd->exit()
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_dais(rtd, i, dai)
> 			dai->remove()
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_components(rtd, i, component)
> 			component->remove()
> 
> so code found in link->exit() is safe to touch any component stuff as
> component->remove() has not been called yet.


As this is connected (and is a dependency) for some jack-handler 
refactoring in Intel boards, perhaps it will be better if I send this 
patch as part of a series? Lacks some context.


Regards,
Czarek
