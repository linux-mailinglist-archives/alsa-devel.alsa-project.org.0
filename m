Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0183E4C4F08
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:39:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35FA1F5D;
	Fri, 25 Feb 2022 20:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35FA1F5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645817993;
	bh=93TxEyY+J5Q5JA8ArQnbq5Z68FAxJdA+4zcsFTHan1U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IgY/H/KMVjumisqMR1rhH8pHJcore9tFag319dcsWopIhDc8tUEeh3tYSO2/8vdwU
	 6xEgTTT1f+ROVsaT7yqfq2Yrv0V7rnelWnz0NmSrnSB6LUMuXmH5VWbKuOQliE3wbs
	 XDrvzgJ34FMC6xQDWW+lT9AoMmJ9+SibizTTx3sQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE1EF8012F;
	Fri, 25 Feb 2022 20:39:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD291F80159; Fri, 25 Feb 2022 20:39:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD2BBF80132
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD2BBF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cqvkHzMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645817939; x=1677353939;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=93TxEyY+J5Q5JA8ArQnbq5Z68FAxJdA+4zcsFTHan1U=;
 b=cqvkHzMZxSni1jrlTfWJfFr8BVJSXAcLAKt2ThpTz+R4kNzhZPgsCVoK
 GJ/k8a6oIj+haYvE6qyAOuAkRtVvnbxTjGCtNJpeYBZ8yKATvIDapgx6Y
 xOjE+uU2Wxjp05XDvfVhf7iR4mAgodlFwiur5qCy9Xi9z9wBugDnZcdBa
 ClNaWAqvUN06ZQKXc0cSHFd/ILtzK9vj5pEF5SMTbHJhMvZkl42f3n2Hb
 NcOGHWx2aBqOpDHLX5sAWYGdMkcCHf0diZBnCuW5auR7NCB0YwYs/yBwY
 iXIgLSaiBb+AwMkg4NyNTsy34HfZPbpKDPxVZVk4Ob8AdcfJexbaq9Ceo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233191110"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="233191110"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 11:38:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="492070701"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga003.jf.intel.com with ESMTP; 25 Feb 2022 11:38:53 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:38:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:38:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 11:38:52 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 11:38:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqX6gNWJlI+w59w3RaxZZyv7asAdv2C3+QwLOiG3J7qIq0USDvFY4NT41Zl6NY56eR5Nibc2ZkOrYMUxC0GJAowg8hWAoZZBbK4E8XDAqPy2gS3gu1MJ8D+i8MtmeC/w/kte38p1hcBzXULz7i3ih1n3h9Cn1B6JfFL/ntLY8aqc4/CVjcdCeXUatjZq7klbwGgS7BYOUIG1qRsmkWGbZagWAApRstrV0NiLZVPYFx6TxzkwXxbkiLfnYndfSeUDyNZ5q6SmU4FKnx1BXVzhWhwW+tXfYJIoydDcNVSrzqELkBoOQQdxADGwmIiI9DmUplFNx0ED3DzrfPh938UJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=at7i+wDtCV4SQZawdSi722QftsZJWxGSMKmiNeSp7J8=;
 b=lZFMgfOP9lrojrB2tZKxxDLs+R/zZ1d66Xdy3zFs9SvO0rzopMFzR7HENIqaFFik9CU2xiS36sDjSn6TXAJjNlDE6rD28MFWILojZPrwJQr+GsZQypBW9I1yrqQ023b4FT1fjwCmLCIm98oKspEpuN2ni3aNEdXwvYRrkGtLFB2RE49hHVBqTEtSr/ktXkRtiQNZ5+2CZ8MY6qqE4nMpEbE5FE/1kIRd1Vl0DeujRhlBlMoVmxKM1AKUO0B1oblgxT0p9uH8kVVkPCHevl/OfWgx53S3Giwvun9kMq4T9Ix6PAOu5g/0pyGHSYrFNEOEQEM3qEtpuWC3XhHANhX7Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN6PR11MB1747.namprd11.prod.outlook.com
 (2603:10b6:404:102::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 19:38:50 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 19:38:50 +0000
Message-ID: <e94b301f-526c-ce52-0e9f-b5ed6bdd1959@intel.com>
Date: Fri, 25 Feb 2022 20:38:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 16/17] ASoC: Intel: avs: Code loading over CLDMA
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-17-cezary.rojewski@intel.com>
 <14f6c074-e898-6479-879f-6e3bc5152f07@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <14f6c074-e898-6479-879f-6e3bc5152f07@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0061.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::38) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb84e9c7-d439-4675-bff5-08d9f8967284
X-MS-TrafficTypeDiagnostic: BN6PR11MB1747:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1747762C02B1A0D59CB983E7E33E9@BN6PR11MB1747.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlZrB1hEpDWo0lp17ApDIGFOnmk972ZKcNlXOnjMZt9h10NLP+G8I5z26pdMyf9rLN+ENGxUwN120RUrnMC88JJzI34eUeo6Xf3JzKfD20DhMzRi845f3PvLTIGMWMLCkWTTCVs21i0IIgn/OvoRlnS3r8F/9KnfWXWgWVEYjHMlJh8wMPRMdhhaXMva1CJfwzIVWdv9DzFbcoIIhfmrHO1QR4N1hYI7MEe03PrZTJFxFD+czYdnifCW3J676htkwG6G4EjYfU0DEuJ7COHOL+aVty0dN2S8hIy3ygIaBdbD1HQwcCqLFR9SRS7MqV51ZMFtKQaxN/sYC6HYtIKoS3EO5oedVMxF0l57CV1Om7tK3A0ibcKLfVhso8rUlJIfsH1dRVOYnUd026p3FypmY4oAsA7ZnS86ZZBVF9jr2tY4jY1wFPpWxNGHwLi85f6YBvPzDo+Plm0i2whp+7f8rx+piH6CqX79hiF840Sv8slyceIgANt/UP7DrRMwOntt/qVhq4P6IiVOGkVcmFhxgKUrvsmwMBXvjnn/TSNZOZ0ERpJNDA2H0zr7N1qYD6yY1JUcQ7jE6QdEfanZ97Ulo+0rcVTt+8dNx0KWdW1OPQXGR+1jGPnenoWgYMus0cV3mAqCqIzU5X5Q+d0/EKZdLLVCmaJ6tIyQQaEl8gUw8d2SgYzvHv1/qvuWyasOHmZDRGAI//638jif9klvm5gsoMdYw43J7WfigbgJBSIR92w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(316002)(6512007)(66556008)(36756003)(8676002)(66476007)(31696002)(86362001)(6486002)(53546011)(6666004)(66946007)(6506007)(508600001)(8936002)(83380400001)(2906002)(186003)(44832011)(2616005)(26005)(4326008)(7416002)(82960400001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm1JQk9Vc29oTUd1RjZ4WXZmM3ovZGh0cDZVSmp4ZWNPckgrMVFjYThOTGZY?=
 =?utf-8?B?dy9BeGJZRFlrWGZLeDA3Z3daNnptQUJ3YU5WeHhRSm1XSEkxZk1WSUF4bitv?=
 =?utf-8?B?MSttZjM5TU1vaHhyelRCZUNSU1phK3dZTkRXTzJLeXJUbDc1cWFzTFR3b0xH?=
 =?utf-8?B?Z3Z3Vm4yRVlsUjNlei9FTkQ1VS94b1M0WHN1N0d3NWhzL2VmYkZmWDNsRHZq?=
 =?utf-8?B?ejU2dEpUbUNWR2QrWUZXczVzVGlxMGNXWUdmY1ViMFc4bDZZRGpncGxJa0pU?=
 =?utf-8?B?WGJCeWY4YXcwRlJlK282cmNpSFBUZzVKUjQ3Q21vV0ppOExWUHowOWxnV2kr?=
 =?utf-8?B?M1NYQ0pXRlpLSk1PRGxTN0VjSFdYdTZnTEIyK2c1aVlkWDJJKzZiQVNXYnpN?=
 =?utf-8?B?aFpxSC9QS1ZKZ3ZFY01qQ0c0TFpOdjVJVEZYWE9Gb1AycFcvU0RVK1gxL0Vq?=
 =?utf-8?B?eGlkb3hIdzhxbE5JM0ZiYjhBUCtzNFBVRTZtekFNRFQ4QUwxZVp5VGl6TTlr?=
 =?utf-8?B?SkNwc1dmcWZqRVJhdWwyYUptRnIyYWNNOHhqanlWRVkzYnlMZnhURnZ3bVZ2?=
 =?utf-8?B?QzZMKzhWS0ZrYnZRM2pYZnJsWGpSdUVuamFJZmhkYU94NTQ2VjZhcXZld29h?=
 =?utf-8?B?YUtSY1JMeUJIOVZRcVVzQ0syVnVRL2lQdXloa0taL2FiM1hWUmhkUXd6bnIz?=
 =?utf-8?B?SkZSSkp3Qk0zdXF5WEEza2ZodHBFU3p5cXNONWZYZ3pRUHF4ZWZrL1I1blY3?=
 =?utf-8?B?bDJVbDV5c3M5KzBFNVhlM0F3WGhqMTZLQXBreEhTNDVaS0hBbFdDN1FYdmJR?=
 =?utf-8?B?MitLdWJGT2JJRkFHTW1PeVB6aDFXK2g3TE5PVGRBb09LVndTaDhlZEh3OXFl?=
 =?utf-8?B?OHVtejNtNGFEMVAxczEvK2ErM3pzQmVPclVxV0R2c3ZaVS9nSE5xbE83Zzgr?=
 =?utf-8?B?NzFHY1I0dS9mRzNLMnFua0prSGg0YnR0SkZkelhQU05DU2VjZ1FuTzZvcGVp?=
 =?utf-8?B?SE4rV2Iyd0J3TDY4WGRHTXhLVkx1M05EbE4rWHU1VTNTRytzU1ppMTF0dHJ6?=
 =?utf-8?B?ckkvNzYzWDFYWGhVV29ZQ2gwVlMrVEJtRGxMQlUrTTgrZThQQzlHbm96dW5D?=
 =?utf-8?B?Y1BlejI1NFZ6ZmY1L24ycjdLN3gwb05Qc29kOEZpZHl5QUV6YUpjK0l6VDVM?=
 =?utf-8?B?WTAxaTg1Wml3VWw0bW5PcGlVUWkvTGRQU09DV2o2dUVrTXZxZEQzVFNjMk82?=
 =?utf-8?B?RDBHUmxsZEZVb281YXNmckNEQXBQR0E3b1VaN1pMWXhpamt0STZNLzYreElQ?=
 =?utf-8?B?NnRJUmsyc3lRLzlWWUNDUnkycndJYnlIQm1YZzRMVUUwYzNuY3ZWQUNFQTBY?=
 =?utf-8?B?bGRYenB0QndRU1dVZ3RQTEZxd0RyakVJYWdlQWgvTEhiQ1dRb3lXVThZY0x0?=
 =?utf-8?B?WkxnMm5ZeUQ1a2gyVVRQLzhvSHdCTFl2Y0tEblI3L0Vud3NJc29xNUhOTThS?=
 =?utf-8?B?TSt0cXgxS1hFSks4YWtBeElMajExNFpqclRTQURKZHhHdXhCVHhZcFpYYWpP?=
 =?utf-8?B?c1k2cGQ0SG8wcXowbTJVVjdpekVsYVRJblhtWGw3dzhFdmtYeUd0T0UzN1BM?=
 =?utf-8?B?QTJoUkxrWmZiemM1ZlBHVTRocWhpbzM1bGdwYk1HSzFnZ2ZGQ2Vna2dkRjZR?=
 =?utf-8?B?VzFMVlM4TlZDaWdFcUVSWHR5bU1mNG94cEpha0VIWTZzY1R1MzJKTWcxSkgx?=
 =?utf-8?B?SFR1SG94NGkwTWNJaFZBbjBkcHcwNE4rckRlVHp0cDNla3ZOQ2lybVdRMW80?=
 =?utf-8?B?V1FkVWVlRG9zZEpZMjJPcXk5MXVhZHhTVEd5OWE1MCtRaEMrY3NFTG54MUla?=
 =?utf-8?B?OG0vRzJzMU9ibG1oNGdwaTJzSUlVelRnNjlyUXBHOG9OdEdiQ0h1SkZwSWtu?=
 =?utf-8?B?eDFKUCtyY2grbWdjclVYbGQxV1p6OE5jbmpFcjJmbVlURkV4RFEycVZJdU5D?=
 =?utf-8?B?c3hVYVFXTUdEeFV3MHZWVUdqY0VQby9Nc3JJUVF5SDNpT0s2L2FSNGQ3ejMx?=
 =?utf-8?B?VlNaZU1iVGxJTjFlNmMrNjMvcUh3MWVZVUZ6ajdRNWtMM1JIazQ4OXVRRGZw?=
 =?utf-8?B?V0tYbUlLcE5YbExya041SGdXNVhNOERIUWZQQjljVmdHUkM3czg4QTQ0b0JD?=
 =?utf-8?B?MFNHU2tFNFc4aXpKbUN0T2UzNFh1cU9JNG43TlBvaTk4ZlBuRHdpakhtc052?=
 =?utf-8?B?aUYrRnZ4cnNWOHp6WXFBSVhwdzNRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb84e9c7-d439-4675-bff5-08d9f8967284
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:38:50.2689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+Mz0F1xoehdM/cv438DCZyyhU97GH09+QQPD5epbet1b4Dk/BwbgAN4Ajb/IOFd4x+ZqCVBpCW7SlYpNRKN5dnIzWeSBnt1C22AspATwQY=
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

On 2022-02-25 3:21 AM, Pierre-Louis Bossart wrote:
> 
>> +int avs_cldma_load_library(struct avs_dev *adev, struct firmware *lib, u32 id)
>> +{
>> +	struct hda_cldma *cl = &code_loader;
>> +	int ret;
>> +
>> +	hda_cldma_set_data(cl, (void *)lib->data, lib->size);
>> +	/* transfer modules manifest */
>> +	hda_cldma_transfer(cl, msecs_to_jiffies(AVS_CLDMA_START_DELAY_MS));
>> +	/* DMA id ignored as there is only ever one code-loader DMA */
> 
> consider adding new lines to make comments more readable. this is a bit
> of an eyesore.


Ack.

>> +	ret = avs_ipc_load_library(adev, 0, id);
>> +	hda_cldma_stop(cl);
>> +
>> +	if (ret) {
>> +		ret = AVS_IPC_RET(ret);
>> +		dev_err(adev->dev, "transfer lib %d failed: %d\n", id, ret);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int avs_cldma_load_module(struct avs_dev *adev, struct avs_module_entry *mentry)
>> +{
>> +	struct hda_cldma *cl = &code_loader;
>> +	const struct firmware *mod;
>> +	char mod_name[128];
> 
> use kasprintf?


Good idea, ack!

>> +	int ret;
>> +
>> +	snprintf(mod_name, sizeof(mod_name), "%s/%s/dsp_mod_%pUL.bin",
>> +		 AVS_ROOT_DIR, adev->spec->name, mentry->uuid.b);
>> +
>> +	ret = avs_request_firmware(adev, &mod, mod_name);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	hda_cldma_set_data(cl, (void *)mod->data, mod->size);
>> +	hda_cldma_transfer(cl, msecs_to_jiffies(AVS_CLDMA_START_DELAY_MS));
>> +	ret = avs_ipc_load_modules(adev, &mentry->module_id, 1);
>> +	hda_cldma_stop(cl);
>> +
>> +	if (ret) {
>> +		dev_err(adev->dev, "load module %d failed: %d\n", mentry->module_id,
>> +			ret);
>> +		return AVS_IPC_RET(ret);
>> +	}
>> +
>> +	return 0;
>> +}
> 
