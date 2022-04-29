Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF72514C28
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 16:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9743829;
	Fri, 29 Apr 2022 16:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9743829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651240992;
	bh=Tfn8QX+qEvkQUBxaiFOgVK8cr9LU9E0+kfM8JpYO9FY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EwNY4As9M0qyY8IOXJM1Q2QlCOoykdcDcAs2r91YJPjEbOCg3L0xt8Ox1TBtmS4Zv
	 yFsuE0BuxjtjokZvuTXjsRnuqNXoElqPgyrHGlIT/nNjXZJftiGoVvavSm/NzCkFFA
	 zqvHVYnWU/pkI42kU2fhq8yDhBjdQfUtLu6A3Ipw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B6D8F80269;
	Fri, 29 Apr 2022 16:02:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9571DF8025D; Fri, 29 Apr 2022 16:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00385F8007E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 16:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00385F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kql/brOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651240929; x=1682776929;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tfn8QX+qEvkQUBxaiFOgVK8cr9LU9E0+kfM8JpYO9FY=;
 b=kql/brOLuiE0eAKa3VNFvJ/s7gAlqqOlRRcemRZuefrDwPq7gt5QaJY1
 Z8oCbD5SfFiB5qmAqa5rfbd15eUYqC8hp2fVhRh1FAHVihSFx4P44z/1t
 31k5XwhGhvo4BOpPbAL6c1m25ZCKYMN8Q5qMkuCWYbFH1OVFjb7Ys+MCh
 y85wNlG9kTVAHMEZLI8sil7AZhj0bHXrc3zdLJF17vX3VyDtsFecdpAKe
 z/biih4dfIlTv6QLWDtsSRDq23lVHRQM423Uzh4HsuJdctwrCafa0dyHB
 FUG7LwZ5p52Z4mfg0auyy3kBxYMRuZsKtanyzBqzztNhqjAOJSOpD7LTZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="353080996"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="353080996"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="582138635"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 29 Apr 2022 07:01:31 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 07:01:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 07:01:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 07:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiVEErYIHoHcB/wbLxv8L5P67voqCyGAs1Nd7WZSOdkzuHoZYz6N5IgEbYTLLaw9TTs/Xvbb2OlTOilyrxnkWHaT6HG9+/3mL9TdJY8NEhtM4IimMNexbm0Bj5DEJaFIsyhNdu+SAAUQTytjxlT/h83m454okDVcYN1oN0+4K4jw+zffhaMhz2cDEwCro1F6hdn17BGqaOqY6Lx83dABXuBLQLm4Ipoju2EESP/d2Ev58P8N3n3lTTd1IUHrHQbf9IUMvz7frl2S5d1B4HRkz/7volKda20vA460hYyZIsMtzc7hfI6NF7U7paSgnlRZ/JDlQiqEQBmD3bBiDYLqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSB4MNAE5Vr+cKTW0AsgKkJZeA+DTUyCHqiuqdDBw1w=;
 b=P2HcOovbFe/KIBxtG3z+ypQa/3Kb9A0HiHooFLL9nuVANU4wI6pB9tV/ykaRYIU6esZGKHSi43H2iSgYEn+9uetEWvINS/SaePwcdkUgKLyYzzkaL6e9mLhlgTnnYuYbTtpx1Pt0IjUdPDGi7UdbdpegiOx8tTI1SLPySb+8MLJ3g6w50WbEB8hP1s1Zlbw1cMw14QN+IJrX2DdZVk6k58y4KjD+ZmEwwxMVLtENnpqEHkgXejtvb1iJ+qKWQLttQqsYBHEnig3VT9h4ekL2w7aN01N/q2yPuL/gI1YL+lg5KTPY5zjLA8YEc+MSuWQKxXrd35i3boSO22v48bC7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CY4PR11MB1848.namprd11.prod.outlook.com
 (2603:10b6:903:123::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 14:01:28 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.023; Fri, 29 Apr
 2022 14:01:28 +0000
Message-ID: <f1607df1-a8de-f26c-fbdb-be4bfba899eb@intel.com>
Date: Fri, 29 Apr 2022 16:01:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 10/14] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-11-cezary.rojewski@intel.com>
 <2cda9e60-483b-6866-7ad5-787e43c25824@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2cda9e60-483b-6866-7ad5-787e43c25824@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0452.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::32) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26a70d14-ec3e-4c07-bb89-08da29e8c15b
X-MS-TrafficTypeDiagnostic: CY4PR11MB1848:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB184863F4634BCBCE3E4A7B23E3FC9@CY4PR11MB1848.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BanioTCgtKxDUavIHR810B4nQfmeh2cLgs8np8GpWlSDZMD7GhkzLg99B+BSvIp9vCWTG5hil5ATLZS94PIshXTXybm0M2K8ZX3CCOfN0PVxk/bdnxqu4bmqfKFdH1zs9ZiDjfNDDIHOluEZ/wmk/2PPmLZuokFB8QRo7XCdvrNlxH0YS5eote2lPJxL2Z+qDi6Pv+uDWEqtEuP8PU/zU7rMEooInDV8EDZ1jaREY72q2Qm640iVFQ53M26xp9cjB2Ao/5N5nTNtPAAHmdHvT3qselGh9u6X8ukvFlGftf8DvARcPxPjKxcUD21PTvJI5JN06eago8aWRN14/kxO/Rlxuds+G7q1/CsedjjdhA/DMxgF0StLlcpG04IF5X5VL4wzmrRfF9728wa8aU8PsfkGCfjZMyxLUvxOB+tTZusJmCiGVM4Vq6gXHXNjp37S7+9+Ma74VPFJIVUVeY4lSduEgV+jVCIykTrHz+FgzYaucRxZuZzg1So2Rter1AIlkmoEULtNNnQJZxtHXW8tO6WhjWitXwURDZguAFc4KLZlDCB4KNtVngWhQzLg2dU3q4fDv3thINv6PB2ADYFhISsWhPN/rtwxc4z0OLDDfGd0zredkEoapkRpRQ62tq6X/PPWFeiMLEfMXf8rTcft7xiDg9bnFu6y3tFRdUDeXndbQerGDNq2+IbN6yIaeHbcWk28CpabjGtZ4FHc5akUX4NLYALwgjdKIldb9wZLcsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(5660300002)(8936002)(4326008)(44832011)(7416002)(36756003)(316002)(6666004)(508600001)(6512007)(53546011)(6486002)(31686004)(6506007)(26005)(66556008)(2906002)(66946007)(66476007)(86362001)(186003)(2616005)(83380400001)(38100700002)(82960400001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkJtR0FvWGd5VzdVaFdWZHVjOWxkWWFvdEJpOXFRdlY1KzFleE9uMGc2K3BM?=
 =?utf-8?B?dHc3anFsWGt2MHV0aXJxam1xbk1TRGl3a1d3TEU3OGY4Rmd6eGlLK0pwUGtM?=
 =?utf-8?B?VE1tNXBZRWJ5QVhKMlpnZVppbzVyYnU5RGhYNjdBbStZK1Yzai93b0FOVlhP?=
 =?utf-8?B?Vjk0d1ZYKzFpYmtDNkRHMmdEQW5ZUmFucTRJQ2g2UDU4dmx5RzhUaTlGZWFO?=
 =?utf-8?B?cDJRUE0wdG5PZnhlNXRDeDBHeWpyTmc5dlMxQ3owLy80WGQ3N0pQQmNoeTFy?=
 =?utf-8?B?N0VVbHVoMFFMZVZUWVd2aTMxdXpIS2hMUXZGOGhPQXYrRFNvMWxyeVVXcUZn?=
 =?utf-8?B?elV4NTRwbDNNZTY2dG5ZUjVWV2ZIRkt1SkdmYmRIVDV1STFGRFh4ZzFjTVJj?=
 =?utf-8?B?VUJiYk9WbEtoaFNGcXlZNVlTeUNBcUtvUmRZUGhmRVBRaWthRkozYUswZkht?=
 =?utf-8?B?aFQxSFpzOElTcUo0UjlTZkhRTllseTRrMDBFalByd1loZnFjcVRxeFpWMmM4?=
 =?utf-8?B?OXZCeEVZanBLNC9tNnRadVl4U3Y2WVNqVm5BZ0JhUGlDYWt6K2gvTDJSK0pl?=
 =?utf-8?B?U2FtVUg3UjNLRmpiZzVnei9Pa0wvZ1dGTVAzUGtxVmlXTmEyUDUvSGtDRlEx?=
 =?utf-8?B?cmxoaWFrOWQxcHpCS0o3cGVZNmxSdGxwYkhRUXprWjI1b3FKSXhXd2VtN1JD?=
 =?utf-8?B?bkp2TDNOVlRQMkFUVXFaS0w5bmM4UUtueTJhTjhGWGExc0pqdlRYOWg4M2Mz?=
 =?utf-8?B?YkFpZXNLUzVzRjNnRElrSkNVa2trczJqV01tMWdGYk9tSGhHQ2FDTGRqQkxy?=
 =?utf-8?B?MExFRFBFMkloOXFBNlFWTGQ3TlNLbXlCZnFrd2dEbkl2TEMvaWZkTzI2bnhl?=
 =?utf-8?B?R0FpRTlGeWNFT3F4QStJckpBRUZVbnpLTklWdS9JZHJKT2JxSm1IaTk3T1pq?=
 =?utf-8?B?aHRNSllHTnlFM2U5cGVMRCtpYkt2eGR1Vjkvbmd2UXBUT2JNUnZUNFBrcHZX?=
 =?utf-8?B?M2lyTldqWjZwS1BFV1M0bDVXTmlsekR5TkxDUHdtMmp4RGFwcldTdDE0Vk1C?=
 =?utf-8?B?bGdxQjF3M1V1aWdoc2tKbi9OVXdxeUdBanlrdm0vOXFzV1ZqK2JNeThYb1pF?=
 =?utf-8?B?c2JTelRMb3pzcHpSTTA3TnVuNjBlN0tuR1liZkYxcS9nRlVaQXIxckh0ZSt4?=
 =?utf-8?B?eloyR0IvUjcveHdZTVRsdEhmWFNvWjBUOGVVZDFrWnpZSnB0Zk14SHlpRW9t?=
 =?utf-8?B?OXlDbVhBb0Z0N2E0K0t3Q1lFS20rcm1IKzdiSXFjQXVOVXR6WWM4NG9heFJ1?=
 =?utf-8?B?djZuVHlNcWt0WFU2Y0prR21sOURRcUkwS0NEVVR3NGl1bWJSRkxhaFVnRDRT?=
 =?utf-8?B?b0Nrb1drSytNRlIzRWdKWEFtUVJldm1kRnVGSzVwRmx3TVQxSnp6UGJIR0FK?=
 =?utf-8?B?TlV1aEVvYTVHTDlUNlZWL1JPMWEzVTlqRE00OFFQWWZWZnhJTU56ejNMaFhM?=
 =?utf-8?B?RDIvclJsdlVWL29yNlRHTE5FSU9pZmJVZmVkQks5dUJIRnBGeWhQUGhsbU5L?=
 =?utf-8?B?ZUtublBsdDFVamh1YWtyWUh4ck5LUjlEcm1TUHZ3OVlGekVIOE92ZnVHaGhh?=
 =?utf-8?B?NnBZYXNDSmlzVVBPY09mOEswaHBSSUdEVFAzNjIwaHhCU1p4TjNweG5FVkJC?=
 =?utf-8?B?S1BBQkRoVWkxeW5uRExqcDEyUmhBaGozU25URm9Xb1JyM3BkQ2ZyaVppNHRp?=
 =?utf-8?B?ZWhLM1g4TWhXdUFPVUlVMDN1YnhTUTg1TXN3Slo0ODBFa0g4czY5SDJNMmlj?=
 =?utf-8?B?ZDhJa2tWYlp3RGtzaGFFSFdIU1czcDJvUGw2WFF2TUlSdDJSam9XVG5BSTZS?=
 =?utf-8?B?eUxDY1FtWnN3MG55OXpMUzdOWTdabVphUkZrdWZtS1pSaDBxVmNqdUxDQlZ5?=
 =?utf-8?B?ekxJRFRTYW1FOHN1M2lXLzZZc09kT1dWU0Jpd2cvL3RyaGpjRCtoQm9Ra1c2?=
 =?utf-8?B?WUlKOHVHVWVhMzhPM3NVMXQveUhrZHRHZjVNemE0cU5TRU5MRDZoeVJHajNr?=
 =?utf-8?B?bFRrb3B1Tzg0U2tYUjVCaFdjcHhueVVjZENNYXc1Q2Q0UFpwdnVmL1ZZblZ0?=
 =?utf-8?B?ejZ0dWJBV2lzVWlzWC9pZEJYdWwyY0pFM0d1bU0wTVEwampqTkVvWWhTV0E3?=
 =?utf-8?B?Z2hhcTFSU0lZNitlNEN2enhGS1VleHFyd1NyMGJOTm82MTlIUzNoRVNTeTNi?=
 =?utf-8?B?VXk4YkhGdFZqVW5sdXVzY3JQV1pEMUFDeHo3Zks1dWxlVVVCV0pteVBBdS95?=
 =?utf-8?B?RitSTTJQRm92QitCazBDZHdhL2V4V3FwczZFcG4vdDRybG84YUZ4MUpoazB3?=
 =?utf-8?Q?VVe8lWDwteudCgZs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a70d14-ec3e-4c07-bb89-08da29e8c15b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 14:01:28.1699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrlkQX5KvQUmsKepupoY4ghJiEGvWqnaqIF/I21dUTbPyIH5lgGROM3qKjU35okkrq8A58LSKt4tceTsr6/wbw34ldc1Kkmq3cUU1Zej3HM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1848
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
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

On 2022-04-27 12:12 AM, Pierre-Louis Bossart wrote:
> On 4/26/22 12:23, Cezary Rojewski wrote:
>> AVS driver operates with granular audio card division in mind.
>> Super-card approach (e.g.: I2S, DMIC and HDA DAIs combined) is
>> deprecated in favour of individual cards - one per each device. This
>> provides necessary dynamism, especially for configurations with number
>> of codecs present and makes it easier to survive auxiliary devices
>> failures - one card failing to probe does not prevent others from
>> succeeding.
>>
>> All boards spawned by AVS are unregistered on ->remove(). This includes
>> dummy codecs such as DMIC.
>>
>> As all machine boards found in sound/soc/intel/boards are irreversibly
>> tied to 'super-card' approach, new boards are going to be introduced.
>> This temporarily increases number of boards available under /intel
>> directory until skylake-driver becomes deprecated and removed.
> 
> I thought you wanted your own directory for cards, what's the point of adding new machine drivers in intel/boards if they ONLY work with your AVS driver?
> 
> Also you can only remove the machine drivers that are NOT shared with SOF...


Yes, if something is being actively used even once skylake-driver is 
removed, it will stay there. No worries. I recommend moving SOF-specific 
boards into /sof/intel/boards/ though - it feels logical to have 
driver-specific boards within driver-specific folder as very limited 
number of boards, if any, are "common" here.

I've provided board-related patchset on the list simultaneously so 
people can see the full picture.

>> +static struct snd_soc_acpi_mach *dmi_match_quirk(void *arg)
>> +{
>> +	struct snd_soc_acpi_mach *mach = arg;
>> +	const struct dmi_system_id *dmi_id;
>> +	struct dmi_system_id *dmi_table;
>> +
>> +	if (mach->quirk_data == NULL)
>> +		return mach;
>> +
>> +	dmi_table = (struct dmi_system_id *)mach->quirk_data;
>> +
>> +	dmi_id = dmi_first_match(dmi_table);
>> +	if (!dmi_id)
>> +		return NULL;
>> +
>> +	return mach;
>> +}
>> +
>> +#define AVS_SSP(x)		(BIT(x))
>> +#define AVS_SSP_RANGE(a, b)	(GENMASK(b, a))
>> +
>> +/* supported I2S board codec configurations */
>> +static struct snd_soc_acpi_mach avs_skl_i2s_machines[] = {
>> +	{
>> +		.id = "INT343A",
>> +		.drv_name = "avs_rt286",
>> +		.link_mask = AVS_SSP(0),
> 
> I've told this before, 'link_mask' was introduced for *SoundWire*. Please do not overload existing concepts and use this instead:
> 
> @i2s_link_mask: I2S/TDM links enabled on the board


Noooo :( Sad panda is sad.

'link_mask' is such a wonderful name as it matches naming used in our 
specs - which call BE side 'LINK'.

If it's a must then yes, we will resign from using 'link_mask'.

>> +		.tplg_filename = "skl-rt286-tplg.bin",
>> +	},
>> +	{
>> +		.id = "10508825",
>> +		.drv_name = "avs_nau8825",
>> +		.link_mask = AVS_SSP(1),
>> +		.tplg_filename = "skl-nau8825-tplg.bin",
>> +	},
>> +	{
>> +		.id = "INT343B",
>> +		.drv_name = "avs_ssm4567",
>> +		.link_mask = AVS_SSP(0),
>> +		.tplg_filename = "skl-ssm4567-tplg.bin",
>> +	},
>> +	{
>> +		.id = "MX98357A",
>> +		.drv_name = "avs_max98357a",
>> +		.link_mask = AVS_SSP(0),
>> +		.tplg_filename = "skl-max98357a-tplg.bin",
>> +	},
>> +	{},
>> +};
>> +
>> +static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
>> +	{
>> +		.id = "INT343A",
>> +		.drv_name = "avs_rt286",
>> +		.link_mask = AVS_SSP(0),
>> +		.quirk_data = &kbl_dmi_table,
>> +		.machine_quirk = dmi_match_quirk,
>> +		.tplg_filename = "kbl-rt286-tplg.bin",
>> +	},
>> +	{
>> +		.id = "INT343A",
>> +		.drv_name = "avs_rt298",
>> +		.link_mask = AVS_SSP(0),
>> +		.quirk_data = &kbl_r_dmi_table,
>> +		.machine_quirk = dmi_match_quirk,
>> +		.tplg_filename = "kblr-rt298-tplg.bin",
>> +	},
>> +	{
>> +		.id = "MX98373",
>> +		.drv_name = "avs_max98373",
>> +		.link_mask = AVS_SSP(0),
>> +		.tplg_filename = "kbl-max98373-tplg.bin",
>> +	},
>> +	{
>> +		.id = "DLGS7219",
>> +		.drv_name = "avs_da7219",
>> +		.link_mask = AVS_SSP(1),
>> +		.tplg_filename = "kbl-da7219-tplg.bin",
>> +	},
>> +	{},
>> +};
>> +

...

>> +struct avs_acpi_boards {
>> +	int id;
>> +	struct snd_soc_acpi_mach *machs;
>> +};
>> +
>> +#define AVS_MACH_ENTRY(_id, _mach) \
>> +	{ .id = (_id), .machs = (_mach), }
>> +
>> +/* supported I2S boards per platform */
>> +static const struct avs_acpi_boards i2s_boards[] = {
>> +	AVS_MACH_ENTRY(0x9d70, avs_skl_i2s_machines), /* SKL */
>> +	AVS_MACH_ENTRY(0x9d71, avs_kbl_i2s_machines), /* KBL */
>> +	AVS_MACH_ENTRY(0x5a98, avs_apl_i2s_machines), /* APL */
>> +	AVS_MACH_ENTRY(0x3198, avs_gml_i2s_machines), /* GML */
>> +	{},
> 
> you are not using the intel/commmon matching and ACPI tables so I would recommend you deal with machine drivers in your private space.


And that's what we chose to do! I'm sorry if the message brought any 
confusion here. sound/soc/intel/avs/boards is the subdirectory for 
avs-driver boards.

>> +static int avs_register_hda_board(struct avs_dev *adev, struct hda_codec *codec)
>> +{
>> +	struct snd_soc_acpi_mach mach = {{0}};
>> +	struct platform_device *board;
>> +	struct hdac_device *hdev = &codec->core;
>> +	char *pname;
>> +	int ret, id;
>> +
>> +	pname = devm_kasprintf(adev->dev, GFP_KERNEL, "%s-platform", dev_name(&hdev->dev));
>> +	if (!pname)
>> +		return -ENOMEM;
>> +
>> +	ret = avs_hda_platform_register(adev, pname);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	mach.pdata = codec;
>> +	mach.mach_params.platform = pname;
>> +	mach.tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL, "hda-%08x-tplg.bin",
>> +					    hdev->vendor_id);
> 
> this is surprising, how many topologies will you end-up supporting then? Topologies are typically NOT dependent on the HDaudio codec type or vendor and only deal with HDaudio link DMA configurations.


Keen eye. I'm not providing all the patches simultaneously so the 
patchsets are easier to review. Note that avs/core.c (available on 
upstream) still provides 'NULL' for its hda_ext_ops. Separate patches 
for the point you brought here (and the completing the avs 
initialization for that matter) will be sent later.

The default: be specific when choosing topology for specific board - 
allows for tailoring configuration-specific topology. However, if there 
is no such files, load "generic" topology instead.

In our repo, most of the hda-XXXX-tplg.bin files are actually symlinks 
to few, real HD-Audio codec topologies.

>> +	if (!mach.tplg_filename)
>> +		return -ENOMEM;
>> +
>> +	id = adev->base.core.idx * HDA_MAX_CODECS + hdev->addr;
>> +	board = platform_device_register_data(NULL, "avs_hdaudio", id, (const void *)&mach,
>> +					      sizeof(mach));
>> +	if (IS_ERR(board)) {
>> +		dev_err(adev->dev, "hda board register failed\n");
>> +		return PTR_ERR(board);
>> +	}
>> +
>> +	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
>> +	if (ret < 0) {
>> +		platform_device_unregister(board);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
