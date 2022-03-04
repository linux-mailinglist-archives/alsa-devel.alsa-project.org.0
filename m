Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FB4CDB19
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 18:39:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 405451F35;
	Fri,  4 Mar 2022 18:38:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 405451F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646415564;
	bh=dLf6e9zpzTp1JcNelgSYLMKnWJj/vnKen2oZklMMjoM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k64vvHqmYmrtB8jdANhdiE2GtcdqfcdYoe0v5qn0UWXbt1YmFzt13YtnK57XnP1xA
	 nZS2b///Anp2LDmFqS5Q/CcrFDgcnYU++53va/7yH+weHLB5aL+Amz2pP+fu77OGyt
	 OW5XKNvoK+CPdgvyUQSyUHuJ6aEiKhASxSHlv0KI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B4C2F801F5;
	Fri,  4 Mar 2022 18:38:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28C2FF801EC; Fri,  4 Mar 2022 18:38:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19DB0F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 18:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19DB0F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n490zrhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646415492; x=1677951492;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dLf6e9zpzTp1JcNelgSYLMKnWJj/vnKen2oZklMMjoM=;
 b=n490zrhMfhyIbZe3AnnFycyrpAQnIdVtrlOQs0r9gaJzmFkF2X5lXT4C
 4+s11ZqpQssZVBHxsV28Kav8wxI8b+K4AscunhyUti2TJ9dZ1Pp4R2kdk
 N5jj0yJ8xBDF4hO9DICaBH2gTm+6r9M5d1734TRHdd/ZR3RNdYCQ1QNId
 YbocOG6DPay6lRXoHGNOw5atqoQim6aH1wZ23KE2ayR2RAPXb8pOLUUmV
 xbnaaWJuL7Fb7XtESEGVGRXzVBggC5RyKwhn3ISWvBVqR3C4w6YC6xqSr
 GZrKH8804O2zhT8Q3KUOIJtgSODNx+ZC6S6vW2ZN5A/UQ6xXSq8pgp24g A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="253753507"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="253753507"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:38:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="631219908"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Mar 2022 09:38:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 09:38:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 09:38:07 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 09:38:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeP4bdm/jzUF6JGMts4iHVujd4/Xosrox/F29eEXobQd2Del3l4GeEBpVt6vt5eRUVMylVXzWnaoGdCprAWM7eB/1OIBx6XZv1HzEWJ86x9ioRKYyRgA6ZO1b7+RochOcmdw0YO5JJSqoB49+lAlGT2R68ZhTnXKTG632l2/qe0z9XBNhqHc5NuXbiK+MRwUXJkCNeNPjvq6uvEA2enaRY02powoh8iy1EP3NPC09vY6JmWc4nUxfAWALV9VUrlKh0dhPPFD9FeDVKeJwl/f+MfhryvPm2pcHUzChm7SR+GisHrE/VYWeH3eJjD5pIE7jaNNpbMaPRg0jNjzBAYJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8D1XHxXS+nc+LUx+C7qRadIn0Xvh/qAIhRcH/fCkcE=;
 b=nfKyrKJgqxZ3kEz+dYbxV2zMTZ7zldcbb3fEi2BcgZeZqMCmJ112lt/HsJvVALTZt5NlN8XRwZutmq84WBL/rh1WRHSfgp5MxCXo+Q5zK0AmJDKGIR81jkw8p/uM/bw+ZeQ0ETcbc+Tk6F2xBzvAWlmKf7F2LL6gVVxKGxlbIW4quMPJfMPtNBNcgbkjFP//QXBXNszp7xVZAPrH/1pWpMC/PaT9TKA6bA4KFaY8/gVjZNxurqbEsPgtZRrDfCzrBzr1Y8FIXqfcudZ6enAMr/jFDsmg5t6OYpWuHJkMpHq0ptJBd1NmblpLM0Tus0glUnu0OCgozABFubLgMxDs/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MW5PR11MB5908.namprd11.prod.outlook.com
 (2603:10b6:303:194::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 17:38:02 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 17:38:02 +0000
Message-ID: <b6cfd47b-1ff7-a012-f663-b7bb649be2a5@intel.com>
Date: Fri, 4 Mar 2022 18:37:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 10/17] ASoC: Intel: avs: Add basefw runtime-parameter
 requests
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-11-cezary.rojewski@intel.com>
 <2bc36351e4c14bd4b3d55f26eec2cda1b77e7728.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2bc36351e4c14bd4b3d55f26eec2cda1b77e7728.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB9PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::30) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5a6f76c-18c7-4fea-e634-08d9fe05bb47
X-MS-TrafficTypeDiagnostic: MW5PR11MB5908:EE_
X-Microsoft-Antispam-PRVS: <MW5PR11MB590852FA6D7E9CC88601288AE3059@MW5PR11MB5908.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3ZbqYkMkpqhXLwvCHd6qLh+ufMKH/TxrhXW3KWFGYA6WFq6DfbSchyieyKMuemrAqoe/woMOBSXR4F03GjVbYA5dSwRFWFnTui5IqWLTAwiLE4bzUZ3Ks+yN0InYmiWFc5RjF0/k2WSmhVZrEdVrR/bYN1Jg7kbeRDYaOljZw8bsp/vY2LBlp7YXHQsXA8iqvvwp6dFoh3Z35+xBKTVvNaQKeEbD2nyLZc/tZjsiIdracmU7VV3nt1QpA0jBHMqbuf624C7wKhuuA9vngoxu/QPaLNVia2Vtu7EqaO9giCcmsHXWpzHN5lsySBcQaRGqzp5SxXLbBr0dznsE0sGgw069PBapfOAN07EjH6W4zZWVkdc8Fq1B1tA0P9SS+XUbwXz7Atqk1tAh6bxaQcRi1mowshBhhVVG9jzplGJ7SYBTkWblm3wdEKgFvoM8lL8aEES8zeYWeUTVCj+D4goJ3EdyG1P4c1khWTRt/g0BnutbvYp5qc3Pg8qPEngD+NnyfQ0I1Wf4zhcwSW3p7aJZwAGrZque8+Ilul1t0q7lhj5bzd79iWww8HYq85sMfSzTLpOrPaiIibpDgD5MIRmHrFiGvXfMQ6xZIDRjkhYmqtPnof4+s5RvJK5UZDWZ0hVx1o3k/KPwH3yVcE8xCm5OhpzFMZDMDDCwUVSuZ18QG7NLM43ECdVHLdL8IMkkiIwK2HFCoxbNRTHi/cIX23uC0YeJp9J/7bcZ7+OFRab7gw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(2616005)(36756003)(44832011)(8936002)(6512007)(26005)(31686004)(186003)(6666004)(6506007)(66556008)(2906002)(66946007)(7416002)(38100700002)(5660300002)(8676002)(82960400001)(66476007)(4326008)(53546011)(86362001)(508600001)(31696002)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajBaR0J6M09vY0FGbWh6S3ZrL2U0Vzl5S2pEVDk0RFNEY0d2Z2FNTklEV1Zk?=
 =?utf-8?B?cDRqb0xDY1gyN3AzbTJtMXRTdkFyZjVGNUtrMFlNRWtPaEZtZWYrUlFYV0Fp?=
 =?utf-8?B?SXd1QXJpSy80T0dwM0p1WGZGWm1pQmxablVGMjNsS2MvSm5ISHduWnBqQzN4?=
 =?utf-8?B?b09EcnVpbXc0KzgxRDNuaTVsMWtGa3FLY0J1dXB5NHhBZ0xYWHlHREVpYkRE?=
 =?utf-8?B?V1F2dFB0cHRjV01PcWoxUTZ3TjZSd0wzNWcwMFRtbHhjTmJLMVVjaUNuQTgw?=
 =?utf-8?B?N3kwTGlwRW8rbExROXFMQk9FdkJqM3QwMGFDL1FhSG5RWFIzdHpUaTdleU9a?=
 =?utf-8?B?L2I0bTlvTStPMDJpQ2JJL3ZSYjgwdnppZVV2VGNLWHl3RTc2M0l2L2Z0UXlZ?=
 =?utf-8?B?aG5qUVpxb2dxcmQ1WWlDMTRzRUNOUVJMbE12b1VKWmZiQ3FhRm5EWWZJbnpo?=
 =?utf-8?B?Yk5wVGwvOGdiQy96cDhveVd5TVp3Ty9EZFg5TmZMSGoxN1NoWFlKVEhnN2tn?=
 =?utf-8?B?OXU3QWMwNTI2SXFURmVocTJ5ZEFvZXl5S0NkVUY5RXRpY1hma0pqVGJWMFBo?=
 =?utf-8?B?bUxsY0VlTHJUOVgwK0J4Zy9mK3VuendKd0g0clpMNXRvNCtESXorazc0Mms3?=
 =?utf-8?B?SElwM0l5bWtqT0RDVkpVNmw3aHF1UFFoRnFSMmpqN0k0aVprSHZrekFOemRT?=
 =?utf-8?B?MEJrTXpESXlaejFuc2QrZHFoM2IvZGZaL2d4N0xSRVBpckdidURjQnVRTnBm?=
 =?utf-8?B?bWlDT2dlWUpxVWVMV0t2L3c5ZjZhcTBuRGJxUVVOb1QrbENvR3pvOGM4OTJT?=
 =?utf-8?B?VE5vS055TjhYNnFKWEVqSmc3NlpiSnlKRnJ1OVJpdk9jT3AzdU5MbWNQTXZF?=
 =?utf-8?B?cmVybnZMUUYwK1FnMDhBMzMxaVg3bTlUVjg1ZzRWRkFDUFFPVjN2Y0w5V0pp?=
 =?utf-8?B?U0QzQ05xVXg0eVNqRlcwOTdlOHZPZ29sZ3p2Nk5EeGtOV1N3S3dFV3ZzbFho?=
 =?utf-8?B?VCtndE9jbDB2eExkd2YwVWRTbEVDQW0yV1FIVzg4aE1lenR1TnE3Mmx3ZGUv?=
 =?utf-8?B?dlN0aW16dXhkZmpwN2w5cGIyWllJb3F3N2F2TnFBKzRXeFYyN0pVWlo4SnZo?=
 =?utf-8?B?OUZ4T3dETEszZGFwdSt4dkFicDZ0NE5mMzE0Y1EzWHZYdDBZRlU0d0svdEdG?=
 =?utf-8?B?ZENqWlVIemNnSmFSRzJrUnNCQXVPdUNsajEwTFRraVNvKzVvUnBTQ1BWSm9R?=
 =?utf-8?B?aFE4MDFwYkJLSHdNVDR4bzlSU05PUGJEaVRndmh5cUFCVGJuVlBlK2lwT1hW?=
 =?utf-8?B?d1g4V0pRN1NlT1JsaXd3WEJqdkJObVZoaEtrOHpnWGFQR05TUGdOa3ZjbzZq?=
 =?utf-8?B?bkhDdmtKaStNZ2xNV21JWFoyMWNybzZlV1pNeVRUdmY4MEEzZ2Zoc1BHUnFW?=
 =?utf-8?B?VEd6cVc4QVpCWGs4dm1XL3F5NkFrUVoybEZHN0RLT1dYWllkL043VTU4OHR3?=
 =?utf-8?B?STlvZW9hcVQ5ZDdLbHl3L2c4WEFCWVZrTHhPSkloU05RTUw2WVFHOWQ5VitZ?=
 =?utf-8?B?RmFnTkl3K2xoNVlKRElPZE03bFZqVGFKRSt2N0xPUjV5c2FudzV3WkFoNGFC?=
 =?utf-8?B?YnRCY2J4MS9zZEtmUkYyMUNQWDk5Z2IyMHg2T1JBVE9EVDAyOE55TURmS3Uy?=
 =?utf-8?B?bFpzZWVXOEhWcU1kN3BzdjAyMzdTUGVqR3NuS0MyQ2FiUnVGSU52Z1diT3di?=
 =?utf-8?B?WTZrTVlhcjVqNUlvZFU1N0lRWWtOMm5JdmZjWTBGeStFQ210ZXJreVp3YXZM?=
 =?utf-8?B?bkIrbWEvbTNHeHByQjgrMkhuVUYwTVBQWjBMdTRFUnA3RFFaR1FxNHlzSmpB?=
 =?utf-8?B?TTJOUUNCdmdoYmw4TnVqeU15SkJQbXVsRnRUR1RMN1RxTWRpMXVxbXd5Ykd0?=
 =?utf-8?B?TUh1V2pkS1dzblA4dklWb0cvaUNWZUVOK0J6dE9PYkI0V2ZHRWtPTEg1U041?=
 =?utf-8?B?T3ZwUTZnZ0s0NEJOYUQ5KzFGdmd1Zzl3OWZLbGtLeVlNeXFUK21NNmZPbkJI?=
 =?utf-8?B?c3VGMnRmdGNkY3U0dGluZU0xRGVwazZjSWhBbUtaVXpCODVwZmM0SGl0WnM4?=
 =?utf-8?B?MHp2b3A5VEZtLzAwVVM2Q0hadngwTndyUmxDQTBDUFRCWmI2R2RBckU3MUF3?=
 =?utf-8?B?YTRVMGZoRXh2OFJ6ZTVjSkRYSnFsZEliUms1T3pDTk9rOGgzcmFmbndlaUo5?=
 =?utf-8?Q?wtA3DA48COijpdLosJ1LN/9S2tmGOAhSWl5ZI+hQGY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a6f76c-18c7-4fea-e634-08d9fe05bb47
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:38:02.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9ef9mOIdWfH2i2dJOvdV8OPQXth3Y5lgPmMBGKIdork9jN25HbyRbjL/AcmoKv0Mx1ge83bTjCPFGNl6SrzQ7OuOItiDL4qppGBqWuBNiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5908
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

On 2022-03-04 5:31 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:

...

>> +int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg
>> *cfg)
>> +{
>> +	struct avs_tlv *tlv;
>> +	size_t payload_size;
>> +	size_t offset = 0;
>> +	u8 *payload;
>> +	int ret;
>> +
>> +	ret = avs_ipc_get_large_config(adev, AVS_BASEFW_MOD_ID,
>> AVS_BASEFW_INST_ID,
>> +				       AVS_BASEFW_FIRMWARE_CONFIG,
>> NULL, 0,
>> +				       &payload, &payload_size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	while (offset < payload_size) {
>> +		tlv = (struct avs_tlv *)(payload + offset);
>> +
>> +		switch (tlv->type) {
>> +		case AVS_FW_CFG_FW_VERSION:
>> +			memcpy(&cfg->fw_version, tlv->value,
>> +				sizeof(cfg->fw_version));
>> +			break;
>> +
>> +		case AVS_FW_CFG_MEMORY_RECLAIMED:
>> +			cfg->memory_reclaimed = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_SLOW_CLOCK_FREQ_HZ:
>> +			cfg->slow_clock_freq_hz = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_FAST_CLOCK_FREQ_HZ:
>> +			cfg->fast_clock_freq_hz = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_ALH_SUPPORT_LEVEL:
>> +			cfg->alh_support = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_IPC_DL_MAILBOX_BYTES:
>> +			cfg->ipc_dl_mailbox_bytes = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_IPC_UL_MAILBOX_BYTES:
>> +			cfg->ipc_ul_mailbox_bytes = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_TRACE_LOG_BYTES:
>> +			cfg->trace_log_bytes = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_MAX_PPL_COUNT:
>> +			cfg->max_ppl_count = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_MAX_ASTATE_COUNT:
>> +			cfg->max_astate_count = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_MAX_MODULE_PIN_COUNT:
>> +			cfg->max_module_pin_count = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_MODULES_COUNT:
>> +			cfg->modules_count = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_MAX_MOD_INST_COUNT:
>> +			cfg->max_mod_inst_count = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_MAX_LL_TASKS_PER_PRI_COUNT:
>> +			cfg->max_ll_tasks_per_pri_count = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_LL_PRI_COUNT:
>> +			cfg->ll_pri_count = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_MAX_DP_TASKS_COUNT:
>> +			cfg->max_dp_tasks_count = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_MAX_LIBS_COUNT:
>> +			cfg->max_libs_count = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_XTAL_FREQ_HZ:
>> +			cfg->xtal_freq_hz = *tlv->value;
>> +			break;
>> +
>> +		case AVS_FW_CFG_POWER_GATING_POLICY:
>> +			cfg->power_gating_policy = *tlv->value;
>> +			break;
>> +
>> +		/* Known but not useful to us. */
>> +		case AVS_FW_CFG_DMA_BUFFER_CONFIG:
>> +		case AVS_FW_CFG_SCHEDULER_CONFIG:
>> +		case AVS_FW_CFG_CLOCKS_CONFIG:
>> +			break;
>> +
>> +		default:
>> +			dev_info(adev->dev, "Unrecognized fw param:
>> %d\n",
>> +				 tlv->type);
>> +			break;
>> +		}
>> +
>> +		offset += sizeof(*tlv) + tlv->length;
>> +	}
>> +
>> +	kfree(payload);
> I think it would be easier to understand this kfree if payload was also
> allocated in this function in stead of inside the get_large_config().


That's a good thinking. There was an internal conversation regarding 
this back in time when we have been implementing getters for the first 
time. There are no clear victors, there are drawbacks - as you do not 
know the size upfront, caller has to guess and then reallocate the 
buffer accordingly to retrieved payload size from the firmware. So, even 
if you allocate buffer here, chances are, it's not the same buffer when 
the avs_ipc_get_large_config() returns to the caller.

We have decided to reduce the code size by letting the single, common 
handler do the allocation and leave the other responsibilities to the 
caller.


Regards,
Czarek
