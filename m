Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158004D351D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 18:08:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6101736;
	Wed,  9 Mar 2022 18:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6101736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646845692;
	bh=lMAo+uwupMVNDWGNoY4YKFA1tlTC8GUKGwBO91np3a8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i+/92NbQV7P1pSz8ewXhVePXkGqiu2G/Q3uTgDW/0lPI9Dvg6vUE7tvVR0oiYiXje
	 Ayuqm0q+xdQrwfZ7x4avPXlZcXZmAk+/LuPUGmhzva88hPH2lsf2zw+xlSHw5q9aug
	 DY/iO7Wpo/h1A8cBpNQN2wnlBW+9E8E5j9Qcsawk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10337F80158;
	Wed,  9 Mar 2022 18:07:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CB01F8016C; Wed,  9 Mar 2022 18:07:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 013B2F80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 18:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 013B2F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WbFfVhUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646845619; x=1678381619;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lMAo+uwupMVNDWGNoY4YKFA1tlTC8GUKGwBO91np3a8=;
 b=WbFfVhUb2KsMurTzkxxtXLETVgVy0RkIUSSrdb3D7HRg8845r/eWuIM0
 iHRdqZZ6hgDbnFt/4PDqyHHQX6wBlokcvP3gSq6gGXorEGbKe54uoJRj+
 p2hAQQvQaKj3n/Ls5OzVSN9mCu81E8jxTXp0HRBJo8mhP3rH3XhRURux4
 pxmWnH5Q4pt8UBK0BIbglqj7Tel+02Us4u47FaDTcWF1HZfWUiFHzLqSc
 fJocZCCNWvtCc5/o53eV1/V8mginhWwCaospjCuU1n7UOPfpHiBSJaml8
 OCUxlhNXgA/lh43HmF1zPbRkM64ub8aa/K4Q9k4aJ/pUnka0czYUZvD78 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="234983233"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="234983233"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 08:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="513596306"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 09 Mar 2022 08:59:28 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 08:59:28 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 08:59:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 08:59:27 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 08:59:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVBKR2mtlrh1rXtZ1WGz+xqxygEFuSGWt/xfEOwDodvZaWUCg4VFQpK1N9ZAnTmtT/0r+2yW9RjSOTIyI90dILHNvyeIQnCEdFvnTZjpc7W04ju2BX5cltbhQocDq7XQ1sbWLFucxeSFyCAGmKIlgw1IFx9oNuLSHk0YiIMlrL0LroZMXcmKa9MIea5FM0+rLdMjHctdAkzvzxbaMhUdsnj6g7yGDbmn9k7fXzpank3IMvvO8kDpc8OOoQlbgQ7HL9fKvMEpj235JPN1Oatj9XPFAqaKC0ojFqR11Oxeonn02bNpe08pdMeRpcVLyBSIG94S1oMIzr7efzOUBaTPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TRTux+IWDUGd2K2lz+YgoRvtxal3RskleiDiKNMgGQ=;
 b=KKhbRR3gqWKdyTSX7FYpsOlYTO+fSnLb7+7mZ06YVR6wEM2cxOSox2wcimXKQlKPaOLCgxHAkHqY4dK33Ic5c5YzsstbuUgf2GZHA8gubUFFq6/dtOE0gKElTcrXw10Sk+g3GEuLy07V6ZUu7k7BMj2kNjqef2dqR1lDJBrdH0+BegXC3jkIF+cmMARYkpaxoNS5iwB+3OZ7B+AOZf8ih16EfMXxzRGnYmPzfe/KJjUVDiAH2a/tJ0Zep6MeKCBp4Ejas1tU5OL4+5lTu+SYrGVVDJS8/zEAvrYiLuF0DII4grOvmOa4FzpXg2tgXO9FdkhQTVDDorwsN5sFysSp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MN2PR11MB4461.namprd11.prod.outlook.com
 (2603:10b6:208:192::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 16:59:25 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 16:59:25 +0000
Message-ID: <18986c3d-b31c-2361-049d-348779ccdf7f@intel.com>
Date: Wed, 9 Mar 2022 17:59:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH 05/20] ASoC: SOF: Intel: hda: report SSP link mask to
 machine driver
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
 <20220308192610.392950-6-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220308192610.392950-6-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0326.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::7) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62ba7548-d685-47a4-3c50-08da01ee2a3e
X-MS-TrafficTypeDiagnostic: MN2PR11MB4461:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB44614112970B302484B169CCE30A9@MN2PR11MB4461.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/hcWsTcSRlLBVLKLMSwmiYpBcA1TOz8iEW9vfVnhmJ+zvERyt4yzIZ1AC1ddSvostGx2E8c8OL5munrYdgLfwy75fZVE5xV6EFpJ3rOn4NbUWG0Dckhthfr3qDh+FAeQIRrk1RJ98Cvx7iCMXGQo/GgCQDCS6OnLs8alNvDwWC5CCd/8OW5JM+n8Ps9NFXJFAhrNp6MQTezMN2ANhmXFTbUnBwyI2HFrGr0Z4b1hiEOaJe2sZO6aydZvCLnqvM9GkkDCxPU8rYXLpqhmukGxVWo1+SymR5/ZG37XLuBIiqSPwAJNCmW6xQtJvno8Cx4IPdofjxYXn53tiYq2X459ti3Db+nL/4Nx+qTpDSEFPXjUmBE/RcXC9rM7+F57BpmA0lhjVcPL+CRxhR5SbPIElYSKGfBFAkn/ibVW4VQ3AoCOgrNgXwbmcUH6WAM0nOrm2XTgtqH/H8M8fm+l1gNnGm71W7mUmjq6DCSo9NRY1AeyNAiDCDkSSgk8LowoS35t76CkmBmaf+7hgBGlLjKYrPIdO/YSI+r2j4vwAcdqdcxW8EjmrjW4tF/rdxsXooY3IRun0+xeCfVrtCkALla51WWRLnCbaQ1fsrJk8C2WhUVrhU1L4EATmQM3prHOxEi6ZP5HsTUp0KUDl75yveCryWkhFCsaXjpERx7i3cF7q5MWDfHAZhn6AhQkjWAj3V0NoXAYp/+7AedtC11aBD8RBn8xe3r6lrzTeGIh7Cnz4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(316002)(6506007)(31696002)(508600001)(6486002)(6666004)(53546011)(2616005)(26005)(36756003)(186003)(83380400001)(31686004)(6512007)(66476007)(66946007)(66556008)(82960400001)(4326008)(8676002)(38100700002)(2906002)(8936002)(5660300002)(44832011)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFNpcnQ3aWJmMmlVL0lxUzZEN2kvQ2l6ays0b1VEeGtFTGJNUUNQcUdRODRI?=
 =?utf-8?B?K2x5SkhjMEJuMVpsQW1YbnVsalJVUWFMYTNXeUJGR2hJOGs4QmVLWVhHMVpL?=
 =?utf-8?B?ak9SRlEzSVRXL096V2FqcDJ6c291QVpaN2Y4NHA0OWJxRzJ4WjY1NkZLamg4?=
 =?utf-8?B?N2VWTW83b1d4S2lXNmMxSGtZMnRiM0JBL0tIQXRXME5kVkJMbkZucWJXc3lV?=
 =?utf-8?B?MTdUOVdpNVlhb2VGSWtVSmQ4a3FmbDVmSjFMWkhYY01UZkM3cGVVSjJMS29p?=
 =?utf-8?B?WTNTUXFEYkhOaFNlS0V0Mm1MUTZ5b3FEWEV3WlFCYnNEWUdkWkVLeTJqSVNa?=
 =?utf-8?B?VEJEUHhrVnV0UkI1S0Zxb3c0QXNzeEFlSUFxaW56bDcwRXROU3dtVklVSlNG?=
 =?utf-8?B?KzRCVmVDd3BzZzhvUjdpZ0FnTm5HbDJqY2xWK3psMHN6M1VMQ3p4SFJvNU43?=
 =?utf-8?B?Qm1jMWh1Yi9KQWRiT0xXVTRMLy9scGdHK1lXSnM0Wk1zVEI1WG9RNUxpdEZx?=
 =?utf-8?B?LzdjRXZpbkRuSmZpczdGaDdHRkxiK3RadEN6dUFxMVdET0hXZThIWG1LOUwv?=
 =?utf-8?B?eHAzWGplR29HWFBrSDFMUWIrL2pzQW81bnlMQk02dUVNdUN1QlJHRjk1blph?=
 =?utf-8?B?Y3pLZEd0OGhVeWdTTXA3dFZKUUNqN2w5OGM0Rkk1YTcvcmpRWW9ZY1FTWUxO?=
 =?utf-8?B?YkNCL1Z5VTJHaTdNdEk4V0l2RWg5TzFqeHRJZ1U4YytXbnlEWnh4VGpVYlB1?=
 =?utf-8?B?UGtNajEyaEFkWVo4dlYwS291Z0pBT3h5Ymd1M3JmejVyYjlQYnBtN0EwbHJC?=
 =?utf-8?B?cWdtSGpta3hWRTVMN0ZqQytManhRODNCZHlIaUxrVjkrSGVYSkp2YzdvN2dy?=
 =?utf-8?B?UWx2Ri9obzFYbnhGNWR1NmhBS3ZlZUMvU0ZuYUxoMkVhVWs3M0pFdDVIRDlU?=
 =?utf-8?B?NDcwK041R205Vmg5WDErQms4andBWXpwNTNCWElsQ0pJaE9IaktXNUpreUJB?=
 =?utf-8?B?bFRMaFRDUGMvWFJ3UkZHRTljZEVBTkxLTU1FRkFjdGdSb2x4MC9hZ1JWUGs3?=
 =?utf-8?B?UTJhallMcjNWeTBwQnBwQk9sMXlNeFhKNncyemVRNU1QWmc3TGx2OUM5M2Jz?=
 =?utf-8?B?TXZTdHhLbmZVZHY1Mjh5OGx1ajYySzhyWXd1OVFxdXQyeWd6OXZjd0ZmRGxa?=
 =?utf-8?B?eW1hSGpvN09TYmxWK0wxd05PTFZNcjBNdTJkOGJwa3FHaEN3am44Y0U5a3Q0?=
 =?utf-8?B?Y242ZEtsdnZjMkVCNHBwR2hNcjdKdUtXazhiTkZXRnNDNmYzZTVwRDBOUSts?=
 =?utf-8?B?UWY5ZGUzRnE2TVdOMXRwam0zeDBRd1dueWZjb3FYTm85UW80WFpMWVVJNm1E?=
 =?utf-8?B?OGQ4alF6V1VGNDlZMXhwUDJTc2VWTUNUcHJKMGRGTmxmNytEN1RNZWpsRUVy?=
 =?utf-8?B?ZlRkbVcwR0pzaUlEbWJyb0U4RHozRmpGWEJyeFZPK09PTDVSL0Z5SXpkZGlG?=
 =?utf-8?B?OWp3bktPWXl4RXpzcUlCbERjTHkycC9jdW9Ob21ZYnJPem9VRS96WnFGQzk3?=
 =?utf-8?B?NlJJblN5RGlYYWFqemhzRk9IZGZrYWJkeG8wYzhUUlpYdWJMSDNXbkx2NlFK?=
 =?utf-8?B?RUw3b1U4aFBMMlRLeUhNZHBaWEdXTE5GS2NoMjhVbkxWRWUxbnY3QVM4MU8y?=
 =?utf-8?B?SjJzaWRhLzVETjZ4TEZJeUdmYTF4Ti9XOFN5U2Q0UHNiVTlxM3BHa0xjamlO?=
 =?utf-8?B?ZVdpOUtUNUhFU0VrRlZuSzBOS2pBQ2JNdGhtYjN4RUZnRjNDdno5WnhJV1lY?=
 =?utf-8?B?V2FjY1NzbVlxTzViZ2ZLNHZySHVreENWWlI2SkIzOHhUdGFwM2RtOE8yZUE4?=
 =?utf-8?B?dFZmdUVKWVRDY1YxMEFSRElBSVJIL3F1K1lGRVAreUFHY3I4VEVEY21aV3Ru?=
 =?utf-8?B?RWxNUWQxamVwaG4vRkxqUUc1dXNIWkFKM3JKcVRWNHNYaTh3cTFwU1FndnVM?=
 =?utf-8?B?M2JGWVczVFJMVVBqbjJQY3VHYU8wNm4xUlh3dGdYcldNTS9UQ21yMDVTS3M1?=
 =?utf-8?B?MnNvU3FuaE0wN3VURUd5cFhoL1NNK24rdnExUU5UYk9xRnE4Zkp4QzlzMHQ4?=
 =?utf-8?B?dzdNb1RXSk95RHZIOGtyWUt1OUkvSmFKT2h4K1U0dTl5V2lnMVFMbE9Vc2VQ?=
 =?utf-8?B?R2JKV0J2MjhsVDk4cFhJcE5jaW5VRTZKd3VQNEFiQzRVNzhYMEtLdVN3c0hn?=
 =?utf-8?Q?kp2JML6uXmrTWT451NnerIQmsC3YJwMAS2FNpVUpqs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ba7548-d685-47a4-3c50-08da01ee2a3e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 16:59:25.1724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3xpX8koIf9e46aQr7/PEShB4yX+wlyiQTPd21bNwTQ9A5d/arRPyIx9NsHsrCtvoeawFC1Xj067gwhfEhYRHz/IFWFq14Bg0bmKxV809gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4461
X-OriginatorOrg: intel.com
Cc: Huajun Li <huajun.li@intel.com>, tiwai@suse.de,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 2022-03-08 8:25 PM, Pierre-Louis Bossart wrote:
> For devices designed for Windows, the SSP information should be listed
> in the NHLT, and when present can be used to set quirks automatically
> in the machine driver.
> 
> The NHLT information exposes BT and analog audio connections
> separately, for now we are only interested in the analog audio parts.
> 
> The use of dev_info() for the SSP mask is intentional so that we can
> immediately flag devices with an ES8336 codec. Since NHLT is not used
> for recent Chromebooks these messages should be rare.


...

> +static int check_nhlt_ssp_mask(struct snd_sof_dev *sdev)
> +{
> +	struct nhlt_acpi_table *nhlt;
> +	int ssp_mask = 0;
> +
> +	nhlt = intel_nhlt_init(sdev->dev);
> +	if (!nhlt)
> +		return ssp_mask;
> +
> +	if (intel_nhlt_has_endpoint_type(nhlt, NHLT_LINK_SSP)) {
> +		ssp_mask = intel_nhlt_ssp_endpoint_mask(nhlt, NHLT_DEVICE_I2S);
> +		if (ssp_mask)
> +			dev_info(sdev->dev, "NHLT_DEVICE_I2S detected, ssp_mask %#x\n", ssp_mask);
> +	}
> +	intel_nhlt_free(nhlt);


NHLT "toggling" found in this function looks weird. Why not cache NHLT 
pointer i.e.: get it once and put when driver is no longer required? 
Initializing and freeing NHLT (AKA get/put ACPI table) every time a 
request is made does not look like an optimal solution.

> +	return ssp_mask;
> +}
> +
