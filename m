Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E44A4AD543
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 11:03:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 964AA171D;
	Tue,  8 Feb 2022 11:02:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 964AA171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644314579;
	bh=cSAzJFZFRcb5c0w5HkJQ5+Iq1QSjH9i94O6TP6kteAQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PG4eOvf7Yrxu7c/kCeMKF9cTGKsnLQc3J2g6vUimEL6I8YP61Ijv/5MkiuoaDftc0
	 Xax+Ie7Qsb+Un3IFPhGnTj+jL9aSqKeRj+h7tFZPsPDn/6ng1OygA5QSBUXNY6MOMY
	 /pnU2GuM6IObtbC/e7KZREWJfHAIfXyOraxpup/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04DF8F80154;
	Tue,  8 Feb 2022 11:01:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A8AAF8013C; Tue,  8 Feb 2022 11:01:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD48BF800F0
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 11:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD48BF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HLgTkWoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644314507; x=1675850507;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cSAzJFZFRcb5c0w5HkJQ5+Iq1QSjH9i94O6TP6kteAQ=;
 b=HLgTkWoFKOFmWZuZSn+oSjt25REX6KjJr+6kDboY91Ce588iHsqLuv0u
 9360cWSDDz1WualNLM+BO7VvgnlQ7/Z1UxQyvWUCWHu7v5Cz0WKdFyCsh
 PErO7TO8+lULFBWjpAKAeKkgAjyjncDpqHXNqpS8TdsjuUmH1Qwynfv0v
 1mbzykWkJZLVduZKI5lJs02u5GVYmAmUAT70DvEP05eXPP6YrD2nMfYMn
 2t3ZRfZz4lwbxVf/SwQ8idYmbG1FmMjoP6ObumprZrXQBH3yFPt1Ywt/8
 1Y/Rxzrv+uBFN6leVFhxR0rHrgCOjNDCtOcum7FVTXRDn+PowK00N4qV7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248679862"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="248679862"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="540529750"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 08 Feb 2022 02:01:00 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 8 Feb 2022 02:01:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 8 Feb 2022 02:01:00 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 8 Feb 2022 02:01:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHp0AutIovncjfdrGSL2JzAmIE2o03024gCCCMFA0PHmWueTM+CqdmoaAiG9wV4iXSO+BHZ/IJSqA+B0a3YiGwag6+ke0OlEn5WbiaWodTJqigMUSat/kgqxhInqoAvfg2GHYevSQL+zClwaY+ENFkTnONzrCLrJCwQJMv3LgHTV/SYjXtbgW0xlPzwcj11N1o8q/RCKEq20NpBRNg1+AIWmrQQ/A4jP8JAaHF3b0tqvH9vLyOPFv/n+9MsBM+sRWA7PsHcu148SHhQJNMsBoCYy/vvgRaaZzMKj/YMOuJB/riugtyLEZnnu5lnU8GFYpnN344oEYlnbVrLWbgOUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hbxDy2R+NlEQ6lWu9+vUzTlUHl3rZupIMWOKWiZ868=;
 b=QgPTezIYmpEQqru4pmKNynyU0qeCwyTtJq2MBte/r2tg4JA4kH1ki57Jc5Z8iITs04dAT6eTRa+jzWaZG+nGRhjg64+hqLpaPDZhFbZ+MTrSvJfv9iGBGkiW7vTGEeR73I4u/y/UCXmNZ2FYdaifLNMhHwTgpWpLieLUHWxYH2ZG8jlYx59gXTBZFlJ4n+zBlnXmHjK98Z4Spr8E9D3/ePVUb9BLpfGrdnB9EDZL9T3xBDWFBOjUpUDGW7krj8ONRsaAfBsQ5oPPrpYqNFVaohT6f5x4GcRop8VfquEjV0NHPOXEQCvCRV0JNffeYdWuXWcMBIT2qyN8QuMbJ73y9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM4PR11MB5437.namprd11.prod.outlook.com
 (2603:10b6:5:398::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Tue, 8 Feb
 2022 10:00:59 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:00:59 +0000
Message-ID: <ccc9c1b7-bcf7-e2c8-35e9-0ad323c22fa6@intel.com>
Date: Tue, 8 Feb 2022 11:00:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 0/4] ALSA: hda: Expose codec organization functions
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <e609134a-a501-77fb-dcb8-60514d231d3d@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <e609134a-a501-77fb-dcb8-60514d231d3d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0136.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::21) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 480a1298-c96a-4195-4ed9-08d9eae9e7b2
X-MS-TrafficTypeDiagnostic: DM4PR11MB5437:EE_
X-Microsoft-Antispam-PRVS: <DM4PR11MB5437C937B78C4B3A2A3B0609E32D9@DM4PR11MB5437.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2Zydqe85jvuxgbbk0nczSKKuRIKOynPobM+jS5Y+R60NL+OwhW1rdJMDXM3ZRPYZYfTN+0uYY15437Ytwlc5Ld3jZiCsdxjCvtCssVw84J/Xnbu7bZ8XLv6kutnkFzLoLAU3+kxjnhK7vMSfD95hPdV8qoLhm8B/rh0lZYFRM08rbZ9Odyp/xM9Po8SGbQfP4bHSSSMdVKVq4L+p6PhwR2QzdR1704x7RhmF2YmVOuQzV82TPLQFRdse8Dk4+A5SWTUu5FlVwtDCSM1kQ8S+buqf0ZiDOrA+674an00RrExrax6VYsx54+k+1q5GE4jsLQYtfDUlzwZT8kOheIHosmCfdCBNkLjwCQpP0TkcuXzOdOydaxY+fomXj9mb1GNp9lNg8l9XUAfirnl67/8LuT6RVy3VdCS+zV0xTeMzfwLQokIPT4GTEuQsaNJCY3qCZZKG2TLKJnxf8FWBpj5guMq6K5Y5cgcc//RX7SFxCcJ4aS8oDTnTBvt95QO1vygEca4uKhctu7kbB6qF9KwVnnSUJGh/XHyFVAwC4uyQCGFuRCcoaBw1mUOrXb0ZtmYeFFzIaeA85v1ijKH8GYfn57E2Q1eS3VNaGrt8f5OP0aWCfgArw6zacQj7y2gEAjIVlmHcVk7OoKnAZRLJNMzsNjd0qPrrtAjhQ/mNZOC7+RKwAykwteqhap+CdBRDzSfGD9wN5NiNwMA8ZLFoYycNE1wfmGb7osSIChUjfn1jog=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(38100700002)(5660300002)(66946007)(86362001)(31696002)(53546011)(6666004)(316002)(44832011)(2906002)(6506007)(186003)(82960400001)(83380400001)(66476007)(4326008)(2616005)(66556008)(8936002)(6486002)(26005)(31686004)(508600001)(8676002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dThTQTRFMGhxTVFUY2cwUi9WeFBxRlQwTlBGc3BoM3FFeFJNelpTM3daSlJV?=
 =?utf-8?B?eXNjTjJLYjNDOURQVUEyQmpKbVdTVzBDN2hjZjFFYXZQRG0zMVQxaHUxZW1j?=
 =?utf-8?B?ZTkwT0c2R3A5Zy9VSm81WmNLNWpTNm1OcmFBaDUrS0sxeFlVWSs4bU16K2tC?=
 =?utf-8?B?SzNnVGtMNHFzY2praHNFcFEyNUVaNzNqelpLb1JXcjV2SHlDd0pFQU9JV0Zt?=
 =?utf-8?B?WVVRNnp4RllWYk9Vc3A2cHZPQy9QbnJNV1hCZGRDbG9GNTFOd2RHdXBTQW14?=
 =?utf-8?B?VEI0bGFDTWlVbERQRFJuVFoyckNrYVo1K25tSVA0WGgwMFVNSG5QWmU0aXc1?=
 =?utf-8?B?Yk1IOWoyWkkwTDlCWDJCeW5HNEl6T1hsWEthRFFmTWgvS1VRRTd6UEg3QTJG?=
 =?utf-8?B?aFBjT1BPV3NrSkhLMDZ4UU81UVRVdDdQQUsybmZwMURPbTY1Q09mU0E0aHBE?=
 =?utf-8?B?amJ1TzhQQkhUUENLMmduR2RYUXJkMDVkRDJ5UjNmSURsNTNlY2l0dVJ3RlU3?=
 =?utf-8?B?NzRzM2MrR2pxeWw4Z243eThuWDE3WG9YT3NIbkFKNjlZRjB1TUN2L0Z6amJB?=
 =?utf-8?B?ckJoeDhxeWUzVjd1eEJjRHVXblJvSUJjNTJkbEFPNFBBbDFSNXZtWGpQTFc1?=
 =?utf-8?B?VnVmdHVwT1A4S2ZUb0xqZ1RITW9QVVJKc1JUQ0NlL0RRWXNyUytnZDBhbmts?=
 =?utf-8?B?RHZrWXdJY2JwYzhrZkhId2tWaGxKV0U2L0p2QTRCQTVGVUFNcnFUdVZMeFRl?=
 =?utf-8?B?eHpFU2JuY3FsY3F6THBmMFNPalFneXZQUXBFd3cveXg2NVU0YnVONnhtKzF4?=
 =?utf-8?B?c0RMNDJKY0hGcjN3OHF3cWxsTnVOaEtqRFZYbzMxRVZqb2hheDBWL3ZFUVl4?=
 =?utf-8?B?elgyRXNITWplNmVDbWVFdWFOWENJZVBFQ2NiSUZDMHpNbU5iYUZ5V1BUOXBT?=
 =?utf-8?B?ZzVDbUVQQTRwMit5RXdvY2plT2dHR1c5VVZxV2FHS2wwY1FNNWtIa3RsWTh1?=
 =?utf-8?B?QTl2QUk4Y1FSV2w5VXdWbVg3N3ZsK1Z1K1ZvUU9iSk4rbk5lRlh6RFB1QjRB?=
 =?utf-8?B?NkNiblluSjBIVTczVEVBOWEyeUx4T3BQcUdEVTc0WTNVMVRDTzJSS09RK1ZD?=
 =?utf-8?B?V2ZVamFkSkNENGNFVFJ4SlFFQzBLVm04ZkhQWmZBWWF1VVptQ2pvcUhtN3VK?=
 =?utf-8?B?REVsUFpHZk54eEhtejdRVUZMWVhzcndFR3R2bTRhUkpSeXNOanUxbHEyemlB?=
 =?utf-8?B?alFEZ2hQUTMxMDVyVFVFTVgrbDU5Y0ZvTzJPNWJCQ0V4THJDN1MwZ3NDVlgv?=
 =?utf-8?B?azNnN3RoMWtlaFpWbFBaNUxMSGhyM3JzeFE3MnJieDVpZXA2UnJjbFpHSkZF?=
 =?utf-8?B?RC9uMnphdk9ydkduUTlKTnRnVDM2YnhCenZOdll4OUcreDNLaWw4S3NQQ1kz?=
 =?utf-8?B?NUxmcmhXdTlBWTU4NWgyVktGcE92OTNsRUpGYWVCQXBZcTZWVDQ4NER5MDRN?=
 =?utf-8?B?VTRjTkRyYW5HY3A5MDZocTVlVmJGSWhMeGdtRTU4bzE0ZnBvZ01rQit3Vk1D?=
 =?utf-8?B?Ym9HZ0NyNGQrTExZYlhrUFhDQTdYRXFtdnFvMnpUMmlZbDViM3d2NUwvVGlZ?=
 =?utf-8?B?NGp2T2VLclgybUkwSDhiRzJnM2hINk1rZGtaYUVTUm1BSklCMGt1YzlaOEdN?=
 =?utf-8?B?bTZxSi9vdzRTcktQOWxpVERNZlJmWDArNHBSY01rb0VNNm96NkN2cTBCSjc1?=
 =?utf-8?B?S0JZMkYzaDJoMzFOcUpJWjFjV1NId0h4ejZhbUpEUmgzck55SnhUWXgwS0Yr?=
 =?utf-8?B?UmkvaUlERXRoVitYbWtrRjZWRnpKWFhrOWRmbVJyaHVNZUgvZkNjWnQrU0RJ?=
 =?utf-8?B?RTFQSmN0aElQS0hzTGx6dnB5RmE1T0JBaWpUcm9ObmY4OUJxWGwyUHVQa3Yv?=
 =?utf-8?B?V3JkNWYrM2I4Qkt5djNra0x2WXpNUnRIV0RKMjFEMllEVUl2dkRVZTNRSVNn?=
 =?utf-8?B?MVVPdDFNQUVHRTVSZnJLVmcxdXc3TWJMWStZbmZTR0hmRDZQdm9JNTZPTnV3?=
 =?utf-8?B?TGZLaHRXY2U4Z0FHY24ySGJXZ2hRVVFwRGZVditqOGpXZUhnL0ZFY083d2lD?=
 =?utf-8?B?cytnRm5ORFdZYUJUK0FWdlVZaGFPT1hLb2ppWTFlTmRPd3RabGtuanNPYzVu?=
 =?utf-8?B?VndXY3ZXVFBQQWNCakUvNExLVVQwdTRKN1RKbHVERXR6Y1hNNFlBNlJDaDJP?=
 =?utf-8?B?dVM0TEk2bm5YN0NrVnlKNzhocmF3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 480a1298-c96a-4195-4ed9-08d9eae9e7b2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:00:58.7637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOydc2o+hLi76Nnl/LbPZY/Ss/Easc7TRs+LJqBfRE6xdPMYFb2vuzoq6+Q1HvOaQdEswP+LndOSiNA98qIUBegegDnXxNbdDcIOBCGZ+is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5437
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
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

On 2022-02-07 1:35 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 2/7/22 05:49, Cezary Rojewski wrote:
>> Changes expose several function that are currently unavailable for
>> HDA-DSP drivers for use. Those functions are:
>>
>> snd_hda_codec_cleanup_for_unbind()
>> snd_hda_codec_set_power_save()
>> snd_hda_codec_register()
>> snd_hda_codec_unregister()
>> snd_hda_codec_device_init()
> 
> 
> It would be useful to explain why a platform driver would need to make
> use of codec-management related routines, which would typically be
> needed only in a codec or machine driver, or hidden as part of a generic
> bus layer.
> 
> In addition, both the Skylake and SOF/HDA drivers make use of e.g.,
> snd_hdac_ext_bus_device_init(), what was wrong with this approach that's
> been used since 2018?

Thanks for chiming in! So, all HDA drivers currently available in ASoC 
are _assuming_ codec resources, they are not _reading_ them. To be 
efficient and only create DAIs and other components when needed, codec's 
->pcm_list_head need to be filled in with data before ASoC sound card 
can be fully enumerated.

Initialization routines for HDA device require pointer to instance of 
struct snd_card upfront whereas ASoC framework gives you such pointer 
only once all components are accounted for. Also, component granulation 
seen in ASoC causes need for adjustment for order of operations when 
registering/probing codec device to achieve correctness (resource wise) 
I'd mentioned above. We could have coded that logic ourselves but that's 
a duplication as the logic is already there.


Regards,
Czarek
