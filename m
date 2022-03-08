Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35AF4D204D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 19:33:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 849111EB;
	Tue,  8 Mar 2022 19:32:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 849111EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646764401;
	bh=SNqTubwzzTzeR0QH4TsYZ0Gi4QmypICHaeJyeGrSKSI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pL217hF4kKmJtfkOfFdracnBcgmd8eOquxgrzPG2yOUV+0TabJFuc8rrYgyvizxAY
	 jx10NTk9iMxtUjAb+Un3yocLBH3f32a6FTZyqlYmRfteGBTqHQvWfVirqw4OkB8wJW
	 qupdoeCKaxe7WifsDnK+iQnbTKQJ1kyW10bNQlh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F01DCF8026D;
	Tue,  8 Mar 2022 19:32:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD740F8026A; Tue,  8 Mar 2022 19:32:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C558F80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 19:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C558F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XkCeM+Cn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646764325; x=1678300325;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SNqTubwzzTzeR0QH4TsYZ0Gi4QmypICHaeJyeGrSKSI=;
 b=XkCeM+CnVXGvX4hV4r7oM10wifDRYY9LaBB6y19IrLpqTv6biHjqmvcd
 UeMfupvGoXFvq6dq2RkY3mpqYBM4iRM2Pcb7IF+YRtzviN3KMEsgiDTBi
 KnZimqn4krY1+V6WNROtOXRmJoLTQ1vL3Mk3cvMmE3JGkh+k2K/AgyJfx
 Xz5PyK8IDaovxfpI7DPIeTGHWiRNBgLNr3qtez1/oeyPfVFkO1o8ZOy4C
 JDqawG21oYygwkOIySAN/iIUTxkFdRUIEHPTsxkDXZ4jqDMo3z8JOahK4
 VGK9JZ9GSvAkkK9VdeOtcDvupVEyYlQOiXH8TZl4MwW1QOdeAhXfIS+8S A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252351115"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252351115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 10:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495558438"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 08 Mar 2022 10:31:58 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 10:31:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 8 Mar 2022 10:31:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 8 Mar 2022 10:31:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuAKSNiAAvlx7iY553zdBmlpMnKw1GS2cNquJs2pGYFJehKQaBZv8h4WBlDvCtrE/URUMofkWTK5/EhW3Mq6Wk6uow8hBPmIbCRmXx9ZiGzAIZ+AdMY7WxjGVCBU/Ui+ifqdh8VMU5O2a7Xsu3VYOBizlb34fw1I9KEf/CbWQJ9O7YUeFrLo8WGnj239GO+ZyYpSoyavzS6ID46Vo61AefI7KRBuBTMmWSWV2yZy/ivceIKt4YGKfPl+wYIDDitHRCzQfWdajtEKKx0RBV35/vZOouVMXRuIFxGiHS0E8QhVFBMbXTCXKOG8qT4oOxEURWRZY8aA10mfDVr2V3r8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T33wp8zBrs62wflUH5RhZ1C3yoGEu7OjcVEgG9WB7Po=;
 b=Nh0h3c1Ym5L6RAJORm0U0Gnh2vMwgHWzNTWVkFaSdUtfztq1mKFIhKpIy4kq4Kzpvff433WiI7GSbO7QepY7lHMDEc0Hp/nk8s18v+O2xVgtYe85BNfGEJWMfvosB8ztOdXzdAYQnKz/EaTM2e0evrh3AZAlLOqQgP+ZQA7Wjbm+xHG/lQBKpLuvYCLzkiBi5lbHfZ/XnTuMTaRx28l+hsndBCO0JMGxV4ZRhwL+JgIPb9aeJkPTs6ytG4tNGPryxah34r9T6+uNEShMY+HkcJDRer4er9RaOBi5u+RmoKBaxBFw7WbvkH4CYifNr+vmkMg7nbYziwCpoCebxmWAyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SA0PR11MB4672.namprd11.prod.outlook.com
 (2603:10b6:806:96::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 18:31:55 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:31:55 +0000
Message-ID: <6afef2db-724b-dc42-b6c2-b233c8ba72a7@intel.com>
Date: Tue, 8 Mar 2022 19:31:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v3 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-12-cezary.rojewski@intel.com>
 <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
 <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
 <a571f334944f3ae7762068572003299c34fd187a.camel@linux.intel.com>
 <f70be289-ee9c-51b5-4003-7bc567e87a54@intel.com>
 <9f4cbf5a720aa66d6a540092187ad88b3adb5525.camel@linux.intel.com>
 <4691b216-92f6-8d46-d3db-e302f5f21c34@intel.com>
 <3c79c158757bfd542747bcf7b4de73e4529ac4d5.camel@linux.intel.com>
 <361901b8-f8a5-7b27-ee44-872c4e10bc2c@intel.com>
 <e71e12e1af0b9af115410c8210f21f4e50a09e6f.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <e71e12e1af0b9af115410c8210f21f4e50a09e6f.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0151.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::6) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fe00ad9-d572-4506-9f33-08da0131ebd6
X-MS-TrafficTypeDiagnostic: SA0PR11MB4672:EE_
X-Microsoft-Antispam-PRVS: <SA0PR11MB4672A0DD657976517461B6BEE3099@SA0PR11MB4672.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: voemUec3QDvhx9I1gAcUFT2437F0/X+t6DZ0IFaPrXtRrj+pSyKnVl/sLvopYvYPEY5H65pHHOfSh9PMfBS21PuPohGssWfv9bHLv2y9pF71eiXhiyT962lhsKn/K18LWk++z6aTPi4l7zH4OFUyOkNGFjoq6NKlByFujToLFNaJm7o+qyhKEdcPwktNmLRA+f0olZppl+jY0M1n0E3Aqo0f0VWG7GxaUt6XyyB1254A10KAro9kx+ShkRTKy2NqUHpOo6odkbg7lUPXTc3S/6hqC0F/PD6MzCpRRh9/KLFT9d4Ft+PryCZ4CyNQEDMsQdLwkc4jr6BhXhS8RjiZGUg3dSYkl6bnRdBVx1Vt+Cz5rRoU4Hp2QX4VckKQ47O0RzaBw5dblj311jCuNhgrp9EzKDh45wqwkZtQUC0j8xyGRL7kSzzGLH85+gN6y5KH0CXSaHk4MZUmqgpcpAL4kbYRuUOJsDZZhFE4ZS3Hkih5ahZwC7VgeX2Hs/CQj9JcxE2y7il12OQ2tJcFXxsyK1MUGgcK7y/wBc6zAFijXg1kxCeKwi9vgGh3S16qdLKv27+SCKgnhv/VwK5qCOB6j/4zNW/oB3rFRdwzGU7p8OYqcDoHROVtj49r+UQe5f34sfr7s/AeiI/bpAhwcK5JAfqemS4q6C2oJI/eSCwKBrBh2TBY0xEJ1ERF5yC+DB3vq6IXSroOLjau/yPyWrrkvBF1hMwSDr73LYUtk9pTysk4NQ2CWZPyPbwtg1gn1J0A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(6486002)(6666004)(44832011)(6512007)(508600001)(53546011)(26005)(186003)(31686004)(36756003)(66556008)(66946007)(66476007)(38100700002)(4326008)(8676002)(316002)(82960400001)(2616005)(8936002)(2906002)(5660300002)(7416002)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1FGWmx6YUlxTklnMURpcWIzd3BTakxQTEMxd00rZWJxOExwUDhwem1sSUx2?=
 =?utf-8?B?bXJGY1oxd1FWenM5TnhvbWEzT2pZVFByVnZjdDZEWVcyaGdnOHByZ3dhbUVY?=
 =?utf-8?B?Q0liWW5EVC9DTnpzSWZHQVhEY3Fic2gzQ3ZzMytFR1NSakVXQlZva0pkSE83?=
 =?utf-8?B?a3dGVFNUL0w2b2gwVVF2SzZWRGM4akoyUDVBVEUyZFpRVi82QUVKYnFwUEtx?=
 =?utf-8?B?dzNHeWtqQzk4Y1Zmd1h3Sk02MXhobEl4d3JOWnpteTQycFdqWGdxeEp1SzZO?=
 =?utf-8?B?STQ2empncXJRaGt0UUR4NzNLU1ptKzFsTXl5YzFZL3R3L3JhRzcvdlE4bVBy?=
 =?utf-8?B?VC9FT2NyRmdGbHhRV00zd011NDNPU3Fja0Q3M2xvQlJHUkVvalBaL1lIZU41?=
 =?utf-8?B?bVBYTkh3R2VDMUplNUV4WWd3ekgveURTdDJWd1lJREFUN1JRNDU5THhISU5u?=
 =?utf-8?B?OXdMOEdvcmtSS1VWT1YwM09jQ24vTWZzek13L0xyTVF4YTFKVVVrZ3d0aG1r?=
 =?utf-8?B?aUtoMnRON2dBMVROT3FDMzRWM2M1ZHNPSUd4Vm5ZQktNTDl4V2tQY1dpSE9X?=
 =?utf-8?B?d3F3cUVJNHNBVXVyMjVRZHc2dmxmZXhOK2tZV05FWTdWZVpsSG1yc1N5bWFl?=
 =?utf-8?B?Skt0MVZ0VWxDNVdBMW5kUkYvbEVkY3d5ZkFMckJYM1g0YVJ4WmNxc09NT05W?=
 =?utf-8?B?RHJpRmFiUkIwZHF6MjNEakw5S2JBV3BmTXl5dk5NZCt4TTJpaG1pOGREMW90?=
 =?utf-8?B?UnlLNTZ2MmczRWtWNmxldG0zVFh2TVAwU053d01mb1lqOTh4Y1p5aWhGVE1B?=
 =?utf-8?B?TkRFU04rQzBuK21zdWNQSHRCRWdtUEc0Z3k1Z0VXTHdvS3ZodXFnY2JpT1FP?=
 =?utf-8?B?dHFFczlXdGdzSE1oLys4TitnMSsvWC9EOHFKSlI1UTRtWUlrc0NEc05kZXNq?=
 =?utf-8?B?MWg4Qm5aL3dYS3IzVHdvM1ZPRHVzS0c5NUtmQTJQQk1rdWl3UWdHWG55cmR6?=
 =?utf-8?B?dG5wNk40MGZMZGpKWjYyRXlIL3VESWNZb1psTmQ3ZUV4UEJMa3BvZzVMVk0r?=
 =?utf-8?B?WHRpRWZOQXBaZ2VHREhQMDY5VzMzR3c2MDlNNTJXR2FTK3hvNHlHOTBIY0Qy?=
 =?utf-8?B?bm16S3BCY2w1QzFPYU9JTnlBcVhxeWNLTDU2Ri81cWtORWpMSFREY1QwM1Bj?=
 =?utf-8?B?YmZuVUVNTFYyQVZwcUdZTmRWYUlXZEUzbEFPSUhYckNRN3AvVEZlMzdYZUNB?=
 =?utf-8?B?aGxEQTAwRDhkb0MyQ0hpWm5ONGVoRnVSNkFDaG9sSEhhM2lEYi9MVGhaV0Qw?=
 =?utf-8?B?MCtuRWQwdE5uZ29jYThuSjliOGlzdjFISmhOcmdKVlNJWGsxYlovcEhmOW9C?=
 =?utf-8?B?bWpiMUszekg5M2dISk5sTHU3MTYrTTdwMnZ4TVl2SlJ4YnRac2gyZFpsYTJN?=
 =?utf-8?B?SHZ1bnQ3WEh3N083c0ltVWJ1VHFqYzhrODlKYWRhVGNBMVRnVklZRmtiVXNH?=
 =?utf-8?B?STRrdXpJcmxhQWFzWVdXQW5NS2V5VHdkNk11a3ZIZ28yb0NMNTFKZWRJV0V3?=
 =?utf-8?B?c2pZL0I4MkdyZjM2VXp1dzMrQ1VtQmdGQStReHJhVkdxL0xSMGtyWTNuK1lH?=
 =?utf-8?B?Sm9oUHpRL29JN3dDTm82eVAxWHVuTTlnU2J1R1BDTkdUVkxhdmdDTVpTWXZl?=
 =?utf-8?B?M25qK1Y3ZElmcDNyNDN6a2lGMjBJL3hzUGpvWUhGanZHM0xNbnk4ZFdKZ1hK?=
 =?utf-8?B?WFpXSmhuWnhsc3lNYW9YUjhtSGpIbFduaHpaTndXWXlDV3o5NDFPY01YdzE2?=
 =?utf-8?B?cFFXeGdRRG9jUmc3alNnNEtnMHVhSG5oUFN3RmF4MitLT3dsbmdTZk9Ibmhn?=
 =?utf-8?B?QWVaT0kzVkJqYUtjT1VNTndzOWxzd3V2VnlzUExWc2JCaERQYnJrVG1LRUwz?=
 =?utf-8?B?YzVaM2JIK3dXTkJhR2x3V1dOS21sQWxxcmRJSUVsWVR2WFlIcll0aVZ6K3Np?=
 =?utf-8?B?YkowWWs2M2tQMDMxRHpnaytaSWpONlBoaHhJNFVmOUIvczduRkpyeTlURjlE?=
 =?utf-8?B?WVQvQUExVUxQNmg4WnJCTzVKM0xWUXZ2bUtYRHp3MUVPZFYrL3d1aUFMMmd1?=
 =?utf-8?B?alVZVDhqU2RwUmIzRGlTaTcySDNON0NIK09KTGdscWpxUmd3L3MySkovc3Q2?=
 =?utf-8?B?T08vNzlSMFJzcmwzRzJmVTRuNHF1eGcxWGVleFVHZXRLTUFmSHJYNEM4ejNh?=
 =?utf-8?Q?EejdsS+qvnFzjbQggdg+14gwm+ztOW4i/DCdEhyTrI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe00ad9-d572-4506-9f33-08da0131ebd6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:31:55.0582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GjKcXM6IgeHmGJVWm5FQI1edMQiK7/R4GaO0c/FOzXWpqZBJ/8WGCVh9W1LumwbGRluBpgGfV8zXEmKE2yq81rTzMh7qxPPsStUjjpBCwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
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

On 2022-03-08 7:26 PM, Ranjani Sridharan wrote:
> On Tue, 2022-03-08 at 19:07 +0100, Cezary Rojewski wrote:
>>> Keeping in mind that this driver is meant for older platforms, how
>>> likely are you to support multiple sound cards with those
>>> topologies?
>>
>>
>> Not sure what's the question here. Age of the platform has nothing to
>> do
>>
>> with the subject. There is not a single DSP-capable platform that
>> Intel
>>
>> has shipped that would not contain more one audio device onboard. At
>>
>> least I'm not aware of any.
> 
> My question was related to your comment about multiple sound cards.
> What I asked was do you plan to support multiple topologies with
> modules spread across then with multiple sound component drivers with
> the AVS driver and firmware? Does this mean you will need multiple
> topology files and machine driver? And what is the rationale for this?
> 
> If not, there's no need for the mutex.

Yes, avs-driver embraces granular sound card approach as opposed to 
super card approach. There is one topology file per sound card.

That subject is not part of this patchset though.


Regards,
Czarek
