Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455984D64E3
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:47:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C691A23;
	Fri, 11 Mar 2022 16:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C691A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647013654;
	bh=3LCD1EgR6Ak73uv3dZAL3AaHQhWK9uwyN7Rtj6KOeBw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OO1yvXAZOg9ScXp76uSUeiE8xXvD6bWCFfHZMfEqb+YnEsH3z5OcEf5tdxtShKs2A
	 S+SzQBHnOdAC8/grxb0eOPCZgOKaSiS9wX9VglS8kHvrlkCdEAjb3z9/PbDWJr1TCL
	 xBD2AdbbrJzzohBcB8bkk7gPf2nosq3QlgEVsFZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F5F4F80227;
	Fri, 11 Mar 2022 16:46:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3844F801D8; Fri, 11 Mar 2022 16:46:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A58F80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A58F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RXOHn8nU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647013578; x=1678549578;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3LCD1EgR6Ak73uv3dZAL3AaHQhWK9uwyN7Rtj6KOeBw=;
 b=RXOHn8nUK/QxnC3TNGQQoEJrET2erV270KUpJX/JawsqGJIpNU21rTSa
 mJQy+JtyyJpu09WkKtVsnCYtJ0LpcWU4K+1/fdsh4S4Ih+ZpKhDx3tfe5
 7dLP9IPtvf85dTQBkPojnw/TihpRo/NtmZZ4oEMjYlpApXrJlxxaqPwMy
 TWPDbsale4HXYveMXV/fTRYHYzJ3qXtnCER63CmrbruDk8HWp1TufgaNv
 TRmrfXd4TXrD33SEkaQxN5iSmeapXEaYX5T0lPgy9rmxdzFzcmZby4mqB
 +GMy4ShIAGSM3do68xcyLIIvXd3iwr4HFH0C4UlhozKmLpsn3nh0oX4Q8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="342022348"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="342022348"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="555348845"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 11 Mar 2022 07:46:12 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Mar 2022 07:46:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 11 Mar 2022 07:46:11 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 11 Mar 2022 07:46:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDhuttqkk7lreWNSawKWb2nao5586WbdDOJg9hO9j0UF9ejH0cQF3s1V0RRaGJdOMa6dF+oB8Dp5u1sXHU+ZB4cZKHbJWJwb4klRY4AxiVUpmJGTCmQp9lzUxqqPyN4NIx9JZv3TCeoORDgrkXoNLiJ3HzdS9F+dYHREHflk4LnKQEiSEFkOmlFOr9q8kWKoQT/KbOBO9Wv5Z4fr6UdbiXAHlWLuqREdq+CeyfI/ACw8GFEAV/3CpY1woRKB1Z3l4/sqRYx44feuewGu7MQ0R1AuKFd749ugCk5xm7sENN8DYy98VphiJl2ovN0PVDphUcxXHVkmjyQFSO+dO5nYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShRskJ6lDc8/NiSbwLu6Kuyz/0gSdkBAc/BTgcSaIbI=;
 b=PWLD4M376V5IJjM+XJRhpYRibP7JLDYwQxogxA4aVJDi5IYKKU2hNILtSStajWNRA6nb7V1PHDjJl5oMrgsBoq4WU/2/UdZ5rbgpsx6mTtE7PkS9sufrwZaZS33ie/VjULZIP8vwEFUJVm4YVn+JaFVjUK8xz4N0TJw5WzmD5JOqMw/CEKaEqrOKoRm6x2OQM4lmZ1AP6Sk0Nb2LFL3DMHjAQLOZapPFNWGI75PMd7CassRgVurXNN8YZvKch4d25mdg5kyHEfvZfppu25qRLruqxFm6Q3FlAFy/uIEXSDOsdOQJzkQ9xpK17jbLEtUn1QfiQWEIK6tlC5bodh6Wew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SJ0PR11MB5597.namprd11.prod.outlook.com
 (2603:10b6:a03:300::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 15:46:09 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.030; Fri, 11 Mar 2022
 15:46:09 +0000
Message-ID: <05f38bf1-4400-354e-bfc6-636e602201f7@intel.com>
Date: Fri, 11 Mar 2022 16:46:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v4 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-12-cezary.rojewski@intel.com>
 <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0007.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::19) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87912b6d-c52e-44dc-764e-08da037642fb
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5597:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB55973739E0ED7A185BE97436E30C9@SJ0PR11MB5597.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SsLokUBozgcwImj8LioDQdDDDk1EXCuHL/1JeTLgCpfADhvK+SvFGPRXfLCJqbAQg185VKtp9XTppQgTl8qq0C4oLT5sTso+k2bxFbs8bfbwRvlEm50fECNwDKcY2cHMfxOjfEEtDzqGhUAZmP40RfhS2PNSV62NfBr1WMgRf4XSD0idCUNZL29rLy8RPbRh5+9WWBKD3UYnKRB2xGiDCT+rkk25JC9akeGEHyewpB2SlStsf2DuQUphDtOpeyw+QOyXvLpKVitOZiHeRs50f0xFxhfw5gdGsPYUwL/8Xzd8yPpQ8GybFIR6lgn4nG32/sS9WSA/ELlIk6riCCu0gM+I6LvGmBWTF6zKkuvnee8CojM9mGzhqGdOdvR7V99U3kB0B5nmgdvNcOupT4+RGn/+tvKYeGktVXeLlzXOpp7AqDXdjR+8xCb0j1Oz2k6P9pFlf4mYm0qIMSnEv216QjcK6RRr7X8TjMLcrAirJd+8YY8GolwrBDFrSbkJdrtaaO73rW1JOFZrf/1lLW3j2EVETK8SGG3+J7ekcZnNZDGMUVWcYG0XBwu0QwZNvYqIL3w/qwSld7IDeu+N5yOZnhvqX2n1dMLpK3TNS6GzEPVyZSH/x33E3wmZwPUg9GaEZlktUpM8jSt3JRvBJTvEsKh6zxDUkEFXiMtFTgTCKrj2whbArlo2oqmGXa9HG0c3MXzN7Eq785GaWieT5dcCJFUa01buPfsX2+PXS+7AO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(82960400001)(36756003)(186003)(2616005)(26005)(508600001)(53546011)(6486002)(6506007)(6666004)(6512007)(38100700002)(2906002)(31696002)(4326008)(66946007)(8676002)(66476007)(66556008)(8936002)(44832011)(83380400001)(7416002)(31686004)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXJITW4vL0w4aS83Q2dMT2hiUCtJNmJaNXVSVWhLSStUZDlYVnAxNUgyZWRX?=
 =?utf-8?B?TG1JUi9COTY0Q29rNGJoYXJXK083TFRMdFR4bW1Ud1h5Z1YvTmhaZ2x6KzdP?=
 =?utf-8?B?d2d6RHhmbVIwekhzR0Vla3lxVWtlbXpCekxDcmRsMU9NbEcrYkx2SDVVUHhC?=
 =?utf-8?B?blNGTVNrbGtQMFBFMFFSWk02d2NtOW15V1FnOW1mNWhJUGh6WEJ4QzZ4QVg5?=
 =?utf-8?B?RG9ySlcwZTJETWJveXYyRFpMSkpjMEFyYzhLRmFORzF0VlJnNXBDMnQzNWUw?=
 =?utf-8?B?NndJS2V2TEhkNkdCOEl0eGNqbDJpdkVNTTFSUHZRall0bEtjMXEzNnJDVXFL?=
 =?utf-8?B?TGwyK0haUEFVbU5tcWNFcmhzTXNiUTluVDJYdHdSM3A1WVloWElneFo2RnEx?=
 =?utf-8?B?OEhTVzdWdjRXeFUyVW91TlpVSXRGbUcwaFBBSkg0QXVKK2U2ZDNJYysvQ0xL?=
 =?utf-8?B?Rkp3YXROWm1MTXRoT2kvcHE0cXlWWEw3ZXBIQmtYd1FyZjF0ZG1IZ1ZDTGNn?=
 =?utf-8?B?QmxyMXg1NzhEenZBbTlWaGNJZUt5S1c3ZTZEUTIrTTB2QWttcXROT0dMQm9a?=
 =?utf-8?B?QjNyZW9aQXZTa1VXa0FodU56eUQySzI0VHF0TnAyR2wxTjRiLzEwcmpBaHJi?=
 =?utf-8?B?RW9hRHB5bnJpU2VVSk9oU21jOVcvRlJjcFJsMTYyd2hmb0w1RUw1Wlk0eHc1?=
 =?utf-8?B?V3VsNzU4RDZCcXhnbGRwMThnQzMvelM0T2RUVzd2alptdnozU0dPc0RjbFJr?=
 =?utf-8?B?SGVtOUhNTGZkMTZtSjdxK0kyTkVtNG1lSmtmcGp3VTk0M0I0Mm0vVWFsODBR?=
 =?utf-8?B?dzBONXM4Ym50NHRSdzRPR2NMV1F4dG9RRkZoSC9xRTJBSFVFaGx4MldrblVi?=
 =?utf-8?B?emc5MmJtbm4zQXN2b0Jsc3pMbXRTTVEvSmMxQlRQUlQwcVZhSytBemQ0UUd1?=
 =?utf-8?B?dlFpNDRnRGFvRVJ3cVFYNmRHZ1BUQVBVeWdkRW5yeGNjSU5HRk5NKzU0UlhB?=
 =?utf-8?B?K3J5SWxvTmNVWENTTEJ3d0xYMlJpK09tK282NXJ1UnVjZEdqLzdNMitzVXlr?=
 =?utf-8?B?Y3NLdEZneWJ0Z3BhUHZTNStobzBxSzRwWTN4clE1UW1Oa1VaR1VrbnRaYzVp?=
 =?utf-8?B?SEZ3c1pZMzh1aUlwWVMyNXYvampmOFVqWnlsVGtEZnVTTksrOEwrbE5zS3kw?=
 =?utf-8?B?UTFTNjVINExBSEpqNS9qaGZJUm0rTkpyd1RHbUVhdG9Obm9FU3FXOXlZckox?=
 =?utf-8?B?MWlDckFLeXpnVGNmTXR0OXJlNTRnak5DZENnWW9JaFAvRXovZ1hyZWx1L2Vt?=
 =?utf-8?B?M285TU8zTGNkZExJY0Uzck4wSHpUZ2RQVmFnOWxUMER3NFNnclNIMEV5V3A4?=
 =?utf-8?B?V056SkFUalpnZnlXVVhXSnVHcnJveXlDNTVqSnh4NVZOcFZSQ20rTWFiVDFD?=
 =?utf-8?B?TTM1bFV1WHVNcmszcU9tS2xGT1NRUXlBMEdZb3FZTWNxRFZrRWdCdy9xQ3pu?=
 =?utf-8?B?TDMvazJZTHNUUVVaV3p6VUk0elc3dWIrN1NqenZ2V2JmZXc4c280ME9rc3Z0?=
 =?utf-8?B?WVNMYzMwZW1UQUtLd013cWhtc3p0R2hoZ0E1QmxZYWVsWFQ5NlY2UC9RNEQx?=
 =?utf-8?B?dkZ3QXIzS2JaQ1ljbXhGREhCbUFLVkxBQzFPUWUwYWU2TU9vRHRjMi9KYU4y?=
 =?utf-8?B?enkzWC9tZDd4M2ZKMTNSMmRuU2EvZ3BuRWcvNEVJa2dCVFV2RTh1bVQ3cEtY?=
 =?utf-8?B?alcwWTlJWEk2UlVyci9wcDFJcGwwSHcvMS93Lzg0Q0pZSnorVzd6dDBobHE5?=
 =?utf-8?B?T3NwM3VRQXZ2QTh5SEdVTXhPK0tTOHM5bVhuUTVRdGtMUFNYeEFlV0NQcEls?=
 =?utf-8?B?cDYvMVJwWWpGNDg0anN2YXhET2s4bjA3OU91MWo3QmxxT3BrTlJ4SGs0QWYr?=
 =?utf-8?B?Y0RqNlBNa3d5WUo2cXF2L1UxQ3p6ajYxcmx2dFZHSFIrTzA1M1hlUnZhZEZY?=
 =?utf-8?B?NC85M2drY25nPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87912b6d-c52e-44dc-764e-08da037642fb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:46:09.3802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaF2ZYrlMD1tUUr0AZoVqtsdH1iCOnAzY+zaRYR5JRRfd8QblWPjcab+R33s5byStEAPwZvatHx1bNTk2Bqy3p3fCLm17Qtb1D6yqdILIo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5597
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
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

On 2022-03-09 11:36 PM, Pierre-Louis Bossart wrote:
> 
>>   /*
>>    * struct avs_dev - Intel HD-Audio driver data
>>    *
>>    * @dev: PCI device
>>    * @dsp_ba: DSP bar address
>>    * @spec: platform-specific descriptor
>> + * @fw_cfg: Firmware configuration, obtained through FW_CONFIG message
>> + * @hw_cfg: Hardware configuration, obtained through HW_CONFIG message
>> + * @mods_info: Available module-types, obtained through MODULES_INFO 
>> message
> 
> is this just for the base firmware? If this includes the extensions, how 
> are the module types defined?


Only base firmware is able to process MODULE_INFO getter. So, every time 
driver loads a library, this info gets updated internally on the 
firmware side. We make use of said getter to retrieve up-to-date 
information and cache in ->mods_info for later use. ->mods_info is a 
member of type struct avs_mods_info with each enter represented by 
struct avs_module_info. These are introduced with all the basefw runtime 
parameters.

>> + * @mod_idas: Module instance ID pool, one per module-type
>> + * @modres_mutex: For synchronizing any @mods_info updates
>> + * @ppl_ida: Pipeline instance ID pool
>> + * @fw_list: List of libraries loaded, including base firmware
>>    */
>>   struct avs_dev {
>>       struct hda_bus base;
>> @@ -68,6 +82,14 @@ struct avs_dev {
>>       const struct avs_spec *spec;
>>       struct avs_ipc *ipc;
>> +    struct avs_fw_cfg fw_cfg;
>> +    struct avs_hw_cfg hw_cfg;
>> +    struct avs_mods_info *mods_info;
>> +    struct ida **mod_idas;
>> +    struct mutex modres_mutex;
>> +    struct ida ppl_ida;
>> +    struct list_head fw_list;
>> +
>>       struct completion fw_ready;
>>   };

...

>> +    if (tocopy_count)
>> +        kfree(adev->mod_idas);
>> +    else
>> +        avs_module_ida_destroy(adev);
>> +
>> +    adev->mod_idas = ida_ptrs;
>> +    return 0;
>> +}
> 
>> +int avs_module_id_alloc(struct avs_dev *adev, u16 module_id)
>> +{
>> +    int ret, idx, max_id;
>> +
>> +    mutex_lock(&adev->modres_mutex);
>> +
>> +    idx = avs_module_id_entry_index(adev, module_id);
>> +    if (idx == -ENOENT) {
>> +        WARN(1, "invalid module id: %d", module_id);
> 
> dev_err() seems to be more than enough, why would you add a complete 
> call trace?
> 
>> +        ret = -EINVAL;
>> +        goto exit;
>> +    }
>> +    max_id = adev->mods_info->entries[idx].instance_max_count - 1;
>> +    ret = ida_alloc_max(adev->mod_idas[idx], max_id, GFP_KERNEL);
>> +exit:
>> +    mutex_unlock(&adev->modres_mutex);
>> +    return ret;
>> +}
>> +
>> +void avs_module_id_free(struct avs_dev *adev, u16 module_id, u8 
>> instance_id)
>> +{
>> +    int idx;
>> +
>> +    mutex_lock(&adev->modres_mutex);
>> +
>> +    idx = avs_module_id_entry_index(adev, module_id);
>> +    if (idx == -ENOENT) {
>> +        WARN(1, "invalid module id: %d", module_id);
> 
> same WARN is over-engineered.


Ack for both.


Regards,
Czarek
