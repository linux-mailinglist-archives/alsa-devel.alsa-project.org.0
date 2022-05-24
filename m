Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A056532CF5
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 17:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F109E16FC;
	Tue, 24 May 2022 17:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F109E16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653404892;
	bh=F4AGgx8bUE7WclJ69gqVvw3dKFe0EHLqlaU77HRWcUk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OVu0CCRLEYPtCDvuFG+cJ7CavDHWFPfj718PKLouaiOKSjMC7oiltc6HX9PI3NpIO
	 FzcWVtYWbhuKygDN8Tgbiifbd9tRU8DbTr4tBz7/1U8vz4MGaU+gzBM21G8PwOECDA
	 9wRjRf271WP+3bVJ/Q7kEb4NvpF1SSC66POdzKxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 771F6F804D6;
	Tue, 24 May 2022 17:07:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98401F804D1; Tue, 24 May 2022 17:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_72,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67FEEF80116
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 17:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67FEEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="G+llhaW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653404829; x=1684940829;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F4AGgx8bUE7WclJ69gqVvw3dKFe0EHLqlaU77HRWcUk=;
 b=G+llhaW8wjeW8+X3ny+/gSi/X8a1kkW0wx4SadiMtarW7vsXvKwgVpQa
 19jtJNeT6A2Pyr2teTDomzYd36CeE0IMxEvOITR/vtWIBH2dXkFP/AHb0
 QCS3Yo4h6SZ3Lgk5FHg6JGvPjVNV+KjDNkOIdIjE+diJwOauw5DOAIelZ
 ICz5urrvFdN+uFS87t/djBHiwmS9JEcBsZYmMLBiReF2e/+vf5UWdIWh7
 Gc4VLIDd8+pWgHqYOLiz1m8gBBNqyatQYhVSvSDRNfLU7j4iGTNuhEVII
 v736ud9Zk2KWCehZ20Ho19CQtxSdTS7+AFUEFmD/rXBqk/j+xMFGjXCPq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="334202061"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="334202061"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 08:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="703509656"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 24 May 2022 08:07:00 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 08:07:00 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 08:06:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 24 May 2022 08:06:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 24 May 2022 08:06:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H62y04SeI8U3/9XGjyj9etoeH6KX5cISBKHi8+/t0mj45cfAEbEnKDwjCjvtK07NH7S6tsZr6yOsfbaZgPzrSx2Rjb3svoWskzxv1OUAqqzm0tB3PrW4n8BhM4X9M9nfpPytA0qb4S3Ckwls6VTZaIkKlU3dX7uddQzTwUTmhniPOWXTSRZgwJUyHbWaWj0DOR0jM+9egwlFMWj7GZ80lvCtPvn/rI2nmeG92+bHpmgJWw4vcDHrokohH+QOjmltklNDkiqSDtS9hf0TGvR00DC+6oRJwm12er7MjKw7xkgLkJJ0rKWqJqKetfNo6BaFNwkjfLLJG66ApQETSBIbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNEl7/Qx4VhvzfM06OF42aPENj2LQiToQEtg9Qn5dcI=;
 b=dqcmCXpl0LJRSI/qVnmQpg09/2Zj1C9+rhrwKAEqDEpvK7RH1x6/96Ng4H7cbfMNygwa37pBPMhj1Dl22xTPAaWVHhYuK2cdPvMK+tFKGcz5ZUXsobGT8f92k7KbTqnZUzJFdL8/51WqAFhg8PFYHHMeTF9EADyRLaCaP9rFHMz0rfBXZmlpG2tKikr4p6Aibv0+nGfpd17Cnhkc3hyEEvdJRkQa8/Xq6AExLeJGIF5QWD/8gQoBh161mXLKiFXJMafuKvdZ9Aac1he9Bs/sdnUSmSZRGws+NfsMUndtd1XGq77VAKWtfMPZ7TLDYrZ2L1ZQtY/DTO+Uwx6Zkb/8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN6PR11MB0068.namprd11.prod.outlook.com (2603:10b6:405:69::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Tue, 24 May 2022 15:06:56 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5273.022; Tue, 24 May 2022
 15:06:56 +0000
Message-ID: <41033b5b-5bde-10a2-70e8-aa7482992235@intel.com>
Date: Tue, 24 May 2022 17:06:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <YozcfjgvFfQa/HxS@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YozcfjgvFfQa/HxS@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0309.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::11) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51c83e6a-3e7e-44e9-b423-08da3d970afc
X-MS-TrafficTypeDiagnostic: BN6PR11MB0068:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB0068A558789CBB8354906FC3E3D79@BN6PR11MB0068.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: We9o0SIp7dtKYtqyjQlJ2VYRHofznhMZYqiaPx4q+xFL/kir8mMQvfj5/r2HxbQku3/T768Fo5C2OMfx1lIT2dawPQ0B5LPmfED21WvKa3l+37vzRhjNAf0unLm8QPh9nZg0AFb40hGp8NuO6wPQGjPQprURHzcb5wALD89vzEXxkEvLfglZrOsVvR8IyXGWAZRysY++kORnzRbm+9o9ryaak/RW14+BUfZAA5oZrEl9IUhGd0TQzBGWd1C3PxFeM0L1SL4UGAFhAa3FR+Hd6wc0EelN+1jheEW+yhGO2VGoXF1Vgi+Y1i7xzR51y6ub1KHc7VIig0OPwrt9GYWeSwlTfXC139S9MXo0pTdLSQpzrx22NN+Ic3gG8MeaJDGrhlFBkYkAo5ZZ+kdjyqijG7fCdlq1dDtMiyd+Qh4B48eiF0NqgCcJHO+cYIQfXl1mNgIYgP6yInu8W9VCDJwkd1KPlxF6SjwFTpso5A6OCx6xaBccaAlCujE3Lf2BKq/Rbbgrhis4EIKBOM3zP8LWsJdxceNKtA74jgu9M7GpjeJ5MhXF3MduXSzI+tQqZsTpHUL/kwordkOzbPgVgoQJApuZRfiDJoISQdHGrwKcf4R755xLy4eL0n9r9VnFJB776f7iBP/3nFq0MeShx4hqP+tnMuHSj31k1xsrj97BYsi16AVy2EDqHs4zynRrHI9M3F3vsAjVKObp0rzDgSoaaq3NRkgnUHF5WYmLo2zaHnP32k5unP3iJm91JTgWh9jr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(44832011)(38100700002)(31696002)(2906002)(36756003)(82960400001)(53546011)(316002)(86362001)(508600001)(6486002)(110136005)(54906003)(3480700007)(83380400001)(31686004)(5660300002)(2616005)(186003)(6666004)(6506007)(26005)(6512007)(66476007)(66556008)(4326008)(66946007)(7116003)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVI5MUZLa1dOd0d2ODRMYUVTeHdweWV3YkVJZUlqMGFNUS9GcEszWGpQOFUx?=
 =?utf-8?B?L3cvbW1CdVVNTXhhSkE2LzgxRE5lMWRIcThYWmgyRks0Smo0MUZWWTFqRjRy?=
 =?utf-8?B?UXlML0JGeFE5TmdaSHAvTStpYlRtK1BhaVRYRnpIYmZvVHk0TGpod1gxWXJh?=
 =?utf-8?B?Q3VxSnpZblY2UWlBd0pJbkkzUGpwUzdEbzAyRWxYNUpDNlIveTRVMmRCdEJD?=
 =?utf-8?B?M1NBN2NMWFhBL1AxaDJpbnNFNG9FTUpaSGRDSjVSblFYUkJsSzFDbkxraWlu?=
 =?utf-8?B?U0s2RUZqV3NDUGkxS1RuTHhhQVduTlVwL0VJSlJTSmlUdXJUQkNSTzlYRnpz?=
 =?utf-8?B?QTdJdzJFR2ZxQjltNWp6cjN4YjdHbjNrTXBDV3dIeGV3bVBFWm9GMnF0RStj?=
 =?utf-8?B?VG9mREZpTUlsUWZVdTR5a0RVMnFTdlBtWkRlYlk4MHJYNWVoT09uMXRHTkZy?=
 =?utf-8?B?djB2OElGK2RUeUI0bmVnZ3JkSEhib1A3YU5LR1l1TlR2VExWK3JYNWNjak16?=
 =?utf-8?B?V1o5TnlMb3Z0VFBrS2FzT0diUGVvTkhpUUFRdFQ4K1laZXpqTnJFRmQzZ1NS?=
 =?utf-8?B?R2Y5aG01bUl2cE5CNlVlTFE2K2tJUEZyZEVZMnRlUm1GQ2xHMkMvbG5yRjdl?=
 =?utf-8?B?WFZJU3ExVVE2SW1ERjFlTk03Ykc2ZG0vdG1Kd05odUtIZ3M4R296VHExRmlQ?=
 =?utf-8?B?WklEWHB0UGpxSjZFVnV2UE5MbllVdmlVcnAzZDN5czdzSXBWcndNaktZbnRt?=
 =?utf-8?B?ejdMK05QZzl3a3dQNS9iOTJHakxVMVdwVmdLdGNaWlRQSDdHNGFoMm1RaDBW?=
 =?utf-8?B?Zm9YSG1RK1NMWUVieFU5RzAwenJCRExjbGRNUE56bVJIT1ZEZy9HNE5aQUcy?=
 =?utf-8?B?dXZ1NUV2YnpyUk8rdUhSNURrKzRhMndSUUNrNitpeXEwS3h0QkdiN1FXaFY5?=
 =?utf-8?B?NXQ4YThHTTVES2QvaDJRUEFON0kxTFRneE4xSys0OHU5NUFUY0JsWjE3Y3lT?=
 =?utf-8?B?SmVPcDJvN3lKTytRWUMyNjRoV1p3cmwvRDJvT1N3QjYwYWxxMEcvZ21zNjBJ?=
 =?utf-8?B?Y0Vrbm5ORkNDb1hsdTVjamMyWGJQaVVST2Jtd3l0R2hkM0J1RnNNaHh5QlRK?=
 =?utf-8?B?ODgxMmVvclorQzNtcjdjN01sVEU3U25uQUdwc25mWXhTeklBem81dDFZU0dS?=
 =?utf-8?B?eEF1MitUU3hkek83SEFYZlh5ZlRXSjBxSWhXUjc3RndvK1c4WThCRVd2R2FU?=
 =?utf-8?B?NTJ5Rk5WYnByYUhBVmhOV0NHb3hpek9zQlBBemVqNHJ5MGRQY2hublYwMXYx?=
 =?utf-8?B?SC9NZFQzYlFmNnh6TWM0VjhnZXRoVTJRSUpLZDFabnR3WVhIV0VjVzdRWkkw?=
 =?utf-8?B?OFN3MFM4VU43bmI3aUhBNlZoMHJZeXdOa2VyOEFxeG50MHVYVW8wN3p1UFI4?=
 =?utf-8?B?cGRBNWFBZ1hiaStSeWlKUnFPd3M3bWdMSlBpZzhsY283SFo3MllUZ0N5RnhF?=
 =?utf-8?B?UmFRMG4rUVovaThmSkhTYXFlUlNURnZxdzgybW0wMjEwTVQ0a3B6UmJiSHZZ?=
 =?utf-8?B?NG1Fb3pvNFNpYVRiNTZoajlNdWhGNmwwMDNkUWV6UHhBc2ZQZVFUZEVrcGJ0?=
 =?utf-8?B?Y2twQ2E1WnRNclpXS1h2R2pjKzNsTjVSNEllWkJUVUJhS3g2NC9jdU14dHg5?=
 =?utf-8?B?Q2dwNUNpYnkrU2o5WUIvRVBxaVF4RFBNRFlRWGNyOEV3Q09EMEc5NFFXUlps?=
 =?utf-8?B?NWFTWVpLNDZ4UjY0MnN2NU1BbVFGU0wzSDhrZUMrZWI3TVVwcnhwNkRwWlVI?=
 =?utf-8?B?UVFadXhadER4cHdrVSs2N0N6NVdLYVFWYU44UFhuOUxKYWJzMkpodTNZVGRt?=
 =?utf-8?B?NW9GT1RMRDFmbzBkbGFkWkVpbUhkT2dDQjdpd1FkbUJCeklRZHVTMTV1T0cx?=
 =?utf-8?B?SnBmamlUMVdZOGphS0JVNU0yTm9VTUZXYXRscHZOaXhMT014enlRMytuL0ky?=
 =?utf-8?B?MkJRV1Q0VDl0UEdGdktvZWE3QlJGVjFLL0s4dXFFZjYwRnhBNW9NdHlIQzRS?=
 =?utf-8?B?U3hlSXR1L2RZZDFFNVRzQnBpZ2VZNGJZVklRTDBZTjVBcXJwcm9ZUnhZL0FW?=
 =?utf-8?B?SzdGTGVyNDVWZDNXQzBPQzBROEFWREFoOWQ1TFQwZENVMXdQVlFpa29tV2RR?=
 =?utf-8?B?NVIzRjloanR4c1N5bllUSTc0c2srUERtTENxb2VxK0Jwa1hjTytLT0Uwdk9J?=
 =?utf-8?B?dUJrYjN5ZEhSbWZYcjgybXNwNFlQdFZicWZNbnhRcVFJSmJMbGxkaXhWa0dZ?=
 =?utf-8?B?Rm1VQkVueGVjbjJVejZQS1lSbitscFRHbjBBODVDYTJ5QXZHTFNMWk96My9r?=
 =?utf-8?Q?NLMLk/PZONpQVHLI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c83e6a-3e7e-44e9-b423-08da3d970afc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:06:56.0973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnEVeKutXzM/8RLNbDd4FVmxX0gtZMR8fh5Mb8gE1ATIoTttG/KxrhVJo1YSFWiNxpUlLfoHo7Z+qPqZfkH+fstTykEFmv1bT4gXccWj4T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0068
X-OriginatorOrg: intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2022-05-24 3:24 PM, Mark Brown wrote:
> On Tue, May 24, 2022 at 04:40:24AM +0000, Kuninori Morimoto wrote:
> 
>> I have very interesting to clean up ASoC.
>> I think it is still very complex, thus, non flexible.
>> I'm thinking that we want to cleanup...
>>
>> 	- Component with multi Card connection
> 
> I'm really not certain that we want components in multiple cards at all,
> I know the Intel AVS people wanted this but I'm concerned that if a
> single component is in multiple cards we'll inevitably have connections
> between the cards which each needs to take into consideration, that
> could be routing or something else like clock configuration.

Hello,

It seems explanation of design of the avs-driver had some shortcomings. 
The AVS people (like me) are to blame for this :S

The exact opposite is true - we do not want 1:N component:card relation. 
Separate set of components and a separate card (machine board) per 
logically separate audio device is the approach of choice here. It has 
its benefits of simplifying PM and allowing for better user experience - 
probe() failure of one device does not prevent other devices from 
enumerating.


Regards,
Czarek
