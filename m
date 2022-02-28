Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2BF4C70A3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 16:31:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7D83174B;
	Mon, 28 Feb 2022 16:30:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7D83174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646062297;
	bh=8eKWDmV8hT9iBCCjxo2sY2zVyJBWmWkgIynyRIJZD98=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=USGpYQ2XlLKqvTeNAFA8bMMHT9wIayAwEDjMjc1ScAqM4qH+pkbmuqYl8J6pFhQLM
	 RoNfMrGRVzSb5ltiyfh2YUB9aljH/RHUPgCMbPYk34wyIn21Z8IX1Yd0QhEVNH+770
	 RVlYgOtj2tkPKA+757LoIVnYHKmQB4us/yns1e4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B477F80054;
	Mon, 28 Feb 2022 16:30:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C8ACF8013C; Mon, 28 Feb 2022 16:30:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B922F800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B922F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XUXTaA/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646062227; x=1677598227;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8eKWDmV8hT9iBCCjxo2sY2zVyJBWmWkgIynyRIJZD98=;
 b=XUXTaA/vyxBtrIR/AE0PegLq0n1Yc3bUZwlkdCgdJJqDMRsEqI9PAKKQ
 hD2/WClk/A4ixwbloGNHmgsLuCDp7sHfm8A7bCrWLjdqpYCzsU5nf+Hv/
 H7yPx16a15tD/B+hd6f1kzRhHXkoJiR1P2iBhOvqURYpg/C8J292M+d3j
 8rZ9Yufn7D7eul1VucBPutISEdGyfVXXPamnYnApNI+LdLX1jJrcaRfoO
 mTAhg0qEQDo48MY9PGnFjhD8nyUjmtJET9Tcjfg3mM2ic/QN6li5lT9nD
 DAGAaXYGqxq/cNsPg/XjlDn+SQ/KkQGMri6NUp3hbjvmJMQOwutjFriVE Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="277565950"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="277565950"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="575345796"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 28 Feb 2022 07:30:18 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:30:17 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:30:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 07:30:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 07:30:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIBCjaHz//kIp+ixFP4BHNIGLCBSn5H9nOgsMq9YoDagqsdA83aUtcQ5sspuBv9sfBlM1oKhtM5D+sM6a4VauzIdUfP8f8B0S/rCeCUOs0GlIcTBhYNgDwiiiuCUwvwpHwsDmuQhdhiRg9oSxUtEKCV3DBB2u+0BLOkwx2T3ZhwSKnV+UD1U1MlHjglyTLdv8JYPfKiE55MxQ2Gkdi12SGedMF3d0V2Kfhde3DaFpH4/4SYb9Pwj7dIsaI37ivL2LugYwxayCqlB0qmpyiWeRYRICe1RCpvLQVIsEcGoo/heqkpch8i01wEeyKykXn9hw04VFnuDTP8dVADD1TjFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v56mi0Twr9BpRB/3RpOIB8eqiTkDigVLQC16lI37dJM=;
 b=dFYJEZcCgh+dH8QNqwib/s7gvfJF5YJun/BGANG9KmJ79bryKLneN0hRkR2KPWhV3dnyogfQvUBf0edd76GVTL78HgXi9aH1UfyY1KHNkcQg6h6V4ZkvcO227bEskEeE+JAvrz2seX0WJJxqamHim+D0Cs8XxK7aIoojvQ5RArH6tRdYtyXjXPaxQhTlsAYgwNjn83/eyvO7XYrz/NqMhRHId6a5wNUFa6rPrdnAsstWasrZRaHJCw7mOAQMwQ78sgraOfj8+l5l0zuYtAoy22IYlB2gh/OL6Yc+3cEI6Q0dbzxhjhSuOUY7BxE8rNMFDRTm7vejV/1nKA4MhBSylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by PH0PR11MB5609.namprd11.prod.outlook.com
 (2603:10b6:510:e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 15:30:15 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 15:30:15 +0000
Message-ID: <05e48c88-6faf-fd67-e051-b628222824a0@intel.com>
Date: Mon, 28 Feb 2022 16:30:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 13/17] ASoC: Intel: avs: Dynamic firmware resources
 management
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-14-cezary.rojewski@intel.com>
 <c7a06bdf-5ad5-3d58-bd6b-4a533b8e7d8a@linux.intel.com>
 <3e85850e-8e9b-757c-f640-498bf83996d8@intel.com>
 <66c8d1f7-f181-03ae-d5b1-17ec60b2b798@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <66c8d1f7-f181-03ae-d5b1-17ec60b2b798@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0422.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::13) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a46144f3-ded5-483a-a49a-08d9facf37bc
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB5609C2D3D7342299FC829732E3019@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXgPVoSq7PUwdYOhbfibA8EhlQ1Ov+pPB+AWZ5TSUVpRJyp0svsd/OMu1WgDDc8vY+958dsv1z0G/fviIxFaXys51M/q38LsDQPstmf+rkmzJOjWmj7kD/b4FMOc/q4bqH85zuILZpgyXERbqZ8pJfP51czCCrkq2TLEbbo8QeJ+5DY1zGckL8bhkhpl7wUa8M7BdohN1/22ULka8+cuLfdTtGcUhu3HcVR6RW2HV06hbabXizWZ9gbMvKEDQtfQungYOBUdkoEcoR387m72+kKOLLGRpF7KZK3rv6JkxrLppj3s4P4vnrfiXDMs5ZOWlLih89wRmpeTioQhJHODs36SZFYuPvbOmk86kVVMQLxdDW65+RUJSIUzsq67XN4F5UADL/QXox8O/lKMSZW6GG7zt4VBFFEaLC4u0vd8kBLrWT+sxbDcBO/gy5/Su5Q1B26yjnzqFw1GQ/8QLSkMPFJX7kf1YflWyuKAfSYqkFFM06/ASfe761VaO8SONaZrvru6Z3o1k1bMzNueUre9z3HyHlmtB/gAEEkEqlL3lmrW9/f/J1pI3otlJGidVtmeb76o4j3lcWoUrp/oSwtk17Nw3f8ukd2sIe8Fh74aA6mjoM5R3WuDBUjE7+Wmqvmq14rVTYg+BmviW3z9pNqD8kWXzKxaQYv6zzXvphCScfRTcgxVaye56fkAI9fkVmb0ZNZCwxacedELDQ7idbICH9/G74WBpirZD25idlzjwF3d6BU3c77LXK0VmmzJLnI9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(66556008)(8936002)(66476007)(4326008)(8676002)(5660300002)(66946007)(7416002)(6486002)(316002)(2906002)(36756003)(44832011)(508600001)(186003)(26005)(6666004)(6506007)(53546011)(2616005)(83380400001)(31696002)(86362001)(6512007)(38100700002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N214amNFbGZabS9GWmhYRUlMYisyVXFIamQwMzh1ZkFUaExZWlZWTWxMdlc5?=
 =?utf-8?B?MlRRd3MyZmcxZlFNZ3VHdFE0Y2FVckJQL0lNSGh3bkhhbzlpWmpZY21oQ2xh?=
 =?utf-8?B?U0huODdzcmFOQkw3aXFJOFlmV29ZTmptOXhoSTArYm5vZU9CRTJHQzl1YmVM?=
 =?utf-8?B?VkVkTDAzVTI3Z0F2R0JhSWQxTHcwdlFwT3QxcFR1SlB3UzhvRTNvWGlDRkdl?=
 =?utf-8?B?WWlHeC9nRHovaTRmZXFIdWZnVEVBM3VTcEJhZVFQeFc0V1BIM09pMjZoRThQ?=
 =?utf-8?B?WWRxQmZwWTE1eDlaZVEyUU40YXBjZkJxVnZwNVRkSUtXb3o3MzhLamoyMDk5?=
 =?utf-8?B?VVhKbTNmMFFiODMxbmx2d1dXNFdydHhNR3l1MjdqOFBqbFd2MnJGcFl3M3k1?=
 =?utf-8?B?a3VDZDI3WDVyQzJFcXlRbFRuM210RHJvRDQxRGdVaVgwMnJpbXRHS0FQenho?=
 =?utf-8?B?MVJJdEc0SlJzb0M2b1o2QUVEenZpS3BKVEFnby9aSExob3lFR3o3dEtoazlp?=
 =?utf-8?B?QjEvODRTcjBRWkVmdUxSNmNRemo4ZHY4L0x2VldmbTQ4WjBERmRoejJtK0c2?=
 =?utf-8?B?MTRNVmZoa1FtdTlNSmQwclpYRmlXNjRkMXNRZCt5bHgxOStFVkNjTWVzdktD?=
 =?utf-8?B?WFhGVm1mbHhrdHRHSVNBRmx5cXQ5cXhlTVUzODBWT25ucGs5SU01YjR3bGFr?=
 =?utf-8?B?Ui9pZjdLei91WlAxR2pHUGpxQnhvMU9ic09MYm5qUUszdjlZbWo1eXhaK2NX?=
 =?utf-8?B?Vk1MOEVmVHB4TEJxV1pYZUZGd3llVzkwdENBL0h3Tkxnb1d2dTM3VWloLzBF?=
 =?utf-8?B?cmUwN2VCOXVqR1VQazQ5N0MxV0QzSTZkazd3RnIyY28zMWlkUWlyMTFBVG9s?=
 =?utf-8?B?WXdqdmJzQ1V1M0tocXhnWGc2dDRMTThpbWlkR3ZIbXRxcUM5QityZmJJWFBM?=
 =?utf-8?B?ODIxdkZxQWZKaVlEZm4zRkoyN3dNa0hFaFpjQ2w1QlhJcUREMmJKYW8yVnF3?=
 =?utf-8?B?bUhFY2lnUmpxRERZTmlhZ0tVSlpwTlR1TEtaMlRIY2J0b1BQTmduQ25VMUV2?=
 =?utf-8?B?RWkyRXdmUTZFYmUzQzJyMGU5RWRMUlBOdEdORHBJeGtmdDl2aG1rclAyemwy?=
 =?utf-8?B?dDVkUHJtOHhoMWpIdE9jMTA4RjVEeE5uZFlBRHRQaThaZjQyOGFPNjJTbGx2?=
 =?utf-8?B?bERHVmM3TUsrUzFaL243bUMzMTdWamVDMFNXemtFQUcvMURySVJ6NmQvVXNu?=
 =?utf-8?B?VElqVnoxTndWdk1ONzl1RDJEQXVjeTFnbE5aWUdHYnlXQ00zWnJ2NHVHQ3Bv?=
 =?utf-8?B?cXpoWTBvU3RpNUFZRFBiK0N3ZmdxNGdmOGVDMVd0ZThBWVJ6V2hXL3p6cDU0?=
 =?utf-8?B?STdLUFdURTVJaElWa2hEYnBWem9kcVkzUm5aWjBSWVc1MkhWUUp3bjJoZkMz?=
 =?utf-8?B?YnZvdzhUS2kyYzJkY0REd1dLMjhlZmZJdFN4a0czbGhBYTBjbmhSWjJwRmtF?=
 =?utf-8?B?QkxDbVlhMm9VaTVqOHhObjdtZWd1bVFzV0I2eFQvVEpXSm9DNUtMYzU1Q2NV?=
 =?utf-8?B?ZWIxRmtYczloOUh1Zjk1QWprVWdXbm0xcU5QbFdtZ09lY1JLZDFBQ0VQNTRN?=
 =?utf-8?B?NjRtSzFTa0Q3bStpalhWMGJCVk1QRHlNUy9ERkw4TDFIMksyWjduMzBrV0pk?=
 =?utf-8?B?Tnc0WDk2OHpuU1lSV0pycXB0Qlgxbnowc2QvQlNzc3NLK2xTUXhhM1FIM0s1?=
 =?utf-8?B?NUg3Ni9mSVh3Sm9HSHlXSW1mWnhFMlZGTk5UTDFucTNYRC9oeUcyTm1DMVFB?=
 =?utf-8?B?S1l5OHJYOTc0V245TCs0b21DendPS2lCc3RyTXU0aEJOZlZOZVJvS2FSTzlL?=
 =?utf-8?B?QXljWGkrRmhGY3I5ZHFCMjRPeEJCNzZwUXJUQ0ZoQy9UQmFQeFV5a1lJYjhL?=
 =?utf-8?B?UnZsd2thSDJycG9kQU1ZUmoyelJFV0E2ZmFwcnZYY0Y3WFgwcHFuek4vNkU4?=
 =?utf-8?B?YjQyc0Y1b1Nxd0JrRGRyNXA4bzJKeXNuYnk0MFMzZ3A4RFE4RGlmR1pKbGhW?=
 =?utf-8?B?TUdCaVo3TzEvcmpYT3hsNjJjbzgvTnI2M2pKbGhyejVHN0hXZGxBOUF6MEJK?=
 =?utf-8?B?aHFLMlFsbmFhVSt0Zis0QzIyc0ZTMFM4QXBQdVdEUWJSdlRlV3VycUR0Ty9s?=
 =?utf-8?B?SXR2aUFUcyttUWdTQmdYVFlIVzFhWTZ2NURzbXNxN2ZZdmJkd1JMaUhJcCtp?=
 =?utf-8?Q?NwDH7P7kGms2LP3BSuR5McpgJ49RoShpG+3Eh1H9Jo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a46144f3-ded5-483a-a49a-08d9facf37bc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 15:30:15.2575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQa3IVh9UMOgEe7asndSh6X4WyDFWnuu+/3uykYyo2rjMmqp2OjCye76QeLSKQfzdUJwBtdPWgQ4dfosHSBfgTC2/CNOXI4lU2Zq8eACk54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
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

On 2022-02-25 9:21 PM, Pierre-Louis Bossart wrote:
>>>> +static int avs_dsp_enable(struct avs_dev *adev, u32 core_mask)
>>>> +{
>>>> +    u32 mask;
>>>> +    int ret;
>>>> +
>>>> +    ret = avs_dsp_core_enable(adev, core_mask);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    mask = core_mask & ~AVS_MAIN_CORE_MASK;
>>>
>>> so here BIT(MAIN_CORE) is zero in mask
>>
>>
>> What's wrong with AVS_MAIN_CORE_MASK being used explicitly?
>>
>>>> +    if (!mask)
>>>> +        /*
>>>> +         * without main core, fw is dead anyway
>>>> +         * so setting D0 for it is futile.
>>>
>>> I don't get the comment, you explicitly discarded the main core with
>>> your logical AND above, so this test means that all other non-main cores
>>> are disabled.
>>
>> There is no setting D0 for MAIN_CORE as firmware is not operational
>> without it. Firmware needs to be notified about D3 -> D0 transitions
>> only in case of non-MAIN_COREs.
> 
> the comment was about 'without main core'.
> 
> This is difficult to follow, because you've discarded the main code in
> the if (!mask), so that's an always-true case, which makes the rest of
> the explanations not so clear.


I'm afraid, not seeing the problem. It's clearly not always-true 
statement as 'mask' can be non-zero after discarding the MAIN_CORE.
