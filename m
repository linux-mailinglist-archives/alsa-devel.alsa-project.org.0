Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 320ED4CDAD0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 18:34:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC9B1F35;
	Fri,  4 Mar 2022 18:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC9B1F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646415276;
	bh=opfyWO4tKqzOh+LP1lhddXlY4Kvl53349yprROvjQ6U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tghPQY7jAt8C0YWIGHcrzuQXE3AI55zlk6Q8fjc8ztha7xAKx73Bbrqe+ZWDf6vJh
	 DAeWsxdlL1tyOBMcBiiZE364/ynZwVGP9aTLWKL+hbSMNupBj73kAPOIs+KiOc2QN0
	 E19zoznPkRGeY4X0WfcAAeNwYghH2o8WlKeeh3X8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45956F801F5;
	Fri,  4 Mar 2022 18:33:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D15DF801EC; Fri,  4 Mar 2022 18:33:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 853E1F800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 18:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 853E1F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RFDKU7uA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646415201; x=1677951201;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=opfyWO4tKqzOh+LP1lhddXlY4Kvl53349yprROvjQ6U=;
 b=RFDKU7uAAyecYJ3S2epxJUWDQvgY5jlnni2/T2zUOO7WWXvdxrGAktko
 HkfVj8veIMYND+SmVA+ruvgIjArMppNFW7NQO8FyHQSYH3+05Q1vzADeL
 vY8+Noqw7/1Zb+CPrdBhjaMqxj3+//URwXeeh9OFm7/n9vUWar093AkI2
 1L2l0SSRvYsr34/YXd7AnenHDoC4i0pOGFAN3MDmLg5tZDA+krq1DNG3w
 QEqEW8EatG/XZclRUg0GiJGy54P5Gq4KgkLnTHfFg0B4k/DSHyUMNKGxb
 rlS41LMUyBt2eefKXsaS2viWL9mRCZrwJ685eIZkEQ3l0yUIS5CD5CQgJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="317253545"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="317253545"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="710400638"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 04 Mar 2022 09:33:12 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 09:33:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 09:33:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 09:33:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rkhx5KEjcqRO5sDS11yeRHlstzMwAiCNv8jLRG8Dv5r+EdOYvyup3gr5BDXhbUXcNX8msC+C9W5wHSu4gjuRO2j//Qm2kVmxrknHeLI8wgMMwPjWHQxHah3JPT/1Y2yL0NATRb6apJk5iwHsUIVAAp/GfSd4+3P61AB2a8m83P2n09RXLTZZLWWN6iMM4vaw5UOIEZWR9rKmWI1OcEIWiVtRBIYMULLIZm9+HRdWHVfOvMH4lu2rhoaQSMNOGad/QEg7JR0FNq0An1N7Cgmu3Hww0nOJVIhHK7knVDVmGQckCnqCva0c23fRhzYNaPujeDi724aN272hjJ4NI1Bkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3fL7Cm64WNnTVvnR+DozoSeyNlG20JbYOjoYCRTWIM=;
 b=AYmM6UBcZUKZBf2ONY92+OzjjeZ2uUklLDfb2762riwCA3/FsjyJKz8pf0UBMTTCBjo0gVT4sIKem377oVr6Unx/mw8SPfWuhys4ks94HPjXK2FipQG68dxuys22TfSGdTCVH455Ox6GPjK+HfV0vAD+I0Rr5P/mIZJVPtXumcSlviOujNeVfeZGLH1qR8A5vlSjL80la2E8VK/IwlxA9P80kIoe9eHBGs2TUqjUzF4rcfIZL8xLjMieA3B+jzbsc34sqmv65JFUSyKHrV9ZFUllio2gyQa+wgAGh2mDfqJZoSNrnQgNkfWMDqa0BWd68ZEXuI49G/0x8dX6TfuHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN0PR11MB5759.namprd11.prod.outlook.com
 (2603:10b6:408:168::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 17:33:09 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 17:33:09 +0000
Message-ID: <b421c430-4759-3d9d-ddb9-dd4e2e338bf5@intel.com>
Date: Fri, 4 Mar 2022 18:33:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 09/17] ASoC: Intel: avs: Add ROM requests
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-10-cezary.rojewski@intel.com>
 <9e9f98514cc1c2106659126ff77ed385ebe2157f.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <9e9f98514cc1c2106659126ff77ed385ebe2157f.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR07CA0020.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::30) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d85bd0f7-a195-4b04-7916-08d9fe050c8a
X-MS-TrafficTypeDiagnostic: BN0PR11MB5759:EE_
X-Microsoft-Antispam-PRVS: <BN0PR11MB575915FC6783776482201760E3059@BN0PR11MB5759.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tHkFQ1jeDGBFDDWJgIpVtovL7ciZspz1lcQbRdjaawSV/DZW7swoNvKjj/Wz60dBDz3sroTP2/1BFGxw3/In6G/ZudBK/+FW3/xab1QKcC7l1MSaeOaFcTlNnAsCSHzKn/k6B5dSwOsSWmyVi3PpYP4iH6ltLfsOxS2p5CBOgOV0tcWjxa9GuKz9uvryASRqUeftDk/syF6FZQwRR01YYcjo4OBjEgEwonjVDDHnpmvEedQ6/tckpPfcYfD7cnlqkkeBGY6EvJuQzBShCwyRic/6sy6I8xR+J5IIOzWWQVCm9Zc4Ic9mezl8BSFvwyM9ISuAyyh1SK8OC92kcyM3JGMmiLrVlJ93LYDKt1m/84CJWJu1EE5CgjBqSsKPEO5gGICa10ibsq6OjpyujZ18+VUiJ0nsOa3p4eh9CMmow9cCUrwNgRTExH5IP8cDobfJNlgWg/GfGEB7DPOAfRCijApAAxEyVhVo7Ktb0EYQQYil1nsWtvhXeg9Ih3JlrpIp/NeC2Eks6h1LEARKwDQ+Mdor9arG2UPuB5+6PMA31mx5ovoDwOG+k5goAxuPFEX/1ZfyFxjko+9VLAuouUH2oJw6W3bMXaty+yB1k9B4mgP+pK756EYkTwwJLuS/GN/mU/O/eEO159BLHvKsEZadYF8zFLLod6rpr1He/2kzUPlkZBjJ9ju5LTkWEf1fMscNyYVaSHz/jEUVkBRJ/pM7hYu6bCM/Mk71Etm4iP9qnmHwJydvVQ9e8UwR9UmnZkju
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(66574015)(66476007)(66556008)(66946007)(31696002)(508600001)(26005)(186003)(2616005)(31686004)(36756003)(316002)(2906002)(6512007)(83380400001)(44832011)(5660300002)(8676002)(86362001)(82960400001)(6666004)(4326008)(53546011)(7416002)(8936002)(38100700002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEJzRFpFVVZicEU5WXJoWmMvdTBGVFVCN05sdTRHaTYxdFRoRys0Uk9KdFJT?=
 =?utf-8?B?MTNJK0E5OVQrM25wRlVaQUY5NFhRSytHUGNYMjJkTEo0YlhXREp4bFhZZGpU?=
 =?utf-8?B?cHR6WFdDNU1Ga1JXN3ZiRUhpbGpLYTFsYXJ0MmRQckwvOTRmLzJEbjJnU3hY?=
 =?utf-8?B?cEo0TTdnR2h6SEtGRjFrTm9aaWJobjN6bDFhYjFFcGt2L2wrbFJxSThWN1NN?=
 =?utf-8?B?QzlSN3lkOEVKUEVSWmZQUG0rQTF1UXRFcnRINmE3KzBGSDNCbWtEYjQ5MzJv?=
 =?utf-8?B?ZzY4cFNRcEVUcXpPbkcyaFAzbElTWDFNWHptK3pyU25DS3BDbktBZmZKM3ky?=
 =?utf-8?B?RWpSNUhpVGRUYTg0Z2kxZE5oQUNrQkt3M01abWh5RTFFMGNZanBuWU44eThZ?=
 =?utf-8?B?bDlaTmtLd0tzQ2xldGRvc2h5b3JYdzhmc2NhUmRFRGljMENVWWI5cGRMWDFJ?=
 =?utf-8?B?bk5BcWdOM1pqU084WFRYYktvWHRySk84Z1FFQlFQS0xYNlpRdy9IUVFiVlk2?=
 =?utf-8?B?STVKS2RNU0l6R1BmT2ZmM1RRc3BoQnRsZnR3d0d1bC95YjlxK1hzZHF2dGlD?=
 =?utf-8?B?VmRsZEgwcmhyK0ZJdE5CSnRDZjJCSkg3cTZXM1o5R0VxWGxkQlpwZ2pnV2VR?=
 =?utf-8?B?YnE1b1pOdWFsbVY0SkVtdDR0Unl6eE1iclQyTXg1SlhuK0laZDVpRmZoUnZv?=
 =?utf-8?B?cWNhZHdGYzVPcHFzUjNkeURnSGd5aFExNzNqNkRXTUZVMGQybDl1MTZVZ0kz?=
 =?utf-8?B?Z2VaVWdwNnk2QkVJaXdPVnNha0tsWDgxaDA4YU0vL0plclJaVTBYZVZTZVFH?=
 =?utf-8?B?WWtlaGRZOHh4NmdxTnZhRktURzdDbmVaakJRQUE0YzVUM294dWQwM0l0NUFN?=
 =?utf-8?B?SVBpUUJQT0pTUDl3THBDbTBCaTJkUnlXVUJaTUdXMnZIbWR1VDRURVJEQWhC?=
 =?utf-8?B?eHZrQW4vUjhaUDZQTDc2OVl5RmFvQVZBZ0YxTXZRTUJmVGJiVUM2c3phQzc3?=
 =?utf-8?B?QnlpMHRSR3ZrbDM2TjhNS1ZhaDNoNHd2dHVDSXRSMzUyRnhCUWRSNHJmcjVp?=
 =?utf-8?B?KzhWQkxQR1pDOHdMc2hZNkRnQ3htbGJ0dU5makdsZjhldEo4T1NpR2NaeXBO?=
 =?utf-8?B?R0E3U0pST1E2ZWx1TXFHSDBVcC9YQWc5SFpBeHhOeUNsUHBrS2JjUjU3ZHZD?=
 =?utf-8?B?dy9SdzcwajVaa01nQmFPR0JVcytaV2U3d0hZV3BrUmpOUTJmL2h0WkVrdmM1?=
 =?utf-8?B?UDJrWUJNVDhTUFJaS2tuc3NmaFQvU1A2SHlkWEhQOGFLVTduTDZRK3hqRUY0?=
 =?utf-8?B?Y2F2eVpoZFVRQkpSWm5jU1dtc3p4cEF4bnR3N1lKclVWamNnZS9YYWMxRytk?=
 =?utf-8?B?T3BFcHg0MU5TQ2pJMis5cXQwY0ZIT3dBZGlkdko2VHgxYXZlcTVpYlN2RlA1?=
 =?utf-8?B?MDZDN1NiVHF0aGlRei95cUVZNm5VSERHbi9YdzR2TGFZVEJCUTlUM0RtNUpG?=
 =?utf-8?B?VW4rN2hETG1PYVFORUdJQW12UXZTc0txUnY1d2J2R3hJV1NiLzlPand1WUdL?=
 =?utf-8?B?TzYvZ0F4ME93Mks3TGRMZEFDWWRpcFloTUtheVdIOVJNRnk0RTQ3V1JGTUZ6?=
 =?utf-8?B?cTlCZWRsWnp2SnBKUzlPdWI3V3k0Z2FENFhMWEFkRFllNC96dk1ZU3pEOHNq?=
 =?utf-8?B?TDlqVkdhem5jWWNqWUZLV2EyZ1pIVEY0SDlNbHh1MXVENnJPZ3NJaEtvQmxG?=
 =?utf-8?B?RFJPb2pmaGxYMlpUSnowNTRuZHBxR3VidFpOVXYzSUVodzdnaHVPVldiWTJI?=
 =?utf-8?B?eTBmWTJ6YnAwMjFGVGkzNlhYMWV2NVVISVlYNEUzKzV2VmhaWUtXamJicVV2?=
 =?utf-8?B?UkdncGtMSlF2RlFBY0twUm43SHJ5ODUvSjUwaVpMcytFdHNNYVl1eGFyWkQ0?=
 =?utf-8?B?NlVzUU94MDFESWk5SWg3cll0TEJscVNaSUMwaFhKeFZ0bGZ4UVBLSFlNdUVt?=
 =?utf-8?B?WGVOSE03RDFlaWROV05WaktlTkExcHo5LzZXRDdwOVI0Q3pEWTUzcjkvSjhX?=
 =?utf-8?B?NDBrM0M2L0dFL2VaU1ZlSUtjR3hkY24zbHlBcVk1eEp4ekJMdEg5aUYrZGJs?=
 =?utf-8?B?RWpjN1VXZTlvMFhyOGdwRmZIR1U0Q1JuTzlTTFdUQkIrRnM1S2lkNXhHWmFp?=
 =?utf-8?B?Q0hoM0tsMVhJVUtoU2FWMzJTaG1HVmNCMkZHMXk4bVdUK1ZTYzBUd05LRG84?=
 =?utf-8?Q?h3KgwlqugiOJFi2FuF40E5bqftJ1vV4nuZl5LYv3+g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d85bd0f7-a195-4b04-7916-08d9fe050c8a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:33:09.1299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rapH8ES0L1mbjobpc3+iKxWyRt3F7+UA3IKwzFTV8rMxI/XzGg4Xc/8EKJ7PwbGD5FoeisEc4Qhfy9Br1Fa8MuhrsQ06VhoscW90zS7xviw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5759
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

On 2022-03-04 5:26 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
>> ROM requests are messages initiated by Host to alter firmware early
>> boot
>> process. They specify whether the next boot should be a fresh start
>> or if
>> IMR can be used to speed things up.
>>
>> Signed-off-by: Amadeusz Sławiński <
>> amadeuszx.slawinski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/avs/messages.c | 18 ++++++++++++++++++
>>   sound/soc/intel/avs/messages.h | 14 ++++++++++++++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/sound/soc/intel/avs/messages.c
>> b/sound/soc/intel/avs/messages.c
>> index e8f441b28d71..f7d00e541323 100644
>> --- a/sound/soc/intel/avs/messages.c
>> +++ b/sound/soc/intel/avs/messages.c
>> @@ -12,6 +12,24 @@
>>   
>>   #define AVS_CL_TIMEOUT_MS	5000
>>   
>> +int avs_ipc_set_boot_config(struct avs_dev *adev, u32 dma_id, u32
>> purge)
> Does purge set to true indicate a fresh boot and a false indicate IMR
> restore? A description would help.


Indeed, purge indicates a fresh boot.

I believe flow is explained well by the layout of the calling functions, 
local variable naming and step-ordering which are found later in the series.


Regards,
Czarek
