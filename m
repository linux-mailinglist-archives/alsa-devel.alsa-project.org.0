Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5064C4EC9
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:29:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44A01F2D;
	Fri, 25 Feb 2022 20:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44A01F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645817347;
	bh=r2Y9KvrgM+NwJ+2RpleRY2lzoewSNb7RvhlkH6erbFE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OknQlvQwMApqIF9b0XmtYlQXHzcP4B9HvSIrVI9/9tRvEardLoebXzP5MoLg9fsSE
	 kLdjDUZav9i2Mslt9xj1Bc3TI0zTK0+tQpaD4AZUB/UfqVg7yhxhRGZMJvFdp0OxWR
	 sktVyDoFYmuMCh+kA+1gYoGh2N58AiqZiCFaRlPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56F54F8012F;
	Fri, 25 Feb 2022 20:28:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6306DF80132; Fri, 25 Feb 2022 20:27:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 136FEF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 136FEF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KKqB29m8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645817277; x=1677353277;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r2Y9KvrgM+NwJ+2RpleRY2lzoewSNb7RvhlkH6erbFE=;
 b=KKqB29m80ngVDS5xOS7aapYgPTis7fnkWZAlN6IbbSo+iVOj0qrNvLPe
 PeEPdZVLu+pf7qlmb83IMhoarg7GQzsbrHkJSZ7HE6T7TYLSzB3R5Q+DK
 xFC6fWVIm4u6Ny1b7lULkhg8fJDuiXyJ4Czqnczt++hjDhIqJN45VFKLg
 HDVFj/Ec+KmghJfLhiWVCS9ZJeduXLJ+nlwe5hZ4zo9oyam/XiKtFfozf
 3iaAAqVxCUALB4VPkF+D8YshjW0rKmdPobRtlRkC6HkhSRc2GGHa7HrnE
 WO/jHM7muLaDJFgWJZ+VNw4uzh4Xok2X8zYrk0JLM7uwTImZhSordXTdV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="239969097"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="239969097"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 11:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="607856502"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2022 11:27:52 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:27:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 11:27:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 11:27:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/323dmkaqM+vcJ5D9yrKkMcy72+NQpu6RKXJ6ahcgE+JwTvpZdEo0MqtS+mtlHM+yhSBCsToaKAPV3gQwS445qfsvxjeHIo1dW1xlxeMJB4y/HTYpswFHqt2DhRwa8UbxT2+1uf9a72BgkFAY0CxRq9sKQfFY+kVfx7NuDAcH1TEipZtgciY2V/zys+l8dW8WdR7RXTQza9ATy2dWeNc0Fg1zB9Yf9oZGrlFp1sistIH591vX8qVVCPjyILRZW0esfeKDXf53F9v84B2Pwt/dicEraSaujxv/S4gV/FMH2oXEX5wu5u6iFy7OfTHmUecWPbVa4qeSI196fFZ6fd4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHjNB0v+g+UIf9+1CK4M5hRTXrPueA9IlDdYiWQQmMA=;
 b=oe0opnyhswOVEPVGArnzxHSz08adgYiBGe87c77bK3ybY0nLI6RTD6EMEG6aQFhF72yNFUXZnZ58q5NoZmOzaftIqDwdoiJD/gZmaE939pQHbXW/Jape2at4RxlG8jNnL05KBqUjEiLVfdTn3eLABVehgVZSCQicDkEj8utAt52gtnGHAtUz3o2tEC4vIQ7l946bJ3KhCuazPJrq30TBUSShVgXgGiSYyEqWCPciduW/554tj4cYwUCygnQdWbNxVmWqLNJul0iTpElq+3FsZnTTRkTycQWD/ilzK0ufNAjFRvvMrsu+1JZk/VYPsZ4mXQuw7VgzINpX9j0s37RJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 19:27:43 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 19:27:43 +0000
Message-ID: <3e85850e-8e9b-757c-f640-498bf83996d8@intel.com>
Date: Fri, 25 Feb 2022 20:27:35 +0100
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
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <c7a06bdf-5ad5-3d58-bd6b-4a533b8e7d8a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0038.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::26)
 To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3247c74b-906c-4eb4-ee0b-08d9f894e511
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_
X-Microsoft-Antispam-PRVS: <CO1PR11MB500997BACF26E5994CCBE87CE33E9@CO1PR11MB5009.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1Ahd6+MaRzNlfyIODse0PjGphDWKrZPWi3x209Vi51n7UJHbnMazmsTYJaemOYVavyCQK7IPIIJpf+4AmbaAE//2pTIXdSphJ3jdsxCjYjFJv8MiJhYYVgJg/zL6gWTGoKie3b+IpeMpRzuKxYFX2HLNWpg9M0ifGypwsRgF7OCjZHi0ZkbrCTaOt9hPIBxrIQx0g+0RoQHJmCgqT81nRJIjpP/TG5kJNy4SRN94Y6s8C0KukII1a8+OZvdN+fE7BmpmfoHjLJi0i4fp37HF9ZgEA7oFAxzgSzRV6LJirNs0sCEX5tgjufgJFXaqKjAgX8wpEuoxiZ0IP2huAmXyJWv+KG1cAqZ67Ey9dd1hj+1qFeFBLOgTwXsqiG2T3EvRhFT+YiWRraw3m5rJli34HEgwT89aW8r5V6w7d+BUS+ow797qk7VrcgS827aRoRRi/oYGFbJ/f5YOvWAJ5Gv/StCd/sWY6kuN6f0VRINt49Tb1TqoIx8bs7xFrl2OV8PyN+YGVY1BcgBu71mHYh3UOzBXCkRU2mrq1kwxD11EeP0GzRO1Ul6dvwGxieB7mbstUR+Ix7m2z9TkarLuOok19Ss2IHg+j1zg/N6jg0814mE0TE0NUm8So0umgdI+rGI6vxkqTIBAcXiL2rxBCP8X/oYZHkIp7k8G5rAPvBD1It9kVLADgLgarOyrIBjUUNzByVEGq2FFiYvFUNaF62SaNo4nbO8kab34vLphIaTBJDXdbW2eKX4XcNoDLy7JMOZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(8676002)(2616005)(44832011)(66946007)(66476007)(66556008)(2906002)(508600001)(53546011)(86362001)(6666004)(8936002)(7416002)(31696002)(6506007)(38100700002)(82960400001)(6512007)(5660300002)(6486002)(31686004)(186003)(26005)(316002)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGYvbUlMdlFGZGVlRW5UZVF2MGZ3MER0bER3YmdFaHlKY1dEYjB4cGltMFZ3?=
 =?utf-8?B?RVgwdVcxK0xQbE9BZ1F3RnR3UU9uSFE0R0ZSeWE1SFVZNjZJS2xJZk5UUGZj?=
 =?utf-8?B?MmZaMVh6R2p3NlpYbmRUQ0JxdFZ6aG5lV1ZRdlZ0MWRIejlGcEVmeG90SzBU?=
 =?utf-8?B?ZUJ2eWkxUzllRURrN3BLOTFYNitpUjA4b3ZkeDdETm1qelM0VmlNam5PU01u?=
 =?utf-8?B?K1Q4UVFvU0o3dnpacTdEcDdxWHhGU0N3RnRpdWloUk5kd3c5QzBjRC93UStq?=
 =?utf-8?B?UlVZNEI3akl1Tk83aUhLbm16VDBYaUZjOGVwYTBPWHBKT2U0NzhFdEU3bGZq?=
 =?utf-8?B?bEhaK3JtSjlDaEpCVE9xdlZRR282VlBPTjlLeVNZQnJGM0l2Qi9YcGNnZlR1?=
 =?utf-8?B?SVNqSjlWVXJkbmUrUFBINlQ5dVBZeVN6cmx6MEVEdXFJOWtsaTNYQ0Y4UXB6?=
 =?utf-8?B?akVERkwzK2ZPZ2hWZUdWTkxnK3ZDL2xKaTRCZlc4TXk2T2ZFQmlXdm93dkZn?=
 =?utf-8?B?VWhuN2h6U1BuYmlXYktudmNncXd3UHc2L3VNbVV2dTJUYjZiUnBWRUVJVVRP?=
 =?utf-8?B?YmlJUGw0TmR3WmFMRExkQmU3RXFXNmNXR3VzdUYzSVVyY2Z1Mk0wTHJLdEd2?=
 =?utf-8?B?TnUwamhUeXBqNGhrYkxOdU55ZnlhckROOVBRR2FZdlVtL0ZkTDVPeldENHI5?=
 =?utf-8?B?czJNLytUeWQxNGtabTZ6RmhGdkdIMVhyWkVSWWlFaU9ObXJkaXNrTWovQ1B4?=
 =?utf-8?B?RWU5cVBMVURpdWcrZFA0UzBNR0RzMTJEQlZSUUF5V1UrUTdCMWdldU9nT0M3?=
 =?utf-8?B?SzNha2RsdlJCdmZMMkRRM2ZhZVNURWYzTitCTjdsdVdNVzYzSGlMeDRlLzBK?=
 =?utf-8?B?RjZkQzk3NXZpMngxT3kwMWp4VEJxN1ZZWWxMWENQSElpb0NyQlpDZlBSZFhn?=
 =?utf-8?B?TFVxT2Vka3VTVlJ3aDRTckRPRVVzRTl0UU9DVDFuVHFnK25kM2VXRGk4V0pj?=
 =?utf-8?B?clVqYUp4L0srclZTZitOVHVuclJLeXFlMjhMdk9DNldRc2NweDhjY2swVk1k?=
 =?utf-8?B?dXk5U2dkcDRMMW5jNnNteU1NSERVY2d5MzNObWtKVDQ2RTFIRGJ6VytGTUdZ?=
 =?utf-8?B?cUFlbXhOWEIwbWRadHVlUkswV2F2TjM1US9MWUNiRFRvQllobzJKME16MUt4?=
 =?utf-8?B?Vkc4ZHVVcW9kR1VQaEMrTXp3WDZzTGlUblJpdUk2bFBieXZhT2dncHBHWEU2?=
 =?utf-8?B?dEluZzlEeG1MUkdTNkZDRjJNblB5Vk5odG5VblFJMjAvZHNCOCtRWXArTllO?=
 =?utf-8?B?L0wzMEYrU2ZmbnBzdytmTTB4TnZmdkF1RkFUcEpFeDRGNWZtVUJQMVYrQ2Jy?=
 =?utf-8?B?cDlncWpKaWIrZkxsVCtSci90YXpFNFpzMjdZa21Xbzk3MHZDaUVaaUZFbldm?=
 =?utf-8?B?SmE1UndtSVYzT3FyMmhiUkxmaW9yOWlDYXFxbkQ0YU5sdWhRaUkvVE4wVmFp?=
 =?utf-8?B?c25EU3krbVhSRFpFV09ScXMwS3pIMDBwWHNML2lNaUlFcEVZaFJOVnVxRDdC?=
 =?utf-8?B?SDczNnFOTk9hUithRnlFSzk0cWVHczREWWtrNFBMWERZOG5tRFlrUGVHT1hy?=
 =?utf-8?B?YmRkU3RtR0NCL2xBSXNWaGhUQ1dDOWd5WENvM1FEdHZVYko1U0R4TDdwRWFN?=
 =?utf-8?B?bUE3cExhdURLWW9odXgrKzBxV3FUM0c1M0RLWE55Q2VObEVxZWZPaWZ1Y1J4?=
 =?utf-8?B?cUdMY0h2Z1pZM1d2Q0cxYjloRnNLNUdGWU9ZRnV3ZklpN0N2MklUS1pqbmta?=
 =?utf-8?B?V0hnZU5LUEQ4SjhCcllZTEp1amZQdThUOFNaU0dIRVkwUjlQaUFnQmpJYmFv?=
 =?utf-8?B?alNnNVhIVXRpY2dmYVBrcnRmY2wvVzlqbGVsa2t4TFVsU0I3QWN3ajljSURk?=
 =?utf-8?B?WlpCQVliR25ZL1oramRNcDl2YURrWWhPcDhmcTN4UFJnUEJ5bGpkcDV4eXha?=
 =?utf-8?B?SEh6MkJydlRReHQ3a2VtUXRXcWhjQlN1OEpxaUQwUENaQTFQUTdYU0llWXps?=
 =?utf-8?B?WkZoQjVhWDZQaTVsbUwvNUk0RWNlaXBsQUtzTGpFWUJHcGNTRFlBUGR4aWxq?=
 =?utf-8?B?K2t5S1lYM2RGMHlaWFk3TE9OTG1yM3BNQ3cra1VTWFBRVWtDKzlGWGVFWXhK?=
 =?utf-8?B?T2dzOGVaa0pRdUZveXBaVkh2RldIZWhhdUpaQ0NxTEJLbm5KTWpoZFlCWnVO?=
 =?utf-8?Q?XIFYQk+TBGNJHz0qyIIfEvYQXxvy2SOGqzYCmUFTO4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3247c74b-906c-4eb4-ee0b-08d9f894e511
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:27:43.4297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZaAYgha45ta1zR8y2rl8cN32bjXDO/j+I2aG4BfGYZIO4ugllOL9t8I2VVsYCrcpUHCRSrFDE0lvKtYXcjubfuqXifWToZkGYzxL5cFSGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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

On 2022-02-25 3:02 AM, Pierre-Louis Bossart wrote:
> 
>> +static int avs_dsp_enable(struct avs_dev *adev, u32 core_mask)
>> +{
>> +	u32 mask;
>> +	int ret;
>> +
>> +	ret = avs_dsp_core_enable(adev, core_mask);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	mask = core_mask & ~AVS_MAIN_CORE_MASK;
> 
> so here BIT(MAIN_CORE) is zero in mask


What's wrong with AVS_MAIN_CORE_MASK being used explicitly?

>> +	if (!mask)
>> +		/*
>> +		 * without main core, fw is dead anyway
>> +		 * so setting D0 for it is futile.
> 
> I don't get the comment, you explicitly discarded the main core with
> your logical AND above, so this test means that all other non-main cores
> are disabled.

There is no setting D0 for MAIN_CORE as firmware is not operational 
without it. Firmware needs to be notified about D3 -> D0 transitions 
only in case of non-MAIN_COREs.


>> +		 */
>> +		return 0;
>> +
>> +	ret = avs_ipc_set_dx(adev, mask, true);
>> +	return AVS_IPC_RET(ret);
>> +}
>> +
>> +static int avs_dsp_disable(struct avs_dev *adev, u32 core_mask)
>> +{
>> +	int ret;
>> +
>> +	ret = avs_ipc_set_dx(adev, core_mask, false);
>> +	if (ret)
>> +		return AVS_IPC_RET(ret);
>> +
>> +	return avs_dsp_core_disable(adev, core_mask);
>> +}
>> +
>> +static int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
>> +{
>> +	u32 mask;
>> +	int ret;
>> +
>> +	mask = BIT_MASK(core_id);
>> +	if (mask == AVS_MAIN_CORE_MASK)
>> +		/* nothing to do for main core */
>> +		return 0;
>> +	if (core_id >= adev->hw_cfg.dsp_cores) {
>> +		ret = -EINVAL;
>> +		goto err;
>> +	}
>> +
>> +	adev->core_refs[core_id]++;
>> +	if (adev->core_refs[core_id] == 1) {
>> +		ret = avs_dsp_enable(adev, mask);
>> +		if (ret)
>> +			goto err_enable_dsp;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_enable_dsp:
>> +	adev->core_refs[core_id]--;
>> +err:
>> +	dev_err(adev->dev, "get core failed: %d\n", ret);
> 
> you should log which core could not be enabled


Good catch! Ack.

>> +	return ret;
>> +}
>> +
>> +static int avs_dsp_put_core(struct avs_dev *adev, u32 core_id)
>> +{
>> +	u32 mask;
>> +	int ret;
>> +
>> +	mask = BIT_MASK(core_id);
>> +	if (mask == AVS_MAIN_CORE_MASK)
>> +		/* nothing to do for main core */
>> +		return 0;
>> +	if (core_id >= adev->hw_cfg.dsp_cores) {
>> +		ret = -EINVAL;
>> +		goto err;
>> +	}
>> +
>> +	adev->core_refs[core_id]--;
>> +	if (!adev->core_refs[core_id]) {
>> +		ret = avs_dsp_disable(adev, mask);
>> +		if (ret)
>> +			goto err;
>> +	}
>> +
>> +	return 0;
>> +err:
>> +	dev_err(adev->dev, "put core failed: %d\n", ret);
> 
> put core %d


Ack.

>> +	return ret;
>> +}
> 
>>   MODULE_LICENSE("GPL v2");
> 
> "GPL"


Ack.
