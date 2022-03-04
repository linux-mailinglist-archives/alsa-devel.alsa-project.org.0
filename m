Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B804CD9ED
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 18:16:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9769C1F2A;
	Fri,  4 Mar 2022 18:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9769C1F2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646414213;
	bh=btwaJ9PezpC8FAHLGjR1MNTTtp6URmZiUQY6ZbXvtt0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZtF+l9n9yb5tlmT3WH7yDI979xnYZGWqhGJliw+c7SFd0LqrEBsk/XwXl0m4tYew5
	 sEomgZblZrHM4RRJa4ZP/h22/d9hpkUGcE0Zg9T9h/TmDiVlaB+rxPRy7u7Q+6o2hv
	 jx0EwX0b1ozQdSLlFWFj9ZBrQ0N+I4JTuZI2ogQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C738F801F5;
	Fri,  4 Mar 2022 18:15:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CFCEF801EC; Fri,  4 Mar 2022 18:15:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B54A2F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 18:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B54A2F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V8xN2k2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646414142; x=1677950142;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=btwaJ9PezpC8FAHLGjR1MNTTtp6URmZiUQY6ZbXvtt0=;
 b=V8xN2k2SAYM5O53L1Di6VEn729bCrVqe7A5hOkSRXC2+Dsx8Y0wLf3Ga
 h+r3VI032NYlPz42wkCmEV8qyn41oRWGwgPETBPm0LUgaFawAQFVatrMG
 8JVORZHCBoplI6IZuD+EUEC7aIJCAaS/Zvkhr0x3vWt0B6M+iinQUG1E4
 ugz1wjv2Me2qA96xJqHv+Y/j389gtIbwowVLRndhO9RnFQ+SNLdNNPuBO
 w7LdHlfgnpkM4CS1yFeXbqkY5dPF0+re6a1MmNUeXkBNpswdRrHj2qY1g
 efG15ZXJ5T+S9PNkOpXXHP4dZXsRlMdILyZIdFB/5EDaxoCGtUTVpfUBm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="253749232"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="253749232"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="511915897"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 04 Mar 2022 09:15:36 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 09:15:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 09:15:36 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 09:15:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZ8UZEOMElcY7+ZEA3m2b2CKsIzyDrAYa51w2yIvJx031sh2t3YHfKdpYwkhzngpF87JrEkqyJp18onVo3cmjrKntsH52NKzZD8atWmTVNaSRjfr5vfXJzFRFHAk0MghY/98J5uq5J4E15H+TjbtA5KNoao52pf5C1FEsDnYzJaOj8pqNhwRhN3QtAAq1psRNzBcINvLUvKT8cMqpZbzFxxDd7OhSG21aXxrWAgWoQ7nkuwEpQAcRFzuzvlGH3D/zPXCJ2H5TRzDQgdF4JPEWd1AlcpSmLO6/royXeXWR2bJgacXQpemTRumnvYJ+WlNIi73Eru1wlT225uHiLTEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/cHvq5pTAHJGhSlxl/V51uTZVf7NidoNrIV54mQIrU=;
 b=CSdIaaoaMPNpqoF0E7+ZC/bL9i0VP/qCxW3XXDptEH+8kNwiShgHRXsCieSDqYNZEI8GNGLu3uOuaeoxMNfmxchjlBEcPxC/XZq/TSbgQj+qukVGvARQHa+c3Gc/CYk0Y9WjkB5aiMP0p6m4d8ddUFCEWdYmTduV8m8CT5YqeNOE1DlWoALfAhMGbVejNI3q+Nd4c0jc3Nzznh4DdabwTCKVgzQRxGKgSUvDu6kukDxgbxBJ2WupJvUXWhOLJGtlzPoD+Hm8IDK5M1v1x7bLr/Zf/z+AX2a0AFdXt5WzIJKgrDYKkEXzn2cOAIvYSm2XkhaDDTBit3OW9gChoJkKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SJ0PR11MB5939.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 4 Mar
 2022 17:15:34 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 17:15:34 +0000
Message-ID: <14bae550-c892-5fae-63ca-d9a94d5634fc@intel.com>
Date: Fri, 4 Mar 2022 18:15:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 06/17] ASoC: Intel: avs: Add pipeline management
 requests
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-7-cezary.rojewski@intel.com>
 <a972e3d9a919cb8445295ec65f510c33b6239819.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <a972e3d9a919cb8445295ec65f510c33b6239819.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::46) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b7ba8f-b7bf-4d3e-fe75-08d9fe0297c4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5939:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB59394EEAB639D42B74D9538EE3059@SJ0PR11MB5939.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGkaHJrr27n0oR/cz65V18UFo/v2NNYU15vOpyQ3RRL+eXwiJbhqTS0qqe/WDmZa8/6vvd5DMEDT+s6yH4BfeGu50aBGrzr4enTgyeKmrVXU5YAxOmpZaXOoE7QDtbZ1KVTJwlGVdy9eUMMMraEj6S1h69OCyldi+9BwvV6Snl2wAfnnGkIaT9BhIOuNvfj76DDb4cfG86e+8xr4ssfLzjz7x+M1pCkVcOE155476CXla5gpKQUY7KoM1+iK0iLd0QCfkSF1uGypjWq7ZAJhXU4xaXMsJ64dIZGTKHa+ENovf+W+KRmjgRqqYaKRmFIbJElwMQOH9E7+IrwqyNmVH66tadlmxYxZaEK4cj6VQQMd963I5UMrdqnWmycsVdx98ma0zEQExIOa26Shcj4U99lirB6aIuyGFOrp6DSCjIF9NdloQQc/IJ8vgvqCOYd1a/Uz9Za21lHB+ABG0TeBHThT4lq6X9RTg8jGEyQjG5mZK63fbu0nbRYuTO89Cu55dDGSY9Mnpa114pJzqPNr76oVPhFedhrT4W5r9Wr/efMWY0GiBabKjl059UbTNqHCC3tMUW8FmZAWBtygOs3u3+YRBPPr81NPUtKKLN1bMe0SqsUuQcQVRfxkz373MLiDy8ElefpEJJEimD525Jy2V6G3Z3Vh4sXywa8HSZzdf7vkaGYUHhYE7Svj5cWPLufKTKlD3hiYoKYexDV4PX4YxVSs+w63z1xCWSay+4TNZWtclAagFRlXd/jNkprodHul
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(66476007)(31686004)(44832011)(2616005)(6512007)(66556008)(316002)(36756003)(186003)(26005)(6666004)(7416002)(5660300002)(38100700002)(6506007)(53546011)(82960400001)(66946007)(2906002)(83380400001)(8676002)(4326008)(6486002)(508600001)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0F6NEhnd2k1Ty80akZLR3djeUNsVmFXVnlSNUREMVY4RDdQS2pMcWFWaHJI?=
 =?utf-8?B?NEFOeXhrWWx1bkVmMys4a1M3Zkk1dno0Ky9rSlVJQ1dxVjNhL3JWcnZoanlk?=
 =?utf-8?B?T2NNV3IvUk1CbllFTDk5VzFTTldkOFJuNXUvZFlUYkxUY2pBdDJraGE0ckov?=
 =?utf-8?B?djk0Sk85NHg1TWJHZjFXbEI3cDZpSEw4VWFzaTAraGdqRWRkSjBkb0FsdTF1?=
 =?utf-8?B?MVYxU1B1ZmZudjUwSGwyZ0laRUkrekhNWXZLOE5HVldRcGlkQkNXeHNlQU1R?=
 =?utf-8?B?a0x6TEF0VDNabWJWZm5nRWVDTFVESlp3a1lqVWJlcUFjY0tKWXpPRTFrQ1dP?=
 =?utf-8?B?dWtwYlFaTG9PSllJT0Focm9xWkQ4SEFlZ09CQTQ0UEFvTkZwMEszYlg5alk3?=
 =?utf-8?B?RXA0aWtETEdwVzk0RlVoOTVpbE9KMmRxaVkwdkNpQXZuTGxDL29pTDVZT1Zo?=
 =?utf-8?B?Syt1TEZwQjE2QUlhbWFXUjg3cUt0NXpJNnY5SHQ1VG5JM0o0VE5IZ3NibVdW?=
 =?utf-8?B?N1MwUlhPYmlZM3lSaHRuVW9ubldCMzVIWkVweFhPbmtyR1ByOGorUUNqdS9N?=
 =?utf-8?B?dE1DYU5pS2h0ajZMN0U3cUZtazhnS0VxaEE4RDFJSlVhZVdXaVo0MkhSWUZv?=
 =?utf-8?B?S3NtbEtKQnVheUlNU1JOdHJ4YWhYS01oNVNJYmdqbng4NTlzdUo4TlhoNUVW?=
 =?utf-8?B?azJFSGhxd0dUM0dXSTlpM0NOdXJDYU1xWWwyM2lsR3cxOUhoRmpyWk1nR2xG?=
 =?utf-8?B?TUVCR1dmeVc3clJDd1VmTW5nYmY3QjRwVjN3YUx1MU4xYXZ1YTNSd3pXVHha?=
 =?utf-8?B?OGNhRXg4SkcrMnBEWmYwSlFXKzZlT2NPWmRlSUdWQ1BpUzdqUnJ6bm1uS0NU?=
 =?utf-8?B?V3NDWHY3TUhneEE5WHNOeTFLSlJWK255ZHN1c1g2eEgydjUwZEhkRHlrVEx5?=
 =?utf-8?B?M3J3U0JOSE1MUzl4WEpxcnBOekZodGpFZTlYd1pNK3FlQ09HMjQxUGdEVTlZ?=
 =?utf-8?B?Z3EvTytJdDV6dDEvejhWeE1NQksyeUJuaDVRcFFHZTZ2TFZtYTU2bnA1TEZP?=
 =?utf-8?B?NkFBL253OXJPeEQ1WkpuUzNTbGViK1FwMUJlQnFXUUxYSGsrbk9TS29abEF5?=
 =?utf-8?B?aUtNODNkc0xCVHlVamo1S09RTHZXT0VobUYxRkcxMkpZdVI1MWE5WjU1MzVX?=
 =?utf-8?B?dkdiT0ZRS1YxeDVFNytUbXVyUXpGeFNYNnVBaDZZa2diczF2WWFmMStpSEtL?=
 =?utf-8?B?TTVMYTBBMjFsSlBldndoK1pqMEM2dUVOSE1HWHVFa0oxVitIUm55U09MRmhp?=
 =?utf-8?B?WFZCSFhLTnFBeWs2V0EwbFhER2pSbEVoU0NjZzlPWGhmbUtNUXE4MVAxOG0r?=
 =?utf-8?B?S09pYWdVSExmOU9uYWdIQ2pWUlk0ejBFcCs1djNNcmkrUU1BZU5ialMyc2gv?=
 =?utf-8?B?LzdycGNXb2w0MUZqa01qOHBoVE1qcldjMFdJaVNFM0VzUXc2QkxtMnUvc1RC?=
 =?utf-8?B?OHhJL2dybThIOEVNbmhBM3pZck14SkJDT0M0UzN1eWI2VVUzODc3YnI2cXlk?=
 =?utf-8?B?Um1Mb21kdmtMaGVvclFaSDdrbjhGV1cwK3RSSm1WVUwzNmZFMkM2QXFNNVZ2?=
 =?utf-8?B?WmNTcXFwMy8ydzFqcXdSUzJ1VjhyVWpNYmVyQkgxS0o2QTZxbEdNYkpYRkY2?=
 =?utf-8?B?bUFTSllJTEkyV0xPQ08wZUxmZUdKYUhnOXBmcTBydFd2cE0yckNZK2FJeXJo?=
 =?utf-8?B?TUxzdlpST3dSVmxycTRNTzg4enhQWEtVVXY4WFF4c0o4VmR5MTB4Y1d4S0JM?=
 =?utf-8?B?MkhhYVRsMFV2aWc2cW9GWDcwS05UR28xWjRGTzM5T3U3ZmhTVnY2WGJSa1VD?=
 =?utf-8?B?cGhpaHRHaFlRSk80K3FyS2hVVGRTTkFuR3NQaXh5aUMrMm5NeHZ6Q2xRSjZX?=
 =?utf-8?B?TTFHYzhIWHI4YkNzUU0yQ3JjWGtaUVBBcDFVM1lHSnRTUVFvMzJqSlZQdysv?=
 =?utf-8?B?c3BjbmFpV0NqSDB4YlE4a2owYWErQnQvQ0Y3YXJwakJqazJ1TnVlT3ArSWw1?=
 =?utf-8?B?YkZ3OWsxNkRNSU95c2J0Nzk1cy90ZTlNci9LaERjczdKTmtxUThxbnE2M2d3?=
 =?utf-8?B?Vkc3ZEFUM2U5MG82SEJiTWlmdzBZSElsYU1vUmdwc1Z0ZE1xRjZOKzB3Q21h?=
 =?utf-8?B?d0VXS1BzTHV6RCtKWVQ5OUZ6WGV1QXVyUWpTKzdlR293ektTbFVCT0FJeXhM?=
 =?utf-8?Q?qtidiN7wU6QBbSoOz3uNSYqyj/n/jiBh4kWgE91YvM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b7ba8f-b7bf-4d3e-fe75-08d9fe0297c4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:15:34.1638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNuxybQTR/YKx3U9135hnsUchbaN6yM59E6ZudVmh8DN+YrdTM0D5UiHmJ57jcC7NuouJGc/8LEjpNwBP+Riro9C/XXfzdBU0+Ay14+qEY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
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

On 2022-03-04 5:13 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
>> Pipeline represents a scheduling entity. Their existence as well as
>> their state machine is controlled through CREATE_PIPELINE,
>> DELETE_PIPELINE and SET_PIPELINE_STATE IPCs.

...

>> +int avs_ipc_set_pipeline_state(struct avs_dev *adev, u8 instance_id,
>> +			       enum avs_pipeline_state state)
>> +{
>> +	union avs_global_msg msg =
>> AVS_GLOBAL_REQUEST(SET_PIPELINE_STATE);
>> +	struct avs_ipc_msg request = {{0}};
>> +	int ret;
>> +
>> +	msg.set_ppl_state.ppl_id = instance_id;
>> +	msg.set_ppl_state.state = state;
>> +	request.header = msg.val;
>> +
>> +	ret = avs_dsp_send_msg(adev, &request, NULL);
>> +	if (ret)
>> +		avs_ipc_err(adev, &request, "set pipeline state", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
>> +			       enum avs_pipeline_state *state)
> Can the pipeline state in the firmware change without the driver's
> knowledge? When should the driver use this get_pipeline_state()?


Thanks for feedback! Consider dropping the unnecessary bits so it is 
easier to navigate through your responses.

Please note: kernel mailing list is not for explaining SW <-> FW 
communication details. Feel free to contact my colleagues from firmware 
team if in need of any FW-iface details.

-

Actual state machine is found in the firmware, not in the driver. Driver 
may use such information when profiling and also during debug.


Regards,
Czarek
