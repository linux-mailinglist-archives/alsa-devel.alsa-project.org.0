Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E7F47C4B7
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 18:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A33917BA;
	Tue, 21 Dec 2021 18:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A33917BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640106575;
	bh=Bjk60aqaOMaKOhqm3pw3xkcshA0TBloDeWsVgP6mJmo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LT1xGFG263SYjgJp6oRaPG4efKPSTFcvTXOCJFz/dR5FXloAFj88nQCftC0hHYJ5F
	 RQGrhda8iuYu7joa8oMHseZng962A3Si5NIlSqKC4TJ/xhuB791Zu6ppAZ9lReXeId
	 X67Qw1PMTZy0rDB3d9j0aMmwsKLs6yfTJpg744WI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC551F80084;
	Tue, 21 Dec 2021 18:08:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A39EF80118; Tue, 21 Dec 2021 18:08:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE1B4F800B5
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 18:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE1B4F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kt1vDxXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640106506; x=1671642506;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bjk60aqaOMaKOhqm3pw3xkcshA0TBloDeWsVgP6mJmo=;
 b=kt1vDxXLvHsQi939t+hiDoKplm2xiNTGRfouWOB8PrA2ZiL0oPzfAJ4X
 hlQyOdnS3ehxu7N5QzNBacKQxLWCybcCtMD8ll52tIBUaYmP/elevhj7D
 wgdn18IGMsOMTjjko4ESLGM0cZAX/alt794+BJqXGOT3VwBIaNP+bnopV
 3xrD/FtwL/gEo4HjnQ9ZK2Xs0n7aWR5E8dS4hap3lcMpURVfJXluhf3cY
 Yi9ZYAUubfmzkFsEKUPLChdEfgPXmhwsYKQhD/jj8K/SgyZC/afpwX894
 eodfq4iCxnZFuHNi509ds2C7URIY0nwP7GtLz4wd8yVHnvYNrnVFjEoXd g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240390581"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="240390581"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 09:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="521789924"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 21 Dec 2021 09:08:14 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 09:08:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 21 Dec 2021 09:08:13 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 21 Dec 2021 09:08:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlG9A2zuMU+fHTI2gEMQqKhhfMsQk914zf+HEenLSEM3HxDDugdtQW4UoykGlxBIyg+wJWSwPN05ZMOi03Q1d0De3PEryhXU+b8T/8kaCuA+n36qMmX81yHvINUCa4BpqUfP5gkb1qIOhiB4RCXmpP9Ezm5vFRWH7lLP/EsZ6fdGVL7MI/V9MRGfeU66hDq/483Gnu2Qy6U7acyEoejH6leutnhdvH181IzRoRrJYgB/HVx3CHzz1J3TxSg43IWYnWSFm9QJksu0s28kgLqZFooXZnVswbvpp3xrSwXCEfOBgWBoDE3Ad7kjkVATmRHL7lhOwlTgmre2Q3cPTEDJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEBvDUyuJyx5HDAQdMOuIKGTKafmsAZ4MDxiCMejKRA=;
 b=Qa3vbq3aYRtRJGjaj1TLuGXnKq/SyUB556flN2kl0ou0p8bbiFB5DBvqxe3Dg4XVeGLI/hxVu+btT6pITZQjkUNkK4Ynx5RKbsR/yOoOUMwzF+pipjbEBaN281/8snAuV1GJiOL0/Y6gK9LipembUmeikxCB1JY1wkpYzV6dmL0BuIRT/63J6/Eov00JHCKlwbXm+WjXfcKRzYVJeqeXdIEewYVed22INAXUZUR2gjRiO8Vdqm8M1wF+0amT3vhNDrIRmrvCxExPj+PQifzwv0C6s7COaT8WsdO32/IjCsew1LKEC2qZfQg7uo4Hn+HXVZuBtItB7gBavvhGidIo4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB1476.namprd11.prod.outlook.com (2603:10b6:405:b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 17:08:05 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 17:08:05 +0000
Message-ID: <30e45868-ce11-9cfd-9a13-51d37ad311e1@intel.com>
Date: Tue, 21 Dec 2021 18:07:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [RFC 17/37] ASoC: Intel: avs: Dynamic firmware resources
 management
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <20211208111301.1817725-18-cezary.rojewski@intel.com>
 <YcHjcnD0Ts7AYDy1@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YcHjcnD0Ts7AYDy1@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0044.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::16) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1c3b28f-ef9c-42e9-8da7-08d9c4a47417
X-MS-TrafficTypeDiagnostic: BN6PR11MB1476:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1476802C050617D63BE3D9C3E37C9@BN6PR11MB1476.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: biJXBoXDmaex5Jr4Cbnap4ueDETEhLj5qG43PsuyFvmkycxqapTqQaOc68yU0EfHuMJgC7LGnefw23Qv7vA9Q0u0vh1ZEp3R9K3xUjmdu4Vb+qmzHZppx5O+gnEAa3GERCG6sgzqyyPm7kv0erUAOP89CmehopixwwNgcCfc0RJpg+oIfanWLof5VvVw7/alYDJ3EhmRZKTsatEQNRt6sMu1QtQP91L2WG9XYxB5Vbgk07di89TfLrdcwNrJO8+BTfko5C38oJAeep4w3mU4nbarjPU1BEEa+9pLzasO/hE/xEI1DdeDnDi7kzmBlCgx93ozxMqGDNz3OjeqkLRYtg6hrufC+wod98wCxL+/zKy+Rv1ltf16zSn30F+MmWvWKnxlcsa46IbGGsqOA3dal1thLDFFaMn2x5PDUn7dyRD98dbtFCJT3Thbg8M2Ik4LndhZispp8/knTZWeE86dTfUAWAUmBIH7NLGrJY2BYsGE3I6zxfwX+NZjFb3qnfb4v00fmb/EJR+QIfMWr37Nxci+jnZaygyCkY7e1N3UoIPDmgznw7jOCQ+SSBUthPfaIVYxIcYnIgDoBZ5WXN1WDoVICzDA5SROYkEBU3nffOzeVC3qH4+74OHmHdif7zmFiuPMRem24dDo2ww4zfC6tI9RAp6KM9hcZA4v5Z+zwtMAPAqSVBcnI1N8v+LEKAJXIYiXD7cXI6g4X0b0651znQyHFSTND72mOlwufM4zABg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(4326008)(8936002)(6506007)(66556008)(508600001)(66946007)(8676002)(53546011)(66476007)(7416002)(5660300002)(38100700002)(83380400001)(316002)(6486002)(2906002)(4001150100001)(6512007)(82960400001)(86362001)(6666004)(44832011)(31696002)(36756003)(2616005)(186003)(31686004)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHFXUHdaQ3ZncFR6V01kUUJabkRVWkRFLytHN3ByMStuOUVCNWNwbDhIMFJo?=
 =?utf-8?B?cS9CTzJxeDhmN0M1UEUwSjVrRUhhOEM4eEttZmhsWmlUWFljcXRqeEZOMUhU?=
 =?utf-8?B?dFZ2dStjdEJ5WUZ3MHVpWVk0UDJkSW9vM3U5Q1g3Y21WSHAwVUtTRkZncmov?=
 =?utf-8?B?SU96eStJVmcwNWl1MEZFWTJKcFdlOHV6ZnJDa2RwRllvYmpaTnNyeENWWkFR?=
 =?utf-8?B?YVlESmdJTGxRRzV2NXlRWUVicmVxaFFSY0JuWUlRK0ZVRjk5K0hVZGcra1Fz?=
 =?utf-8?B?VjE2UW1qTjBPUVh3NFNWWmxYZ0daeFVseW96T2N1c29HVEFDc3REb3ZWUEdo?=
 =?utf-8?B?TFh3Z3NzOE05SjcwTUFsOGc0M3dIcURIdms0akkxNThqN2Y3eE1Hb0V3K1h5?=
 =?utf-8?B?YVlVd0prRGZHNWltY0lHMWhqTUhQYjlpcjB5TTdmYUlod3pqSEpqOUxSRWpj?=
 =?utf-8?B?bEh0bk83RUh4Mm1xM1FndmFsQWE5SWY5MFJJdktTMmdEbU9RN0hFZ000OGdk?=
 =?utf-8?B?c2dMMnRZT0kwNEtBa1l2WW15QVFKdjkxaFVSOXpFMzhQQUoxejByQ25rNUN0?=
 =?utf-8?B?bGFneDloczNTZ2R4Wk9rdGhWcEpKRG1BMjlRNXJwR25ncDNVaTA3eUo1YkFJ?=
 =?utf-8?B?UFBDYTkwbVNuMGt6OFNTYzRkMkszdVN4YUJvTTJER3VvYVJxNm9QcUlVV201?=
 =?utf-8?B?R25yanFUZHY4SUVOMlNaNHNTMjdheTJTMlRZQ1JtRno1TUZ6RDdXditUbTAr?=
 =?utf-8?B?eU13RzAzNTE1Z05wbWljYzZYWTJQL28xMHJiRTVYSnd3ajJpYWxCd1hzV1h0?=
 =?utf-8?B?RzBDNXhhOGZ3ZS85dkYveGl2UkkrWW9SbnlOMkpyU3VzbFlRdDNUYkFPSUlN?=
 =?utf-8?B?OFBHdGloZlRGeUlSdHE5czAzeERJNStZaEF2SFJsQVFpSVM2T3BDY1V2Qkkw?=
 =?utf-8?B?K0pUaHk3eFQyNWd5MGhEUDFWMkh2OFJPSTNEZllqMlphNEFIaHBUczVWYms3?=
 =?utf-8?B?QTZPL3JqQ2lkU3orOFJZUy9UQXZ6ZGRJWndRTkthQlR0a0Y3ZHYwV0Y2ZDlH?=
 =?utf-8?B?KzVmd0o3NERQbm9SQ3VTdmNERTJVL1JPOS9RYkFXU01JUXVhRVgvM1J6M3Jl?=
 =?utf-8?B?UWVzc3B0NHBha2Y0SnJwUDJ0ZnU2WlRCM0MrQTh5RXhrVFF1QTlSK2JNZm5U?=
 =?utf-8?B?QkE3aFFlQXFDUjBmODg3Z01WYVJVUXlNOE94bHBpd0ZIb2UrWWMyUEZROXRy?=
 =?utf-8?B?Mm9JalNxYzZPNEJWZ09EOUVsQ01uOXkrTG5WY1RXd0M1NDE1emlmelR2OUxT?=
 =?utf-8?B?YTVnV1ZYSVowK0tUdVZvMmZldldQQXhvN1pZVlJycHp0cGlYVkd3MTdIb2FK?=
 =?utf-8?B?c0puUVdqVmt3c1FzNDNacW9hVmo5M25aRkxnL1BrZTRVN2VYVzV1WEVzQ084?=
 =?utf-8?B?SW1nSG9sakVnOWdJY3VmVlRTcHphL0VoM0NuMlkxajQ0cm9NR2UvdHFVWU1R?=
 =?utf-8?B?TDkyaytjN3c3M2Y2ZGpnbW55WUJicjdqeHRLcXlOUUw2b3loRUJ0VXdRSlgy?=
 =?utf-8?B?WjNiMzIyUXYxajVweXpNY1FubktPaHhENEwzejI3VmZYczRzV2hFa1ZlMUJE?=
 =?utf-8?B?bmkrdHhJQ3Rsb0pqTElzeU9UZ2lXWFg2M1Bwd0kyRWZIYVJzdHNoeHgyTTlJ?=
 =?utf-8?B?cGh1SWE3K2RSU2FvZ0x6b1AyaVVEOVZSbVFzUEVETFpLV1FLMWJkL3M4Y3JH?=
 =?utf-8?B?QkQyRkwwdmVTUUwzeFMwR3AxQ2M5eUQ5aUt0Q1U3Tm0wZGVwbE9hY0pEQ3lh?=
 =?utf-8?B?UlFPV0pNTlVpSnUzUUt3Vy9iZm5IalNmNmZzb3FRTUwvZVp0MHM1L3QxTHhO?=
 =?utf-8?B?Y2IwNDhJdWhzNSttMnF1bEFUVDlubzFiVGZnUVdDQjBTczdrRG56eEd1VFUw?=
 =?utf-8?B?TzgrazNlc2NMclEzb1diWTNqMWh0cWt2RXUwd3Ezb056SUFjeU5yRnk2RWw5?=
 =?utf-8?B?NG9Kc21MMjRXVEJhWEs5YklwUW95ZlJhT0ZMbEQzVEh5V1ptWW1EQ0YxYU1J?=
 =?utf-8?B?RjZvYjdOMU1ia2o0VGwwS3dEUE9OY3lUekwzRGJQNEtJdTFuVG02N0lkSTBF?=
 =?utf-8?B?bEpVYlpLQzYrZ09KNGdSN2U4R01yaFBDamduRVpwSU9ieERMZFErTWpTUGNF?=
 =?utf-8?B?dnBvdHJ4bGtRRXJHZnJpaW8rNFB1aVgvZ2NZS0ZhNnllVnJrL2dQT1psNDQr?=
 =?utf-8?B?WkEwenNjUGtyb0s4RWxFZVA3V3F3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c3b28f-ef9c-42e9-8da7-08d9c4a47417
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 17:08:05.3865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1dTIgnmRbHkK4aAxmB1E6J1Vr38q8jjE9SWdjXIHXwJcpIL2FppRtq8A823CZ8ZfOpOkmFSbCbBzJQqyNbFNREZhpTHCFnjqN9HTEPUY9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1476
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

On 2021-12-21 3:40 PM, Mark Brown wrote:
> On Wed, Dec 08, 2021 at 12:12:41PM +0100, Cezary Rojewski wrote:
> 
>> +int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
>> +{
> 
> ...
> 
>> +	if (atomic_add_return(1, ref) == 1) {
>> +		ret = avs_dsp_enable(adev, mask);
>> +		if (ret)
>> +			goto err_enable_dsp;
>> +	}
> 
>> +int avs_dsp_put_core(struct avs_dev *adev, u32 core_id)
>> +{
> 
> ...
> 
>> +	ref = &adev->core_refs[core_id];
>> +	if (atomic_dec_and_test(ref)) {
>> +		ret = avs_dsp_disable(adev, mask);
> 
> This looks wrong - there's nothing that ensures that we don't get
> a sequence like:
> 
> 	CPU0		CPU1
> 	decrement
> 			increment
> 			enable DSP
> 	disable DSP
> 
> that I can see here?  Either there's a lock missing which ensures
> that the actual DSP management is in sync with the refcount or
> there's no need for the use of atomics since the wider lock will
> ensure that only one thing could be updating at once.  In general
> I'd expect something heavier weight than atomics.

Keen eye, Mark. In fact, you're right in both statements:

- assuming there is no wider lock, existing usage of atomics won't 
prevent possible race for enable/disable of DSP carried as a consequence 
to ->core_refs manipulation

- there is a wider lock indeed, and that's why we haven't encountered 
the problem I guess. It's ->path_mutex, a member of struct avs_dev. Said 
mutex is introduced in:
[PATCH 19/37] ASoC: Intel: avs: Path management

along with its usage. By the usage I mean the following:
avs_dsp_put_core() and avs_dsp_get_core() are called only within 
avs_dsp_init_module() and avs_dsp_delete_module(). The latter two are 
part of 'struct avs_path *' instances creation and deletion procedure: 
avs_path_create() and avs_path_free(). Both avs_path_create() and 
avs_path_free() lock ->path_mutex before doing anything.

I admit that answer to question: "which approach fits best here?" will 
probably need to wait for the Christmas break to be over. While myself 
I'm in favour of synchronizing avs_dsp_put_core() and avs_dsp_get_core() 
locally as it scales better into the future and we won't get caught 
unprepared when avs_path_create() and avs_path_free() stop being the 
only places for their usage, such decision need to be made by the team 
as a whole.

One more thing came into my mind during this discussion: 
avs_dsp_put_core() and avs_dsp_get_core() should probably be 'static' - 
as it was said earlier, these are not used outside of the dsp.c file.

Once again, good finding Mark, thank you.


Regards,
Czarek
