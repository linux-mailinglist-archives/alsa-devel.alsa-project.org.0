Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4334E2EB7
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 18:02:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AEF21739;
	Mon, 21 Mar 2022 18:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AEF21739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647882153;
	bh=PPP/f297uc23aUV4P5GLWxUjmFHBZQTVsYd98V2SbjM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncMvs6ofPzJkuFnA5Wf13HSK0nVkkBvnL6menbnc8XCa95PbpcTgI+xhqpcxMQkxl
	 UwZOznwP7BoFIDl14A1kJU20BeBJvrPu3LBwspf7qsCyl47UEegK66cr8iSVY1J3YW
	 1TZrwzuIqXMqzOSJgiwyb8y0rF2h1s+3YktdetzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D90F80109;
	Mon, 21 Mar 2022 18:01:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B2A1F80227; Mon, 21 Mar 2022 18:01:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6DEEF80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 18:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6DEEF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ieZcwx96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647882081; x=1679418081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PPP/f297uc23aUV4P5GLWxUjmFHBZQTVsYd98V2SbjM=;
 b=ieZcwx96orDxR7d2A5KxzMURsc8Y5Yk7oEwaDRLRL3Z14il0kdnV1bQ2
 A00LszM8zoo2v7fR6vi7r0IczsbSc1Z6KVsITaikDXPO1IYAnA5rqHiVp
 Fa/ock3BJJ+ppLl2W0bYcpMzxd71t8aTgP0eScvaalj8T+Tjgo6HemMNI
 7fHc5Pl6Zs1RsV7SMPYgHGgJfAZz5HF6v1hmu1Qb++yGW+UTqjlIQSzcT
 nrFYytBSLduchT4kY+wpuiZRjqMZI+4tu8yR9AyzJd6vgU+jbJX3z9SR6
 /BioChFUV9wUH1koxty6zkxfkyvUBFF3TPR8sSl35D3u7oUN2+SKojng5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="318311937"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="318311937"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="559954711"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 21 Mar 2022 10:01:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 10:01:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 21 Mar 2022 10:01:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 10:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJtyfPUcGeZo1VTBcAqM+VAQZUaZ0HSPErEY8m8HfjpRDu+ioPSv6/6hAIGFbh+zvy/EpuVRKKb5I+hPMotEF9+d3esewSU6f29+EcOT7rIc3KOAAW2ipabzo+4ssLA06tFYy2QSmtayzNQoKjk7n6rqt/mnNjSTgLryboLBKWel6dowInxl9DMikQ992sRPMD2m+j417nvTLA/3ZxoDOX68Oyej630y9YEcOo4XoLpBNMxwOhiVEfVBBd5dI7mY+c+XAwYsB12o2eoSkEEYrI/4LiVSw9GzmZXXDCvpBahgANwC68qDMMkauoBvlQW3Tko0EZCUgY6A19rFo+lyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVa5h8rUly8HZyTvlGhc9Qb2bjKcWZ7iOZpT17ZSUYE=;
 b=MYRC+F6QJFsUJ70EXLDLWqEdg0M+BOCeyLGaVy/Hqlv+CWcta+Cmj0mty73ycmLHMb9NFSOmwae4mSRwi8exWu6HlDJTgyx2uRpbVXpqmpfSEb3MMINxgkQl9SQuiAUwTYmi61xgPyH055Bl+VfApM8E+qF5eZpDBt1+oJl0U+G5LZRyGL2GGC7PPgxH6Z/9H/2a4Jj5lwFNO2WibgDw3/M3DtxVY4KOGCaPhArYvUImhVN5YI6zDbhweY+I7Cv8LpWm7p3QndP5QCE2tuBAf+FYmpt4i5yG98Q1kI3khLjrXbBGLDm4DEm7ieWoV28Rk4YuLNFhIFDAEA91HfzlFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN9PR11MB5324.namprd11.prod.outlook.com
 (2603:10b6:408:119::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 17:01:09 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 17:01:09 +0000
Message-ID: <7d87bda9-75aa-47e1-986e-cd2366a4636e@intel.com>
Date: Mon, 21 Mar 2022 18:01:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 08/13] ASoC: Intel: avs: Declare path and its components
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-9-cezary.rojewski@intel.com>
 <20d0c619-443f-b714-269a-0a71b5f09cef@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20d0c619-443f-b714-269a-0a71b5f09cef@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5b1f735-88b2-48d9-7154-08da0b5c6551
X-MS-TrafficTypeDiagnostic: BN9PR11MB5324:EE_
X-Microsoft-Antispam-PRVS: <BN9PR11MB532425E0CED38277FE7B5C38E3169@BN9PR11MB5324.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1AY0xvy3HqJ2uJoWbiLI+Ueke5W8vtLt6FTJpYmD3agkLrLRX9aCB+yqEKkwutsWKqM7I2Rt7WEmPWMZH4TR9Fszr5jL6PMWJrpIh17I73UM3raej8rIwZ3Ghmdbxf1MImVLLY12V7v7Xy7ONvlUsNdBTyTH9u/5QwAat/vJuwpDFulykzEiJmuo+RiP1rNUSJULjta5JGQnDlgWGuJeBuXBJUJRrTHBFjgYC7RklmjPsuTp7bGCeiJ29KFTerCC5G1UOoI0IrOyyytaKMUWKfmatwysrwXqWqANefpgQvqCo5VKEcDadRheFNwsFTTFQ+4FW1sdQ0M8esPUfNlt6KbyNYO4mTSGMP8s6aeKFv3J+rnKg2ipzar0uCREoStOgk30H8Mkg68ZYf3EsLASRdQTKUSSqj8XjHL+sMiR9KNQZKe2eqHCqANg3JNonfk2nbL+gNI7759CZOwK4I5x9eSbSh9NUzspzjgzCEj9smYuc/OoBe5CDUwBVP7pg1G4q1WB7AW31tKzwQ4TWa6t0SlPdPpEgO5M06fcUYN9ms12gMavTayMyPLpbzlUgWmMhGH7NOt0/vL0GCWneiSLXQB2+bBdGcGnTDFO8+qVk71WOVXDAlqNhlzdE89wJKzZJYiNAOD1twncLEX6jC7vpM+pyrzEPpHhq5s/EAVXSt91nDBHY3THmHRhDUCca620i+nzZbV3joKxxGCh2WOtdNQyV4YDZvkgyk2iEq4Ju93Qm+8lvaNmjWvu5lwRoAh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(31696002)(82960400001)(38100700002)(83380400001)(316002)(508600001)(6486002)(66556008)(66946007)(66476007)(4326008)(36756003)(8676002)(31686004)(186003)(53546011)(6512007)(2906002)(5660300002)(8936002)(2616005)(7416002)(44832011)(6506007)(6666004)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmE4M1ViRU5vdk1EREE2YjRKK0pYVHJXL3NqYy9pcEZFalZKZGNSZmNjUUxR?=
 =?utf-8?B?OEM1aTBQOGE3VGNZdTZQaFdsYk5UUUxlbkhvYUtQdWpXdHc1dmErcnlOdVlR?=
 =?utf-8?B?aGlKYXE5MVUxZ2VPQmZjRVFtblZlYmdHa2tZVE5Cbjl6eExtYzZVQSsrN2Qy?=
 =?utf-8?B?bU1kZmdGRFVJMlU4cC9ES0RBUzJ6K2w5a2cwRStFQklpWGQxZ2taZGZpVWpl?=
 =?utf-8?B?a3hZbUNObU5CVnNGSVI4L0JPWTJzMW9renlHeWZiVWtGVTlXY2x6b3psMkY5?=
 =?utf-8?B?enlQdzl4Q1MrbVV1K2FmWFdhbnJBWTBTRWFNc0R6Vzc5V0VKT0MydTRqaGlW?=
 =?utf-8?B?YzMzMmJwQUJhSGNydFJITDJ6aXArdEtQN2h1dXBvZ0Y5VWQ4MnFGUnI3UmVn?=
 =?utf-8?B?bUx6R2djNmFBS1NjRXF4dUR0eVBUVkw4RjkxYWg4ZFp5MjV5SkY3L1pjSVBE?=
 =?utf-8?B?b3pvL1RQUXdpbC9ML0xmVGczSzdFcUh1NDFDZU9icmNnbWZ2SXprVHBBT2Ji?=
 =?utf-8?B?YXVJZm01Y2lZOVJ6Zjk3YVRFbmthd3lRSFVwOG9TL1lQWFBhOEQyQlNqV1Ja?=
 =?utf-8?B?bmN3MFc3NlhxS2VFelNtU0g2ZEh4RlNpSkRVUDV1U1ZwZUwvVW9jcU1VcWlP?=
 =?utf-8?B?NTlmZ1dybVJSTnFlTFUvaFBXdXF6RzAwaGtpbUE2TUF5SnhMdXlZWTBucHVK?=
 =?utf-8?B?aFYxZkR4RTZXalNhR2Jhb2NxaytIL0RNOHlQbTkvSGlCQ0ZCUHdnK243STlk?=
 =?utf-8?B?K3FsWFlyYzE0TTlBaTdtSzlkSXFtd04wQkx1dWtBYlJDdjBrbFZpekdoRjdV?=
 =?utf-8?B?UFlXZnZLU0hWM0IrVm4zYnVmeWY2MCtrcFd0V0xxeDBiN1dmU0k0M1M0S3R3?=
 =?utf-8?B?dFZLR0F6N2tKV3BPVDlVcm5jRU5tdXRqcXNTSnFsQXd1UHFKOFd5SEkwSGRN?=
 =?utf-8?B?YURJY0NwNXJSRnptVmI5NTJ5Y0JSRVBwall2R0JPSG1UK2ZVMGNVNWg1RU13?=
 =?utf-8?B?TnAzeGMvOEtsTm8wZDZMc2dsU2RCSk1LWEp1OXBxRTJFdVJrK1E3cUdxemxL?=
 =?utf-8?B?Z1FwQ2Z5Ui8zWTFOc0pDUlhseDRqUWFuSmFvTUo5ZUZuWFl0WlBIeE1RQ2VZ?=
 =?utf-8?B?SFNRYzlZaVNhS1lRVnZwTGtickZGR0huRW9YVkJhTThNUlBDMlJsNWNydEZI?=
 =?utf-8?B?NE95dW1qSWw2bWFERlZtMzhieDRzbjNydzVZZ0NPS0tIZVdLd21DakxwSWhQ?=
 =?utf-8?B?TGhGTmJmSkY1eW1YV2lnK2Y4RlF5YlRsa0VhK1hadTA4MXpMZnArT0RxV2tB?=
 =?utf-8?B?SU1Kam81M0g0MDhQdkp2dUlSb3hDeS9jZGp6Q3FnZlpsMk9oRGMwd0F6cUxY?=
 =?utf-8?B?czE4WkdLbXEvQlhEOTRaS1hZbGJWcUsyKzdHK3ArSnUzVWFIWjZmQ0dqUTVs?=
 =?utf-8?B?N1FFaFFyaDBBYkp2dkR6Qm5pc21BOTFQNnNsSUo3WU9KMkZNVkV3Ri9hTUt1?=
 =?utf-8?B?ek1EekVVWVJVdEYvN054OW1uRFcvQ3NWb3MraS9EczBrajVPRGQrV2srdjJT?=
 =?utf-8?B?eEJWSkRnK3g1WHc1OGx6NXd4ak5xN1RuZWhLaGc4bnRlMFFrakhpalNRTFNX?=
 =?utf-8?B?TThXNmNGa2x5OWhNTXZtQ3QwbjQ3aFlFS1NDbmU2RjlmN2tkeUVxSXZKWVdw?=
 =?utf-8?B?dlRFTEcvS0xLbll6MEMwdi9wcXlCM2dJTDJlOS8zMmp3VTZaZ3FOZDZlVXZZ?=
 =?utf-8?B?VjBNV1dtMG1OUU1TUEpiV1l1QUFieWJVc3R6YUNiVmZGV0laYjRmZC9LQUY2?=
 =?utf-8?B?TUJYazVVVmN4MkVTc3JjRkkxazBQeGg4TVF1THM4T0lYUXBURlFyK0NBclpK?=
 =?utf-8?B?TVcxc2loekhTeE96eFhGV2gwZUxyU0N2T2htN1hGUEJDaEorUHZDcW1zcEg2?=
 =?utf-8?B?Q0RWclorZzhsdFRYajRYbEcrTUxVMjZyYlNyRG90Vis1UnEzKzdWblFFU3JV?=
 =?utf-8?B?YnBtZFhGODVRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b1f735-88b2-48d9-7154-08da0b5c6551
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:01:09.4048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkXYnhu7rW1o3wKukJ0iS4B0v5+azDLmA0r1QGJbr8gxuwyLVIuopBXgp9cPq0ci/gdsnMcqJ4UswAF9pYdeI5dNBLj3mQGt53FODjKQmAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
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

On 2022-02-25 8:25 PM, Pierre-Louis Bossart wrote:
> On 2/7/22 07:25, Cezary Rojewski wrote:
>> Declare representatives for all crucial elements which stream on ADSP
>> side is made of. That covers pipelines and modules subject which are
>> presented by struct avs_path_pipeline and avs_path_module respetively.
> 
> respectively

Ack.

>> While struct avs_path_binding and struct avs_path do not represent any
>> object on firmware side directly, they are needed to help track the
>> interconnections and membership of every pipeline and module created.
> 
>> +struct avs_path {
>> +	u32 dma_id;
> 
> that is very surprising...
> 
> This would seem to limit the concept of an avs path to a single host DMA
> channel, which somewhat contradicts that there can be multiple pipelines
> in the same path, or that a path can contain mixers.
> 
> And even if this is a single dma, what does this represent? the
> stream_tag? the BE DMA for SSP/DMIC?
> 
> Please clarify the concepts first, it's frustrating to discover this at
> patch 8.

A single path is tied to either FE or BE. So at most to a single, 
user-visible endpoint if it's FE. If there are more FEs, then we move to 
NxFE <-> 1xBE scenario. You can have many pipelines forming the path - 
most of the pipelines do not contain module connected to any gateway 
(HDA/SSP/DMIC etc.) anyway.

Yes, dma_id represents any DMA i.e. HDA stream (DMA), SSP port, DMIC 
fifo etc. And it's not a concept, it's just a member of a structure. 
Similar field exists in skylake-driver topology too (it's called "port").

>> +	struct list_head ppl_list;
>> +	u32 state;
>> +
>> +	struct avs_tplg_path *template;
>> +	struct avs_dev *owner;
>> +	/* device path management */
>> +	struct list_head node;
>> +};
> 
>> +struct avs_path_binding {
>> +	struct avs_path_module *source;
>> +	u8 source_pin;
>> +	struct avs_path_module *sink;
>> +	u8 sink_pin;
>> +
>> +	struct avs_tplg_binding *template;
> 
> I must admit not clearly seeing how the definitions of
> 'avs_path_binding' and 'avs_tplg_binding' are related.
> 
> 
> More specifically, having a template for something that directly
> connects a source to a sink is far from intuitive.

The IDs found within the topology file do not reflect the IDs that are 
going to be assigned dynamically during runtime streaming. We do not 
specify e.g.: pipeline id=8 is made of copier id=3 and copier id=7. 
Firmware has limited number of modules that can be instantiated per type 
so static assignment is a big no no.

>> +	struct avs_path_pipeline *owner;
>> +	/* pipeline bindings management */
>> +	struct list_head node;
>> +};
>> +
>> +#endif
