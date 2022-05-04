Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0D351A4D8
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 18:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D5521635;
	Wed,  4 May 2022 18:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D5521635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651680108;
	bh=FjB7KiIOB/n2JkdVlBssi8yuPI/4Mt7iNYzP5kZiKlg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isD47p5qq6feTsUhDHoQFinMahEaQtdmLm3WH22M6XLXSkKAT6g4TnRuU+7QOOVdC
	 92u1fxVF5iGT2ERe7uYEJrxVqoaeRzNgcntxWXq5x20vQHMjPerU8E743ELb1jl3V1
	 Vud8B27sXM1f32Fl1ZL6sfctUOzJrXwlGGFxvcsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B26F80166;
	Wed,  4 May 2022 18:00:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2E93F80163; Wed,  4 May 2022 18:00:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1909AF80129
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 18:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1909AF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fWTtiUkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651680045; x=1683216045;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FjB7KiIOB/n2JkdVlBssi8yuPI/4Mt7iNYzP5kZiKlg=;
 b=fWTtiUkWtKsQ8D4zBvuBtrz57gi/C/Sfyy9724dWgTxLUVINGk/WF+NG
 +ESTdK4GnyIcrmReae+6c8HRNX4DYk6D+aQaJYCESdtE1B/PtAB2Q23FO
 th77ORqgVsLwUngzSpPDZVd6q8OVXbODzyA8BcvvgaWlyl1zmEiLqw+XF
 eRtewVlNaT1FrTHG1Q8sUvDtooNly6MrbNkDmeb+3KEaIrsvhA/WJwnou
 SAA4pcrQuzfk2yR0Cie2OmtyrEmGVUPN3jl0KfasS1/uZk9k3eKDwrpqa
 WGckg1D4v05t53UhT+cAJhgcbRDe6P4AOaYULlH2fVDZPKTrMO3Blu1IQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="265396438"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="265396438"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 09:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="517084688"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 04 May 2022 09:00:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 4 May 2022 09:00:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 4 May 2022 09:00:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 4 May 2022 09:00:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVVgy9LqbH9QHugs/RIdhUi+aOrKyqdiYPP0jKjNOr6FoeAopd4LI1TVsN2IJb01l0r76zV1tgFHrhxWbrPp63D0piL7vlX7U7/b/eixybcJhffDrRp4k564Hv7ez4KJiQdWZnfL+YlgLu/nGoBuh7Pm6n6Ioz5oVsxhuoJDShlgiEYAG7NWNZetiqUTxuewBlCEPjK3VZUCXp3/dfpvVFTpD1ASo8gbwfEspzxvs0c3Zc7B03vEp8U5gqwTyTUkhMNf+womBxapyJoTgQMvI9G3HrbWMUh6QhTMJu8ztWnWdMvbksEbEKMJn+LqWWfiS6RPYTLqDxigwV0KQCfvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9q2gQ5JlPRK+tmoWKMDqzWxbTdWkxkWIXGQjvNtyDs=;
 b=TD7SMnzriC3Ha/XN7gTtng1ZBYjm8ifDATL0iNn+5frhW9NUw4y24lf+NFahQt0yReqtHRbg6r5kFQJHU2T2qkgzmyNYxUrSD66fBQnvZJEFn1PpYHDWn1dIvD50HS1zyIJMstgjclJk1pvwCb9DZckp2gClATjYCq7/tAM2EXgpOgnHQNuCTgtqy+3y8//fCzTE3avIjGA4k0iVoHIAWZ5BAYExyrAscbCZfSUgGHYlaFg6cX4EvSQh48+nKjPCuk3MO5UC498lDOIZdoxnzcr8TauYsWTLzcvezKhq44dKWPXF6L6WBlw4E2oOek/rkQyy5dnEFKG0GlOpQq5shw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MWHPR11MB1694.namprd11.prod.outlook.com
 (2603:10b6:300:21::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 16:00:37 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.028; Wed, 4 May 2022
 16:00:36 +0000
Message-ID: <e34d453b-1fbe-6e53-dc90-00580c9df9dd@intel.com>
Date: Wed, 4 May 2022 18:00:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: ASoC component/card relationship
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <YnFwGJBjVGrsMJWR@sirena.org.uk>
 <6dea4606-cb5e-1224-bf98-d1da1484ebfd@linux.intel.com>
 <YnGRNfaempsFG9/M@sirena.org.uk>
 <ff511a84-adac-1018-a934-2b8202c5a9fe@linux.intel.com>
 <6009dd4b-e5f3-78a6-eade-76c3f30a6d42@linux.intel.com>
 <2c2c1af4-9c40-841d-fc9e-486c3db482bd@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2c2c1af4-9c40-841d-fc9e-486c3db482bd@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::13) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92ec42d7-85e9-463f-61a2-08da2de73a5b
X-MS-TrafficTypeDiagnostic: MWHPR11MB1694:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB169481ECBDB1C2C6D2DADAEFE3C39@MWHPR11MB1694.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HazHCGzbJITmeF+xa6It131yTdoadwQ4nV1YJttEtBBkMMbQ/zJINnjvYJWcq9Yc21Wp7e3YkO3RZlZnSLAa9N9VNjSbXiHjFfmCr+dUmYyPQVPZG92Y4aZpO2xkKvs0Kz5wc+uhiQ98E1YGBBVHEqxW7f/+n0oKCsl2bcOPkwtUD2Vr68uwhO1ObxGP/s4Fb7ZRA40afM6zvDqj3tcrDF4rET8t0tC7MHORJXViU1skdZURKtC4Mo7Malr8gppka3PbHH26smNMPk99Vrj2P1Iu6dh4Z0pLdqaGQZKidpAydq+rFAHFSAmU7AFpCLne3BKOgqQl2O45wwnrqiqPJdptVQ8ufko3V1StG3VaHIC687LxXpK96YokQUDp/9qVifZNvU7vt/Pv6OsBV+oLmD/EcfuWXJFx2iY0odBuaSOMphXTqEkaTBp8QXccnnYYgtJHFu6kQ1yeRCAF6ROkhzg/qPLYNG8+5jTwqxLaL3wnMcB5FpkS9NPOIb2SZhgLy89QBwcyZm/kXumcoGYtet8bAWn1qgD9Ijj0QWBaba/g7+szqVRA6g2nfv+6u/1yGJ7ZoIsYMhcYH3CZRe1fGEac5ntergawSnqlV5dXIsbfFyybpChivc7XLMYax8csnDFFc9xSXB57/Cp1InHtK+lVa5fa2xvok9LQRt6/t9h5RlbZRBCVtlErkueuoGw4Cb19umc+gMHPRBFPaD1t9l5k+Pe69bzFFtL+0qfQkmNw00eWTLY2E0/UorxWB86sW2LAX9UAol3haQMnSpGD4m1ryg4BJ7Q+7mxQkWIpuH6hMY6vGulM7lZBryUe5n2Idif6KD24FKS/LoNrmYVxVpdXf3sPIN3JSzDu1NePQww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(7416002)(8936002)(38100700002)(3480700007)(2616005)(508600001)(44832011)(31686004)(36756003)(83380400001)(316002)(186003)(31696002)(966005)(6486002)(82960400001)(6506007)(53546011)(2906002)(6512007)(66556008)(66476007)(66946007)(54906003)(110136005)(4326008)(8676002)(6666004)(86362001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1VZNEhtSG9VRW9ZV0liT0VlN0pMQnhaSXJzdmxjRDBZT0hCY3VUeDBsYXpN?=
 =?utf-8?B?cTY5UG9LOHE0OG0yT0J5aDdlSUlKbHRJd3BjMGRKalhpYzVJNUZOOE1kS3lp?=
 =?utf-8?B?WFA3OG9zS3FLdTBycGRyTEtZVVhXbXR5dHdxak5aMld3aFU1bVBhbWdWcTFX?=
 =?utf-8?B?ZS80eDExSW1FVnZDeTFNc2pGL3pka2NVL3pnNWF1YmJEYU1zVEZGY1RIejlB?=
 =?utf-8?B?ZzRDTFZ6cm5CdTdsckJYWG02MFdlYzZQNEhQZkQxSmE5Y1I2MEc5ajRlcDFm?=
 =?utf-8?B?MGNhWEVWYWZwbFE5Rkl1a3krZ2VINVlsVzMxT0lya2FQMTd1bHRUdEdwZkZD?=
 =?utf-8?B?NFQwTjdzUUNHRzVMK2R6b2lOSWROLzhXeHhGR3pZTE90OVlFSjVnZEIwSlFC?=
 =?utf-8?B?NXhzWll4L1NscGl4NitzbjA1TUs2ZFBWVXAvQUxadEpvWTNCZjFydHMvOCtv?=
 =?utf-8?B?b2kvQ1l6aUFhUUx5NnFJRENrcE5Tc0NIRkFyMDBRUWNrSlRLbDJkK0ZVWDM5?=
 =?utf-8?B?c0p6VG10V21DMzBwc1BSN3dHcno3VmxteHlaMG1UL3lDMzR2TWkyOHNTMmwy?=
 =?utf-8?B?RnoyczFUeU5nSnF1RGtvVGdVNGtlRUpUV2ducERhazR4Nis4c29XZWNvN0Q3?=
 =?utf-8?B?a0p3M2lObm83NTJiRzBVY0dtdGM2UWdodWRKYmVsZE1Nd1c3OEw0anJGa1Zh?=
 =?utf-8?B?RDZqblRsMG9VOHVHUDNTWXlYRDJ4eXU4ZVJrM2tvV1hTK0tpa0Z6L3pVby94?=
 =?utf-8?B?NkZERXloVW9lTmN6Tk8wVzBpdGpzQ1VkYXVYWjNrMjBKcklkNkp4b2M5Rkta?=
 =?utf-8?B?VnFxZVBaOXdHWnhoQ0NpOTJzQzlnOFh2aTByTFgzTThONUpyOE5WR0pObFFp?=
 =?utf-8?B?ZWZpcFpKdWVvZUpIbm4yRUR4cXI0QzM1VG1FTW1sS0tlNVM0TE5BWFdkSEkz?=
 =?utf-8?B?a0Zoc0Q3UHpYM2YvcmNLTm5hZFY2OXdsMGNIazJLSW5EZXhXY2FYdC9BdnQ3?=
 =?utf-8?B?dmxLay9obGxMTUgwaVRHMm1VMUZGVXhHaFcvQ1JMZkFkTWNEUkxCdVlhS29t?=
 =?utf-8?B?SG5jcHMxM28wdkZaRzdpcFBjdENqS1p6V1YxbjRpdUllWFJiRWhRa3RQK09s?=
 =?utf-8?B?dVV1bktndFBNdGxGb3hETzBsQXQveDAwTVJVZjVaQkdtYTlYWmhwYzN3eVAr?=
 =?utf-8?B?a1ptbFZZVWVZUVJRbEFGR1oxN0hURnM4L3ljd2RYdlZMQjcyMk9DNTVkQzhv?=
 =?utf-8?B?NWRjZlZUeHZxalk5ZWtDeFdRbzBTSmNGczRLT3pDRWdvS3BSRzRmK1h4Y3cx?=
 =?utf-8?B?Q08vcThHL2kwVXJVclppbitVVmxoWEJyT0dSc0dBajE2S09Uc21WT0EyaWha?=
 =?utf-8?B?VDJsZFBOYzc5NWt3azhJM3BFQURiSS9XcWdrTHhEekt6b0c0SjhhSGFFeHRz?=
 =?utf-8?B?b3NOUmFTMk1sNGYwYkh5ajBMcklqSFZXNExPRWRRdHpjd1NxZmNTYlNoOFF1?=
 =?utf-8?B?YjYxRE9aOUJoeVNnK2F0TEJRaU9JbEsrWXBpYWVsMWh1MW8xa0dlWmlsdFZZ?=
 =?utf-8?B?Q25TcnNxM0xmSVgySncwblhiSXJmTFlpb2Z2c1ViR1R1dGZXaFJmSlkzTDho?=
 =?utf-8?B?cUZ3azhjT09uN0lGeU1qMEJSRSs5blhOZm55aUdzOW83bDVKSWtvc3RRYzdq?=
 =?utf-8?B?Tlg4eW4xZkd4VFlyQTBEaWpiZmJ6QjIwbDRBN2xKRXUzVjgrc2kxMWFQeTdC?=
 =?utf-8?B?VHhUMXIxdk5adkNkczZlNEZ2ODJtaWFNMmQwWDI1SFY5R3hDajBpbkhOWWZV?=
 =?utf-8?B?SGVIOUd4WGg4Ri93RlBxeVZEdk1rMGpjbVRVNG1VbkZLTmJOTnVVdHgxS3Ft?=
 =?utf-8?B?R1FLMnNKYmM4NDlaenMzNTVML2JIYlFyMi9HK3htaTBrRnhXeVA5L21KbHBF?=
 =?utf-8?B?ZUFXdUpEUkc1RHRpN3czR00yY0dpUDE5djMxSWFONThZc3BmMS9BZ1h4Y1Ez?=
 =?utf-8?B?MkM4RVhna3E5U3lYV0Y4K1pXb1kya3ZHYVNlZzlTUXM5NjgrMFV1TStYSHFY?=
 =?utf-8?B?R1h1TUs5VW1HYXgzR3VhWGsyb2RMc011dHZjS1E2TGcvVzFhRm85OWkwbXpq?=
 =?utf-8?B?Y203d1VQbHEyNkFCajFtYjRRV0ZNUC9HVjhUY2l2dC9Qa2JYWDFYNkEra1Qw?=
 =?utf-8?B?eDI4V0JmV20rci9DQzNVQ3FKVThlV2p6dHZzZlQ3QjRCajgyeGVoaVdvamhW?=
 =?utf-8?B?TXpjeHZTQ2lML2JaalR6TG1GU2tFeFQwMGNhRHVYbnJUZnJ4bGZLT3FvN01L?=
 =?utf-8?B?NEhlamhCcDlGMDFtRFgwOVhQbTRBSnRQbEFKZjlYek12SDdTL0gxQXFJMnZ3?=
 =?utf-8?Q?teGj9HqLRYpZwcs0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ec42d7-85e9-463f-61a2-08da2de73a5b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 16:00:36.9234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tULBxQjN6uOvvTz2erusj/7hX1FLqmokp3CaayS6gltCsGyWXI+mQ/d43qe08HLaLNDkTEDz7di3BhimXSaT98tyPReY6/1VYowWDofyxUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1694
X-OriginatorOrg: intel.com
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On 2022-05-04 5:26 PM, Pierre-Louis Bossart wrote:

>>> b) the hardware/board level parts. That is a weak part of the topology
>>> today, it should come from a hardware description instead of being
>>> hard-coded in each topology. We must have dozens of identical topology
>>> files that differ only because of the SSP index or SoundWire link ID
>>> used on specific board. There should be a way to 'remap' BEs for
>>> specific boards.
>>>
>>> It doesn't mean we should toss the topology and redo everything, the
>>> latter part can be addressed by providing the 'real' hardware
>>> information to the topology and dynamically modify defaults.
>>>
>>
>> I already showed how we tried to solve this for i2s use cases in links
>> above.
> 
> You still have N identical topologies, completely identical with the
> exception of 1 SSP index to maintain.
> 
> Just to make this point stronger, with the recent support of the ES8336
> codecs, we had to generate the following topologies to account for all
> permutations:
> 
> sof-apl-es8336-ssp0.tplg
> sof-apl-es8336-ssp2.tplg
> sof-cml-es8336-dmic2ch-ssp0.tplg
> sof-cml-es8336-dmic2ch-ssp2.tplg
> sof-cml-es8336-dmic4ch-ssp0.tplg
> sof-cml-es8336-dmic4ch-ssp2.tplg
> sof-cml-es8336-ssp0.tplg
> sof-cml-es8336-ssp2.tplg
> sof-glk-es8336-ssp0.tplg
> sof-glk-es8336-ssp2.tplg
> sof-jsl-es8336-dmic2ch-ssp0.tplg
> sof-jsl-es8336-dmic2ch-ssp2.tplg
> sof-jsl-es8336-dmic4ch-ssp0.tplg
> sof-jsl-es8336-dmic4ch-ssp2.tplg
> sof-jsl-es8336-ssp0.tplg
> sof-jsl-es8336-ssp2.tplg
> sof-tgl-es8336-dmic2ch-ssp0.tplg
> sof-tgl-es8336-dmic2ch-ssp2.tplg
> sof-tgl-es8336-dmic4ch-ssp0.tplg
> sof-tgl-es8336-dmic4ch-ssp2.tplg
> sof-tgl-es8336-ssp0.tplg
> sof-tgl-es8336-ssp2.tplg
> 
> All these topologies come from the same file, and generated using
> macros. That makes no sense to me, this should be the same topology that
> is remapped at run-time.


What Amadeo is explaining here is that AVS driver already addresses this 
too - at least in our opinion - see parse_link_formatted_string() in 
sound/soc/intel/avs/topology.c.

User is allowed to specify widget name as: ssp%d within the topology 
file, leaving kernel with responsibility to fill the missing index. And 
this is something I (perhaps we all) would like to see within the 
framework in the future.

In consequence, avs-driver user does NOT need to define N identical 
topologies. For example, SSP-test board [1] and its definition in 
board_selection.c [2] clearly show that all 6 SSP boards look at the 
exact same file. The same approach is used when speaking of other, 
simple i2s codecs, e.g.: rt274, rt286, rt298. Difference between rt298 
on APL and GML comes down to SSP port number. Here, board_selection.c 
shows different prefixes (apl- vs gml-) but the reality is that both 
files are symlinks looking at the exact same actual topology file with 
ssp%d specified as widget names.

At the same time, compound machine boards are still permitted and made 
use of, example being TDF8532/Dirana board for Automotive (not yet 
present on the list).

Really, flexibility is key here. As long as devices found on given 
platform are not connected or dependent on each other, there are no 
major objections preventing card split. Such code scales better and has 
good reuseability.


Regards,
Czarek


[1]: 
https://lore.kernel.org/alsa-devel/20220427081902.3525183-6-cezary.rojewski@intel.com/
[2]: 
https://lore.kernel.org/alsa-devel/20220426172346.3508411-11-cezary.rojewski@intel.com/
