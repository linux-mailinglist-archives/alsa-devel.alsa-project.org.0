Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9884B282A
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 15:44:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6427E18D7;
	Fri, 11 Feb 2022 15:43:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6427E18D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644590651;
	bh=44emwOgXRD4GOtH3AgEIm6/kmX5lcxu3wDuDoVpDkcg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pP3k/6pb68dERVvFe0StEbhHHHLIdNgrjvwBZGk6P9DADa66oycW7qfUunXQ9VesB
	 ks9YcBH0hmchzrzHeB1ETL2RSsrRZ/DsAF0PQR1PHm6tFr++WpLoBYXJGt3eeUaVxe
	 vwZoK/nSBoedGSMMVZIdNw/+EZGqawaIqBRcb09c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B82BDF8013D;
	Fri, 11 Feb 2022 15:43:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18B4AF80139; Fri, 11 Feb 2022 15:42:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB23DF800B0
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 15:42:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB23DF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="msKchfYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644590575; x=1676126575;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=44emwOgXRD4GOtH3AgEIm6/kmX5lcxu3wDuDoVpDkcg=;
 b=msKchfYpcnlGeIyX1/EOPmMdFD1ndVvZL8/j15FSh4Cf1dEFme8mdyMt
 lCjwo6jL8s/R/HVCE0H9anj4Hn10V/nWhnV/zF7cDYYRSZdZu6/96HhfX
 5RGrecfVMoPTmPm6ni1JjYQD6ge9Is1ocKKcYUQFTu3YRz4goI+8bhRXK
 h+fdnHE+noW2WDhsNdm0HRAWWSX22wsfVSyVvrGkPY9hGIFjRVwDemUZK
 WrRyCtl82B8rAafJH13MzoIvzyAmCuwYZC0QW1vc0t0bBm1A17pygSevP
 LfAtiORNSeJBbNi2f0zUEyRtC7Zi0E9S6NIWj83PCPK/tzEBLOLxDD5eZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="247334476"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="247334476"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 06:42:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="483422905"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 11 Feb 2022 06:42:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 11 Feb 2022 06:42:49 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 11 Feb 2022 06:42:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 11 Feb 2022 06:42:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 11 Feb 2022 06:42:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WytCWJGBuMw9fBuc9miFmALq+lxfvCQKQW5EVeofVYkLwUWiUA84rRFCc9jO+AvDLC66dGd6RD36h1aHUg82TnvEBG+/BX0SBjUYiu4McDwPcsmvA9h1La9bM7a15Bg+6M4nM5K74+ESv2ZKHrC+o/Fx6gd6wjZI6TROWZXdd/z5fPcCPLQ+NBHc1K9mQPeuP2tHqMPr1fkhaUT/x3U7elb8jnpNoLpkGT2DIWE+KEdgSPyUFW0WEsy4f5RDgf3ZAFWEtxOVH5ETmgSDi5hWNv1V1XASxeJAbjOex10ZqMn4yGiA3YQlb6BUt6invCTUtW7ZiiBJh2IwoddXl5pvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bna/FY8vbfsGMnJjWdcZ1pKyejKlyf+XEkIOGJrUB14=;
 b=nO9ea3j0TLuHXZ0GqHolVV+O2kNUfndBRZkyhczBJH0g2S6o1TW+JJnd1T0S2F9VjBrtAty5dQT/Q/i6KzHWcn/P3ZWIgu2Cwjyp5JR/eA1jFVNSn2B7DvyAPaikAdfL2j8Ln+s/6BwAxg36YqENralq1PzBtT4duXvY3I8kuuIOUZAeyleIlSNKH9H1mB+SAu3ueZHOxOVvke5P+RBoVyN1smfePjj1DiHrMSnoCTkdw3MoNd2as+i5TjSj9nGxMdZskc8rtKWrLQ7s/wRotMXCyU0cOyY+WmoScHsfWgcJWZ94/VE4aMSf4fFyjx5BCQPMsqtb07uBAPgSJDbXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SJ0PR11MB4784.namprd11.prod.outlook.com
 (2603:10b6:a03:2da::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 14:42:48 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4951.021; Fri, 11 Feb 2022
 14:42:48 +0000
Message-ID: <1dab33cb-c20e-1134-cdf2-e03209018318@intel.com>
Date: Fri, 11 Feb 2022 15:42:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
 <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
 <41671a26-bd27-78ab-3440-eb9cb22c1ad1@linux.intel.com>
 <23f36ba1-277c-6998-f569-2861887720dd@intel.com>
 <4d90d851-753e-3e6d-b51a-eefb2159a48c@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <4d90d851-753e-3e6d-b51a-eefb2159a48c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::13) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d2e6848-a239-4d93-62f8-08d9ed6cc5a0
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4784:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB478405109422F6188F96DB16E3309@SJ0PR11MB4784.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8vQQASToRwa2y5gTx2p5A+Hfal4IGGaUwwxXU6ns8cjqHRjgrxDXDpIHzdO2eohkvkkq0UMZaBDxwIdKuFFDCJWhpSXGr4uOgimS/mmsPaxT/8vVOO4A0Gi6fJ51s1gKh7tx43f+4XwXH6J+FNcLjo+QnwTGi7hMlS4jNYzVYua+gfShGJj1JfhK2R5ZX1TOnyEHcpxc99iDclKRAyJg3agcbFHo+ZEsGWyrsHaGkJ8atpsYcg5Rc4iZsAxp+hj2aqi/cYsCXBAzUPg5ndCuqm8+UfbNd4G/AXAxHCOz1+HStn7OessxaTRG1C81acptEbQaZ8cv+QsB4SrHiq/wD5CsNBZ9VzBuLhoMmu4kgo+dNu9l+IEdCnLrgPJ5uBmu4T+VKzWL9I9dnxD/09qfOX98cU09c3wmZM1/K6uuvVLvkL1wKkMAm5SNpEqXH14IfvGhe3nzQfU4VYPeSXDFQFlOwbLxjwpQj7UIR2qn7UAnLO3ZiLxuILx+xV+3XQ9CMA7Z4uN2B6yxlopFCANTTFixbwHvEpXZJMPtQht8niQwV720k7yiIH2+NkZO+nX+k5xgX+VWT0OHbVVmGCwiLAQ4ZIEQ4qorhjLj6RagRUBsrOKKoz/LsTMfosiOqYEwy+amuINkT7t15p+bnFDpCrWS4+Uu6M/akne4f11gldKNOS53bJYXsLDs47mugGYgHnjztzdApap2lM9YSOT4xcsxgjJ1zu62aXCmGQDo8Ug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(7416002)(508600001)(110136005)(2906002)(82960400001)(38100700002)(44832011)(31696002)(5660300002)(66476007)(83380400001)(66946007)(8936002)(6486002)(2616005)(6666004)(6512007)(26005)(186003)(8676002)(66556008)(4326008)(6506007)(31686004)(36756003)(86362001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUVuVUlXaWxUaE5Jd0hhdmxsWWFJWUNJRzJvdFdobUNrWnNONEZiWURtdWFS?=
 =?utf-8?B?dlVBMVcxOVpNVHo2UG9qbDN5VTFUcFVvNTRubkl3cjJaQU9Ea2VobGpaSm91?=
 =?utf-8?B?eGw1VGl3RUVQNE1nQXRramx6TEhtMHlUN1JxZ1IvMXV4cEVXZ0xuc21xS2pL?=
 =?utf-8?B?QzFMYVgzdU1wYVhNcDRia295U1hma2lyODBHR25Va29qNGhhK0I0eE4ySFNH?=
 =?utf-8?B?cFBZOEZ6R2pweWxZTlM5UVVpbFhPck1sVjJsNmVnYWdxRjIrd3VjMFM1TGZV?=
 =?utf-8?B?dGJKRUdZbnl2Z05HNDZxQ1NYVHpCem1IMSs3bW82T1E2Y0FZc0NoejJHTmt5?=
 =?utf-8?B?VmhuQU91MDI2TFN2ZW1HdlFLSmV1QTM1V2Y3bWpQSXhGdWorOGRPTkZaQmF3?=
 =?utf-8?B?eG5kTlZLc1pjTDRNU2pIbGo1YWc2MkMzUmt3MkkvalBpYStCaUJabmw3WFlH?=
 =?utf-8?B?ZVdSS3NwWGJSTlZmSFI0VExKMi9yWlJRYXRyWnR6eThtbnlmNXhiY255cXpw?=
 =?utf-8?B?MWhYREhtUE9ZM3lrcnJTbDVBSzhpZXZZV3VGVjl2b2E3UXJWdGVOUFNOVVdt?=
 =?utf-8?B?eGhteXRBMzh2ZlJjeGxLQ1VRbVdSQk1hKzMzQ3VGN2dMNXpTRW02aXhETEJo?=
 =?utf-8?B?Sks4dHp2OEdSU2xEM1ZuMXRlYXZuZVZLTWQ2V09IZlV1VkNvZ0VYWnhJUkxP?=
 =?utf-8?B?bXM4aDJRVFczc2dCdkE1dnBHeTY4RnVVaFFpeWQxWHdkMmlVbld5S0VFeVZ0?=
 =?utf-8?B?MW9tb3VOaFdtUnRDN3kwQ0IrZDFTcWw4S3BRUjI2cmdjZ0kvVndOYkxSam9R?=
 =?utf-8?B?RkszTk1hUUNvQjA0WEZJcFFmYmozdjM1ZUVUdExteEpPV3g5dTF3aHBPWVBh?=
 =?utf-8?B?QXYwZHlrY3pQVitwOVM1YWdPNVlzaXNJN3RwNlJYS29OK2cvOTFVa2RvdXNk?=
 =?utf-8?B?NHVHaEtCMmZQbTNPZWprV0tzWGlHdkZ5ZGk0enQwRVVabnpVMzhyYXRRNEth?=
 =?utf-8?B?OTJnaDd4TWp3ZEFBWjlPQXVCUFBaVXY4dk1qb0d1SGJ3T1AvbDFyZERqZmVt?=
 =?utf-8?B?Vkp5S0Exd3IvNktXUVZkWG9EazZZQVc0bi9nWWlTWlNYN0dVSmNVMVhKNmFr?=
 =?utf-8?B?V0Y5QVRyb2hOeDc4UEt1d2dmeFFFY1I4WjFpNXFrbHlBN0JubmgvSCsrdkhT?=
 =?utf-8?B?K1JxNzdOSnJlbnZROTJ5eGRycGRVVWZka3FOSUJUMVNPSmtLNnNjNVdHUHNz?=
 =?utf-8?B?Rnh6VWJ2dG5YNHNZejh3Nm9Xb2JTOXgrckhsTlpnVTMwNHM1eWw5Ri9uWUMz?=
 =?utf-8?B?WUxXaW45c3JibDRqTVdiQ3pPSDlwTnljMFdmNys3UmJ5ek1JUVN2cjJTZUh6?=
 =?utf-8?B?RmIzTDRvV0ZSWHNSbHdwZ25Lb2hTY0UwL0QxTUlMWE1BSG9FVUNQY1ZVMGZl?=
 =?utf-8?B?TWE0Q2FWR21jZkVDTmVSaTE1bnAzcmJ1eEJSMEthWWwwZTBEL0Y4ZmhUYUhl?=
 =?utf-8?B?Mi9JSDQwczhyMC9rT1MvcHdyalZRTXo1N1V6YU9NazR4MDdjSEF1VkZrZjZM?=
 =?utf-8?B?ZEkrbWYwV1d3WkJmQktjekJoNjJNdm1TL3V4UHlhVS9lZUdVQlV4MmRrQXRU?=
 =?utf-8?B?aDk1dExmOUtER2VTeHdRM3VpU21YaDBDd1hQV0o0TWVlMmNjOVlJNE0wdnNs?=
 =?utf-8?B?cnlraE5EbkFWZytBcXl5d09jMGZJanEvNUdWMzZkN2xWVG5MS3pxbFpMZHIv?=
 =?utf-8?B?N3o5ZldCMGdsRUlsdjFPUFhQdmpRdVRQa0RRVXNGWG5RSGJIQWhPRk5VcEVp?=
 =?utf-8?B?UWNRVFJFWlJlL1Z2R2dtSjlLeEMrUlgyWjJUYlhCOFNGU1BaTnZSaGdKRDJS?=
 =?utf-8?B?b25nTmQxTHc4UFZzV0F5alp0WWFTd25uN2ttRkViL3VZSTB6NVVlTDduanFy?=
 =?utf-8?B?aTl1LzBCcnJLRmxQUHNQTVZzQ2lxZnEwVWNIMTcvWmtqd25XemVHRE5Gd3Nw?=
 =?utf-8?B?MEp5bEY2TUZ4Y2NRYWdOenZNY09sR2thZWlUZExrRjBJYVhFbkxSYzgzdU1V?=
 =?utf-8?B?Q1pKMEVIczQxaTZVbzVtS1k1NlQ4eDFMWWF5M20rWDFkVUh4cVkyMmlmdjc5?=
 =?utf-8?B?MzhKNjY4ZUZhQkhyRkZPNGRJYmZFd05SVEMzYjlhL1lVYTdlNStzd0N2UEZN?=
 =?utf-8?B?K0JzZFlFbnlaZENIQWh4T1BaTkhJV0J5cGZLQjNZNUpNUUswNldOenpWdVpE?=
 =?utf-8?B?SmNTbGpxdGlOTXRyYlN2ckpSdVNRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2e6848-a239-4d93-62f8-08d9ed6cc5a0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 14:42:48.1415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvFqG/GT3LByjOOqGUGlGihCEA3w32j5QKa4N93LB3h6bQyPOqUtTzXmAuTvR/ofYZPUgFQmCXVhdC7wLOsLroSE7DSBAhluqm58iqUU+g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4784
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
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

On 2022-02-09 5:08 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 2/9/22 06:05, Cezary Rojewski wrote:
>> I believe our goals align. Rather than hardcoding Analog/Alt
>> Analog/Digital endpoints as it's done currently, when codec most of the
>> time do not have them working anyway, rely on behavior found in
>> sound/hda and sound/pci/hda. If there are some problems there it's
>> win:win for us and legacy driver. Fix one spot, have both drivers happy.
> 
> I don't quite see the alignment: the only thing that we've seen work
> reliably and that we do need is the analog part, and we want to get rid
> of the other paths which we can't test in the first place. I must admit
> I don't recall why we bothered to expose those alt analog and digital
> paths back in 2018, they have not been used nor tested by anyone.
> 
> Now if this patch helped to make sure we do indeed have an analog path,
> that'd be fine. That would indeed avoid a hard-coded decision and report
> configuration errors.
> 
> I just don't see what exposing additional paths brings, they never
> worked reliably for us when we tried. IIRC half of our team gets an
> error with the Digital playback stream on Up Extreme and the other half
> can play just fine - albeit with no connector to actually see what the
> output is.
 >
> FWIW there are many things made possible by HDaudio, in practice we
> often have to limit ourselves to what is known to work and what is
> needed by end-products. You could spend all your time chasing
> configuration issues, missing NIDS and bad verbs. Been there, done that.


Again, we are not trying to force-expose stuff which does not work. In 
majority of the cases, non-HDMI codecs we're dealing with notify about 
just single analog endpoint. For now, it's 100% of the cases, but I'm 
aware of fact that RVPs and a dozen of Dell/Lenovo/Acer laptops do not 
equal to entire market.

Remember that you can always use topology to "gate" userspace from 
streaming through endpoints which we do not work. And right now, we are 
working with topologies supporting single endpoint for non-HDMI devices.

So, this is a clear upgrade when compared to Analog/Alt 
Analog/Digitalh-hardcoded configuration used currently. That's on top of 
aligning with hda legacy behavior.


Regards,
Czarek
